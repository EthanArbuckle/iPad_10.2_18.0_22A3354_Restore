void sub_1CB5A5968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,void *a42,uint64_t a43,int a44,__int16 a45,char a46,char a47,void *a48,uint64_t a49,int a50,__int16 a51,char a52,char a53)
{
  uint64_t v53;
  uint64_t v54;

  if (a15 < 0)
    operator delete(__p);
  if (a29 < 0)
    operator delete(a24);
  if (a35 < 0)
    operator delete(a30);
  if (a41 < 0)
    operator delete(a36);
  MEMORY[0x1D179D2EC](v53, 0x10F3C40E8AC7C50);
  if (a47 < 0)
    operator delete(a42);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::DaGrammarSynthesizer::getCount(unsigned __int16 *a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t *v9;
  morphun::grammar::synthesis::GrammemeConstants *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t i;
  std::basic_string<char16_t> v17;
  int v18;
  std::basic_string<char16_t> v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((v2 & 1) == 0
  {
    v11 = (morphun::grammar::synthesis::GrammemeConstants *)operator new();
    v12 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_SINGULAR(v11);
    if (*(char *)(v12 + 23) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(&v17, *(const std::basic_string<char16_t>::value_type **)v12, *(_QWORD *)(v12 + 8));
    }
    else
    {
      v13 = *(_OWORD *)v12;
      v17.__r_.__value_.__r.__words[2] = *(_QWORD *)(v12 + 16);
      *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v13;
    }
    v18 = 1;
    v14 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL((morphun::grammar::synthesis::GrammemeConstants *)v12);
    if (*(char *)(v14 + 23) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(&v19, *(const std::basic_string<char16_t>::value_type **)v14, *(_QWORD *)(v14 + 8));
    }
    else
    {
      v15 = *(_OWORD *)v14;
      v19.__r_.__value_.__r.__words[2] = *(_QWORD *)(v14 + 16);
      *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v15;
    }
    v20 = 2;
    std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::DaGrammarSynthesizer::Count>::map[abi:ne180100]((uint64_t **)v11, (__int128 *)&v17, 2);
    for (i = 0; i != -8; i -= 4)
    {
      if (SHIBYTE(v19.__r_.__value_.__r.__words[i + 2]) < 0)
        operator delete(*(void **)((char *)&v19.__r_.__value_.__l.__data_ + i * 8));
    }
    morphun::grammar::synthesis::DaGrammarSynthesizer::getCount(std::basic_string<char16_t> const*)::valueMap = (uint64_t)v11;
  }
  if (!a1)
    return 0;
  v3 = morphun::grammar::synthesis::DaGrammarSynthesizer::getCount(std::basic_string<char16_t> const*)::valueMap;
  npc<std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::DaGrammarSynthesizer::Count>>(morphun::grammar::synthesis::DaGrammarSynthesizer::getCount(std::basic_string<char16_t> const*)::valueMap);
  v6 = *(_QWORD *)(v3 + 8);
  v4 = v3 + 8;
  v5 = v6;
  if (!v6)
    goto LABEL_10;
  v7 = v4;
  do
  {
    v8 = std::less<std::basic_string<char16_t>>::operator()[abi:ne180100]((unsigned __int16 *)(v5 + 32), a1);
    v9 = (uint64_t *)(v5 + 8);
    if (!v8)
    {
      v9 = (uint64_t *)v5;
      v7 = v5;
    }
    v5 = *v9;
  }
  while (*v9);
  if (v7 == v4 || std::less<std::basic_string<char16_t>>::operator()[abi:ne180100](a1, (unsigned __int16 *)(v7 + 32)))
LABEL_10:
    v7 = v4;
  if (npc<std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::DaGrammarSynthesizer::Count>>(morphun::grammar::synthesis::DaGrammarSynthesizer::getCount(std::basic_string<char16_t> const*)::valueMap)
     + 8 == v7)
    return 0;
  else
    return *(unsigned int *)(v7 + 56);
}

void sub_1CB5A61B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;

  if (a14 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v14, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t **std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::DaGrammarSynthesizer::Count>::map[abi:ne180100](uint64_t **a1, __int128 *a2, uint64_t a3)
{
  uint64_t *v4;
  __int128 *v5;
  __int128 *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  BOOL v11;
  char **v12;
  char **v13;
  char *v14;
  unsigned __int16 *v15;
  char *v16;
  std::basic_string<char16_t> *v17;
  __int128 v18;
  uint64_t *v19;

  a1[1] = 0;
  v4 = (uint64_t *)(a1 + 1);
  a1[2] = 0;
  *a1 = (uint64_t *)(a1 + 1);
  if (a3)
  {
    v5 = a2;
    v6 = &a2[2 * a3];
    while (1)
    {
      v7 = a1[1];
      v8 = v4;
      if (*a1 != v4)
      {
        v9 = a1[1];
        v10 = v4;
        if (v7)
        {
          do
          {
            v8 = v9;
            v9 = (uint64_t *)v9[1];
          }
          while (v9);
        }
        else
        {
          do
          {
            v8 = (uint64_t *)v10[2];
            v11 = *v8 == (_QWORD)v10;
            v10 = v8;
          }
          while (v11);
        }
        if (!std::less<std::basic_string<char16_t>>::operator()[abi:ne180100]((unsigned __int16 *)v8 + 16, (unsigned __int16 *)v5))break;
      }
      v12 = (char **)v4;
      v13 = (char **)v4;
      if (!v7)
        goto LABEL_19;
      v13 = (char **)(v8 + 1);
      if (!v8[1])
      {
        v12 = (char **)v8;
LABEL_19:
        v16 = (char *)operator new(0x40uLL);
        v17 = (std::basic_string<char16_t> *)(v16 + 32);
        if (*((char *)v5 + 23) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external(v17, *(const std::basic_string<char16_t>::value_type **)v5, *((_QWORD *)v5 + 1));
        }
        else
        {
          v18 = *v5;
          *((_QWORD *)v16 + 6) = *((_QWORD *)v5 + 2);
          *(_OWORD *)&v17->__r_.__value_.__l.__data_ = v18;
        }
        *((_DWORD *)v16 + 14) = *((_DWORD *)v5 + 6);
        *(_QWORD *)v16 = 0;
        *((_QWORD *)v16 + 1) = 0;
        *((_QWORD *)v16 + 2) = v12;
        *v13 = v16;
        v19 = (uint64_t *)**a1;
        if (v19)
        {
          *a1 = v19;
          v16 = *v13;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], (uint64_t *)v16);
        a1[2] = (uint64_t *)((char *)a1[2] + 1);
      }
LABEL_25:
      v5 += 2;
      if (v5 == v6)
        return a1;
    }
    v12 = (char **)v4;
    v13 = (char **)v4;
    if (v7)
    {
      v14 = (char *)v7;
      while (1)
      {
        while (1)
        {
          v12 = (char **)v14;
          v15 = (unsigned __int16 *)(v14 + 32);
          if (!std::less<std::basic_string<char16_t>>::operator()[abi:ne180100]((unsigned __int16 *)v5, (unsigned __int16 *)v14 + 16))break;
          v14 = *v12;
          v13 = v12;
          if (!*v12)
            goto LABEL_19;
        }
        if (!std::less<std::basic_string<char16_t>>::operator()[abi:ne180100](v15, (unsigned __int16 *)v5))
          goto LABEL_25;
        v13 = v12 + 1;
        v14 = v12[1];
        if (!v14)
          goto LABEL_19;
      }
    }
    goto LABEL_19;
  }
  return a1;
}

void sub_1CB5A63D8(_Unwind_Exception *a1)
{
  void *v1;
  char **v2;

  operator delete(v1);
  std::__tree<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>>>::destroy(*v2);
  _Unwind_Resume(a1);
}

uint64_t npc<std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::DaGrammarSynthesizer::Count>>(uint64_t result)
{
  morphun::exception::NullPointerException *exception;

  if (!result)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  return result;
}

void sub_1CB5A6444(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::DaGrammarSynthesizer::getGender(unsigned __int16 *a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t *v9;
  morphun::grammar::synthesis::GrammemeConstants *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t i;
  std::basic_string<char16_t> v17;
  int v18;
  std::basic_string<char16_t> v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((v2 & 1) == 0
  {
    v11 = (morphun::grammar::synthesis::GrammemeConstants *)operator new();
    v12 = morphun::grammar::synthesis::GrammemeConstants::GENDER_COMMON(v11);
    if (*(char *)(v12 + 23) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(&v17, *(const std::basic_string<char16_t>::value_type **)v12, *(_QWORD *)(v12 + 8));
    }
    else
    {
      v13 = *(_OWORD *)v12;
      v17.__r_.__value_.__r.__words[2] = *(_QWORD *)(v12 + 16);
      *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v13;
    }
    v18 = 1;
    v14 = morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v12);
    if (*(char *)(v14 + 23) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(&v19, *(const std::basic_string<char16_t>::value_type **)v14, *(_QWORD *)(v14 + 8));
    }
    else
    {
      v15 = *(_OWORD *)v14;
      v19.__r_.__value_.__r.__words[2] = *(_QWORD *)(v14 + 16);
      *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v15;
    }
    v20 = 2;
    std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::DaGrammarSynthesizer::Gender>::map[abi:ne180100]((uint64_t **)v11, (__int128 *)&v17, 2);
    for (i = 0; i != -8; i -= 4)
    {
      if (SHIBYTE(v19.__r_.__value_.__r.__words[i + 2]) < 0)
        operator delete(*(void **)((char *)&v19.__r_.__value_.__l.__data_ + i * 8));
    }
    morphun::grammar::synthesis::DaGrammarSynthesizer::getGender(std::basic_string<char16_t> const*)::valueMap = (uint64_t)v11;
  }
  if (!a1)
    return 0;
  v3 = morphun::grammar::synthesis::DaGrammarSynthesizer::getGender(std::basic_string<char16_t> const*)::valueMap;
  npc<std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::DaGrammarSynthesizer::Gender>>(morphun::grammar::synthesis::DaGrammarSynthesizer::getGender(std::basic_string<char16_t> const*)::valueMap);
  v6 = *(_QWORD *)(v3 + 8);
  v4 = v3 + 8;
  v5 = v6;
  if (!v6)
    goto LABEL_10;
  v7 = v4;
  do
  {
    v8 = std::less<std::basic_string<char16_t>>::operator()[abi:ne180100]((unsigned __int16 *)(v5 + 32), a1);
    v9 = (uint64_t *)(v5 + 8);
    if (!v8)
    {
      v9 = (uint64_t *)v5;
      v7 = v5;
    }
    v5 = *v9;
  }
  while (*v9);
  if (v7 == v4 || std::less<std::basic_string<char16_t>>::operator()[abi:ne180100](a1, (unsigned __int16 *)(v7 + 32)))
LABEL_10:
    v7 = v4;
  if (npc<std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::DaGrammarSynthesizer::Gender>>(morphun::grammar::synthesis::DaGrammarSynthesizer::getGender(std::basic_string<char16_t> const*)::valueMap)
     + 8 == v7)
    return 0;
  else
    return *(unsigned int *)(v7 + 56);
}

void sub_1CB5A6634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;

  if (a14 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v14, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t **std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::DaGrammarSynthesizer::Gender>::map[abi:ne180100](uint64_t **a1, __int128 *a2, uint64_t a3)
{
  uint64_t *v4;
  __int128 *v5;
  __int128 *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  BOOL v11;
  char **v12;
  char **v13;
  char *v14;
  unsigned __int16 *v15;
  char *v16;
  std::basic_string<char16_t> *v17;
  __int128 v18;
  uint64_t *v19;

  a1[1] = 0;
  v4 = (uint64_t *)(a1 + 1);
  a1[2] = 0;
  *a1 = (uint64_t *)(a1 + 1);
  if (a3)
  {
    v5 = a2;
    v6 = &a2[2 * a3];
    while (1)
    {
      v7 = a1[1];
      v8 = v4;
      if (*a1 != v4)
      {
        v9 = a1[1];
        v10 = v4;
        if (v7)
        {
          do
          {
            v8 = v9;
            v9 = (uint64_t *)v9[1];
          }
          while (v9);
        }
        else
        {
          do
          {
            v8 = (uint64_t *)v10[2];
            v11 = *v8 == (_QWORD)v10;
            v10 = v8;
          }
          while (v11);
        }
        if (!std::less<std::basic_string<char16_t>>::operator()[abi:ne180100]((unsigned __int16 *)v8 + 16, (unsigned __int16 *)v5))break;
      }
      v12 = (char **)v4;
      v13 = (char **)v4;
      if (!v7)
        goto LABEL_19;
      v13 = (char **)(v8 + 1);
      if (!v8[1])
      {
        v12 = (char **)v8;
LABEL_19:
        v16 = (char *)operator new(0x40uLL);
        v17 = (std::basic_string<char16_t> *)(v16 + 32);
        if (*((char *)v5 + 23) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external(v17, *(const std::basic_string<char16_t>::value_type **)v5, *((_QWORD *)v5 + 1));
        }
        else
        {
          v18 = *v5;
          *((_QWORD *)v16 + 6) = *((_QWORD *)v5 + 2);
          *(_OWORD *)&v17->__r_.__value_.__l.__data_ = v18;
        }
        *((_DWORD *)v16 + 14) = *((_DWORD *)v5 + 6);
        *(_QWORD *)v16 = 0;
        *((_QWORD *)v16 + 1) = 0;
        *((_QWORD *)v16 + 2) = v12;
        *v13 = v16;
        v19 = (uint64_t *)**a1;
        if (v19)
        {
          *a1 = v19;
          v16 = *v13;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], (uint64_t *)v16);
        a1[2] = (uint64_t *)((char *)a1[2] + 1);
      }
LABEL_25:
      v5 += 2;
      if (v5 == v6)
        return a1;
    }
    v12 = (char **)v4;
    v13 = (char **)v4;
    if (v7)
    {
      v14 = (char *)v7;
      while (1)
      {
        while (1)
        {
          v12 = (char **)v14;
          v15 = (unsigned __int16 *)(v14 + 32);
          if (!std::less<std::basic_string<char16_t>>::operator()[abi:ne180100]((unsigned __int16 *)v5, (unsigned __int16 *)v14 + 16))break;
          v14 = *v12;
          v13 = v12;
          if (!*v12)
            goto LABEL_19;
        }
        if (!std::less<std::basic_string<char16_t>>::operator()[abi:ne180100](v15, (unsigned __int16 *)v5))
          goto LABEL_25;
        v13 = v12 + 1;
        v14 = v12[1];
        if (!v14)
          goto LABEL_19;
      }
    }
    goto LABEL_19;
  }
  return a1;
}

void sub_1CB5A6858(_Unwind_Exception *a1)
{
  void *v1;
  char **v2;

  operator delete(v1);
  std::__tree<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>>>::destroy(*v2);
  _Unwind_Resume(a1);
}

uint64_t npc<std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::DaGrammarSynthesizer::Gender>>(uint64_t result)
{
  morphun::exception::NullPointerException *exception;

  if (!result)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  return result;
}

void sub_1CB5A68C4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void morphun::analysis::filter::LowerCaseFilter::~LowerCaseFilter(void **this)
{
  morphun::analysis::TokenFilter::~TokenFilter((morphun::analysis::TokenFilter *)this, (uint64_t *)&off_1E86696B8);
}

{
  morphun::analysis::TokenFilter::~TokenFilter((morphun::analysis::TokenFilter *)this, (uint64_t *)&off_1E86696B8);
  JUMPOUT(0x1D179D2ECLL);
}

void sub_1CB5A69A0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void morphun::tokenizer::SemiticTokenExtractorIterator::~SemiticTokenExtractorIterator(morphun::tokenizer::SemiticTokenExtractorIterator *this)
{
  void *v2;

  *(_QWORD *)this = &off_1E8673578;
  v2 = (void *)*((_QWORD *)this + 7);
  if (v2)
  {
    *((_QWORD *)this + 8) = v2;
    operator delete(v2);
  }
  morphun::tokenizer::ICUTokenExtractorIterator::~ICUTokenExtractorIterator((morphun::tokenizer::SemiticTokenExtractorIterator *)((char *)this + 16));
}

{
  morphun::tokenizer::SemiticTokenExtractorIterator::~SemiticTokenExtractorIterator(this);
  JUMPOUT(0x1D179D2ECLL);
}

uint64_t morphun::tokenizer::SemiticTokenExtractorIterator::getNextBoundary(morphun::tokenizer::SemiticTokenExtractorIterator *this)
{
  uint64_t v2;
  char **v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  _DWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  int v19;
  uint64_t v20;

  v3 = (char **)((char *)this + 56);
  v2 = *((_QWORD *)this + 7);
  v4 = *((int *)this + 20);
  if ((int)v4 < (int)((unint64_t)(*((_QWORD *)this + 8) - v2) >> 2))
  {
    *((_DWORD *)this + 20) = v4 + 1;
    v5 = *(unsigned int *)(v2 + 4 * v4);
LABEL_25:
    *((_DWORD *)this + 21) = v5;
    return v5;
  }
  *((_QWORD *)this + 8) = v2;
  *((_DWORD *)this + 20) = 0;
  v6 = ubrk_next();
  v5 = v6;
  if ((_DWORD)v6 != -1)
  {
    v7 = *((_DWORD *)this + 21);
    if ((int)v6 - v7 >= 2)
    {
      morphun::tokenizer::SemiticWordAndDelimiterTokenExtractor::decompoundWord(*((_QWORD **)this + 1), v3, *((_QWORD *)this + 5), *((_QWORD *)this + 6), v7, v6);
      v8 = (char *)*((_QWORD *)this + 7);
      v9 = (char *)*((_QWORD *)this + 8);
      v10 = v9 - v8;
      if ((unint64_t)(v9 - v8) >= 5)
      {
        if (*((_DWORD *)v9 - 1) != (_DWORD)v5)
        {
          v11 = *((_QWORD *)this + 9);
          if ((unint64_t)v9 >= v11)
          {
            v13 = v10 >> 2;
            v14 = (v10 >> 2) + 1;
            if (v14 >> 62)
              std::vector<std::pair<morphun::dialog::DefaultArticleLookupFunction const*,std::vector<std::pair<std::basic_string<char16_t>,std::vector<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>> const>>::__throw_length_error[abi:ne180100]();
            v15 = v11 - (_QWORD)v8;
            if (v15 >> 1 > v14)
              v14 = v15 >> 1;
            if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL)
              v14 = 0x3FFFFFFFFFFFFFFFLL;
            if (v14)
            {
              v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v14);
              v8 = (char *)*((_QWORD *)this + 7);
              v9 = (char *)*((_QWORD *)this + 8);
            }
            else
            {
              v16 = 0;
            }
            v17 = (char *)(v14 + 4 * v13);
            v18 = v14 + 4 * v16;
            *(_DWORD *)v17 = v5;
            v12 = v17 + 4;
            while (v9 != v8)
            {
              v19 = *((_DWORD *)v9 - 1);
              v9 -= 4;
              *((_DWORD *)v17 - 1) = v19;
              v17 -= 4;
            }
            *((_QWORD *)this + 7) = v17;
            *((_QWORD *)this + 8) = v12;
            *((_QWORD *)this + 9) = v18;
            if (v8)
            {
              operator delete(v8);
              v8 = *v3;
            }
            else
            {
              v8 = v17;
            }
          }
          else
          {
            *(_DWORD *)v9 = v5;
            v12 = v9 + 4;
          }
          *((_QWORD *)this + 8) = v12;
        }
        v20 = *((int *)this + 20);
        *((_DWORD *)this + 20) = v20 + 1;
        v5 = *(unsigned int *)&v8[4 * v20];
      }
    }
    goto LABEL_25;
  }
  return v5;
}

uint64_t morphun::tokenizer::SemiticTokenExtractorIterator::reset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  *(_QWORD *)(a1 + 40) = a2;
  *(_QWORD *)(a1 + 48) = a3;
  *(_DWORD *)(a1 + 84) = 0;
  result = morphun::tokenizer::ICUTokenExtractorIterator::reset();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 56);
  *(_DWORD *)(a1 + 80) = 0;
  return result;
}

uint64_t **com::apple::siri::tokenizer::data::config_zh_CN::getContent@<X0>(uint64_t **a1@<X8>)
{
  __int128 v3;
  const __int16 *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = xmmword_1E8686980;
  v4 = L"zh_Hans";
  return std::map<std::u16string_view,char16_t const*>::map[abi:ne180100](a1, (unsigned __int16 **)&v3, 1);
}

uint64_t mdaf_getAnalyzer(uint64_t a1, const __CFLocale *a2)
{
  uint64_t v3;
  morphun::exception::NullPointerException *exception;
  void *v6[16];

  if (!a1)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  morphun::util::CFUtils::convert((morphun::util::CFUtils *)v6, a2);
  v3 = (*(uint64_t (**)(uint64_t, void **))(*(_QWORD *)a1 + 24))(a1, v6);
  return v3;
}

void sub_1CB5A6CC8(_Unwind_Exception *exception_object, int a2)
{
  const std::exception *v2;
  const void **v3;
  __CFError **v4;

  if (a2 == 1)
  {
    v3 = (const void **)__cxa_begin_catch(exception_object);
    morphun::util::CFUtils::convert(v3, v2, v4);
    __cxa_end_catch();
    JUMPOUT(0x1CB5A6C84);
  }
  _Unwind_Resume(exception_object);
}

uint64_t mdaf_getDefaultInstance(morphun::analysis::DefaultAnalyzerFactory *a1)
{
  return morphun::analysis::DefaultAnalyzerFactory::getDefaultInstance(a1);
}

morphun::analysis::DefaultAnalyzerFactory *mdaf_create(morphun::util::StringUtils *a1)
{
  morphun::analysis::DefaultAnalyzerFactory *v2;

  v2 = (morphun::analysis::DefaultAnalyzerFactory *)operator new();
  morphun::analysis::DefaultAnalyzerFactory::DefaultAnalyzerFactory(v2, a1);
  return v2;
}

void sub_1CB5A6DE8(_Unwind_Exception *a1, int a2)
{
  const std::exception *v2;
  uint64_t v3;
  uint64_t v5;
  const void **v7;
  __CFError **v8;

  v5 = v3;
  MEMORY[0x1D179D2EC](v5, 0x10F3C40F4CE41AFLL);
  if (a2 == 1)
  {
    v7 = (const void **)__cxa_begin_catch(a1);
    morphun::util::CFUtils::convert(v7, v2, v8);
    __cxa_end_catch();
    JUMPOUT(0x1CB5A6DD4);
  }
  _Unwind_Resume(a1);
}

uint64_t mdaf_destroy(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

void morphun::dialog::DictionaryLookupInflector::~DictionaryLookupInflector(morphun::dialog::DictionaryLookupInflector *this)
{
}

{
  JUMPOUT(0x1D179D2ECLL);
}

void morphun::dialog::DictionaryLookupInflector::~DictionaryLookupInflector(morphun::dialog::DictionaryLookupInflector *this, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void **v8;

  v4 = a2[1];
  *(_QWORD *)this = v4;
  *(_QWORD *)((char *)this + *(_QWORD *)(v4 - 40)) = a2[4];
  v5 = (void *)*((_QWORD *)this + 25);
  if (v5)
  {
    *((_QWORD *)this + 26) = v5;
    operator delete(v5);
  }
  v8 = (void **)((char *)this + 176);
  std::vector<std::vector<std::u16string_view>>::__destroy_vector::operator()[abi:ne180100](&v8);
  v6 = (void *)*((_QWORD *)this + 19);
  if (v6)
  {
    *((_QWORD *)this + 20) = v6;
    operator delete(v6);
  }
  v7 = a2[2];
  *(_QWORD *)this = v7;
  *(_QWORD *)((char *)this + *(_QWORD *)(v7 - 40)) = a2[3];
}

uint64_t *morphun::dialog::DictionaryLookupInflector::DictionaryLookupInflector(uint64_t *a1, morphun::dictionary::DictionaryMetaData *a2, uint64_t a3, uint64_t **a4, char a5)
{
  uint64_t *result;
  uint64_t v7[3];

  v7[0] = 0;
  v7[1] = 0;
  *a1 = (uint64_t)&off_1E866A910;
  v7[2] = 0;
  result = morphun::analysis::MorphologicalAnalyzer::MorphologicalAnalyzer(a1, (uint64_t *)&off_1E86674C8, a2, v7, a3, a4);
  *result = (uint64_t)&off_1E866B420;
  *((_BYTE *)result + 224) = a5;
  return result;
}

void morphun::dialog::DictionaryLookupInflector::inflectWord(uint64_t a1, uint64_t a2, const void *a3, unint64_t a4, std::basic_string<char16_t> *a5, std::basic_string<char16_t> *a6)
{
  const void **v10;
  uint64_t v11;
  uint64_t v12;
  std::basic_string<char16_t>::size_type v13;
  std::basic_string<char16_t>::size_type v14;
  void *v15;
  _BYTE *v16;
  std::basic_string<char16_t>::size_type v17;
  std::basic_string<char16_t>::size_type size;
  __int128 v19;
  uint64_t BinaryProperties;
  uint64_t v21;
  char *v22;
  uint64_t *v23;
  char *v24;
  int64_t v25;
  unint64_t v26;
  uint64_t v27;
  BOOL v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  _BYTE *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t *v36;
  unint64_t *v37;
  _BYTE *v38;
  std::basic_string<char16_t> *p_dst;
  std::basic_string<char16_t> *v40;
  uint64_t v41;
  unint64_t v42;
  int64_t v43;
  unint64_t v44;
  void *v45;
  uint64_t v46;
  unint64_t *v47;
  unint64_t *v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  std::basic_string<char16_t> *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t *v59;
  unint64_t v60;
  _QWORD *v61;
  char *v62;
  int v63;
  int *v64;
  uint64_t v65;
  std::basic_string<char16_t> *v66;
  std::basic_string<char16_t>::size_type v67;
  std::basic_string<char16_t> *v68;
  std::basic_string<char16_t>::size_type v69;
  int v70;
  void *v71;
  std::basic_string<char16_t> *v72;
  std::basic_string<char16_t>::size_type v73;
  unint64_t v74;
  morphun::dictionary::DictionaryMetaData_MMappedDictionary *v75;
  std::basic_string<char16_t> *v76;
  std::basic_string<char16_t>::size_type v77;
  int v78;
  void *v79;
  std::basic_string<char16_t> *v80;
  std::basic_string<char16_t>::size_type v81;
  std::basic_string<char16_t> *v82;
  uint64_t v83;
  char *v84;
  uint64_t *v85;
  std::basic_string<char16_t> *v86;
  uint64_t v87;
  int v88;
  void *v89;
  std::basic_string<char16_t> *v90;
  std::basic_string<char16_t>::size_type v91;
  unint64_t v92;
  morphun::dictionary::DictionaryMetaData_MMappedDictionary *v93;
  void **v94;
  std::basic_string<char16_t>::size_type v95;
  void **v96;
  std::basic_string<char16_t>::size_type v97;
  std::basic_string<char16_t> *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  _WORD *v103;
  uint64_t v104;
  uint64_t v105;
  std::basic_string<char16_t> *v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t *v109;
  unint64_t *v110;
  uint64_t __len;
  unint64_t *v114;
  void *__src;
  void *v116[2];
  unsigned __int8 v117;
  std::basic_string<char16_t> v118;
  void *v119[2];
  unsigned __int8 v120;
  _QWORD v121[3];
  void *__p;
  char *v123;
  unint64_t v124;
  void *v125;
  _BYTE *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  uint64_t v130;
  int v131[2];
  std::basic_string<char16_t> v132;
  std::basic_string<char16_t> v133;
  std::basic_string<char16_t> v134;
  std::basic_string<char16_t> v135;
  std::basic_string<char16_t> v136;
  std::basic_string<char16_t> v137;
  std::basic_string<char16_t> v138;
  std::basic_string<char16_t> v139;
  std::basic_string<char16_t> v140;
  std::basic_string<char16_t> __dst;
  std::basic_string<char16_t> v142;
  std::basic_string<char16_t> v143;
  __int128 v144;

  *(_QWORD *)&v144 = *MEMORY[0x1E0C80C00];
  if (morphun::util::gLogLevel <= 0)
  {
    v10 = (const void **)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v142, (char *)L"DictionaryLookupInflector::inflectWord");
    if (SHIBYTE(v142.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v142.__r_.__value_.__l.__data_);
  }
  v12 = *(_QWORD *)(a2 + 8);
  v11 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)v131 = 0;
  if (!morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(v12, (uint64_t)v131, (const UChar *)a3, a4))
  {
    if (morphun::util::gLogLevel > 0)
    {
LABEL_80:
      *(_BYTE *)a1 = 0;
      *(_BYTE *)(a1 + 24) = 0;
      return;
    }
    if (a4 > 0x7FFFFFFFFFFFFFF7)
      std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
    if (a4 >= 0xB)
    {
      v53 = (a4 & 0xFFFFFFFFFFFFFFFCLL) + 4;
      if ((a4 | 3) != 0xB)
        v53 = a4 | 3;
      p_dst = (std::basic_string<char16_t> *)std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v53 + 1);
      __dst.__r_.__value_.__l.__size_ = a4;
      __dst.__r_.__value_.__r.__words[2] = v54 | 0x8000000000000000;
      __dst.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)p_dst;
    }
    else
    {
      *((_BYTE *)&__dst.__r_.__value_.__s + 23) = a4;
      p_dst = &__dst;
      if (!a4)
        goto LABEL_69;
    }
    memmove(p_dst, a3, 2 * a4);
LABEL_69:
    p_dst->__r_.__value_.__s.__data_[a4] = 0;
    std::basic_string<char16_t>::insert(&__dst, (std::basic_string<char16_t>::size_type)"\t", (const std::basic_string<char16_t>::value_type *)1, v13);
    v143 = __dst;
    memset(&__dst, 0, sizeof(__dst));
    std::basic_string<char16_t>::append(&v143, (const std::basic_string<char16_t>::value_type *)":", 0x28uLL);
    v142 = v143;
    memset(&v143, 0, sizeof(v143));
    if (morphun::util::gLogLevel <= 0)
    {
      if ((v142.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v55 = &v142;
      else
        v55 = (std::basic_string<char16_t> *)v142.__r_.__value_.__r.__words[0];
      morphun::util::logToTopOfStackLogger(0, 0, (uint64_t)v55);
    }
    if (SHIBYTE(v142.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v142.__r_.__value_.__l.__data_);
    if (SHIBYTE(v143.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v143.__r_.__value_.__l.__data_);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__dst.__r_.__value_.__l.__data_);
    goto LABEL_80;
  }
  v128 = 0;
  v129 = 0;
  v130 = 0;
  morphun::dictionary::Inflector::getInflectionPatternsForWord(v11, (uint64_t)a3, a4, &v128);
  v15 = v128;
  if (v128 == v129)
  {
    if (morphun::util::gLogLevel > 0)
      goto LABEL_247;
    if (a4 > 0x7FFFFFFFFFFFFFF7)
      std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
    if (a4 >= 0xB)
    {
      v104 = (a4 & 0xFFFFFFFFFFFFFFFCLL) + 4;
      if ((a4 | 3) != 0xB)
        v104 = a4 | 3;
      v40 = (std::basic_string<char16_t> *)std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v104 + 1);
      __dst.__r_.__value_.__l.__size_ = a4;
      __dst.__r_.__value_.__r.__words[2] = v105 | 0x8000000000000000;
      __dst.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)v40;
    }
    else
    {
      *((_BYTE *)&__dst.__r_.__value_.__s + 23) = a4;
      v40 = &__dst;
      if (!a4)
        goto LABEL_236;
    }
    memmove(v40, a3, 2 * a4);
LABEL_236:
    v40->__r_.__value_.__s.__data_[a4] = 0;
    std::basic_string<char16_t>::insert(&__dst, (std::basic_string<char16_t>::size_type)"\t", (const std::basic_string<char16_t>::value_type *)1, v14);
    v143 = __dst;
    memset(&__dst, 0, sizeof(__dst));
    std::basic_string<char16_t>::append(&v143, L": no inflection patterns found\n", 0x1FuLL);
    v142 = v143;
    memset(&v143, 0, sizeof(v143));
    if (morphun::util::gLogLevel <= 0)
    {
      if ((v142.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v106 = &v142;
      else
        v106 = (std::basic_string<char16_t> *)v142.__r_.__value_.__r.__words[0];
      morphun::util::logToTopOfStackLogger(0, 0, (uint64_t)v106);
    }
    if (SHIBYTE(v142.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v142.__r_.__value_.__l.__data_);
    if (SHIBYTE(v143.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v143.__r_.__value_.__l.__data_);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__dst.__r_.__value_.__l.__data_);
LABEL_247:
    *(_BYTE *)a1 = 0;
    *(_BYTE *)(a1 + 24) = 0;
    if (v15)
      goto LABEL_230;
    return;
  }
  v125 = 0;
  v126 = 0;
  v127 = 0;
  morphun::analysis::DictionaryExposableMorphology::getInflectionGrammemes((uint64_t)a3, a4, *(uint64_t *)v131, (uint64_t)v128, (uint64_t)v129, &v125);
  v16 = v125;
  if (v125 == v126)
  {
    *(_BYTE *)a1 = 0;
    *(_BYTE *)(a1 + 24) = 0;
    if (v16)
      goto LABEL_228;
    goto LABEL_229;
  }
  (*(void (**)(uint64_t, void **))(*(_QWORD *)a2 + 24))(a2, &v125);
  __src = (void *)a3;
  __p = 0;
  v123 = 0;
  v124 = 0;
  std::vector<long long>::reserve(&__p, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a6->__r_.__value_.__l.__size_ - a6->__r_.__value_.__r.__words[0]) >> 3));
  v17 = a6->__r_.__value_.__r.__words[0];
  size = a6->__r_.__value_.__l.__size_;
  if (a6->__r_.__value_.__r.__words[0] != size)
  {
    do
    {
      if (*(char *)(v17 + 23) < 0)
      {
        std::basic_string<char16_t>::__init_copy_ctor_external(&v143, *(const std::basic_string<char16_t>::value_type **)v17, *(_QWORD *)(v17 + 8));
      }
      else
      {
        v19 = *(_OWORD *)v17;
        v143.__r_.__value_.__r.__words[2] = *(_QWORD *)(v17 + 16);
        *(_OWORD *)&v143.__r_.__value_.__l.__data_ = v19;
      }
      memset(&v142, 0, sizeof(v142));
      __dst.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)&v142;
      LOBYTE(__dst.__r_.__value_.__r.__words[1]) = 0;
      v142.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)operator new(0x18uLL);
      v142.__r_.__value_.__l.__size_ = v142.__r_.__value_.__r.__words[0];
      v142.__r_.__value_.__r.__words[2] = v142.__r_.__value_.__r.__words[0] + 24;
      v142.__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v142.__r_.__value_.__r.__words[2], (__int128 *)&v143, &v144, (std::basic_string<char16_t> *)v142.__r_.__value_.__l.__data_);
      BinaryProperties = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v12, (uint64_t *)&v142);
      v21 = BinaryProperties;
      v22 = v123;
      if ((unint64_t)v123 >= v124)
      {
        v24 = (char *)__p;
        v25 = (v123 - (_BYTE *)__p) >> 3;
        v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 61)
          std::vector<std::pair<morphun::dialog::DefaultArticleLookupFunction const*,std::vector<std::pair<std::basic_string<char16_t>,std::vector<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>> const>>::__throw_length_error[abi:ne180100]();
        v27 = v124 - (_QWORD)__p;
        if ((uint64_t)(v124 - (_QWORD)__p) >> 2 > v26)
          v26 = v27 >> 2;
        v28 = (unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8;
        v29 = 0x1FFFFFFFFFFFFFFFLL;
        if (!v28)
          v29 = v26;
        if (v29)
        {
          v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<void (*)(morphun::Tokenizer const*,std::u16string_view,morphun::Token_Head *)>>(v29);
          v24 = (char *)__p;
          v22 = v123;
        }
        else
        {
          v30 = 0;
        }
        v31 = (uint64_t *)(v29 + 8 * v25);
        *v31 = v21;
        v23 = v31 + 1;
        while (v22 != v24)
        {
          v32 = *((_QWORD *)v22 - 1);
          v22 -= 8;
          *--v31 = v32;
        }
        __p = v31;
        v123 = (char *)v23;
        v124 = v29 + 8 * v30;
        if (v24)
          operator delete(v24);
      }
      else
      {
        *(_QWORD *)v123 = BinaryProperties;
        v23 = (uint64_t *)(v22 + 8);
      }
      v123 = (char *)v23;
      __dst.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)&v142;
      std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__dst);
      if (SHIBYTE(v143.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v143.__r_.__value_.__l.__data_);
      v17 += 24;
    }
    while (v17 != size);
  }
  v33 = v126;
  if (v126 == v125)
  {
    v36 = 0;
    v37 = 0;
    v38 = v126;
    v35 = 0x1EF99A000uLL;
  }
  else
  {
    v34 = 0xCCCCCCCCCCCCCCCDLL * ((v126 - (_BYTE *)v125) >> 3);
    if (v34 >> 61)
      std::vector<std::pair<morphun::dialog::DefaultArticleLookupFunction const*,std::vector<std::pair<std::basic_string<char16_t>,std::vector<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>> const>>::__throw_length_error[abi:ne180100]();
    v35 = 0x1EF99A000;
    v36 = (unint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<void (*)(morphun::Tokenizer const*,std::u16string_view,morphun::Token_Head *)>>(0xCCCCCCCCCCCCCCCDLL * ((v126 - (_BYTE *)v125) >> 3));
    bzero(v36, 8 * v34);
    v37 = &v36[v34];
    v33 = v125;
    v38 = v126;
  }
  v41 = v38 - v33;
  if (v41 >= 1)
  {
    v42 = 0;
    v43 = v41 / 0x28uLL;
    if (v43 <= 1)
      v43 = 1;
    do
    {
      v36[v42] = v42;
      ++v42;
    }
    while (v43 != v42);
  }
  if (*(_BYTE *)(a2 + 224))
  {
    v44 = v37 - v36;
    if (v37 == v36)
    {
      v46 = 0;
    }
    else
    {
      if ((char *)v37 - (char *)v36 < 0)
        std::vector<std::pair<morphun::dialog::DefaultArticleLookupFunction const*,std::vector<std::pair<std::basic_string<char16_t>,std::vector<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>> const>>::__throw_length_error[abi:ne180100]();
      v45 = std::__allocate_at_least[abi:ne180100]<std::allocator<void (*)(morphun::Tokenizer const*,std::u16string_view,morphun::Token_Head *)>>(v37 - v36);
      memmove(v45, v36, (char *)v37 - (char *)v36);
      v46 = (uint64_t)v45;
    }
    v121[0] = a2;
    v121[1] = &v125;
    v121[2] = &__p;
    v56 = 126 - 2 * __clz(v44);
    if (v37 == v36)
      v57 = 0;
    else
      v57 = v56;
    v109 = (unint64_t *)v46;
    v114 = (unint64_t *)(v46 + 8 * v44);
    std::__introsort<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *,false>(v46, v114, (uint64_t)v121, v57, 1);
    if (*(uint64_t *)(v35 + 2144) <= 0)
    {
      std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v133, "S");
      if (v37 != v36)
      {
        v58 = 8 * v44;
        v59 = v109;
        do
        {
          v60 = *v59;
          std::basic_string<char16_t>::append(&v133, (const std::basic_string<char16_t>::value_type *)"\t", 2uLL);
          v61 = v125;
          if (0xCCCCCCCCCCCCCCCDLL * ((v126 - (_BYTE *)v125) >> 3) <= v60)
            std::vector<std::vector<long long>>::__throw_out_of_range[abi:ne180100]();
          std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v140, "I");
          v62 = (char *)&v61[5 * v60];
          v63 = v62[32];
          if (v62[32])
          {
            std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v138, "p");
            v65 = *((_QWORD *)v62 + 1);
            v64 = (int *)(v62 + 8);
            morphun::dictionary::metadata::MarisaTrie<int>::getKey(&v137, (marisa::Trie *)(*(_QWORD *)(v65 + 32) + 240), *(_DWORD *)v65);
            if ((v137.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v66 = &v137;
            else
              v66 = (std::basic_string<char16_t> *)v137.__r_.__value_.__r.__words[0];
            if ((v137.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v67 = HIBYTE(v137.__r_.__value_.__r.__words[2]);
            else
              v67 = v137.__r_.__value_.__l.__size_;
            std::basic_string<char16_t>::append(&v138, (const std::basic_string<char16_t>::value_type *)v66, v67);
            std::basic_string<char16_t>::append(&v138, (const std::basic_string<char16_t>::value_type *)",", 0xAuLL);
            morphun::dictionary::metadata::StringContainer::getString(*(morphun::dictionary::metadata::StringContainer **)(*(_QWORD *)v64 + 40), v64[2], &v136);
            if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v68 = &v136;
            else
              v68 = (std::basic_string<char16_t> *)v136.__r_.__value_.__r.__words[0];
            if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v69 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
            else
              v69 = v136.__r_.__value_.__l.__size_;
            std::basic_string<char16_t>::append(&v138, (const std::basic_string<char16_t>::value_type *)v68, v69);
            std::basic_string<char16_t>::append(&v138, L"\"", 1uLL);
            if (SHIBYTE(v138.__r_.__value_.__r.__words[2]) < 0)
              std::basic_string<char16_t>::__init_copy_ctor_external(&v139, v138.__r_.__value_.__l.__data_, v138.__r_.__value_.__l.__size_);
            else
              v139 = v138;
          }
          else
          {
            memset(&v139, 0, sizeof(v139));
          }
          v70 = SHIBYTE(v139.__r_.__value_.__r.__words[2]);
          v71 = (void *)v139.__r_.__value_.__r.__words[0];
          if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v72 = &v139;
          else
            v72 = (std::basic_string<char16_t> *)v139.__r_.__value_.__r.__words[0];
          if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v73 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
          else
            v73 = v139.__r_.__value_.__l.__size_;
          std::basic_string<char16_t>::append(&v140, (const std::basic_string<char16_t>::value_type *)v72, v73);
          __dst = v140;
          memset(&v140, 0, sizeof(v140));
          std::basic_string<char16_t>::append(&__dst, L"], grammemes[", 0xDuLL);
          v143 = __dst;
          memset(&__dst, 0, sizeof(__dst));
          v74 = v61[5 * v60];
          v75 = (morphun::dictionary::DictionaryMetaData_MMappedDictionary *)npc<morphun::dictionary::DictionaryMetaData_MMappedDictionary>(*(_QWORD *)(v12 + 8));
          morphun::dictionary::DictionaryMetaData_MMappedDictionary::getTypesOfValues(v75, v74, (uint64_t *)&v134);
          morphun::util::StringViewUtils::join(L",", 1uLL, &v134, (uint64_t)&v135);
          if ((v135.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v76 = &v135;
          else
            v76 = (std::basic_string<char16_t> *)v135.__r_.__value_.__r.__words[0];
          if ((v135.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v77 = HIBYTE(v135.__r_.__value_.__r.__words[2]);
          else
            v77 = v135.__r_.__value_.__l.__size_;
          std::basic_string<char16_t>::append(&v143, (const std::basic_string<char16_t>::value_type *)v76, v77);
          v142 = v143;
          memset(&v143, 0, sizeof(v143));
          std::basic_string<char16_t>::append(&v142, L"]", 1uLL);
          v132 = v142;
          memset(&v142, 0, sizeof(v142));
          if (SHIBYTE(v135.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v135.__r_.__value_.__l.__data_);
          v119[0] = &v134;
          std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)v119);
          if (SHIBYTE(v143.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v143.__r_.__value_.__l.__data_);
          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(__dst.__r_.__value_.__l.__data_);
            if (v70 < 0)
LABEL_144:
              operator delete(v71);
          }
          else if (v70 < 0)
          {
            goto LABEL_144;
          }
          v35 = 0x1EF99A000;
          if (v63)
          {
            if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v136.__r_.__value_.__l.__data_);
            if (SHIBYTE(v137.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v137.__r_.__value_.__l.__data_);
            if (SHIBYTE(v138.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v138.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v140.__r_.__value_.__l.__data_);
          v78 = SHIBYTE(v132.__r_.__value_.__r.__words[2]);
          v79 = (void *)v132.__r_.__value_.__r.__words[0];
          if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v80 = &v132;
          else
            v80 = (std::basic_string<char16_t> *)v132.__r_.__value_.__r.__words[0];
          if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v81 = HIBYTE(v132.__r_.__value_.__r.__words[2]);
          else
            v81 = v132.__r_.__value_.__l.__size_;
          std::basic_string<char16_t>::append(&v133, (const std::basic_string<char16_t>::value_type *)v80, v81);
          std::basic_string<char16_t>::append(&v133, (const std::basic_string<char16_t>::value_type *)"\n", 1uLL);
          if (v78 < 0)
            operator delete(v79);
          ++v59;
          v58 -= 8;
        }
        while (v58);
      }
      if (*(uint64_t *)(v35 + 2144) <= 0)
      {
        if ((v133.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v82 = &v133;
        else
          v82 = (std::basic_string<char16_t> *)v133.__r_.__value_.__r.__words[0];
        morphun::util::logToTopOfStackLogger(0, 0, (uint64_t)v82);
      }
      if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v133.__r_.__value_.__l.__data_);
    }
    v52 = v109;
    if (v109 == v114)
    {
LABEL_221:
      *(_BYTE *)a1 = 0;
      *(_BYTE *)(a1 + 24) = 0;
      if (v52)
LABEL_222:
        operator delete(v52);
      goto LABEL_223;
    }
  }
  else
  {
    v47 = v36;
    if (v36 != v37)
    {
      v48 = v36 + 1;
      v47 = v36;
      if (v36 + 1 != v37)
      {
        v47 = v36;
        do
        {
          v49 = *v47;
          v50 = 0xCCCCCCCCCCCCCCCDLL * ((v126 - (_BYTE *)v125) >> 3);
          if (v50 <= *v48 || v50 <= v49)
            std::vector<std::vector<long long>>::__throw_out_of_range[abi:ne180100]();
          if (morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(a2, (int8x8_t *)v125 + 5 * *v48, (int8x8_t *)v125 + 5 * v49, (uint64_t *)__p, (uint64_t *)v123) < 0)v47 = v48;
          ++v48;
        }
        while (v48 != v37);
      }
    }
    v52 = (unint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<void (*)(morphun::Tokenizer const*,std::u16string_view,morphun::Token_Head *)>>(1uLL);
    *v52 = *v47;
    v114 = v52 + 1;
    v35 = 0x1EF99A000;
  }
  v83 = (a4 & 0xFFFFFFFFFFFFFFFCLL) + 4;
  if ((a4 | 3) != 0xB)
    v83 = a4 | 3;
  v108 = v83 + 1;
  v110 = v52;
  __len = 2 * a4;
  while (1)
  {
    if (0xCCCCCCCCCCCCCCCDLL * ((v126 - (_BYTE *)v125) >> 3) <= *v52)
      std::vector<std::vector<long long>>::__throw_out_of_range[abi:ne180100]();
    v84 = (char *)v125 + 40 * *v52;
    if (!v84[32])
    {
      if (a4 > 0x7FFFFFFFFFFFFFF7)
        std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
      v52 = v110;
      if (a4 >= 0xB)
      {
        v103 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v108);
        v142.__r_.__value_.__l.__size_ = a4;
        v142.__r_.__value_.__r.__words[2] = v107 | 0x8000000000000000;
        v142.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)v103;
      }
      else
      {
        *((_BYTE *)&v142.__r_.__value_.__s + 23) = a4;
        v103 = &v142;
        if (!a4)
        {
LABEL_251:
          v103[a4] = 0;
          *(std::basic_string<char16_t> *)a1 = v142;
          *(_BYTE *)(a1 + 24) = 1;
          if (v110)
            goto LABEL_222;
          goto LABEL_223;
        }
      }
      memmove(v103, __src, __len);
      goto LABEL_251;
    }
    v85 = (uint64_t *)(v84 + 8);
    if (*(uint64_t *)(v35 + 2144) > 0)
      goto LABEL_208;
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v133, (char *)L"reinflect function called:\n\targs:\n");
    std::basic_string<char16_t>::append(&v133, (const std::basic_string<char16_t>::value_type *)"\t", 7uLL);
    v134 = v133;
    memset(&v133, 0, sizeof(v133));
    if (a4 > 0x7FFFFFFFFFFFFFF7)
      std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
    if (a4 >= 0xB)
    {
      v86 = (std::basic_string<char16_t> *)std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v108);
      v132.__r_.__value_.__l.__size_ = a4;
      v132.__r_.__value_.__r.__words[2] = v87 | 0x8000000000000000;
      v132.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)v86;
LABEL_164:
      memmove(v86, __src, __len);
      goto LABEL_165;
    }
    *((_BYTE *)&v132.__r_.__value_.__s + 23) = a4;
    v86 = &v132;
    if (a4)
      goto LABEL_164;
LABEL_165:
    v86->__r_.__value_.__s.__data_[a4] = 0;
    v88 = SHIBYTE(v132.__r_.__value_.__r.__words[2]);
    v89 = (void *)v132.__r_.__value_.__r.__words[0];
    if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v90 = &v132;
    else
      v90 = (std::basic_string<char16_t> *)v132.__r_.__value_.__r.__words[0];
    if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v91 = HIBYTE(v132.__r_.__value_.__r.__words[2]);
    else
      v91 = v132.__r_.__value_.__l.__size_;
    std::basic_string<char16_t>::append(&v134, (const std::basic_string<char16_t>::value_type *)v90, v91);
    v135 = v134;
    memset(&v134, 0, sizeof(v134));
    std::basic_string<char16_t>::append(&v135, (const std::basic_string<char16_t>::value_type *)"\n", 0x18uLL);
    v139 = v135;
    memset(&v135, 0, sizeof(v135));
    v92 = v85[2];
    v93 = (morphun::dictionary::DictionaryMetaData_MMappedDictionary *)npc<morphun::dictionary::DictionaryMetaData_MMappedDictionary>(*(_QWORD *)(v12 + 8));
    morphun::dictionary::DictionaryMetaData_MMappedDictionary::getTypesOfValues(v93, v92, (uint64_t *)&v118);
    morphun::util::StringViewUtils::join(L", ", 2uLL, &v118, (uint64_t)v119);
    if ((v120 & 0x80u) == 0)
      v94 = v119;
    else
      v94 = (void **)v119[0];
    if ((v120 & 0x80u) == 0)
      v95 = v120;
    else
      v95 = (std::basic_string<char16_t>::size_type)v119[1];
    std::basic_string<char16_t>::append(&v139, (const std::basic_string<char16_t>::value_type *)v94, v95);
    v140 = v139;
    memset(&v139, 0, sizeof(v139));
    std::basic_string<char16_t>::append(&v140, L"\n\t\tconstraints: ", 0x10uLL);
    __dst = v140;
    memset(&v140, 0, sizeof(v140));
    morphun::util::StringViewUtils::join(L", ", 2uLL, a5, (uint64_t)v116);
    if ((v117 & 0x80u) == 0)
      v96 = v116;
    else
      v96 = (void **)v116[0];
    if ((v117 & 0x80u) == 0)
      v97 = v117;
    else
      v97 = (std::basic_string<char16_t>::size_type)v116[1];
    std::basic_string<char16_t>::append(&__dst, (const std::basic_string<char16_t>::value_type *)v96, v97);
    v143 = __dst;
    memset(&__dst, 0, sizeof(__dst));
    std::basic_string<char16_t>::append(&v143, (const std::basic_string<char16_t>::value_type *)"\n", 1uLL);
    v142 = v143;
    memset(&v143, 0, sizeof(v143));
    if (*(uint64_t *)(v35 + 2144) <= 0)
    {
      if ((v142.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v98 = &v142;
      else
        v98 = (std::basic_string<char16_t> *)v142.__r_.__value_.__r.__words[0];
      morphun::util::logToTopOfStackLogger(0, 0, (uint64_t)v98);
    }
    if (SHIBYTE(v142.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v142.__r_.__value_.__l.__data_);
    if (SHIBYTE(v143.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v143.__r_.__value_.__l.__data_);
    if ((char)v117 < 0)
      operator delete(v116[0]);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__dst.__r_.__value_.__l.__data_);
    if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v140.__r_.__value_.__l.__data_);
    if ((char)v120 < 0)
      operator delete(v119[0]);
    v116[0] = &v118;
    std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)v116);
    if (SHIBYTE(v139.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v139.__r_.__value_.__l.__data_);
    if (SHIBYTE(v135.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v135.__r_.__value_.__l.__data_);
      if (v88 < 0)
LABEL_216:
        operator delete(v89);
    }
    else if (v88 < 0)
    {
      goto LABEL_216;
    }
    if (SHIBYTE(v134.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v134.__r_.__value_.__l.__data_);
    if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v133.__r_.__value_.__l.__data_);
LABEL_208:
    v99 = *v85;
    v100 = v85[2];
    v101 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v12, (uint64_t *)a5);
    morphun::dictionary::Inflector_InflectionPattern::reinflect(&v142, v99, v100, v101, (char *)__src, a4);
    if ((SHIBYTE(v142.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      break;
    v102 = (void *)v142.__r_.__value_.__r.__words[0];
    if (v142.__r_.__value_.__l.__size_)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)a1, v142.__r_.__value_.__l.__data_, v142.__r_.__value_.__l.__size_);
      *(_BYTE *)(a1 + 24) = 1;
      operator delete(v102);
      goto LABEL_254;
    }
    operator delete(v142.__r_.__value_.__l.__data_);
LABEL_213:
    if (++v52 == v114)
    {
      v52 = v110;
      goto LABEL_221;
    }
  }
  if (!*((_BYTE *)&v142.__r_.__value_.__s + 23))
    goto LABEL_213;
  *(std::basic_string<char16_t> *)a1 = v142;
  *(_BYTE *)(a1 + 24) = 1;
LABEL_254:
  v52 = v110;
  if (v110)
    goto LABEL_222;
LABEL_223:
  if (v36)
    operator delete(v36);
  if (__p)
  {
    v123 = (char *)__p;
    operator delete(__p);
  }
  v16 = v125;
  if (v125)
  {
LABEL_228:
    v126 = v16;
    operator delete(v16);
  }
LABEL_229:
  v15 = v128;
  if (v128)
LABEL_230:
    operator delete(v15);
}

void sub_1CB5A7FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *__p,uint64_t a43,int a44,__int16 a45,char a46,char a47)
{
  void *v47;

  if (a47 < 0)
    operator delete(__p);
  if (a11)
    operator delete(a11);
  if (v47)
    operator delete(v47);
  if (a29)
    operator delete(a29);
  if (a32)
    operator delete(a32);
  if (a35)
    operator delete(a35);
  _Unwind_Resume(a1);
}

void morphun::dialog::`anonymous namespace'::traceLogInflectCall(const void **a1, const void *a2, unint64_t a3, std::basic_string<char16_t> *a4, std::basic_string<char16_t> *a5)
{
  unint64_t v10;
  std::basic_string<char16_t> *v11;
  const void *v12;
  char *v13;
  _QWORD *p_dst;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  const std::basic_string<char16_t>::value_type *v19;
  std::basic_string<char16_t>::size_type v20;
  void **v21;
  std::basic_string<char16_t>::size_type v22;
  void **v23;
  std::basic_string<char16_t>::size_type v24;
  std::basic_string<char16_t> *v25;
  void *__p[2];
  unsigned __int8 v27;
  void *v28[2];
  unsigned __int8 v29;
  _QWORD *__dst;
  std::basic_string<char16_t>::size_type v31;
  int64_t v32;
  std::basic_string<char16_t> v33;
  std::basic_string<char16_t> v34;
  std::basic_string<char16_t> v35;
  std::basic_string<char16_t> v36;
  std::basic_string<char16_t> v37;
  std::basic_string<char16_t> v38;
  std::basic_string<char16_t> v39;

  if (*((char *)a1 + 23) >= 0)
    v10 = *((unsigned __int8 *)a1 + 23);
  else
    v10 = (unint64_t)a1[1];
  v11 = &v33;
  std::basic_string<char16_t>::basic_string[abi:ne180100]((uint64_t)&v33, v10 + 6);
  if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v11 = (std::basic_string<char16_t> *)v33.__r_.__value_.__r.__words[0];
  if (v10)
  {
    if (*((char *)a1 + 23) >= 0)
      v12 = a1;
    else
      v12 = *a1;
    memmove(v11, v12, 2 * v10);
  }
  v13 = (char *)v11 + 2 * v10;
  *(_QWORD *)v13 = *(_QWORD *)L"(word=";
  *((_DWORD *)v13 + 2) = 3997796;
  *((_WORD *)v13 + 6) = 0;
  if (a3 >= 0x7FFFFFFFFFFFFFF8)
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
  if (a3 >= 0xB)
  {
    v15 = (a3 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((a3 | 3) != 0xB)
      v15 = a3 | 3;
    p_dst = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v15 + 1);
    v31 = a3;
    v32 = v16 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_18;
  }
  HIBYTE(v32) = a3;
  p_dst = &__dst;
  if (a3)
LABEL_18:
    memmove(p_dst, a2, 2 * a3);
  *((_WORD *)p_dst + a3) = 0;
  v17 = SHIBYTE(v32);
  v18 = __dst;
  if (v32 >= 0)
    v19 = (const std::basic_string<char16_t>::value_type *)&__dst;
  else
    v19 = (const std::basic_string<char16_t>::value_type *)__dst;
  if (v32 >= 0)
    v20 = HIBYTE(v32);
  else
    v20 = v31;
  std::basic_string<char16_t>::append(&v33, v19, v20);
  v34 = v33;
  memset(&v33, 0, sizeof(v33));
  std::basic_string<char16_t>::append(&v34, (const std::basic_string<char16_t>::value_type *)",", 0x11uLL);
  v35 = v34;
  memset(&v34, 0, sizeof(v34));
  morphun::util::StringViewUtils::join(L", ", 2uLL, a4, (uint64_t)v28);
  if ((v29 & 0x80u) == 0)
    v21 = v28;
  else
    v21 = (void **)v28[0];
  if ((v29 & 0x80u) == 0)
    v22 = v29;
  else
    v22 = (std::basic_string<char16_t>::size_type)v28[1];
  std::basic_string<char16_t>::append(&v35, (const std::basic_string<char16_t>::value_type *)v21, v22);
  v36 = v35;
  memset(&v35, 0, sizeof(v35));
  std::basic_string<char16_t>::append(&v36, (const std::basic_string<char16_t>::value_type *)"]", 0x23uLL);
  v37 = v36;
  memset(&v36, 0, sizeof(v36));
  morphun::util::StringViewUtils::join(L", ", 2uLL, a5, (uint64_t)__p);
  if ((v27 & 0x80u) == 0)
    v23 = __p;
  else
    v23 = (void **)__p[0];
  if ((v27 & 0x80u) == 0)
    v24 = v27;
  else
    v24 = (std::basic_string<char16_t>::size_type)__p[1];
  std::basic_string<char16_t>::append(&v37, (const std::basic_string<char16_t>::value_type *)v23, v24);
  v38 = v37;
  memset(&v37, 0, sizeof(v37));
  std::basic_string<char16_t>::append(&v38, (const std::basic_string<char16_t>::value_type *)"]", 3uLL);
  v39 = v38;
  memset(&v38, 0, sizeof(v38));
  if (morphun::util::gLogLevel <= 0)
  {
    if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v25 = &v39;
    else
      v25 = (std::basic_string<char16_t> *)v39.__r_.__value_.__r.__words[0];
    morphun::util::logToTopOfStackLogger(0, 0, (uint64_t)v25);
  }
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v39.__r_.__value_.__l.__data_);
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v38.__r_.__value_.__l.__data_);
  if ((char)v27 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v37.__r_.__value_.__l.__data_);
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v36.__r_.__value_.__l.__data_);
  if ((char)v29 < 0)
    operator delete(v28[0]);
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v35.__r_.__value_.__l.__data_);
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v34.__r_.__value_.__l.__data_);
    if ((v17 & 0x80000000) == 0)
      goto LABEL_58;
  }
  else if ((v17 & 0x80000000) == 0)
  {
    goto LABEL_58;
  }
  operator delete(v18);
LABEL_58:
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v33.__r_.__value_.__l.__data_);
}

void sub_1CB5A86F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49)
{
  void *v49;
  int v50;
  uint64_t v51;

  if (*(char *)(v51 - 73) < 0)
    operator delete(*(void **)(v51 - 96));
  if (*(char *)(v51 - 105) < 0)
    operator delete(*(void **)(v51 - 128));
  if (a14 < 0)
    operator delete(__p);
  if (*(char *)(v51 - 137) < 0)
    operator delete(*(void **)(v51 - 160));
  if (a49 < 0)
    operator delete(a44);
  if (a20 < 0)
    operator delete(a15);
  if (a42 < 0)
    operator delete(a37);
  if (a35 < 0)
    operator delete(a30);
  if (v50 < 0)
    operator delete(v49);
  if (a29 < 0)
    operator delete(a24);
  _Unwind_Resume(exception_object);
}

uint64_t morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(uint64_t a1, int8x8_t *a2, int8x8_t *a3, uint64_t *a4, uint64_t *a5)
{
  int8x8_t v7;
  int8x8_t v8;
  int64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t result;
  uint8x8_t v15;
  unsigned int v16;
  uint8x8_t v17;
  int v18;
  int v19;
  uint64_t v20;

  v7 = *a2;
  v8 = *a3;
  if (a4 == a5)
    goto LABEL_7;
  v9 = 0;
  v10 = a4;
  do
  {
    v11 = *v10++;
    v9 = ((v11 & *(_QWORD *)&v7) != 0) | (unint64_t)(2 * v9);
  }
  while (v10 != a5);
  v12 = 0;
  do
  {
    v13 = *a4++;
    v12 = ((v13 & *(_QWORD *)&v8) != 0) | (unint64_t)(2 * v12);
  }
  while (a4 != a5);
  if (v9 == v12)
  {
LABEL_7:
    result = (*(uint64_t (**)(uint64_t, int8x8_t, int8x8_t))(*(_QWORD *)a1 + 48))(a1, *a2, *a3);
    if (!result)
    {
      if (a2[4].i8[0])
      {
        if (a3[4].i8[0])
        {
          v15 = (uint8x8_t)vcnt_s8(v7);
          v15.i16[0] = vaddlv_u8(v15);
          v16 = v15.i32[0];
          v17 = (uint8x8_t)vcnt_s8(v8);
          v17.i16[0] = vaddlv_u8(v17);
          if (v16 == v17.i32[0])
          {
            v18 = *(unsigned __int16 *)(*(_QWORD *)&a2[1] + 18);
            v19 = *(unsigned __int16 *)(*(_QWORD *)&a3[1] + 18);
            v20 = 1;
            if ((__int16)v18 >= (__int16)v19)
              v20 = -1;
            if (v18 == v19)
              return 0;
            else
              return v20;
          }
          else if (v16 < v17.i32[0])
          {
            return -1;
          }
          else
          {
            return 1;
          }
        }
        else
        {
          return -1;
        }
      }
      else
      {
        return 1;
      }
    }
  }
  else if (v9 > v12)
  {
    return -1;
  }
  else
  {
    return 1;
  }
  return result;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *,false>(uint64_t result, unint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t *v8;
  unint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t *v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  BOOL v45;
  BOOL v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t *v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t *v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t *v75;
  BOOL v77;
  uint64_t v78;
  unint64_t *v79;
  unint64_t *v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t *v90;
  int64_t v91;
  int64_t v92;
  uint64_t v93;
  unint64_t *v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t *v100;
  unint64_t v101;
  unint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t *v110;
  unint64_t *v111;
  uint64_t v112;
  unint64_t *v113;
  unint64_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t *v122;
  uint64_t v123;
  unint64_t v124;
  unint64_t *v125;
  unint64_t v126;
  unint64_t *v127;
  uint64_t v128;
  unint64_t v129;
  unint64_t *v131;
  unint64_t v132;
  uint64_t v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t *v136;
  uint64_t v137;
  unint64_t v138;
  unint64_t v139;
  unint64_t *v140;
  unint64_t *v141;
  int64_t v143;
  unint64_t *v144;
  unint64_t *v145;
  int64_t v146;
  unint64_t v147;
  unint64_t *v148;

  v8 = (unint64_t *)result;
LABEL_2:
  v144 = a2;
  v145 = a2 - 1;
  v140 = a2 - 3;
  v141 = a2 - 2;
  while (2)
  {
    v9 = v8;
    v10 = (char *)a2 - (char *)v8;
    v11 = a2 - v8;
    switch(v11)
    {
      case 0:
      case 1:
        return result;
      case 2:
        v72 = **(_QWORD **)(a3 + 8);
        v73 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v72) >> 3);
        if (v73 <= *v145 || v73 <= *v9)
          goto LABEL_167;
        result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v72 + 40 * *v145), (int8x8_t *)(v72 + 40 * *v9), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8));
        if (result < 0)
        {
          v74 = *v9;
          *v9 = *v145;
          *v145 = v74;
        }
        return result;
      case 3:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(v9, v9 + 1, v145, a3);
      case 4:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(v9, v9 + 1, v9 + 2, v145, a3);
      case 5:
        return std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *,0>(v9, v9 + 1, v9 + 2, v9 + 3, v145, a3);
      default:
        if (v10 <= 191)
        {
          v75 = v9 + 1;
          v77 = v9 == a2 || v75 == a2;
          if ((a5 & 1) != 0)
          {
            if (v77)
              return result;
            v78 = 0;
            v79 = v9;
            while (1)
            {
              v80 = v75;
              v81 = v79[1];
              v82 = **(_QWORD **)(a3 + 8);
              v83 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v82) >> 3);
              if (v83 <= v81)
                break;
              v84 = *v79;
              if (v83 <= v84)
                break;
              result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v82 + 40 * v81), (int8x8_t *)(v82 + 40 * v84), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8));
              if (result < 0)
              {
                v85 = *v80;
                v86 = v78;
                while (1)
                {
                  *(unint64_t *)((char *)v9 + v86 + 8) = *(unint64_t *)((char *)v9 + v86);
                  if (!v86)
                    break;
                  v87 = **(_QWORD **)(a3 + 8);
                  v88 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v87) >> 3);
                  if (v88 <= v85)
                    goto LABEL_167;
                  v89 = *(unint64_t *)((char *)v9 + v86 - 8);
                  if (v88 <= v89)
                    goto LABEL_167;
                  result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v87 + 40 * v85), (int8x8_t *)(v87 + 40 * v89), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8));
                  v86 -= 8;
                  if ((result & 0x8000000000000000) == 0)
                  {
                    v90 = (unint64_t *)((char *)v9 + v86 + 8);
                    goto LABEL_104;
                  }
                }
                v90 = v9;
LABEL_104:
                *v90 = v85;
              }
              v75 = v80 + 1;
              v78 += 8;
              v79 = v80;
              if (v80 + 1 == a2)
                return result;
            }
          }
          else
          {
            if (v77)
              return result;
            while (1)
            {
              v131 = v75;
              v132 = v9[1];
              v133 = **(_QWORD **)(a3 + 8);
              v134 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v133) >> 3);
              if (v134 <= v132 || v134 <= *v9)
                break;
              result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v133 + 40 * v132), (int8x8_t *)(v133 + 40 * *v9), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8));
              if (result < 0)
              {
                v135 = *v131;
                v136 = v131;
                do
                {
                  *v136 = *(v136 - 1);
                  v137 = **(_QWORD **)(a3 + 8);
                  v138 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v137) >> 3);
                  if (v138 <= v135)
                    goto LABEL_167;
                  v139 = *(v136 - 2);
                  if (v138 <= v139)
                    goto LABEL_167;
                  result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v137 + 40 * v135), (int8x8_t *)(v137 + 40 * v139), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8));
                  --v136;
                }
                while (result < 0);
                *v136 = v135;
              }
              v75 = v131 + 1;
              v9 = v131;
              if (v131 + 1 == a2)
                return result;
            }
          }
LABEL_167:
          std::vector<std::vector<long long>>::__throw_out_of_range[abi:ne180100]();
        }
        v148 = v9;
        if (a4)
        {
          v12 = (unint64_t)v11 >> 1;
          v13 = &v9[(unint64_t)v11 >> 1];
          if ((unint64_t)v10 < 0x401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(v13, v9, v145, a3);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(v9, v13, v145, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(v9 + 1, v13 - 1, v141, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(v9 + 2, &v9[v12 + 1], v140, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(v13 - 1, v13, &v9[v12 + 1], a3);
            v14 = *v9;
            *v9 = *v13;
            *v13 = v14;
          }
          --a4;
          if ((a5 & 1) == 0)
          {
            v15 = *(v9 - 1);
            v16 = **(_QWORD **)(a3 + 8);
            v17 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v16) >> 3);
            if (v17 <= v15 || v17 <= *v9)
              goto LABEL_167;
            if ((morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v16 + 40 * v15), (int8x8_t *)(v16 + 40 * *v9), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8)) & 0x8000000000000000) == 0)
            {
              v47 = *v9;
              v48 = **(_QWORD **)(a3 + 8);
              v49 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v48) >> 3);
              if (v49 <= *v9 || v49 <= *v145)
                goto LABEL_167;
              result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v48 + 40 * v47), (int8x8_t *)(v48 + 40 * *v145), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8));
              if (result < 0)
              {
                v8 = v9;
                while (1)
                {
                  v53 = **(_QWORD **)(a3 + 8);
                  v54 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v53) >> 3);
                  if (v54 <= v47)
                    goto LABEL_167;
                  v56 = v8[1];
                  ++v8;
                  v55 = v56;
                  if (v54 <= v56)
                    goto LABEL_167;
                  result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v53 + 40 * v47), (int8x8_t *)(v53 + 40 * v55), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8));
                  if (result < 0)
                    goto LABEL_58;
                }
              }
              v50 = v9 + 1;
              do
              {
                v8 = v50;
                if (v50 >= a2)
                  break;
                v51 = **(_QWORD **)(a3 + 8);
                v52 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v51) >> 3);
                if (v52 <= v47 || v52 <= *v8)
                  goto LABEL_167;
                result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v51 + 40 * v47), (int8x8_t *)(v51 + 40 * *v8), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8));
                v50 = v8 + 1;
              }
              while ((result & 0x8000000000000000) == 0);
LABEL_58:
              v57 = a2;
              if (v8 < a2)
              {
                v57 = a2;
                do
                {
                  v58 = **(_QWORD **)(a3 + 8);
                  v59 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v58) >> 3);
                  if (v59 <= v47)
                    goto LABEL_167;
                  v61 = *--v57;
                  v60 = v61;
                  if (v59 <= v61)
                    goto LABEL_167;
                  result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v58 + 40 * v47), (int8x8_t *)(v58 + 40 * v60), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8));
                }
                while (result < 0);
              }
LABEL_71:
              if (v8 < v57)
              {
                v62 = *v8;
                *v8 = *v57;
                *v57 = v62;
                do
                {
                  v63 = **(_QWORD **)(a3 + 8);
                  v64 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v63) >> 3);
                  if (v64 > v47)
                  {
                    v66 = v8[1];
                    ++v8;
                    v65 = v66;
                    if (v64 > v66)
                      continue;
                  }
                  goto LABEL_167;
                }
                while ((morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v63 + 40 * v47), (int8x8_t *)(v63 + 40 * v65), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8)) & 0x8000000000000000) == 0);
                while (1)
                {
                  v67 = **(_QWORD **)(a3 + 8);
                  v68 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v67) >> 3);
                  if (v68 <= v47)
                    goto LABEL_167;
                  v70 = *--v57;
                  v69 = v70;
                  if (v68 <= v70)
                    goto LABEL_167;
                  result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v67 + 40 * v47), (int8x8_t *)(v67 + 40 * v69), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8));
                  if ((result & 0x8000000000000000) == 0)
                    goto LABEL_71;
                }
              }
              v71 = v8 - 1;
              if (v8 - 1 != v9)
                *v9 = *v71;
              a5 = 0;
              *v71 = v47;
              continue;
            }
          }
          v18 = *v9;
          v19 = v9;
          do
          {
            v21 = v19[1];
            ++v19;
            v20 = v21;
            v22 = **(_QWORD **)(a3 + 8);
            v23 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v22) >> 3);
            if (v23 <= v21 || v23 <= v18)
              goto LABEL_167;
          }
          while (morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v22 + 40 * v20), (int8x8_t *)(v22 + 40 * v18), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8)) < 0);
          v24 = v9;
          v25 = v19 - 1;
          if (v19 - 1 != v24)
          {
            while (1)
            {
              v27 = *--a2;
              v26 = v27;
              v28 = **(_QWORD **)(a3 + 8);
              v29 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v28) >> 3);
              if (v29 <= v27 || v29 <= v18)
                goto LABEL_167;
              if (morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v28 + 40 * v26), (int8x8_t *)(v28 + 40 * v18), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8)) < 0)goto LABEL_27;
            }
          }
          a2 = v144;
          while (v19 < a2)
          {
            v31 = *--a2;
            v30 = v31;
            v32 = **(_QWORD **)(a3 + 8);
            v33 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v32) >> 3);
            if (v33 <= v31 || v33 <= v18)
              goto LABEL_167;
            if (morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v32 + 40 * v30), (int8x8_t *)(v32 + 40 * v18), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8)) < 0)break;
          }
LABEL_27:
          if (v19 < a2)
          {
            v34 = v19;
            v35 = a2;
            do
            {
              v36 = *v34;
              *v34 = *v35;
              *v35 = v36;
              do
              {
                v38 = v34[1];
                ++v34;
                v37 = v38;
                v39 = **(_QWORD **)(a3 + 8);
                v40 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v39) >> 3);
                if (v40 <= v38 || v40 <= v18)
                  goto LABEL_167;
              }
              while (morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v39 + 40 * v37), (int8x8_t *)(v39 + 40 * v18), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8)) < 0);
              v25 = v34 - 1;
              do
              {
                v42 = *--v35;
                v41 = v42;
                v43 = **(_QWORD **)(a3 + 8);
                v44 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v43) >> 3);
                if (v44 <= v42 || v44 <= v18)
                  goto LABEL_167;
              }
              while ((morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v43 + 40 * v41), (int8x8_t *)(v43 + 40 * v18), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8)) & 0x8000000000000000) == 0);
            }
            while (v34 < v35);
          }
          if (v25 != v148)
            *v148 = *v25;
          *v25 = v18;
          v45 = v19 >= a2;
          a2 = v144;
          if (!v45)
          {
LABEL_44:
            result = std::__introsort<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *,false>(v148, v25, a3, a4, a5 & 1);
            a5 = 0;
            v8 = v25 + 1;
            continue;
          }
          v46 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(v148, v25, a3);
          v8 = v25 + 1;
          result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(v25 + 1, v144, a3);
          if (!(_DWORD)result)
          {
            if (!v46)
              goto LABEL_44;
            continue;
          }
          a2 = v25;
          v8 = v148;
          if (v46)
            return result;
          goto LABEL_2;
        }
        if (v9 != a2)
        {
          v91 = (unint64_t)(v11 - 2) >> 1;
          v146 = v91;
          while (1)
          {
            v92 = v91;
            if (v146 >= v91)
            {
              v93 = (2 * v91) | 1;
              v94 = &v148[v93];
              if (2 * v91 + 2 < v11)
              {
                v95 = **(_QWORD **)(a3 + 8);
                v96 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v95) >> 3);
                if (v96 <= *v94)
                  goto LABEL_167;
                v97 = v94[1];
                if (v96 <= v97)
                  goto LABEL_167;
                if (morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v95 + 40 * *v94), (int8x8_t *)(v95 + 40 * v97), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8)) < 0)
                {
                  ++v94;
                  v93 = 2 * v92 + 2;
                }
              }
              v98 = **(_QWORD **)(a3 + 8);
              v99 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v98) >> 3);
              if (v99 <= *v94)
                goto LABEL_167;
              v100 = &v148[v92];
              if (v99 <= *v100)
                goto LABEL_167;
              result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v98 + 40 * *v94), (int8x8_t *)(v98 + 40 * *v100), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8));
              if ((result & 0x8000000000000000) == 0)
              {
                v143 = v92;
                v101 = *v100;
                do
                {
                  v102 = v94;
                  *v100 = *v94;
                  if (v146 < v93)
                    break;
                  v103 = (2 * v93) | 1;
                  v94 = &v148[v103];
                  v93 = 2 * v93 + 2;
                  if (v93 >= v11)
                  {
                    v93 = v103;
                  }
                  else
                  {
                    v104 = **(_QWORD **)(a3 + 8);
                    v105 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v104) >> 3);
                    if (v105 <= *v94)
                      goto LABEL_167;
                    v106 = v94[1];
                    if (v105 <= v106)
                      goto LABEL_167;
                    if (morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v104 + 40 * *v94), (int8x8_t *)(v104 + 40 * v106), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8)) >= 0)v93 = v103;
                    else
                      ++v94;
                    a2 = v144;
                  }
                  v107 = **(_QWORD **)(a3 + 8);
                  v108 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v107) >> 3);
                  if (v108 <= *v94 || v108 <= v101)
                    goto LABEL_167;
                  result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v107 + 40 * *v94), (int8x8_t *)(v107 + 40 * v101), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8));
                  v100 = v102;
                }
                while ((result & 0x8000000000000000) == 0);
                *v102 = v101;
                v92 = v143;
              }
            }
            v91 = v92 - 1;
            if (!v92)
            {
              v109 = (unint64_t)v10 >> 3;
              v110 = v148;
              while (1)
              {
                v111 = a2;
                v112 = 0;
                v147 = *v110;
                v113 = v110;
                do
                {
                  v114 = &v113[v112 + 1];
                  v115 = (2 * v112) | 1;
                  v116 = 2 * v112 + 2;
                  if (v116 < v109)
                  {
                    v117 = **(_QWORD **)(a3 + 8);
                    v118 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v117) >> 3);
                    if (v118 <= *v114)
                      goto LABEL_167;
                    v119 = v113[v112 + 2];
                    if (v118 <= v119)
                      goto LABEL_167;
                    result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v117 + 40 * *v114), (int8x8_t *)(v117 + 40 * v119), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8));
                    if (result < 0)
                    {
                      ++v114;
                      v115 = v116;
                    }
                  }
                  *v113 = *v114;
                  v113 = v114;
                  v112 = v115;
                }
                while (v115 <= (uint64_t)((unint64_t)(v109 - 2) >> 1));
                a2 = v111 - 1;
                if (v114 == v111 - 1)
                {
                  v110 = v148;
                  *v114 = v147;
                }
                else
                {
                  *v114 = *a2;
                  v110 = v148;
                  *a2 = v147;
                  v120 = (char *)v114 - (char *)v148 + 8;
                  if (v120 >= 9)
                  {
                    v121 = (((unint64_t)v120 >> 3) - 2) >> 1;
                    v122 = &v148[v121];
                    v123 = **(_QWORD **)(a3 + 8);
                    v124 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v123) >> 3);
                    if (v124 <= *v122 || v124 <= *v114)
                      goto LABEL_167;
                    result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v123 + 40 * *v122), (int8x8_t *)(v123 + 40 * *v114), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8));
                    if (result < 0)
                    {
                      v125 = a2;
                      v126 = *v114;
                      do
                      {
                        v127 = v122;
                        *v114 = *v122;
                        if (!v121)
                          break;
                        v121 = (v121 - 1) >> 1;
                        v122 = &v148[v121];
                        v128 = **(_QWORD **)(a3 + 8);
                        v129 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v128) >> 3);
                        if (v129 <= *v122 || v129 <= v126)
                          goto LABEL_167;
                        result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v128 + 40 * *v122), (int8x8_t *)(v128 + 40 * v126), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8));
                        v114 = v127;
                      }
                      while (result < 0);
                      *v127 = v126;
                      a2 = v125;
                    }
                  }
                }
                if (v109-- <= 2)
                  return result;
              }
            }
          }
        }
        return result;
    }
  }
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(unint64_t *a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t result;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v4 = **(_QWORD **)(a4 + 8);
  v5 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a4 + 8) + 8) - v4) >> 3);
  if (v5 <= *a2 || v5 <= *a1)
    goto LABEL_21;
  v10 = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a4, (int8x8_t *)(v4 + 40 * *a2), (int8x8_t *)(v4 + 40 * *a1), **(uint64_t ***)(a4 + 16), *(uint64_t **)(*(_QWORD *)(a4 + 16) + 8));
  v11 = *a3;
  v12 = *a2;
  v13 = *(_QWORD *)a4;
  v14 = **(_QWORD **)(a4 + 8);
  v15 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a4 + 8) + 8) - v14) >> 3);
  if (v10 < 0)
  {
    if (v15 > *a3 && v15 > v12)
    {
      result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(v13, (int8x8_t *)(v14 + 40 * v11), (int8x8_t *)(v14 + 40 * v12), **(uint64_t ***)(a4 + 16), *(uint64_t **)(*(_QWORD *)(a4 + 16) + 8));
      v21 = *a1;
      if (result < 0)
      {
        *a1 = *a3;
      }
      else
      {
        *a1 = *a2;
        *a2 = v21;
        v22 = **(_QWORD **)(a4 + 8);
        v23 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a4 + 8) + 8) - v22) >> 3);
        if (v23 <= *a3 || v23 <= v21)
          goto LABEL_21;
        result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a4, (int8x8_t *)(v22 + 40 * *a3), (int8x8_t *)(v22 + 40 * v21), **(uint64_t ***)(a4 + 16), *(uint64_t **)(*(_QWORD *)(a4 + 16) + 8));
        if ((result & 0x8000000000000000) == 0)
          return result;
        v21 = *a2;
        *a2 = *a3;
      }
      *a3 = v21;
      return result;
    }
LABEL_21:
    std::vector<std::vector<long long>>::__throw_out_of_range[abi:ne180100]();
  }
  if (v15 <= *a3 || v15 <= v12)
    goto LABEL_21;
  result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(v13, (int8x8_t *)(v14 + 40 * v11), (int8x8_t *)(v14 + 40 * v12), **(uint64_t ***)(a4 + 16), *(uint64_t **)(*(_QWORD *)(a4 + 16) + 8));
  if ((result & 0x8000000000000000) == 0)
    return result;
  v17 = *a2;
  *a2 = *a3;
  *a3 = v17;
  v18 = **(_QWORD **)(a4 + 8);
  v19 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a4 + 8) + 8) - v18) >> 3);
  if (v19 <= *a2 || v19 <= *a1)
    goto LABEL_21;
  result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a4, (int8x8_t *)(v18 + 40 * *a2), (int8x8_t *)(v18 + 40 * *a1), **(uint64_t ***)(a4 + 16), *(uint64_t **)(*(_QWORD *)(a4 + 16) + 8));
  if (result < 0)
  {
    v20 = *a1;
    *a1 = *a2;
    *a2 = v20;
  }
  return result;
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(unint64_t *a1, unint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v10;
  unint64_t v11;
  uint64_t result;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(a1, a2, a3, a5);
  v10 = **(_QWORD **)(a5 + 8);
  v11 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a5 + 8) + 8) - v10) >> 3);
  if (v11 <= *a4 || v11 <= *a3)
    goto LABEL_12;
  result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a5, (int8x8_t *)(v10 + 40 * *a4), (int8x8_t *)(v10 + 40 * *a3), **(uint64_t ***)(a5 + 16), *(uint64_t **)(*(_QWORD *)(a5 + 16) + 8));
  if ((result & 0x8000000000000000) == 0)
    return result;
  v13 = *a3;
  *a3 = *a4;
  *a4 = v13;
  v14 = **(_QWORD **)(a5 + 8);
  v15 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a5 + 8) + 8) - v14) >> 3);
  if (v15 <= *a3 || v15 <= *a2)
    goto LABEL_12;
  result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a5, (int8x8_t *)(v14 + 40 * *a3), (int8x8_t *)(v14 + 40 * *a2), **(uint64_t ***)(a5 + 16), *(uint64_t **)(*(_QWORD *)(a5 + 16) + 8));
  if ((result & 0x8000000000000000) == 0)
    return result;
  v16 = *a2;
  *a2 = *a3;
  *a3 = v16;
  v17 = **(_QWORD **)(a5 + 8);
  v18 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a5 + 8) + 8) - v17) >> 3);
  if (v18 <= *a2 || v18 <= *a1)
LABEL_12:
    std::vector<std::vector<long long>>::__throw_out_of_range[abi:ne180100]();
  result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a5, (int8x8_t *)(v17 + 40 * *a2), (int8x8_t *)(v17 + 40 * *a1), **(uint64_t ***)(a5 + 16), *(uint64_t **)(*(_QWORD *)(a5 + 16) + 8));
  if (result < 0)
  {
    v19 = *a1;
    *a1 = *a2;
    *a2 = v19;
  }
  return result;
}

uint64_t std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *,0>(unint64_t *a1, unint64_t *a2, unint64_t *a3, unint64_t *a4, unint64_t *a5, uint64_t a6)
{
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(a1, a2, a3, a4, a6);
  v12 = **(_QWORD **)(a6 + 8);
  v13 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a6 + 8) + 8) - v12) >> 3);
  if (v13 <= *a5 || v13 <= *a4)
    goto LABEL_15;
  result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a6, (int8x8_t *)(v12 + 40 * *a5), (int8x8_t *)(v12 + 40 * *a4), **(uint64_t ***)(a6 + 16), *(uint64_t **)(*(_QWORD *)(a6 + 16) + 8));
  if ((result & 0x8000000000000000) == 0)
    return result;
  v15 = *a4;
  *a4 = *a5;
  *a5 = v15;
  v16 = **(_QWORD **)(a6 + 8);
  v17 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a6 + 8) + 8) - v16) >> 3);
  if (v17 <= *a4 || v17 <= *a3)
    goto LABEL_15;
  result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a6, (int8x8_t *)(v16 + 40 * *a4), (int8x8_t *)(v16 + 40 * *a3), **(uint64_t ***)(a6 + 16), *(uint64_t **)(*(_QWORD *)(a6 + 16) + 8));
  if ((result & 0x8000000000000000) == 0)
    return result;
  v18 = *a3;
  *a3 = *a4;
  *a4 = v18;
  v19 = **(_QWORD **)(a6 + 8);
  v20 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a6 + 8) + 8) - v19) >> 3);
  if (v20 <= *a3 || v20 <= *a2)
    goto LABEL_15;
  result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a6, (int8x8_t *)(v19 + 40 * *a3), (int8x8_t *)(v19 + 40 * *a2), **(uint64_t ***)(a6 + 16), *(uint64_t **)(*(_QWORD *)(a6 + 16) + 8));
  if ((result & 0x8000000000000000) == 0)
    return result;
  v21 = *a2;
  *a2 = *a3;
  *a3 = v21;
  v22 = **(_QWORD **)(a6 + 8);
  v23 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a6 + 8) + 8) - v22) >> 3);
  if (v23 <= *a2 || v23 <= *a1)
LABEL_15:
    std::vector<std::vector<long long>>::__throw_out_of_range[abi:ne180100]();
  result = morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a6, (int8x8_t *)(v22 + 40 * *a2), (int8x8_t *)(v22 + 40 * *a1), **(uint64_t ***)(a6 + 16), *(uint64_t **)(*(_QWORD *)(a6 + 16) + 8));
  if (result < 0)
  {
    v24 = *a1;
    *a1 = *a2;
    *a2 = v24;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(unint64_t *a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  _BOOL8 result;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t *v23;

  v6 = a2 - a1;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = *(a2 - 1);
      v9 = **(_QWORD **)(a3 + 8);
      v10 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v9) >> 3);
      if (v10 <= v8 || v10 <= *a1)
        goto LABEL_26;
      if (morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v9 + 40 * v8), (int8x8_t *)(v9 + 40 * *a1), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8)) < 0)
      {
        v11 = *a1;
        *a1 = *(a2 - 1);
        *(a2 - 1) = v11;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(a1, a1 + 1, a2 - 1, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *,0>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      v12 = a1 + 2;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,morphun::dialog::DictionaryLookupInflector::inflectWord(std::u16string_view,std::vector<std::basic_string<char16_t>> const&,std::vector<std::basic_string<char16_t>> const&)::$_0 &,long long *>(a1, a1 + 1, a1 + 2, a3);
      v13 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v14 = 0;
      v15 = 0;
      break;
  }
  while (1)
  {
    v16 = **(_QWORD **)(a3 + 8);
    v17 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v16) >> 3);
    if (v17 <= *v13 || v17 <= *v12)
LABEL_26:
      std::vector<std::vector<long long>>::__throw_out_of_range[abi:ne180100]();
    if (morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v16 + 40 * *v13), (int8x8_t *)(v16 + 40 * *v12), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8)) < 0)
    {
      v18 = *v13;
      v19 = v14;
      while (1)
      {
        *(unint64_t *)((char *)a1 + v19 + 24) = *(unint64_t *)((char *)a1 + v19 + 16);
        if (v19 == -16)
          break;
        v20 = **(_QWORD **)(a3 + 8);
        v21 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) - v20) >> 3);
        if (v21 <= v18)
          goto LABEL_26;
        v22 = *(unint64_t *)((char *)a1 + v19 + 8);
        if (v21 <= v22)
          goto LABEL_26;
        v19 -= 8;
        if ((morphun::dialog::DictionaryLookupInflector::compareInflectionGrammemes(*(_QWORD *)a3, (int8x8_t *)(v20 + 40 * v18), (int8x8_t *)(v20 + 40 * v22), **(uint64_t ***)(a3 + 16), *(uint64_t **)(*(_QWORD *)(a3 + 16) + 8)) & 0x8000000000000000) == 0)
        {
          v23 = (unint64_t *)((char *)a1 + v19 + 24);
          goto LABEL_18;
        }
      }
      v23 = a1;
LABEL_18:
      *v23 = v18;
      if (++v15 == 8)
        return v13 + 1 == a2;
    }
    v12 = v13;
    v14 += 8;
    if (++v13 == a2)
      return 1;
  }
}

void morphun::dialog::DictionaryLookupInflector::inflect(uint64_t a1, uint64_t a2, void *__src, unint64_t a4, std::basic_string<char16_t> *a5, std::basic_string<char16_t> *a6)
{
  std::basic_string<char16_t>::size_type i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int isAllUpperCase;
  const void *v18;
  unint64_t v19;
  std::basic_string<char16_t> *v20;
  int32_t v21;
  UChar32 v22;
  std::basic_string<char16_t> *v23;
  std::basic_string<char16_t>::size_type size;
  std::basic_string<char16_t> __str;
  std::basic_string<char16_t> v26;
  char v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  void *__p[2];
  unint64_t v32;

  if (morphun::util::gLogLevel <= 0)
  {
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, "D");
    if (SHIBYTE(v32) < 0)
      operator delete(__p[0]);
  }
  for (i = a5->__r_.__value_.__r.__words[0]; ; i += 24)
  {
    if (i == a5->__r_.__value_.__l.__size_)
    {
      if (a4 >= 0x7FFFFFFFFFFFFFF8)
        std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
      if (a4 >= 0xB)
      {
        v15 = (a4 & 0xFFFFFFFFFFFFFFFCLL) + 4;
        if ((a4 | 3) != 0xB)
          v15 = a4 | 3;
        v14 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v15 + 1);
        __p[1] = (void *)a4;
        v32 = v16 | 0x8000000000000000;
        __p[0] = v14;
      }
      else
      {
        HIBYTE(v32) = a4;
        v14 = __p;
        if (!a4)
          goto LABEL_18;
      }
      memmove(v14, __src, 2 * a4);
LABEL_18:
      *((_WORD *)v14 + a4) = 0;
      *(_OWORD *)a1 = *(_OWORD *)__p;
      *(_QWORD *)(a1 + 16) = v32;
      *(_BYTE *)(a1 + 24) = 1;
      return;
    }
    v13 = *(unsigned __int8 *)(i + 23);
    if ((v13 & 0x80u) != 0)
      v13 = *(_QWORD *)(i + 8);
    if (v13)
      break;
  }
  isAllUpperCase = morphun::util::StringViewUtils::isAllUpperCase((uint64_t)__src, a4);
  if ((isAllUpperCase & 1) != 0
    || (morphun::dialog::DictionaryLookupInflector::inflectWord(a1, a2, __src, a4, a5, a6), !*(_BYTE *)(a1 + 24)))
  {
    morphun::util::ULocale::ULocale((morphun::util::ULocale *)__p, (const morphun::util::ULocale *)(a2 + 24));
    v28 = 0;
    v29 = 0;
    v30 = 0;
    morphun::util::StringViewUtils::lowercase((uint64_t)&v28, (const UChar *)__src, a4, (uint64_t)__p);
    if (v30 >= 0)
      v18 = &v28;
    else
      v18 = v28;
    if (v30 >= 0)
      v19 = HIBYTE(v30);
    else
      v19 = v29;
    morphun::dialog::DictionaryLookupInflector::inflectWord((uint64_t)&v26, a2, v18, v19, a5, a6);
    if (v27)
    {
      if (isAllUpperCase)
      {
        memset(&__str, 0, sizeof(__str));
        if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v20 = &v26;
        else
          v20 = (std::basic_string<char16_t> *)v26.__r_.__value_.__r.__words[0];
        if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v21 = HIBYTE(v26.__r_.__value_.__r.__words[2]);
        else
          v21 = v26.__r_.__value_.__r.__words[1];
        morphun::util::StringViewUtils::uppercase((uint64_t)&__str, (const UChar *)v20, v21, (uint64_t)__p);
        if (v27)
        {
          std::basic_string<char16_t>::operator=(&v26, &__str);
        }
        else
        {
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
            std::basic_string<char16_t>::__init_copy_ctor_external(&v26, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
          else
            v26 = __str;
          v27 = 1;
        }
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__str.__r_.__value_.__l.__data_);
      }
      else
      {
        v22 = morphun::util::StringViewUtils::codePointAt((uint64_t)__src, a4, 0);
        if (u_isupper(v22))
        {
          if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v23 = &v26;
          else
            v23 = (std::basic_string<char16_t> *)v26.__r_.__value_.__r.__words[0];
          if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
          else
            size = v26.__r_.__value_.__l.__size_;
          morphun::util::StringViewUtils::capitalizeFirst((UChar *)v23, size, (uint64_t)__p, (uint64_t)&__str);
          if (v27)
          {
            if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v26.__r_.__value_.__l.__data_);
            v26 = __str;
          }
          else
          {
            v26 = __str;
            v27 = 1;
          }
        }
      }
      *(_BYTE *)a1 = 0;
      *(_BYTE *)(a1 + 24) = 0;
      if (v27)
      {
        *(std::basic_string<char16_t> *)a1 = v26;
        *(_BYTE *)(a1 + 24) = 1;
      }
    }
    else
    {
      *(_BYTE *)a1 = 0;
      *(_BYTE *)(a1 + 24) = 0;
    }
    if (SHIBYTE(v30) < 0)
      operator delete(v28);
  }
}

void sub_1CB5AA09C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (a22 && a21 < 0)
    operator delete(__p);
  if (a29 < 0)
    operator delete(a24);
  _Unwind_Resume(a1);
}

void morphun::grammar::synthesis::HeGrammarSynthesizer_WithConditionalHyphen::~HeGrammarSynthesizer_WithConditionalHyphen(morphun::grammar::synthesis::HeGrammarSynthesizer_WithConditionalHyphen *this)
{
  JUMPOUT(0x1D179D2ECLL);
}

_QWORD *morphun::grammar::synthesis::HeGrammarSynthesizer_WithConditionalHyphen::getFeatureValue(uint64_t a1, uint64_t a2)
{
  morphun::dictionary::PhraseProperties *v2;
  morphun::lang::StringFilterUtil *v3;
  _QWORD *v4;
  char isStartsWithUnicodeSets;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD v9[5];
  std::basic_string<char16_t> __p;
  uint64_t (**v11)(morphun::dialog::SpeakableString *__hidden);
  std::basic_string<char16_t> v12;
  uint64_t v13;

  v2 = (morphun::dictionary::PhraseProperties *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
  v3 = (morphun::lang::StringFilterUtil *)morphun::dictionary::PhraseProperties::DEFAULT_MATCHABLE_SET(v2);
  v4 = (_QWORD *)morphun::lang::StringFilterUtil::HEBREW_SCRIPT(v3);
  v11 = 0;
  *(_OWORD *)&v12.__r_.__value_.__l.__data_ = 0uLL;
  isStartsWithUnicodeSets = morphun::dictionary::PhraseProperties::isStartsWithUnicodeSets((uint64_t)v2, v3, v4, (uint64_t **)&v11);
  v6 = (_QWORD *)operator new();
  v7 = v6;
  if ((isStartsWithUnicodeSets & 1) != 0)
  {
    morphun::dialog::SpeakableString::SpeakableString(v6, (__int128 *)v2);
  }
  else
  {
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__p, "-");
    v11 = &off_1E866AD28;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      std::basic_string<char16_t>::__init_copy_ctor_external(&v12, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    else
      v12 = __p;
    v13 = 0;
    morphun::dialog::SpeakableString::SpeakableString(v9, (__int128 *)v2);
    morphun::dialog::SpeakableString::operator+((uint64_t)&v11, (uint64_t)v9, v7);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v7;
}

void sub_1CB5AA26C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  uint64_t v21;

  if (a20 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v21, 0x10B3C40F7FF9C27);
  _Unwind_Resume(a1);
}

_QWORD *mddmd_getCombinedBinaryType(uint64_t a1, uint64_t a2, const __CFString *a3)
{
  std::basic_string<char16_t> *p_p;
  std::basic_string<char16_t>::size_type size;
  _QWORD *CombinedBinaryType;
  std::basic_string<char16_t> __p;

  npc<morphun::dictionary::DictionaryMetaData const>(a1);
  morphun::util::CFUtils::to_u16string(&__p, a3);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::basic_string<char16_t> *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  CombinedBinaryType = morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(a1, a2, (const UChar *)p_p, size);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return CombinedBinaryType;
}

void sub_1CB5AA36C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  const std::exception *v15;
  const void **v18;
  __CFError **v19;

  if (a15 < 0)
    operator delete(__p);
  if (a2 == 1)
  {
    v18 = (const void **)__cxa_begin_catch(exception_object);
    morphun::util::CFUtils::convert(v18, v15, v19);
    __cxa_end_catch();
    JUMPOUT(0x1CB5AA350);
  }
  _Unwind_Resume(exception_object);
}

void sub_1CB5AA410(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

CFArrayRef mddmd_createPropertyNames(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  morphun::dictionary::DictionaryMetaData_MMappedDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  CFIndex v10;
  const UniChar *v11;
  CFStringRef v12;
  CFStringRef v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  CFStringRef *v19;
  const __CFString *v20;
  CFArrayRef v21;
  CFTypeRef *v22;
  uint64_t v24;
  uint64_t v25;
  void **v26;

  v3 = npc<morphun::dictionary::DictionaryMetaData const>(a1);
  v4 = (morphun::dictionary::DictionaryMetaData_MMappedDictionary *)npc<morphun::dictionary::DictionaryMetaData_MMappedDictionary>(*(_QWORD *)(v3 + 8));
  morphun::dictionary::DictionaryMetaData_MMappedDictionary::getTypesOfValues(v4, a2, &v24);
  v5 = v24;
  v6 = v25;
  if (v24 == v25)
  {
    v7 = 0;
    v14 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      if (*(char *)(v5 + 23) < 0)
      {
        v11 = *(const UniChar **)v5;
        v10 = *(_QWORD *)(v5 + 8);
      }
      else
      {
        v10 = *(unsigned __int8 *)(v5 + 23);
        v11 = (const UniChar *)v5;
      }
      v12 = CFStringCreateWithCharacters(0, v11, v10);
      v13 = v12;
      if (v8 >= v9)
      {
        v15 = (v8 - v7) >> 3;
        v16 = v15 + 1;
        if ((unint64_t)(v15 + 1) >> 61)
          std::vector<std::pair<morphun::dialog::DefaultArticleLookupFunction const*,std::vector<std::pair<std::basic_string<char16_t>,std::vector<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>> const>>::__throw_length_error[abi:ne180100]();
        if ((v9 - v7) >> 2 > v16)
          v16 = (v9 - v7) >> 2;
        if ((unint64_t)(v9 - v7) >= 0x7FFFFFFFFFFFFFF8)
          v17 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v17 = v16;
        if (v17)
        {
          if (v17 >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v18 = (char *)operator new(8 * v17);
        }
        else
        {
          v18 = 0;
        }
        v19 = (CFStringRef *)&v18[8 * v15];
        *v19 = v13;
        v14 = (char *)(v19 + 1);
        while (v8 != v7)
        {
          v20 = (const __CFString *)*((_QWORD *)v8 - 1);
          v8 -= 8;
          *--v19 = v20;
        }
        v9 = &v18[8 * v17];
        if (v7)
          operator delete(v7);
        v7 = (char *)v19;
      }
      else
      {
        *(_QWORD *)v8 = v12;
        v14 = v8 + 8;
      }
      v5 += 24;
      v8 = v14;
    }
    while (v5 != v6);
  }
  v21 = CFArrayCreate(0, (const void **)v7, (v14 - v7) >> 3, MEMORY[0x1E0C9B378]);
  if (v7 != v14)
  {
    v22 = (CFTypeRef *)v7;
    do
      CFRelease(*v22++);
    while (v22 != (CFTypeRef *)v14);
  }
  if (v7)
    operator delete(v7);
  v26 = (void **)&v24;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v26);
  return v21;
}

void sub_1CB5AA5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::exception *a10, char a11, uint64_t a12, uint64_t a13, char *a14)
{
  void *v14;
  const void **v17;
  __CFError **v18;

  if (v14)
    operator delete(v14);
  a14 = &a11;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a14);
  if (a2 == 1)
  {
    v17 = (const void **)__cxa_begin_catch(a1);
    morphun::util::CFUtils::convert(v17, a10, v18);
    __cxa_end_catch();
    JUMPOUT(0x1CB5AA5B0);
  }
  _Unwind_Resume(a1);
}

CFStringRef mddmd_createPropertyName(uint64_t a1, uint64_t a2)
{
  morphun::dictionary::DictionaryMetaData *v3;
  void **v4;
  CFIndex v5;
  CFStringRef v6;
  void *__p[2];
  unsigned __int8 v9;

  v3 = (morphun::dictionary::DictionaryMetaData *)npc<morphun::dictionary::DictionaryMetaData const>(a1);
  morphun::dictionary::DictionaryMetaData::getPropertyName(v3, (int8x8_t)a2, (uint64_t)__p);
  if ((v9 & 0x80u) == 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  if ((v9 & 0x80u) == 0)
    v5 = v9;
  else
    v5 = (CFIndex)__p[1];
  v6 = CFStringCreateWithCharacters(0, (const UniChar *)v4, v5);
  if ((char)v9 < 0)
    operator delete(__p[0]);
  return v6;
}

void sub_1CB5AA6D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  const std::exception *v15;
  const void **v18;
  __CFError **v19;

  if (a15 < 0)
    operator delete(__p);
  if (a2 == 1)
  {
    v18 = (const void **)__cxa_begin_catch(exception_object);
    morphun::util::CFUtils::convert(v18, v15, v19);
    __cxa_end_catch();
    JUMPOUT(0x1CB5AA6C0);
  }
  _Unwind_Resume(exception_object);
}

BOOL mddmd_isKnownWord(uint64_t a1, const __CFString *a2)
{
  std::basic_string<char16_t> *p_p;
  std::basic_string<char16_t>::size_type size;
  _BOOL8 v6;
  std::basic_string<char16_t> __p;
  uint64_t v9;

  npc<morphun::dictionary::DictionaryMetaData const>(a1);
  morphun::util::CFUtils::to_u16string(&__p, a2);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::basic_string<char16_t> *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v9 = 0;
  v6 = morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(a1, (uint64_t)&v9, (const UChar *)p_p, size) != 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v6;
}

void sub_1CB5AA7C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  const std::exception *v14;
  const void **v17;
  __CFError **v18;

  if (a14 < 0)
    operator delete(__p);
  if (a2 == 1)
  {
    v17 = (const void **)__cxa_begin_catch(exception_object);
    morphun::util::CFUtils::convert(v17, v14, v18);
    __cxa_end_catch();
    JUMPOUT(0x1CB5AA7A8);
  }
  _Unwind_Resume(exception_object);
}

uint64_t mddmd_getBinaryProperties(uint64_t a1, const __CFArray *a2)
{
  CFIndex Count;
  CFIndex i;
  const __CFString *ValueAtIndex;
  _OWORD *v7;
  __int128 v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __int128 v14;
  char *v15;
  uint64_t BinaryProperties;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  std::basic_string<char16_t> __p;
  void **v22[5];

  npc<morphun::dictionary::DictionaryMetaData const>(a1);
  v18 = 0;
  v19 = 0;
  v20 = 0;
  Count = CFArrayGetCount(a2);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a2, i);
      morphun::util::CFUtils::to_u16string(&__p, ValueAtIndex);
      v7 = v19;
      if ((unint64_t)v19 >= v20)
      {
        v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v19[-v18] >> 3);
        v10 = v9 + 1;
        if (v9 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<std::pair<morphun::dialog::DefaultArticleLookupFunction const*,std::vector<std::pair<std::basic_string<char16_t>,std::vector<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>> const>>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * ((uint64_t)(v20 - v18) >> 3) > v10)
          v10 = 0x5555555555555556 * ((uint64_t)(v20 - v18) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v20 - v18) >> 3) >= 0x555555555555555)
          v11 = 0xAAAAAAAAAAAAAAALL;
        else
          v11 = v10;
        v22[4] = (void **)&v20;
        if (v11)
          v11 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<std::basic_string<char16_t>>>>(v11);
        else
          v12 = 0;
        v13 = v11 + 24 * v9;
        v22[0] = (void **)v11;
        v22[1] = (void **)v13;
        v22[3] = (void **)(v11 + 24 * v12);
        v14 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *(_QWORD *)(v13 + 16) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
        *(_OWORD *)v13 = v14;
        memset(&__p, 0, sizeof(__p));
        v22[2] = (void **)(v13 + 24);
        std::vector<std::basic_string<char16_t>>::__swap_out_circular_buffer(&v18, v22);
        v15 = v19;
        std::__split_buffer<std::basic_string<char16_t>>::~__split_buffer((uint64_t)v22);
        v19 = v15;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
      }
      else
      {
        v8 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *((_QWORD *)v19 + 2) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
        *v7 = v8;
        v19 = (char *)v7 + 24;
      }
    }
  }
  BinaryProperties = morphun::dictionary::DictionaryMetaData::getBinaryProperties(a1, &v18);
  v22[0] = (void **)&v18;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](v22);
  return BinaryProperties;
}

void sub_1CB5AA9D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::exception *a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19)
{
  const void **v21;
  __CFError **v22;

  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  if (a2 == 1)
  {
    v21 = (const void **)__cxa_begin_catch(a1);
    morphun::util::CFUtils::convert(v21, a9, v22);
    __cxa_end_catch();
    JUMPOUT(0x1CB5AA9A8);
  }
  _Unwind_Resume(a1);
}

_QWORD *mddmd_getDictionary(__CFLocale *a1)
{
  const morphun::util::ULocale *v1;
  _QWORD *Dictionary;
  void *v4[16];

  morphun::util::CFUtils::convert((morphun::util::CFUtils *)v4, a1);
  Dictionary = morphun::dictionary::DictionaryMetaData::createDictionary((morphun::dictionary::DictionaryMetaData *)v4, v1);
  npc<morphun::dictionary::DictionaryMetaData const>((uint64_t)Dictionary);
  return Dictionary;
}

void sub_1CB5AAAC4(_Unwind_Exception *exception_object, int a2)
{
  const std::exception *v2;
  const void **v3;
  __CFError **v4;

  if (a2 == 1)
  {
    v3 = (const void **)__cxa_begin_catch(exception_object);
    morphun::util::CFUtils::convert(v3, v2, v4);
    __cxa_end_catch();
    JUMPOUT(0x1CB5AAAACLL);
  }
  _Unwind_Resume(exception_object);
}

void morphun::grammar::synthesis::TrGrammarSynthesizer_DeConjunctionArticleLookupFunction::~TrGrammarSynthesizer_DeConjunctionArticleLookupFunction(morphun::grammar::synthesis::TrGrammarSynthesizer_DeConjunctionArticleLookupFunction *this)
{
  JUMPOUT(0x1D179D2ECLL);
}

_QWORD *morphun::grammar::synthesis::TrGrammarSynthesizer_DeConjunctionArticleLookupFunction::getFeatureValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t *v4;
  int v5;
  const UChar *v6;
  uint64_t v7;
  const std::basic_string<char16_t>::value_type *v8;
  _QWORD *v9;
  morphun::exception::NullPointerException *exception;
  uint64_t (**v12)(morphun::dialog::SpeakableString *__hidden);
  std::basic_string<char16_t> v13;
  uint64_t v14;
  _QWORD v15[5];
  std::basic_string<char16_t> v16;

  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
  memset(&v16, 0, sizeof(v16));
  v4 = *(uint64_t **)(a1 + 24);
  if (!v4)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  v5 = *(char *)(v3 + 23);
  if (v5 >= 0)
    v6 = (const UChar *)v3;
  else
    v6 = *(const UChar **)v3;
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v3 + 23);
  else
    v7 = *(_QWORD *)(v3 + 8);
  if (morphun::grammar::synthesis::TrGrammarSynthesizer_TrDisplayFunction::getVowelGroup(v4, v6, v7) >= 2)
    v8 = L" da";
  else
    v8 = L" de";
  std::basic_string<char16_t>::append(&v16, v8, 3uLL);
  v9 = (_QWORD *)operator new();
  morphun::dialog::SpeakableString::SpeakableString(v15, (__int128 *)v3);
  v12 = &off_1E866AD28;
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    std::basic_string<char16_t>::__init_copy_ctor_external(&v13, v16.__r_.__value_.__l.__data_, v16.__r_.__value_.__l.__size_);
  else
    v13 = v16;
  v14 = 0;
  morphun::dialog::SpeakableString::operator+((uint64_t)v15, (uint64_t)&v12, v9);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  return v9;
}

void sub_1CB5AAC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  uint64_t v8;
  va_list va;

  va_start(va, a7);
  MEMORY[0x1D179D2EC](v7, 0x10B3C40F7FF9C27);
  if (*(char *)(v8 - 17) < 0)
    operator delete(*(void **)(v8 - 40));
  _Unwind_Resume(a1);
}

void morphun::grammar::synthesis::NlGrammarSynthesizer_NlNounInflectionPattern::~NlGrammarSynthesizer_NlNounInflectionPattern(morphun::grammar::synthesis::NlGrammarSynthesizer_NlNounInflectionPattern *this)
{
  JUMPOUT(0x1D179D2ECLL);
}

BOOL morphun::grammar::synthesis::NlGrammarSynthesizer_NlNounInflectionPattern::isSupported(uint64_t *a1, const void **a2, uint64_t a3)
{
  std::basic_string<char16_t>::size_type size;
  std::basic_string<char16_t> __p;

  if (((*(uint64_t (**)(uint64_t *))(*a1 + 48))(a1) & 1) == 0)
  {
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__p, (char *)L"not a noun or not in dictionary");
    morphun::grammar::synthesis::NlGrammarSynthesizer_NlInflectionPattern::logUnsupportedInflection(a2, (uint64_t)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    return 0;
  }
  if (!*(_QWORD *)(a3 + 16))
    return 0;
  morphun::grammar::synthesis::GrammarSynthesizerUtil::getFeatureValue(&__p, a3, a1[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    return size != 0;
  }
  return size != 0;
}

void sub_1CB5AADE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void morphun::grammar::synthesis::NlGrammarSynthesizer_NlNounInflectionPattern::inflect(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  morphun::grammar::synthesis::GrammemeConstants *v8;
  morphun::grammar::synthesis::GrammemeConstants *CombinedBinaryType;
  uint64_t v10;
  int v11;
  int v12;
  std::basic_string<char16_t>::size_type size;
  std::basic_string<char16_t> *p_p;
  morphun::grammar::synthesis::GrammemeConstants *v15;
  uint64_t v16;
  int v17;
  const std::basic_string<char16_t>::value_type *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  std::basic_string<char16_t> *v25;
  unsigned __int16 *v26;
  uint64_t v27;
  int v28;
  const UChar *v29;
  uint64_t v30;
  uint64_t v31;
  int v33;
  const UChar *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  __int16 KeyId;
  int v42;
  const UChar *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  char *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _OWORD v52[3];
  char v53;
  uint64_t v54[3];
  std::basic_string<char16_t> __p;
  void **v56;
  char v57;
  _BYTE __dst[32];
  __int128 v59;
  std::basic_string<char16_t> v60;
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (((*(uint64_t (**)(uint64_t *))(*a1 + 24))(a1) & 1) == 0)
  {
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
    return;
  }
  morphun::grammar::synthesis::GrammarSynthesizerUtil::getFeatureValue(&__p, a3, a1[2]);
  *(_QWORD *)((char *)&v61 + 7) = 0;
  *(_QWORD *)&v61 = 0;
  if (*(_QWORD *)(a3 + 16) != 1)
    goto LABEL_48;
  CombinedBinaryType = (morphun::grammar::synthesis::GrammemeConstants *)morphun::grammar::synthesis::GrammemeConstants::NUMBER_SINGULAR(v8);
  v10 = *((unsigned __int8 *)CombinedBinaryType + 23);
  v11 = (char)v10;
  if ((v10 & 0x80u) != 0)
    v10 = *((_QWORD *)CombinedBinaryType + 1);
  v12 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  if (v10 == size)
  {
    if (v10)
    {
      p_p = (std::basic_string<char16_t> *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      if (v11 >= 0)
        v15 = CombinedBinaryType;
      else
        v15 = *(morphun::grammar::synthesis::GrammemeConstants **)CombinedBinaryType;
      while ((unsigned __int16)p_p->__r_.__value_.__s.__data_[0] == *(unsigned __int16 *)v15)
      {
        v15 = (morphun::grammar::synthesis::GrammemeConstants *)((char *)v15 + 2);
        p_p = (std::basic_string<char16_t> *)((char *)p_p + 2);
        if (!--v10)
          goto LABEL_17;
      }
    }
    else
    {
LABEL_17:
      v16 = a1[4];
      v17 = *(char *)(a2 + 23);
      if (v17 >= 0)
        v18 = (const std::basic_string<char16_t>::value_type *)a2;
      else
        v18 = *(const std::basic_string<char16_t>::value_type **)a2;
      if (v17 >= 0)
        v19 = *(unsigned __int8 *)(a2 + 23);
      else
        v19 = *(_QWORD *)(a2 + 8);
      v20 = a1[8];
      *(_QWORD *)&v52[0] = 0;
      CombinedBinaryType = (morphun::grammar::synthesis::GrammemeConstants *)morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(v16, (uint64_t)v52, (const UChar *)v18, v19);
      if (CombinedBinaryType)
        v21 = (*(_QWORD *)&v52[0] & v20) == v20;
      else
        v21 = 0;
      if (v21)
        goto LABEL_82;
    }
  }
  v22 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL(CombinedBinaryType);
  v23 = *(unsigned __int8 *)(v22 + 23);
  v24 = (char)v23;
  if ((v23 & 0x80u) != 0)
    v23 = *(_QWORD *)(v22 + 8);
  if (v23 != size)
    goto LABEL_48;
  if (size)
  {
    v25 = (std::basic_string<char16_t> *)__p.__r_.__value_.__r.__words[0];
    if (v12 >= 0)
      v25 = &__p;
    if (v24 >= 0)
      v26 = (unsigned __int16 *)v22;
    else
      v26 = *(unsigned __int16 **)v22;
    while ((unsigned __int16)v25->__r_.__value_.__s.__data_[0] == *v26)
    {
      ++v26;
      v25 = (std::basic_string<char16_t> *)((char *)v25 + 2);
      if (!--size)
        goto LABEL_38;
    }
    goto LABEL_48;
  }
LABEL_38:
  v27 = a1[4];
  v28 = *(char *)(a2 + 23);
  v29 = v28 >= 0 ? (const UChar *)a2 : *(const UChar **)a2;
  v30 = v28 >= 0 ? *(unsigned __int8 *)(a2 + 23) : *(_QWORD *)(a2 + 8);
  v31 = a1[9];
  *(_QWORD *)&v52[0] = 0;
  if (!morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(v27, (uint64_t)v52, v29, v30)
    || (*(_QWORD *)&v52[0] & v31) != v31)
  {
LABEL_48:
    v33 = *(char *)(a2 + 23);
    if (v33 >= 0)
      v34 = (const UChar *)a2;
    else
      v34 = *(const UChar **)a2;
    if (v33 >= 0)
      v35 = *(unsigned __int8 *)(a2 + 23);
    else
      v35 = *(_QWORD *)(a2 + 8);
    morphun::dictionary::DictionaryMetaData::getPropertyValues(a1[4], v34, v35, (unsigned __int16 *)"i", 0xAuLL, v54);
    v36 = v54[0];
    if (v54[0] == v54[1])
    {
      v39 = 0;
      v40 = 0;
    }
    else
    {
      v37 = a1[7];
      if (*(char *)(v54[0] + 23) < 0)
      {
        v36 = *(_QWORD *)v54[0];
        v38 = *(_QWORD *)(v54[0] + 8);
      }
      else
      {
        LODWORD(v38) = *(unsigned __int8 *)(v54[0] + 23);
      }
      KeyId = morphun::dictionary::metadata::MarisaTrie<int>::getKeyId((marisa::Trie *)(v37 + 248), v36, v38);
      morphun::dictionary::Inflector_MMappedDictionary::getInflectionPattern((morphun::dictionary::Inflector_MMappedDictionary *)__dst, v37 + 8, KeyId);
      v52[0] = *(_OWORD *)__dst;
      v52[1] = *(_OWORD *)&__dst[16];
      v52[2] = v59;
      v53 = 1;
      v51 = 0;
      v42 = *(char *)(a2 + 23);
      if (v42 >= 0)
        v43 = (const UChar *)a2;
      else
        v43 = *(const UChar **)a2;
      if (v42 >= 0)
        v44 = *(unsigned __int8 *)(a2 + 23);
      else
        v44 = *(_QWORD *)(a2 + 8);
      morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(a1[4], (uint64_t)&v51, v43, v44);
      v50 = 0;
      v45 = a1[4];
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        std::basic_string<char16_t>::__init_copy_ctor_external(&v60, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      else
        v60 = __p;
      memset(__dst, 0, 24);
      v56 = (void **)__dst;
      v57 = 0;
      *(_QWORD *)__dst = operator new(0x18uLL);
      *(_QWORD *)&__dst[8] = *(_QWORD *)__dst;
      *(_QWORD *)&__dst[16] = *(_QWORD *)__dst + 24;
      *(_QWORD *)&__dst[8] = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&__dst[16], (__int128 *)&v60, &v61, *(std::basic_string<char16_t> **)__dst);
      morphun::dictionary::DictionaryMetaData::getBinaryProperties(v45, &v50, (uint64_t *)__dst);
      v56 = (void **)__dst;
      std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v56);
      if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v60.__r_.__value_.__l.__data_);
      v46 = *(char *)(a2 + 23);
      if (v46 >= 0)
        v47 = (char *)a2;
      else
        v47 = *(char **)a2;
      if (v46 >= 0)
        v48 = *(unsigned __int8 *)(a2 + 23);
      else
        v48 = *(_QWORD *)(a2 + 8);
      morphun::dictionary::Inflector_InflectionPattern::reinflect(__dst, (uint64_t)v52, v51, v50, v47, v48);
      *(_QWORD *)&v61 = *(_QWORD *)&__dst[8];
      v40 = *(_QWORD *)__dst;
      *(_QWORD *)((char *)&v61 + 7) = *(_QWORD *)&__dst[15];
      v39 = __dst[23];
    }
    v49 = v61;
    *(_QWORD *)a4 = v40;
    *(_QWORD *)(a4 + 8) = v49;
    *(_QWORD *)(a4 + 15) = *(_QWORD *)((char *)&v61 + 7);
    *(_BYTE *)(a4 + 23) = v39;
    *(_QWORD *)&v52[0] = v54;
    std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)v52);
    LOBYTE(v12) = *((_BYTE *)&__p.__r_.__value_.__s + 23);
    goto LABEL_79;
  }
LABEL_82:
  if (*(char *)(a2 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)a4, *(const std::basic_string<char16_t>::value_type **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)a4 = *(_OWORD *)a2;
    *(_QWORD *)(a4 + 16) = *(_QWORD *)(a2 + 16);
  }
LABEL_79:
  if ((v12 & 0x80) != 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_1CB5AB20C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  a11 = &a19;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a11);
  if (a27 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

morphun::grammar::synthesis::NlGrammarSynthesizer_NlNounInflectionPattern *morphun::grammar::synthesis::NlGrammarSynthesizer_NlNounInflectionPattern::NlGrammarSynthesizer_NlNounInflectionPattern(morphun::grammar::synthesis::NlGrammarSynthesizer_NlNounInflectionPattern *this, const morphun::dialog::SemanticFeatureModel *a2)
{
  morphun::grammar::synthesis::NlGrammarSynthesizer_NlInflectionPattern *v3;
  morphun::dictionary::Inflector *v4;
  const morphun::util::ULocale *v5;
  morphun::grammar::synthesis::GrammemeConstants *Inflector;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t *BinaryProperties;
  morphun::grammar::synthesis::GrammemeConstants *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t *v15;
  std::basic_string<char16_t> *v17;
  std::basic_string<char16_t> *v18;
  std::basic_string<char16_t> *v19;
  std::basic_string<char16_t> **v20;
  char v21;
  std::basic_string<char16_t> v22;
  __int128 v23;

  *(_QWORD *)&v23 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)this = &off_1E865E160;
  v3 = morphun::grammar::synthesis::NlGrammarSynthesizer_NlInflectionPattern::NlGrammarSynthesizer_NlInflectionPattern(this, (const morphun::dialog::SemanticFeatureModel *)&off_1E8668728, (uint64_t)a2);
  *(_QWORD *)this = &off_1E866F538;
  v4 = (morphun::dictionary::Inflector *)morphun::util::LocaleUtils::DUTCH(v3);
  Inflector = (morphun::grammar::synthesis::GrammemeConstants *)morphun::dictionary::Inflector::getInflector(v4, v5);
  *((_QWORD *)this + 7) = Inflector;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  v7 = *((_QWORD *)this + 4);
  v8 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_SINGULAR(Inflector);
  if (*(char *)(v8 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v22, *(const std::basic_string<char16_t>::value_type **)v8, *(_QWORD *)(v8 + 8));
  }
  else
  {
    v9 = *(_OWORD *)v8;
    v22.__r_.__value_.__r.__words[2] = *(_QWORD *)(v8 + 16);
    *(_OWORD *)&v22.__r_.__value_.__l.__data_ = v9;
  }
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = &v17;
  v21 = 0;
  v17 = (std::basic_string<char16_t> *)operator new(0x18uLL);
  v18 = v17;
  v19 = v17 + 1;
  v18 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v19, (__int128 *)&v22, &v23, v17);
  BinaryProperties = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v7, (uint64_t *)this + 8, (uint64_t *)&v17);
  morphun::util::Validate::notNull<long long>((uint64_t)BinaryProperties);
  v20 = &v17;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v20);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
  v12 = *((_QWORD *)this + 4);
  v13 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL(v11);
  if (*(char *)(v13 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v22, *(const std::basic_string<char16_t>::value_type **)v13, *(_QWORD *)(v13 + 8));
  }
  else
  {
    v14 = *(_OWORD *)v13;
    v22.__r_.__value_.__r.__words[2] = *(_QWORD *)(v13 + 16);
    *(_OWORD *)&v22.__r_.__value_.__l.__data_ = v14;
  }
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = &v17;
  v21 = 0;
  v17 = (std::basic_string<char16_t> *)operator new(0x18uLL);
  v18 = v17;
  v19 = v17 + 1;
  v18 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v19, (__int128 *)&v22, &v23, v17);
  v15 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v12, (uint64_t *)this + 9, (uint64_t *)&v17);
  morphun::util::Validate::notNull<long long>((uint64_t)v15);
  v20 = &v17;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v20);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
  return this;
}

void sub_1CB5AB494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a13);
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void morphun::analysis::filter::DiacriticFilter::~DiacriticFilter(morphun::analysis::filter::DiacriticFilter *this)
{
  morphun::analysis::TokenFilter::~TokenFilter(this, (uint64_t *)&off_1E8669678);
}

{
  morphun::analysis::TokenFilter::~TokenFilter(this, (uint64_t *)&off_1E8669678);
  JUMPOUT(0x1D179D2ECLL);
}

void sub_1CB5AB578(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

morphun::analysis::filter::DiacriticFilter *morphun::analysis::filter::DiacriticFilter::DiacriticFilter(morphun::analysis::filter::DiacriticFilter *this, morphun::analysis::TokenStream *a2, const morphun::util::ULocale *a3)
{
  morphun::analysis::util::AttributeSource *v6;
  const morphun::util::ULocale *v7;
  uint64_t v8;
  morphun::lang::StringFilterUtil *NfdVolatileForeignExemplarCharacters;
  uint64_t v10;

  *(_QWORD *)this = &off_1E866A910;
  v6 = morphun::analysis::util::AttributeSource::AttributeSource(this, (morphun::analysis::util::AttributeSource *)&off_1E8669688, (uint64_t)a2);
  *(_QWORD *)v6 = &off_1E8672308;
  *((_QWORD *)v6 + 13) = 0;
  *((_QWORD *)v6 + 14) = 0;
  *((_QWORD *)v6 + 12) = a2;
  v8 = *((unsigned __int8 *)a3 + 127);
  if ((v8 & 0x80u) != 0)
    v8 = *((_QWORD *)a3 + 14);
  if (v8)
    NfdVolatileForeignExemplarCharacters = morphun::lang::StringFilterUtil::getNfdVolatileForeignExemplarCharacters(a3, v7);
  else
    NfdVolatileForeignExemplarCharacters = (morphun::lang::StringFilterUtil *)morphun::lang::StringFilterUtil::NFD_VOLATILE_CHARACTERS(v6);
  *((_QWORD *)this + 15) = NfdVolatileForeignExemplarCharacters;
  v10 = *((unsigned __int8 *)a3 + 127);
  if ((v10 & 0x80u) != 0)
    v10 = *((_QWORD *)a3 + 14);
  *((_BYTE *)this + 128) = v10 == 0;
  *((_QWORD *)this + 13) = morphun::analysis::util::AttributeSource::addAttribute<morphun::analysis::tokenattributes::CharTermAttribute>((uint64_t)this);
  return this;
}

void sub_1CB5AB644(_Unwind_Exception *a1)
{
  morphun::analysis::TokenFilter *v1;

  morphun::analysis::TokenFilter::~TokenFilter(v1, (uint64_t *)&off_1E8669678);
  _Unwind_Resume(a1);
}

void morphun::grammar::synthesis::NbGrammarSynthesizer::addSemanticFeatures(morphun::grammar::synthesis::NbGrammarSynthesizer *this, morphun::dialog::SemanticFeatureModel *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  morphun::dictionary::DictionaryMetaData *v14;
  const morphun::util::ULocale *v15;
  morphun::util::LocaleUtils *Dictionary;
  morphun::dictionary::Inflector *v17;
  const morphun::util::ULocale *v18;
  morphun::util::LocaleUtils *Inflector;
  morphun::TokenizerFactory *v20;
  const morphun::util::ULocale *v21;
  morphun::Tokenizer *Tokenizer;
  morphun::grammar::synthesis::GrammemeConstants *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t i;
  uint64_t v31;
  uint64_t *BinaryProperties;
  uint64_t v33;
  uint64_t *v34;
  _QWORD *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  morphun::util::LocaleUtils *v48;
  morphun::grammar::synthesis::GrammemeConstants *v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t j;
  morphun::util::LocaleUtils *v55;
  morphun::grammar::synthesis::GrammemeConstants *v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  uint64_t k;
  morphun::util::LocaleUtils *v64;
  morphun::grammar::synthesis::GrammemeConstants *v65;
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  __int128 v69;
  uint64_t m;
  morphun::exception::NullPointerException *exception;
  void *__p[2];
  char v73;
  void *v74[2];
  char v75;
  __int128 v76;
  uint64_t v77;
  std::basic_string<char16_t> __dst;
  std::basic_string<char16_t> v79;
  std::basic_string<char16_t> v80;
  __int128 v81;
  std::basic_string<char16_t> *v82;
  uint64_t v83;
  __int128 v84;

  *(_QWORD *)&v84 = *MEMORY[0x1E0C80C00];
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"defArticle");
  v3 = (_QWORD *)operator new();
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v81 + 1, "d");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v76, "d");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v74, "d");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"de");
  morphun::grammar::synthesis::NbGrammarSynthesizer_ArticleLookupFunction::NbGrammarSynthesizer_ArticleLookupFunction((uint64_t)v3, (uint64_t)this, 0, (__int128 *)((char *)&v81 + 8), &v76, (__int128 *)v74, (__int128 *)__p);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)this, (unsigned __int16 *)&__dst, (morphun::dialog::DefaultFeatureFunction *)((char *)v3 + *(_QWORD *)(*v3 - 56)));
  if (v73 < 0)
    operator delete(__p[0]);
  if (v75 < 0)
    operator delete(v74[0]);
  if (SHIBYTE(v77) < 0)
    operator delete((void *)v76);
  if (SHIBYTE(v83) < 0)
    operator delete(*((void **)&v81 + 1));
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "w");
  v4 = (_QWORD *)operator new();
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v81 + 1, "d");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v76, "d");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v74, "d");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"de");
  morphun::grammar::synthesis::NbGrammarSynthesizer_ArticleLookupFunction::NbGrammarSynthesizer_ArticleLookupFunction((uint64_t)v4, (uint64_t)this, 1, (__int128 *)((char *)&v81 + 8), &v76, (__int128 *)v74, (__int128 *)__p);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)this, (unsigned __int16 *)&__dst, (morphun::dialog::DefaultFeatureFunction *)((char *)v4 + *(_QWORD *)(*v4 - 56)));
  if (v73 < 0)
    operator delete(__p[0]);
  if (v75 < 0)
    operator delete(v74[0]);
  if (SHIBYTE(v77) < 0)
    operator delete((void *)v76);
  if (SHIBYTE(v83) < 0)
    operator delete(*((void **)&v81 + 1));
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "i");
  v5 = (_QWORD *)operator new();
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v81 + 1, (char *)L"en");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v76, "e");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v74, "e");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"flere");
  morphun::grammar::synthesis::NbGrammarSynthesizer_ArticleLookupFunction::NbGrammarSynthesizer_ArticleLookupFunction((uint64_t)v5, (uint64_t)this, 0, (__int128 *)((char *)&v81 + 8), &v76, (__int128 *)v74, (__int128 *)__p);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)this, (unsigned __int16 *)&__dst, (morphun::dialog::DefaultFeatureFunction *)((char *)v5 + *(_QWORD *)(*v5 - 56)));
  if (v73 < 0)
    operator delete(__p[0]);
  if (v75 < 0)
    operator delete(v74[0]);
  if (SHIBYTE(v77) < 0)
    operator delete((void *)v76);
  if (SHIBYTE(v83) < 0)
    operator delete(*((void **)&v81 + 1));
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"withIndefArticle");
  v6 = (_QWORD *)operator new();
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v81 + 1, (char *)L"en");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v76, "e");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v74, "e");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"flere");
  morphun::grammar::synthesis::NbGrammarSynthesizer_ArticleLookupFunction::NbGrammarSynthesizer_ArticleLookupFunction((uint64_t)v6, (uint64_t)this, 1, (__int128 *)((char *)&v81 + 8), &v76, (__int128 *)v74, (__int128 *)__p);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)this, (unsigned __int16 *)&__dst, (morphun::dialog::DefaultFeatureFunction *)((char *)v6 + *(_QWORD *)(*v6 - 56)));
  if (v73 < 0)
    operator delete(__p[0]);
  if (v75 < 0)
    operator delete(v74[0]);
  if (SHIBYTE(v77) < 0)
    operator delete((void *)v76);
  if (SHIBYTE(v83) < 0)
    operator delete(*((void **)&v81 + 1));
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "i");
  v7 = (_QWORD *)operator new();
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v81 + 1, (char *)L"hvilken");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v76, (char *)L"hvilken");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v74, (char *)L"hvilket");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"hvilke");
  morphun::grammar::synthesis::NbGrammarSynthesizer_ArticleLookupFunction::NbGrammarSynthesizer_ArticleLookupFunction((uint64_t)v7, (uint64_t)this, 0, (__int128 *)((char *)&v81 + 8), &v76, (__int128 *)v74, (__int128 *)__p);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)this, (unsigned __int16 *)&__dst, (morphun::dialog::DefaultFeatureFunction *)((char *)v7 + *(_QWORD *)(*v7 - 56)));
  if (v73 < 0)
    operator delete(__p[0]);
  if (v75 < 0)
    operator delete(v74[0]);
  if (SHIBYTE(v77) < 0)
    operator delete((void *)v76);
  if (SHIBYTE(v83) < 0)
    operator delete(*((void **)&v81 + 1));
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "w");
  v8 = (_QWORD *)operator new();
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v81 + 1, (char *)L"hvilken");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v76, (char *)L"hvilken");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v74, (char *)L"hvilket");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"hvilke");
  morphun::grammar::synthesis::NbGrammarSynthesizer_ArticleLookupFunction::NbGrammarSynthesizer_ArticleLookupFunction((uint64_t)v8, (uint64_t)this, 1, (__int128 *)((char *)&v81 + 8), &v76, (__int128 *)v74, (__int128 *)__p);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)this, (unsigned __int16 *)&__dst, (morphun::dialog::DefaultFeatureFunction *)((char *)v8 + *(_QWORD *)(*v8 - 56)));
  if (v73 < 0)
    operator delete(__p[0]);
  if (v75 < 0)
    operator delete(v74[0]);
  if (SHIBYTE(v77) < 0)
    operator delete((void *)v76);
  if (SHIBYTE(v83) < 0)
    operator delete(*((void **)&v81 + 1));
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"possArticle");
  v9 = (_QWORD *)operator new();
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v81 + 1, (char *)L"din");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v76, (char *)L"di");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v74, "d");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"dine");
  morphun::grammar::synthesis::NbGrammarSynthesizer_ArticleLookupFunction::NbGrammarSynthesizer_ArticleLookupFunction((uint64_t)v9, (uint64_t)this, 0, (__int128 *)((char *)&v81 + 8), &v76, (__int128 *)v74, (__int128 *)__p);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)this, (unsigned __int16 *)&__dst, (morphun::dialog::DefaultFeatureFunction *)((char *)v9 + *(_QWORD *)(*v9 - 56)));
  if (v73 < 0)
    operator delete(__p[0]);
  if (v75 < 0)
    operator delete(v74[0]);
  if (SHIBYTE(v77) < 0)
    operator delete((void *)v76);
  if (SHIBYTE(v83) < 0)
    operator delete(*((void **)&v81 + 1));
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "w");
  v10 = (_QWORD *)operator new();
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v81 + 1, (char *)L"din");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v76, (char *)L"di");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v74, "d");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"dine");
  morphun::grammar::synthesis::NbGrammarSynthesizer_ArticleLookupFunction::NbGrammarSynthesizer_ArticleLookupFunction((uint64_t)v10, (uint64_t)this, 1, (__int128 *)((char *)&v81 + 8), &v76, (__int128 *)v74, (__int128 *)__p);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)this, (unsigned __int16 *)&__dst, (morphun::dialog::DefaultFeatureFunction *)((char *)v10 + *(_QWORD *)(*v10 - 56)));
  if (v73 < 0)
    operator delete(__p[0]);
  if (v75 < 0)
    operator delete(v74[0]);
  if (SHIBYTE(v77) < 0)
    operator delete((void *)v76);
  if (SHIBYTE(v83) < 0)
    operator delete(*((void **)&v81 + 1));
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "d");
  v11 = (_QWORD *)operator new();
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v81 + 1, (char *)L"denne");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v76, (char *)L"denne");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v74, (char *)L"dette");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"disse");
  morphun::grammar::synthesis::NbGrammarSynthesizer_ArticleLookupFunction::NbGrammarSynthesizer_ArticleLookupFunction((uint64_t)v11, (uint64_t)this, 0, (__int128 *)((char *)&v81 + 8), &v76, (__int128 *)v74, (__int128 *)__p);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)this, (unsigned __int16 *)&__dst, (morphun::dialog::DefaultFeatureFunction *)((char *)v11 + *(_QWORD *)(*v11 - 56)));
  if (v73 < 0)
    operator delete(__p[0]);
  if (v75 < 0)
    operator delete(v74[0]);
  if (SHIBYTE(v77) < 0)
    operator delete((void *)v76);
  if (SHIBYTE(v83) < 0)
    operator delete(*((void **)&v81 + 1));
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"withDemonArticle");
  v12 = (_QWORD *)operator new();
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v81 + 1, (char *)L"denne");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v76, (char *)L"denne");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v74, (char *)L"dette");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"disse");
  morphun::grammar::synthesis::NbGrammarSynthesizer_ArticleLookupFunction::NbGrammarSynthesizer_ArticleLookupFunction((uint64_t)v12, (uint64_t)this, 1, (__int128 *)((char *)&v81 + 8), &v76, (__int128 *)v74, (__int128 *)__p);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)this, (unsigned __int16 *)&__dst, (morphun::dialog::DefaultFeatureFunction *)((char *)v12 + *(_QWORD *)(*v12 - 56)));
  if (v73 < 0)
    operator delete(__p[0]);
  if (v75 < 0)
    operator delete(v74[0]);
  if (SHIBYTE(v77) < 0)
    operator delete((void *)v76);
  if (SHIBYTE(v83) < 0)
    operator delete(*((void **)&v81 + 1));
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  v13 = operator new();
  *(_QWORD *)v13 = &off_1E866E580;
  *(_QWORD *)(v13 + 296) = &unk_1E866E5D8;
  *(_OWORD *)(v13 + 8) = 0u;
  *(_OWORD *)(v13 + 24) = 0u;
  *(_QWORD *)(v13 + 40) = 0;
  v14 = (morphun::dictionary::DictionaryMetaData *)morphun::util::LocaleUtils::NORWEGIAN((morphun::util::LocaleUtils *)v13);
  Dictionary = (morphun::util::LocaleUtils *)morphun::dictionary::DictionaryMetaData::createDictionary(v14, v15);
  if (!Dictionary)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  *(_QWORD *)(v13 + 48) = Dictionary;
  v17 = (morphun::dictionary::Inflector *)morphun::util::LocaleUtils::NORWEGIAN(Dictionary);
  Inflector = (morphun::util::LocaleUtils *)morphun::dictionary::Inflector::getInflector(v17, v18);
  *(_QWORD *)(v13 + 56) = Inflector;
  v20 = (morphun::TokenizerFactory *)morphun::util::LocaleUtils::NORWEGIAN(Inflector);
  Tokenizer = morphun::TokenizerFactory::createTokenizer(v20, v21);
  *(_QWORD *)(v13 + 72) = 0;
  *(_QWORD *)(v13 + 64) = Tokenizer;
  *(_QWORD *)(v13 + 80) = 0;
  v23 = (morphun::grammar::synthesis::GrammemeConstants *)morphun::util::LocaleUtils::NORWEGIAN(Tokenizer);
  v24 = morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v23);
  if (*(char *)(v24 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&__dst, *(const std::basic_string<char16_t>::value_type **)v24, *(_QWORD *)(v24 + 8));
  }
  else
  {
    v25 = *(_OWORD *)v24;
    __dst.__r_.__value_.__r.__words[2] = *(_QWORD *)(v24 + 16);
    *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v25;
  }
  v26 = morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v24);
  if (*(char *)(v26 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v79, *(const std::basic_string<char16_t>::value_type **)v26, *(_QWORD *)(v26 + 8));
  }
  else
  {
    v27 = *(_OWORD *)v26;
    v79.__r_.__value_.__r.__words[2] = *(_QWORD *)(v26 + 16);
    *(_OWORD *)&v79.__r_.__value_.__l.__data_ = v27;
  }
  v28 = morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v26);
  if (*(char *)(v28 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v80, *(const std::basic_string<char16_t>::value_type **)v28, *(_QWORD *)(v28 + 8));
  }
  else
  {
    v29 = *(_OWORD *)v28;
    v80.__r_.__value_.__r.__words[2] = *(_QWORD *)(v28 + 16);
    *(_OWORD *)&v80.__r_.__value_.__l.__data_ = v29;
  }
  *((_QWORD *)&v81 + 1) = 0;
  v82 = 0;
  v83 = 0;
  *(_QWORD *)&v76 = (char *)&v81 + 8;
  BYTE8(v76) = 0;
  *((_QWORD *)&v81 + 1) = operator new(0x48uLL);
  v82 = (std::basic_string<char16_t> *)*((_QWORD *)&v81 + 1);
  v83 = *((_QWORD *)&v81 + 1) + 72;
  v82 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v83, (__int128 *)&__dst, &v81, *((std::basic_string<char16_t> **)&v81 + 1));
  morphun::dialog::DictionaryLookupFunction::DictionaryLookupFunction(v13 + 88, v23, (uint64_t *)&v81 + 1);
  *(_QWORD *)&v76 = (char *)&v81 + 8;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v76);
  for (i = 0; i != -9; i -= 3)
  {
    if (SHIBYTE(v80.__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(*(void **)((char *)&v80.__r_.__value_.__l.__data_ + i * 8));
  }
  v31 = *(_QWORD *)(v13 + 48);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v81 + 1, "a");
  memset(&__dst, 0, sizeof(__dst));
  *(_QWORD *)&v76 = &__dst;
  BYTE8(v76) = 0;
  __dst.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)operator new(0x18uLL);
  __dst.__r_.__value_.__l.__size_ = __dst.__r_.__value_.__r.__words[0];
  __dst.__r_.__value_.__r.__words[2] = __dst.__r_.__value_.__r.__words[0] + 24;
  __dst.__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&__dst.__r_.__value_.__r.__words[2], (__int128 *)((char *)&v81 + 8), &v84, (std::basic_string<char16_t> *)__dst.__r_.__value_.__l.__data_);
  BinaryProperties = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v31, (uint64_t *)(v13 + 72), (uint64_t *)&__dst);
  morphun::util::Validate::notNull<long long>((uint64_t)BinaryProperties);
  *(_QWORD *)&v76 = &__dst;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v76);
  if (SHIBYTE(v83) < 0)
    operator delete(*((void **)&v81 + 1));
  v33 = *(_QWORD *)(v13 + 48);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v81 + 1, (char *)L"noun");
  memset(&__dst, 0, sizeof(__dst));
  *(_QWORD *)&v76 = &__dst;
  BYTE8(v76) = 0;
  __dst.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)operator new(0x18uLL);
  __dst.__r_.__value_.__l.__size_ = __dst.__r_.__value_.__r.__words[0];
  __dst.__r_.__value_.__r.__words[2] = __dst.__r_.__value_.__r.__words[0] + 24;
  __dst.__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&__dst.__r_.__value_.__r.__words[2], (__int128 *)((char *)&v81 + 8), &v84, (std::basic_string<char16_t> *)__dst.__r_.__value_.__l.__data_);
  v34 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v33, (uint64_t *)(v13 + 80), (uint64_t *)&__dst);
  morphun::util::Validate::notNull<long long>((uint64_t)v34);
  *(_QWORD *)&v76 = &__dst;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v76);
  if (SHIBYTE(v83) < 0)
    operator delete(*((void **)&v81 + 1));
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"count");
  v35 = (_QWORD *)std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>((uint64_t)this + 8, (unsigned __int16 *)&__dst);
  v36 = (char *)this + 16;
  if ((_QWORD *)((char *)this + 16) == v35)
    v37 = 0;
  else
    v37 = v35[7];
  *(_QWORD *)(v13 + 16) = v37;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"gender");
  v38 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>((uint64_t)this + 8, (unsigned __int16 *)&__dst);
  if (v36 == (char *)v38)
    v39 = 0;
  else
    v39 = *(_QWORD *)(v38 + 56);
  *(_QWORD *)(v13 + 24) = v39;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "c");
  v40 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>((uint64_t)this + 8, (unsigned __int16 *)&__dst);
  if (v36 == (char *)v40)
    v41 = 0;
  else
    v41 = *(_QWORD *)(v40 + 56);
  *(_QWORD *)(v13 + 32) = v41;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "d");
  v42 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>((uint64_t)this + 8, (unsigned __int16 *)&__dst);
  if (v36 == (char *)v42)
    v43 = 0;
  else
    v43 = *(_QWORD *)(v42 + 56);
  *(_QWORD *)(v13 + 8) = v43;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "p");
  v44 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>((uint64_t)this + 8, (unsigned __int16 *)&__dst);
  if (v36 == (char *)v44)
    v45 = 0;
  else
    v45 = *(_QWORD *)(v44 + 56);
  *(_QWORD *)(v13 + 40) = v45;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  v46 = v13 + *(_QWORD *)(*(_QWORD *)v13 - 56);
  v47 = *((_QWORD *)this + 29);
  if (v47)
    (*(void (**)(uint64_t))(*(_QWORD *)v47 + 16))(v47);
  *((_QWORD *)this + 29) = v46;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v81 + 1, (char *)L"count");
  v48 = (morphun::util::LocaleUtils *)operator new();
  v49 = (morphun::grammar::synthesis::GrammemeConstants *)morphun::util::LocaleUtils::NORWEGIAN(v48);
  v50 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_SINGULAR(v49);
  if (*(char *)(v50 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&__dst, *(const std::basic_string<char16_t>::value_type **)v50, *(_QWORD *)(v50 + 8));
  }
  else
  {
    v51 = *(_OWORD *)v50;
    __dst.__r_.__value_.__r.__words[2] = *(_QWORD *)(v50 + 16);
    *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v51;
  }
  v52 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL((morphun::grammar::synthesis::GrammemeConstants *)v50);
  if (*(char *)(v52 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v79, *(const std::basic_string<char16_t>::value_type **)v52, *(_QWORD *)(v52 + 8));
  }
  else
  {
    v53 = *(_OWORD *)v52;
    v79.__r_.__value_.__r.__words[2] = *(_QWORD *)(v52 + 16);
    *(_OWORD *)&v79.__r_.__value_.__l.__data_ = v53;
  }
  v76 = 0uLL;
  v77 = 0;
  v74[0] = &v76;
  LOBYTE(v74[1]) = 0;
  *(_QWORD *)&v76 = operator new(0x30uLL);
  *((_QWORD *)&v76 + 1) = v76;
  v77 = v76 + 48;
  *((_QWORD *)&v76 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v77, (__int128 *)&__dst, (__int128 *)&v80, (std::basic_string<char16_t> *)v76);
  morphun::dialog::DictionaryLookupFunction::DictionaryLookupFunction((uint64_t)v48, v49, (uint64_t *)&v76);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)this, (unsigned __int16 *)&v81 + 4, (morphun::util::LocaleUtils *)((char *)v48 + *(_QWORD *)(*(_QWORD *)v48 - 56)));
  v74[0] = &v76;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)v74);
  for (j = 0; j != -6; j -= 3)
  {
    if (SHIBYTE(v79.__r_.__value_.__r.__words[j + 2]) < 0)
      operator delete(*(void **)((char *)&__dst + j * 8 + 24));
  }
  if (SHIBYTE(v83) < 0)
    operator delete(*((void **)&v81 + 1));
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v81 + 1, (char *)L"gender");
  v55 = (morphun::util::LocaleUtils *)operator new();
  v56 = (morphun::grammar::synthesis::GrammemeConstants *)morphun::util::LocaleUtils::NORWEGIAN(v55);
  v57 = morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v56);
  if (*(char *)(v57 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&__dst, *(const std::basic_string<char16_t>::value_type **)v57, *(_QWORD *)(v57 + 8));
  }
  else
  {
    v58 = *(_OWORD *)v57;
    __dst.__r_.__value_.__r.__words[2] = *(_QWORD *)(v57 + 16);
    *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v58;
  }
  v59 = morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v57);
  if (*(char *)(v59 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v79, *(const std::basic_string<char16_t>::value_type **)v59, *(_QWORD *)(v59 + 8));
  }
  else
  {
    v60 = *(_OWORD *)v59;
    v79.__r_.__value_.__r.__words[2] = *(_QWORD *)(v59 + 16);
    *(_OWORD *)&v79.__r_.__value_.__l.__data_ = v60;
  }
  v61 = morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v59);
  if (*(char *)(v61 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v80, *(const std::basic_string<char16_t>::value_type **)v61, *(_QWORD *)(v61 + 8));
  }
  else
  {
    v62 = *(_OWORD *)v61;
    v80.__r_.__value_.__r.__words[2] = *(_QWORD *)(v61 + 16);
    *(_OWORD *)&v80.__r_.__value_.__l.__data_ = v62;
  }
  v76 = 0uLL;
  v77 = 0;
  v74[0] = &v76;
  LOBYTE(v74[1]) = 0;
  *(_QWORD *)&v76 = operator new(0x48uLL);
  *((_QWORD *)&v76 + 1) = v76;
  v77 = v76 + 72;
  *((_QWORD *)&v76 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v77, (__int128 *)&__dst, &v81, (std::basic_string<char16_t> *)v76);
  morphun::dialog::DictionaryLookupFunction::DictionaryLookupFunction((uint64_t)v55, v56, (uint64_t *)&v76);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)this, (unsigned __int16 *)&v81 + 4, (morphun::util::LocaleUtils *)((char *)v55 + *(_QWORD *)(*(_QWORD *)v55 - 56)));
  v74[0] = &v76;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)v74);
  for (k = 0; k != -9; k -= 3)
  {
    if (SHIBYTE(v80.__r_.__value_.__r.__words[k + 2]) < 0)
      operator delete(*(void **)((char *)&v80.__r_.__value_.__l.__data_ + k * 8));
  }
  if (SHIBYTE(v83) < 0)
    operator delete(*((void **)&v81 + 1));
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v81 + 1, "d");
  v64 = (morphun::util::LocaleUtils *)operator new();
  v65 = (morphun::grammar::synthesis::GrammemeConstants *)morphun::util::LocaleUtils::NORWEGIAN(v64);
  v66 = morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_DEFINITE(v65);
  if (*(char *)(v66 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&__dst, *(const std::basic_string<char16_t>::value_type **)v66, *(_QWORD *)(v66 + 8));
  }
  else
  {
    v67 = *(_OWORD *)v66;
    __dst.__r_.__value_.__r.__words[2] = *(_QWORD *)(v66 + 16);
    *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v67;
  }
  v68 = morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_INDEFINITE((morphun::grammar::synthesis::GrammemeConstants *)v66);
  if (*(char *)(v68 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v79, *(const std::basic_string<char16_t>::value_type **)v68, *(_QWORD *)(v68 + 8));
  }
  else
  {
    v69 = *(_OWORD *)v68;
    v79.__r_.__value_.__r.__words[2] = *(_QWORD *)(v68 + 16);
    *(_OWORD *)&v79.__r_.__value_.__l.__data_ = v69;
  }
  v76 = 0uLL;
  v77 = 0;
  v74[0] = &v76;
  LOBYTE(v74[1]) = 0;
  *(_QWORD *)&v76 = operator new(0x30uLL);
  *((_QWORD *)&v76 + 1) = v76;
  v77 = v76 + 48;
  *((_QWORD *)&v76 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v77, (__int128 *)&__dst, (__int128 *)&v80, (std::basic_string<char16_t> *)v76);
  morphun::dialog::DictionaryLookupFunction::DictionaryLookupFunction((uint64_t)v64, v65, (uint64_t *)&v76);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)this, (unsigned __int16 *)&v81 + 4, (morphun::util::LocaleUtils *)((char *)v64 + *(_QWORD *)(*(_QWORD *)v64 - 56)));
  v74[0] = &v76;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)v74);
  for (m = 0; m != -6; m -= 3)
  {
    if (SHIBYTE(v79.__r_.__value_.__r.__words[m + 2]) < 0)
      operator delete(*(void **)((char *)&__dst + m * 8 + 24));
  }
  if (SHIBYTE(v83) < 0)
    operator delete(*((void **)&v81 + 1));
}

void sub_1CB5AC960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;
  void *v34;

  __cxa_free_exception(v34);
  MEMORY[0x1D179D2EC](v33, 0x10F3C409DF61E03);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::NbGrammarSynthesizer::getCount(unsigned __int16 *a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t *v9;
  morphun::grammar::synthesis::GrammemeConstants *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t i;
  std::basic_string<char16_t> v17;
  int v18;
  std::basic_string<char16_t> v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((v2 & 1) == 0
  {
    v11 = (morphun::grammar::synthesis::GrammemeConstants *)operator new();
    v12 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_SINGULAR(v11);
    if (*(char *)(v12 + 23) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(&v17, *(const std::basic_string<char16_t>::value_type **)v12, *(_QWORD *)(v12 + 8));
    }
    else
    {
      v13 = *(_OWORD *)v12;
      v17.__r_.__value_.__r.__words[2] = *(_QWORD *)(v12 + 16);
      *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v13;
    }
    v18 = 1;
    v14 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL((morphun::grammar::synthesis::GrammemeConstants *)v12);
    if (*(char *)(v14 + 23) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(&v19, *(const std::basic_string<char16_t>::value_type **)v14, *(_QWORD *)(v14 + 8));
    }
    else
    {
      v15 = *(_OWORD *)v14;
      v19.__r_.__value_.__r.__words[2] = *(_QWORD *)(v14 + 16);
      *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v15;
    }
    v20 = 2;
    std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::NbGrammarSynthesizer::Count>::map[abi:ne180100]((uint64_t **)v11, (__int128 *)&v17, 2);
    for (i = 0; i != -8; i -= 4)
    {
      if (SHIBYTE(v19.__r_.__value_.__r.__words[i + 2]) < 0)
        operator delete(*(void **)((char *)&v19.__r_.__value_.__l.__data_ + i * 8));
    }
    morphun::grammar::synthesis::NbGrammarSynthesizer::getCount(std::basic_string<char16_t> const*)::valueMap = (uint64_t)v11;
  }
  if (!a1)
    return 0;
  v3 = morphun::grammar::synthesis::NbGrammarSynthesizer::getCount(std::basic_string<char16_t> const*)::valueMap;
  npc<std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::NbGrammarSynthesizer::Count>>(morphun::grammar::synthesis::NbGrammarSynthesizer::getCount(std::basic_string<char16_t> const*)::valueMap);
  v6 = *(_QWORD *)(v3 + 8);
  v4 = v3 + 8;
  v5 = v6;
  if (!v6)
    goto LABEL_10;
  v7 = v4;
  do
  {
    v8 = std::less<std::basic_string<char16_t>>::operator()[abi:ne180100]((unsigned __int16 *)(v5 + 32), a1);
    v9 = (uint64_t *)(v5 + 8);
    if (!v8)
    {
      v9 = (uint64_t *)v5;
      v7 = v5;
    }
    v5 = *v9;
  }
  while (*v9);
  if (v7 == v4 || std::less<std::basic_string<char16_t>>::operator()[abi:ne180100](a1, (unsigned __int16 *)(v7 + 32)))
LABEL_10:
    v7 = v4;
  if (npc<std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::NbGrammarSynthesizer::Count>>(morphun::grammar::synthesis::NbGrammarSynthesizer::getCount(std::basic_string<char16_t> const*)::valueMap)
     + 8 == v7)
    return 0;
  else
    return *(unsigned int *)(v7 + 56);
}

void sub_1CB5ACFC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;

  if (a14 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v14, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t **std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::NbGrammarSynthesizer::Count>::map[abi:ne180100](uint64_t **a1, __int128 *a2, uint64_t a3)
{
  uint64_t *v4;
  __int128 *v5;
  __int128 *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  BOOL v11;
  char **v12;
  char **v13;
  char *v14;
  unsigned __int16 *v15;
  char *v16;
  std::basic_string<char16_t> *v17;
  __int128 v18;
  uint64_t *v19;

  a1[1] = 0;
  v4 = (uint64_t *)(a1 + 1);
  a1[2] = 0;
  *a1 = (uint64_t *)(a1 + 1);
  if (a3)
  {
    v5 = a2;
    v6 = &a2[2 * a3];
    while (1)
    {
      v7 = a1[1];
      v8 = v4;
      if (*a1 != v4)
      {
        v9 = a1[1];
        v10 = v4;
        if (v7)
        {
          do
          {
            v8 = v9;
            v9 = (uint64_t *)v9[1];
          }
          while (v9);
        }
        else
        {
          do
          {
            v8 = (uint64_t *)v10[2];
            v11 = *v8 == (_QWORD)v10;
            v10 = v8;
          }
          while (v11);
        }
        if (!std::less<std::basic_string<char16_t>>::operator()[abi:ne180100]((unsigned __int16 *)v8 + 16, (unsigned __int16 *)v5))break;
      }
      v12 = (char **)v4;
      v13 = (char **)v4;
      if (!v7)
        goto LABEL_19;
      v13 = (char **)(v8 + 1);
      if (!v8[1])
      {
        v12 = (char **)v8;
LABEL_19:
        v16 = (char *)operator new(0x40uLL);
        v17 = (std::basic_string<char16_t> *)(v16 + 32);
        if (*((char *)v5 + 23) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external(v17, *(const std::basic_string<char16_t>::value_type **)v5, *((_QWORD *)v5 + 1));
        }
        else
        {
          v18 = *v5;
          *((_QWORD *)v16 + 6) = *((_QWORD *)v5 + 2);
          *(_OWORD *)&v17->__r_.__value_.__l.__data_ = v18;
        }
        *((_DWORD *)v16 + 14) = *((_DWORD *)v5 + 6);
        *(_QWORD *)v16 = 0;
        *((_QWORD *)v16 + 1) = 0;
        *((_QWORD *)v16 + 2) = v12;
        *v13 = v16;
        v19 = (uint64_t *)**a1;
        if (v19)
        {
          *a1 = v19;
          v16 = *v13;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], (uint64_t *)v16);
        a1[2] = (uint64_t *)((char *)a1[2] + 1);
      }
LABEL_25:
      v5 += 2;
      if (v5 == v6)
        return a1;
    }
    v12 = (char **)v4;
    v13 = (char **)v4;
    if (v7)
    {
      v14 = (char *)v7;
      while (1)
      {
        while (1)
        {
          v12 = (char **)v14;
          v15 = (unsigned __int16 *)(v14 + 32);
          if (!std::less<std::basic_string<char16_t>>::operator()[abi:ne180100]((unsigned __int16 *)v5, (unsigned __int16 *)v14 + 16))break;
          v14 = *v12;
          v13 = v12;
          if (!*v12)
            goto LABEL_19;
        }
        if (!std::less<std::basic_string<char16_t>>::operator()[abi:ne180100](v15, (unsigned __int16 *)v5))
          goto LABEL_25;
        v13 = v12 + 1;
        v14 = v12[1];
        if (!v14)
          goto LABEL_19;
      }
    }
    goto LABEL_19;
  }
  return a1;
}

void sub_1CB5AD1EC(_Unwind_Exception *a1)
{
  void *v1;
  char **v2;

  operator delete(v1);
  std::__tree<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>>>::destroy(*v2);
  _Unwind_Resume(a1);
}

uint64_t npc<std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::NbGrammarSynthesizer::Count>>(uint64_t result)
{
  morphun::exception::NullPointerException *exception;

  if (!result)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  return result;
}

void sub_1CB5AD258(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::NbGrammarSynthesizer::getGender(unsigned __int16 *a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t *v9;
  morphun::grammar::synthesis::GrammemeConstants *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t i;
  std::basic_string<char16_t> v19;
  int v20;
  std::basic_string<char16_t> v21;
  int v22;
  std::basic_string<char16_t> v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((v2 & 1) == 0
  {
    v11 = (morphun::grammar::synthesis::GrammemeConstants *)operator new();
    v12 = morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v11);
    if (*(char *)(v12 + 23) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(&v19, *(const std::basic_string<char16_t>::value_type **)v12, *(_QWORD *)(v12 + 8));
    }
    else
    {
      v13 = *(_OWORD *)v12;
      v19.__r_.__value_.__r.__words[2] = *(_QWORD *)(v12 + 16);
      *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v13;
    }
    v20 = 1;
    v14 = morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v12);
    if (*(char *)(v14 + 23) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(&v21, *(const std::basic_string<char16_t>::value_type **)v14, *(_QWORD *)(v14 + 8));
    }
    else
    {
      v15 = *(_OWORD *)v14;
      v21.__r_.__value_.__r.__words[2] = *(_QWORD *)(v14 + 16);
      *(_OWORD *)&v21.__r_.__value_.__l.__data_ = v15;
    }
    v22 = 2;
    v16 = morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v14);
    if (*(char *)(v16 + 23) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(&v23, *(const std::basic_string<char16_t>::value_type **)v16, *(_QWORD *)(v16 + 8));
    }
    else
    {
      v17 = *(_OWORD *)v16;
      v23.__r_.__value_.__r.__words[2] = *(_QWORD *)(v16 + 16);
      *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v17;
    }
    v24 = 3;
    std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::NbGrammarSynthesizer::Gender>::map[abi:ne180100]((uint64_t **)v11, (__int128 *)&v19, 3);
    for (i = 0; i != -12; i -= 4)
    {
      if (SHIBYTE(v23.__r_.__value_.__r.__words[i + 2]) < 0)
        operator delete(*(void **)((char *)&v23.__r_.__value_.__l.__data_ + i * 8));
    }
    morphun::grammar::synthesis::NbGrammarSynthesizer::getGender(std::basic_string<char16_t> const*)::valueMap = (uint64_t)v11;
  }
  if (!a1)
    return 0;
  v3 = morphun::grammar::synthesis::NbGrammarSynthesizer::getGender(std::basic_string<char16_t> const*)::valueMap;
  npc<std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::NbGrammarSynthesizer::Gender>>(morphun::grammar::synthesis::NbGrammarSynthesizer::getGender(std::basic_string<char16_t> const*)::valueMap);
  v6 = *(_QWORD *)(v3 + 8);
  v4 = v3 + 8;
  v5 = v6;
  if (!v6)
    goto LABEL_10;
  v7 = v4;
  do
  {
    v8 = std::less<std::basic_string<char16_t>>::operator()[abi:ne180100]((unsigned __int16 *)(v5 + 32), a1);
    v9 = (uint64_t *)(v5 + 8);
    if (!v8)
    {
      v9 = (uint64_t *)v5;
      v7 = v5;
    }
    v5 = *v9;
  }
  while (*v9);
  if (v7 == v4 || std::less<std::basic_string<char16_t>>::operator()[abi:ne180100](a1, (unsigned __int16 *)(v7 + 32)))
LABEL_10:
    v7 = v4;
  if (npc<std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::NbGrammarSynthesizer::Gender>>(morphun::grammar::synthesis::NbGrammarSynthesizer::getGender(std::basic_string<char16_t> const*)::valueMap)
     + 8 == v7)
    return 0;
  else
    return *(unsigned int *)(v7 + 56);
}

void sub_1CB5AD484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t *v10;

  while (1)
  {
    if (*((char *)v10 - 9) < 0)
      operator delete((void *)*(v10 - 4));
    v10 -= 4;
    if (v10 == &a9)
    {
      MEMORY[0x1D179D2EC](v9, 0x1020C4062D53EE8);
      _Unwind_Resume(a1);
    }
  }
}

uint64_t **std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::NbGrammarSynthesizer::Gender>::map[abi:ne180100](uint64_t **a1, __int128 *a2, uint64_t a3)
{
  uint64_t *v4;
  __int128 *v5;
  __int128 *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  BOOL v11;
  char **v12;
  char **v13;
  char *v14;
  unsigned __int16 *v15;
  char *v16;
  std::basic_string<char16_t> *v17;
  __int128 v18;
  uint64_t *v19;

  a1[1] = 0;
  v4 = (uint64_t *)(a1 + 1);
  a1[2] = 0;
  *a1 = (uint64_t *)(a1 + 1);
  if (a3)
  {
    v5 = a2;
    v6 = &a2[2 * a3];
    while (1)
    {
      v7 = a1[1];
      v8 = v4;
      if (*a1 != v4)
      {
        v9 = a1[1];
        v10 = v4;
        if (v7)
        {
          do
          {
            v8 = v9;
            v9 = (uint64_t *)v9[1];
          }
          while (v9);
        }
        else
        {
          do
          {
            v8 = (uint64_t *)v10[2];
            v11 = *v8 == (_QWORD)v10;
            v10 = v8;
          }
          while (v11);
        }
        if (!std::less<std::basic_string<char16_t>>::operator()[abi:ne180100]((unsigned __int16 *)v8 + 16, (unsigned __int16 *)v5))break;
      }
      v12 = (char **)v4;
      v13 = (char **)v4;
      if (!v7)
        goto LABEL_19;
      v13 = (char **)(v8 + 1);
      if (!v8[1])
      {
        v12 = (char **)v8;
LABEL_19:
        v16 = (char *)operator new(0x40uLL);
        v17 = (std::basic_string<char16_t> *)(v16 + 32);
        if (*((char *)v5 + 23) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external(v17, *(const std::basic_string<char16_t>::value_type **)v5, *((_QWORD *)v5 + 1));
        }
        else
        {
          v18 = *v5;
          *((_QWORD *)v16 + 6) = *((_QWORD *)v5 + 2);
          *(_OWORD *)&v17->__r_.__value_.__l.__data_ = v18;
        }
        *((_DWORD *)v16 + 14) = *((_DWORD *)v5 + 6);
        *(_QWORD *)v16 = 0;
        *((_QWORD *)v16 + 1) = 0;
        *((_QWORD *)v16 + 2) = v12;
        *v13 = v16;
        v19 = (uint64_t *)**a1;
        if (v19)
        {
          *a1 = v19;
          v16 = *v13;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], (uint64_t *)v16);
        a1[2] = (uint64_t *)((char *)a1[2] + 1);
      }
LABEL_25:
      v5 += 2;
      if (v5 == v6)
        return a1;
    }
    v12 = (char **)v4;
    v13 = (char **)v4;
    if (v7)
    {
      v14 = (char *)v7;
      while (1)
      {
        while (1)
        {
          v12 = (char **)v14;
          v15 = (unsigned __int16 *)(v14 + 32);
          if (!std::less<std::basic_string<char16_t>>::operator()[abi:ne180100]((unsigned __int16 *)v5, (unsigned __int16 *)v14 + 16))break;
          v14 = *v12;
          v13 = v12;
          if (!*v12)
            goto LABEL_19;
        }
        if (!std::less<std::basic_string<char16_t>>::operator()[abi:ne180100](v15, (unsigned __int16 *)v5))
          goto LABEL_25;
        v13 = v12 + 1;
        v14 = v12[1];
        if (!v14)
          goto LABEL_19;
      }
    }
    goto LABEL_19;
  }
  return a1;
}

void sub_1CB5AD6BC(_Unwind_Exception *a1)
{
  void *v1;
  char **v2;

  operator delete(v1);
  std::__tree<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>>>::destroy(*v2);
  _Unwind_Resume(a1);
}

uint64_t npc<std::map<std::basic_string<char16_t>,morphun::grammar::synthesis::NbGrammarSynthesizer::Gender>>(uint64_t result)
{
  morphun::exception::NullPointerException *exception;

  if (!result)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  return result;
}

void sub_1CB5AD728(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

morphun::Token *morphun::Token_Delim::newInstance(morphun::Token_Delim *this, int a2)
{
  morphun::Token *v4;
  int v5;
  int v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *v9;
  int v10;
  unint64_t *v11;
  unint64_t v12;
  int v13;
  void *v14;
  unint64_t v15;

  v4 = (morphun::Token *)operator new();
  v5 = (*(uint64_t (**)(morphun::Token_Delim *))(*(_QWORD *)this + 24))(this);
  v6 = (*(uint64_t (**)(morphun::Token_Delim *))(*(_QWORD *)this + 32))(this);
  v7 = (unint64_t *)*((_QWORD *)this + 2);
  v8 = *((_QWORD *)this + 3);
  v9 = (unint64_t *)((char *)this + 16);
  v10 = *((char *)v9 + 23);
  if (v10 >= 0)
    v11 = v9;
  else
    v11 = v7;
  if (v10 >= 0)
    v12 = *((unsigned __int8 *)v9 + 23);
  else
    v12 = v8;
  v13 = *((char *)v9 + 47);
  if (v13 >= 0)
    v14 = v9 + 3;
  else
    v14 = (void *)v9[3];
  if (v13 >= 0)
    v15 = *((unsigned __int8 *)v9 + 47);
  else
    v15 = v9[4];
  *(_QWORD *)v4 = &off_1E8656C30;
  morphun::Token::Token(v4, (uint64_t *)&off_1E8667030, v5 - a2, v6 - a2, v11, v12, v14, v15, 0);
  *(_QWORD *)v4 = &off_1E866A2D0;
  return v4;
}

void sub_1CB5AD81C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10B3C405B5873CALL);
  _Unwind_Resume(a1);
}

morphun::Token *morphun::Token_Delim::Token_Delim(morphun::Token *a1, int a2, int a3, void *__src, unint64_t a5, void *a6, unint64_t a7)
{
  morphun::Token *result;

  *(_QWORD *)a1 = &off_1E8656C30;
  result = morphun::Token::Token(a1, (uint64_t *)&off_1E8667030, a2, a3, __src, a5, a6, a7, 0);
  *(_QWORD *)result = &off_1E866A2D0;
  return result;
}

void morphun::analysis::tokenattributes::GrammemeAttributeImpl::~GrammemeAttributeImpl(morphun::analysis::tokenattributes::GrammemeAttributeImpl *this)
{
  JUMPOUT(0x1D179D2ECLL);
}

_QWORD *`covariant return thunk to'morphun::analysis::tokenattributes::GrammemeAttributeImpl::clone(morphun::analysis::tokenattributes::GrammemeAttributeImpl *this)
{
  char *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (char *)this + *(_QWORD *)(*(_QWORD *)this - 48);
  result = (_QWORD *)operator new();
  v3 = *((_QWORD *)v1 + 1);
  *result = &off_1E86712E0;
  result[1] = v3;
  result[2] = &unk_1E86713B0;
  return result;
}

uint64_t morphun::analysis::tokenattributes::GrammemeAttributeImpl::equals(morphun::analysis::tokenattributes::GrammemeAttributeImpl *this, const morphun::analysis::util::Attribute *lpsrc)
{
  uint64_t result;

  if ((morphun::analysis::tokenattributes::GrammemeAttributeImpl *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 88)) == lpsrc)
    return 1;
  if (result)
    return *((_QWORD *)this + 1) == *(_QWORD *)(result + 8);
  return result;
}

uint64_t morphun::analysis::tokenattributes::GrammemeAttributeImpl::hashCode(morphun::analysis::tokenattributes::GrammemeAttributeImpl *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t morphun::analysis::tokenattributes::GrammemeAttributeImpl::operator()(int a1, void *lpsrc)
{
  void *v2;

  if (!v2)
    __cxa_bad_cast();
  return (*(int (**)(void *))(*(_QWORD *)v2 + 40))(v2);
}

uint64_t morphun::analysis::tokenattributes::GrammemeAttributeImpl::clear(uint64_t this)
{
  *(_QWORD *)(this + 8) = 0;
  return this;
}

_QWORD *morphun::analysis::tokenattributes::GrammemeAttributeImpl::clone(morphun::analysis::tokenattributes::GrammemeAttributeImpl *this)
{
  _QWORD *result;
  uint64_t v3;

  result = (_QWORD *)operator new();
  v3 = *((_QWORD *)this + 1);
  *result = &off_1E86712E0;
  result[1] = v3;
  result[2] = &unk_1E86713B0;
  return result;
}

uint64_t morphun::analysis::tokenattributes::GrammemeAttributeImpl::copyTo(morphun::analysis::tokenattributes::GrammemeAttributeImpl *this, morphun::analysis::util::AttributeImpl *lpsrc)
{
  void *v3;
  morphun::exception::NullPointerException *exception;
  char *v6;

  if (!lpsrc)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  if (!v3)
  {
    v6 = (char *)__cxa_allocate_exception(0x38uLL);
    *(_OWORD *)(v6 + 8) = 0u;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_QWORD *)v6 = &off_1E8673060;
  }
  return (*(uint64_t (**)(void *, _QWORD))(*(_QWORD *)v3 + 64))(v3, *((_QWORD *)this + 1));
}

void sub_1CB5ADACC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void morphun::analysis::tokenattributes::GrammemeAttributeImpl::reflectWith(morphun::util::StringUtils **this, morphun::analysis::util::AttributeReflector *a2)
{
  morphun::exception::NullPointerException *exception;
  std::basic_string<char16_t> __p;
  void *__dst[2];
  char v7;

  if (!a2)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__dst, "g");
  morphun::util::StringUtils::to_u16string(this[1], &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v7 < 0)
    operator delete(__dst[0]);
}

void sub_1CB5ADB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  void *v20;

  __cxa_free_exception(v20);
  _Unwind_Resume(a1);
}

uint64_t morphun::analysis::tokenattributes::GrammemeAttributeImpl::setGrammemes(uint64_t this, uint64_t a2)
{
  *(_QWORD *)(this + 8) = a2;
  return this;
}

uint64_t morphun::analysis::tokenattributes::GrammemeAttributeImpl::getGrammemes(morphun::analysis::tokenattributes::GrammemeAttributeImpl *this)
{
  return *((_QWORD *)this + 1);
}

void `virtual thunk to'morphun::analysis::tokenattributes::GrammemeAttributeImpl::~GrammemeAttributeImpl(morphun::analysis::tokenattributes::GrammemeAttributeImpl *this)
{
  JUMPOUT(0x1D179D2ECLL);
}

uint64_t `virtual thunk to'morphun::analysis::tokenattributes::GrammemeAttributeImpl::getGrammemes(morphun::analysis::tokenattributes::GrammemeAttributeImpl *this)
{
  return *(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 96) + 8);
}

_QWORD *`virtual thunk to'morphun::analysis::tokenattributes::GrammemeAttributeImpl::setGrammemes(_QWORD *this, uint64_t a2)
{
  *(_QWORD *)((char *)this + *(_QWORD *)(*this - 104) + 8) = a2;
  return this;
}

_QWORD *morphun::analysis::tokenattributes::GrammemeAttributeImpl::create(morphun::analysis::tokenattributes::GrammemeAttributeImpl *this)
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  result[1] = 0;
  result[2] = &unk_1E86713B0;
  *result = &off_1E86712E0;
  return result;
}

void morphun::grammar::synthesis::NlGrammarSynthesizer_DefinitenessLookupFunction::~NlGrammarSynthesizer_DefinitenessLookupFunction(morphun::grammar::synthesis::NlGrammarSynthesizer_DefinitenessLookupFunction *this)
{
  void *v2;
  uint64_t v3;

  *(_QWORD *)this = &off_1E865E410;
  v2 = (void *)*((_QWORD *)this + 22);
  if (v2)
  {
    *((_QWORD *)this + 23) = v2;
    operator delete(v2);
  }
  v3 = *((_QWORD *)this + 20);
  *((_QWORD *)this + 20) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
  *((_QWORD *)this + 1) = &off_1E8671C00;
}

{
  void *v2;
  uint64_t v3;

  *(_QWORD *)this = &off_1E865E410;
  v2 = (void *)*((_QWORD *)this + 22);
  if (v2)
  {
    *((_QWORD *)this + 23) = v2;
    operator delete(v2);
  }
  v3 = *((_QWORD *)this + 20);
  *((_QWORD *)this + 20) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
  *((_QWORD *)this + 1) = &off_1E8671C00;
  JUMPOUT(0x1D179D2ECLL);
}

uint64_t morphun::grammar::synthesis::NlGrammarSynthesizer_DefinitenessLookupFunction::getFeatureValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  const UChar *v4;
  int v5;
  uint64_t v6;
  const UChar *v7;
  uint64_t v8;
  const UChar *v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  void **v13;
  int v14;
  int v15;
  __int128 *v17;
  void *v18;
  std::basic_string<char16_t> *v19;
  char v20;
  uint64_t v22;
  void **v23;
  int v24;
  int v25;
  uint64_t v27;
  void **v28;
  int v29;
  int v30;
  __int128 *v32;
  void *__p[2];
  uint64_t v34;

  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
  v4 = (const UChar *)v3;
  v5 = *(char *)(v3 + 23);
  if (v5 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 23);
  else
    v6 = *(_QWORD *)(v3 + 8);
  if (!v6)
    goto LABEL_26;
  __p[0] = 0;
  __p[1] = 0;
  v34 = 0;
  v7 = *(const UChar **)v3;
  v8 = morphun::util::LocaleUtils::ENGLISH((morphun::util::LocaleUtils *)v3);
  if (v5 >= 0)
    v9 = v4;
  else
    v9 = v7;
  morphun::util::StringViewUtils::lowercase((uint64_t)__p, v9, v6, v8);
  v10 = HIBYTE(v34);
  if (v34 < 0)
    v10 = (unint64_t)__p[1];
  if (v10 < 3)
    goto LABEL_11;
  v12 = 0;
  v13 = (void **)__p[0];
  if (v34 >= 0)
    v13 = __p;
  do
  {
    v14 = *(unsigned __int16 *)((char *)v13 + v12 * 2);
    v15 = (unsigned __int16)word_1CB73E0E6[v12];
  }
  while (v15 == v14 && v12++ != 2);
  if (v15 == v14)
    goto LABEL_20;
  if (v10 < 4)
  {
LABEL_11:
    v11 = 1;
    goto LABEL_22;
  }
  v22 = 0;
  v23 = (void **)__p[0];
  if (v34 >= 0)
    v23 = __p;
  do
  {
    v24 = *(unsigned __int16 *)((char *)v23 + v22 * 2);
    v25 = (unsigned __int16)word_1CB73E0EE[v22];
  }
  while (v25 == v24 && v22++ != 3);
  if (v25 != v24)
  {
    v27 = 0;
    v28 = __p;
    if (v34 < 0)
      v28 = (void **)__p[0];
    do
    {
      v29 = *(unsigned __int16 *)((char *)v28 + v27 * 2);
      v30 = (unsigned __int16)aEen[v27];
    }
    while (v30 == v29 && v27++ != 3);
    if (v30 == v29)
    {
      v6 = operator new();
      v32 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_INDEFINITE((morphun::grammar::synthesis::GrammemeConstants *)v6);
      morphun::dialog::SpeakableString::SpeakableString((_QWORD *)v6, v32);
      goto LABEL_21;
    }
    goto LABEL_11;
  }
LABEL_20:
  v6 = operator new();
  v17 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_DEFINITE((morphun::grammar::synthesis::GrammemeConstants *)v6);
  morphun::dialog::SpeakableString::SpeakableString((_QWORD *)v6, v17);
LABEL_21:
  v11 = 0;
LABEL_22:
  if (SHIBYTE(v34) < 0)
  {
    operator delete(__p[0]);
    if ((v11 & 1) == 0)
      return v6;
  }
  else if ((v11 & 1) == 0)
  {
    return v6;
  }
LABEL_26:
  (*(void (**)(void **__return_ptr, uint64_t, const UChar *))(*(_QWORD *)a1 + 32))(__p, a1, v4);
  v18 = (void *)HIBYTE(v34);
  if (v34 < 0)
    v18 = __p[1];
  if (v18)
  {
    v6 = operator new();
    *(_QWORD *)v6 = &off_1E866AD28;
    v19 = (std::basic_string<char16_t> *)(v6 + 8);
    v20 = HIBYTE(v34);
    if (SHIBYTE(v34) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(v19, (const std::basic_string<char16_t>::value_type *)__p[0], (std::basic_string<char16_t>::size_type)__p[1]);
      v20 = HIBYTE(v34);
    }
    else
    {
      *(_OWORD *)&v19->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
      *(_QWORD *)(v6 + 24) = v34;
    }
    *(_QWORD *)(v6 + 32) = 0;
    if (v20 < 0)
      goto LABEL_35;
  }
  else
  {
    v6 = 0;
    if (v34 < 0)
LABEL_35:
      operator delete(__p[0]);
  }
  return v6;
}

void sub_1CB5ADFE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1D179D2EC](v15, 0x10B3C40F7FF9C27);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

std::basic_string<char16_t> *morphun::TokenChain::toString@<X0>(morphun::TokenChain *this@<X0>, std::basic_string<char16_t> *a2@<X8>)
{
  std::basic_string<char16_t> *result;
  char v5;
  uint64_t *i;
  uint64_t v7;
  int v8;
  const std::basic_string<char16_t>::value_type *v9;
  std::basic_string<char16_t>::size_type v10;

  result = (std::basic_string<char16_t> *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(a2, "T");
  v5 = 0;
  for (i = (uint64_t *)((char *)this + 8); ; i = (uint64_t *)(v7 + 80))
  {
    v7 = *i;
    if (!*i || v7 == *((_QWORD *)this + 2))
      break;
    if (!*(_BYTE *)(v7 + 65))
    {
      if ((v5 & 1) != 0)
        std::basic_string<char16_t>::append(a2, L" | ", 3uLL);
      v8 = *(char *)(v7 + 39);
      if (v8 >= 0)
        v9 = (const std::basic_string<char16_t>::value_type *)(v7 + 16);
      else
        v9 = *(const std::basic_string<char16_t>::value_type **)(v7 + 16);
      if (v8 >= 0)
        v10 = *(unsigned __int8 *)(v7 + 39);
      else
        v10 = *(_QWORD *)(v7 + 24);
      result = std::basic_string<char16_t>::append(a2, v9, v10);
      v5 = 1;
    }
  }
  return result;
}

void sub_1CB5AE0D4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void *morphun::TokenChain::getHead(void **this)
{
  return java_cast<morphun::Token_Head *,morphun::Token>(this[1]);
}

void *morphun::TokenChain::getTail(morphun::TokenChain *this)
{
  void *result;
  char *exception;

  result = (void *)*((_QWORD *)this + 2);
  if (result)
  {
    if (!result)
    {
      exception = (char *)__cxa_allocate_exception(0x38uLL);
      *(_OWORD *)(exception + 8) = 0u;
      *(_OWORD *)(exception + 24) = 0u;
      *(_OWORD *)(exception + 40) = 0u;
      *(_QWORD *)exception = &off_1E8673060;
    }
  }
  return result;
}

uint64_t morphun::TokenChain::hashCode(morphun::TokenChain *this)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)*((_QWORD *)this + 1);
  if (!v1)
    return 0;
  LODWORD(v2) = 0;
  do
  {
    v2 = (*(unsigned int (**)(_QWORD *))(*v1 + 48))(v1) - v2 + 32 * (_DWORD)v2;
    v1 = (_QWORD *)v1[10];
  }
  while (v1);
  return v2;
}

uint64_t morphun::TokenChain::isExplicitOnly(morphun::TokenChain *this)
{
  int v1;
  char v2;
  uint64_t v4;
  char v5;
  char v6;
  void *v7;
  int v8;

  v1 = *((_DWORD *)this + 14);
  if (v1)
  {
    v2 = v1 == 1;
  }
  else
  {
    v4 = (*(uint64_t (**)(morphun::TokenChain *))(*(_QWORD *)this + 104))(this);
    v5 = 0;
LABEL_4:
    v6 = v5;
    while (1)
    {
      npc<morphun::Token>(v4);
      v4 = *(_QWORD *)(v4 + 80);
      if (!v4)
        break;
      {
        v5 = 1;
        if (v7)
          goto LABEL_4;
        break;
      }
    }
    v2 = v6 & (v4 == 0);
    if (v2)
      v8 = 1;
    else
      v8 = 2;
    *((_DWORD *)this + 14) = v8;
  }
  return v2 & 1;
}

morphun::TokenChain *morphun::TokenChain::getNewTokenChain(morphun::TokenChain *this, uint64_t a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  morphun::Token_Head *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  morphun::Token_Tail *v15;
  int v16;
  morphun::TokenChain *v17;

  v6 = (*(uint64_t (**)(morphun::TokenChain *))(*(_QWORD *)this + 104))(this);
  v7 = npc<morphun::Token_Head>(v6);
  v8 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v7 + 40))(v7, a2);
  v9 = (morphun::Token_Head *)java_cast<morphun::Token_Head *,morphun::Token>(v8);
  v10 = (_QWORD *)(*(uint64_t (**)(morphun::TokenChain *))(*(_QWORD *)this + 104))(this);
  v11 = v9;
  while (1)
  {
    npc<morphun::Token const>((uint64_t)v10);
    v12 = v10[10];
    if (v12 == (*(uint64_t (**)(morphun::TokenChain *))(*(_QWORD *)this + 112))(this))
      break;
    npc<morphun::Token const>((uint64_t)v10);
    v10 = (_QWORD *)v10[10];
    v13 = npc<morphun::Token const>((uint64_t)v10);
    if ((*(int (**)(uint64_t))(*v10 + 24))(v13) >= (int)a2
      && (*(int (**)(_QWORD *))(*v10 + 32))(v10) <= a3)
    {
      v14 = (*(uint64_t (**)(_QWORD *, uint64_t))(*v10 + 40))(v10, a2);
      *(_QWORD *)(npc<morphun::Token>(v14) + 72) = v11;
      npc<morphun::Token>((uint64_t)v11);
      v11[10] = v14;
      v11 = (_QWORD *)v14;
    }
  }
  v15 = (morphun::Token_Tail *)operator new();
  npc<morphun::Token>((uint64_t)v11);
  v16 = (*(uint64_t (**)(_QWORD *))(*v11 + 32))(v11);
  morphun::Token_Tail::Token_Tail(v15, v16);
  *((_QWORD *)v15 + 9) = v11;
  v11[10] = v15;
  v17 = (morphun::TokenChain *)operator new();
  morphun::TokenChain::TokenChain(v17, v9, v15);
  return v17;
}

void sub_1CB5AE420(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10A1C40D65E1E45);
  _Unwind_Resume(a1);
}

uint64_t morphun::TokenChain::getTokenValue(morphun::TokenChain *this)
{
  uint64_t v2;

  v2 = (*(uint64_t (**)(morphun::TokenChain *))(*(_QWORD *)this + 152))(this);
  if (!v2)
    v2 = (*(uint64_t (**)(morphun::TokenChain *))(*(_QWORD *)this + 104))(this);
  return v2 + 16;
}

uint64_t morphun::TokenChain::getToken(morphun::TokenChain *this, int a2)
{
  int v2;
  uint64_t v3;
  std::basic_string<char16_t>::size_type v5;
  std::basic_string<char16_t> *p_p;
  std::basic_string<char16_t> v7;
  std::basic_string<char16_t> __p;

  if (a2 == -1)
    return (*(uint64_t (**)(morphun::TokenChain *))(*(_QWORD *)this + 104))(this);
  v2 = a2 - *((_DWORD *)this + 15);
  if (v2 >= 0)
  {
    v3 = *((_QWORD *)this + 4);
    if (v2 < (int)((unint64_t)(*((_QWORD *)this + 5) - v3) >> 3))
      return *(_QWORD *)(v3 + 8 * v2);
  }
  if (morphun::util::gLogLevel <= 4)
  {
    morphun::util::StringUtils::to_u16string((morphun::util::StringUtils *)a2, &v7);
    std::basic_string<char16_t>::insert(&v7, (std::basic_string<char16_t>::size_type)"A", (const std::basic_string<char16_t>::value_type *)0x2B, v5);
    __p = v7;
    memset(&v7, 0, sizeof(v7));
    if (morphun::util::gLogLevel <= 4)
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::basic_string<char16_t> *)__p.__r_.__value_.__r.__words[0];
      morphun::util::logToTopOfStackLogger((morphun::util *)4, 0, (uint64_t)p_p);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v7.__r_.__value_.__l.__data_);
  }
  return 0;
}

void sub_1CB5AE5A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

uint64_t morphun::TokenChain::toOriginatingString@<X0>(uint64_t this@<X0>, std::basic_string<char16_t> *a2@<X8>)
{
  uint64_t v2;
  uint64_t *v4;
  int v5;
  uint64_t v6;
  int v7;
  const std::basic_string<char16_t>::value_type *v8;
  std::basic_string<char16_t>::size_type v9;

  v2 = this;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  v4 = (uint64_t *)(this + 8);
  v5 = -1;
  while (1)
  {
    v6 = *v4;
    if (!*v4 || v6 == *(_QWORD *)(v2 + 16))
      break;
    this = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
    if ((int)this >= v5)
    {
      v7 = *(char *)(v6 + 39);
      if (v7 >= 0)
        v8 = (const std::basic_string<char16_t>::value_type *)(v6 + 16);
      else
        v8 = *(const std::basic_string<char16_t>::value_type **)(v6 + 16);
      if (v7 >= 0)
        v9 = *(unsigned __int8 *)(v6 + 39);
      else
        v9 = *(_QWORD *)(v6 + 24);
      std::basic_string<char16_t>::append(a2, v8, v9);
      this = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 32))(v6);
      v5 = this;
    }
    v4 = (uint64_t *)(v6 + 80);
  }
  return this;
}

void sub_1CB5AE684(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void *java_cast<morphun::Token_Head *,morphun::Token>(void *result)
{
  char *exception;

  if (result)
  {
    if (!result)
    {
      exception = (char *)__cxa_allocate_exception(0x38uLL);
      *(_OWORD *)(exception + 8) = 0u;
      *(_OWORD *)(exception + 24) = 0u;
      *(_OWORD *)(exception + 40) = 0u;
      *(_QWORD *)exception = &off_1E8673060;
    }
  }
  return result;
}

void sub_1CB5AE74C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1CB5AE7A4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

morphun::TokenChain *morphun::TokenChain::TokenChain(morphun::TokenChain *this, morphun::Token_Head *a2, morphun::Token_Tail *a3, const morphun::Token *a4)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v15;

  v8 = *((_QWORD *)a2 + 1);
  *(_QWORD *)this = v8;
  *(_QWORD *)((char *)this + *(_QWORD *)(v8 - 40)) = *((_QWORD *)a2 + 2);
  *((_QWORD *)this + 1) = a3;
  *((_QWORD *)this + 2) = a4;
  *((_DWORD *)this + 6) = 0;
  *((_BYTE *)this + 28) = 1;
  *((_DWORD *)this + 6) = morphun::Chunk::checkSize(a3, a4, a3);
  v9 = *(_QWORD *)a2;
  *(_QWORD *)this = *(_QWORD *)a2;
  *(_QWORD *)((char *)this + *(_QWORD *)(v9 - 40)) = *((_QWORD *)a2 + 3);
  npc<morphun::Token_Tail>((uint64_t)a4);
  v10 = (*(uint64_t (**)(const morphun::Token *))(*(_QWORD *)a4 + 32))(a4);
  npc<morphun::Token_Head>((uint64_t)a3);
  v11 = (*(uint64_t (**)(morphun::Token_Tail *))(*(_QWORD *)a3 + 24))(a3);
  v15 = 0;
  std::vector<morphun::Token *>::vector((_QWORD *)this + 4, v10 - v11 + 1, &v15);
  *((_QWORD *)this + 7) = 0;
  *((_DWORD *)this + 15) = (*(uint64_t (**)(morphun::Token_Tail *))(*(_QWORD *)a3 + 24))(a3);
  **((_QWORD **)this + 4) = a3;
  *(_QWORD *)(*((_QWORD *)this + 4)
            + 8
            * (int)((*(uint64_t (**)(morphun::Token_Tail *))(*(_QWORD *)a3 + 32))(a3)
                  - *((_DWORD *)this + 15))) = a3;
  *(_QWORD *)(*((_QWORD *)this + 4)
            + 8
            * (int)((*(uint64_t (**)(const morphun::Token *))(*(_QWORD *)a4 + 24))(a4)
                  - *((_DWORD *)this + 15))) = a4;
  *(_QWORD *)(*((_QWORD *)this + 4)
            + 8
            * (int)((*(uint64_t (**)(const morphun::Token *))(*(_QWORD *)a4 + 32))(a4)
                  - *((_DWORD *)this + 15))) = a4;
  v12 = *((_QWORD *)a3 + 10);
  do
  {
    if ((const morphun::Token *)v12 == a4)
      break;
    npc<morphun::Token>(v12);
    if (*(_DWORD *)(v12 + 12) > *(_DWORD *)(v12 + 8))
    {
      npc<morphun::Token>(v12);
      *(_QWORD *)(*((_QWORD *)this + 4)
                + 8
                * (int)((*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 24))(v12) - *((_DWORD *)this + 15))) = v12;
      *(_QWORD *)(*((_QWORD *)this + 4)
                + 8
                * (int)((*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 32))(v12) + ~*((_DWORD *)this + 15))) = v12;
    }
    npc<morphun::Token>(v12);
    v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 32))(v12);
    v12 = *(_QWORD *)(v12 + 80);
    npc<morphun::Token>(v12);
  }
  while ((*(int (**)(uint64_t))(*(_QWORD *)v12 + 24))(v12) >= v13);
  return this;
}

void sub_1CB5AE9C8(_Unwind_Exception *a1)
{
  morphun::Chunk *v1;
  uint64_t *v2;

  morphun::Chunk::~Chunk(v1, v2);
  _Unwind_Resume(a1);
}

void `virtual thunk to'morphun::TokenChain::~TokenChain(morphun::TokenChain *this)
{
}

{
  JUMPOUT(0x1D179D2ECLL);
}

morphun::TokenChain *morphun::TokenChain::createEmptyTokenChain(morphun::TokenChain *this)
{
  morphun::Token_Tail *v1;
  morphun::Token_Head *v2;
  morphun::TokenChain *v3;

  v1 = (morphun::Token_Tail *)operator new();
  morphun::Token_Tail::Token_Tail(v1, 0);
  v2 = (morphun::Token_Head *)operator new();
  morphun::Token_Head::Token_Head(v2, 0);
  *((_QWORD *)v2 + 10) = v1;
  *((_QWORD *)v1 + 9) = v2;
  v3 = (morphun::TokenChain *)operator new();
  morphun::TokenChain::TokenChain(v3, v2, v1);
  return v3;
}

void sub_1CB5AEAEC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1;
  MEMORY[0x1D179D2EC](v2, 0x10A1C40D65E1E45);
  _Unwind_Resume(a1);
}

uint64_t morphun::TokenChain::EMPTY_CHAIN(morphun::TokenChain *this)
{
  unsigned __int8 v1;
  morphun::TokenChain *v3;

  if ((v1 & 1) == 0)
  {
    if ((_DWORD)v3)
    {
      morphun::TokenChain::EMPTY_CHAIN(void)::EMPTY_CHAIN_ = (uint64_t)morphun::TokenChain::createEmptyTokenChain(v3);
    }
  }
  return morphun::TokenChain::EMPTY_CHAIN(void)::EMPTY_CHAIN_;
}

void sub_1CB5AEB94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t morphun::TokenChain::operator==(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  if (a1 == a2)
    return 1;
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 40))(a1);
  if (v4 != (*(unsigned int (**)(uint64_t))(*(_QWORD *)a2 + 40))(a2))
    return 0;
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1);
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 48))(a2);
  if (!v5)
    return v6 == 0;
  while (1)
  {
    result = morphun::Token::operator==(v5, v6);
    if (!(_DWORD)result)
      break;
    v5 = *(_QWORD *)(v5 + 80);
    v6 = *(_QWORD *)(v6 + 80);
    if (!v5)
      return v6 == 0;
  }
  return result;
}

uint64_t morphun::TokenChain::operator!=(uint64_t a1, uint64_t a2)
{
  return morphun::TokenChain::operator==(a1, a2) ^ 1;
}

uint64_t morphun::TokenChain::operator()(uint64_t a1, uint64_t a2)
{
  return (*(int (**)(uint64_t))(*(_QWORD *)a2 + 120))(a2);
}

std::basic_string<char16_t> *`virtual thunk to'morphun::TokenChain::toString@<X0>(morphun::TokenChain *this@<X0>, std::basic_string<char16_t> *a2@<X8>)
{
  return morphun::TokenChain::toString((morphun::TokenChain *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24)), a2);
}

void morphun::Token_Group::~Token_Group(morphun::Token_Group *this)
{
}

{
  JUMPOUT(0x1D179D2ECLL);
}

morphun::Token *morphun::Token_Group::newInstance(morphun::Token_Group *this, uint64_t a2)
{
  morphun::Token *v4;
  char *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v18;
  int v19;
  int v20;

  v4 = (morphun::Token *)operator new();
  v20 = (*(uint64_t (**)(morphun::Token_Group *))(*(_QWORD *)this + 24))(this);
  v19 = (*(uint64_t (**)(morphun::Token_Group *))(*(_QWORD *)this + 32))(this);
  v5 = (char *)this + 16;
  v6 = (void *)*((_QWORD *)this + 2);
  v7 = *((unsigned __int8 *)this + 39);
  v8 = *((_QWORD *)this + 3);
  v9 = (char *)this + 40;
  v18 = (void *)*((_QWORD *)this + 5);
  v10 = *((unsigned __int8 *)this + 63);
  v11 = *((_QWORD *)this + 6);
  v12 = morphun::Token_Group::cloneSubTokens(this, a2);
  if ((v7 & 0x80u) == 0)
    v13 = v5;
  else
    v13 = v6;
  if ((v7 & 0x80u) == 0)
    v14 = v7;
  else
    v14 = v8;
  if ((v10 & 0x80u) == 0)
    v15 = v9;
  else
    v15 = v18;
  if ((v10 & 0x80u) == 0)
    v16 = v10;
  else
    v16 = v11;
  *(_QWORD *)v4 = &off_1E8656D08;
  morphun::Token::Token(v4, (uint64_t *)&off_1E8667070, v20 - a2, v19 - a2, v13, v14, v15, v16, 1);
  *(_QWORD *)v4 = &off_1E866A348;
  *((_QWORD *)v4 + 11) = v12;
  return v4;
}

void sub_1CB5AEE18(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10B3C40DF864942);
  _Unwind_Resume(a1);
}

uint64_t morphun::Token_Group::getSubTokens(morphun::Token_Group *this)
{
  return *((_QWORD *)this + 11);
}

uint64_t morphun::Token_Group::cloneSubTokens(morphun::Token_Group *this, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  morphun::Chunk *v8;
  uint64_t v9;
  uint64_t v10;
  const morphun::Token *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const morphun::Token *v16;

  v3 = *((_QWORD *)this + 11);
  if (!v3 || (*(int (**)(uint64_t))(*(_QWORD *)v3 + 40))(v3) < 1)
    return 0;
  v5 = npc<morphun::Chunk>(*((_QWORD *)this + 11));
  v6 = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 48))(v5);
  v7 = npc<morphun::Token>((uint64_t)v6);
  v8 = (morphun::Chunk *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v7 + 40))(v7, a2);
  v9 = npc<morphun::Chunk>(*((_QWORD *)this + 11));
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 56))(v9);
  v11 = v8;
  if (v6 != (_QWORD *)v10)
  {
    v12 = (_QWORD *)v10;
    v13 = (uint64_t)v8;
    do
    {
      v6 = (_QWORD *)v6[10];
      v14 = npc<morphun::Token>((uint64_t)v6);
      v11 = (const morphun::Token *)(*(uint64_t (**)(uint64_t, uint64_t))(*v6 + 40))(v14, a2);
      *(_QWORD *)(npc<morphun::Token>((uint64_t)v11) + 72) = v13;
      npc<morphun::Token>(v13);
      *(_QWORD *)(v13 + 80) = v11;
      v13 = (uint64_t)v11;
    }
    while (v6 != v12);
  }
  v15 = operator new();
  *(_QWORD *)v15 = &off_1E866A820;
  *(_QWORD *)(v15 + 8) = v8;
  *(_QWORD *)(v15 + 16) = v11;
  *(_DWORD *)(v15 + 24) = 0;
  *(_BYTE *)(v15 + 28) = 1;
  *(_DWORD *)(v15 + 24) = morphun::Chunk::checkSize(v8, v11, v16);
  return v15;
}

void sub_1CB5AEF80(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10A1C401D7E7872);
  _Unwind_Resume(a1);
}

morphun::Token *morphun::Token_Group::Token_Group(morphun::Token *a1, int a2, int a3, void *__src, unint64_t a5, void *a6, unint64_t a7, uint64_t a8)
{
  morphun::Token *result;

  *(_QWORD *)a1 = &off_1E8656D08;
  result = morphun::Token::Token(a1, (uint64_t *)&off_1E8667070, a2, a3, __src, a5, a6, a7, 1);
  *(_QWORD *)result = &off_1E866A348;
  *((_QWORD *)result + 11) = a8;
  return result;
}

uint64_t npc<morphun::Chunk>(uint64_t result)
{
  morphun::exception::NullPointerException *exception;

  if (!result)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  return result;
}

void sub_1CB5AF054(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1CB5AF0AC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void morphun::Token_Group::~Token_Group(morphun::Token_Group *this, void **a2)
{
  _QWORD *v4;
  uint64_t v5;

  v4 = *a2;
  *(_QWORD *)this = *a2;
  *(_QWORD *)((char *)this + *(v4 - 8)) = a2[4];
  *(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 40)) = a2[5];
  v5 = *((_QWORD *)this + 11);
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 16))(v5);
  morphun::Token::~Token((void **)this, a2 + 1);
}

void `virtual thunk to'morphun::Token_Group::~Token_Group(morphun::Token_Group *this)
{
}

{
  JUMPOUT(0x1D179D2ECLL);
}

morphun::Token *morphun::Token_Group::Token_Group(morphun::Token *a1, uint64_t *a2, int a3, int a4, void *a5, unint64_t a6, void *a7, unint64_t a8, uint64_t a9)
{
  morphun::Token *result;
  uint64_t v11;

  result = morphun::Token::Token(a1, a2 + 1, a3, a4, a5, a6, a7, a8, 1);
  v11 = *a2;
  *(_QWORD *)result = *a2;
  *(_QWORD *)((char *)result + *(_QWORD *)(v11 - 64)) = a2[4];
  *(_QWORD *)((char *)result + *(_QWORD *)(*(_QWORD *)result - 40)) = a2[5];
  *((_QWORD *)result + 11) = a9;
  return result;
}

uint64_t npc<morphun::tokenizer::locale::fi::FiSegment const>(uint64_t result)
{
  morphun::exception::NullPointerException *exception;

  if (!result)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  return result;
}

void sub_1CB5AF214(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t morphun::tokenizer::locale::fi::FiSegment::FiSegment(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, int a7, int a8, char a9)
{
  unint64_t v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int v15;
  char v16;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;

  *(_QWORD *)a1 = a2;
  if (a4 < a7)
    goto LABEL_18;
  v10 = a8 - a7;
  v11 = a4 - a7;
  if (v11 >= v10)
    v11 = a8 - a7;
  *(_QWORD *)(a1 + 8) = a3 + 2 * a7;
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 24) = a3;
  *(_QWORD *)(a1 + 32) = a4;
  *(_QWORD *)(a1 + 40) = a5;
  *(_QWORD *)(a1 + 48) = a6;
  *(_QWORD *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 64) = a7;
  *(_DWORD *)(a1 + 68) = a8;
  *(_WORD *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 74) = a9;
  if (a6 < a8)
LABEL_18:
    std::__throw_out_of_range[abi:ne180100]("string_view::substr");
  if (a8 >= v10)
    v12 = a8 - a7;
  else
    v12 = a8;
  v13 = morphun::dictionary::metadata::MarisaTrie<int>::find((marisa::Trie *)(a2 + 40), a5 + 2 * (a6 - a8), v12);
  v14 = HIDWORD(v13);
  if (HIDWORD(v13))
  {
    if ((unsigned __int16)v13 <= 2u)
      v18 = 2;
    else
      v18 = (unsigned __int16)v13;
    v19 = v18 - 1;
    if ((unsigned __int16)v13 <= 0xF9Fu)
      v20 = v19;
    else
      v20 = 3998;
    v17 = FREQ_TO_LOG_PROB[v20];
    LODWORD(v14) = WORD1(v13) & 0x3F;
    v15 = (v13 >> 22) & 1;
    v16 = 1;
  }
  else
  {
    LOBYTE(v15) = 0;
    v16 = 0;
    v17 = 0;
  }
  *(_DWORD *)(a1 + 60) = v17;
  *(_DWORD *)(a1 + 56) = v14;
  *(_BYTE *)(a1 + 72) = v15;
  *(_BYTE *)(a1 + 73) = v16;
  return a1;
}

uint64_t morphun::tokenizer::locale::fi::FiSegment::FiSegment(uint64_t a1, uint64_t a2, int a3, int a4, char a5)
{
  npc<morphun::tokenizer::locale::fi::FiSegment const>(a2);
  return morphun::tokenizer::locale::fi::FiSegment::FiSegment(a1, *(_QWORD *)a2, *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 32), *(_QWORD *)(a2 + 40), *(_QWORD *)(a2 + 48), a3, a4, a5);
}

void morphun::tokenizer::locale::fi::FiSegment::addBoundaries(uint64_t a1, int **a2)
{
  int v3;
  int v5;
  morphun::tokenizer::locale::fi::FiSuffixSplit *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int *v11;
  int *v12;
  int *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  uint64_t v19;
  int *v20;
  unint64_t v21;
  int v22;
  morphun::exception::NullPointerException *exception;
  uint64_t v24;
  morphun::tokenizer::locale::fi::FiSuffixSplit *v25;
  unint64_t v26;
  _BYTE v27[80];

  if (*(_BYTE *)(a1 + 73))
  {
    v3 = *(_DWORD *)(a1 + 56);
    if (v3)
    {
      v5 = *(_DWORD *)(a1 + 68) - v3;
      morphun::tokenizer::locale::fi::FiSegment::FiSegment((uint64_t)v27, a1, *(_DWORD *)(a1 + 64), v5, 0);
      morphun::tokenizer::locale::fi::FiSegment::addBoundaries(v27, a2);
      v6 = (morphun::tokenizer::locale::fi::FiSuffixSplit *)morphun::tokenizer::locale::fi::FiSegment::FiSegment((uint64_t)&v24, a1, v5, *(_DWORD *)(a1 + 68), 1);
      if (*(_BYTE *)(a1 + 72)
        && (v7 = (uint64_t *)v25,
            v8 = v26,
            v9 = morphun::tokenizer::locale::fi::FiSuffixSplit::SUFFIXINFO(v6),
            !std::__hash_table<std::__hash_value_type<std::u16string_view,std::vector<int>>,std::__unordered_map_hasher<std::u16string_view,std::__hash_value_type<std::u16string_view,std::vector<int>>,std::hash<std::u16string_view>,std::equal_to<std::u16string_view>,true>,std::__unordered_map_equal<std::u16string_view,std::__hash_value_type<std::u16string_view,std::vector<int>>,std::equal_to<std::u16string_view>,std::hash<std::u16string_view>,true>,std::allocator<std::__hash_value_type<std::u16string_view,std::vector<int>>>>::find<std::u16string_view>(*(_QWORD *)v9, *(_QWORD *)(v9 + 8), v7, v8)))
      {
        if (!a2)
        {
          exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
          morphun::exception::NullPointerException::NullPointerException(exception);
        }
        v11 = a2[1];
        v10 = (unint64_t)a2[2];
        if ((unint64_t)v11 >= v10)
        {
          v13 = *a2;
          v14 = v11 - *a2;
          v15 = v14 + 1;
          if ((unint64_t)(v14 + 1) >> 62)
            std::vector<std::pair<morphun::dialog::DefaultArticleLookupFunction const*,std::vector<std::pair<std::basic_string<char16_t>,std::vector<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>> const>>::__throw_length_error[abi:ne180100]();
          v16 = v10 - (_QWORD)v13;
          if (v16 >> 1 > v15)
            v15 = v16 >> 1;
          v17 = (unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL;
          v18 = 0x3FFFFFFFFFFFFFFFLL;
          if (!v17)
            v18 = v15;
          if (v18)
          {
            v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v18);
            v13 = *a2;
            v11 = a2[1];
          }
          else
          {
            v19 = 0;
          }
          v20 = (int *)(v18 + 4 * v14);
          v21 = v18 + 4 * v19;
          *v20 = v5;
          v12 = v20 + 1;
          while (v11 != v13)
          {
            v22 = *--v11;
            *--v20 = v22;
          }
          *a2 = v20;
          a2[1] = v12;
          a2[2] = (int *)v21;
          if (v13)
            operator delete(v13);
        }
        else
        {
          *v11 = v5;
          v12 = v11 + 1;
        }
        a2[1] = v12;
        morphun::tokenizer::locale::fi::FiSegment::addBoundaries(&v24, a2);
      }
      else if (*(_BYTE *)(a1 + 74))
      {
        if (morphun::tokenizer::locale::fi::FiSuffixSplit::isInNotNominative(a1, (unsigned __int16 *)v25, v26))
          morphun::tokenizer::locale::fi::FiSuffixSplit::addSuffixInfo(v25, v26, a2, v5);
      }
    }
  }
}

void sub_1CB5AF548(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t **com::apple::siri::tokenizer::data::config_zh::getContent@<X0>(uint64_t **a1@<X8>)
{
  _OWORD v3[4];
  const __int16 *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3[2] = xmmword_1E86869B8;
  v3[3] = *(_OWORD *)&off_1E86869C8;
  v4 = L"/zh-Hant";
  v3[0] = xmmword_1E8686998;
  v3[1] = *(_OWORD *)&off_1E86869A8;
  return std::map<std::u16string_view,char16_t const*>::map[abi:ne180100](a1, (unsigned __int16 **)v3, 3);
}

uint64_t morphun::tokenizer::dictionary::DictionaryTokenizerConfig::DictionaryTokenizerConfig(uint64_t a1, _QWORD *a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  std::basic_string<char16_t> *v13;
  std::basic_string<char16_t>::size_type size;
  std::basic_string<char16_t> *v15;
  BOOL v16;
  char *v17;
  std::basic_string<char16_t>::value_type v18;
  BOOL v19;
  int v20;
  _QWORD *v21;
  _QWORD *v22;
  BOOL v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  std::basic_string<char16_t> *v27;
  std::basic_string<char16_t>::size_type v28;
  std::basic_string<char16_t> *v29;
  BOOL v30;
  char *v31;
  std::basic_string<char16_t>::value_type v32;
  int v33;
  _QWORD *v34;
  _QWORD *v35;
  std::basic_string<char16_t> v37;

  *(_OWORD *)a1 = xmmword_1CB5DD5F0;
  *(_OWORD *)(a1 + 16) = xmmword_1CB5DD600;
  *(_QWORD *)(a1 + 32) = 200;
  *(_DWORD *)(a1 + 40) = 100;
  *(_QWORD *)(a1 + 44) = 1036831949;
  *(_QWORD *)(a1 + 52) = 0;
  std::set<std::u16string_view>::set[abi:ne180100]((uint64_t *)(a1 + 64), (uint64_t)a2);
  std::set<std::u16string_view>::set[abi:ne180100]((uint64_t *)(a1 + 88), (uint64_t)a3);
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 128) = 0;
  std::vector<std::u16string_view>::__init_with_size[abi:ne180100]<std::u16string_view*,std::u16string_view*>((_QWORD *)(a1 + 112), *(const void **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 4);
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 152) = 0;
  std::vector<std::u16string_view>::__init_with_size[abi:ne180100]<std::u16string_view*,std::u16string_view*>((_QWORD *)(a1 + 136), *(const void **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 4);
  *(_QWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 160) = a1 + 168;
  *(_QWORD *)(a1 + 176) = 0;
  memset(&v37, 0, sizeof(v37));
  v12 = (_QWORD *)*a2;
  v10 = a2 + 1;
  v11 = v12;
  if (v12 != v10)
  {
    do
    {
      std::basic_string<char16_t>::__assign_external(&v37, (const std::basic_string<char16_t>::value_type *)v11[4], v11[5]);
      if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v13 = &v37;
      else
        v13 = (std::basic_string<char16_t> *)v37.__r_.__value_.__r.__words[0];
      if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v37.__r_.__value_.__r.__words[2]);
      else
        size = v37.__r_.__value_.__l.__size_;
      v15 = (std::basic_string<char16_t> *)((char *)v13 + 2 * size - 2);
      if (size)
        v16 = v15 > v13;
      else
        v16 = 0;
      if (v16)
      {
        v17 = (char *)&v13->__r_.__value_.__s.__data_[1];
        do
        {
          v18 = *((_WORD *)v17 - 1);
          *((_WORD *)v17 - 1) = v15->__r_.__value_.__s.__data_[0];
          v15->__r_.__value_.__s.__data_[0] = v18;
          v15 = (std::basic_string<char16_t> *)((char *)v15 - 2);
          v19 = v17 >= (char *)v15;
          v17 += 2;
        }
        while (!v19);
      }
      std::__tree<std::basic_string<char16_t>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::basic_string<char16_t> const&>((uint64_t **)(a1 + 160), (unsigned __int16 *)&v37, (uint64_t)&v37);
      v20 = *((_DWORD *)v11 + 10);
      if (*(_DWORD *)(a1 + 28) < v20)
        *(_DWORD *)(a1 + 28) = v20;
      v21 = (_QWORD *)v11[1];
      if (v21)
      {
        do
        {
          v22 = v21;
          v21 = (_QWORD *)*v21;
        }
        while (v21);
      }
      else
      {
        do
        {
          v22 = (_QWORD *)v11[2];
          v23 = *v22 == (_QWORD)v11;
          v11 = v22;
        }
        while (!v23);
      }
      v11 = v22;
    }
    while (v22 != v10);
  }
  v26 = (_QWORD *)*a3;
  v24 = a3 + 1;
  v25 = v26;
  if (v26 != v24)
  {
    do
    {
      std::basic_string<char16_t>::__assign_external(&v37, (const std::basic_string<char16_t>::value_type *)v25[4], v25[5]);
      if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v27 = &v37;
      else
        v27 = (std::basic_string<char16_t> *)v37.__r_.__value_.__r.__words[0];
      if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v28 = HIBYTE(v37.__r_.__value_.__r.__words[2]);
      else
        v28 = v37.__r_.__value_.__l.__size_;
      v29 = (std::basic_string<char16_t> *)((char *)v27 + 2 * v28 - 2);
      if (v28)
        v30 = v29 > v27;
      else
        v30 = 0;
      if (v30)
      {
        v31 = (char *)&v27->__r_.__value_.__s.__data_[1];
        do
        {
          v32 = *((_WORD *)v31 - 1);
          *((_WORD *)v31 - 1) = v29->__r_.__value_.__s.__data_[0];
          v29->__r_.__value_.__s.__data_[0] = v32;
          v29 = (std::basic_string<char16_t> *)((char *)v29 - 2);
          v19 = v31 >= (char *)v29;
          v31 += 2;
        }
        while (!v19);
      }
      std::__tree<std::basic_string<char16_t>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::basic_string<char16_t> const&>((uint64_t **)(a1 + 160), (unsigned __int16 *)&v37, (uint64_t)&v37);
      v33 = *((_DWORD *)v25 + 10);
      if (*(_DWORD *)(a1 + 28) < v33)
        *(_DWORD *)(a1 + 28) = v33;
      v34 = (_QWORD *)v25[1];
      if (v34)
      {
        do
        {
          v35 = v34;
          v34 = (_QWORD *)*v34;
        }
        while (v34);
      }
      else
      {
        do
        {
          v35 = (_QWORD *)v25[2];
          v23 = *v35 == (_QWORD)v25;
          v25 = v35;
        }
        while (!v23);
      }
      v25 = v35;
    }
    while (v35 != v24);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v37.__r_.__value_.__l.__data_);
  return a1;
}

void sub_1CB5AF870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;
  void **v16;
  void *v18;

  v18 = *v16;
  if (*v16)
  {
    *(_QWORD *)(v15 + 120) = v18;
    operator delete(v18);
  }
  std::__tree<std::__value_type<std::u16string_view,char16_t const*>,std::__map_value_compare<std::u16string_view,std::__value_type<std::u16string_view,char16_t const*>,std::less<std::u16string_view>,true>,std::allocator<std::__value_type<std::u16string_view,char16_t const*>>>::destroy(*(_QWORD **)(v15 + 96));
  std::__tree<std::__value_type<std::u16string_view,char16_t const*>,std::__map_value_compare<std::u16string_view,std::__value_type<std::u16string_view,char16_t const*>,std::less<std::u16string_view>,true>,std::allocator<std::__value_type<std::u16string_view,char16_t const*>>>::destroy(*(_QWORD **)(v15 + 72));
  _Unwind_Resume(a1);
}

void morphun::grammar::synthesis::EnGrammarSynthesizer_ArticleLookupFunction::~EnGrammarSynthesizer_ArticleLookupFunction(morphun::grammar::synthesis::EnGrammarSynthesizer_ArticleLookupFunction *this)
{
  *(_QWORD *)this = &off_1E866EEA8;
  morphun::grammar::synthesis::EnGrammarSynthesizer_CountLookupFunction::~EnGrammarSynthesizer_CountLookupFunction((morphun::grammar::synthesis::EnGrammarSynthesizer_ArticleLookupFunction *)((char *)this + 32));
}

{
  *(_QWORD *)this = &off_1E866EEA8;
  morphun::grammar::synthesis::EnGrammarSynthesizer_CountLookupFunction::~EnGrammarSynthesizer_CountLookupFunction((morphun::grammar::synthesis::EnGrammarSynthesizer_ArticleLookupFunction *)((char *)this + 32));
  JUMPOUT(0x1D179D2ECLL);
}

uint64_t morphun::grammar::synthesis::EnGrammarSynthesizer_ArticleLookupFunction::getFeatureValue(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v7;
  __int128 v8;
  std::basic_string<char16_t>::size_type size;
  morphun::grammar::synthesis::GrammemeConstants *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  unsigned __int16 *v16;
  unsigned __int16 *p_p;
  char v18;
  std::basic_string<char16_t> *v19;
  std::basic_string<char16_t>::size_type v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  std::basic_string<char16_t>::size_type v26;
  std::basic_string<char16_t>::size_type v27;
  uint64_t v28;
  std::basic_string<char16_t> *v29;
  char *v30;
  int v31;
  int v32;
  morphun::dictionary::DictionaryMetaData *v34;
  std::basic_string<char16_t> *v35;
  uint64_t v36;
  void *v37[2];
  char v38;
  void *__p;
  uint64_t v40;
  uint64_t v41;
  std::basic_string<char16_t> v42;

  if (a1[3])
  {
    v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 32))(a2);
    if (v5)
      return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*a1 + 32))(a1, a2, v5);
  }
  v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
  if (*(char *)(v7 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v42, *(const std::basic_string<char16_t>::value_type **)v7, *(_QWORD *)(v7 + 8));
  }
  else
  {
    v8 = *(_OWORD *)v7;
    v42.__r_.__value_.__r.__words[2] = *(_QWORD *)(v7 + 16);
    *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v8;
  }
  size = HIBYTE(v42.__r_.__value_.__r.__words[2]);
  if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v42.__r_.__value_.__l.__size_;
  if (!size)
    goto LABEL_63;
  morphun::grammar::synthesis::EnGrammarSynthesizer_CountLookupFunction::determine(a1 + 4, (uint64_t)&v42, &__p);
  v11 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL(v10);
  v12 = HIBYTE(v41);
  v13 = SHIBYTE(v41);
  if (v41 < 0)
    v12 = v40;
  v14 = *(unsigned __int8 *)(v11 + 23);
  v15 = (char)v14;
  if ((v14 & 0x80u) != 0)
    v14 = *(_QWORD *)(v11 + 8);
  if (v12 == v14)
  {
    if (!v12)
    {
LABEL_23:
      v18 = 0;
      if ((SHIBYTE(v41) & 0x80000000) == 0)
        goto LABEL_62;
LABEL_24:
      operator delete(__p);
      if ((v18 & 1) == 0)
        goto LABEL_63;
      goto LABEL_65;
    }
    if (v15 >= 0)
      v16 = (unsigned __int16 *)v11;
    else
      v16 = *(unsigned __int16 **)v11;
    p_p = (unsigned __int16 *)__p;
    if (v41 >= 0)
      p_p = (unsigned __int16 *)&__p;
    while (*v16 == *p_p)
    {
      ++p_p;
      ++v16;
      if (!--v12)
        goto LABEL_23;
    }
  }
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
  {
    v20 = v42.__r_.__value_.__l.__size_;
    if (v42.__r_.__value_.__l.__size_ <= 3)
      goto LABEL_53;
    v19 = (std::basic_string<char16_t> *)v42.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (HIBYTE(v42.__r_.__value_.__r.__words[2]) <= 3u)
      goto LABEL_53;
    v19 = &v42;
    v20 = HIBYTE(v42.__r_.__value_.__r.__words[2]);
  }
  v21 = 0;
  v22 = (uint64_t)v19 + 2 * v20 - 4;
  do
  {
    v23 = *(unsigned __int16 *)(v22 + v21 * 2);
    v24 = (unsigned __int16)word_1CB73E1EE[v21];
  }
  while (v24 == v23 && v21++ != 1);
  if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v26 = HIBYTE(v42.__r_.__value_.__r.__words[2]);
  else
    v26 = v42.__r_.__value_.__l.__size_;
  if (v24 == v23)
  {
    v27 = v26 - 2;
LABEL_52:
    std::basic_string<char16_t>::resize(&v42, v27, 0);
    goto LABEL_53;
  }
  v27 = v26 - 2;
  if (v26 >= 2)
  {
    v28 = 0;
    v29 = &v42;
    if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v29 = (std::basic_string<char16_t> *)v42.__r_.__value_.__r.__words[0];
    v30 = (char *)v29 + 2 * v27;
    do
    {
      v31 = *(unsigned __int16 *)&v30[v28 * 2];
      v32 = (unsigned __int16)aS_3[v28];
    }
    while (v32 == v31 && v28++ != 1);
    if (v32 == v31)
      goto LABEL_52;
  }
LABEL_53:
  v34 = (morphun::dictionary::DictionaryMetaData *)morphun::util::LocaleUtils::ENGLISH((morphun::util::LocaleUtils *)v11);
  if ((morphun::dictionary::PhraseProperties::isStartsWithVowel(v34, (uint64_t)&v42) & 1) != 0)
    goto LABEL_57;
  v35 = &v42;
  if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v35 = (std::basic_string<char16_t> *)v42.__r_.__value_.__r.__words[0];
  if (v35->__r_.__value_.__s.__data_[0] == 56)
  {
LABEL_57:
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v37, "a");
    v36 = (*(uint64_t (**)(_QWORD *, uint64_t, void **))(*a1 + 32))(a1, a2, v37);
  }
  else
  {
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v37, "a");
    v36 = (*(uint64_t (**)(_QWORD *, uint64_t, void **))(*a1 + 32))(a1, a2, v37);
  }
  v2 = v36;
  if (v38 < 0)
    operator delete(v37[0]);
  v18 = 1;
  if (v13 < 0)
    goto LABEL_24;
LABEL_62:
  if ((v18 & 1) == 0)
  {
LABEL_63:
    __p = 0;
    v40 = 0;
    v41 = 0;
    v2 = (*(uint64_t (**)(_QWORD *, uint64_t, void **))(*a1 + 32))(a1, a2, &__p);
    if (SHIBYTE(v41) < 0)
      operator delete(__p);
  }
LABEL_65:
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v42.__r_.__value_.__l.__data_);
  return v2;
}

void sub_1CB5AFC7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  char v26;

  if (a14 < 0)
    operator delete(__p);
  if (v26 < 0)
    operator delete(a15);
  if (a26 < 0)
    operator delete(a21);
  _Unwind_Resume(exception_object);
}

_QWORD *morphun::grammar::synthesis::EnGrammarSynthesizer_ArticleLookupFunction::EnGrammarSynthesizer_ArticleLookupFunction(_QWORD *a1, uint64_t a2, char *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *__p[2];
  char v10;

  *a1 = &off_1E865D758;
  *(_QWORD *)morphun::dialog::DefaultArticleLookupFunction::DefaultArticleLookupFunction((morphun::dialog::DefaultArticleLookupFunction *)a1, (const morphun::dialog::SemanticFeatureModel *)&off_1E86683E8, a2, a3 != 0, 1) = &off_1E866EEA8;
  if (a3)
  {
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, a3);
    v6 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>(a2 + 8, (unsigned __int16 *)__p);
    if (a2 + 16 == v6)
      v7 = 0;
    else
      v7 = *(_QWORD *)(v6 + 56);
    if (v10 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v7 = 0;
  }
  a1[3] = v7;
  morphun::grammar::synthesis::EnGrammarSynthesizer_CountLookupFunction::EnGrammarSynthesizer_CountLookupFunction((morphun::grammar::synthesis::EnGrammarSynthesizer_CountLookupFunction *)(a1 + 4));
  return a1;
}

morphun::Token_Tail *morphun::Token_Tail::newInstance(morphun::Token_Tail *this, int a2)
{
  morphun::Token_Tail *v4;
  int v5;

  v4 = (morphun::Token_Tail *)operator new();
  v5 = (*(uint64_t (**)(morphun::Token_Tail *))(*(_QWORD *)this + 24))(this);
  morphun::Token_Tail::Token_Tail(v4, v5 - a2);
  return v4;
}

void sub_1CB5AFE1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10B3C405B5873CALL);
  _Unwind_Resume(a1);
}

morphun::Token *morphun::Token_Tail::Token_Tail(morphun::Token_Tail *this, uint64_t *a2, int a3)
{
  morphun::Token *result;
  uint64_t v5;
  uint64_t v6;

  result = morphun::Token::Token(this, a2 + 2, a3, a3, &word_1CB73EB86, 0, &word_1CB73EB86, 0, 0);
  v5 = a2[1];
  *(_QWORD *)result = v5;
  *(_QWORD *)((char *)result + *(_QWORD *)(v5 - 64)) = a2[5];
  *(_QWORD *)((char *)result + *(_QWORD *)(*(_QWORD *)result - 40)) = a2[6];
  v6 = *a2;
  *(_QWORD *)result = *a2;
  *(_QWORD *)((char *)result + *(_QWORD *)(v6 - 64)) = a2[7];
  *(_QWORD *)((char *)result + *(_QWORD *)(*(_QWORD *)result - 40)) = a2[8];
  return result;
}

uint64_t msfc_isExists(uint64_t a1)
{
  morphun::exception::NullPointerException *exception;

  if (!a1)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
}

void sub_1CB5AFF30(_Unwind_Exception *a1, int a2)
{
  const std::exception *v2;
  void *v3;
  const void **v6;
  __CFError **v7;

  __cxa_free_exception(v3);
  if (a2 == 1)
  {
    v6 = (const void **)__cxa_begin_catch(a1);
    morphun::util::CFUtils::convert(v6, v2, v7);
    __cxa_end_catch();
    JUMPOUT(0x1CB5AFEF4);
  }
  _Unwind_Resume(a1);
}

CFStringRef msfc_createConstraintByNameCopy(uint64_t a1, const __CFString *a2)
{
  uint64_t v4;
  CFStringRef v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CFIndex v9;
  const UniChar *v10;
  _QWORD *v12;
  morphun::exception::NullPointerException *exception;
  __int128 v14;
  std::basic_string<char16_t> __p;

  npc<morphun::dialog::SemanticFeatureConceptBase const>(a1);
  morphun::util::CFUtils::to_u16string(&__p, a2);
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 40))(a1);
  v5 = (CFStringRef)v4;
  if (!v4)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  v6 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>(v4 + 8, (unsigned __int16 *)&__p);
  if (&v5->data == (char **)v6 || !*(_QWORD *)(v6 + 56))
  {
    v12 = __cxa_allocate_exception(0x38uLL);
    std::operator+[abi:ne180100]<char16_t,std::char_traits<char16_t>,std::allocator<char16_t>>((uint64_t)&v14, (const void **)&__p.__r_.__value_.__l.__data_, L" is not a valid feature name for the SemanticFeatureModel");
    morphun::exception::Throwable::Throwable((uint64_t)v12, &v14);
    *v12 = &off_1E8673120;
  }
  v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1);
  v8 = v7;
  if (v7)
  {
    if (*(char *)(v7 + 23) < 0)
    {
      v10 = *(const UniChar **)v7;
      v9 = *(_QWORD *)(v7 + 8);
    }
    else
    {
      v9 = *(unsigned __int8 *)(v7 + 23);
      v10 = (const UniChar *)v7;
    }
    v5 = CFStringCreateWithCharacters(0, v10, v9);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (!v8)
      return 0;
  }
  else if (!v8)
  {
    return 0;
  }
  return v5;
}

void sub_1CB5B00F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  const std::exception *v20;
  const void **v23;
  __CFError **v24;

  if (a20 < 0)
    operator delete(__p);
  if (a2 == 1)
  {
    v23 = (const void **)__cxa_begin_catch(exception_object);
    morphun::util::CFUtils::convert(v23, v20, v24);
    __cxa_end_catch();
    JUMPOUT(0x1CB5B004CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_1CB5B01DC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void msfc_putConstraintByName(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  std::basic_string<char16_t> __p;
  std::basic_string<char16_t> v7;

  npc<morphun::dialog::SemanticFeatureConceptBase>(a1);
  morphun::util::CFUtils::to_u16string(&v7, a2);
  morphun::util::CFUtils::to_u16string(&__p, a3);
  (*(void (**)(uint64_t, std::basic_string<char16_t> *, std::basic_string<char16_t> *))(*(_QWORD *)a1 + 72))(a1, &v7, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v7.__r_.__value_.__l.__data_);
}

void sub_1CB5B027C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  const std::exception *v20;
  const void **v23;
  __CFError **v24;

  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  if (a2 == 1)
  {
    v23 = (const void **)__cxa_begin_catch(exception_object);
    morphun::util::CFUtils::convert(v23, v20, v24);
    __cxa_end_catch();
    JUMPOUT(0x1CB5B0268);
  }
  _Unwind_Resume(exception_object);
}

void sub_1CB5B0338(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void msfc_clearConstraintByName(uint64_t a1, const __CFString *a2)
{
  std::basic_string<char16_t> __p;

  npc<morphun::dialog::SemanticFeatureConceptBase>(a1);
  morphun::util::CFUtils::to_u16string(&__p, a2);
  (*(void (**)(uint64_t, std::basic_string<char16_t> *))(*(_QWORD *)a1 + 88))(a1, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_1CB5B03B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  const std::exception *v15;
  const void **v18;
  __CFError **v19;

  if (a15 < 0)
    operator delete(__p);
  if (a2 == 1)
  {
    v18 = (const void **)__cxa_begin_catch(exception_object);
    morphun::util::CFUtils::convert(v18, v15, v19);
    __cxa_end_catch();
    JUMPOUT(0x1CB5B03A0);
  }
  _Unwind_Resume(exception_object);
}

uint64_t msfc_reset(uint64_t a1)
{
  uint64_t v1;

  v1 = npc<morphun::dialog::SemanticFeatureConceptBase>(a1);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 96))(v1);
}

uint64_t msfc_createFeatureValueByNameCopy(uint64_t a1, const __CFString *a2)
{
  uint64_t v4;
  std::basic_string<char16_t> __p;

  npc<morphun::dialog::SemanticFeatureConceptBase const>(a1);
  morphun::util::CFUtils::to_u16string(&__p, a2);
  v4 = (*(uint64_t (**)(uint64_t, std::basic_string<char16_t> *))(*(_QWORD *)a1 + 112))(a1, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v4;
}

void sub_1CB5B04E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  const std::exception *v15;
  const void **v18;
  __CFError **v19;

  if (a15 < 0)
    operator delete(__p);
  if (a2 == 1)
  {
    v18 = (const void **)__cxa_begin_catch(exception_object);
    morphun::util::CFUtils::convert(v18, v15, v19);
    __cxa_end_catch();
    JUMPOUT(0x1CB5B04D0);
  }
  _Unwind_Resume(exception_object);
}

uint64_t msfc_toSpeakableStringCopy(char *a1)
{
  morphun::exception::NullPointerException *exception;

  if (!a1)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  return (*(uint64_t (**)(char *))(*(_QWORD *)&a1[*(_QWORD *)(*(_QWORD *)a1 - 56)] + 24))(&a1[*(_QWORD *)(*(_QWORD *)a1 - 56)]);
}

void sub_1CB5B05B4(_Unwind_Exception *a1, int a2)
{
  const std::exception *v2;
  void *v3;
  const void **v6;
  __CFError **v7;

  __cxa_free_exception(v3);
  if (a2 == 1)
  {
    v6 = (const void **)__cxa_begin_catch(a1);
    morphun::util::CFUtils::convert(v6, v2, v7);
    __cxa_end_catch();
    JUMPOUT(0x1CB5B0578);
  }
  _Unwind_Resume(a1);
}

uint64_t msfc_toSpeakableStringWithDependencyCopy(char *lpsrc, uint64_t a2)
{
  void *v4;
  void *v5;

  if (lpsrc
  {
    v5 = v4;
    npc<morphun::dialog::SemanticFeatureConceptBase const>(a2);
    return (*(uint64_t (**)(void *, uint64_t))(*(_QWORD *)v5 + 136))(v5, a2);
  }
  else
  {
    npc<morphun::dialog::SemanticFeatureConceptBase const>((uint64_t)lpsrc);
    return (*(uint64_t (**)(char *))(*(_QWORD *)&lpsrc[*(_QWORD *)(*(_QWORD *)lpsrc - 56)] + 24))(&lpsrc[*(_QWORD *)(*(_QWORD *)lpsrc - 56)]);
  }
}

void sub_1CB5B069C(_Unwind_Exception *exception_object, int a2)
{
  const std::exception *v2;
  const void **v3;
  __CFError **v4;

  if (a2 == 1)
  {
    v3 = (const void **)__cxa_begin_catch(exception_object);
    morphun::util::CFUtils::convert(v3, v2, v4);
    __cxa_end_catch();
    JUMPOUT(0x1CB5B068CLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t msfc_clone(uint64_t a1)
{
  uint64_t v1;

  v1 = npc<morphun::dialog::SemanticFeatureConceptBase const>(a1);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 128))(v1);
}

uint64_t msfc_destroy(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

void morphun::grammar::synthesis::SvGrammarSynthesizer_GenderLookupFunction::~SvGrammarSynthesizer_GenderLookupFunction(morphun::grammar::synthesis::SvGrammarSynthesizer_GenderLookupFunction *this)
{
  void *v2;
  uint64_t v3;

  *(_QWORD *)this = &off_1E865D400;
  v2 = (void *)*((_QWORD *)this + 22);
  if (v2)
  {
    *((_QWORD *)this + 23) = v2;
    operator delete(v2);
  }
  v3 = *((_QWORD *)this + 20);
  *((_QWORD *)this + 20) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
  *((_QWORD *)this + 1) = &off_1E8671C00;
}

{
  morphun::grammar::synthesis::SvGrammarSynthesizer_GenderLookupFunction::~SvGrammarSynthesizer_GenderLookupFunction(this);
  JUMPOUT(0x1D179D2ECLL);
}

void morphun::grammar::synthesis::SvGrammarSynthesizer_GenderLookupFunction::determine(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  int v7;
  const UChar *v8;
  uint64_t v9;
  std::basic_string<char16_t> *CombinedBinaryType;
  uint64_t v11;
  const std::basic_string<char16_t> *v12;
  const std::basic_string<char16_t> *v13;
  uint64_t v14;

  morphun::dialog::DictionaryLookupFunction::determine((uint64_t)a1, a2, (_QWORD *)a3);
  v6 = *(unsigned __int8 *)(a3 + 23);
  if ((v6 & 0x80u) != 0)
    v6 = *(_QWORD *)(a3 + 8);
  if (!v6)
  {
    v14 = 0;
    v7 = *(char *)(a2 + 23);
    v8 = v7 >= 0 ? (const UChar *)a2 : *(const UChar **)a2;
    v9 = v7 >= 0 ? *(unsigned __int8 *)(a2 + 23) : *(_QWORD *)(a2 + 8);
    CombinedBinaryType = (std::basic_string<char16_t> *)morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(a1[26], (uint64_t)&v14, v8, v9);
    if (CombinedBinaryType)
    {
      v11 = v14;
      if ((a1[27] & v14) != 0)
      {
        v12 = (const std::basic_string<char16_t> *)morphun::grammar::synthesis::GrammemeConstants::GENDER_COMMON((morphun::grammar::synthesis::GrammemeConstants *)CombinedBinaryType);
        CombinedBinaryType = std::basic_string<char16_t>::operator=((std::basic_string<char16_t> *)a3, v12);
        v11 = v14;
      }
      if ((a1[28] & v11) != 0)
      {
        v13 = (const std::basic_string<char16_t> *)morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)CombinedBinaryType);
        std::basic_string<char16_t>::operator=((std::basic_string<char16_t> *)a3, v13);
      }
    }
  }
}

void sub_1CB5B08AC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

morphun::grammar::synthesis::SvGrammarSynthesizer_GenderLookupFunction *morphun::grammar::synthesis::SvGrammarSynthesizer_GenderLookupFunction::SvGrammarSynthesizer_GenderLookupFunction(morphun::grammar::synthesis::SvGrammarSynthesizer_GenderLookupFunction *this)
{
  morphun::grammar::synthesis::GrammemeConstants *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  morphun::grammar::synthesis::GrammemeConstants *v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t *BinaryProperties;
  morphun::grammar::synthesis::GrammemeConstants *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t *v17;
  std::basic_string<char16_t> *v19;
  char v20;
  std::basic_string<char16_t> v21;
  std::basic_string<char16_t> v22;
  std::basic_string<char16_t> v23;
  __int128 v24;

  *(_QWORD *)&v24 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)this = &off_1E865D3A8;
  v2 = (morphun::grammar::synthesis::GrammemeConstants *)morphun::util::LocaleUtils::SWEDISH(this);
  v3 = morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER(v2);
  if (*(char *)(v3 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v21, *(const std::basic_string<char16_t>::value_type **)v3, *(_QWORD *)(v3 + 8));
  }
  else
  {
    v4 = *(_OWORD *)v3;
    v21.__r_.__value_.__r.__words[2] = *(_QWORD *)(v3 + 16);
    *(_OWORD *)&v21.__r_.__value_.__l.__data_ = v4;
  }
  v5 = morphun::grammar::synthesis::GrammemeConstants::GENDER_COMMON((morphun::grammar::synthesis::GrammemeConstants *)v3);
  if (*(char *)(v5 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v22, *(const std::basic_string<char16_t>::value_type **)v5, *(_QWORD *)(v5 + 8));
  }
  else
  {
    v6 = *(_OWORD *)v5;
    v22.__r_.__value_.__r.__words[2] = *(_QWORD *)(v5 + 16);
    *(_OWORD *)&v22.__r_.__value_.__l.__data_ = v6;
  }
  memset(&v23, 0, sizeof(v23));
  v20 = 0;
  v23.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)operator new(0x30uLL);
  v23.__r_.__value_.__l.__size_ = v23.__r_.__value_.__r.__words[0];
  v23.__r_.__value_.__r.__words[2] = v23.__r_.__value_.__r.__words[0] + 48;
  v23.__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v23.__r_.__value_.__r.__words[2], (__int128 *)&v21, (__int128 *)&v23, (std::basic_string<char16_t> *)v23.__r_.__value_.__l.__data_);
  morphun::dialog::DictionaryLookupFunction::DictionaryLookupFunction((uint64_t)this, (uint64_t *)off_1E86682D0, v2, (uint64_t *)&v23);
  v19 = &v23;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v19);
  for (i = 0; i != -6; i -= 3)
  {
    if (SHIBYTE(v22.__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(*(void **)((char *)&v21 + i * 8 + 24));
  }
  *(_QWORD *)this = &off_1E866ECB8;
  v9 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 26) = v9;
  *((_QWORD *)this + 27) = 0;
  *((_QWORD *)this + 28) = 0;
  v10 = morphun::grammar::synthesis::GrammemeConstants::GENDER_COMMON(v7);
  if (*(char *)(v10 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v23, *(const std::basic_string<char16_t>::value_type **)v10, *(_QWORD *)(v10 + 8));
  }
  else
  {
    v11 = *(_OWORD *)v10;
    v23.__r_.__value_.__r.__words[2] = *(_QWORD *)(v10 + 16);
    *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v11;
  }
  memset(&v21, 0, sizeof(v21));
  v19 = &v21;
  v20 = 0;
  v21.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)operator new(0x18uLL);
  v21.__r_.__value_.__l.__size_ = v21.__r_.__value_.__r.__words[0];
  v21.__r_.__value_.__r.__words[2] = v21.__r_.__value_.__r.__words[0] + 24;
  v21.__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v21.__r_.__value_.__r.__words[2], (__int128 *)&v23, &v24, (std::basic_string<char16_t> *)v21.__r_.__value_.__l.__data_);
  BinaryProperties = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v9, (uint64_t *)this + 27, (uint64_t *)&v21);
  morphun::util::Validate::notNull<long long>((uint64_t)BinaryProperties);
  v19 = &v21;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v19);
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v23.__r_.__value_.__l.__data_);
  v14 = *((_QWORD *)this + 26);
  v15 = morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER(v13);
  if (*(char *)(v15 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v23, *(const std::basic_string<char16_t>::value_type **)v15, *(_QWORD *)(v15 + 8));
  }
  else
  {
    v16 = *(_OWORD *)v15;
    v23.__r_.__value_.__r.__words[2] = *(_QWORD *)(v15 + 16);
    *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v16;
  }
  memset(&v21, 0, sizeof(v21));
  v19 = &v21;
  v20 = 0;
  v21.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)operator new(0x18uLL);
  v21.__r_.__value_.__l.__size_ = v21.__r_.__value_.__r.__words[0];
  v21.__r_.__value_.__r.__words[2] = v21.__r_.__value_.__r.__words[0] + 24;
  v21.__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v21.__r_.__value_.__r.__words[2], (__int128 *)&v23, &v24, (std::basic_string<char16_t> *)v21.__r_.__value_.__l.__data_);
  v17 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v14, (uint64_t *)this + 28, (uint64_t *)&v21);
  morphun::util::Validate::notNull<long long>((uint64_t)v17);
  v19 = &v21;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v19);
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v23.__r_.__value_.__l.__data_);
  return this;
}

void sub_1CB5B0BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  morphun::dialog::DictionaryLookupFunction *v25;

  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a9);
  if (a25 < 0)
    operator delete(__p);
  morphun::dialog::DictionaryLookupFunction::~DictionaryLookupFunction(v25, (uint64_t *)off_1E86682D0);
  _Unwind_Resume(a1);
}

void morphun::grammar::synthesis::ArGrammarSynthesizer_AsPrepositionLookupFunction::~ArGrammarSynthesizer_AsPrepositionLookupFunction(morphun::grammar::synthesis::ArGrammarSynthesizer_AsPrepositionLookupFunction *this)
{
  JUMPOUT(0x1D179D2ECLL);
}

_QWORD *morphun::grammar::synthesis::ArGrammarSynthesizer_AsPrepositionLookupFunction::getArticle(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  morphun::lang::StringFilterUtil *v3;
  unint64_t v4;
  int v5;
  _QWORD *v6;
  void **v7;
  uint64_t v8;
  _QWORD *v9;
  std::basic_string<char16_t> *v10;
  int v11;
  void *v13[2];
  uint64_t v14;
  void *__p[2];
  unsigned __int8 v16;
  const void *v17[2];
  uint64_t v18;

  v17[0] = 0;
  v17[1] = 0;
  v18 = 0;
  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
  v3 = (morphun::lang::StringFilterUtil *)morphun::util::StringUtils::trim(v2, __p);
  v4 = v16;
  v5 = (char)v16;
  if ((v16 & 0x80u) != 0)
    v4 = (unint64_t)__p[1];
  if (!v4)
  {
    v9 = (_QWORD *)operator new();
    *v9 = &off_1E866AD28;
    v9[1] = 0;
    v9[3] = 0;
    v9[4] = 0;
    v9[2] = 0;
    if ((v5 & 0x80000000) == 0)
      return v9;
    goto LABEL_16;
  }
  v6 = (_QWORD *)morphun::lang::StringFilterUtil::ARABIC_SCRIPT(v3);
  v7 = (void **)__p[0];
  if (v5 >= 0)
    v7 = __p;
  if (MEMORY[0x1D179D958](*v6, *(unsigned __int16 *)v7))
  {
    v8 = 1;
    HIBYTE(v18) = 1;
    LOWORD(v17[0]) = 1603;
  }
  else
  {
    v8 = 3;
    HIBYTE(v18) = 3;
    LODWORD(v17[0]) = 104859203;
    WORD2(v17[0]) = 160;
  }
  *(_WORD *)((unint64_t)v17 | (2 * v8)) = 0;
  v9 = (_QWORD *)operator new();
  std::operator+[abi:ne180100]<char16_t,std::char_traits<char16_t>,std::allocator<char16_t>>((uint64_t)v13, v17, (const void **)__p);
  *v9 = &off_1E866AD28;
  v10 = (std::basic_string<char16_t> *)(v9 + 1);
  if (SHIBYTE(v14) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(v10, (const std::basic_string<char16_t>::value_type *)v13[0], (std::basic_string<char16_t>::size_type)v13[1]);
    v11 = SHIBYTE(v14);
    v9[4] = 0;
    if (v11 < 0)
    {
      operator delete(v13[0]);
      if ((v5 & 0x80000000) == 0)
        return v9;
      goto LABEL_16;
    }
    if ((v5 & 0x80000000) == 0)
      return v9;
LABEL_16:
    operator delete(__p[0]);
    return v9;
  }
  *(_OWORD *)&v10->__r_.__value_.__l.__data_ = *(_OWORD *)v13;
  v9[3] = v14;
  v9[4] = 0;
  if (v5 < 0)
    goto LABEL_16;
  return v9;
}

void sub_1CB5B0E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16)
{
  uint64_t v16;
  int v17;

  if (a15 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v16, 0x10B3C40F7FF9C27);
  if (v17 < 0)
    operator delete(a16);
  _Unwind_Resume(a1);
}

uint64_t morphun::analysis::Tokenizer::reset(uint64_t this)
{
  *(_QWORD *)(this + 96) = *(_QWORD *)(this + 104);
  *(_QWORD *)(this + 104) = 0;
  return this;
}

uint64_t morphun::analysis::Tokenizer::close(uint64_t this)
{
  *(_QWORD *)(this + 96) = 0;
  *(_QWORD *)(this + 104) = 0;
  return this;
}

morphun::analysis::util::AttributeSource *morphun::analysis::Tokenizer::Tokenizer(morphun::analysis::Tokenizer *this, uint64_t *a2)
{
  morphun::analysis::util::AttributeSource *result;
  uint64_t v5;
  uint64_t v6;

  morphun::analysis::TokenStream::DEFAULT_TOKEN_ATTRIBUTE_FACTORY(this);
  result = morphun::analysis::util::AttributeSource::AttributeSource(this, (const morphun::analysis::util::AttributeFactory *)(a2 + 2), morphun::analysis::TokenStream::DEFAULT_TOKEN_ATTRIBUTE_FACTORY(void)::DEFAULT_TOKEN_ATTRIBUTE_FACTORY_);
  v5 = a2[1];
  *(_QWORD *)this = v5;
  *(_QWORD *)((char *)this + *(_QWORD *)(v5 - 40)) = a2[4];
  v6 = *a2;
  *(_QWORD *)this = *a2;
  *(_QWORD *)((char *)this + *(_QWORD *)(v6 - 40)) = a2[5];
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 13) = 0;
  return result;
}

morphun::analysis::util::AttributeSource *morphun::analysis::Tokenizer::Tokenizer(morphun::analysis::Tokenizer *this, morphun::analysis::util::AttributeFactory *a2, uint64_t a3)
{
  morphun::analysis::util::AttributeSource *result;
  uint64_t v5;
  uint64_t v6;

  result = morphun::analysis::util::AttributeSource::AttributeSource(this, (morphun::analysis::util::AttributeFactory *)((char *)a2 + 16), a3);
  v5 = *((_QWORD *)a2 + 1);
  *(_QWORD *)result = v5;
  *(_QWORD *)((char *)result + *(_QWORD *)(v5 - 40)) = *((_QWORD *)a2 + 4);
  v6 = *(_QWORD *)a2;
  *(_QWORD *)result = *(_QWORD *)a2;
  *(_QWORD *)((char *)result + *(_QWORD *)(v6 - 40)) = *((_QWORD *)a2 + 5);
  *((_QWORD *)result + 12) = 0;
  *((_QWORD *)result + 13) = 0;
  return result;
}

uint64_t morphun::analysis::Tokenizer::correctOffset(morphun::analysis::Tokenizer *this, uint64_t a2)
{
  return a2;
}

uint64_t **com::apple::siri::tokenizer::data::config_it::getContent@<X0>(uint64_t **a1@<X8>)
{
  _OWORD v3[3];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = xmmword_1E86869E0;
  v3[1] = unk_1E86869F0;
  v3[2] = xmmword_1E8686A00;
  return std::map<std::u16string_view,char16_t const*>::map[abi:ne180100](a1, (unsigned __int16 **)v3, 2);
}

void morphun::dialog::language::ViCommonConceptFactory::~ViCommonConceptFactory(void **this)
{
  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(this, (void **)&off_1E8667D18);
}

{
  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(this, (void **)&off_1E8667D18);
  JUMPOUT(0x1D179D2ECLL);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::POS_ADJECTIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, "a");
    morphun::grammar::synthesis::GrammemeConstants::POS_ADJECTIVE(void)::POS_ADJECTIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::POS_ADJECTIVE(void)::POS_ADJECTIVE_);
}

void sub_1CB5B1084(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

void sub_1CB5B1100(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::POS_NOUN(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"noun");
    morphun::grammar::synthesis::GrammemeConstants::POS_NOUN(void)::POS_NOUN_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::POS_NOUN(void)::POS_NOUN_);
}

void sub_1CB5B1190(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::POS_ADPOSITION(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"adposition");
    morphun::grammar::synthesis::GrammemeConstants::POS_ADPOSITION(void)::POS_ADPOSITION_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::POS_ADPOSITION(void)::POS_ADPOSITION_);
}

void sub_1CB5B1244(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::POS_VERB(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"verb");
    morphun::grammar::synthesis::GrammemeConstants::POS_VERB(void)::POS_VERB_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::POS_VERB(void)::POS_VERB_);
}

void sub_1CB5B12F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::POS_DETERMINER(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"determiner");
    morphun::grammar::synthesis::GrammemeConstants::POS_DETERMINER(void)::POS_DETERMINER_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::POS_DETERMINER(void)::POS_DETERMINER_);
}

void sub_1CB5B13AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::POS_PROPER_NOUN(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"proper-noun");
    morphun::grammar::synthesis::GrammemeConstants::POS_PROPER_NOUN(void)::POS_PROPER_NOUN_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::POS_PROPER_NOUN(void)::POS_PROPER_NOUN_);
}

void sub_1CB5B1460(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_NOMINATIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"nominative");
    morphun::grammar::synthesis::GrammemeConstants::CASE_NOMINATIVE(void)::CASE_NOMINATIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_NOMINATIVE(void)::CASE_NOMINATIVE_);
}

void sub_1CB5B1514(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_ABLATIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, "a");
    morphun::grammar::synthesis::GrammemeConstants::CASE_ABLATIVE(void)::CASE_ABLATIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_ABLATIVE(void)::CASE_ABLATIVE_);
}

void sub_1CB5B15C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_ACCUSATIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"accusative");
    morphun::grammar::synthesis::GrammemeConstants::CASE_ACCUSATIVE(void)::CASE_ACCUSATIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_ACCUSATIVE(void)::CASE_ACCUSATIVE_);
}

void sub_1CB5B167C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_ADESSIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"adessive");
    morphun::grammar::synthesis::GrammemeConstants::CASE_ADESSIVE(void)::CASE_ADESSIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_ADESSIVE(void)::CASE_ADESSIVE_);
}

void sub_1CB5B1730(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_ALLATIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, "a");
    morphun::grammar::synthesis::GrammemeConstants::CASE_ALLATIVE(void)::CASE_ALLATIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_ALLATIVE(void)::CASE_ALLATIVE_);
}

void sub_1CB5B17E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_DATIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"dative");
    morphun::grammar::synthesis::GrammemeConstants::CASE_DATIVE(void)::CASE_DATIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_DATIVE(void)::CASE_DATIVE_);
}

void sub_1CB5B1898(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_ELATIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"elative");
    morphun::grammar::synthesis::GrammemeConstants::CASE_ELATIVE(void)::CASE_ELATIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_ELATIVE(void)::CASE_ELATIVE_);
}

void sub_1CB5B194C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_ESSIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"essive");
    morphun::grammar::synthesis::GrammemeConstants::CASE_ESSIVE(void)::CASE_ESSIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_ESSIVE(void)::CASE_ESSIVE_);
}

void sub_1CB5B1A00(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_GENITIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, "g");
    morphun::grammar::synthesis::GrammemeConstants::CASE_GENITIVE(void)::CASE_GENITIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_GENITIVE(void)::CASE_GENITIVE_);
}

void sub_1CB5B1AB4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_ILLATIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, "i");
    morphun::grammar::synthesis::GrammemeConstants::CASE_ILLATIVE(void)::CASE_ILLATIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_ILLATIVE(void)::CASE_ILLATIVE_);
}

void sub_1CB5B1B68(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_INESSIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"inessive");
    morphun::grammar::synthesis::GrammemeConstants::CASE_INESSIVE(void)::CASE_INESSIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_INESSIVE(void)::CASE_INESSIVE_);
}

void sub_1CB5B1C1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_INSTRUMENTAL(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, "i");
    morphun::grammar::synthesis::GrammemeConstants::CASE_INSTRUMENTAL(void)::CASE_INSTRUMENTAL_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_INSTRUMENTAL(void)::CASE_INSTRUMENTAL_);
}

void sub_1CB5B1CD0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_LOCATIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, "l");
    morphun::grammar::synthesis::GrammemeConstants::CASE_LOCATIVE(void)::CASE_LOCATIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_LOCATIVE(void)::CASE_LOCATIVE_);
}

void sub_1CB5B1D84(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_OBLIQUE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"oblique");
    morphun::grammar::synthesis::GrammemeConstants::CASE_OBLIQUE(void)::CASE_OBLIQUE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_OBLIQUE(void)::CASE_OBLIQUE_);
}

void sub_1CB5B1E38(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_PARTITIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"partitive");
    morphun::grammar::synthesis::GrammemeConstants::CASE_PARTITIVE(void)::CASE_PARTITIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_PARTITIVE(void)::CASE_PARTITIVE_);
}

void sub_1CB5B1EEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_PREPOSITIONAL(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"prepositional");
    morphun::grammar::synthesis::GrammemeConstants::CASE_PREPOSITIONAL(void)::CASE_PREPOSITIONAL_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_PREPOSITIONAL(void)::CASE_PREPOSITIONAL_);
}

void sub_1CB5B1FA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CASE_TRANSLATIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"translative");
    morphun::grammar::synthesis::GrammemeConstants::CASE_TRANSLATIVE(void)::CASE_TRANSLATIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CASE_TRANSLATIVE(void)::CASE_TRANSLATIVE_);
}

void sub_1CB5B2054(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::NUMBER_SINGULAR(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"singular");
    morphun::grammar::synthesis::GrammemeConstants::NUMBER_SINGULAR(void)::NUMBER_SINGULAR_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::NUMBER_SINGULAR(void)::NUMBER_SINGULAR_);
}

void sub_1CB5B2108(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::NUMBER_DUAL(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, "d");
    morphun::grammar::synthesis::GrammemeConstants::NUMBER_DUAL(void)::NUMBER_DUAL_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::NUMBER_DUAL(void)::NUMBER_DUAL_);
}

void sub_1CB5B21BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, "p");
    morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL(void)::NUMBER_PLURAL_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL(void)::NUMBER_PLURAL_);
}

void sub_1CB5B2270(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, "m");
    morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(void)::GENDER_MASCULINE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(void)::GENDER_MASCULINE_);
}

void sub_1CB5B2324(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"feminine");
    morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE(void)::GENDER_FEMININE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE(void)::GENDER_FEMININE_);
}

void sub_1CB5B23D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, "n");
    morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER(void)::GENDER_NEUTER_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER(void)::GENDER_NEUTER_);
}

void sub_1CB5B248C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::GENDER_COMMON(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"common");
    morphun::grammar::synthesis::GrammemeConstants::GENDER_COMMON(void)::GENDER_COMMON_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::GENDER_COMMON(void)::GENDER_COMMON_);
}

void sub_1CB5B2540(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_INDEFINITE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, "i");
    morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_INDEFINITE(void)::DEFINITENESS_INDEFINITE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_INDEFINITE(void)::DEFINITENESS_INDEFINITE_);
}

void sub_1CB5B25F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_DEFINITE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"definite");
    morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_DEFINITE(void)::DEFINITENESS_DEFINITE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_DEFINITE(void)::DEFINITENESS_DEFINITE_);
}

void sub_1CB5B26A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_CONSTRUCT(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, "c");
    morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_CONSTRUCT(void)::DEFINITENESS_CONSTRUCT_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_CONSTRUCT(void)::DEFINITENESS_CONSTRUCT_);
}

void sub_1CB5B275C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::PERSON_FIRST(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, "f");
    morphun::grammar::synthesis::GrammemeConstants::PERSON_FIRST(void)::PERSON_FIRST_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::PERSON_FIRST(void)::PERSON_FIRST_);
}

void sub_1CB5B2810(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::PERSON_SECOND(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, "s");
    morphun::grammar::synthesis::GrammemeConstants::PERSON_SECOND(void)::PERSON_SECOND_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::PERSON_SECOND(void)::PERSON_SECOND_);
}

void sub_1CB5B28C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::PERSON_THIRD(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"third");
    morphun::grammar::synthesis::GrammemeConstants::PERSON_THIRD(void)::PERSON_THIRD_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::PERSON_THIRD(void)::PERSON_THIRD_);
}

void sub_1CB5B2978(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::ANIMACY_ANIMATE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"animate");
    morphun::grammar::synthesis::GrammemeConstants::ANIMACY_ANIMATE(void)::ANIMACY_ANIMATE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::ANIMACY_ANIMATE(void)::ANIMACY_ANIMATE_);
}

void sub_1CB5B2A2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::ANIMACY_INANIMATE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"inanimate");
    morphun::grammar::synthesis::GrammemeConstants::ANIMACY_INANIMATE(void)::ANIMACY_INANIMATE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::ANIMACY_INANIMATE(void)::ANIMACY_INANIMATE_);
}

void sub_1CB5B2AE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::CLUSIVITY_EXCLUSIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"exclusive");
    morphun::grammar::synthesis::GrammemeConstants::CLUSIVITY_EXCLUSIVE(void)::CLUSIVITY_EXCLUSIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::CLUSIVITY_EXCLUSIVE(void)::CLUSIVITY_EXCLUSIVE_);
}

void sub_1CB5B2B94(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

uint64_t morphun::grammar::synthesis::GrammemeConstants::VERBTYPE_INFINITIVE(morphun::grammar::synthesis::GrammemeConstants *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v3, (char *)L"infinitive");
    morphun::grammar::synthesis::GrammemeConstants::VERBTYPE_INFINITIVE(void)::VERBTYPE_INFINITIVE_ = (uint64_t)v3;
  }
  return npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::VERBTYPE_INFINITIVE(void)::VERBTYPE_INFINITIVE_);
}

void sub_1CB5B2C48(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

void morphun::analysis::pt::BrazilianStemFilter::~BrazilianStemFilter(morphun::analysis::pt::BrazilianStemFilter *this)
{
  morphun::analysis::pt::BrazilianStemFilter::~BrazilianStemFilter(this);
  JUMPOUT(0x1D179D2ECLL);
}

{
  void *v2;
  void *v3;
  void *v4;
  void **v5;

  *((_QWORD *)this + 13) = &unk_1E8661EF0;
  *(_QWORD *)this = &unk_1E8661F48;
  v5 = (void **)((char *)this + 408);
  std::vector<std::vector<std::u16string_view>>::__destroy_vector::operator()[abi:ne180100](&v5);
  v2 = (void *)*((_QWORD *)this + 48);
  if (v2)
  {
    *((_QWORD *)this + 49) = v2;
    operator delete(v2);
  }
  *((_QWORD *)this + 13) = &unk_1E8661DE0;
  *(_QWORD *)this = &unk_1E8661E38;
  v3 = (void *)*((_QWORD *)this + 38);
  if (v3)
  {
    *((_QWORD *)this + 39) = v3;
    operator delete(v3);
  }
  v5 = (void **)((char *)this + 280);
  std::vector<std::vector<std::u16string_view>>::__destroy_vector::operator()[abi:ne180100](&v5);
  v4 = (void *)*((_QWORD *)this + 32);
  if (v4)
  {
    *((_QWORD *)this + 33) = v4;
    operator delete(v4);
  }
  *((_QWORD *)this + 13) = &unk_1E8661E78;
  *(_QWORD *)this = &unk_1E8661EB0;
  morphun::analysis::TokenFilter::~TokenFilter(this, (uint64_t *)&off_1E8669410);
}

uint64_t morphun::analysis::pt::BrazilianStemFilter::incrementToken(morphun::analysis::pt::BrazilianStemFilter *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  std::basic_string<char16_t>::size_type v7;
  std::basic_string<char16_t> *p_dst;
  uint64_t v9;
  uint64_t v10;
  std::basic_string<char16_t> *v11;
  std::basic_string<char16_t>::size_type size;
  std::basic_string<char16_t> *v13;
  std::basic_string<char16_t>::size_type v14;
  morphun::analysis::pt *v15;
  _QWORD *v16;
  uint64_t v17;
  int v18;
  char v19;
  int v20;
  std::basic_string<char16_t>::size_type v21;
  uint64_t v22;
  std::basic_string<char16_t>::size_type v23;
  BOOL v24;
  std::basic_string<char16_t>::size_type v25;
  std::basic_string<char16_t> *v26;
  std::basic_string<char16_t>::size_type v27;
  uint64_t v28;
  morphun::analysis::pt *v29;
  morphun::analysis::pt *v30;
  morphun::analysis::pt *v31;
  std::basic_string<char16_t> *v32;
  morphun::analysis::pt *v33;
  std::basic_string<char16_t>::size_type v34;
  std::basic_string<char16_t>::size_type v35;
  unsigned __int16 *v36;
  std::basic_string<char16_t> *v37;
  unsigned int v38;
  unsigned int v39;
  std::basic_string<char16_t>::size_type v40;
  std::basic_string<char16_t>::size_type v41;
  unsigned __int16 *v42;
  unsigned int v43;
  unsigned int v44;
  std::allocator<char16_t> *v45;
  std::basic_string<char16_t>::size_type v47;
  std::basic_string<char16_t>::size_type v48;
  std::basic_string<char16_t>::size_type v49;
  std::basic_string<char16_t> *v50;
  void **v51;
  const UChar *v52;
  uint64_t v53;
  uint64_t v54;
  std::basic_string<char16_t> *v55;
  std::basic_string<char16_t>::size_type v56;
  morphun::exception::NullPointerException *exception;
  morphun::exception::NullPointerException *v59;
  uint64_t v60;
  void *__p;
  char v62;
  char v63;
  std::basic_string<char16_t> v64;
  std::basic_string<char16_t> __str;
  char v66;
  uint64_t v67;
  std::basic_string<char16_t> __dst;
  std::basic_string<char16_t> v69;

  v2 = *((_QWORD *)this + 12);
  if (!v2)
    goto LABEL_118;
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  if (!(_DWORD)v3)
    return v3;
  v4 = *((_QWORD *)this + 55);
  if (v4)
  {
    if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 56))(v4) & 1) != 0)
      return v3;
  }
  v5 = (_QWORD *)*((_QWORD *)this + 54);
  if (!v5)
  {
LABEL_118:
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  v6 = (_QWORD *)((char *)v5 + *(_QWORD *)(*v5 - 96));
  if (*((char *)v6 + 23) < 0)
  {
    v7 = v6[1];
    if (v7 >= 0x7FFFFFFFFFFFFFF8)
      std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
    v6 = (_QWORD *)*v6;
  }
  else
  {
    v7 = *((unsigned __int8 *)v6 + 23);
  }
  if (v7 >= 0xB)
  {
    v9 = (v7 & 0x7FFFFFFFFFFFFFFCLL) + 4;
    if ((v7 | 3) != 0xB)
      v9 = v7 | 3;
    p_dst = (std::basic_string<char16_t> *)std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v9 + 1);
    __dst.__r_.__value_.__l.__size_ = v7;
    __dst.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)p_dst;
    goto LABEL_16;
  }
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v7;
  p_dst = &__dst;
  if (v7)
LABEL_16:
    memmove(p_dst, v6, 2 * v7);
  p_dst->__r_.__value_.__s.__data_[v7] = 0;
  v67 = 0;
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v11 = &__dst;
  else
    v11 = (std::basic_string<char16_t> *)__dst.__r_.__value_.__r.__words[0];
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
  else
    size = __dst.__r_.__value_.__l.__size_;
  morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(*((_QWORD *)this + 14), (uint64_t)&v67, (const UChar *)v11, size);
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v13 = &__dst;
  else
    v13 = (std::basic_string<char16_t> *)__dst.__r_.__value_.__r.__words[0];
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v14 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
  else
    v14 = __dst.__r_.__value_.__l.__size_;
  morphun::analysis::stemmer::DictionaryGenderedNounLemmatizer::getLemma(&__str, (uint64_t)this + 104, (unsigned __int16 *)v13, v14, v67);
  v16 = (_QWORD *)*((_QWORD *)this + 54);
  v17 = *(_QWORD *)(*v16 - 96);
  if (!v66)
  {
    v18 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
    v19 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
    if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v18 = __dst.__r_.__value_.__r.__words[1];
    if (v18 >= 4)
      v20 = 4;
    else
      v20 = v18;
    if (v20 < 1)
    {
LABEL_81:
      if ((v19 & 0x80) == 0)
      {
        *(_OWORD *)&v64.__r_.__value_.__l.__data_ = *(_OWORD *)&__dst.__r_.__value_.__l.__data_;
        v47 = __dst.__r_.__value_.__r.__words[2];
        goto LABEL_89;
      }
      std::basic_string<char16_t>::__init_copy_ctor_external(&v64, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
LABEL_93:
      v51 = (void **)((char *)v16 + v17);
      if (*((char *)v51 + 23) < 0)
        operator delete(*v51);
      *(std::basic_string<char16_t> *)v51 = v64;
      goto LABEL_96;
    }
    v60 = *(_QWORD *)(*v16 - 96);
    v21 = v18;
    if (v18 >= 4)
      v22 = 4;
    else
      v22 = v18;
    while (1)
    {
      v23 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
      if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v23 = __dst.__r_.__value_.__l.__size_;
      v24 = v23 >= v21 - v22;
      v25 = v23 - (v21 - v22);
      if (!v24)
        std::__throw_out_of_range[abi:ne180100]("string_view::substr");
      if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v26 = &__dst;
      else
        v26 = (std::basic_string<char16_t> *)__dst.__r_.__value_.__r.__words[0];
      if (v25 >= v21)
        v27 = v21;
      else
        v27 = v25;
      v28 = morphun::analysis::pt::inflectorMap(v15);
      v31 = *(morphun::analysis::pt **)(v28 + 8);
      v29 = (morphun::analysis::pt *)(v28 + 8);
      v30 = v31;
      if (v31)
      {
        v32 = (std::basic_string<char16_t> *)((char *)v26 + 2 * (v21 - v22));
        v33 = v29;
        do
        {
          v34 = *((_QWORD *)v30 + 5);
          if (v27 >= v34)
            v35 = *((_QWORD *)v30 + 5);
          else
            v35 = v27;
          if (v35)
          {
            v36 = (unsigned __int16 *)*((_QWORD *)v30 + 4);
            v37 = (std::basic_string<char16_t> *)((char *)v26 + 2 * (v21 - v22));
            while (1)
            {
              v38 = *v36;
              v39 = (unsigned __int16)v37->__r_.__value_.__s.__data_[0];
              if (v38 < v39)
              {
                v30 = (morphun::analysis::pt *)((char *)v30 + 8);
                goto LABEL_65;
              }
              if (v39 < v38)
                break;
              ++v36;
              v37 = (std::basic_string<char16_t> *)((char *)v37 + 2);
              if (!--v35)
                goto LABEL_60;
            }
            v33 = v30;
          }
          else
          {
LABEL_60:
            if (v34 < v27)
              v30 = (morphun::analysis::pt *)((char *)v30 + 8);
            else
              v33 = v30;
          }
LABEL_65:
          v30 = *(morphun::analysis::pt **)v30;
        }
        while (v30);
        if (v29 != v33)
        {
          v40 = *((_QWORD *)v33 + 5);
          if (v40 >= v27)
            v41 = v27;
          else
            v41 = *((_QWORD *)v33 + 5);
          if (v41)
          {
            v42 = (unsigned __int16 *)*((_QWORD *)v33 + 4);
            while (1)
            {
              v43 = (unsigned __int16)v32->__r_.__value_.__s.__data_[0];
              v44 = *v42;
              if (v43 < v44)
                break;
              if (v44 < v43)
                goto LABEL_77;
              v32 = (std::basic_string<char16_t> *)((char *)v32 + 2);
              ++v42;
              if (!--v41)
                goto LABEL_75;
            }
          }
          else
          {
LABEL_75:
            if (v27 >= v40)
              goto LABEL_77;
          }
        }
      }
      v33 = v29;
LABEL_77:
      v15 = (morphun::analysis::pt *)morphun::analysis::pt::inflectorMap(v29);
      if ((morphun::analysis::pt *)((char *)v15 + 8) != v33)
      {
        v48 = *((int *)v33 + 12);
        if (!(_DWORD)v48)
          v48 = v27;
        v49 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
        if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v49 = __dst.__r_.__value_.__l.__size_;
        v50 = std::basic_string<char16_t>::basic_string(&v69, &__dst, 0, v49 - v48, v45);
        v17 = v60;
        std::basic_string<char16_t>::append(v50, *((const std::basic_string<char16_t>::value_type **)v33 + 7), *((_QWORD *)v33 + 8));
        if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external(&v64, v69.__r_.__value_.__l.__data_, v69.__r_.__value_.__l.__size_);
          if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v69.__r_.__value_.__l.__data_);
        }
        else
        {
          *(_OWORD *)&v64.__r_.__value_.__l.__data_ = *(_OWORD *)&v69.__r_.__value_.__l.__data_;
          v47 = v69.__r_.__value_.__r.__words[2];
LABEL_89:
          v64.__r_.__value_.__r.__words[2] = v47;
        }
        goto LABEL_93;
      }
      if (v22-- <= 1)
      {
        v19 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
        v17 = v60;
        goto LABEL_81;
      }
    }
  }
  std::basic_string<char16_t>::operator=((std::basic_string<char16_t> *)((char *)v16 + v17), &__str);
LABEL_96:
  if (*((_QWORD *)this + 56))
  {
    v69.__r_.__value_.__r.__words[0] = 0;
    v52 = (const UChar *)(*((_QWORD *)this + 54) + *(_QWORD *)(**((_QWORD **)this + 54) - 96));
    if (*((char *)v52 + 23) < 0)
    {
      v52 = *(const UChar **)v52;
      v53 = *(_QWORD *)(*((_QWORD *)this + 54) + *(_QWORD *)(**((_QWORD **)this + 54) - 96) + 8);
    }
    else
    {
      v53 = *((unsigned __int8 *)v52 + 23);
    }
    if (morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(*((_QWORD *)this + 14), (uint64_t)&v69, v52, v53))
    {
      v54 = *((_QWORD *)this + 56);
      if (!v54)
      {
        v59 = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
        morphun::exception::NullPointerException::NullPointerException(v59);
      }
      (*(void (**)(uint64_t, std::basic_string<char16_t>::size_type))(*(_QWORD *)v54 + 64))(v54, v69.__r_.__value_.__r.__words[0]);
    }
  }
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v55 = &__dst;
  else
    v55 = (std::basic_string<char16_t> *)__dst.__r_.__value_.__r.__words[0];
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v56 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
  else
    v56 = __dst.__r_.__value_.__l.__size_;
  morphun::analysis::MorphologicalAnalyzerUtil::analyze_word((uint64_t)&__p, (uint64_t)v55, v56, v67, *((_QWORD *)this + 57), (uint64_t *)this + 13, 0);
  if (v63 && v62 < 0)
    operator delete(__p);
  if (v66 && SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  return v3;
}

void sub_1CB5B31A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  uint64_t v32;

  if (*(char *)(v32 - 89) < 0)
    operator delete(*(void **)(v32 - 112));
  if (a25 && a24 < 0)
    operator delete(__p);
  if (a32 < 0)
    operator delete(a27);
  _Unwind_Resume(exception_object);
}

void *morphun::analysis::pt::BrazilianStemFilter::reset(morphun::analysis::pt::BrazilianStemFilter *this)
{
  uint64_t v2;
  void *result;

  v2 = npc<morphun::analysis::TokenStream>(*((_QWORD *)this + 12));
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 40))(v2);
  *((_QWORD *)this + 55) = morphun::analysis::util::AttributeSource::getAttribute<morphun::analysis::tokenattributes::KeywordAttribute>((uint64_t)this);
  *((_QWORD *)this + 56) = morphun::analysis::util::AttributeSource::getAttribute<morphun::analysis::tokenattributes::GrammemeAttribute>((uint64_t)this);
  result = morphun::analysis::util::AttributeSource::getAttribute<morphun::analysis::tokenattributes::LemmaMappingAttribute>((uint64_t)this);
  *((_QWORD *)this + 57) = result;
  return result;
}

void `non-virtual thunk to'morphun::analysis::pt::BrazilianStemFilter::~BrazilianStemFilter(morphun::analysis::pt::BrazilianStemFilter *this)
{
  morphun::analysis::pt::BrazilianStemFilter::~BrazilianStemFilter((morphun::analysis::pt::BrazilianStemFilter *)((char *)this - 104));
}

{
  morphun::analysis::pt::BrazilianStemFilter::~BrazilianStemFilter((morphun::analysis::pt::BrazilianStemFilter *)((char *)this - 104));
  JUMPOUT(0x1D179D2ECLL);
}

uint64_t morphun::analysis::pt::inflectorMap(morphun::analysis::pt *this)
{
  unsigned __int8 v1;
  uint64_t result;
  uint64_t **v3;
  morphun::exception::NullPointerException *exception;
  unsigned __int16 *v5[2];
  int v6;
  __int16 *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  __int16 *v12;
  uint64_t v13;
  std::basic_string<char16_t>::value_type *v14;
  uint64_t v15;
  int v16;
  __int16 *v17;
  uint64_t v18;
  const __int16 *v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  int v26;
  const __int16 *v27;
  uint64_t v28;
  const __int16 *v29;
  uint64_t v30;
  int v31;
  const __int16 *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  int v36;
  __int16 *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  int v41;
  void *v42;
  uint64_t v43;
  const __int16 *v44;
  uint64_t v45;
  int v46;
  const __int16 *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  int v51;
  const __int16 *v52;
  uint64_t v53;
  std::basic_string<char16_t>::value_type *v54;
  uint64_t v55;
  int v56;
  __int16 *v57;
  uint64_t v58;
  __int16 *v59;
  uint64_t v60;
  int v61;
  __int16 *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  int v66;
  __int16 *v67;
  uint64_t v68;
  const std::basic_string<char16_t>::value_type *v69;
  uint64_t v70;
  int v71;
  __int16 *v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  if ((v1 & 1) == 0
  {
    v3 = (uint64_t **)operator new();
    v5[0] = (unsigned __int16 *)&unk_1CB73E582;
    v5[1] = (unsigned __int16 *)3;
    v6 = 0;
    v7 = word_1CB73E58A;
    v8 = 2;
    v9 = &unk_1CB73E590;
    v10 = 3;
    v11 = 0;
    v12 = word_1CB73E58A;
    v13 = 2;
    v14 = word_1CB73E598;
    v15 = 3;
    v16 = 0;
    v17 = word_1CB73E58A;
    v18 = 2;
    v19 = L"ns";
    v20 = 2;
    v21 = 0;
    v22 = "m";
    v23 = 1;
    v24 = "s";
    v25 = 4;
    v26 = 0;
    v27 = L"sse";
    v28 = 3;
    v29 = L"ois";
    v30 = 3;
    v31 = 0;
    v32 = L"ol";
    v33 = 2;
    v34 = "u";
    v35 = 3;
    v36 = 0;
    v37 = word_1CB73E5D2;
    v38 = 2;
    v39 = &unk_1CB73E5D8;
    v40 = 2;
    v41 = 0;
    v42 = &unk_1CB73E5DE;
    v43 = 2;
    v44 = L"eis";
    v45 = 3;
    v46 = 0;
    v47 = L"el";
    v48 = 2;
    v49 = &unk_1CB73E5F2;
    v50 = 3;
    v51 = 0;
    v52 = L"el";
    v53 = 2;
    v54 = word_1CB73E5FA;
    v55 = 4;
    v56 = 0;
    v57 = word_1CB73E604;
    v58 = 2;
    v59 = word_1CB73E60A;
    v60 = 3;
    v61 = 2;
    v62 = &word_1CB73EB86;
    v63 = 0;
    v64 = "r";
    v65 = 3;
    v66 = 2;
    v67 = &word_1CB73EB86;
    v68 = 0;
    v69 = "s";
    v70 = 1;
    v71 = 1;
    v72 = &word_1CB73EB86;
    v73 = 0;
    std::map<std::u16string_view,morphun::analysis::pt::BrazilianStemFilter_InflectionRule>::map[abi:ne180100](v3, v5, 14);
    morphun::analysis::pt::inflectorMap(void)::inflectorMap_ = (uint64_t)v3;
  }
  result = morphun::analysis::pt::inflectorMap(void)::inflectorMap_;
  if (!morphun::analysis::pt::inflectorMap(void)::inflectorMap_)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  return result;
}

void sub_1CB5B35DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t **std::map<std::u16string_view,morphun::analysis::pt::BrazilianStemFilter_InflectionRule>::map[abi:ne180100](uint64_t **a1, unsigned __int16 **a2, uint64_t a3)
{
  uint64_t *v4;
  unsigned __int16 **v5;
  uint64_t *v6;
  unsigned __int16 **v7;
  uint64_t **v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  BOOL v12;
  unint64_t v13;
  unsigned __int16 *v14;
  unsigned __int16 *v15;
  unsigned __int16 *v16;
  unsigned __int16 *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD *v22;
  __int128 v23;
  __int128 v24;
  uint64_t *v25;
  unsigned __int16 *v26;
  unsigned __int16 *v27;
  unsigned __int16 *v28;
  unsigned __int16 *v29;
  unsigned __int16 *v30;
  unsigned int v31;
  unsigned int v32;
  unsigned __int16 *v33;
  unsigned __int16 *v34;
  unsigned int v35;
  unsigned int v36;

  a1[1] = 0;
  v4 = (uint64_t *)(a1 + 1);
  a1[2] = 0;
  *a1 = (uint64_t *)(a1 + 1);
  if (a3)
  {
    v5 = a2;
    v6 = 0;
    v7 = &a2[5 * a3];
    v8 = a1 + 1;
    while (1)
    {
      v9 = v4;
      if (v8 != (uint64_t **)v4)
      {
        v10 = v6;
        v11 = v4;
        if (v6)
        {
          do
          {
            v9 = v10;
            v10 = (uint64_t *)v10[1];
          }
          while (v10);
        }
        else
        {
          do
          {
            v9 = (uint64_t *)v11[2];
            v12 = *v9 == (_QWORD)v11;
            v11 = v9;
          }
          while (v12);
        }
        v13 = v9[5];
        v14 = v5[1];
        if ((unint64_t)v14 >= v13)
          v15 = (unsigned __int16 *)v9[5];
        else
          v15 = v5[1];
        if (v15)
        {
          v16 = *v5;
          v17 = (unsigned __int16 *)v9[4];
          while (1)
          {
            v18 = *v17;
            v19 = *v16;
            if (v18 < v19)
              break;
            if (v19 < v18)
              goto LABEL_29;
            ++v17;
            ++v16;
            v15 = (unsigned __int16 *)((char *)v15 - 1);
            if (!v15)
              goto LABEL_16;
          }
        }
        else
        {
LABEL_16:
          if (v13 >= (unint64_t)v14)
          {
LABEL_29:
            v20 = v4;
            v21 = v4;
            if (!v6)
              goto LABEL_23;
            v21 = v4;
            while (2)
            {
              while (1)
              {
                v20 = v6;
                v26 = (unsigned __int16 *)v6[5];
                v27 = v26 >= v14 ? v5[1] : v26;
                if (v27)
                  break;
LABEL_39:
                if (v14 < v26)
                  goto LABEL_40;
LABEL_42:
                if (v27)
                {
                  v33 = (unsigned __int16 *)v20[4];
                  v34 = *v5;
                  while (1)
                  {
                    v35 = *v33;
                    v36 = *v34;
                    if (v35 < v36)
                      break;
                    if (v36 < v35)
                      goto LABEL_23;
                    ++v33;
                    ++v34;
                    v27 = (unsigned __int16 *)((char *)v27 - 1);
                    if (!v27)
                      goto LABEL_47;
                  }
                }
                else
                {
LABEL_47:
                  if (v26 >= v14)
                    goto LABEL_23;
                }
                v21 = v20 + 1;
                v6 = (uint64_t *)v20[1];
                if (!v6)
                  goto LABEL_24;
              }
              v28 = (unsigned __int16 *)v20[4];
              v29 = v27;
              v30 = *v5;
              while (1)
              {
                v31 = *v30;
                v32 = *v28;
                if (v31 < v32)
                  break;
                if (v32 < v31)
                  goto LABEL_42;
                ++v30;
                ++v28;
                v29 = (unsigned __int16 *)((char *)v29 - 1);
                if (!v29)
                  goto LABEL_39;
              }
LABEL_40:
              v6 = (uint64_t *)*v20;
              v21 = v20;
              if (!*v20)
                goto LABEL_24;
              continue;
            }
          }
        }
      }
      if (v6)
        v20 = v9;
      else
        v20 = v4;
      if (v6)
        v21 = v9 + 1;
      else
        v21 = v4;
LABEL_23:
      if (!*v21)
      {
LABEL_24:
        v22 = operator new(0x48uLL);
        v23 = *(_OWORD *)v5;
        v24 = *((_OWORD *)v5 + 1);
        v22[8] = v5[4];
        *((_OWORD *)v22 + 2) = v23;
        *((_OWORD *)v22 + 3) = v24;
        *v22 = 0;
        v22[1] = 0;
        v22[2] = v20;
        *v21 = (uint64_t)v22;
        v25 = (uint64_t *)**a1;
        if (v25)
        {
          *a1 = v25;
          v22 = (_QWORD *)*v21;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v22);
        a1[2] = (uint64_t *)((char *)a1[2] + 1);
      }
      v5 += 5;
      if (v5 == v7)
        return a1;
      v8 = (uint64_t **)*a1;
      v6 = a1[1];
    }
  }
  return a1;
}

void sub_1CB5B3848(_Unwind_Exception *a1)
{
  _QWORD **v1;

  std::__tree<std::__value_type<std::u16string_view,char16_t const*>,std::__map_value_compare<std::u16string_view,std::__value_type<std::u16string_view,char16_t const*>,std::less<std::u16string_view>,true>,std::allocator<std::__value_type<std::u16string_view,char16_t const*>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

void morphun::dialog::SemanticFeatureModel_DisplayValue::~SemanticFeatureModel_DisplayValue(morphun::dialog::SemanticFeatureModel_DisplayValue *this)
{
}

{
  JUMPOUT(0x1D179D2ECLL);
}

uint64_t morphun::dialog::SemanticFeatureModel_DisplayValue::getDisplayString(morphun::dialog::SemanticFeatureModel_DisplayValue *this)
{
  return (uint64_t)this + 8;
}

uint64_t morphun::dialog::SemanticFeatureModel_DisplayValue::getFeatureValue(morphun::dialog::SemanticFeatureModel_DisplayValue *this, const morphun::dialog::SemanticFeature *a2)
{
  morphun::dialog::SemanticFeatureModel_DisplayValue *v3;

  v3 = (morphun::dialog::SemanticFeatureModel_DisplayValue *)std::__tree<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::__map_value_compare<morphun::dialog::SemanticFeature,std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::less<morphun::dialog::SemanticFeature>,true>,std::allocator<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>>>::find<morphun::dialog::SemanticFeature>((uint64_t)this + 32, (uint64_t)a2);
  if ((morphun::dialog::SemanticFeatureModel_DisplayValue *)((char *)this + 40) == v3)
    return 0;
  else
    return (uint64_t)v3 + 104;
}

uint64_t morphun::dialog::SemanticFeatureModel_DisplayValue::getConstraintMap(morphun::dialog::SemanticFeatureModel_DisplayValue *this)
{
  return (uint64_t)this + 32;
}

void morphun::dialog::SemanticFeatureModel_DisplayValue::~SemanticFeatureModel_DisplayValue(morphun::dialog::SemanticFeatureModel_DisplayValue *this, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  *(_QWORD *)this = *a2;
  *(_QWORD *)((char *)this + *(_QWORD *)(v3 - 40)) = a2[1];
  std::__tree<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::__map_value_compare<morphun::dialog::SemanticFeature,std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::less<morphun::dialog::SemanticFeature>,true>,std::allocator<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>>>::destroy(*((void ***)this + 5));
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

uint64_t morphun::dialog::SemanticFeatureModel_DisplayValue::SemanticFeatureModel_DisplayValue(uint64_t a1, uint64_t *a2, __int128 *a3, uint64_t a4)
{
  uint64_t v6;
  __int128 v7;

  v6 = *a2;
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + *(_QWORD *)(v6 - 40)) = a2[1];
  if (*((char *)a3 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)(a1 + 8), *(const std::basic_string<char16_t>::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v7 = *a3;
    *(_QWORD *)(a1 + 24) = *((_QWORD *)a3 + 2);
    *(_OWORD *)(a1 + 8) = v7;
  }
  std::map<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>::map[abi:ne180100]((_QWORD *)(a1 + 32), a4);
  return a1;
}

void sub_1CB5B399C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

uint64_t morphun::dialog::SemanticFeatureModel_DisplayValue::SemanticFeatureModel_DisplayValue(uint64_t a1, __int128 *a2, uint64_t a3)
{
  __int128 v5;

  *(_QWORD *)a1 = &off_1E866B6A0;
  if (*((char *)a2 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)(a1 + 8), *(const std::basic_string<char16_t>::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 2);
    *(_OWORD *)(a1 + 8) = v5;
  }
  std::map<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>::map[abi:ne180100]((_QWORD *)(a1 + 32), a3);
  return a1;
}

void sub_1CB5B3A2C(_Unwind_Exception *exception_object)
{
  void **v1;
  uint64_t v2;

  if (*(char *)(v2 + 31) < 0)
    operator delete(*v1);
  _Unwind_Resume(exception_object);
}

uint64_t morphun::dialog::SemanticFeatureModel_DisplayValue::SemanticFeatureModel_DisplayValue(uint64_t a1, uint64_t *a2, __int128 *a3)
{
  void ***v5;
  void **v6[2];

  v6[0] = 0;
  v6[1] = 0;
  v5 = v6;
  morphun::dialog::SemanticFeatureModel_DisplayValue::SemanticFeatureModel_DisplayValue(a1, a2, a3, (uint64_t)&v5);
  std::__tree<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::__map_value_compare<morphun::dialog::SemanticFeature,std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::less<morphun::dialog::SemanticFeature>,true>,std::allocator<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>>>::destroy(v6[0]);
  return a1;
}

void sub_1CB5B3A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void **a11)
{
  std::__tree<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::__map_value_compare<morphun::dialog::SemanticFeature,std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::less<morphun::dialog::SemanticFeature>,true>,std::allocator<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>>>::destroy(a11);
  _Unwind_Resume(a1);
}

uint64_t morphun::dialog::SemanticFeatureModel_DisplayValue::SemanticFeatureModel_DisplayValue(uint64_t a1, __int128 *a2)
{
  void ***v4;
  void **v5[2];

  v5[0] = 0;
  v5[1] = 0;
  v4 = v5;
  morphun::dialog::SemanticFeatureModel_DisplayValue::SemanticFeatureModel_DisplayValue(a1, a2, (uint64_t)&v4);
  std::__tree<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::__map_value_compare<morphun::dialog::SemanticFeature,std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::less<morphun::dialog::SemanticFeature>,true>,std::allocator<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>>>::destroy(v5[0]);
  return a1;
}

void sub_1CB5B3AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void **a11)
{
  std::__tree<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::__map_value_compare<morphun::dialog::SemanticFeature,std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::less<morphun::dialog::SemanticFeature>,true>,std::allocator<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>>>::destroy(a11);
  _Unwind_Resume(a1);
}

uint64_t **morphun::dialog::SemanticFeatureModel_DisplayValue::SemanticFeatureModel_DisplayValue(uint64_t **this, const morphun::dialog::SpeakableString *a2, const morphun::dialog::SemanticFeature *a3, const morphun::dialog::SemanticFeature *a4)
{
  __int128 *v8;
  __int128 *v9;
  void ***v11;
  void **v12[2];

  v8 = (__int128 *)(*(uint64_t (**)(const morphun::dialog::SemanticFeature *))(*(_QWORD *)a3 + 32))(a3);
  v12[0] = 0;
  v12[1] = 0;
  v11 = v12;
  morphun::dialog::SemanticFeatureModel_DisplayValue::SemanticFeatureModel_DisplayValue((uint64_t)this, (uint64_t *)a2, v8, (uint64_t)&v11);
  std::__tree<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::__map_value_compare<morphun::dialog::SemanticFeature,std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::less<morphun::dialog::SemanticFeature>,true>,std::allocator<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>>>::destroy(v12[0]);
  if (((*(uint64_t (**)(const morphun::dialog::SemanticFeature *))(*(_QWORD *)a3 + 48))(a3) & 1) == 0)
  {
    v9 = (__int128 *)(*(uint64_t (**)(const morphun::dialog::SemanticFeature *))(*(_QWORD *)a3 + 40))(a3);
    std::__tree<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::__map_value_compare<morphun::dialog::SemanticFeature,std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::less<morphun::dialog::SemanticFeature>,true>,std::allocator<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>>>::__emplace_unique_key_args<morphun::dialog::SemanticFeature,morphun::dialog::SemanticFeature const&,std::basic_string<char16_t> const&>(this + 4, (uint64_t)a4, a4, v9);
  }
  return this;
}

void sub_1CB5B3BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void **a11)
{
  std::__tree<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::__map_value_compare<morphun::dialog::SemanticFeature,std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::less<morphun::dialog::SemanticFeature>,true>,std::allocator<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>>>::destroy(a11);
  _Unwind_Resume(a1);
}

uint64_t **morphun::dialog::SemanticFeatureModel_DisplayValue::SemanticFeatureModel_DisplayValue(uint64_t **this, const morphun::dialog::SpeakableString *a2, const morphun::dialog::SemanticFeature *a3)
{
  __int128 *v6;
  __int128 *v7;
  void ***v9;
  void **v10[2];

  v6 = (__int128 *)(*(uint64_t (**)(const morphun::dialog::SpeakableString *))(*(_QWORD *)a2 + 32))(a2);
  v10[0] = 0;
  v10[1] = 0;
  v9 = v10;
  morphun::dialog::SemanticFeatureModel_DisplayValue::SemanticFeatureModel_DisplayValue((uint64_t)this, v6, (uint64_t)&v9);
  std::__tree<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::__map_value_compare<morphun::dialog::SemanticFeature,std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::less<morphun::dialog::SemanticFeature>,true>,std::allocator<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>>>::destroy(v10[0]);
  if (((*(uint64_t (**)(const morphun::dialog::SpeakableString *))(*(_QWORD *)a2 + 48))(a2) & 1) == 0)
  {
    v7 = (__int128 *)(*(uint64_t (**)(const morphun::dialog::SpeakableString *))(*(_QWORD *)a2 + 40))(a2);
    std::__tree<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::__map_value_compare<morphun::dialog::SemanticFeature,std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::less<morphun::dialog::SemanticFeature>,true>,std::allocator<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>>>::__emplace_unique_key_args<morphun::dialog::SemanticFeature,morphun::dialog::SemanticFeature const&,std::basic_string<char16_t> const&>(this + 4, (uint64_t)a3, a3, v7);
  }
  return this;
}

void sub_1CB5B3C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void **a11)
{
  std::__tree<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::__map_value_compare<morphun::dialog::SemanticFeature,std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>,std::less<morphun::dialog::SemanticFeature>,true>,std::allocator<std::__value_type<morphun::dialog::SemanticFeature,std::basic_string<char16_t>>>>::destroy(a11);
  _Unwind_Resume(a1);
}

void `virtual thunk to'morphun::dialog::SemanticFeatureModel_DisplayValue::~SemanticFeatureModel_DisplayValue(morphun::dialog::SemanticFeatureModel_DisplayValue *this)
{
}

{
  JUMPOUT(0x1D179D2ECLL);
}

BOOL morphun::dialog::SemanticFeatureModel_DisplayValue::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  unsigned __int16 *v6;
  unsigned __int16 *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _BOOL8 result;
  _QWORD *v12;
  _QWORD *v13;
  BOOL v14;
  _QWORD *v15;
  _QWORD *v16;

  v2 = *(unsigned __int8 *)(a1 + 31);
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a1 + 16);
  v4 = *(unsigned __int8 *)(a2 + 31);
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = *(_QWORD *)(a2 + 16);
  if (v2 != v4)
    return 0;
  if (v2)
  {
    if (v5 >= 0)
      v6 = (unsigned __int16 *)(a2 + 8);
    else
      v6 = *(unsigned __int16 **)(a2 + 8);
    if (v3 >= 0)
      v7 = (unsigned __int16 *)(a1 + 8);
    else
      v7 = *(unsigned __int16 **)(a1 + 8);
    while (*v6 == *v7)
    {
      ++v7;
      ++v6;
      if (!--v2)
        goto LABEL_15;
    }
    return 0;
  }
LABEL_15:
  if (*(_QWORD *)(a1 + 48) != *(_QWORD *)(a2 + 48))
    return 0;
  v8 = *(_QWORD **)(a1 + 32);
  v9 = (_QWORD *)(a1 + 40);
  if (v8 == (_QWORD *)(a1 + 40))
    return 1;
  v10 = *(_QWORD **)(a2 + 32);
  do
  {
    result = std::__equal_to::operator()[abi:ne180100]<std::pair<morphun::dialog::SemanticFeature const,std::basic_string<char16_t>>,std::pair<morphun::dialog::SemanticFeature const,std::basic_string<char16_t>>>((uint64_t)(v8 + 4), (uint64_t)(v10 + 4));
    if (!result)
      break;
    v12 = (_QWORD *)v8[1];
    v13 = v8;
    if (v12)
    {
      do
      {
        v8 = v12;
        v12 = (_QWORD *)*v12;
      }
      while (v12);
    }
    else
    {
      do
      {
        v8 = (_QWORD *)v13[2];
        v14 = *v8 == (_QWORD)v13;
        v13 = v8;
      }
      while (!v14);
    }
    v15 = (_QWORD *)v10[1];
    if (v15)
    {
      do
      {
        v16 = v15;
        v15 = (_QWORD *)*v15;
      }
      while (v15);
    }
    else
    {
      do
      {
        v16 = (_QWORD *)v10[2];
        v14 = *v16 == (_QWORD)v10;
        v10 = v16;
      }
      while (!v14);
    }
    v10 = v16;
  }
  while (v8 != v9);
  return result;
}

BOOL morphun::dialog::SemanticFeatureModel_DisplayValue::operator!=(uint64_t a1, uint64_t a2)
{
  return !morphun::dialog::SemanticFeatureModel_DisplayValue::operator==(a1, a2);
}

unint64_t morphun::dialog::SemanticFeatureModel_DisplayValue::hashCode(morphun::dialog::SemanticFeatureModel_DisplayValue *this)
{
  char *v1;
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (char *)*((_QWORD *)this + 1);
  v1 = (char *)this + 8;
  v2 = v3;
  v4 = *((_QWORD *)v1 + 1);
  if (v1[23] >= 0)
  {
    v5 = v1[23];
  }
  else
  {
    v1 = v2;
    v5 = v4;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t *)v1, 2 * v5);
}

unint64_t morphun::dialog::SemanticFeatureModel_DisplayValue::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = *(uint64_t **)(a2 + 8);
  v2 = a2 + 8;
  v3 = v4;
  v5 = *(char *)(v2 + 23);
  if (v5 >= 0)
    v6 = (uint64_t *)v2;
  else
    v6 = v3;
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v2 + 23);
  else
    v7 = *(_QWORD *)(v2 + 8);
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](v6, 2 * v7);
}

void morphun::grammar::synthesis::FiGrammarSynthesizer_WithHyphenSuffixLookupFunction::~FiGrammarSynthesizer_WithHyphenSuffixLookupFunction(morphun::grammar::synthesis::FiGrammarSynthesizer_WithHyphenSuffixLookupFunction *this)
{
  JUMPOUT(0x1D179D2ECLL);
}

_QWORD *morphun::grammar::synthesis::FiGrammarSynthesizer_WithHyphenSuffixLookupFunction::getFeatureValue(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  void **v9;
  const void *v10;
  std::basic_string<char16_t> *v11;
  int v13;
  void *__p[2];
  uint64_t v15;

  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
  v3 = v2;
  v4 = *(unsigned __int8 *)(v2 + 23);
  if ((v4 & 0x80u) == 0)
    v5 = (char *)v2;
  else
    v5 = *(char **)v2;
  if ((v4 & 0x80u) != 0)
    v4 = *(_QWORD *)(v2 + 8);
  if (!v4)
  {
    v7 = (_QWORD *)operator new();
LABEL_26:
    morphun::dialog::SpeakableString::SpeakableString(v7, (__int128 *)v3);
    return v7;
  }
  v6 = v5;
  while (*(_WORD *)v6 != 32)
  {
    v6 += 2;
    if (!--v4)
    {
      v6 = 0;
      break;
    }
  }
  v7 = (_QWORD *)operator new();
  if (!v6 || v6 - v5 == -2)
    goto LABEL_26;
  if (*(char *)(v3 + 23) >= 0)
    v8 = *(unsigned __int8 *)(v3 + 23);
  else
    v8 = *(_QWORD *)(v3 + 8);
  v9 = __p;
  std::basic_string<char16_t>::basic_string[abi:ne180100]((uint64_t)__p, v8 + 1);
  if (v15 < 0)
    v9 = (void **)__p[0];
  if (v8)
  {
    if (*(char *)(v3 + 23) >= 0)
      v10 = (const void *)v3;
    else
      v10 = *(const void **)v3;
    memmove(v9, v10, 2 * v8);
  }
  *(_DWORD *)((char *)v9 + 2 * v8) = 32;
  *v7 = &off_1E866AD28;
  v11 = (std::basic_string<char16_t> *)(v7 + 1);
  if (SHIBYTE(v15) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(v11, (const std::basic_string<char16_t>::value_type *)__p[0], (std::basic_string<char16_t>::size_type)__p[1]);
    v13 = SHIBYTE(v15);
    v7[4] = 0;
    if (v13 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    v7[3] = v15;
    v7[4] = 0;
  }
  return v7;
}

void sub_1CB5B404C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v15, 0x10B3C40F7FF9C27);
  _Unwind_Resume(a1);
}

void morphun::analysis::stemmer::EsStemFilter::~EsStemFilter(morphun::analysis::stemmer::EsStemFilter *this)
{
  morphun::analysis::stemmer::EsStemFilter::~EsStemFilter(this);
  JUMPOUT(0x1D179D2ECLL);
}

{
  void *v2;
  void *v3;
  void *v4;
  void **v5;

  *((_QWORD *)this + 13) = &unk_1E8663598;
  *(_QWORD *)this = &unk_1E86635F0;
  v5 = (void **)((char *)this + 408);
  std::vector<std::vector<std::u16string_view>>::__destroy_vector::operator()[abi:ne180100](&v5);
  v2 = (void *)*((_QWORD *)this + 48);
  if (v2)
  {
    *((_QWORD *)this + 49) = v2;
    operator delete(v2);
  }
  *((_QWORD *)this + 13) = &unk_1E8663488;
  *(_QWORD *)this = &unk_1E86634E0;
  v3 = (void *)*((_QWORD *)this + 38);
  if (v3)
  {
    *((_QWORD *)this + 39) = v3;
    operator delete(v3);
  }
  v5 = (void **)((char *)this + 280);
  std::vector<std::vector<std::u16string_view>>::__destroy_vector::operator()[abi:ne180100](&v5);
  v4 = (void *)*((_QWORD *)this + 32);
  if (v4)
  {
    *((_QWORD *)this + 33) = v4;
    operator delete(v4);
  }
  *((_QWORD *)this + 13) = &unk_1E8663520;
  *(_QWORD *)this = &unk_1E8663558;
  morphun::analysis::TokenFilter::~TokenFilter(this, (uint64_t *)&off_1E86699E8);
}

uint64_t morphun::analysis::stemmer::EsStemFilter::incrementToken(morphun::analysis::stemmer::EsStemFilter *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  void **p_dst;
  uint64_t v9;
  uint64_t v10;
  const UChar *v11;
  uint64_t v12;
  unsigned __int16 *v13;
  std::basic_string<char16_t>::size_type v14;
  std::basic_string<char16_t> *v15;
  unsigned int v16;
  unsigned int v17;
  std::basic_string<char16_t>::size_type v18;
  std::basic_string<char16_t>::size_type size;
  std::basic_string<char16_t>::size_type v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  std::basic_string<char16_t>::size_type v25;
  int v26;
  uint64_t v27;
  int v28;
  std::basic_string<char16_t>::size_type v29;
  __int16 v30;
  const UChar *v31;
  uint64_t v32;
  uint64_t v33;
  void **v34;
  std::basic_string<char16_t>::size_type v35;
  morphun::exception::NullPointerException *exception;
  morphun::exception::NullPointerException *v38;
  void *__p;
  char v40;
  char v41;
  uint64_t v42;
  std::basic_string<char16_t> __str;
  char v44;
  uint64_t v45;
  void **__dst;
  unint64_t v47;
  int64_t v48;

  v2 = *((_QWORD *)this + 12);
  if (!v2)
    goto LABEL_87;
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  if (!(_DWORD)v3)
    return v3;
  v4 = *((_QWORD *)this + 55);
  if (v4)
  {
    if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 56))(v4) & 1) != 0)
      return v3;
  }
  v5 = (_QWORD *)*((_QWORD *)this + 54);
  if (!v5)
  {
LABEL_87:
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  v6 = (_QWORD *)((char *)v5 + *(_QWORD *)(*v5 - 96));
  if (*((char *)v6 + 23) < 0)
  {
    v7 = v6[1];
    if (v7 >= 0x7FFFFFFFFFFFFFF8)
      std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
    v6 = (_QWORD *)*v6;
  }
  else
  {
    v7 = *((unsigned __int8 *)v6 + 23);
  }
  if (v7 >= 0xB)
  {
    v9 = (v7 & 0x7FFFFFFFFFFFFFFCLL) + 4;
    if ((v7 | 3) != 0xB)
      v9 = v7 | 3;
    p_dst = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v9 + 1);
    v47 = v7;
    v48 = v10 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_16;
  }
  HIBYTE(v48) = v7;
  p_dst = (void **)&__dst;
  if (v7)
LABEL_16:
    memmove(p_dst, v6, 2 * v7);
  *((_WORD *)p_dst + v7) = 0;
  v45 = 0;
  if (v48 >= 0)
    v11 = (const UChar *)&__dst;
  else
    v11 = (const UChar *)__dst;
  if (v48 >= 0)
    v12 = HIBYTE(v48);
  else
    v12 = v47;
  morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(*((_QWORD *)this + 14), (uint64_t)&v45, v11, v12);
  if (v48 >= 0)
    v13 = (unsigned __int16 *)&__dst;
  else
    v13 = (unsigned __int16 *)__dst;
  if (v48 >= 0)
    v14 = HIBYTE(v48);
  else
    v14 = v47;
  morphun::analysis::stemmer::DictionaryGenderedNounLemmatizer::getLemma(&__str, (uint64_t)this + 104, v13, v14, v45);
  v15 = (std::basic_string<char16_t> *)(*((_QWORD *)this + 54) + *(_QWORD *)(**((_QWORD **)this + 54) - 96));
  if (v44)
  {
    std::basic_string<char16_t>::operator=(v15, &__str);
    goto LABEL_65;
  }
  v16 = HIBYTE(v15->__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v15->__r_.__value_.__r.__words[2]) < 0)
  {
    size = v15->__r_.__value_.__l.__size_;
    if ((int)size < 5)
      goto LABEL_64;
    v17 = size - 1;
    v20 = v15->__r_.__value_.__r.__words[0];
    if (*(_WORD *)(v15->__r_.__value_.__r.__words[0] + 2 * (size - 1)) != 115)
      goto LABEL_64;
    v18 = v15->__r_.__value_.__l.__size_;
  }
  else if (v16 < 5
         || (v17 = v16 - 1,
             LODWORD(v18) = HIBYTE(v15->__r_.__value_.__r.__words[2]),
             LODWORD(size) = v18,
             v20 = *((_QWORD *)this + 54) + *(_QWORD *)(**((_QWORD **)this + 54) - 96),
             v15->__r_.__value_.__s.__data_[v16 - 1] != 115))
  {
    LODWORD(size) = HIBYTE(v15->__r_.__value_.__r.__words[2]);
    goto LABEL_64;
  }
  v21 = (size - 2);
  v22 = *(unsigned __int16 *)(v20 + 2 * v21);
  if ((v22 - 232) >= 2 && v22 != 101)
  {
    if ((v16 & 0x80) != 0)
      v26 = *(unsigned __int16 *)(v15->__r_.__value_.__r.__words[0] + 2 * v21);
    else
      v26 = (unsigned __int16)v15->__r_.__value_.__s.__data_[v21];
    if (v26 == 111 || (v26 - 224) < 2 || v26 == 97)
      LODWORD(size) = v17;
    goto LABEL_64;
  }
  v23 = (v18 - 3);
  size = *((_QWORD *)this + 54) + *(_QWORD *)(**((_QWORD **)this + 54) - 96);
  if ((v16 & 0x80) != 0)
    size = v15->__r_.__value_.__r.__words[0];
  v24 = *(unsigned __int16 *)(size + 2 * v23);
  LODWORD(size) = v17;
  if (v24 != 116)
  {
    if (v24 != 110)
    {
      if (v24 == 99)
      {
        v25 = *((_QWORD *)this + 54) + *(_QWORD *)(**((_QWORD **)this + 54) - 96);
        if ((v16 & 0x80) != 0)
          v25 = v15->__r_.__value_.__r.__words[0];
        *(_WORD *)(v25 + 2 * v23) = 122;
      }
      goto LABEL_63;
    }
    v27 = (v18 - 4);
    if ((v16 & 0x80) != 0)
    {
      v29 = v15->__r_.__value_.__r.__words[0];
      v28 = *(unsigned __int16 *)(v15->__r_.__value_.__r.__words[0] + 2 * v27);
      if (v28 != 97)
        goto LABEL_59;
    }
    else
    {
      v28 = (unsigned __int16)v15->__r_.__value_.__s.__data_[v27];
      v29 = *((_QWORD *)this + 54) + *(_QWORD *)(**((_QWORD **)this + 54) - 96);
      if (v28 != 97)
      {
        v29 = *((_QWORD *)this + 54) + *(_QWORD *)(**((_QWORD **)this + 54) - 96);
LABEL_59:
        if (v28 != 111)
        {
LABEL_63:
          LODWORD(size) = v21;
          goto LABEL_64;
        }
        v30 = 243;
LABEL_62:
        *(_WORD *)(v29 + 2 * v27) = v30;
        goto LABEL_63;
      }
    }
    v30 = 225;
    goto LABEL_62;
  }
LABEL_64:
  std::basic_string<char16_t>::resize(v15, (int)size, 0);
LABEL_65:
  if (*((_QWORD *)this + 56))
  {
    v42 = 0;
    v31 = (const UChar *)(*((_QWORD *)this + 54) + *(_QWORD *)(**((_QWORD **)this + 54) - 96));
    if (*((char *)v31 + 23) < 0)
    {
      v31 = *(const UChar **)v31;
      v32 = *(_QWORD *)(*((_QWORD *)this + 54) + *(_QWORD *)(**((_QWORD **)this + 54) - 96) + 8);
    }
    else
    {
      v32 = *((unsigned __int8 *)v31 + 23);
    }
    if (morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(*((_QWORD *)this + 14), (uint64_t)&v42, v31, v32))
    {
      v33 = *((_QWORD *)this + 56);
      if (!v33)
      {
        v38 = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
        morphun::exception::NullPointerException::NullPointerException(v38);
      }
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v33 + 64))(v33, v42);
    }
  }
  if (v48 >= 0)
    v34 = (void **)&__dst;
  else
    v34 = __dst;
  if (v48 >= 0)
    v35 = HIBYTE(v48);
  else
    v35 = v47;
  morphun::analysis::MorphologicalAnalyzerUtil::analyze_word((uint64_t)&__p, (uint64_t)v34, v35, v45, *((_QWORD *)this + 57), (uint64_t *)this + 13, 0);
  if (v41 && v40 < 0)
    operator delete(__p);
  if (v44 && SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (SHIBYTE(v48) < 0)
    operator delete(__dst);
  return v3;
}

void sub_1CB5B44B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  void *v21;
  uint64_t v22;

  __cxa_free_exception(v21);
  if (a21 && a20 < 0)
    operator delete(__p);
  if (*(char *)(v22 - 49) < 0)
    operator delete(*(void **)(v22 - 72));
  _Unwind_Resume(a1);
}

void *morphun::analysis::stemmer::EsStemFilter::reset(morphun::analysis::stemmer::EsStemFilter *this)
{
  uint64_t v2;
  void *result;

  v2 = npc<morphun::analysis::TokenStream>(*((_QWORD *)this + 12));
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 40))(v2);
  *((_QWORD *)this + 55) = morphun::analysis::util::AttributeSource::getAttribute<morphun::analysis::tokenattributes::KeywordAttribute>((uint64_t)this);
  *((_QWORD *)this + 56) = morphun::analysis::util::AttributeSource::getAttribute<morphun::analysis::tokenattributes::GrammemeAttribute>((uint64_t)this);
  result = morphun::analysis::util::AttributeSource::getAttribute<morphun::analysis::tokenattributes::LemmaMappingAttribute>((uint64_t)this);
  *((_QWORD *)this + 57) = result;
  return result;
}

void `non-virtual thunk to'morphun::analysis::stemmer::EsStemFilter::~EsStemFilter(morphun::analysis::stemmer::EsStemFilter *this)
{
  morphun::analysis::stemmer::EsStemFilter::~EsStemFilter((morphun::analysis::stemmer::EsStemFilter *)((char *)this - 104));
}

{
  morphun::analysis::stemmer::EsStemFilter::~EsStemFilter((morphun::analysis::stemmer::EsStemFilter *)((char *)this - 104));
  JUMPOUT(0x1D179D2ECLL);
}

void morphun::dialog::language::EsCommonConceptFactory_EsOrList::~EsCommonConceptFactory_EsOrList(morphun::dialog::language::EsCommonConceptFactory_EsOrList *this)
{
  morphun::dialog::SemanticConceptList::~SemanticConceptList(this, (uint64_t *)&off_1E8667DD8);
}

{
  morphun::dialog::SemanticConceptList::~SemanticConceptList(this, (uint64_t *)&off_1E8667DD8);
  JUMPOUT(0x1D179D2ECLL);
}

morphun::dialog::SemanticConceptList *morphun::dialog::language::EsCommonConceptFactory_EsOrList::clone(morphun::dialog::language::EsCommonConceptFactory_EsOrList *this)
{
  morphun::dialog::SemanticConceptList *v2;

  v2 = (morphun::dialog::SemanticConceptList *)operator new();
  *(_QWORD *)v2 = &off_1E865C090;
  morphun::dialog::SemanticConceptList::SemanticConceptList(v2, (const morphun::dialog::SemanticConceptList *)&off_1E8667DD8, this);
  *(_QWORD *)v2 = &off_1E866DA70;
  return v2;
}

void sub_1CB5B470C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C40223A8A63);
  _Unwind_Resume(a1);
}

void morphun::dialog::language::EsCommonConceptFactory_EsOrList::getBeforeLast(const morphun::dialog::SemanticFeatureConceptBase *a1@<X1>, const morphun::dialog::SpeakableString *a2@<X2>, const morphun::dialog::SemanticFeatureConceptBase *a3@<X3>, const morphun::dialog::SpeakableString *a4@<X4>, uint64_t a5@<X8>)
{
  morphun::dialog::language::EsCommonConceptFactory_EsAndList *v7;
  _QWORD *v8;
  unsigned __int8 v9;
  int v10;
  _QWORD *v11;
  morphun::exception::NullPointerException *exception;
  void *__p[2];
  uint64_t v14;

  v7 = (morphun::dialog::language::EsCommonConceptFactory_EsAndList *)(*(uint64_t (**)(const morphun::dialog::SpeakableString *, const morphun::dialog::SemanticFeatureConceptBase *, const morphun::dialog::SpeakableString *, const morphun::dialog::SemanticFeatureConceptBase *))(*(_QWORD *)a4 + 32))(a4, a1, a2, a3);
  v8 = (_QWORD *)morphun::dialog::language::EsCommonConceptFactory_EsAndList::IMPORTANT_SET(v7);
  {
    v11 = (_QWORD *)operator new();
    icu4cxx::UnicodeSet::UnicodeSet((uint64_t)v11);
    MEMORY[0x1D179D970](*v11);
    morphun::dialog::language::O_SOUND(void)::O_SOUND_ = (uint64_t)v11;
  }
  if (!morphun::dialog::language::O_SOUND(void)::O_SOUND_)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  __p[0] = 0;
  __p[1] = 0;
  v14 = 0;
  if (!morphun::dictionary::PhraseProperties::isStartsWithUnicodeSets((uint64_t)v7, v8, (_QWORD *)morphun::dialog::language::O_SOUND(void)::O_SOUND_, (uint64_t **)__p))
  {
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, " ");
    *(_QWORD *)a5 = &off_1E866AD28;
    if (SHIBYTE(v14) < 0)
      goto LABEL_8;
LABEL_7:
    *(_OWORD *)(a5 + 8) = *(_OWORD *)__p;
    *(_QWORD *)(a5 + 24) = v14;
    *(_QWORD *)(a5 + 32) = 0;
    return;
  }
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, " ");
  *(_QWORD *)a5 = &off_1E866AD28;
  if ((SHIBYTE(v14) & 0x80000000) == 0)
    goto LABEL_7;
LABEL_8:
  std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)(a5 + 8), (const std::basic_string<char16_t>::value_type *)__p[0], (std::basic_string<char16_t>::size_type)__p[1]);
  v10 = SHIBYTE(v14);
  *(_QWORD *)(a5 + 32) = 0;
  if (v10 < 0)
    operator delete(__p[0]);
}

void sub_1CB5B48CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1D179D2EC](v15, 0x1020C405F07FB98);
  _Unwind_Resume(a1);
}

uint64_t *morphun::tokenizer::locale::fi::FiTokenizer::createTokenExtractor(morphun::util::ULocale *a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t WordsToNotSplit;
  void *__p[2];
  char v8;

  v4 = (uint64_t *)operator new();
  *v4 = (uint64_t)&off_1E866A910;
  WordsToNotSplit = morphun::tokenizer::TokenExtractor::createWordsToNotSplit((uint64_t)a1, a2, (uint64_t (*)(void **, uint64_t, _WORD *, unint64_t))morphun::tokenizer::TokenExtractor::isIndivisibleWordNormalized);
  morphun::tokenizer::TokenExtractor::TokenExtractor(v4, (uint64_t *)&off_1E8669EB8, a1, a2, WordsToNotSplit);
  *v4 = (uint64_t)&off_1E8673830;
  morphun::tokenizer::TokenExtractor::getRequiredKeyAsPath((uint64_t)__p, a1, a2, L"tokenizer.dictionary.file", 0x19uLL);
  morphun::tokenizer::trie::SerializedTrie::SerializedTrie(v4 + 19, (const void **)__p);
  if (v8 < 0)
    operator delete(__p[0]);
  return v4;
}

void sub_1CB5B4A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  morphun::tokenizer::TokenExtractor *v15;

  if (a15 < 0)
    operator delete(__p);
  morphun::tokenizer::TokenExtractor::~TokenExtractor(v15, (uint64_t *)&off_1E8669EB8);
  MEMORY[0x1D179D2EC](v15, 0x10F3C4096D43D9CLL);
  _Unwind_Resume(a1);
}

void morphun::exception::IllegalStateException::~IllegalStateException(std::exception *this)
{
  morphun::exception::Throwable::~Throwable(this);
  JUMPOUT(0x1D179D2ECLL);
}

double morphun::exception::IllegalStateException::IllegalStateException(morphun::exception::IllegalStateException *this)
{
  double result;

  result = 0.0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_QWORD *)this = &off_1E86730F0;
  return result;
}

{
  double result;

  result = 0.0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_QWORD *)this = &off_1E86730F0;
  return result;
}

_QWORD *morphun::exception::IllegalStateException::IllegalStateException(uint64_t a1, __int128 *a2)
{
  _QWORD *result;

  result = (_QWORD *)morphun::exception::Throwable::Throwable(a1, a2);
  *result = &off_1E86730F0;
  return result;
}

{
  _QWORD *result;

  result = (_QWORD *)morphun::exception::Throwable::Throwable(a1, a2);
  *result = &off_1E86730F0;
  return result;
}

void morphun::analysis::NbAnalyzer::~NbAnalyzer(void **this)
{
  *this = &off_1E8660550;
  morphun::analysis::Analyzer::~Analyzer((morphun::analysis::Analyzer *)this, (uint64_t *)&off_1E8668F40);
}

{
  *this = &off_1E8660550;
  morphun::analysis::Analyzer::~Analyzer((morphun::analysis::Analyzer *)this, (uint64_t *)&off_1E8668F40);
  JUMPOUT(0x1D179D2ECLL);
}

morphun::analysis::util::FilteringTokenFilter *morphun::analysis::NbAnalyzer::addStopFilter(morphun::analysis::NbAnalyzer *this, morphun::analysis::TokenStream *a2)
{
  morphun::analysis::util::FilteringTokenFilter *v4;

  v4 = (morphun::analysis::util::FilteringTokenFilter *)operator new();
  morphun::analysis::core::StopFilter::StopFilter(v4, (uint64_t)a2, *((_QWORD *)this + 8));
  return v4;
}

void sub_1CB5B4BE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F1C40C2748A64);
  _Unwind_Resume(a1);
}

morphun::analysis::stemmer::NordicStemFilter *morphun::analysis::NbAnalyzer::addWordNormalizationFilter(morphun::analysis::NbAnalyzer *this, morphun::analysis::TokenStream *a2)
{
  morphun::analysis::stemmer::NordicStemFilter *v3;

  v3 = (morphun::analysis::stemmer::NordicStemFilter *)operator new();
  *(_QWORD *)v3 = &off_1E866A910;
  morphun::analysis::stemmer::NordicStemFilter::NordicStemFilter(v3, (morphun::analysis::TokenStream *)&off_1E8669B40, (uint64_t)a2);
  *(_QWORD *)v3 = &off_1E8672A40;
  return v3;
}

void sub_1CB5B4C70(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10E1C403A81BC3DLL);
  _Unwind_Resume(a1);
}

void morphun::dialog::language::DeCommonConceptFactory::~DeCommonConceptFactory(void **this)
{
  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(this, (void **)&off_1E8667718);
}

{
  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(this, (void **)&off_1E8667718);
  JUMPOUT(0x1D179D2ECLL);
}

void morphun::dialog::language::DeCommonConceptFactory::quote(morphun::dialog::language::DeCommonConceptFactory *this@<X0>, const morphun::dialog::SpeakableString *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const void **v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  const void **v17;
  __int128 v18;
  int v19;
  const void **v20;
  uint64_t v21;
  void *v22;
  std::basic_string<char16_t> v23;
  std::basic_string<char16_t> v24;

  v6 = morphun::util::LocaleUtils::SWITZERLAND_GERMAN(this);
  v7 = (*(uint64_t (**)(morphun::dialog::language::DeCommonConceptFactory *))(*(_QWORD *)this + 32))(this);
  v8 = *(unsigned __int8 *)(v7 + 127);
  if ((v8 & 0x80u) == 0)
    v9 = *(unsigned __int8 *)(v7 + 127);
  else
    v9 = *(_QWORD *)(v7 + 112);
  v10 = *(unsigned __int8 *)(v6 + 127);
  v11 = (char)v10;
  if ((v10 & 0x80u) != 0)
    v10 = *(_QWORD *)(v6 + 112);
  if (v9 != v10)
    goto LABEL_16;
  v12 = (const void **)(v7 + 104);
  v15 = *(unsigned __int8 **)(v6 + 104);
  v14 = (unsigned __int8 *)(v6 + 104);
  v13 = v15;
  if (v11 >= 0)
    v16 = v14;
  else
    v16 = v13;
  if ((v8 & 0x80) != 0)
  {
    if (!memcmp(*v12, v16, *(_QWORD *)(v7 + 112)))
      goto LABEL_17;
LABEL_16:
    morphun::dialog::CommonConceptFactoryImpl::quote((const void **)this, a2, a3);
    return;
  }
  if (*(_BYTE *)(v7 + 127))
  {
    while (*(unsigned __int8 *)v12 == *v16)
    {
      v12 = (const void **)((char *)v12 + 1);
      ++v16;
      if (!--v8)
        goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_17:
  if ((*(unsigned int (**)(const morphun::dialog::SpeakableString *, unsigned __int8 *))(*(_QWORD *)a2 + 48))(a2, v16))
  {
    v17 = (const void **)(*(uint64_t (**)(const morphun::dialog::SpeakableString *))(*(_QWORD *)a2 + 32))(a2);
    std::operator+<char16_t>((uint64_t)&v24, word_1CB73E644, v17);
    std::basic_string<char16_t>::append(&v24, word_1CB73E648, 1uLL);
    v18 = *(_OWORD *)&v24.__r_.__value_.__l.__data_;
    LODWORD(v23.__r_.__value_.__l.__data_) = v24.__r_.__value_.__r.__words[2];
    *(_DWORD *)((char *)v23.__r_.__value_.__r.__words + 3) = *(_DWORD *)((char *)&v24.__r_.__value_.__r.__words[2] + 3);
    v19 = SHIBYTE(v24.__r_.__value_.__r.__words[2]);
    memset(&v24, 0, sizeof(v24));
    *(_QWORD *)a3 = &off_1E866AD28;
    if (v19 < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)(a3 + 8), (const std::basic_string<char16_t>::value_type *)v18, *((std::basic_string<char16_t>::size_type *)&v18 + 1));
      *(_QWORD *)(a3 + 32) = 0;
      operator delete((void *)v18);
    }
    else
    {
      *(_OWORD *)(a3 + 8) = v18;
      *(_DWORD *)(a3 + 24) = v23.__r_.__value_.__l.__data_;
      *(_DWORD *)(a3 + 27) = *(_DWORD *)((char *)v23.__r_.__value_.__r.__words + 3);
      *(_BYTE *)(a3 + 31) = v19;
      *(_QWORD *)(a3 + 32) = 0;
    }
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    {
      v22 = (void *)v24.__r_.__value_.__r.__words[0];
      goto LABEL_27;
    }
  }
  else
  {
    v20 = (const void **)(*(uint64_t (**)(const morphun::dialog::SpeakableString *))(*(_QWORD *)a2 + 32))(a2);
    std::operator+<char16_t>((uint64_t)&v23, word_1CB73E644, v20);
    std::basic_string<char16_t>::append(&v23, word_1CB73E648, 1uLL);
    v24 = v23;
    memset(&v23, 0, sizeof(v23));
    v21 = (*(uint64_t (**)(const morphun::dialog::SpeakableString *))(*(_QWORD *)a2 + 40))(a2);
    morphun::dialog::SpeakableString::SpeakableString(a3, (__int128 *)&v24, v21);
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v24.__r_.__value_.__l.__data_);
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
    {
      v22 = (void *)v23.__r_.__value_.__r.__words[0];
LABEL_27:
      operator delete(v22);
    }
  }
}

void sub_1CB5B4F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;

  operator delete(v21);
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

morphun::dialog::GrammaticalCountConcept *morphun::dialog::language::DeCommonConceptFactory::quantify(morphun::dialog::language::DeCommonConceptFactory *this, const morphun::dialog::NumberConcept *a2, const morphun::dialog::SemanticFeatureConceptBase *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const std::basic_string<char16_t> *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const std::basic_string<char16_t> *v13;
  std::basic_string<char16_t>::size_type size;
  uint64_t v15;
  int v16;
  std::basic_string<char16_t>::size_type v17;
  std::basic_string<char16_t> *v18;
  unsigned __int16 *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  std::basic_string<char16_t>::size_type v23;
  std::basic_string<char16_t> *v24;
  unsigned __int16 *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  std::basic_string<char16_t>::size_type v29;
  std::basic_string<char16_t> *v30;
  unsigned __int16 *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  std::basic_string<char16_t>::size_type v35;
  std::basic_string<char16_t> *v36;
  unsigned __int16 *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  std::basic_string<char16_t>::size_type v41;
  std::basic_string<char16_t> *v42;
  unsigned __int16 *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  std::basic_string<char16_t>::size_type v47;
  std::basic_string<char16_t> *v48;
  unsigned __int16 *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  std::basic_string<char16_t>::size_type v53;
  std::basic_string<char16_t> *v54;
  unsigned __int16 *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  std::basic_string<char16_t>::size_type v59;
  std::basic_string<char16_t> *v60;
  unsigned __int16 *v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  std::basic_string<char16_t>::size_type v65;
  std::basic_string<char16_t> *v66;
  unsigned __int16 *v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  std::basic_string<char16_t>::size_type v71;
  std::basic_string<char16_t> *v72;
  unsigned __int16 *v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  std::basic_string<char16_t>::size_type v77;
  std::basic_string<char16_t> *v78;
  unsigned __int16 *v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  std::basic_string<char16_t>::size_type v83;
  std::basic_string<char16_t> *v84;
  unsigned __int16 *v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  std::basic_string<char16_t>::size_type v89;
  std::basic_string<char16_t> *v90;
  unsigned __int16 *v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  std::basic_string<char16_t>::size_type v95;
  std::basic_string<char16_t> *v96;
  unsigned __int16 *v97;
  uint64_t v98;
  int v99;
  int v100;
  int v101;
  int v102;
  BOOL v103;
  char v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  std::basic_string<char16_t>::size_type v108;
  std::basic_string<char16_t> *v109;
  unsigned __int16 *v110;
  uint64_t v111;
  int v112;
  int v113;
  int v114;
  int v115;
  char v116;
  uint64_t v117;
  int v118;
  uint64_t v119;
  std::basic_string<char16_t>::size_type v120;
  std::basic_string<char16_t> *v121;
  unsigned __int16 *v122;
  uint64_t v123;
  int v124;
  int v125;
  int v126;
  int v127;
  char v128;
  uint64_t v129;
  morphun::dialog::GrammaticalCountConcept *v130;
  void *__p[2];
  char v133;
  _QWORD v134[5];
  _QWORD v135[2];
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  std::basic_string<char16_t> v139;
  std::basic_string<char16_t> v140;

  npc<morphun::dialog::SemanticFeatureConceptBase const>((uint64_t)a3);
  v6 = *((_QWORD *)this + 94);
  npc<morphun::dialog::SemanticFeature const>(v6);
  v7 = (*(uint64_t (**)(const morphun::dialog::SemanticFeatureConceptBase *, uint64_t))(*(_QWORD *)a3 + 104))(a3, v6);
  memset(&v140, 0, sizeof(v140));
  if (v7)
  {
    v8 = v7;
    v9 = (const std::basic_string<char16_t> *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 32))(v7);
    std::basic_string<char16_t>::operator=(&v140, v9);
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
  }
  v10 = *((_QWORD *)this + 95);
  npc<morphun::dialog::SemanticFeature const>(v10);
  v11 = (*(uint64_t (**)(const morphun::dialog::SemanticFeatureConceptBase *, uint64_t))(*(_QWORD *)a3 + 104))(a3, v10);
  v12 = v11;
  memset(&v139, 0, sizeof(v139));
  if (v11)
  {
    v13 = (const std::basic_string<char16_t> *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 32))(v11);
    std::basic_string<char16_t>::operator=(&v139, v13);
    v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 16))(v12);
  }
  v135[0] = &off_1E866AD28;
  v135[1] = 0;
  v137 = 0;
  v138 = 0;
  v136 = 0;
  size = HIBYTE(v139.__r_.__value_.__r.__words[2]);
  if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v139.__r_.__value_.__l.__size_;
  if (!size)
    goto LABEL_21;
  v11 = morphun::grammar::synthesis::GrammemeConstants::CASE_NOMINATIVE((morphun::grammar::synthesis::GrammemeConstants *)v11);
  v15 = *(unsigned __int8 *)(v11 + 23);
  v16 = (char)v15;
  if ((v15 & 0x80u) != 0)
    v15 = *(_QWORD *)(v11 + 8);
  v17 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
  if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v17 = v139.__r_.__value_.__l.__size_;
  if (v15 != v17)
    goto LABEL_35;
  if (!v15)
  {
LABEL_21:
    v20 = morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE((morphun::grammar::synthesis::GrammemeConstants *)v11);
    v21 = *(unsigned __int8 *)(v20 + 23);
    v22 = (char)v21;
    if ((v21 & 0x80u) != 0)
      v21 = *(_QWORD *)(v20 + 8);
    v23 = HIBYTE(v140.__r_.__value_.__r.__words[2]);
    if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v23 = v140.__r_.__value_.__l.__size_;
    if (v21 == v23)
    {
      if (!v21)
      {
LABEL_34:
        std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"cardinal-masculine");
        (*(void (**)(_QWORD *__return_ptr, const morphun::dialog::NumberConcept *, void **))(*(_QWORD *)a2 + 200))(v134, a2, __p);
        morphun::dialog::SpeakableString::operator=((uint64_t)v135, (uint64_t)v134);
        goto LABEL_243;
      }
      v24 = &v140;
      if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v24 = (std::basic_string<char16_t> *)v140.__r_.__value_.__r.__words[0];
      if (v22 >= 0)
        v25 = (unsigned __int16 *)v20;
      else
        v25 = *(unsigned __int16 **)v20;
      while ((unsigned __int16)v24->__r_.__value_.__s.__data_[0] == *v25)
      {
        ++v25;
        v24 = (std::basic_string<char16_t> *)((char *)v24 + 2);
        if (!--v21)
          goto LABEL_34;
      }
    }
    v38 = morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v20);
    v39 = *(unsigned __int8 *)(v38 + 23);
    v40 = (char)v39;
    if ((v39 & 0x80u) != 0)
      v39 = *(_QWORD *)(v38 + 8);
    v41 = HIBYTE(v140.__r_.__value_.__r.__words[2]);
    if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v41 = v140.__r_.__value_.__l.__size_;
    if (v39 == v41)
    {
      if (!v39)
      {
LABEL_75:
        std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, "c");
        (*(void (**)(_QWORD *__return_ptr, const morphun::dialog::NumberConcept *, void **))(*(_QWORD *)a2 + 200))(v134, a2, __p);
        morphun::dialog::SpeakableString::operator=((uint64_t)v135, (uint64_t)v134);
        goto LABEL_243;
      }
      v42 = &v140;
      if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v42 = (std::basic_string<char16_t> *)v140.__r_.__value_.__r.__words[0];
      if (v40 >= 0)
        v43 = (unsigned __int16 *)v38;
      else
        v43 = *(unsigned __int16 **)v38;
      while ((unsigned __int16)v42->__r_.__value_.__s.__data_[0] == *v43)
      {
        ++v43;
        v42 = (std::basic_string<char16_t> *)((char *)v42 + 2);
        if (!--v39)
          goto LABEL_75;
      }
    }
    v56 = morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v38);
    v57 = *(unsigned __int8 *)(v56 + 23);
    v58 = (char)v57;
    if ((v57 & 0x80u) != 0)
      v57 = *(_QWORD *)(v56 + 8);
    v59 = HIBYTE(v140.__r_.__value_.__r.__words[2]);
    if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v59 = v140.__r_.__value_.__l.__size_;
    if (v57 != v59)
      goto LABEL_245;
    if (v57)
    {
      v60 = &v140;
      if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v60 = (std::basic_string<char16_t> *)v140.__r_.__value_.__r.__words[0];
      if (v58 >= 0)
        v61 = (unsigned __int16 *)v56;
      else
        v61 = *(unsigned __int16 **)v56;
      while ((unsigned __int16)v60->__r_.__value_.__s.__data_[0] == *v61)
      {
        ++v61;
        v60 = (std::basic_string<char16_t> *)((char *)v60 + 2);
        if (!--v57)
          goto LABEL_242;
      }
      goto LABEL_245;
    }
LABEL_242:
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, "c");
    (*(void (**)(_QWORD *__return_ptr, const morphun::dialog::NumberConcept *, void **))(*(_QWORD *)a2 + 200))(v134, a2, __p);
    morphun::dialog::SpeakableString::operator=((uint64_t)v135, (uint64_t)v134);
LABEL_243:
    if (v133 < 0)
      operator delete(__p[0]);
    goto LABEL_245;
  }
  v18 = &v139;
  if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v18 = (std::basic_string<char16_t> *)v139.__r_.__value_.__r.__words[0];
  if (v16 >= 0)
    v19 = (unsigned __int16 *)v11;
  else
    v19 = *(unsigned __int16 **)v11;
  while ((unsigned __int16)v18->__r_.__value_.__s.__data_[0] == *v19)
  {
    ++v19;
    v18 = (std::basic_string<char16_t> *)((char *)v18 + 2);
    if (!--v15)
      goto LABEL_21;
  }
LABEL_35:
  v26 = morphun::grammar::synthesis::GrammemeConstants::CASE_GENITIVE((morphun::grammar::synthesis::GrammemeConstants *)v11);
  v27 = *(unsigned __int8 *)(v26 + 23);
  v28 = (char)v27;
  if ((v27 & 0x80u) != 0)
    v27 = *(_QWORD *)(v26 + 8);
  v29 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
  if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v29 = v139.__r_.__value_.__l.__size_;
  if (v27 != v29)
    goto LABEL_76;
  if (!v27)
  {
LABEL_48:
    v32 = morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE((morphun::grammar::synthesis::GrammemeConstants *)v26);
    v33 = *(unsigned __int8 *)(v32 + 23);
    v34 = (char)v33;
    if ((v33 & 0x80u) != 0)
      v33 = *(_QWORD *)(v32 + 8);
    v35 = HIBYTE(v140.__r_.__value_.__r.__words[2]);
    if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v35 = v140.__r_.__value_.__l.__size_;
    if (v33 == v35)
    {
      if (!v33)
        goto LABEL_157;
      v36 = &v140;
      if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v36 = (std::basic_string<char16_t> *)v140.__r_.__value_.__r.__words[0];
      if (v34 >= 0)
        v37 = (unsigned __int16 *)v32;
      else
        v37 = *(unsigned __int16 **)v32;
      while ((unsigned __int16)v36->__r_.__value_.__s.__data_[0] == *v37)
      {
        ++v37;
        v36 = (std::basic_string<char16_t> *)((char *)v36 + 2);
        if (!--v33)
          goto LABEL_157;
      }
    }
    v74 = morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v32);
    v75 = *(unsigned __int8 *)(v74 + 23);
    v76 = (char)v75;
    if ((v75 & 0x80u) != 0)
      v75 = *(_QWORD *)(v74 + 8);
    v77 = HIBYTE(v140.__r_.__value_.__r.__words[2]);
    if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v77 = v140.__r_.__value_.__l.__size_;
    if (v75 != v77)
      goto LABEL_172;
    if (v75)
    {
      v78 = &v140;
      if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v78 = (std::basic_string<char16_t> *)v140.__r_.__value_.__r.__words[0];
      if (v76 >= 0)
        v79 = (unsigned __int16 *)v74;
      else
        v79 = *(unsigned __int16 **)v74;
      while ((unsigned __int16)v78->__r_.__value_.__s.__data_[0] == *v79)
      {
        ++v79;
        v78 = (std::basic_string<char16_t> *)((char *)v78 + 2);
        if (!--v75)
          goto LABEL_157;
      }
LABEL_172:
      v86 = morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v74);
      v87 = *(unsigned __int8 *)(v86 + 23);
      v88 = (char)v87;
      if ((v87 & 0x80u) != 0)
        v87 = *(_QWORD *)(v86 + 8);
      v89 = HIBYTE(v140.__r_.__value_.__r.__words[2]);
      if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v89 = v140.__r_.__value_.__l.__size_;
      if (v87 != v89)
        goto LABEL_245;
      if (v87)
      {
        v90 = &v140;
        if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v90 = (std::basic_string<char16_t> *)v140.__r_.__value_.__r.__words[0];
        if (v88 >= 0)
          v91 = (unsigned __int16 *)v86;
        else
          v91 = *(unsigned __int16 **)v86;
        while ((unsigned __int16)v90->__r_.__value_.__s.__data_[0] == *v91)
        {
          ++v91;
          v90 = (std::basic_string<char16_t> *)((char *)v90 + 2);
          if (!--v87)
            goto LABEL_185;
        }
        goto LABEL_245;
      }
      goto LABEL_185;
    }
LABEL_157:
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"cardinal-s");
    (*(void (**)(_QWORD *__return_ptr, const morphun::dialog::NumberConcept *, void **))(*(_QWORD *)a2 + 200))(v134, a2, __p);
    morphun::dialog::SpeakableString::operator=((uint64_t)v135, (uint64_t)v134);
    goto LABEL_243;
  }
  v30 = &v139;
  if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v30 = (std::basic_string<char16_t> *)v139.__r_.__value_.__r.__words[0];
  if (v28 >= 0)
    v31 = (unsigned __int16 *)v26;
  else
    v31 = *(unsigned __int16 **)v26;
  while ((unsigned __int16)v30->__r_.__value_.__s.__data_[0] == *v31)
  {
    ++v31;
    v30 = (std::basic_string<char16_t> *)((char *)v30 + 2);
    if (!--v27)
      goto LABEL_48;
  }
LABEL_76:
  v44 = morphun::grammar::synthesis::GrammemeConstants::CASE_DATIVE((morphun::grammar::synthesis::GrammemeConstants *)v26);
  v45 = *(unsigned __int8 *)(v44 + 23);
  v46 = (char)v45;
  if ((v45 & 0x80u) != 0)
    v45 = *(_QWORD *)(v44 + 8);
  v47 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
  if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v47 = v139.__r_.__value_.__l.__size_;
  if (v45 != v47)
    goto LABEL_117;
  if (!v45)
  {
LABEL_89:
    v50 = morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE((morphun::grammar::synthesis::GrammemeConstants *)v44);
    v51 = *(unsigned __int8 *)(v50 + 23);
    v52 = (char)v51;
    if ((v51 & 0x80u) != 0)
      v51 = *(_QWORD *)(v50 + 8);
    v53 = HIBYTE(v140.__r_.__value_.__r.__words[2]);
    if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v53 = v140.__r_.__value_.__l.__size_;
    if (v51 == v53)
    {
      if (!v51)
        goto LABEL_171;
      v54 = &v140;
      if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v54 = (std::basic_string<char16_t> *)v140.__r_.__value_.__r.__words[0];
      if (v52 >= 0)
        v55 = (unsigned __int16 *)v50;
      else
        v55 = *(unsigned __int16 **)v50;
      while ((unsigned __int16)v54->__r_.__value_.__s.__data_[0] == *v55)
      {
        ++v55;
        v54 = (std::basic_string<char16_t> *)((char *)v54 + 2);
        if (!--v51)
          goto LABEL_171;
      }
    }
    v80 = morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v50);
    v81 = *(unsigned __int8 *)(v80 + 23);
    v82 = (char)v81;
    if ((v81 & 0x80u) != 0)
      v81 = *(_QWORD *)(v80 + 8);
    v83 = HIBYTE(v140.__r_.__value_.__r.__words[2]);
    if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v83 = v140.__r_.__value_.__l.__size_;
    if (v81 != v83)
      goto LABEL_205;
    if (v81)
    {
      v84 = &v140;
      if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v84 = (std::basic_string<char16_t> *)v140.__r_.__value_.__r.__words[0];
      if (v82 >= 0)
        v85 = (unsigned __int16 *)v80;
      else
        v85 = *(unsigned __int16 **)v80;
      while ((unsigned __int16)v84->__r_.__value_.__s.__data_[0] == *v85)
      {
        ++v85;
        v84 = (std::basic_string<char16_t> *)((char *)v84 + 2);
        if (!--v81)
          goto LABEL_171;
      }
LABEL_205:
      v105 = morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v80);
      v106 = *(char *)(v105 + 23);
      v107 = *(_QWORD *)(v105 + 8);
      if (v106 >= 0)
        v107 = *(unsigned __int8 *)(v105 + 23);
      v108 = HIBYTE(v140.__r_.__value_.__r.__words[2]);
      if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v108 = v140.__r_.__value_.__l.__size_;
      if (v107 != v108)
        goto LABEL_245;
      if (v107)
      {
        v109 = &v140;
        if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v109 = (std::basic_string<char16_t> *)v140.__r_.__value_.__r.__words[0];
        v110 = v106 >= 0 ? (unsigned __int16 *)v105 : *(unsigned __int16 **)v105;
        v111 = v107 - 1;
        do
        {
          v113 = *v110++;
          v112 = v113;
          v115 = (unsigned __int16)v109->__r_.__value_.__s.__data_[0];
          v109 = (std::basic_string<char16_t> *)((char *)v109 + 2);
          v114 = v115;
          v103 = v111-- != 0;
          v116 = v103;
        }
        while (v114 == v112 && (v116 & 1) != 0);
        if (v114 != v112)
          goto LABEL_245;
      }
LABEL_185:
      std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, "c");
      (*(void (**)(_QWORD *__return_ptr, const morphun::dialog::NumberConcept *, void **))(*(_QWORD *)a2 + 200))(v134, a2, __p);
      morphun::dialog::SpeakableString::operator=((uint64_t)v135, (uint64_t)v134);
      goto LABEL_243;
    }
LABEL_171:
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"cardinal-m");
    (*(void (**)(_QWORD *__return_ptr, const morphun::dialog::NumberConcept *, void **))(*(_QWORD *)a2 + 200))(v134, a2, __p);
    morphun::dialog::SpeakableString::operator=((uint64_t)v135, (uint64_t)v134);
    goto LABEL_243;
  }
  v48 = &v139;
  if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v48 = (std::basic_string<char16_t> *)v139.__r_.__value_.__r.__words[0];
  if (v46 >= 0)
    v49 = (unsigned __int16 *)v44;
  else
    v49 = *(unsigned __int16 **)v44;
  while ((unsigned __int16)v48->__r_.__value_.__s.__data_[0] == *v49)
  {
    ++v49;
    v48 = (std::basic_string<char16_t> *)((char *)v48 + 2);
    if (!--v45)
      goto LABEL_89;
  }
LABEL_117:
  v62 = morphun::grammar::synthesis::GrammemeConstants::CASE_ACCUSATIVE((morphun::grammar::synthesis::GrammemeConstants *)v44);
  v63 = *(unsigned __int8 *)(v62 + 23);
  v64 = (char)v63;
  if ((v63 & 0x80u) != 0)
    v63 = *(_QWORD *)(v62 + 8);
  v65 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
  if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v65 = v139.__r_.__value_.__l.__size_;
  if (v63 != v65)
    goto LABEL_245;
  if (!v63)
  {
LABEL_130:
    v68 = morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE((morphun::grammar::synthesis::GrammemeConstants *)v62);
    v69 = *(unsigned __int8 *)(v68 + 23);
    v70 = (char)v69;
    if ((v69 & 0x80u) != 0)
      v69 = *(_QWORD *)(v68 + 8);
    v71 = HIBYTE(v140.__r_.__value_.__r.__words[2]);
    if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v71 = v140.__r_.__value_.__l.__size_;
    if (v69 == v71)
    {
      if (!v69)
      {
LABEL_143:
        std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, "c");
        (*(void (**)(_QWORD *__return_ptr, const morphun::dialog::NumberConcept *, void **))(*(_QWORD *)a2 + 200))(v134, a2, __p);
        morphun::dialog::SpeakableString::operator=((uint64_t)v135, (uint64_t)v134);
        goto LABEL_243;
      }
      v72 = &v140;
      if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v72 = (std::basic_string<char16_t> *)v140.__r_.__value_.__r.__words[0];
      if (v70 >= 0)
        v73 = (unsigned __int16 *)v68;
      else
        v73 = *(unsigned __int16 **)v68;
      while ((unsigned __int16)v72->__r_.__value_.__s.__data_[0] == *v73)
      {
        ++v73;
        v72 = (std::basic_string<char16_t> *)((char *)v72 + 2);
        if (!--v69)
          goto LABEL_143;
      }
    }
    v92 = morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v68);
    v93 = *(char *)(v92 + 23);
    v94 = *(_QWORD *)(v92 + 8);
    if (v93 >= 0)
      v94 = *(unsigned __int8 *)(v92 + 23);
    v95 = HIBYTE(v140.__r_.__value_.__r.__words[2]);
    if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v95 = v140.__r_.__value_.__l.__size_;
    if (v94 == v95)
    {
      if (!v94)
        goto LABEL_75;
      v96 = &v140;
      if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v96 = (std::basic_string<char16_t> *)v140.__r_.__value_.__r.__words[0];
      v97 = v93 >= 0 ? (unsigned __int16 *)v92 : *(unsigned __int16 **)v92;
      v98 = v94 - 1;
      do
      {
        v100 = *v97++;
        v99 = v100;
        v102 = (unsigned __int16)v96->__r_.__value_.__s.__data_[0];
        v96 = (std::basic_string<char16_t> *)((char *)v96 + 2);
        v101 = v102;
        v103 = v98-- != 0;
        v104 = v103;
      }
      while (v101 == v99 && (v104 & 1) != 0);
      if (v101 == v99)
        goto LABEL_75;
    }
    v117 = morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v92);
    v118 = *(char *)(v117 + 23);
    v119 = *(_QWORD *)(v117 + 8);
    if (v118 >= 0)
      v119 = *(unsigned __int8 *)(v117 + 23);
    v120 = HIBYTE(v140.__r_.__value_.__r.__words[2]);
    if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v120 = v140.__r_.__value_.__l.__size_;
    if (v119 != v120)
      goto LABEL_245;
    if (v119)
    {
      v121 = &v140;
      if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v121 = (std::basic_string<char16_t> *)v140.__r_.__value_.__r.__words[0];
      v122 = v118 >= 0 ? (unsigned __int16 *)v117 : *(unsigned __int16 **)v117;
      v123 = v119 - 1;
      do
      {
        v125 = *v122++;
        v124 = v125;
        v127 = (unsigned __int16)v121->__r_.__value_.__s.__data_[0];
        v121 = (std::basic_string<char16_t> *)((char *)v121 + 2);
        v126 = v127;
        v103 = v123-- != 0;
        v128 = v103;
      }
      while (v126 == v124 && (v128 & 1) != 0);
      if (v126 != v124)
        goto LABEL_245;
    }
    goto LABEL_242;
  }
  v66 = &v139;
  if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v66 = (std::basic_string<char16_t> *)v139.__r_.__value_.__r.__words[0];
  if (v64 >= 0)
    v67 = (unsigned __int16 *)v62;
  else
    v67 = *(unsigned __int16 **)v62;
  while ((unsigned __int16)v66->__r_.__value_.__s.__data_[0] == *v67)
  {
    ++v67;
    v66 = (std::basic_string<char16_t> *)((char *)v66 + 2);
    if (!--v63)
      goto LABEL_130;
  }
LABEL_245:
  v129 = HIBYTE(v137);
  if (v137 < 0)
    v129 = v136;
  if (!v129)
  {
    if (v138)
    {
      if (*(char *)(v138 + 23) < 0)
      {
        if (*(_QWORD *)(v138 + 8))
          goto LABEL_254;
      }
      else if (*(_BYTE *)(v138 + 23))
      {
        goto LABEL_254;
      }
    }
    (*(void (**)(_QWORD *__return_ptr, const morphun::dialog::NumberConcept *))(*(_QWORD *)a2 + 208))(v134, a2);
    morphun::dialog::SpeakableString::operator=((uint64_t)v135, (uint64_t)v134);
  }
LABEL_254:
  v130 = morphun::dialog::CommonConceptFactoryImpl::quantify(this, a2, (const morphun::dialog::SpeakableString *)v135, a3);
  if (SHIBYTE(v139.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v139.__r_.__value_.__l.__data_);
  if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v140.__r_.__value_.__l.__data_);
  return v130;
}

void sub_1CB5B5ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  uint64_t v21;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v21 - 57) < 0)
    operator delete(*(void **)(v21 - 80));
  if (*(char *)(v21 - 33) < 0)
    operator delete(*(void **)(v21 - 56));
  _Unwind_Resume(a1);
}

void sub_1CB5B5C2C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1CB5B5C84(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t mccf_getSemanticFeatureModel(uint64_t a1)
{
  uint64_t v1;

  v1 = npc<morphun::dialog::CommonConceptFactory const>(a1);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
}

uint64_t npc<morphun::dialog::CommonConceptFactory const>(uint64_t result)
{
  morphun::exception::NullPointerException *exception;

  if (!result)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  return result;
}

void sub_1CB5B5D44(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

CFLocaleRef mccf_getLanguageCopy(uint64_t a1)
{
  uint64_t v1;
  morphun::util::CFUtils *v2;
  const morphun::util::ULocale *v3;

  v1 = npc<morphun::dialog::CommonConceptFactory const>(a1);
  v2 = (morphun::util::CFUtils *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 32))(v1);
  return morphun::util::CFUtils::convert(v2, v3);
}

uint64_t mccf_quote(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = operator new();
  npc<morphun::dialog::CommonConceptFactory const>(a1);
  npc<morphun::dialog::SpeakableString const>(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 96))(a1, a2);
  return v4;
}

void sub_1CB5B5E38(_Unwind_Exception *exception_object, int a2)
{
  const std::exception *v2;
  const void **v3;
  __CFError **v4;

  if (a2 == 1)
  {
    v3 = (const void **)__cxa_begin_catch(exception_object);
    morphun::util::CFUtils::convert(v3, v2, v4);
    __cxa_end_catch();
    JUMPOUT(0x1CB5B5E24);
  }
  _Unwind_Resume(exception_object);
}

uint64_t npc<morphun::dialog::SpeakableString const>(uint64_t result)
{
  morphun::exception::NullPointerException *exception;

  if (!result)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  return result;
}

void sub_1CB5B5EE0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t mccf_quantifyCopy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  npc<morphun::dialog::CommonConceptFactory const>(a1);
  npc<morphun::dialog::NumberConcept const>(a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 104))(a1, a2, a3);
}

void sub_1CB5B5FC8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t mccf_quantifyFormattedCopy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  npc<morphun::dialog::CommonConceptFactory const>(a1);
  npc<morphun::dialog::NumberConcept const>(a2);
  npc<morphun::dialog::SpeakableString const>(a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 112))(a1, a2, a3, a4);
}

void morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::~FiGrammarSynthesizer_LemmaApproximator(morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator *this)
{
  *(_QWORD *)this = &off_1E866E3C0;
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::destroy(*((_QWORD **)this + 2));
}

{
  *(_QWORD *)this = &off_1E866E3C0;
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::destroy(*((_QWORD **)this + 2));
  JUMPOUT(0x1D179D2ECLL);
}

void std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::destroy(*a1);
    std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::destroy(a1[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::basic_string<char16_t> const,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,0>((uint64_t)(a1 + 4));
    operator delete(a1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::basic_string<char16_t> const,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,0>(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 24);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 24);
    if (v3 != v2)
    {
      do
      {
        if (*(char *)(v3 - 9) < 0)
          operator delete(*(void **)(v3 - 32));
        v3 -= 32;
      }
      while (v3 != v2);
      v4 = *(void **)(a1 + 24);
    }
    *(_QWORD *)(a1 + 32) = v2;
    operator delete(v4);
  }
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator *morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::FiGrammarSynthesizer_LemmaApproximator(morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator *this, const morphun::dictionary::DictionaryMetaData *a2, const morphun::dictionary::Inflector *a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  morphun::dictionary::DictionaryMetaData_MMappedDictionary *v8;
  const morphun::dictionary::Inflector *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const UChar *v14;
  uint64_t v15;
  int v16;
  const UChar *v17;
  uint64_t v18;
  std::allocator<char16_t> *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int16 KeyId;
  __int128 *v26;
  unint64_t v27;
  uint64_t v28;
  void **v29;
  uint64_t v30;
  char *v31;
  int v32;
  BOOL v33;
  std::basic_string<char16_t> **v34;
  int *v35;
  int *v36;
  uint64_t *v37;
  char v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  std::basic_string<char16_t> *v48;
  uint64_t v49;
  uint64_t **v52;
  uint64_t v54;
  marisa::Trie *v55;
  uint64_t v56;
  int *i;
  std::basic_string<char16_t> __p;
  std::basic_string<char16_t> v59;
  char v60;
  int *v61;
  int *v62;
  std::basic_string<char16_t> v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[2];
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  std::basic_string<char16_t> *v72;
  std::basic_string<char16_t> *v73;
  std::basic_string<char16_t> *v74;
  std::basic_string<char16_t> *v75;
  std::basic_string<char16_t> *v76;
  std::basic_string<char16_t> *v77;
  void *__dst[2];
  unsigned __int8 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86[2];

  *((_QWORD *)&v86[0] + 1) = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)a2;
  *(_QWORD *)this = *(_QWORD *)a2;
  *(_QWORD *)((char *)this + *(_QWORD *)(v5 - 40)) = *((_QWORD *)a2 + 1);
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  v52 = (uint64_t **)((char *)this + 16);
  *((_QWORD *)this + 1) = (char *)this + 16;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__dst, (char *)L"yks=-");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v83, (char *)L"nominative");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v84 + 1, (char *)L"singular");
  v75 = 0;
  v76 = 0;
  v77 = 0;
  *(_QWORD *)&v80 = &v75;
  BYTE8(v80) = 0;
  v75 = (std::basic_string<char16_t> *)operator new(0x30uLL);
  v76 = v75;
  v77 = v75 + 2;
  v6 = 0;
  v76 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v77, &v83, v86, v75);
  do
  {
    if (*((char *)&v85 + v6 + 15) < 0)
      operator delete(*(void **)((char *)&v84 + v6 + 8));
    v6 -= 24;
  }
  while (v6 != -48);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v83, (char *)L"nominative");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v84 + 1, "p");
  v72 = 0;
  v73 = 0;
  v74 = 0;
  *(_QWORD *)&v80 = &v72;
  BYTE8(v80) = 0;
  v72 = (std::basic_string<char16_t> *)operator new(0x30uLL);
  v73 = v72;
  v74 = v72 + 2;
  v7 = 0;
  v73 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v74, &v83, v86, v72);
  do
  {
    if (*((char *)&v85 + v7 + 15) < 0)
      operator delete(*(void **)((char *)&v84 + v7 + 8));
    v7 -= 24;
  }
  while (v7 != -48);
  v69 = 0;
  v70 = 0;
  v71 = 0;
  v8 = (morphun::dictionary::DictionaryMetaData_MMappedDictionary *)npc<morphun::dictionary::DictionaryMetaData_MMappedDictionary>(*((_QWORD *)a3 + 1));
  morphun::dictionary::DictionaryMetaData_MMappedDictionary::getAllWords(v8, v68);
  morphun::dictionary::DictionaryKeyIterator::begin((morphun::dictionary::DictionaryKeyIterator *)v68, &v66);
  morphun::dictionary::DictionaryKeyIterator::end((morphun::dictionary::DictionaryKeyIterator *)v68, &v64);
  v54 = a4 + 8;
  v55 = (marisa::Trie *)(a4 + 248);
  v9 = a3;
  while (*(_QWORD *)v67 != *(_QWORD *)v65
       || *(unsigned __int8 *)(v67 + 112) != *(unsigned __int8 *)(v65 + 112)
       || !*(_BYTE *)(v67 + 112) && *(_DWORD *)(v67 + 44) != *(_DWORD *)(v65 + 44))
  {
    v10 = npc<morphun::dictionary::metadata::MarisaTrieIterator<unsigned long long>>(v67);
    v11 = morphun::dictionary::metadata::MarisaTrieIterator<unsigned long long>::operator*(v10);
    v12 = v11;
    v13 = *(char *)(v11 + 23);
    if (v13 >= 0)
      v14 = (const UChar *)v11;
    else
      v14 = *(const UChar **)v11;
    if (v13 >= 0)
      v15 = *(unsigned __int8 *)(v11 + 23);
    else
      v15 = *(_QWORD *)(v11 + 8);
    if ((morphun::dictionary::DictionaryMetaData::getPropertyValues((uint64_t)v9, 0, v14, v15, L"derived", 7uLL) & 1) == 0)
    {
      v16 = *(char *)(v12 + 23);
      v17 = v16 >= 0 ? (const UChar *)v12 : *(const UChar **)v12;
      v18 = v16 >= 0 ? *(unsigned __int8 *)(v12 + 23) : *(_QWORD *)(v12 + 8);
      if (morphun::dictionary::DictionaryMetaData::getPropertyValues((uint64_t)v9, &v69, v17, v18, (unsigned __int16 *)"i", 0xAuLL))
      {
        v20 = *(unsigned __int8 *)(v12 + 23);
        if ((v20 & 0x80u) != 0)
          v20 = *(_DWORD *)(v12 + 8);
        if (v20 <= 3)
          v20 = 3;
        std::basic_string<char16_t>::basic_string(&v63, (const std::basic_string<char16_t> *)v12, (v20 - 3), 0xFFFFFFFFFFFFFFFFLL, v19);
        v22 = v69;
        v21 = v70;
        v56 = v70;
        while (v22 != v21)
        {
          if (*(char *)(v22 + 23) < 0)
          {
            v24 = *(_QWORD *)v22;
            v23 = *(_QWORD *)(v22 + 8);
          }
          else
          {
            LODWORD(v23) = *(unsigned __int8 *)(v22 + 23);
            v24 = v22;
          }
          KeyId = morphun::dictionary::metadata::MarisaTrie<int>::getKeyId(v55, v24, v23);
          morphun::dictionary::Inflector_MMappedDictionary::getInflectionPattern((morphun::dictionary::Inflector_MMappedDictionary *)&v80, v54, KeyId);
          v84 = v81;
          v85 = v82;
          v83 = v80;
          LOBYTE(v86[0]) = 1;
          morphun::dictionary::metadata::MarisaTrie<int>::getKey((std::basic_string<char16_t> *)&v80, (marisa::Trie *)(v82 + 240), v80);
          v27 = *((_QWORD *)&v80 + 1);
          v26 = (__int128 *)v80;
          if ((SBYTE7(v81) & 0x80u) == 0)
          {
            v26 = &v80;
            v27 = BYTE7(v81);
          }
          v28 = v79;
          v29 = __dst;
          if ((v79 & 0x80u) != 0)
          {
            v29 = (void **)__dst[0];
            v28 = (uint64_t)__dst[1];
          }
          if (v27 < v28)
            goto LABEL_48;
          if (!v28)
            goto LABEL_47;
          v30 = -v28;
          v31 = (char *)v26 + 2 * v27;
          do
          {
            v32 = *(unsigned __int16 *)v29;
            v29 = (void **)((char *)v29 + 2);
            v33 = v32 == *(unsigned __int16 *)&v31[2 * v30];
            if (v32 != *(unsigned __int16 *)&v31[2 * v30])
              break;
            ++v30;
          }
          while (v30);
          if (!v33)
LABEL_48:
            v34 = &v75;
          else
LABEL_47:
            v34 = &v72;
          morphun::dictionary::Inflector_InflectionPattern::constrain((unint64_t *)&v61, (uint64_t)&v83, (uint64_t *)v34, 0);
          if (SBYTE7(v81) < 0)
            operator delete((void *)v80);
          v35 = v62;
          v36 = v61;
          for (i = v61; v36 != v35; v36 += 6)
          {
            *(_QWORD *)&v80 = &v63;
            v37 = std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::piecewise_construct_t const&,std::tuple<std::basic_string<char16_t> const&>,std::tuple<>>(v52 - 1, (unsigned __int16 *)&v63, (__int128 **)&v80);
            if (*(char *)(v12 + 23) < 0)
              std::basic_string<char16_t>::__init_copy_ctor_external(&v59, *(const std::basic_string<char16_t>::value_type **)v12, *(_QWORD *)(v12 + 8));
            else
              v59 = *(std::basic_string<char16_t> *)v12;
            morphun::dictionary::metadata::StringContainer::getString(*(morphun::dictionary::metadata::StringContainer **)(*(_QWORD *)v36 + 40), v36[2], &__p);
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v38 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            else
              v38 = __p.__r_.__value_.__r.__words[1];
            v60 = v38;
            v39 = v37[9];
            v40 = v37[8];
            if (v40 >= v39)
            {
              v42 = v37[7];
              v43 = (uint64_t)(v40 - v42) >> 5;
              v44 = v43 + 1;
              if ((unint64_t)(v43 + 1) >> 59)
                std::vector<std::pair<morphun::dialog::DefaultArticleLookupFunction const*,std::vector<std::pair<std::basic_string<char16_t>,std::vector<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>> const>>::__throw_length_error[abi:ne180100]();
              v45 = v39 - v42;
              if (v45 >> 4 > v44)
                v44 = v45 >> 4;
              if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFE0)
                v46 = 0x7FFFFFFFFFFFFFFLL;
              else
                v46 = v44;
              *(_QWORD *)&v82 = v37 + 9;
              v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>(v46);
              v48 = (std::basic_string<char16_t> *)&v47[32 * v43];
              *(_QWORD *)&v80 = v47;
              *((_QWORD *)&v80 + 1) = v48;
              *((_QWORD *)&v81 + 1) = &v47[32 * v49];
              *v48 = v59;
              memset(&v59, 0, sizeof(v59));
              LOBYTE(v48[1].__r_.__value_.__l.__data_) = v38;
              *(_QWORD *)&v81 = (char *)v48 + 32;
              std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>::__swap_out_circular_buffer(v37 + 7, &v80);
              v41 = v37[8];
              std::__split_buffer<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>::~__split_buffer((uint64_t)&v80);
            }
            else
            {
              *(std::basic_string<char16_t> *)v40 = v59;
              *(_BYTE *)(v40 + 24) = v38;
              v41 = v40 + 32;
            }
            v37[8] = v41;
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
          }
          if (i)
            operator delete(i);
          v22 += 24;
          v21 = v56;
        }
        v9 = a3;
        if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v63.__r_.__value_.__l.__data_);
      }
    }
    morphun::dictionary::DictionaryKeyIterator::operator++((uint64_t)&v66);
  }
  *(_QWORD *)&v83 = &v69;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v83);
  *(_QWORD *)&v83 = &v72;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v83);
  *(_QWORD *)&v83 = &v75;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v83);
  if ((char)v79 < 0)
    operator delete(__dst[0]);
  return this;
}

void sub_1CB5B67F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD **a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37,char a38,uint64_t a39,char a40,uint64_t a41,char a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51)
{
  uint64_t v51;

  *(_QWORD *)(v51 - 160) = &a44;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v51 - 160));
  *(_QWORD *)(v51 - 160) = &a47;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v51 - 160));
  *(_QWORD *)(v51 - 160) = &a50;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v51 - 160));
  if (*(char *)(v51 - 209) < 0)
    operator delete(*(void **)(v51 - 232));
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::destroy(*a10);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::piecewise_construct_t const&,std::tuple<std::basic_string<char16_t> const&>,std::tuple<>>(uint64_t **a1, unsigned __int16 *a2, __int128 **a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t **v7;
  std::basic_string<char16_t> *v8;
  __int128 *v9;
  __int128 v10;
  _QWORD v12[2];
  char v13;
  uint64_t v14;

  v5 = (uint64_t **)std::__tree<std::basic_string<char16_t>>::__find_equal<std::basic_string<char16_t>>((uint64_t)a1, &v14, a2);
  v6 = *v5;
  if (!*v5)
  {
    v7 = v5;
    v6 = (uint64_t *)operator new(0x50uLL);
    v12[0] = v6;
    v12[1] = a1 + 1;
    v13 = 0;
    v8 = (std::basic_string<char16_t> *)(v6 + 4);
    v9 = *a3;
    if (*((char *)*a3 + 23) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(v8, *(const std::basic_string<char16_t>::value_type **)v9, *((_QWORD *)v9 + 1));
    }
    else
    {
      v10 = *v9;
      v6[6] = *((_QWORD *)v9 + 2);
      *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v10;
    }
    v6[7] = 0;
    v6[8] = 0;
    v6[9] = 0;
    v13 = 1;
    std::__tree<std::u16string_view>::__insert_node_at(a1, v14, v7, v6);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,void *>>>>::reset[abi:ne180100]((uint64_t)v12);
  }
  return v6;
}

void sub_1CB5B6AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::unique_ptr<std::__tree_node<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,void *>>>>::reset[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t *std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *result;
  v3 = result[1];
  v4 = a2[1];
  if (v3 == *result)
  {
    v5 = a2[1];
  }
  else
  {
    do
    {
      v5 = v4 - 32;
      v6 = *(_OWORD *)(v3 - 32);
      *(_QWORD *)(v4 - 16) = *(_QWORD *)(v3 - 16);
      *(_OWORD *)(v4 - 32) = v6;
      *(_QWORD *)(v3 - 24) = 0;
      *(_QWORD *)(v3 - 16) = 0;
      *(_QWORD *)(v3 - 32) = 0;
      *(_BYTE *)(v4 - 8) = *(_BYTE *)(v3 - 8);
      v4 -= 32;
      v3 -= 32;
    }
    while (v3 != v2);
  }
  a2[1] = v5;
  v7 = *result;
  *result = v5;
  a2[1] = v7;
  v8 = result[1];
  result[1] = a2[2];
  a2[2] = v8;
  v9 = result[2];
  result[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>::~__split_buffer(uint64_t a1)
{
  void **v2;
  void **v3;
  void **v4;

  v3 = *(void ***)(a1 + 8);
  v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      v4 = v2 - 4;
      *(_QWORD *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v4);
        v4 = *(void ***)(a1 + 16);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::basic_string<char16_t> const,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,0>((uint64_t)v1 + 32);
    operator delete(v1);
  }
}

std::basic_string<char16_t> *morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::getHeuristicSuffix@<X0>(std::basic_string<char16_t> *__str@<X0>, std::allocator<char16_t> *a2@<X4>, std::basic_string<char16_t> *a3@<X8>)
{
  int v5;

  v5 = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  if ((v5 & 0x80u) != 0)
    v5 = __str->__r_.__value_.__r.__words[1];
  if (v5 <= 3)
    v5 = 3;
  return std::basic_string<char16_t>::basic_string(a3, __str, (v5 - 3), 0xFFFFFFFFFFFFFFFFLL, a2);
}

morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator *morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::FiGrammarSynthesizer_LemmaApproximator(morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator *this, const morphun::dictionary::DictionaryMetaData *a2, const morphun::dictionary::Inflector *a3)
{
  uint64_t **v4;
  uint64_t v5;
  uint64_t v6;
  morphun::dictionary::DictionaryMetaData_MMappedDictionary *v7;
  const morphun::dictionary::DictionaryMetaData *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const UChar *v13;
  uint64_t v14;
  int v15;
  const UChar *v16;
  uint64_t v17;
  std::allocator<char16_t> *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int16 KeyId;
  __int128 *v25;
  unint64_t v26;
  uint64_t v27;
  void **v28;
  uint64_t v29;
  char *v30;
  int v31;
  BOOL v32;
  std::basic_string<char16_t> **v33;
  int *v34;
  int *v35;
  uint64_t *v36;
  char v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  std::basic_string<char16_t> *v47;
  uint64_t v48;
  char *v52;
  marisa::Trie *v53;
  uint64_t v54;
  int *i;
  std::basic_string<char16_t> __p;
  std::basic_string<char16_t> v57;
  char v58;
  int *v59;
  int *v60;
  std::basic_string<char16_t> v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[2];
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  std::basic_string<char16_t> *v70;
  std::basic_string<char16_t> *v71;
  std::basic_string<char16_t> *v72;
  std::basic_string<char16_t> *v73;
  std::basic_string<char16_t> *v74;
  std::basic_string<char16_t> *v75;
  void *__dst[2];
  unsigned __int8 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84[2];

  *((_QWORD *)&v84[0] + 1) = *MEMORY[0x1E0C80C00];
  *(_QWORD *)this = &off_1E866E3C0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = (char *)this + 16;
  v4 = (uint64_t **)((char *)this + 8);
  *((_QWORD *)this + 3) = 0;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__dst, (char *)L"yks=-");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v81, (char *)L"nominative");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v82 + 1, (char *)L"singular");
  v73 = 0;
  v74 = 0;
  v75 = 0;
  *(_QWORD *)&v78 = &v73;
  BYTE8(v78) = 0;
  v73 = (std::basic_string<char16_t> *)operator new(0x30uLL);
  v74 = v73;
  v75 = v73 + 2;
  v5 = 0;
  v74 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v75, &v81, v84, v73);
  do
  {
    if (*((char *)&v83 + v5 + 15) < 0)
      operator delete(*(void **)((char *)&v82 + v5 + 8));
    v5 -= 24;
  }
  while (v5 != -48);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v81, (char *)L"nominative");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>((_QWORD *)&v82 + 1, "p");
  v70 = 0;
  v71 = 0;
  v72 = 0;
  *(_QWORD *)&v78 = &v70;
  BYTE8(v78) = 0;
  v70 = (std::basic_string<char16_t> *)operator new(0x30uLL);
  v71 = v70;
  v72 = v70 + 2;
  v6 = 0;
  v71 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v72, &v81, v84, v70);
  do
  {
    if (*((char *)&v83 + v6 + 15) < 0)
      operator delete(*(void **)((char *)&v82 + v6 + 8));
    v6 -= 24;
  }
  while (v6 != -48);
  v67 = 0;
  v68 = 0;
  v69 = 0;
  v7 = (morphun::dictionary::DictionaryMetaData_MMappedDictionary *)npc<morphun::dictionary::DictionaryMetaData_MMappedDictionary>(*((_QWORD *)a2 + 1));
  morphun::dictionary::DictionaryMetaData_MMappedDictionary::getAllWords(v7, v66);
  morphun::dictionary::DictionaryKeyIterator::begin((morphun::dictionary::DictionaryKeyIterator *)v66, &v64);
  morphun::dictionary::DictionaryKeyIterator::end((morphun::dictionary::DictionaryKeyIterator *)v66, &v62);
  v52 = (char *)a3 + 8;
  v53 = (const morphun::dictionary::Inflector *)((char *)a3 + 248);
  v8 = a2;
  while (*(_QWORD *)v65 != *(_QWORD *)v63
       || *(unsigned __int8 *)(v65 + 112) != *(unsigned __int8 *)(v63 + 112)
       || !*(_BYTE *)(v65 + 112) && *(_DWORD *)(v65 + 44) != *(_DWORD *)(v63 + 44))
  {
    v9 = npc<morphun::dictionary::metadata::MarisaTrieIterator<unsigned long long>>(v65);
    v10 = morphun::dictionary::metadata::MarisaTrieIterator<unsigned long long>::operator*(v9);
    v11 = v10;
    v12 = *(char *)(v10 + 23);
    if (v12 >= 0)
      v13 = (const UChar *)v10;
    else
      v13 = *(const UChar **)v10;
    if (v12 >= 0)
      v14 = *(unsigned __int8 *)(v10 + 23);
    else
      v14 = *(_QWORD *)(v10 + 8);
    if ((morphun::dictionary::DictionaryMetaData::getPropertyValues((uint64_t)v8, 0, v13, v14, L"derived", 7uLL) & 1) == 0)
    {
      v15 = *(char *)(v11 + 23);
      v16 = v15 >= 0 ? (const UChar *)v11 : *(const UChar **)v11;
      v17 = v15 >= 0 ? *(unsigned __int8 *)(v11 + 23) : *(_QWORD *)(v11 + 8);
      if (morphun::dictionary::DictionaryMetaData::getPropertyValues((uint64_t)v8, &v67, v16, v17, (unsigned __int16 *)"i", 0xAuLL))
      {
        v19 = *(unsigned __int8 *)(v11 + 23);
        if ((v19 & 0x80u) != 0)
          v19 = *(_DWORD *)(v11 + 8);
        if (v19 <= 3)
          v19 = 3;
        std::basic_string<char16_t>::basic_string(&v61, (const std::basic_string<char16_t> *)v11, (v19 - 3), 0xFFFFFFFFFFFFFFFFLL, v18);
        v21 = v67;
        v20 = v68;
        v54 = v68;
        while (v21 != v20)
        {
          if (*(char *)(v21 + 23) < 0)
          {
            v23 = *(_QWORD *)v21;
            v22 = *(_QWORD *)(v21 + 8);
          }
          else
          {
            LODWORD(v22) = *(unsigned __int8 *)(v21 + 23);
            v23 = v21;
          }
          KeyId = morphun::dictionary::metadata::MarisaTrie<int>::getKeyId(v53, v23, v22);
          morphun::dictionary::Inflector_MMappedDictionary::getInflectionPattern((morphun::dictionary::Inflector_MMappedDictionary *)&v78, (uint64_t)v52, KeyId);
          v82 = v79;
          v83 = v80;
          v81 = v78;
          LOBYTE(v84[0]) = 1;
          morphun::dictionary::metadata::MarisaTrie<int>::getKey((std::basic_string<char16_t> *)&v78, (marisa::Trie *)(v80 + 240), v78);
          v26 = *((_QWORD *)&v78 + 1);
          v25 = (__int128 *)v78;
          if ((SBYTE7(v79) & 0x80u) == 0)
          {
            v25 = &v78;
            v26 = BYTE7(v79);
          }
          v27 = v77;
          v28 = __dst;
          if ((v77 & 0x80u) != 0)
          {
            v28 = (void **)__dst[0];
            v27 = (uint64_t)__dst[1];
          }
          if (v26 < v27)
            goto LABEL_48;
          if (!v27)
            goto LABEL_47;
          v29 = -v27;
          v30 = (char *)v25 + 2 * v26;
          do
          {
            v31 = *(unsigned __int16 *)v28;
            v28 = (void **)((char *)v28 + 2);
            v32 = v31 == *(unsigned __int16 *)&v30[2 * v29];
            if (v31 != *(unsigned __int16 *)&v30[2 * v29])
              break;
            ++v29;
          }
          while (v29);
          if (!v32)
LABEL_48:
            v33 = &v73;
          else
LABEL_47:
            v33 = &v70;
          morphun::dictionary::Inflector_InflectionPattern::constrain((unint64_t *)&v59, (uint64_t)&v81, (uint64_t *)v33, 0);
          if (SBYTE7(v79) < 0)
            operator delete((void *)v78);
          v34 = v60;
          v35 = v59;
          for (i = v59; v35 != v34; v35 += 6)
          {
            *(_QWORD *)&v78 = &v61;
            v36 = std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::piecewise_construct_t const&,std::tuple<std::basic_string<char16_t> const&>,std::tuple<>>(v4, (unsigned __int16 *)&v61, (__int128 **)&v78);
            if (*(char *)(v11 + 23) < 0)
              std::basic_string<char16_t>::__init_copy_ctor_external(&v57, *(const std::basic_string<char16_t>::value_type **)v11, *(_QWORD *)(v11 + 8));
            else
              v57 = *(std::basic_string<char16_t> *)v11;
            morphun::dictionary::metadata::StringContainer::getString(*(morphun::dictionary::metadata::StringContainer **)(*(_QWORD *)v35 + 40), v35[2], &__p);
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v37 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            else
              v37 = __p.__r_.__value_.__r.__words[1];
            v58 = v37;
            v38 = v36[9];
            v39 = v36[8];
            if (v39 >= v38)
            {
              v41 = v36[7];
              v42 = (uint64_t)(v39 - v41) >> 5;
              v43 = v42 + 1;
              if ((unint64_t)(v42 + 1) >> 59)
                std::vector<std::pair<morphun::dialog::DefaultArticleLookupFunction const*,std::vector<std::pair<std::basic_string<char16_t>,std::vector<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>> const>>::__throw_length_error[abi:ne180100]();
              v44 = v38 - v41;
              if (v44 >> 4 > v43)
                v43 = v44 >> 4;
              if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFE0)
                v45 = 0x7FFFFFFFFFFFFFFLL;
              else
                v45 = v43;
              *(_QWORD *)&v80 = v36 + 9;
              v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>(v45);
              v47 = (std::basic_string<char16_t> *)&v46[32 * v42];
              *(_QWORD *)&v78 = v46;
              *((_QWORD *)&v78 + 1) = v47;
              *((_QWORD *)&v79 + 1) = &v46[32 * v48];
              *v47 = v57;
              memset(&v57, 0, sizeof(v57));
              LOBYTE(v47[1].__r_.__value_.__l.__data_) = v37;
              *(_QWORD *)&v79 = (char *)v47 + 32;
              std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>::__swap_out_circular_buffer(v36 + 7, &v78);
              v40 = v36[8];
              std::__split_buffer<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>::~__split_buffer((uint64_t)&v78);
            }
            else
            {
              *(std::basic_string<char16_t> *)v39 = v57;
              *(_BYTE *)(v39 + 24) = v37;
              v40 = v39 + 32;
            }
            v36[8] = v40;
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
          }
          if (i)
            operator delete(i);
          v21 += 24;
          v20 = v54;
        }
        v8 = a2;
        if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v61.__r_.__value_.__l.__data_);
      }
    }
    morphun::dictionary::DictionaryKeyIterator::operator++((uint64_t)&v64);
  }
  *(_QWORD *)&v81 = &v67;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v81);
  *(_QWORD *)&v81 = &v70;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v81);
  *(_QWORD *)&v81 = &v73;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v81);
  if ((char)v77 < 0)
    operator delete(__dst[0]);
  return this;
}

void sub_1CB5B725C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _QWORD **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37,char a38,uint64_t a39,char a40,uint64_t a41,char a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51)
{
  uint64_t v51;

  *(_QWORD *)(v51 - 160) = &a44;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v51 - 160));
  *(_QWORD *)(v51 - 160) = &a47;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v51 - 160));
  *(_QWORD *)(v51 - 160) = &a50;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v51 - 160));
  if (*(char *)(v51 - 209) < 0)
    operator delete(*(void **)(v51 - 232));
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::destroy(*a9);
  _Unwind_Resume(a1);
}

uint64_t *morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::FiGrammarSynthesizer_LemmaApproximator(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4, std::allocator<char16_t> *a5)
{
  uint64_t v6;
  uint64_t **v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _OWORD *v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  std::basic_string<char16_t> __p;
  std::basic_string<char16_t> *p_p;

  v6 = *a2;
  *a1 = *a2;
  *(uint64_t *)((char *)a1 + *(_QWORD *)(v6 - 40)) = a2[1];
  a1[2] = 0;
  a1[3] = 0;
  v7 = (uint64_t **)(a1 + 2);
  a1[1] = (uint64_t)(a1 + 2);
  v8 = *a3;
  v9 = a3[1];
  if (*a3 != v9)
  {
    do
    {
      v10 = *(unsigned __int8 *)(v8 + 23);
      if ((v10 & 0x80u) != 0)
        v10 = *(_DWORD *)(v8 + 8);
      if (v10 <= 3)
        v10 = 3;
      std::basic_string<char16_t>::basic_string(&__p, (const std::basic_string<char16_t> *)v8, (v10 - 3), 0xFFFFFFFFFFFFFFFFLL, a5);
      p_p = &__p;
      v11 = std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::piecewise_construct_t const&,std::tuple<std::basic_string<char16_t>&&>,std::tuple<>>(v7 - 1, (unsigned __int16 *)&__p, (_OWORD **)&p_p);
      v12 = (uint64_t *)v11 + 7;
      v13 = *((_QWORD *)v11 + 8);
      if (v13 >= *((_QWORD *)v11 + 9))
      {
        v14 = std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>::__emplace_back_slow_path<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple const&>(v12, (__int128 *)v8);
      }
      else
      {
        std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>::__construct_one_at_end[abi:ne180100]<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple const&>((uint64_t)v12, (__int128 *)v8);
        v14 = v13 + 32;
      }
      *((_QWORD *)v11 + 8) = v14;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v8 += 32;
    }
    while (v8 != v9);
  }
  return a1;
}

void sub_1CB5B756C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _QWORD **v14;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::destroy(*v14);
  _Unwind_Resume(a1);
}

_OWORD *std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::piecewise_construct_t const&,std::tuple<std::basic_string<char16_t>&&>,std::tuple<>>(uint64_t **a1, unsigned __int16 *a2, _OWORD **a3)
{
  void **v5;
  _OWORD *v6;
  uint64_t **v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v11[2];
  char v12;
  uint64_t v13;

  v5 = (void **)std::__tree<std::basic_string<char16_t>>::__find_equal<std::basic_string<char16_t>>((uint64_t)a1, &v13, a2);
  v6 = *v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v6 = operator new(0x50uLL);
    v11[1] = a1 + 1;
    v8 = *a3;
    v9 = *((_QWORD *)*a3 + 2);
    v6[2] = **a3;
    *((_QWORD *)v6 + 6) = v9;
    *v8 = 0;
    v8[1] = 0;
    v8[2] = 0;
    *((_QWORD *)v6 + 8) = 0;
    *((_QWORD *)v6 + 9) = 0;
    *((_QWORD *)v6 + 7) = 0;
    v12 = 1;
    std::__tree<std::u16string_view>::__insert_node_at(a1, v13, v7, (uint64_t *)v6);
    v11[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,void *>>>>::reset[abi:ne180100]((uint64_t)v11);
  }
  return v6;
}

void std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>::__construct_one_at_end[abi:ne180100]<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple const&>(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *(_QWORD *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(*(std::basic_string<char16_t> **)(a1 + 8), *(const std::basic_string<char16_t>::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v4 = v5;
  }
  *(_BYTE *)(v4 + 24) = *((_BYTE *)a2 + 24);
  *(_QWORD *)(a1 + 8) = v4 + 32;
}

void sub_1CB5B76B0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>::__emplace_back_slow_path<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  std::basic_string<char16_t> *v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v15[2];
  std::basic_string<char16_t> *v16;
  char *v17;
  uint64_t *v18;

  v2 = (a1[1] - *a1) >> 5;
  v3 = v2 + 1;
  if ((unint64_t)(v2 + 1) >> 59)
    std::vector<std::pair<morphun::dialog::DefaultArticleLookupFunction const*,std::vector<std::pair<std::basic_string<char16_t>,std::vector<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>> const>>::__throw_length_error[abi:ne180100]();
  v6 = a1 + 2;
  v7 = a1[2] - *a1;
  if (v7 >> 4 > v3)
    v3 = v7 >> 4;
  if ((unint64_t)v7 >= 0x7FFFFFFFFFFFFFE0)
    v8 = 0x7FFFFFFFFFFFFFFLL;
  else
    v8 = v3;
  v18 = v6;
  if (v8)
  {
    v10 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>(v8);
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  v11 = (std::basic_string<char16_t> *)&v10[32 * v2];
  v15[0] = v10;
  v15[1] = v11;
  v16 = v11;
  v17 = &v10[32 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(v11, *(const std::basic_string<char16_t>::value_type **)a2, *((_QWORD *)a2 + 1));
    v11 = v16;
  }
  else
  {
    v12 = *a2;
    v11->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  v10[32 * v2 + 24] = *((_BYTE *)a2 + 24);
  v16 = (std::basic_string<char16_t> *)((char *)v11 + 32);
  std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>::__swap_out_circular_buffer(a1, v15);
  v13 = a1[1];
  std::__split_buffer<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_1CB5B77B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::FiGrammarSynthesizer_LemmaApproximator(_QWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4, std::allocator<char16_t> *a5)
{
  uint64_t **v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _OWORD *v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::basic_string<char16_t> __p;
  std::basic_string<char16_t> *p_p;

  *a1 = &off_1E866E3C0;
  a1[2] = 0;
  a1[1] = a1 + 2;
  v6 = (uint64_t **)(a1 + 1);
  a1[3] = 0;
  v7 = *a2;
  v8 = a2[1];
  if (*a2 != v8)
  {
    do
    {
      v9 = *(unsigned __int8 *)(v7 + 23);
      if ((v9 & 0x80u) != 0)
        v9 = *(_DWORD *)(v7 + 8);
      if (v9 <= 3)
        v9 = 3;
      std::basic_string<char16_t>::basic_string(&__p, (const std::basic_string<char16_t> *)v7, (v9 - 3), 0xFFFFFFFFFFFFFFFFLL, a5);
      p_p = &__p;
      v10 = std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::piecewise_construct_t const&,std::tuple<std::basic_string<char16_t>&&>,std::tuple<>>(v6, (unsigned __int16 *)&__p, (_OWORD **)&p_p);
      v11 = (uint64_t *)v10 + 7;
      v12 = *((_QWORD *)v10 + 8);
      if (v12 >= *((_QWORD *)v10 + 9))
      {
        v13 = std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>::__emplace_back_slow_path<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple const&>(v11, (__int128 *)v7);
      }
      else
      {
        std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>::__construct_one_at_end[abi:ne180100]<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple const&>((uint64_t)v11, (__int128 *)v7);
        v13 = v12 + 32;
      }
      *((_QWORD *)v10 + 8) = v13;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v7 += 32;
    }
    while (v7 != v8);
  }
  return a1;
}

void sub_1CB5B78D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _QWORD **v14;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::destroy(*v14);
  _Unwind_Resume(a1);
}

void morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::~FiGrammarSynthesizer_LemmaApproximator(morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator *this, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_QWORD *)this = *a2;
  *(_QWORD *)((char *)this + *(_QWORD *)(v2 - 40)) = a2[1];
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::destroy(*((_QWORD **)this + 2));
}

void `virtual thunk to'morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::~FiGrammarSynthesizer_LemmaApproximator(morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator *this)
{
  char *v1;

  v1 = (char *)this + *(_QWORD *)(*(_QWORD *)this - 32);
  *(_QWORD *)v1 = &off_1E866E3C0;
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::destroy(*((_QWORD **)v1 + 2));
}

{
  char *v1;

  v1 = (char *)this + *(_QWORD *)(*(_QWORD *)this - 32);
  *(_QWORD *)v1 = &off_1E866E3C0;
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::vector<morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::WordSuffixTuple>>>>::destroy(*((_QWORD **)v1 + 2));
  JUMPOUT(0x1D179D2ECLL);
}

void morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::getBestMatchingKnownLemma(std::basic_string<char16_t> *__str@<X1>, uint64_t a2@<X0>, std::allocator<char16_t> *a3@<X4>, std::basic_string<char16_t> *a4@<X8>)
{
  int v7;
  const std::basic_string<char16_t>::value_type *v8;
  std::basic_string<char16_t>::size_type size;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t *v16;
  std::basic_string<char16_t> *v17;
  unsigned __int16 *v18;
  char v19;
  std::basic_string<char16_t>::size_type v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  std::basic_string<char16_t>::size_type v24;
  std::basic_string<char16_t> *v25;
  std::basic_string<char16_t> *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  std::basic_string<char16_t>::size_type v32;
  std::basic_string<char16_t> *v33;
  std::basic_string<char16_t>::size_type v34;
  std::basic_string<char16_t> *v35;
  std::basic_string<char16_t>::size_type v36;
  unsigned int v37;
  unsigned int v38;
  int v39;
  const std::basic_string<char16_t>::value_type *v40;
  std::basic_string<char16_t>::size_type v41;
  std::basic_string<char16_t> *p_p;
  std::basic_string<char16_t> __dst;
  std::basic_string<char16_t> __p;
  std::basic_string<char16_t> v45;

  v7 = SHIBYTE(__str->__r_.__value_.__r.__words[2]);
  if (v7 < 0)
  {
    v8 = (const std::basic_string<char16_t>::value_type *)__str->__r_.__value_.__r.__words[0];
    size = __str->__r_.__value_.__l.__size_;
    if (!size)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(a4, v8, 0);
      return;
    }
    std::basic_string<char16_t>::__init_copy_ctor_external(a4, v8, size);
    LOBYTE(v7) = *((_BYTE *)&__str->__r_.__value_.__s + 23);
  }
  else
  {
    *a4 = *__str;
    if (!v7)
      return;
  }
  v7 = v7;
  if ((v7 & 0x80u) != 0)
    v7 = __str->__r_.__value_.__r.__words[1];
  if (v7 <= 3)
    v7 = 3;
  std::basic_string<char16_t>::basic_string(&v45, __str, (v7 - 3), 0xFFFFFFFFFFFFFFFFLL, a3);
  if ((__str->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v10 = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  else
    v10 = __str->__r_.__value_.__r.__words[1];
  v13 = *(_QWORD *)(a2 + 16);
  v11 = a2 + 16;
  v12 = v13;
  if (!v13)
    goto LABEL_56;
  v14 = v11;
  do
  {
    v15 = std::less<std::basic_string<char16_t>>::operator()[abi:ne180100]((unsigned __int16 *)(v12 + 32), (unsigned __int16 *)&v45);
    v16 = (uint64_t *)(v12 + 8);
    if (!v15)
    {
      v16 = (uint64_t *)v12;
      v14 = v12;
    }
    v12 = *v16;
  }
  while (*v16);
  if (v14 == v11
    || std::less<std::basic_string<char16_t>>::operator()[abi:ne180100]((unsigned __int16 *)&v45, (unsigned __int16 *)(v14 + 32))|| (v17 = *(std::basic_string<char16_t> **)(v14 + 56), v18 = *(unsigned __int16 **)(v14 + 64), v17 == (std::basic_string<char16_t> *)v18))
  {
LABEL_56:
    morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::getFallBackLemma((uint64_t)__str, &__p);
    if (SHIBYTE(a4->__r_.__value_.__r.__words[2]) < 0)
      operator delete(a4->__r_.__value_.__l.__data_);
    *a4 = __p;
    if (morphun::util::gLogLevel <= 1)
    {
      std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"No match found. Using fallback lemma: ");
      v39 = SHIBYTE(a4->__r_.__value_.__r.__words[2]);
      if (v39 >= 0)
        v40 = (const std::basic_string<char16_t>::value_type *)a4;
      else
        v40 = (const std::basic_string<char16_t>::value_type *)a4->__r_.__value_.__r.__words[0];
      if (v39 >= 0)
        v41 = HIBYTE(a4->__r_.__value_.__r.__words[2]);
      else
        v41 = a4->__r_.__value_.__l.__size_;
      std::basic_string<char16_t>::append(&__dst, v40, v41);
      __p = __dst;
      memset(&__dst, 0, sizeof(__dst));
      if (morphun::util::gLogLevel <= 1)
      {
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &__p;
        else
          p_p = (std::basic_string<char16_t> *)__p.__r_.__value_.__r.__words[0];
        morphun::util::logToTopOfStackLogger((morphun::util *)1, 0, (uint64_t)p_p);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__dst.__r_.__value_.__l.__data_);
    }
    goto LABEL_74;
  }
  v19 = 0;
  do
  {
    if (SHIBYTE(v17->__r_.__value_.__r.__words[2]) < 0)
    {
      v22 = v17->__r_.__value_.__r.__words[0];
      v20 = v17->__r_.__value_.__l.__size_;
      v21 = v17->__r_.__value_.__r.__words[0] + 2 * v20;
    }
    else
    {
      v20 = HIBYTE(v17->__r_.__value_.__r.__words[2]);
      v21 = (uint64_t)v17 + 2 * v20;
      v22 = (uint64_t)v17;
    }
    v23 = v22 + 2 * v20 - 2 * SLOBYTE(v17[1].__r_.__value_.__l.__data_);
    v24 = HIBYTE(__str->__r_.__value_.__r.__words[2]);
    if ((v24 & 0x80u) == 0)
      v25 = __str;
    else
      v25 = (std::basic_string<char16_t> *)__str->__r_.__value_.__r.__words[0];
    if ((v24 & 0x80u) != 0)
      v24 = __str->__r_.__value_.__l.__size_;
    v26 = (std::basic_string<char16_t> *)((char *)v25 + 2 * v24 - 2);
    while (v21 != v23)
    {
      v28 = *(unsigned __int16 *)(v21 - 2);
      v21 -= 2;
      v27 = v28;
      v29 = (unsigned __int16)v26->__r_.__value_.__s.__data_[0];
      v26 = (std::basic_string<char16_t> *)((char *)v26 - 2);
      if (v27 != v29)
        goto LABEL_54;
    }
    v30 = morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::levenshteinDistance((uint64_t *)__str, (uint64_t *)v17);
    v31 = v30;
    if (v30 <= v10)
    {
      if (v30 < v10)
        goto LABEL_52;
      v32 = HIBYTE(a4->__r_.__value_.__r.__words[2]);
      if ((v32 & 0x80u) == 0)
        v33 = a4;
      else
        v33 = (std::basic_string<char16_t> *)a4->__r_.__value_.__r.__words[0];
      if ((v32 & 0x80u) != 0)
        v32 = a4->__r_.__value_.__l.__size_;
      if (SHIBYTE(v17->__r_.__value_.__r.__words[2]) < 0)
      {
        v35 = (std::basic_string<char16_t> *)v17->__r_.__value_.__r.__words[0];
        v34 = v17->__r_.__value_.__l.__size_;
      }
      else
      {
        v34 = HIBYTE(v17->__r_.__value_.__r.__words[2]);
        v35 = v17;
      }
      if (v32 >= v34)
        v36 = v34;
      else
        v36 = v32;
      if (v36)
      {
        do
        {
          v37 = (unsigned __int16)v35->__r_.__value_.__s.__data_[0];
          v38 = (unsigned __int16)v33->__r_.__value_.__s.__data_[0];
          if (v37 < v38)
            goto LABEL_53;
          if (v38 < v37)
            goto LABEL_52;
          v35 = (std::basic_string<char16_t> *)((char *)v35 + 2);
          v33 = (std::basic_string<char16_t> *)((char *)v33 + 2);
        }
        while (--v36);
      }
      if (v32 < v34)
LABEL_52:
        std::basic_string<char16_t>::operator=(a4, v17);
LABEL_53:
      v19 = 1;
      v10 = v31;
    }
LABEL_54:
    v17 = (std::basic_string<char16_t> *)((char *)v17 + 32);
  }
  while (v17 != (std::basic_string<char16_t> *)v18);
  if ((v19 & 1) == 0)
    goto LABEL_56;
LABEL_74:
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
}

void sub_1CB5B7CD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  uint64_t v27;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  if (a27 < 0)
    operator delete(a22);
  if (*(char *)(v27 + 23) < 0)
    operator delete(*(void **)v27);
  _Unwind_Resume(exception_object);
}

uint64_t morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::levenshteinDistance(uint64_t *a1, uint64_t *a2)
{
  signed int v2;
  signed int v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  _DWORD *v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t *v19;

  v2 = *((unsigned __int8 *)a1 + 23);
  if ((v2 & 0x80u) != 0)
    v2 = *((_DWORD *)a1 + 2);
  v3 = *((unsigned __int8 *)a2 + 23);
  if ((v3 & 0x80u) != 0)
    v3 = *((_DWORD *)a2 + 2);
  if (v2 <= v3)
    v4 = a1;
  else
    v4 = a2;
  if (v2 <= v3)
    v5 = a2;
  else
    v5 = a1;
  if (v2 <= v3)
    v6 = v3;
  else
    v6 = v2;
  if (v2 >= v3)
    v7 = v3;
  else
    v7 = v2;
  if ((_DWORD)v7)
  {
    if ((_DWORD)v6)
    {
      v8 = (int)v7 + 1;
      if ((_DWORD)v7 == -1)
      {
        v9 = 0;
      }
      else
      {
        if ((v8 & 0x80000000) != 0)
          std::vector<std::pair<morphun::dialog::DefaultArticleLookupFunction const*,std::vector<std::pair<std::basic_string<char16_t>,std::vector<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>> const>>::__throw_length_error[abi:ne180100]();
        v9 = (int *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((int)v7 + 1);
        bzero(v9, 4 * v8);
        v10 = 0;
        do
        {
          v9[v10] = v10;
          ++v10;
        }
        while ((_DWORD)v7 + 1 != v10);
      }
      if ((int)v6 >= 1)
      {
        v11 = v9 + 1;
        v12 = *v9;
        v13 = 1;
        do
        {
          if (*((char *)v5 + 23) >= 0)
            v14 = v5;
          else
            v14 = (uint64_t *)*v5;
          v15 = *((unsigned __int16 *)v14 + v13 - 1);
          *v9 = v13;
          if ((int)v7 >= 1)
          {
            v16 = 0;
            v17 = v13;
            do
            {
              v18 = v11[v16];
              if (*((char *)v4 + 23) >= 0)
                v19 = v4;
              else
                v19 = (uint64_t *)*v4;
              if (*((unsigned __int16 *)v19 + v16) != v15)
                ++v12;
              if (v18 + 1 >= v17 + 1)
                ++v17;
              else
                v17 = v18 + 1;
              if (v12 < v17)
                v17 = v12;
              v11[v16++] = v17;
              v12 = v18;
            }
            while ((v7 + 1) - 1 != v16);
          }
          v12 = v13++;
        }
        while (v13 != (_DWORD)v6 + 1);
      }
      v6 = v9[(int)v7];
      operator delete(v9);
    }
    else
    {
      return v7;
    }
  }
  return v6;
}

_QWORD *morphun::grammar::synthesis::FiGrammarSynthesizer_LemmaApproximator::getFallBackLemma@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int isEndsWithVowel;
  _BOOL4 hasBackVowels;
  __int16 *v7;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v4 = morphun::util::LocaleUtils::FINNISH((morphun::util::LocaleUtils *)a1);
  isEndsWithVowel = morphun::dictionary::PhraseProperties::isEndsWithVowel(v4, a1);
  hasBackVowels = morphun::grammar::synthesis::FiGrammarSynthesizer::hasBackVowels(a1);
  if (isEndsWithVowel)
  {
    if (!hasBackVowels)
    {
      v9 = *(unsigned __int8 *)(a1 + 23);
      if ((v9 & 0x80u) == 0)
        v10 = a1;
      else
        v10 = *(_QWORD *)a1;
      if ((v9 & 0x80u) != 0)
        v9 = *(_QWORD *)(a1 + 8);
      v11 = *(unsigned __int16 *)(v10 + 2 * v9 - 2);
      if (v11 <= 120)
      {
        if (v11 == 101)
        {
          v7 = (__int16 *)"m";
          return std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(a2, (char *)v7);
        }
        if (v11 == 105)
        {
          v7 = L"kiwi";
          return std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(a2, (char *)v7);
        }
      }
      else
      {
        switch(v11)
        {
          case 121:
            v7 = L"rugby";
            return std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(a2, (char *)v7);
          case 228:
            v7 = aSytk;
            return std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(a2, (char *)v7);
          case 246:
            v7 = (__int16 *)&unk_1CB73E750;
            return std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(a2, (char *)v7);
        }
      }
    }
    v7 = (__int16 *)"r";
  }
  else if (hasBackVowels)
  {
    v7 = L"jukebox";
  }
  else
  {
    v7 = L"kennel";
  }
  return std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(a2, (char *)v7);
}

void morphun::grammar::synthesis::PlGrammarSynthesizer::addSemanticFeatures(morphun::grammar::synthesis::PlGrammarSynthesizer *this, morphun::dialog::SemanticFeatureModel *a2)
{
  morphun::util::LocaleUtils *v3;
  morphun::grammar::synthesis::GrammemeConstants *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t i;
  morphun::util::LocaleUtils *v12;
  morphun::grammar::synthesis::GrammemeConstants *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t j;
  std::basic_string<char16_t> *v19;
  std::basic_string<char16_t> *v20;
  std::basic_string<char16_t> *v21;
  void *__p[2];
  char v23;
  std::basic_string<char16_t> **v24;
  char v25;
  std::basic_string<char16_t> v26;
  std::basic_string<char16_t> v27;
  std::basic_string<char16_t> v28;
  __int128 v29;

  *(_QWORD *)&v29 = *MEMORY[0x1E0C80C00];
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v3 = (morphun::util::LocaleUtils *)operator new();
  v4 = (morphun::grammar::synthesis::GrammemeConstants *)morphun::util::LocaleUtils::POLISH(v3);
  v5 = morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v4);
  if (*(char *)(v5 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v26, *(const std::basic_string<char16_t>::value_type **)v5, *(_QWORD *)(v5 + 8));
  }
  else
  {
    v6 = *(_OWORD *)v5;
    v26.__r_.__value_.__r.__words[2] = *(_QWORD *)(v5 + 16);
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v6;
  }
  v7 = morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  if (*(char *)(v7 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v27, *(const std::basic_string<char16_t>::value_type **)v7, *(_QWORD *)(v7 + 8));
  }
  else
  {
    v8 = *(_OWORD *)v7;
    v27.__r_.__value_.__r.__words[2] = *(_QWORD *)(v7 + 16);
    *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v8;
  }
  v9 = morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v7);
  if (*(char *)(v9 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v28, *(const std::basic_string<char16_t>::value_type **)v9, *(_QWORD *)(v9 + 8));
  }
  else
  {
    v10 = *(_OWORD *)v9;
    v28.__r_.__value_.__r.__words[2] = *(_QWORD *)(v9 + 16);
    *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v10;
  }
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v24 = &v19;
  v25 = 0;
  v19 = (std::basic_string<char16_t> *)operator new(0x48uLL);
  v20 = v19;
  v21 = v19 + 3;
  v20 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v21, (__int128 *)&v26, &v29, v19);
  morphun::dialog::DictionaryLookupFunction::DictionaryLookupFunction((uint64_t)v3, v4, (uint64_t *)&v19);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)this, (unsigned __int16 *)__p, (morphun::util::LocaleUtils *)((char *)v3 + *(_QWORD *)(*(_QWORD *)v3 - 56)));
  v24 = &v19;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v24);
  for (i = 0; i != -9; i -= 3)
  {
    if (SHIBYTE(v28.__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(*(void **)((char *)&v28.__r_.__value_.__l.__data_ + i * 8));
  }
  if (v23 < 0)
    operator delete(__p[0]);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"count");
  v12 = (morphun::util::LocaleUtils *)operator new();
  v13 = (morphun::grammar::synthesis::GrammemeConstants *)morphun::util::LocaleUtils::POLISH(v12);
  v14 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_SINGULAR(v13);
  if (*(char *)(v14 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v26, *(const std::basic_string<char16_t>::value_type **)v14, *(_QWORD *)(v14 + 8));
  }
  else
  {
    v15 = *(_OWORD *)v14;
    v26.__r_.__value_.__r.__words[2] = *(_QWORD *)(v14 + 16);
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v15;
  }
  v16 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL((morphun::grammar::synthesis::GrammemeConstants *)v14);
  if (*(char *)(v16 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v27, *(const std::basic_string<char16_t>::value_type **)v16, *(_QWORD *)(v16 + 8));
  }
  else
  {
    v17 = *(_OWORD *)v16;
    v27.__r_.__value_.__r.__words[2] = *(_QWORD *)(v16 + 16);
    *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v17;
  }
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v24 = &v19;
  v25 = 0;
  v19 = (std::basic_string<char16_t> *)operator new(0x30uLL);
  v20 = v19;
  v21 = v19 + 2;
  v20 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v21, (__int128 *)&v26, (__int128 *)&v28, v19);
  morphun::dialog::DictionaryLookupFunction::DictionaryLookupFunction((uint64_t)v12, v13, (uint64_t *)&v19);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)this, (unsigned __int16 *)__p, (morphun::util::LocaleUtils *)((char *)v12 + *(_QWORD *)(*(_QWORD *)v12 - 56)));
  v24 = &v19;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v24);
  for (j = 0; j != -6; j -= 3)
  {
    if (SHIBYTE(v27.__r_.__value_.__r.__words[j + 2]) < 0)
      operator delete(*(void **)((char *)&v26 + j * 8 + 24));
  }
  if (v23 < 0)
    operator delete(__p[0]);
}

void sub_1CB5B82F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  uint64_t v31;
  uint64_t v33;

  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a18);
  v33 = 0;
  while (1)
  {
    if (*(&a31 + v33) < 0)
      operator delete(*(void **)((char *)&a26 + v33));
    v33 -= 24;
    if (v33 == -48)
    {
      MEMORY[0x1D179D2EC](v31, 0x10F3C40BE507067);
      if (a17 < 0)
        operator delete(__p);
      _Unwind_Resume(a1);
    }
  }
}

void morphun::dialog::language::ItCommonConceptFactory::~ItCommonConceptFactory(void **this)
{
  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(this, (void **)&off_1E8667958);
}

{
  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(this, (void **)&off_1E8667958);
  JUMPOUT(0x1D179D2ECLL);
}

uint64_t morphun::dialog::language::ItCommonConceptFactory::createOrList(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  morphun::exception::NullPointerException *exception;
  std::basic_string<char16_t> __p;
  uint64_t (**v8)(morphun::dialog::SpeakableString *__hidden);
  std::basic_string<char16_t> v9;
  uint64_t v10;

  v2 = morphun::dialog::CommonConceptFactoryImpl::createOrList(a1, a2);
  if (!v2)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  v3 = v2;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__p, " ");
  v8 = &off_1E866AD28;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::basic_string<char16_t>::__init_copy_ctor_external(&v9, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v9 = __p;
  v10 = 0;
  v4 = (*(uint64_t (**)(uint64_t, uint64_t (***)(morphun::dialog::SpeakableString *__hidden)))(*(_QWORD *)v3 + 184))(v3, &v8);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v4;
}

void sub_1CB5B8558(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *morphun::dialog::language::ItCommonConceptFactory::createAndList(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  std::basic_string<char16_t> __p;
  uint64_t (**v8)(morphun::dialog::SpeakableString *__hidden);
  std::basic_string<char16_t> v9;
  uint64_t v10;

  v4 = (_QWORD *)operator new();
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  *v4 = &off_1E865C900;
  morphun::dialog::SemanticConceptList::SemanticConceptList((uint64_t)v4, (uint64_t *)&off_1E8667F70, v5, a2);
  *v4 = &off_1E866DE48;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__p, (char *)L", ");
  v8 = &off_1E866AD28;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::basic_string<char16_t>::__init_copy_ctor_external(&v9, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v9 = __p;
  v10 = 0;
  morphun::dialog::SpeakableString::operator=((uint64_t)(v4 + 18), (uint64_t)&v8);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v4;
}

void sub_1CB5B86A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  morphun::dialog::SemanticConceptList *v15;

  if (a14 < 0)
    operator delete(__p);
  morphun::dialog::SemanticConceptList::~SemanticConceptList(v15, (uint64_t *)&off_1E8667F70);
  MEMORY[0x1D179D2EC](v15, 0x10F3C40223A8A63);
  _Unwind_Resume(a1);
}

morphun::dialog::GrammaticalCountConcept *morphun::dialog::language::ItCommonConceptFactory::quantify(morphun::dialog::language::ItCommonConceptFactory *this, const morphun::dialog::NumberConcept *a2, const morphun::dialog::SemanticFeatureConceptBase *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  uint64_t v10;
  morphun::dialog::GrammaticalCountConcept *v11;
  morphun::exception::NullPointerException *exception;
  void *__p[2];
  char v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v17[0] = &off_1E866AD28;
  memset(&v17[1], 0, 32);
  if (*((_DWORD *)a2 + 4) == 1)
    v6 = (uint64_t)*((double *)a2 + 1);
  else
    v6 = *((_QWORD *)a2 + 1);
  if (v6 != 1)
    goto LABEL_9;
  if (!a3 || !*((_QWORD *)this + 94))
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  v7 = (*(uint64_t (**)(const morphun::dialog::SemanticFeatureConceptBase *))(*(_QWORD *)a3 + 104))(a3);
  v8 = v7;
  if (v7)
  {
    v9 = (__int128 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 32))(v7);
    v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 32))(v8);
    morphun::dialog::SpeakableString::SpeakableString((uint64_t)v16, v9, v10);
    morphun::dialog::SpeakableString::operator=((uint64_t)v17, (uint64_t)v16);
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
  }
  else
  {
LABEL_9:
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"cardinal-masculine");
    (*(void (**)(_QWORD *__return_ptr, const morphun::dialog::NumberConcept *, void **))(*(_QWORD *)a2 + 200))(v16, a2, __p);
    morphun::dialog::SpeakableString::operator=((uint64_t)v17, (uint64_t)v16);
    if (v15 < 0)
      operator delete(__p[0]);
  }
  v11 = morphun::dialog::CommonConceptFactoryImpl::quantify(this, a2, (const morphun::dialog::SpeakableString *)v17, a3);
  return v11;
}

void sub_1CB5B8904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void morphun::dialog::language::ItCommonConceptFactory::quantifiedJoin(uint64_t a1@<X1>, uint64_t a2@<X2>, int a3@<W4>, _QWORD *a4@<X8>)
{
  std::basic_string<char16_t> __p;
  uint64_t (**v8)(morphun::dialog::SpeakableString *__hidden);
  std::basic_string<char16_t> v9;
  uint64_t v10;
  _QWORD v11[5];

  if (a3 == 1)
  {
    morphun::dialog::SpeakableString::operator+(a1, a2, a4);
  }
  else
  {
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__p, (char *)&word_1CB73EE14);
    v8 = &off_1E866AD28;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      std::basic_string<char16_t>::__init_copy_ctor_external(&v9, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    else
      v9 = __p;
    v10 = 0;
    morphun::dialog::SpeakableString::operator+(a1, (uint64_t)&v8, v11);
    morphun::dialog::SpeakableString::operator+((uint64_t)v11, a2, a4);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1CB5B8A8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void morphun::dialog::language::FrCommonConceptFactory::~FrCommonConceptFactory(void **this)
{
  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(this, (void **)&off_1E8667858);
}

{
  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(this, (void **)&off_1E8667858);
  JUMPOUT(0x1D179D2ECLL);
}

void morphun::dialog::language::FrCommonConceptFactory::quote(const morphun::dialog::SpeakableString *a1@<X1>, uint64_t a2@<X8>)
{
  const void **v5;
  __int128 v6;
  int v7;
  const void **v8;
  uint64_t v9;
  void *v10;
  std::basic_string<char16_t> v11;
  std::basic_string<char16_t> v12;

  if ((*(unsigned int (**)(const morphun::dialog::SpeakableString *))(*(_QWORD *)a1 + 48))(a1))
  {
    v5 = (const void **)(*(uint64_t (**)(const morphun::dialog::SpeakableString *))(*(_QWORD *)a1 + 32))(a1);
    std::operator+<char16_t>((uint64_t)&v12, word_1CB73E782, v5);
    std::basic_string<char16_t>::append(&v12, word_1CB73E786, 1uLL);
    v6 = *(_OWORD *)&v12.__r_.__value_.__l.__data_;
    LODWORD(v11.__r_.__value_.__l.__data_) = v12.__r_.__value_.__r.__words[2];
    *(_DWORD *)((char *)v11.__r_.__value_.__r.__words + 3) = *(_DWORD *)((char *)&v12.__r_.__value_.__r.__words[2] + 3);
    v7 = SHIBYTE(v12.__r_.__value_.__r.__words[2]);
    memset(&v12, 0, sizeof(v12));
    *(_QWORD *)a2 = &off_1E866AD28;
    if (v7 < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)(a2 + 8), (const std::basic_string<char16_t>::value_type *)v6, *((std::basic_string<char16_t>::size_type *)&v6 + 1));
      *(_QWORD *)(a2 + 32) = 0;
      operator delete((void *)v6);
    }
    else
    {
      *(_OWORD *)(a2 + 8) = v6;
      *(_DWORD *)(a2 + 24) = v11.__r_.__value_.__l.__data_;
      *(_DWORD *)(a2 + 27) = *(_DWORD *)((char *)v11.__r_.__value_.__r.__words + 3);
      *(_BYTE *)(a2 + 31) = v7;
      *(_QWORD *)(a2 + 32) = 0;
    }
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    {
      v10 = (void *)v12.__r_.__value_.__r.__words[0];
      goto LABEL_11;
    }
  }
  else
  {
    v8 = (const void **)(*(uint64_t (**)(const morphun::dialog::SpeakableString *))(*(_QWORD *)a1 + 32))(a1);
    std::operator+<char16_t>((uint64_t)&v11, word_1CB73E782, v8);
    std::basic_string<char16_t>::append(&v11, word_1CB73E786, 1uLL);
    v12 = v11;
    memset(&v11, 0, sizeof(v11));
    v9 = (*(uint64_t (**)(const morphun::dialog::SpeakableString *))(*(_QWORD *)a1 + 40))(a1);
    morphun::dialog::SpeakableString::SpeakableString(a2, (__int128 *)&v12, v9);
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v12.__r_.__value_.__l.__data_);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    {
      v10 = (void *)v11.__r_.__value_.__r.__words[0];
LABEL_11:
      operator delete(v10);
    }
  }
}

void sub_1CB5B8C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;

  operator delete(v21);
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void morphun::dialog::LocalizedCommonConceptFactoryProvider::~LocalizedCommonConceptFactoryProvider(morphun::dialog::LocalizedCommonConceptFactoryProvider *this)
{
}

{
  JUMPOUT(0x1D179D2ECLL);
}

uint64_t morphun::dialog::LocalizedCommonConceptFactoryProvider::getCommonConceptFactory(morphun::dialog::LocalizedCommonConceptFactoryProvider *this, const morphun::util::ULocale *a2)
{
  std::mutex *v4;
  uint64_t **v5;
  _QWORD *v6;
  uint64_t **v7;
  _BOOL4 v8;
  _QWORD *v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _BOOL4 v16;
  _QWORD *v17;
  char *v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  morphun::util::LocaleUtils *v23;
  _QWORD *v24;
  std::basic_string<char16_t>::size_type size;
  std::basic_string<char16_t> *v26;
  std::basic_string<char16_t> *v27;
  std::basic_string<char16_t>::size_type *v28;
  _BOOL4 v29;
  std::basic_string<char16_t>::size_type *v30;
  std::basic_string<char16_t>::size_type *p_size;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  std::basic_string<char16_t>::size_type v35;
  std::basic_string<char16_t> *p_p;
  std::basic_string<char16_t>::size_type v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void **v41;
  void **v42;
  UErrorCode v43;
  uint64_t *v44;
  uint64_t **v45;
  uint64_t **v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  morphun::util::LocaleUtils *v51;
  morphun::util::LocaleUtils *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  _QWORD *v58;
  morphun::exception::ICUException *exception;
  std::mutex *v60;
  std::mutex *v61;
  std::basic_string<char16_t> v62;
  std::basic_string<char16_t> v63;
  int v64;
  std::basic_string<char16_t> __p;
  _QWORD v66[15];

  v66[13] = *MEMORY[0x1E0C80C00];
  v4 = (std::mutex *)((char *)this + 32);
  std::mutex::lock((std::mutex *)((char *)this + 32));
  v5 = (uint64_t **)((char *)this + 16);
  v6 = (_QWORD *)*((_QWORD *)this + 2);
  if (v6)
  {
    v7 = (uint64_t **)((char *)this + 16);
    do
    {
      v8 = std::less<morphun::util::ULocale>::operator()[abi:ne180100]((uint64_t)(v6 + 4), (uint64_t)a2);
      v9 = v6 + 1;
      if (!v8)
      {
        v9 = v6;
        v7 = (uint64_t **)v6;
      }
      v6 = (_QWORD *)*v9;
    }
    while (*v9);
    if (v7 != v5 && !std::less<morphun::util::ULocale>::operator()[abi:ne180100]((uint64_t)a2, (uint64_t)(v7 + 4)))
    {
      v38 = (uint64_t)v7[20];
      goto LABEL_87;
    }
  }
  if ((v10 & 1) == 0
  {
    v61 = v4;
    v51 = (morphun::util::LocaleUtils *)operator new();
    v52 = (morphun::util::LocaleUtils *)morphun::util::LocaleUtils::HONGKONG_CHINESE(v51);
    v53 = morphun::util::LocaleUtils::HONGKONG_CANTONESE(v52);
    v54 = v53 + 8;
    v55 = *(_QWORD *)(v53 + 8);
    v56 = *(char *)(v53 + 31);
    morphun::util::ULocale::ULocale((morphun::util::ULocale *)&__p, v52);
    if (v56 >= 0)
      v57 = v54;
    else
      v57 = v55;
    v66[11] = v57;
    std::map<morphun::util::ULocale,char const*>::map[abi:ne180100]((uint64_t **)v51, (const morphun::util::ULocale *)&__p, 1);
    morphun::dialog::constructCommonConceptFactory(morphun::util::ULocale const&)::ALIAS_MAP = (uint64_t)v51;
    v4 = v61;
  }
  v11 = morphun::dialog::constructCommonConceptFactory(morphun::util::ULocale const&)::ALIAS_MAP;
  npc<std::map<morphun::util::ULocale,char const*>>(morphun::dialog::constructCommonConceptFactory(morphun::util::ULocale const&)::ALIAS_MAP);
  v14 = *(_QWORD **)(v11 + 8);
  v12 = v11 + 8;
  v13 = v14;
  if (!v14)
    goto LABEL_16;
  v15 = (_QWORD *)v12;
  do
  {
    v16 = std::less<morphun::util::ULocale>::operator()[abi:ne180100]((uint64_t)(v13 + 4), (uint64_t)a2);
    v17 = v13 + 1;
    if (!v16)
    {
      v17 = v13;
      v15 = v13;
    }
    v13 = (_QWORD *)*v17;
  }
  while (*v17);
  if (v15 == (_QWORD *)v12
    || std::less<morphun::util::ULocale>::operator()[abi:ne180100]((uint64_t)a2, (uint64_t)(v15 + 4)))
  {
LABEL_16:
    v15 = (_QWORD *)v12;
  }
  if ((_QWORD *)(npc<std::map<morphun::util::ULocale,char const*>>(morphun::dialog::constructCommonConceptFactory(morphun::util::ULocale const&)::ALIAS_MAP)
                + 8) == v15)
  {
    if (*((char *)a2 + 31) >= 0)
      v18 = (char *)a2 + 8;
    else
      v18 = (char *)*((_QWORD *)a2 + 1);
  }
  else
  {
    v18 = (char *)v15[20];
  }
  v19 = 0;
  v20 = 40;
  while (1)
  {
    v21 = v19 + v20;
    if (v19 + v20 < 0 != __OFADD__(v19, v20))
      ++v21;
    v22 = (uint64_t)v21 >> 1;
    v23 = (morphun::util::LocaleUtils *)strcmp(v18, (&morphun::dialog::constructCommonConceptFactory(morphun::util::ULocale const&)::COMMON_CONCEPT_FACTORY_CONSTRUCTORS)[2 * (v21 >> 1)]);
    if ((v23 & 0x80000000) == 0)
      break;
    v20 = v22 - 1;
LABEL_29:
    if (v19 > v20)
    {
      v24 = (_QWORD *)morphun::util::LocaleUtils::BASE_SUPPORTED_LOCALES(v23);
      std::map<std::string,std::vector<morphun::util::ULocale>>::map[abi:ne180100]((uint64_t)&v62, v24);
      std::string::basic_string[abi:ne180100]<0>(&__p, v18);
      size = v62.__r_.__value_.__l.__size_;
      if (!v62.__r_.__value_.__l.__size_)
        goto LABEL_40;
      v26 = (std::basic_string<char16_t> *)&v62.__r_.__value_.__r.__words[1];
      do
      {
        v27 = v26;
        v28 = (std::basic_string<char16_t>::size_type *)(size + 32);
        v29 = std::less<std::string>::operator()[abi:ne180100]((_QWORD *)(size + 32), &__p);
        v30 = (std::basic_string<char16_t>::size_type *)(size + 8);
        if (!v29)
        {
          v30 = (std::basic_string<char16_t>::size_type *)size;
          v26 = (std::basic_string<char16_t> *)size;
        }
        size = *v30;
      }
      while (*v30);
      if (v26 == (std::basic_string<char16_t> *)&v62.__r_.__value_.__r.__words[1]
        || (!v29 ? (p_size = v28) : (p_size = &v27[1].__r_.__value_.__l.__size_),
            std::less<std::string>::operator()[abi:ne180100](&__p, p_size)))
      {
LABEL_40:
        v26 = (std::basic_string<char16_t> *)&v62.__r_.__value_.__r.__words[1];
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (&v62.__r_.__value_.__r.__words[1] == (std::basic_string<char16_t>::size_type *)v26)
      {
        v38 = 0;
      }
      else
      {
        v60 = v4;
        v32 = operator new();
        *(_OWORD *)&v63.__r_.__value_.__r.__words[1] = 0uLL;
        v63.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)&v63.__r_.__value_.__l.__size_;
        *(_QWORD *)v32 = &off_1E866B238;
        morphun::util::ULocale::ULocale((morphun::util::ULocale *)(v32 + 8), a2);
        morphun::dialog::SemanticFeatureModel::SemanticFeatureModel((morphun::dialog::SemanticFeatureModel *)(v32 + 136), a2);
        std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__p, (char *)L"count");
        v33 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>(v32 + 144, (unsigned __int16 *)&__p);
        if (v32 + 152 == v33)
          v34 = 0;
        else
          v34 = *(_QWORD *)(v33 + 56);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        *(_QWORD *)(v32 + 376) = v34;
        std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__p, "m");
        v39 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>(v32 + 144, (unsigned __int16 *)&__p);
        if (v32 + 152 == v39)
          v40 = 0;
        else
          v40 = *(_QWORD *)(v39 + 56);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        *(_QWORD *)(v32 + 384) = v40;
        *(_QWORD *)(v32 + 392) = 0;
        std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100](v32 + 400, &v63);
        v41 = (void **)(v32 + 424);
        *(_OWORD *)(v32 + 440) = 0u;
        *(_OWORD *)(v32 + 456) = 0u;
        v42 = (void **)(v32 + 448);
        *(_OWORD *)(v32 + 424) = 0u;
        morphun::dialog::getDefaultList(v32 + 472);
        morphun::dialog::getDefaultList((uint64_t)&__p);
        morphun::dialog::SpeakableString::SpeakableString((morphun::dialog::SpeakableString *)(v32 + 552), (const morphun::dialog::SpeakableString *)v66);
        morphun::dialog::getDefaultList(v32 + 592);
        morphun::dialog::getDefaultList((uint64_t)&__p);
        morphun::dialog::SpeakableString::SpeakableString((morphun::dialog::SpeakableString *)(v32 + 672), (const morphun::dialog::SpeakableString *)v66);
        morphun::dialog::GrammaticalCountFactory::GrammaticalCountFactory((morphun::dialog::GrammaticalCountFactory *)(v32 + 712), a2);
        v64 = 0;
        ulocdata_open();
        v43 = v64;
        if (v64 >= 1)
        {
          exception = (morphun::exception::ICUException *)__cxa_allocate_exception(0x38uLL);
          morphun::exception::ICUException::ICUException(exception, v43);
        }
        morphun::dialog::getQuote((uint64_t)&__p);
        if (*(char *)(v32 + 447) < 0)
          operator delete(*v41);
        *(_OWORD *)v41 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *(_QWORD *)(v32 + 440) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
        morphun::dialog::getQuote((uint64_t)&__p);
        if (*(char *)(v32 + 471) < 0)
          operator delete(*v42);
        *(_OWORD *)v42 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *(_QWORD *)(v32 + 464) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
        ulocdata_close();
        std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v63.__r_.__value_.__l.__size_);
        v38 = v32 + *(_QWORD *)(*(_QWORD *)v32 - 144);
        v4 = v60;
      }
      std::__tree<std::__value_type<std::string,std::vector<morphun::util::ULocale>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<morphun::util::ULocale>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<morphun::util::ULocale>>>>::destroy((_QWORD *)v62.__r_.__value_.__l.__size_);
      goto LABEL_77;
    }
  }
  if ((_DWORD)v23)
  {
    v19 = v22 + 1;
    goto LABEL_29;
  }
  if (morphun::util::gLogLevel <= 2)
  {
    (**(void (***)(std::basic_string<char16_t> *__return_ptr, const morphun::util::ULocale *))a2)(&v62, a2);
    std::basic_string<char16_t>::insert(&v62, (std::basic_string<char16_t>::size_type)&unk_1CB73E83A, (const std::basic_string<char16_t>::value_type *)0x1D, v35);
    v63 = v62;
    memset(&v62, 0, sizeof(v62));
    std::basic_string<char16_t>::append(&v63, word_1CB73E876, 0x29uLL);
    __p = v63;
    memset(&v63, 0, sizeof(v63));
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::basic_string<char16_t> *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v37 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v37 = __p.__r_.__value_.__l.__size_;
    morphun::util::Logger::infoComponent((uint64_t)&unk_1CB73E7EE, p_p, v37);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v63.__r_.__value_.__l.__data_);
    if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v62.__r_.__value_.__l.__data_);
  }
  v38 = ((uint64_t (*)(const morphun::util::ULocale *))(&morphun::dialog::constructCommonConceptFactory(morphun::util::ULocale const&)::COMMON_CONCEPT_FACTORY_CONSTRUCTORS)[2 * v22 + 1])(a2);
LABEL_77:
  if (!v38)
  {
    v58 = __cxa_allocate_exception(0x38uLL);
    (**(void (***)(std::basic_string<char16_t> *__return_ptr, const morphun::util::ULocale *))a2)(&v63, a2);
    std::operator+[abi:ne180100]<char16_t,std::char_traits<char16_t>,std::allocator<char16_t>>((uint64_t)&__p, &v63, word_1CB73E78A);
    morphun::exception::Throwable::Throwable((uint64_t)v58, (__int128 *)&__p);
    *v58 = &off_1E8673120;
  }
  v44 = *v5;
  v45 = (uint64_t **)((char *)this + 16);
  v46 = (uint64_t **)((char *)this + 16);
  if (*v5)
  {
    while (1)
    {
      while (1)
      {
        v45 = (uint64_t **)v44;
        v47 = (uint64_t)(v44 + 4);
        if (!std::less<morphun::util::ULocale>::operator()[abi:ne180100]((uint64_t)a2, (uint64_t)(v44 + 4)))
          break;
        v44 = *v45;
        v46 = v45;
        if (!*v45)
          goto LABEL_84;
      }
      if (!std::less<morphun::util::ULocale>::operator()[abi:ne180100](v47, (uint64_t)a2))
        break;
      v46 = v45 + 1;
      v44 = v45[1];
      if (!v44)
        goto LABEL_84;
    }
  }
  else
  {
LABEL_84:
    v48 = (uint64_t *)operator new(0xA8uLL);
    __p.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)v48;
    __p.__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)this + 16;
    LOBYTE(__p.__r_.__value_.__r.__words[2]) = 0;
    morphun::util::ULocale::ULocale((morphun::util::ULocale *)(v48 + 4), a2);
    v48[20] = v38;
    LOBYTE(__p.__r_.__value_.__r.__words[2]) = 1;
    *v48 = 0;
    v48[1] = 0;
    v48[2] = (uint64_t)v45;
    *v46 = v48;
    v49 = **((_QWORD **)this + 1);
    if (v49)
    {
      *((_QWORD *)this + 1) = v49;
      v48 = *v46;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)this + 2), v48);
    ++*((_QWORD *)this + 3);
    __p.__r_.__value_.__r.__words[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<morphun::util::ULocale,morphun::analysis::ConfigurableAnalyzer *>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<morphun::util::ULocale,morphun::analysis::ConfigurableAnalyzer *>,void *>>>>::reset[abi:ne180100]((uint64_t)&__p);
  }
LABEL_87:
  std::mutex::unlock(v4);
  return v38;
}

void sub_1CB5B9520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, morphun::dialog::SpeakableString *a10, morphun::dialog::SpeakableString *a11, morphun::dialog::SpeakableString *a12, morphun::dialog::SemanticFeatureModel *a13, morphun::util::ULocale *a14, std::mutex *a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  uint64_t v34;

  MEMORY[0x1D179D2EC](v34, 0x1020C4062D53EE8);
  std::mutex::unlock(a15);
  _Unwind_Resume(a1);
}

uint64_t **std::map<morphun::util::ULocale,char const*>::map[abi:ne180100](uint64_t **a1, const morphun::util::ULocale *a2, uint64_t a3)
{
  uint64_t *v4;
  const morphun::util::ULocale *v5;
  const morphun::util::ULocale *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  BOOL v11;
  uint64_t **v12;
  uint64_t **v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  _QWORD v19[2];
  char v20;

  a1[1] = 0;
  v4 = (uint64_t *)(a1 + 1);
  a1[2] = 0;
  *a1 = (uint64_t *)(a1 + 1);
  if (a3)
  {
    v5 = a2;
    v6 = (const morphun::util::ULocale *)((char *)a2 + 136 * a3);
    while (1)
    {
      v7 = a1[1];
      v8 = v4;
      if (*a1 != v4)
      {
        v9 = a1[1];
        v10 = v4;
        if (v7)
        {
          do
          {
            v8 = v9;
            v9 = (uint64_t *)v9[1];
          }
          while (v9);
        }
        else
        {
          do
          {
            v8 = (uint64_t *)v10[2];
            v11 = *v8 == (_QWORD)v10;
            v10 = v8;
          }
          while (v11);
        }
        if (!std::less<morphun::util::ULocale>::operator()[abi:ne180100]((uint64_t)(v8 + 4), (uint64_t)v5))
          break;
      }
      v12 = (uint64_t **)v4;
      v13 = (uint64_t **)v4;
      if (!v7)
        goto LABEL_19;
      v13 = (uint64_t **)(v8 + 1);
      if (!v8[1])
      {
        v12 = (uint64_t **)v8;
LABEL_19:
        v16 = (uint64_t *)operator new(0xA8uLL);
        v19[0] = v16;
        v19[1] = v4;
        v20 = 0;
        morphun::util::ULocale::ULocale((morphun::util::ULocale *)(v16 + 4), v5);
        v16[20] = *((_QWORD *)v5 + 16);
        v20 = 1;
        *v16 = 0;
        v16[1] = 0;
        v16[2] = (uint64_t)v12;
        *v13 = v16;
        v17 = (uint64_t *)**a1;
        if (v17)
        {
          *a1 = v17;
          v16 = *v13;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v16);
        a1[2] = (uint64_t *)((char *)a1[2] + 1);
        v19[0] = 0;
        std::unique_ptr<std::__tree_node<std::__value_type<morphun::util::ULocale,morphun::analysis::ConfigurableAnalyzer *>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<morphun::util::ULocale,morphun::analysis::ConfigurableAnalyzer *>,void *>>>>::reset[abi:ne180100]((uint64_t)v19);
      }
LABEL_22:
      v5 = (const morphun::util::ULocale *)((char *)v5 + 136);
      if (v5 == v6)
        return a1;
    }
    v12 = (uint64_t **)v4;
    v13 = (uint64_t **)v4;
    if (v7)
    {
      v14 = v7;
      while (1)
      {
        while (1)
        {
          v12 = (uint64_t **)v14;
          v15 = (uint64_t)(v14 + 4);
          if (!std::less<morphun::util::ULocale>::operator()[abi:ne180100]((uint64_t)v5, (uint64_t)(v14 + 4)))
            break;
          v14 = *v12;
          v13 = v12;
          if (!*v12)
            goto LABEL_19;
        }
        if (!std::less<morphun::util::ULocale>::operator()[abi:ne180100](v15, (uint64_t)v5))
          goto LABEL_22;
        v13 = v12 + 1;
        v14 = v12[1];
        if (!v14)
          goto LABEL_19;
      }
    }
    goto LABEL_19;
  }
  return a1;
}

void sub_1CB5B99B4(_Unwind_Exception *a1)
{
  void **v1;

  std::__tree<std::__value_type<morphun::util::ULocale,morphun::analysis::ConfigurableAnalyzer *>,std::__map_value_compare<morphun::util::ULocale,std::__value_type<morphun::util::ULocale,morphun::analysis::ConfigurableAnalyzer *>,std::less<morphun::util::ULocale>,true>,std::allocator<std::__value_type<morphun::util::ULocale,morphun::analysis::ConfigurableAnalyzer *>>>::destroy(v1);
  _Unwind_Resume(a1);
}

uint64_t npc<std::map<morphun::util::ULocale,char const*>>(uint64_t result)
{
  morphun::exception::NullPointerException *exception;

  if (!result)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  return result;
}

void sub_1CB5B9A20(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *morphun::dialog::constructor<morphun::dialog::language::ArCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  unint64_t i;
  std::basic_string<char16_t> *v8;
  uint64_t v9;
  uint64_t v10;
  void *v12[3];
  void *__p[2];
  char v14;
  std::basic_string<char16_t> __dst[2];
  std::basic_string<char16_t> v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E8657C40;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(__dst, v4, (char *)L"cardinal-masculine");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v16, v6, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v12, (unsigned __int16 *)__dst, 2);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E86675D8, a1, (uint64_t)__p, v12);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v12[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFF4; i -= 6)
  {
    v8 = &__dst[i / 3];
    if (SHIBYTE(v16[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v8[3].__r_.__value_.__l.__data_);
    if (SHIBYTE(v8[2].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v8[2].__r_.__value_.__l.__data_);
  }
  if (v14 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E866B7B8;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__dst, "c");
  v9 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>((uint64_t)(v2 + 18), (unsigned __int16 *)__dst);
  if (v2 + 19 == (_QWORD *)v9)
    v10 = 0;
  else
    v10 = *(_QWORD *)(v9 + 56);
  npc<morphun::dialog::SemanticFeature const>(v10);
  if (SHIBYTE(__dst[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst[0].__r_.__value_.__l.__data_);
  v2[94] = v10;
  return (char *)v2 + *(_QWORD *)(*v2 - 144);
}

void sub_1CB5B9BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  void **v24;

  if (a24 < 0)
    operator delete(__p);
  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(v24, (void **)&off_1E86675D8);
  MEMORY[0x1D179D2EC](v24, 0x10F3C40EABB763BLL);
  _Unwind_Resume(a1);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::BgCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  std::basic_string<char16_t> *v7;
  __int128 *v8;
  unint64_t i;
  std::basic_string<char16_t> *v10;
  void *v12[3];
  void *__p[2];
  char v14;
  std::basic_string<char16_t> v15[2];
  std::basic_string<char16_t> v16[2];
  std::basic_string<char16_t> v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E8657E58;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(v15, v4, (char *)L"cardinal-masculine");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  v7 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v16, v6, "c");
  v8 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v7);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[16],0>(v17, v8, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v12, (unsigned __int16 *)v15, 3);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E8667618, a1, (uint64_t)__p, v12);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v12[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFEELL; i -= 6)
  {
    v10 = &v15[i / 3];
    if (SHIBYTE(v17[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v10[5].__r_.__value_.__l.__data_);
    if (SHIBYTE(v10[4].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v10[4].__r_.__value_.__l.__data_);
  }
  if (v14 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E866B8D0;
  return v2;
}

void sub_1CB5B9E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a11);
  for (i = 96; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)(&a19 + i));
  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::CaCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  unint64_t i;
  std::basic_string<char16_t> *v8;
  void *v10[3];
  void *__p[2];
  char v12;
  std::basic_string<char16_t> v13[2];
  std::basic_string<char16_t> v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E8658070;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(v13, v4, (char *)L"cardinal-masculine");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v14, v6, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v10, (unsigned __int16 *)v13, 2);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E8667658, a1, (uint64_t)__p, v10);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v10[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFF4; i -= 6)
  {
    v8 = &v13[i / 3];
    if (SHIBYTE(v14[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v8[3].__r_.__value_.__l.__data_);
    if (SHIBYTE(v8[2].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v8[2].__r_.__value_.__l.__data_);
  }
  if (v12 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E866B9E8;
  return v2;
}

void sub_1CB5B9FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a11);
  for (i = 48; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)(&a19 + i));
  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

morphun::dialog::CommonConceptFactoryImpl *morphun::dialog::constructor<morphun::dialog::language::ZhCommonConceptFactory>(morphun::util::ULocale *a1)
{
  morphun::dialog::CommonConceptFactoryImpl *v2;

  v2 = (morphun::dialog::CommonConceptFactoryImpl *)operator new();
  *(_QWORD *)v2 = &off_1E865BB10;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl(v2, (const morphun::util::ULocale *)&off_1E8667D58, a1);
  *(_QWORD *)v2 = &off_1E866D888;
  return v2;
}

void sub_1CB5BA0CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::CsCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  std::basic_string<char16_t> *v7;
  __int128 *v8;
  unint64_t i;
  std::basic_string<char16_t> *v10;
  void *v12[3];
  void *__p[2];
  char v14;
  std::basic_string<char16_t> v15[2];
  std::basic_string<char16_t> v16[2];
  std::basic_string<char16_t> v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E8658288;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(v15, v4, (char *)L"cardinal-masculine");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  v7 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v16, v6, "c");
  v8 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v7);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[16],0>(v17, v8, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v12, (unsigned __int16 *)v15, 3);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E8667698, a1, (uint64_t)__p, v12);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v12[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFEELL; i -= 6)
  {
    v10 = &v15[i / 3];
    if (SHIBYTE(v17[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v10[5].__r_.__value_.__l.__data_);
    if (SHIBYTE(v10[4].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v10[4].__r_.__value_.__l.__data_);
  }
  if (v14 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E866BB00;
  return v2;
}

void sub_1CB5BA26C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a11);
  for (i = 96; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)(&a19 + i));
  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::DaCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  unint64_t i;
  std::basic_string<char16_t> *v8;
  void *v10[3];
  void *__p[2];
  char v12;
  std::basic_string<char16_t> v13[2];
  std::basic_string<char16_t> v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E86584A0;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_COMMON(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[16],0>(v13, v4, (char *)L"cardinal-common");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v5);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[16],0>(v14, v6, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v10, (unsigned __int16 *)v13, 2);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E86676D8, a1, (uint64_t)__p, v10);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v10[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFF4; i -= 6)
  {
    v8 = &v13[i / 3];
    if (SHIBYTE(v14[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v8[3].__r_.__value_.__l.__data_);
    if (SHIBYTE(v8[2].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v8[2].__r_.__value_.__l.__data_);
  }
  if (v12 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E866BC18;
  return v2;
}

void sub_1CB5BA44C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a11);
  for (i = 48; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)(&a19 + i));
  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

uint64_t morphun::dialog::constructor<morphun::dialog::language::DeCommonConceptFactory>(morphun::util::ULocale *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *__p[2];
  char v9;

  v2 = operator new();
  *(_QWORD *)v2 = &off_1E86586B8;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((morphun::dialog::CommonConceptFactoryImpl *)v2, (const morphun::util::ULocale *)&off_1E8667718, a1);
  *(_QWORD *)v2 = &off_1E866BD30;
  *(_OWORD *)(v2 + 752) = 0u;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v3 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>(v2 + 144, (unsigned __int16 *)__p);
  if (v2 + 152 == v3)
    v4 = 0;
  else
    v4 = *(_QWORD *)(v3 + 56);
  *(_QWORD *)(v2 + 752) = v4;
  if (v9 < 0)
    operator delete(__p[0]);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, "c");
  v5 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>(v2 + 144, (unsigned __int16 *)__p);
  if (v2 + 152 == v5)
    v6 = 0;
  else
    v6 = *(_QWORD *)(v5 + 56);
  *(_QWORD *)(v2 + 760) = v6;
  if (v9 < 0)
    operator delete(__p[0]);
  return v2 + *(_QWORD *)(*(_QWORD *)v2 - 144);
}

void sub_1CB5BA5E4(_Unwind_Exception *a1)
{
  void **v1;

  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(v1, (void **)&off_1E8667718);
  MEMORY[0x1D179D2EC](v1, 0x10F3C40EABB1690);
  _Unwind_Resume(a1);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::ElCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  std::basic_string<char16_t> *v7;
  __int128 *v8;
  unint64_t i;
  std::basic_string<char16_t> *v10;
  void *v12[3];
  void *__p[2];
  char v14;
  std::basic_string<char16_t> v15[2];
  std::basic_string<char16_t> v16[2];
  std::basic_string<char16_t> v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E86588D0;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(v15, v4, (char *)L"cardinal-masculine");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  v7 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v16, v6, "c");
  v8 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v7);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[16],0>(v17, v8, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v12, (unsigned __int16 *)v15, 3);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E8667758, a1, (uint64_t)__p, v12);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v12[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFEELL; i -= 6)
  {
    v10 = &v15[i / 3];
    if (SHIBYTE(v17[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v10[5].__r_.__value_.__l.__data_);
    if (SHIBYTE(v10[4].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v10[4].__r_.__value_.__l.__data_);
  }
  if (v14 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E866BE48;
  return v2;
}

void sub_1CB5BA7A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a11);
  for (i = 96; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)(&a19 + i));
  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

morphun::dialog::CommonConceptFactoryImpl *morphun::dialog::constructor<morphun::dialog::language::EnCommonConceptFactory>(morphun::util::ULocale *a1)
{
  morphun::dialog::CommonConceptFactoryImpl *v2;

  v2 = (morphun::dialog::CommonConceptFactoryImpl *)operator new();
  *(_QWORD *)v2 = &off_1E8658AE8;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl(v2, (const morphun::util::ULocale *)&off_1E8667798, a1);
  *(_QWORD *)v2 = &off_1E866BF60;
  return v2;
}

void sub_1CB5BA894(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::EsCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  unint64_t i;
  std::basic_string<char16_t> *v8;
  void *v10[3];
  void *__p[2];
  char v12;
  std::basic_string<char16_t> v13[2];
  std::basic_string<char16_t> v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E8658D00;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(v13, v4, (char *)L"cardinal-masculine");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v14, v6, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v10, (unsigned __int16 *)v13, 2);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E86677D8, a1, (uint64_t)__p, v10);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v10[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFF4; i -= 6)
  {
    v8 = &v13[i / 3];
    if (SHIBYTE(v14[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v8[3].__r_.__value_.__l.__data_);
    if (SHIBYTE(v8[2].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v8[2].__r_.__value_.__l.__data_);
  }
  if (v12 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E866C078;
  return v2;
}

void sub_1CB5BAA08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a11);
  for (i = 48; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)(&a19 + i));
  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

morphun::dialog::CommonConceptFactoryImpl *morphun::dialog::constructor<morphun::dialog::language::EtCommonConceptFactory>(morphun::util::ULocale *a1)
{
  morphun::dialog::CommonConceptFactoryImpl *v2;

  v2 = (morphun::dialog::CommonConceptFactoryImpl *)operator new();
  *(_QWORD *)v2 = &off_1E8655238;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl(v2, (const morphun::util::ULocale *)&off_1E8655E10, a1);
  *(_QWORD *)v2 = &off_1E8656018;
  return v2;
}

void sub_1CB5BAAEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

char *morphun::dialog::constructor<morphun::dialog::language::FiCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  std::basic_string<char16_t> *v7;
  __int128 *v8;
  std::basic_string<char16_t> *v9;
  uint64_t v10;
  __int128 v11;
  morphun::grammar::synthesis::GrammemeConstants *v12;
  __int128 *v13;
  std::basic_string<char16_t> *v14;
  __int128 *v15;
  std::basic_string<char16_t> *v16;
  __int128 *v17;
  std::basic_string<char16_t> *v18;
  __int128 *v19;
  std::basic_string<char16_t> *v20;
  uint64_t v21;
  __int128 v22;
  morphun::grammar::synthesis::GrammemeConstants *v23;
  __int128 *v24;
  std::basic_string<char16_t> *v25;
  uint64_t v26;
  __int128 v27;
  morphun::util::LocaleUtils *v28;
  uint64_t v29;
  std::basic_string<char16_t> *v30;
  morphun::dictionary::DictionaryMetaData *v31;
  const morphun::util::ULocale *v32;
  _QWORD *Dictionary;
  uint64_t v34;
  uint64_t *BinaryProperties;
  morphun::exception::NullPointerException *exception;
  void **v38;
  _QWORD *v39;
  std::basic_string<char16_t> v40[2];
  std::basic_string<char16_t> v41[2];
  std::basic_string<char16_t> v42[2];
  std::basic_string<char16_t> v43;
  uint64_t v44[3];
  std::basic_string<char16_t> v45[2];
  std::basic_string<char16_t> v46[2];
  std::basic_string<char16_t> v47[2];
  std::basic_string<char16_t> v48[2];
  std::basic_string<char16_t> v49;
  uint64_t v50[3];
  std::basic_string<char16_t> v51[2];
  std::basic_string<char16_t> v52;
  uint64_t v53[3];
  __int128 __dst;
  char v55;
  __int128 v56;

  *(_QWORD *)&v56 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E8658F18;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "c");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::CASE_ABLATIVE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v40, v4, (char *)L"cardinal-ablative");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::CASE_ADESSIVE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  v7 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v41, v6, (char *)L"cardinal-adessive");
  v8 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::CASE_ALLATIVE((morphun::grammar::synthesis::GrammemeConstants *)v7);
  v9 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v42, v8, (char *)L"cardinal-allative");
  v10 = morphun::grammar::synthesis::GrammemeConstants::CASE_ELATIVE((morphun::grammar::synthesis::GrammemeConstants *)v9);
  if (*(char *)(v10 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v43, *(const std::basic_string<char16_t>::value_type **)v10, *(_QWORD *)(v10 + 8));
  }
  else
  {
    v11 = *(_OWORD *)v10;
    v43.__r_.__value_.__r.__words[2] = *(_QWORD *)(v10 + 16);
    *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v11;
  }
  v12 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v44, (char *)L"cardinal-elative");
  v13 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::CASE_ESSIVE(v12);
  v14 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[16],0>(v45, v13, "c");
  v15 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::CASE_GENITIVE((morphun::grammar::synthesis::GrammemeConstants *)v14);
  v16 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v46, v15, "c");
  v17 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::CASE_ILLATIVE((morphun::grammar::synthesis::GrammemeConstants *)v16);
  v18 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v47, v17, "c");
  v19 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::CASE_INESSIVE((morphun::grammar::synthesis::GrammemeConstants *)v18);
  v20 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v48, v19, "c");
  v21 = morphun::grammar::synthesis::GrammemeConstants::CASE_NOMINATIVE((morphun::grammar::synthesis::GrammemeConstants *)v20);
  if (*(char *)(v21 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v49, *(const std::basic_string<char16_t>::value_type **)v21, *(_QWORD *)(v21 + 8));
  }
  else
  {
    v22 = *(_OWORD *)v21;
    v49.__r_.__value_.__r.__words[2] = *(_QWORD *)(v21 + 16);
    *(_OWORD *)&v49.__r_.__value_.__l.__data_ = v22;
  }
  v23 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v50, "c");
  v24 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::CASE_PARTITIVE(v23);
  v25 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(v51, v24, (char *)L"cardinal-partitive");
  v26 = morphun::grammar::synthesis::GrammemeConstants::CASE_TRANSLATIVE((morphun::grammar::synthesis::GrammemeConstants *)v25);
  if (*(char *)(v26 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v52, *(const std::basic_string<char16_t>::value_type **)v26, *(_QWORD *)(v26 + 8));
  }
  else
  {
    v27 = *(_OWORD *)v26;
    v52.__r_.__value_.__r.__words[2] = *(_QWORD *)(v26 + 16);
    *(_OWORD *)&v52.__r_.__value_.__l.__data_ = v27;
  }
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v53, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)&v38, (unsigned __int16 *)v40, 11);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E8667818, a1, (uint64_t)&__dst, &v38);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(v39);
  v29 = 22;
  do
  {
    v30 = &v40[v29];
    if (SHIBYTE(v40[v29 - 1].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v30[-1].__r_.__value_.__l.__data_);
    if (SHIBYTE(v30[-2].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v30[-2].__r_.__value_.__l.__data_);
    v29 -= 2;
  }
  while (v29 * 24);
  if (v55 < 0)
    operator delete((void *)__dst);
  *v2 = &off_1E866C190;
  v31 = (morphun::dictionary::DictionaryMetaData *)morphun::util::LocaleUtils::FINNISH(v28);
  Dictionary = morphun::dictionary::DictionaryMetaData::createDictionary(v31, v32);
  v34 = (uint64_t)Dictionary;
  if (!Dictionary)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  v2[94] = Dictionary;
  v2[95] = 0;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "p");
  memset(v40, 0, 24);
  v38 = (void **)v40;
  LOBYTE(v39) = 0;
  v40[0].__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)operator new(0x18uLL);
  v40[0].__r_.__value_.__l.__size_ = v40[0].__r_.__value_.__r.__words[0];
  v40[0].__r_.__value_.__r.__words[2] = v40[0].__r_.__value_.__r.__words[0] + 24;
  v40[0].__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v40[0].__r_.__value_.__r.__words[2], &__dst, &v56, (std::basic_string<char16_t> *)v40[0].__r_.__value_.__l.__data_);
  BinaryProperties = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v34, v2 + 95, (uint64_t *)v40);
  morphun::util::Validate::notNull<long long>((uint64_t)BinaryProperties);
  v38 = (void **)v40;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v38);
  if (v55 < 0)
    operator delete((void *)__dst);
  return (char *)v2 + *(_QWORD *)(*v2 - 144);
}

void sub_1CB5BAED4(_Unwind_Exception *a1)
{
  void **v1;
  void *v2;

  __cxa_free_exception(v2);
  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(v1, (void **)&off_1E8667818);
  MEMORY[0x1D179D2EC](v1, 0x10F3C40B3EB4615);
  _Unwind_Resume(a1);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::FrCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  unint64_t i;
  std::basic_string<char16_t> *v8;
  void *v10[3];
  void *__p[2];
  char v12;
  std::basic_string<char16_t> v13[2];
  std::basic_string<char16_t> v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E8659130;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(v13, v4, (char *)L"cardinal-masculine");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v14, v6, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v10, (unsigned __int16 *)v13, 2);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E8667858, a1, (uint64_t)__p, v10);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v10[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFF4; i -= 6)
  {
    v8 = &v13[i / 3];
    if (SHIBYTE(v14[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v8[3].__r_.__value_.__l.__data_);
    if (SHIBYTE(v8[2].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v8[2].__r_.__value_.__l.__data_);
  }
  if (v12 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E866C2A8;
  return v2;
}

void sub_1CB5BB158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a11);
  for (i = 48; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)(&a19 + i));
  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

uint64_t morphun::dialog::constructor<morphun::dialog::language::HeCommonConceptFactory>(morphun::util::ULocale *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _WORD *String;
  uint64_t v8;
  uint64_t v9;
  unsigned __int16 *v12;
  unint64_t v13;
  __int128 v15;
  void *__p;
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  _WORD *v20;
  uint64_t v21;
  int v22;
  int v23;

  v2 = operator new();
  *(_QWORD *)v2 = &off_1E8659348;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((morphun::dialog::CommonConceptFactoryImpl *)v2, (const morphun::util::ULocale *)&off_1E8667898, a1);
  *(_QWORD *)v2 = &off_1E866C3C0;
  *(_QWORD *)(v2 + 768) = 0;
  *(_QWORD *)(v2 + 760) = 0;
  *(_QWORD *)(v2 + 752) = v2 + 760;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__p, (char *)L"gender");
  v3 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>(v2 + 144, (unsigned __int16 *)&__p);
  if (v2 + 152 == v3)
    v4 = 0;
  else
    v4 = *(_QWORD *)(v3 + 56);
  npc<morphun::dialog::SemanticFeature const>(v4);
  if (SHIBYTE(v18) < 0)
    operator delete(__p);
  *(_QWORD *)(v2 + 776) = v4;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__p, "d");
  v5 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>(v2 + 144, (unsigned __int16 *)&__p);
  if (v2 + 152 == v5)
    v6 = 0;
  else
    v6 = *(_QWORD *)(v5 + 56);
  npc<morphun::dialog::SemanticFeature const>(v6);
  if (SHIBYTE(v18) < 0)
    operator delete(__p);
  *(_QWORD *)(v2 + 784) = v6;
  String = (_WORD *)morphun::resources::DataResource::getString(qword_1CB64287A, 0x47uLL, 0);
  if (*String)
  {
    v8 = 0;
    do
      v9 = v8 + 1;
    while (String[++v8]);
  }
  else
  {
    v9 = 0;
  }
  __p = 0;
  v17 = 0;
  v18 = "\n";
  v19 = 1;
  v20 = String;
  v21 = v9;
  v22 = v9;
  v23 = 0;
  if ((int)v9 >= 1)
    morphun::util::DelimitedStringIterator::getNext((UChar *)&__p);
  while (v23 < v22 || v17 != 0)
  {
    v12 = (unsigned __int16 *)morphun::util::StringViewUtils::trim((uint64_t)__p, v17);
    *(_QWORD *)&v15 = v12;
    *((_QWORD *)&v15 + 1) = v13;
    if (v13)
    {
      if (*v12 != 35)
        std::__tree<std::u16string_view>::__emplace_unique_key_args<std::u16string_view,std::u16string_view const&>((uint64_t **)(v2 + 752), v12, v13, &v15);
    }
    morphun::util::DelimitedStringIterator::operator++((morphun::util::DelimitedStringIterator *)&__p);
  }
  return v2 + *(_QWORD *)(*(_QWORD *)v2 - 144);
}

void sub_1CB5BB3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int128 a10, int a11, __int16 a12, char a13, char a14, __int128 __dst, int a16, __int16 a17, char a18, char a19, __int128 __p,int a21,__int16 a22,char a23,char a24)
{
  uint64_t v24;
  void *exception;

  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    exception = __cxa_allocate_exception(0x68uLL);
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__p, (char *)qword_1CB64287A);
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "m");
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&a10, (char *)qword_1CB64287A);
    morphun::exception::MissingResourceException::MissingResourceException((uint64_t)exception, &__p, &__dst, &a10);
  }
  std::__tree<std::__value_type<std::u16string_view,char16_t const*>,std::__map_value_compare<std::u16string_view,std::__value_type<std::u16string_view,char16_t const*>,std::less<std::u16string_view>,true>,std::allocator<std::__value_type<std::u16string_view,char16_t const*>>>::destroy(*(_QWORD **)(v24 + 760));
  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl((void **)v24, (void **)&off_1E8667898);
  MEMORY[0x1D179D2EC](v24, 0x10F3C40CB53AF93);
  _Unwind_Resume(a1);
}

morphun::dialog::CommonConceptFactoryImpl *morphun::dialog::constructor<morphun::dialog::language::HiCommonConceptFactory>(morphun::util::ULocale *a1)
{
  morphun::dialog::CommonConceptFactoryImpl *v2;

  v2 = (morphun::dialog::CommonConceptFactoryImpl *)operator new();
  *(_QWORD *)v2 = &off_1E8659560;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl(v2, (const morphun::util::ULocale *)&off_1E86678D8, a1);
  *(_QWORD *)v2 = &off_1E866C4D8;
  return v2;
}

void sub_1CB5BB5A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::HrCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  std::basic_string<char16_t> *v7;
  __int128 *v8;
  unint64_t i;
  std::basic_string<char16_t> *v10;
  void *v12[3];
  void *__p[2];
  char v14;
  std::basic_string<char16_t> v15[2];
  std::basic_string<char16_t> v16[2];
  std::basic_string<char16_t> v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E8659778;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(v15, v4, (char *)L"cardinal-masculine");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  v7 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v16, v6, "c");
  v8 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v7);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[16],0>(v17, v8, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v12, (unsigned __int16 *)v15, 3);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E8667918, a1, (uint64_t)__p, v12);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v12[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFEELL; i -= 6)
  {
    v10 = &v15[i / 3];
    if (SHIBYTE(v17[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v10[5].__r_.__value_.__l.__data_);
    if (SHIBYTE(v10[4].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v10[4].__r_.__value_.__l.__data_);
  }
  if (v14 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E866C5F0;
  return v2;
}

void sub_1CB5BB740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a11);
  for (i = 96; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)(&a19 + i));
  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

morphun::dialog::CommonConceptFactoryImpl *morphun::dialog::constructor<morphun::dialog::language::HuCommonConceptFactory>(morphun::util::ULocale *a1)
{
  morphun::dialog::CommonConceptFactoryImpl *v2;

  v2 = (morphun::dialog::CommonConceptFactoryImpl *)operator new();
  *(_QWORD *)v2 = &off_1E8655450;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl(v2, (const morphun::util::ULocale *)&off_1E8655E50, a1);
  *(_QWORD *)v2 = &off_1E8656130;
  return v2;
}

void sub_1CB5BB834(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

morphun::dialog::CommonConceptFactoryImpl *morphun::dialog::constructor<morphun::dialog::language::MsCommonConceptFactory>(morphun::util::ULocale *a1)
{
  morphun::dialog::CommonConceptFactoryImpl *v2;

  v2 = (morphun::dialog::CommonConceptFactoryImpl *)operator new();
  *(_QWORD *)v2 = &off_1E8659FD8;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl(v2, (const morphun::util::ULocale *)&off_1E8667A18, a1);
  *(_QWORD *)v2 = &off_1E866CA50;
  return v2;
}

void sub_1CB5BB8BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::IsCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  std::basic_string<char16_t> *v7;
  __int128 *v8;
  unint64_t i;
  std::basic_string<char16_t> *v10;
  void *v12[3];
  void *__p[2];
  char v14;
  std::basic_string<char16_t> v15[2];
  std::basic_string<char16_t> v16[2];
  std::basic_string<char16_t> v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E8655668;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(v15, v4, (char *)L"cardinal-masculine");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  v7 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v16, v6, "c");
  v8 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v7);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[16],0>(v17, v8, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v12, (unsigned __int16 *)v15, 3);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E8655E90, a1, (uint64_t)__p, v12);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v12[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFEELL; i -= 6)
  {
    v10 = &v15[i / 3];
    if (SHIBYTE(v17[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v10[5].__r_.__value_.__l.__data_);
    if (SHIBYTE(v10[4].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v10[4].__r_.__value_.__l.__data_);
  }
  if (v14 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E8656248;
  return v2;
}

void sub_1CB5BBA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a11);
  for (i = 96; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)(&a19 + i));
  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

char *morphun::dialog::constructor<morphun::dialog::language::ItCommonConceptFactory>(morphun::util::ULocale *a1)
{
  morphun::dialog::CommonConceptFactoryImpl *v2;
  uint64_t v3;
  uint64_t v4;
  void *__p[2];
  char v7;

  v2 = (morphun::dialog::CommonConceptFactoryImpl *)operator new();
  *(_QWORD *)v2 = &off_1E8659990;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl(v2, (const morphun::util::ULocale *)&off_1E8667958, a1);
  *(_QWORD *)v2 = &off_1E866C708;
  *((_QWORD *)v2 + 94) = 0;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, "i");
  v3 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>((uint64_t)v2 + 144, (unsigned __int16 *)__p);
  if ((morphun::dialog::CommonConceptFactoryImpl *)((char *)v2 + 152) == (morphun::dialog::CommonConceptFactoryImpl *)v3)
    v4 = 0;
  else
    v4 = *(_QWORD *)(v3 + 56);
  *((_QWORD *)v2 + 94) = v4;
  if (v7 < 0)
    operator delete(__p[0]);
  return (char *)v2 + *(_QWORD *)(*(_QWORD *)v2 - 144);
}

void sub_1CB5BBBAC(_Unwind_Exception *a1)
{
  void **v1;

  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(v1, (void **)&off_1E8667958);
  MEMORY[0x1D179D2EC](v1, 0x10F3C40EABB763BLL);
  _Unwind_Resume(a1);
}

morphun::dialog::CommonConceptFactoryImpl *morphun::dialog::constructor<morphun::dialog::language::JaCommonConceptFactory>(morphun::util::ULocale *a1)
{
  morphun::dialog::CommonConceptFactoryImpl *v2;

  v2 = (morphun::dialog::CommonConceptFactoryImpl *)operator new();
  *(_QWORD *)v2 = &off_1E8659BA8;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl(v2, (const morphun::util::ULocale *)&off_1E8667998, a1);
  *(_QWORD *)v2 = &off_1E866C820;
  return v2;
}

void sub_1CB5BBC4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

morphun::dialog::CommonConceptFactoryImpl *morphun::dialog::constructor<morphun::dialog::language::KkCommonConceptFactory>(morphun::util::ULocale *a1)
{
  morphun::dialog::CommonConceptFactoryImpl *v2;

  v2 = (morphun::dialog::CommonConceptFactoryImpl *)operator new();
  *(_QWORD *)v2 = &off_1E8655880;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl(v2, (const morphun::util::ULocale *)&off_1E8655ED0, a1);
  *(_QWORD *)v2 = &off_1E8656360;
  return v2;
}

void sub_1CB5BBCD4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

morphun::dialog::CommonConceptFactoryImpl *morphun::dialog::constructor<morphun::dialog::language::KoCommonConceptFactory>(morphun::util::ULocale *a1)
{
  morphun::dialog::CommonConceptFactoryImpl *v2;

  v2 = (morphun::dialog::CommonConceptFactoryImpl *)operator new();
  *(_QWORD *)v2 = &off_1E8659DC0;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl(v2, (const morphun::util::ULocale *)&off_1E86679D8, a1);
  *(_QWORD *)v2 = &off_1E866C938;
  return v2;
}

void sub_1CB5BBD5C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::LtCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  unint64_t i;
  std::basic_string<char16_t> *v8;
  void *v10[3];
  void *__p[2];
  char v12;
  std::basic_string<char16_t> v13[2];
  std::basic_string<char16_t> v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E8655A98;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(v13, v4, (char *)L"cardinal-masculine");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v14, v6, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v10, (unsigned __int16 *)v13, 2);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E8655F10, a1, (uint64_t)__p, v10);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v10[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFF4; i -= 6)
  {
    v8 = &v13[i / 3];
    if (SHIBYTE(v14[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v8[3].__r_.__value_.__l.__data_);
    if (SHIBYTE(v8[2].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v8[2].__r_.__value_.__l.__data_);
  }
  if (v12 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E8656478;
  return v2;
}

void sub_1CB5BBED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a11);
  for (i = 48; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)(&a19 + i));
  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::NbCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  std::basic_string<char16_t> *v7;
  __int128 *v8;
  unint64_t i;
  std::basic_string<char16_t> *v10;
  void *v12[3];
  void *__p[2];
  char v14;
  std::basic_string<char16_t> v15[2];
  std::basic_string<char16_t> v16[2];
  std::basic_string<char16_t> v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E865A1F0;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(v15, v4, (char *)L"cardinal-masculine");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  v7 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v16, v6, "c");
  v8 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v7);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[16],0>(v17, v8, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v12, (unsigned __int16 *)v15, 3);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E8667A58, a1, (uint64_t)__p, v12);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v12[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFEELL; i -= 6)
  {
    v10 = &v15[i / 3];
    if (SHIBYTE(v17[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v10[5].__r_.__value_.__l.__data_);
    if (SHIBYTE(v10[4].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v10[4].__r_.__value_.__l.__data_);
  }
  if (v14 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E866CB68;
  return v2;
}

void sub_1CB5BC0CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a11);
  for (i = 96; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)(&a19 + i));
  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

morphun::dialog::CommonConceptFactoryImpl *morphun::dialog::constructor<morphun::dialog::language::NlCommonConceptFactory>(morphun::util::ULocale *a1)
{
  morphun::dialog::CommonConceptFactoryImpl *v2;

  v2 = (morphun::dialog::CommonConceptFactoryImpl *)operator new();
  *(_QWORD *)v2 = &off_1E865A408;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl(v2, (const morphun::util::ULocale *)&off_1E8667A98, a1);
  *(_QWORD *)v2 = &off_1E866CC80;
  return v2;
}

void sub_1CB5BC1C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::PlCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  std::basic_string<char16_t> *v7;
  __int128 *v8;
  unint64_t i;
  std::basic_string<char16_t> *v10;
  void *v12[3];
  void *__p[2];
  char v14;
  std::basic_string<char16_t> v15[2];
  std::basic_string<char16_t> v16[2];
  std::basic_string<char16_t> v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E865A620;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(v15, v4, (char *)L"cardinal-masculine");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  v7 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v16, v6, "c");
  v8 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v7);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[16],0>(v17, v8, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v12, (unsigned __int16 *)v15, 3);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E8667AD8, a1, (uint64_t)__p, v12);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v12[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFEELL; i -= 6)
  {
    v10 = &v15[i / 3];
    if (SHIBYTE(v17[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v10[5].__r_.__value_.__l.__data_);
    if (SHIBYTE(v10[4].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v10[4].__r_.__value_.__l.__data_);
  }
  if (v14 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E866CD98;
  return v2;
}

void sub_1CB5BC360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a11);
  for (i = 96; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)(&a19 + i));
  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::PtCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  unint64_t i;
  std::basic_string<char16_t> *v8;
  void *v10[3];
  void *__p[2];
  char v12;
  std::basic_string<char16_t> v13[2];
  std::basic_string<char16_t> v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E865A838;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(v13, v4, (char *)L"cardinal-masculine");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v14, v6, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v10, (unsigned __int16 *)v13, 2);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E8667B18, a1, (uint64_t)__p, v10);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v10[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFF4; i -= 6)
  {
    v8 = &v13[i / 3];
    if (SHIBYTE(v14[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v8[3].__r_.__value_.__l.__data_);
    if (SHIBYTE(v8[2].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v8[2].__r_.__value_.__l.__data_);
  }
  if (v12 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E866CEB0;
  return v2;
}

void sub_1CB5BC540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a11);
  for (i = 48; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)(&a19 + i));
  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::RoCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  std::basic_string<char16_t> *v7;
  __int128 *v8;
  unint64_t i;
  std::basic_string<char16_t> *v10;
  void *v12[3];
  void *__p[2];
  char v14;
  std::basic_string<char16_t> v15[2];
  std::basic_string<char16_t> v16[2];
  std::basic_string<char16_t> v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E865AA50;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(v15, v4, (char *)L"cardinal-masculine");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  v7 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v16, v6, "c");
  v8 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v7);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[16],0>(v17, v8, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v12, (unsigned __int16 *)v15, 3);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E8667B58, a1, (uint64_t)__p, v12);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v12[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFEELL; i -= 6)
  {
    v10 = &v15[i / 3];
    if (SHIBYTE(v17[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v10[5].__r_.__value_.__l.__data_);
    if (SHIBYTE(v10[4].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v10[4].__r_.__value_.__l.__data_);
  }
  if (v14 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E866CFC8;
  return v2;
}

void sub_1CB5BC73C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a11);
  for (i = 96; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)(&a19 + i));
  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

char *morphun::dialog::constructor<morphun::dialog::language::RuCommonConceptFactory>(morphun::util::ULocale *a1)
{
  morphun::dialog::CommonConceptFactoryImpl *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *__p[2];
  char v12;

  v2 = (morphun::dialog::CommonConceptFactoryImpl *)operator new();
  *(_QWORD *)v2 = &off_1E865AC68;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl(v2, (const morphun::util::ULocale *)&off_1E8667B98, a1);
  *(_QWORD *)v2 = &off_1E866D0E0;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, "c");
  v3 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>((uint64_t)v2 + 144, (unsigned __int16 *)__p);
  v4 = (_QWORD *)((char *)v2 + 152);
  if ((morphun::dialog::CommonConceptFactoryImpl *)((char *)v2 + 152) == (morphun::dialog::CommonConceptFactoryImpl *)v3)
    v5 = 0;
  else
    v5 = *(_QWORD *)(v3 + 56);
  npc<morphun::dialog::SemanticFeature const>(v5);
  if (v12 < 0)
    operator delete(__p[0]);
  *((_QWORD *)v2 + 94) = v5;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v6 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>((uint64_t)v2 + 144, (unsigned __int16 *)__p);
  if (v4 == (_QWORD *)v6)
    v7 = 0;
  else
    v7 = *(_QWORD *)(v6 + 56);
  npc<morphun::dialog::SemanticFeature const>(v7);
  if (v12 < 0)
    operator delete(__p[0]);
  *((_QWORD *)v2 + 95) = v7;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"animacy");
  v8 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>((uint64_t)v2 + 144, (unsigned __int16 *)__p);
  if (v4 == (_QWORD *)v8)
    v9 = 0;
  else
    v9 = *(_QWORD *)(v8 + 56);
  npc<morphun::dialog::SemanticFeature const>(v9);
  if (v12 < 0)
    operator delete(__p[0]);
  *((_QWORD *)v2 + 96) = v9;
  return (char *)v2 + *(_QWORD *)(*(_QWORD *)v2 - 144);
}

void sub_1CB5BC934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void **v15;

  if (a15 < 0)
    operator delete(__p);
  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(v15, (void **)&off_1E8667B98);
  MEMORY[0x1D179D2EC](v15, 0x10F3C40E3187E5ELL);
  _Unwind_Resume(a1);
}

void sub_1CB5BC990()
{
  JUMPOUT(0x1CB5BC970);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::SkCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  std::basic_string<char16_t> *v7;
  __int128 *v8;
  unint64_t i;
  std::basic_string<char16_t> *v10;
  void *v12[3];
  void *__p[2];
  char v14;
  std::basic_string<char16_t> v15[2];
  std::basic_string<char16_t> v16[2];
  std::basic_string<char16_t> v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E865AE80;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(v15, v4, (char *)L"cardinal-masculine");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  v7 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v16, v6, "c");
  v8 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v7);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[16],0>(v17, v8, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v12, (unsigned __int16 *)v15, 3);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E8667BD8, a1, (uint64_t)__p, v12);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v12[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFEELL; i -= 6)
  {
    v10 = &v15[i / 3];
    if (SHIBYTE(v17[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v10[5].__r_.__value_.__l.__data_);
    if (SHIBYTE(v10[4].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v10[4].__r_.__value_.__l.__data_);
  }
  if (v14 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E866D1F8;
  return v2;
}

void sub_1CB5BCB14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a11);
  for (i = 96; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)(&a19 + i));
  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::SvCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  uint64_t v4;
  __int128 v5;
  morphun::grammar::synthesis::GrammemeConstants *v6;
  __int128 *v7;
  uint64_t i;
  void **v9;
  void *v11[3];
  void *__p[2];
  char v13;
  std::basic_string<char16_t> v14;
  _QWORD v15[3];
  std::basic_string<char16_t> v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E865B098;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = morphun::grammar::synthesis::GrammemeConstants::GENDER_COMMON(v3);
  if (*(char *)(v4 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v14, *(const std::basic_string<char16_t>::value_type **)v4, *(_QWORD *)(v4 + 8));
  }
  else
  {
    v5 = *(_OWORD *)v4;
    v14.__r_.__value_.__r.__words[2] = *(_QWORD *)(v4 + 16);
    *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v5;
  }
  v6 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v15, "c");
  v7 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER(v6);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[16],0>(v16, v7, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v11, (unsigned __int16 *)&v14, 2);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E8667C18, a1, (uint64_t)__p, v11);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v11[1]);
  for (i = 0; i != -12; i -= 6)
  {
    v9 = (void **)((char *)&v14.__r_.__value_.__l.__data_ + i * 8);
    if (SHIBYTE(v16[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v9[9]);
    if (*((char *)v9 + 71) < 0)
      operator delete(v9[6]);
  }
  if (v13 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E866D310;
  return v2;
}

void sub_1CB5BCD1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a10);
  for (i = 48; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)&a18 + i);
  if (a17 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v23, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

morphun::dialog::CommonConceptFactoryImpl *morphun::dialog::constructor<morphun::dialog::language::ThCommonConceptFactory>(morphun::util::ULocale *a1)
{
  morphun::dialog::CommonConceptFactoryImpl *v2;

  v2 = (morphun::dialog::CommonConceptFactoryImpl *)operator new();
  *(_QWORD *)v2 = &off_1E865B2B0;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl(v2, (const morphun::util::ULocale *)&off_1E8667C58, a1);
  *(_QWORD *)v2 = &off_1E866D428;
  return v2;
}

void sub_1CB5BCE18(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

morphun::dialog::CommonConceptFactoryImpl *morphun::dialog::constructor<morphun::dialog::language::TrCommonConceptFactory>(morphun::util::ULocale *a1)
{
  morphun::dialog::CommonConceptFactoryImpl *v2;

  v2 = (morphun::dialog::CommonConceptFactoryImpl *)operator new();
  *(_QWORD *)v2 = &off_1E865B4C8;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl(v2, (const morphun::util::ULocale *)&off_1E8667C98, a1);
  *(_QWORD *)v2 = &off_1E866D540;
  return v2;
}

void sub_1CB5BCEA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

_QWORD *morphun::dialog::constructor<morphun::dialog::language::UkCommonConceptFactory>(morphun::util::ULocale *a1)
{
  _QWORD *v2;
  morphun::grammar::synthesis::GrammemeConstants *v3;
  __int128 *v4;
  std::basic_string<char16_t> *v5;
  __int128 *v6;
  std::basic_string<char16_t> *v7;
  __int128 *v8;
  unint64_t i;
  std::basic_string<char16_t> *v10;
  void *v12[3];
  void *__p[2];
  char v14;
  std::basic_string<char16_t> v15[2];
  std::basic_string<char16_t> v16[2];
  std::basic_string<char16_t> v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)operator new();
  *v2 = &off_1E865B6E0;
  v3 = (morphun::grammar::synthesis::GrammemeConstants *)std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"gender");
  v4 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v3);
  v5 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[19],0>(v15, v4, (char *)L"cardinal-masculine");
  v6 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  v7 = std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[18],0>(v16, v6, "c");
  v8 = (__int128 *)morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v7);
  std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::pair[abi:ne180100]<std::basic_string<char16_t> const&,char16_t const(&)[16],0>(v17, v8, "c");
  std::map<std::basic_string<char16_t>,std::basic_string<char16_t>>::map[abi:ne180100]((uint64_t)v12, (unsigned __int16 *)v15, 3);
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl((uint64_t)v2, (uint64_t *)&off_1E8667CD8, a1, (uint64_t)__p, v12);
  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy((_QWORD *)v12[1]);
  for (i = 0; i != 0x1FFFFFFFFFFFFFEELL; i -= 6)
  {
    v10 = &v15[i / 3];
    if (SHIBYTE(v17[1].__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(v10[5].__r_.__value_.__l.__data_);
    if (SHIBYTE(v10[4].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v10[4].__r_.__value_.__l.__data_);
  }
  if (v14 < 0)
    operator delete(__p[0]);
  *v2 = &off_1E866D658;
  return v2;
}

void sub_1CB5BD040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t i;

  std::__tree<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::destroy(a11);
  for (i = 96; i != -48; i -= 48)
    std::pair<std::basic_string<char16_t> const,std::basic_string<char16_t>>::~pair((uint64_t)(&a19 + i));
  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

morphun::dialog::CommonConceptFactoryImpl *morphun::dialog::constructor<morphun::dialog::language::ViCommonConceptFactory>(morphun::util::ULocale *a1)
{
  morphun::dialog::CommonConceptFactoryImpl *v2;

  v2 = (morphun::dialog::CommonConceptFactoryImpl *)operator new();
  *(_QWORD *)v2 = &off_1E865B8F8;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl(v2, (const morphun::util::ULocale *)&off_1E8667D18, a1);
  *(_QWORD *)v2 = &off_1E866D770;
  return v2;
}

void sub_1CB5BD134(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

morphun::dialog::CommonConceptFactoryImpl *morphun::dialog::constructor<morphun::dialog::language::YueCommonConceptFactory>(morphun::util::ULocale *a1)
{
  morphun::dialog::CommonConceptFactoryImpl *v2;

  v2 = (morphun::dialog::CommonConceptFactoryImpl *)operator new();
  *(_QWORD *)v2 = &off_1E865BD28;
  morphun::dialog::CommonConceptFactoryImpl::CommonConceptFactoryImpl(v2, (const morphun::util::ULocale *)&off_1E8667D98, a1);
  *(_QWORD *)v2 = &off_1E866D9A0;
  return v2;
}

void sub_1CB5BD1BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C4083EFF29ELL);
  _Unwind_Resume(a1);
}

void morphun::dialog::LocalizedCommonConceptFactoryProvider::~LocalizedCommonConceptFactoryProvider(morphun::dialog::LocalizedCommonConceptFactoryProvider *this, uint64_t *a2)
{
  uint64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  BOOL v9;

  v3 = *a2;
  *(_QWORD *)this = *a2;
  *(_QWORD *)((char *)this + *(_QWORD *)(v3 - 56)) = a2[1];
  v4 = (char *)*((_QWORD *)this + 1);
  *(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 40)) = a2[2];
  v5 = (char *)this + 16;
  if (v4 != (char *)this + 16)
  {
    do
    {
      v6 = *((_QWORD *)v4 + 20);
      if (v6)
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
      v7 = (char *)*((_QWORD *)v4 + 1);
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = *(char **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (char *)*((_QWORD *)v4 + 2);
          v9 = *(_QWORD *)v8 == (_QWORD)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
    }
    while (v8 != v5);
  }
  std::mutex::~mutex((std::mutex *)((char *)this + 32));
  std::__tree<std::__value_type<morphun::util::ULocale,morphun::analysis::ConfigurableAnalyzer *>,std::__map_value_compare<morphun::util::ULocale,std::__value_type<morphun::util::ULocale,morphun::analysis::ConfigurableAnalyzer *>,std::less<morphun::util::ULocale>,true>,std::allocator<std::__value_type<morphun::util::ULocale,morphun::analysis::ConfigurableAnalyzer *>>>::destroy(*((void ***)this + 2));
}

double morphun::dialog::LocalizedCommonConceptFactoryProvider::LocalizedCommonConceptFactoryProvider(morphun::dialog::LocalizedCommonConceptFactoryProvider *this, uint64_t *a2)
{
  uint64_t v2;
  double result;

  v2 = *a2;
  *(_QWORD *)this = *a2;
  *(_QWORD *)((char *)this + *(_QWORD *)(v2 - 56)) = a2[1];
  *(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 40)) = a2[2];
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = (char *)this + 16;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 850045863;
  result = 0.0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((_QWORD *)this + 11) = 0;
  return result;
}

double morphun::dialog::LocalizedCommonConceptFactoryProvider::LocalizedCommonConceptFactoryProvider(morphun::dialog::LocalizedCommonConceptFactoryProvider *this)
{
  double result;

  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = &off_1E866B708;
  *((_QWORD *)this + 1) = (char *)this + 16;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 850045863;
  result = 0.0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((_QWORD *)this + 11) = 0;
  return result;
}

void `virtual thunk to'morphun::dialog::LocalizedCommonConceptFactoryProvider::~LocalizedCommonConceptFactoryProvider(morphun::dialog::LocalizedCommonConceptFactoryProvider *this)
{
}

{
  JUMPOUT(0x1D179D2ECLL);
}

uint64_t `virtual thunk to'morphun::dialog::LocalizedCommonConceptFactoryProvider::getCommonConceptFactory(morphun::dialog::LocalizedCommonConceptFactoryProvider *this, const morphun::util::ULocale *a2)
{
  return morphun::dialog::LocalizedCommonConceptFactoryProvider::getCommonConceptFactory((morphun::dialog::LocalizedCommonConceptFactoryProvider *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 48)), a2);
}

uint64_t morphun::dialog::LocalizedCommonConceptFactoryProvider::getDefaultCommonConceptFactoryProvider(morphun::dialog::LocalizedCommonConceptFactoryProvider *this)
{
  unsigned __int8 v1;
  uint64_t v3;

  if ((v1 & 1) == 0
  {
    v3 = operator new();
    *(_QWORD *)(v3 + 16) = 0;
    *(_QWORD *)v3 = &off_1E866B708;
    *(_QWORD *)(v3 + 8) = v3 + 16;
    *(_QWORD *)(v3 + 24) = 0;
    *(_QWORD *)(v3 + 32) = 850045863;
    *(_OWORD *)(v3 + 40) = 0u;
    *(_OWORD *)(v3 + 56) = 0u;
    *(_OWORD *)(v3 + 72) = 0u;
    *(_QWORD *)(v3 + 88) = 0;
    morphun::dialog::LocalizedCommonConceptFactoryProvider::getDefaultCommonConceptFactoryProvider(void)::DEFAULT_LOCALIZED_COMMON_CONCEPT_FACTORY_PROVIDER = v3;
  }
  return morphun::dialog::LocalizedCommonConceptFactoryProvider::getDefaultCommonConceptFactoryProvider(void)::DEFAULT_LOCALIZED_COMMON_CONCEPT_FACTORY_PROVIDER;
}

void sub_1CB5BD420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void morphun::grammar::synthesis::HuGrammarSynthesizer::addSemanticFeatures(morphun::grammar::synthesis::HuGrammarSynthesizer *this, morphun::dialog::SemanticFeatureModel *a2)
{
  morphun::util::LocaleUtils *v3;
  morphun::grammar::synthesis::GrammemeConstants *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t i;
  std::basic_string<char16_t> *v10;
  std::basic_string<char16_t> *v11;
  std::basic_string<char16_t> *v12;
  void *__p[2];
  char v14;
  std::basic_string<char16_t> **v15;
  char v16;
  std::basic_string<char16_t> v17;
  std::basic_string<char16_t> v18;
  __int128 v19;

  *((_QWORD *)&v19 + 1) = *MEMORY[0x1E0C80C00];
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"count");
  v3 = (morphun::util::LocaleUtils *)operator new();
  v4 = (morphun::grammar::synthesis::GrammemeConstants *)morphun::util::LocaleUtils::HUNGARIAN(v3);
  v5 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_SINGULAR(v4);
  if (*(char *)(v5 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v17, *(const std::basic_string<char16_t>::value_type **)v5, *(_QWORD *)(v5 + 8));
  }
  else
  {
    v6 = *(_OWORD *)v5;
    v17.__r_.__value_.__r.__words[2] = *(_QWORD *)(v5 + 16);
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v6;
  }
  v7 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL((morphun::grammar::synthesis::GrammemeConstants *)v5);
  if (*(char *)(v7 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v18, *(const std::basic_string<char16_t>::value_type **)v7, *(_QWORD *)(v7 + 8));
  }
  else
  {
    v8 = *(_OWORD *)v7;
    v18.__r_.__value_.__r.__words[2] = *(_QWORD *)(v7 + 16);
    *(_OWORD *)&v18.__r_.__value_.__l.__data_ = v8;
  }
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v15 = &v10;
  v16 = 0;
  v10 = (std::basic_string<char16_t> *)operator new(0x30uLL);
  v11 = v10;
  v12 = v10 + 2;
  v11 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v12, (__int128 *)&v17, &v19, v10);
  morphun::dialog::DictionaryLookupFunction::DictionaryLookupFunction((uint64_t)v3, v4, (uint64_t *)&v10);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)this, (unsigned __int16 *)__p, (morphun::util::LocaleUtils *)((char *)v3 + *(_QWORD *)(*(_QWORD *)v3 - 56)));
  v15 = &v10;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
  for (i = 0; i != -6; i -= 3)
  {
    if (SHIBYTE(v18.__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(*(void **)((char *)&v17 + i * 8 + 24));
  }
  if (v14 < 0)
    operator delete(__p[0]);
}

void sub_1CB5BD5F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  uint64_t v31;
  uint64_t v33;

  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a18);
  v33 = 0;
  while (1)
  {
    if (*(&a31 + v33) < 0)
      operator delete(*(void **)((char *)&a26 + v33));
    v33 -= 24;
    if (v33 == -48)
    {
      MEMORY[0x1D179D2EC](v31, 0x10F3C40BE507067);
      if (a17 < 0)
        operator delete(__p);
      _Unwind_Resume(a1);
    }
  }
}

uint64_t **com::apple::siri::tokenizer::data::config_cs::getContent@<X0>(uint64_t **a1@<X8>)
{
  __int128 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = xmmword_1E8686A40;
  v4 = 0x1CB73E8CALL;
  return std::map<std::u16string_view,char16_t const*>::map[abi:ne180100](a1, (unsigned __int16 **)&v3, 1);
}

uint64_t **com::apple::siri::tokenizer::data::config_nb::getContent@<X0>(uint64_t **a1@<X8>)
{
  _OWORD v3[3];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = xmmword_1E8686A58;
  v3[1] = unk_1E8686A68;
  v3[2] = xmmword_1E8686A78;
  return std::map<std::u16string_view,char16_t const*>::map[abi:ne180100](a1, (unsigned __int16 **)v3, 2);
}

morphun::analysis::util::AttributeSource *morphun::analysis::TokenStream::TokenStream(morphun::analysis::TokenStream *this, uint64_t *a2)
{
  morphun::analysis::util::AttributeSource *result;
  uint64_t v5;

  morphun::analysis::TokenStream::DEFAULT_TOKEN_ATTRIBUTE_FACTORY(this);
  result = morphun::analysis::util::AttributeSource::AttributeSource(this, (const morphun::analysis::util::AttributeFactory *)(a2 + 1), morphun::analysis::TokenStream::DEFAULT_TOKEN_ATTRIBUTE_FACTORY(void)::DEFAULT_TOKEN_ATTRIBUTE_FACTORY_);
  v5 = *a2;
  *(_QWORD *)this = *a2;
  *(_QWORD *)((char *)this + *(_QWORD *)(v5 - 40)) = a2[3];
  return result;
}

uint64_t *morphun::analysis::TokenStream::DEFAULT_TOKEN_ATTRIBUTE_FACTORY(morphun::analysis::TokenStream *this)
{
  unsigned __int8 v1;
  morphun::analysis::util::AttributeFactory *v3;
  uint64_t v4;
  uint64_t StaticImplementation;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _BYTE v9[40];
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[3];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if ((v1 & 1) == 0)
  {
    if ((_DWORD)v3)
    {
      v4 = morphun::analysis::util::AttributeFactory::DEFAULT_ATTRIBUTE_FACTORY(v3);
      v11[0] = &off_1E86739D0;
      v11[1] = morphun::analysis::tokenattributes::PackedTokenAttributeImpl::create;
      v11[3] = v11;
      v12[0] = &off_1E8673920;
      v12[1] = morphun::analysis::tokenattributes::KeywordAttributeImpl::create;
      v12[3] = v12;
      v13[0] = &off_1E86739D0;
      v13[1] = morphun::analysis::tokenattributes::PackedTokenAttributeImpl::create;
      v13[3] = v13;
      v14[0] = &off_1E86739D0;
      v14[1] = morphun::analysis::tokenattributes::PackedTokenAttributeImpl::create;
      v15[0] = v14;
      std::unordered_map<std::type_index,std::function<morphun::analysis::util::AttributeImpl * ()(void)>>::unordered_map((uint64_t)v9, (uint64_t *)&v10, 4);
      StaticImplementation = morphun::analysis::util::AttributeFactory::getStaticImplementation(v4, (uint64_t)v9);
      std::__hash_table<std::__hash_value_type<std::type_index,std::function<morphun::analysis::util::AttributeImpl * ()(void)>>,std::__unordered_map_hasher<std::type_index,std::__hash_value_type<std::type_index,std::function<morphun::analysis::util::AttributeImpl * ()(void)>>,std::hash<std::type_index>,std::equal_to<std::type_index>,true>,std::__unordered_map_equal<std::type_index,std::__hash_value_type<std::type_index,std::function<morphun::analysis::util::AttributeImpl * ()(void)>>,std::equal_to<std::type_index>,std::hash<std::type_index>,true>,std::allocator<std::__hash_value_type<std::type_index,std::function<morphun::analysis::util::AttributeImpl * ()(void)>>>>::~__hash_table((uint64_t)v9);
      v6 = 0;
      while (1)
      {
        v7 = (_QWORD *)v15[v6];
        if (&v14[v6] == v7)
          break;
        if (v7)
        {
          v8 = 5;
LABEL_9:
          (*(void (**)(void))(*v7 + 8 * v8))();
        }
        v6 -= 5;
        if (v6 == -20)
        {
          morphun::analysis::TokenStream::DEFAULT_TOKEN_ATTRIBUTE_FACTORY(void)::DEFAULT_TOKEN_ATTRIBUTE_FACTORY_ = StaticImplementation;
          return &morphun::analysis::TokenStream::DEFAULT_TOKEN_ATTRIBUTE_FACTORY(void)::DEFAULT_TOKEN_ATTRIBUTE_FACTORY_;
        }
      }
      v7 = &v14[v6];
      v8 = 4;
      goto LABEL_9;
    }
  }
  return &morphun::analysis::TokenStream::DEFAULT_TOKEN_ATTRIBUTE_FACTORY(void)::DEFAULT_TOKEN_ATTRIBUTE_FACTORY_;
}

void sub_1CB5BD974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  uint64_t v15;
  char *v16;
  uint64_t v17;

  std::__hash_table<std::__hash_value_type<std::type_index,std::function<morphun::analysis::util::AttributeImpl * ()(void)>>,std::__unordered_map_hasher<std::type_index,std::__hash_value_type<std::type_index,std::function<morphun::analysis::util::AttributeImpl * ()(void)>>,std::hash<std::type_index>,std::equal_to<std::type_index>,true>,std::__unordered_map_equal<std::type_index,std::__hash_value_type<std::type_index,std::function<morphun::analysis::util::AttributeImpl * ()(void)>>,std::equal_to<std::type_index>,std::hash<std::type_index>,true>,std::allocator<std::__hash_value_type<std::type_index,std::function<morphun::analysis::util::AttributeImpl * ()(void)>>>>::~__hash_table((uint64_t)&a9);
  v15 = 0;
  while (1)
  {
    v16 = *(char **)(&a14 + v15 + 152);
    if (&a14 + v15 + 128 == v16)
      break;
    if (v16)
    {
      v17 = 5;
LABEL_6:
      (*(void (**)(void))(*(_QWORD *)v16 + 8 * v17))();
    }
    v15 -= 40;
    if (v15 == -160)
    {
      _Unwind_Resume(a1);
    }
  }
  v16 = &a14 + v15 + 128;
  v17 = 4;
  goto LABEL_6;
}

uint64_t std::unordered_map<std::type_index,std::function<morphun::analysis::util::AttributeImpl * ()(void)>>::unordered_map(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  unint64_t v17;
  _QWORD *v18;
  float v19;
  float v20;
  _BOOL8 v21;
  unint64_t v22;
  unint64_t v23;
  size_t v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  _QWORD *v29;
  uint64_t *v30;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = a2;
    v29 = (_QWORD *)(a1 + 16);
    v30 = &a2[5 * a3];
    do
    {
      v6 = *v5;
      v7 = *(_QWORD *)(*v5 + 8);
      v8 = v7;
      if (v7 < 0)
      {
        v9 = (unsigned __int8 *)(v7 & 0x7FFFFFFFFFFFFFFFLL);
        v10 = 5381;
        do
        {
          v8 = v10;
          v11 = *v9++;
          v10 = (33 * v10) ^ v11;
        }
        while (v11);
      }
      v12 = *(_QWORD *)(a1 + 8);
      if (v12)
      {
        v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
        v13.i16[0] = vaddlv_u8(v13);
        v14 = v13.u32[0];
        if (v13.u32[0] > 1uLL)
        {
          v3 = v8;
          if (v8 >= v12)
            v3 = v8 % v12;
        }
        else
        {
          v3 = (v12 - 1) & v8;
        }
        v15 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
        if (v15)
        {
          v16 = (_QWORD *)*v15;
          if (*v15)
          {
            do
            {
              v17 = v16[1];
              if (v17 == v8)
              {
                if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(v16[2] + 8), v7))
                  goto LABEL_44;
              }
              else
              {
                if (v14 > 1)
                {
                  if (v17 >= v12)
                    v17 %= v12;
                }
                else
                {
                  v17 &= v12 - 1;
                }
                if (v17 != v3)
                  break;
              }
              v16 = (_QWORD *)*v16;
            }
            while (v16);
          }
        }
      }
      v18 = operator new(0x38uLL);
      *v18 = 0;
      v18[1] = v8;
      v18[2] = v6;
      std::__function::__value_func<morphun::analysis::util::AttributeImpl * ()(void)>::__value_func[abi:ne180100]((uint64_t)(v18 + 3), (uint64_t)(v5 + 1));
      v19 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
      v20 = *(float *)(a1 + 32);
      if (!v12 || (float)(v20 * (float)v12) < v19)
      {
        v21 = (v12 & (v12 - 1)) != 0;
        if (v12 < 3)
          v21 = 1;
        v22 = v21 | (2 * v12);
        v23 = vcvtps_u32_f32(v19 / v20);
        if (v22 <= v23)
          v24 = v23;
        else
          v24 = v22;
        std::__hash_table<std::__hash_value_type<std::type_index,morphun::analysis::util::AttributeImpl *>,std::__unordered_map_hasher<std::type_index,std::__hash_value_type<std::type_index,morphun::analysis::util::AttributeImpl *>,std::hash<std::type_index>,std::equal_to<std::type_index>,true>,std::__unordered_map_equal<std::type_index,std::__hash_value_type<std::type_index,morphun::analysis::util::AttributeImpl *>,std::equal_to<std::type_index>,std::hash<std::type_index>,true>,std::allocator<std::__hash_value_type<std::type_index,morphun::analysis::util::AttributeImpl *>>>::__rehash<true>(a1, v24);
        v12 = *(_QWORD *)(a1 + 8);
        if ((v12 & (v12 - 1)) != 0)
        {
          if (v8 >= v12)
            v3 = v8 % v12;
          else
            v3 = v8;
        }
        else
        {
          v3 = (v12 - 1) & v8;
        }
      }
      v25 = *(_QWORD *)a1;
      v26 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
      if (v26)
      {
        *v18 = *v26;
      }
      else
      {
        *v18 = *v29;
        *v29 = v18;
        *(_QWORD *)(v25 + 8 * v3) = v29;
        if (!*v18)
          goto LABEL_43;
        v27 = *(_QWORD *)(*v18 + 8);
        if ((v12 & (v12 - 1)) != 0)
        {
          if (v27 >= v12)
            v27 %= v12;
        }
        else
        {
          v27 &= v12 - 1;
        }
        v26 = (_QWORD *)(*(_QWORD *)a1 + 8 * v27);
      }
      *v26 = v18;
LABEL_43:
      ++*(_QWORD *)(a1 + 24);
LABEL_44:
      v5 += 5;
    }
    while (v5 != v30);
  }
  return a1;
}

void sub_1CB5BDC60(_Unwind_Exception *a1)
{
  uint64_t v1;
  _QWORD *v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::type_index,std::function<morphun::analysis::util::AttributeImpl * ()(void)>>,void *>>>::operator()[abi:ne180100](1, v2);
  std::__hash_table<std::__hash_value_type<std::type_index,std::function<morphun::analysis::util::AttributeImpl * ()(void)>>,std::__unordered_map_hasher<std::type_index,std::__hash_value_type<std::type_index,std::function<morphun::analysis::util::AttributeImpl * ()(void)>>,std::hash<std::type_index>,std::equal_to<std::type_index>,true>,std::__unordered_map_equal<std::type_index,std::__hash_value_type<std::type_index,std::function<morphun::analysis::util::AttributeImpl * ()(void)>>,std::equal_to<std::type_index>,std::hash<std::type_index>,true>,std::allocator<std::__hash_value_type<std::type_index,std::function<morphun::analysis::util::AttributeImpl * ()(void)>>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

morphun::analysis::util::AttributeSource *morphun::analysis::TokenStream::TokenStream(morphun::analysis::TokenStream *this, morphun::analysis::util::AttributeSource *a2, uint64_t a3)
{
  morphun::analysis::util::AttributeSource *result;
  uint64_t v5;

  result = morphun::analysis::util::AttributeSource::AttributeSource(this, (morphun::analysis::util::AttributeSource *)((char *)a2 + 8), a3);
  v5 = *(_QWORD *)a2;
  *(_QWORD *)result = *(_QWORD *)a2;
  *(_QWORD *)((char *)result + *(_QWORD *)(v5 - 40)) = *((_QWORD *)a2 + 3);
  return result;
}

morphun::analysis::util::AttributeSource *morphun::analysis::TokenStream::TokenStream(morphun::analysis::TokenStream *this, morphun::analysis::util::AttributeFactory *a2, uint64_t a3)
{
  morphun::analysis::util::AttributeSource *result;
  uint64_t v5;

  result = morphun::analysis::util::AttributeSource::AttributeSource(this, (morphun::analysis::util::AttributeFactory *)((char *)a2 + 8), a3);
  v5 = *(_QWORD *)a2;
  *(_QWORD *)result = *(_QWORD *)a2;
  *(_QWORD *)((char *)result + *(_QWORD *)(v5 - 40)) = *((_QWORD *)a2 + 3);
  return result;
}

void morphun::analysis::TokenStream::~TokenStream(morphun::analysis::TokenStream *this, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)this = v3;
  *(_QWORD *)((char *)this + *(_QWORD *)(v3 - 40)) = *(_QWORD *)(a2 + 16);
  std::__tree<std::shared_ptr<morphun::analysis::util::AttributeImpl>>::destroy(*((_QWORD **)this + 7));
  std::__hash_table<std::__hash_value_type<std::u16string_view,std::map<std::u16string_view,char16_t const*> (*)(void)>,std::__unordered_map_hasher<std::u16string_view,std::__hash_value_type<std::u16string_view,std::map<std::u16string_view,char16_t const*> (*)(void)>,std::hash<std::u16string_view>,std::equal_to<std::u16string_view>,true>,std::__unordered_map_equal<std::u16string_view,std::__hash_value_type<std::u16string_view,std::map<std::u16string_view,char16_t const*> (*)(void)>,std::equal_to<std::u16string_view>,std::hash<std::u16string_view>,true>,std::allocator<std::__hash_value_type<std::u16string_view,std::map<std::u16string_view,char16_t const*> (*)(void)>>>::~__hash_table((uint64_t)this + 8);
}

morphun::dictionary::metadata::StringContainer *morphun::dictionary::metadata::StringContainer::StringContainer(morphun::dictionary::metadata::StringContainer *this, morphun::util::MemoryMappedFile *a2)
{
  unsigned int v4;
  char *EncodingName;
  int v6;
  void *v8;
  int v9;

  LOBYTE(v8) = 0;
  morphun::util::MemoryMappedFile::read<signed char>(a2, &v8);
  v4 = (char)v8;
  *(_BYTE *)this = (_BYTE)v8;
  *((_QWORD *)this + 1) = 0;
  EncodingName = morphun::dictionary::metadata::MarisaTrie<signed char>::getEncodingName(v4);
  morphun::dictionary::metadata::CharsetConverter::CharsetConverter((morphun::dictionary::metadata::StringContainer *)((char *)this + 16), EncodingName);
  *((_DWORD *)this + 8) = 0;
  morphun::util::MemoryMappedFile::read<signed char>(a2, &v8);
  morphun::util::MemoryMappedFile::read<signed char>(a2, &v8);
  morphun::util::MemoryMappedFile::read<signed char>(a2, &v8);
  v9 = 0;
  morphun::util::MemoryMappedFile::read<int>(a2, &v9);
  v6 = v9;
  if (v9 >= 1)
  {
    v8 = 0;
    morphun::util::MemoryMappedFile::read<char *>(a2, &v8, v9);
    marisa::Trie::map((marisa::grimoire::trie::LoudsTrie **)this + 1, v8, v6);
    *((_DWORD *)this + 8) = marisa::Trie::num_keys(*((marisa::Trie **)this + 1));
  }
  return this;
}

void sub_1CB5BDE34(_Unwind_Exception *a1)
{
  marisa::grimoire::trie::LoudsTrie **v1;
  morphun::dictionary::metadata::CharsetConverter *v2;

  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(v1);
  _Unwind_Resume(a1);
}

char *morphun::dictionary::metadata::MarisaTrie<signed char>::getEncodingName(unsigned int a1)
{
  _QWORD *exception;
  std::basic_string<char16_t>::size_type v4;
  std::basic_string<char16_t> v5;
  __int128 v6;

  if (a1 >= 3)
  {
    exception = __cxa_allocate_exception(0x38uLL);
    morphun::util::StringUtils::to_u16string((morphun::util::StringUtils *)(int)a1, &v5);
    std::operator+[abi:ne180100]<char16_t,std::char_traits<char16_t>,std::allocator<char16_t>>((uint64_t)&v6, "U", &v5, v4);
    morphun::exception::Throwable::Throwable((uint64_t)exception, &v6);
    *exception = &off_1E86730F0;
  }
  return (&off_1E8686A88)[a1];
}

void sub_1CB5BDF10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  void *v20;
  int v21;

  if (a20 < 0)
    operator delete(__p);
  if (a14 < 0)
  {
    operator delete(a9);
    if ((v21 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v21)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v20);
  goto LABEL_8;
}

uint64_t morphun::dictionary::metadata::StringContainer::StringContainer(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  BOOL v17;
  unint64_t v18;
  int v20;
  unsigned int v22;
  char *EncodingName;
  _QWORD *v24;
  float v25;
  std::string *v26;
  size_t size;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  unint64_t v31;
  int v32;
  uint64_t **v33;
  uint64_t **v34;
  _OWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *exception;
  _QWORD *v40;
  __int128 __dst;
  std::string v43;
  void *__p[2];
  _OWORD v45[2];
  _OWORD v46[3];
  uint64_t v47;

  morphun::dictionary::metadata::CharsetConverter::CharsetConverter((morphun::dictionary::metadata::CharsetConverter *)&v43, "BOCU1");
  __p[0] = 0;
  __p[1] = 0;
  *(_QWORD *)&v45[0] = 0;
  v5 = a2 + 1;
  v6 = (_QWORD *)*a2;
  if ((_QWORD *)*a2 == a2 + 1)
  {
    v7 = 0;
    v8 = 0;
    v18 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = v6[5];
      morphun::dictionary::metadata::CharsetConverter::encode((uint64_t)&v43, (std::string *)__p, v6[4], v10);
      v11 = (void *)BYTE7(v45[0]);
      v12 = __p[1];
      morphun::util::StringViewUtils::convert((std::string *)__p, v6[4], v6[5]);
      if ((char)v11 >= 0)
        v13 = v11;
      else
        v13 = v12;
      v14 = BYTE7(v45[0]);
      if (SBYTE7(v45[0]) < 0)
        v14 = (unint64_t)__p[1];
      v15 = (_QWORD *)v6[1];
      if (v15)
      {
        do
        {
          v16 = v15;
          v15 = (_QWORD *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          v16 = (_QWORD *)v6[2];
          v17 = *v16 == (_QWORD)v6;
          v6 = v16;
        }
        while (!v17);
      }
      v9 += v10;
      v7 += (unint64_t)v13;
      v8 += v14;
      v6 = v16;
    }
    while (v16 != v5);
    v18 = 2 * v9;
    if (SBYTE7(v45[0]) < 0)
      operator delete(__p[0]);
  }
  if (v18 >= v7 || v18 >= v8)
    v20 = 1;
  else
    v20 = 2;
  if (v7 >= v18 || v7 >= v8)
    v22 = v20;
  else
    v22 = 0;
  *(_BYTE *)a1 = v22;
  *(_QWORD *)(a1 + 8) = 0;
  EncodingName = morphun::dictionary::metadata::MarisaTrie<signed char>::getEncodingName(v22);
  morphun::dictionary::metadata::CharsetConverter::CharsetConverter((morphun::dictionary::metadata::CharsetConverter *)(a1 + 16), EncodingName);
  *(_DWORD *)(a1 + 32) = a2[2];
  npc<std::map<std::u16string_view,int>>(a3);
  if (*(_QWORD *)(a3 + 16))
  {
    exception = __cxa_allocate_exception(0x38uLL);
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, "T");
    morphun::exception::Throwable::Throwable((uint64_t)exception, (__int128 *)__p);
    *exception = &off_1E8673120;
  }
  v47 = 0;
  memset(v46, 0, sizeof(v46));
  *(_OWORD *)__p = 0u;
  memset(v45, 0, sizeof(v45));
  memset(&v43, 0, sizeof(v43));
  v24 = (_QWORD *)*a2;
  if ((_QWORD *)*a2 != v5)
  {
    do
    {
      morphun::dictionary::metadata::CharsetConverter::encode(a1 + 16, &v43, v24[4], v24[5]);
      if ((v43.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v26 = &v43;
      else
        v26 = (std::string *)v43.__r_.__value_.__r.__words[0];
      if ((v43.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v43.__r_.__value_.__r.__words[2]);
      else
        size = v43.__r_.__value_.__l.__size_;
      marisa::Keyset::push_back((uint64_t *)__p, (const char *)v26, size, v25);
      v28 = (_QWORD *)v24[1];
      if (v28)
      {
        do
        {
          v29 = v28;
          v28 = (_QWORD *)*v28;
        }
        while (v28);
      }
      else
      {
        do
        {
          v29 = (_QWORD *)v24[2];
          v17 = *v29 == (_QWORD)v24;
          v24 = v29;
        }
        while (!v17);
      }
      v24 = v29;
    }
    while (v29 != v5);
  }
  marisa::Trie::build((marisa::grimoire::trie::LoudsTrie **)(a1 + 8), (marisa::Keyset *)__p);
  if (*(_DWORD *)(a1 + 32) != marisa::Trie::num_keys(*(marisa::Trie **)(a1 + 8)))
  {
    v40 = __cxa_allocate_exception(0x38uLL);
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"Number of keys in string container should match with size of data");
    morphun::exception::Throwable::Throwable((uint64_t)v40, &__dst);
    *v40 = &off_1E86730F0;
  }
  v30 = (_QWORD *)*a2;
  if ((_QWORD *)*a2 != v5)
  {
    v31 = 0;
    do
    {
      npc<std::map<std::u16string_view,int>>(a3);
      v32 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)&v46[0] + ((v31 >> 5) & 0x7FFFFFFFFFFFFF8))
                      + 16 * v31
                      + 12);
      v33 = (uint64_t **)std::__tree<std::u16string_view>::__find_equal<std::u16string_view>(a3, &__dst, (unsigned __int16 *)v30[4], v30[5]);
      if (!*v33)
      {
        v34 = v33;
        v35 = operator new(0x38uLL);
        v35[2] = *((_OWORD *)v30 + 2);
        *((_DWORD *)v35 + 12) = v32;
        std::__tree<std::u16string_view>::__insert_node_at((uint64_t **)a3, __dst, v34, (uint64_t *)v35);
      }
      v36 = (_QWORD *)v30[1];
      if (v36)
      {
        do
        {
          v37 = v36;
          v36 = (_QWORD *)*v36;
        }
        while (v36);
      }
      else
      {
        do
        {
          v37 = (_QWORD *)v30[2];
          v17 = *v37 == (_QWORD)v30;
          v30 = v37;
        }
        while (!v17);
      }
      ++v31;
      v30 = v37;
    }
    while (v37 != v5);
  }
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v43.__r_.__value_.__l.__data_);
  marisa::scoped_array<marisa::scoped_array<marisa::Key>>::~scoped_array((uint64_t *)v46);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array((uint64_t *)v45 + 1);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array((uint64_t *)__p);
  return a1;
}

void sub_1CB5BE350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  marisa::grimoire::trie::LoudsTrie **v28;
  morphun::dictionary::metadata::CharsetConverter *v29;
  void *v30;
  int v31;

  if (a16 < 0)
  {
    operator delete(__p);
    if ((v31 & 1) == 0)
    {
LABEL_6:
      if (a22 < 0)
        operator delete(a17);
      marisa::Keyset::~Keyset((marisa::Keyset *)&a23);
      marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(v28);
      _Unwind_Resume(a1);
    }
  }
  else if (!v31)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v30);
  goto LABEL_6;
}

void sub_1CB5BE47C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

morphun::dictionary::metadata::StringContainer *morphun::dictionary::metadata::StringContainer::StringContainer(morphun::dictionary::metadata::StringContainer *this)
{
  char *EncodingName;

  *(_BYTE *)this = 1;
  *((_QWORD *)this + 1) = 0;
  EncodingName = morphun::dictionary::metadata::MarisaTrie<signed char>::getEncodingName(1u);
  morphun::dictionary::metadata::CharsetConverter::CharsetConverter((morphun::dictionary::metadata::StringContainer *)((char *)this + 16), EncodingName);
  *((_DWORD *)this + 8) = 0;
  return this;
}

void sub_1CB5BE4DC(_Unwind_Exception *a1)
{
  marisa::grimoire::trie::LoudsTrie **v1;

  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(v1);
  _Unwind_Resume(a1);
}

void morphun::dictionary::metadata::StringContainer::~StringContainer(marisa::grimoire::trie::LoudsTrie **this)
{
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(this + 1);
}

{
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(this + 1);
}

uint64_t morphun::dictionary::metadata::StringContainer::write(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  marisa::grimoire::trie::LoudsTrie *v10;
  char *v11;
  _QWORD *exception;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16[8];
  void *__p[2];
  __int128 v18;
  int v19;
  uint64_t v20[19];
  char v21;
  void *v22;
  int v23;
  uint64_t *v24;
  char v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  std::ostream::write();
  std::ostream::write();
  std::ostream::write();
  std::ostream::write();
  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E8669F00;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Morphun/ext/lib/Marisa/marisa-trie/lib/marisa/trie.cc";
    exception[2] = 0x100000090;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Morphun/ext/lib/Marisa/marisa-trie/lib/marisa/trie.cc:144: MARI"
                   "SA_STATE_ERROR: trie_.get() == NULL";
  }
  if (*(_QWORD *)(v2 + 264))
  {
    v3 = MEMORY[0x1E0DE4FE0];
    v4 = MEMORY[0x1E0DE4FE0] + 64;
    v5 = (uint64_t *)MEMORY[0x1E0DE4F60];
    v6 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
    v7 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
    v20[0] = MEMORY[0x1E0DE4FE0] + 64;
    v15 = v6;
    *(uint64_t *)((char *)&v16[-1] + *(_QWORD *)(v6 - 24)) = v7;
    v8 = (std::ios_base *)((char *)&v16[-1] + *(_QWORD *)(v15 - 24));
    std::ios_base::init(v8, v16);
    v8[1].__vftable = 0;
    v8[1].__fmtflags_ = -1;
    v15 = v3 + 24;
    v20[0] = v4;
    std::streambuf::basic_streambuf();
    v9 = MEMORY[0x1E0DE4FB8];
    v16[0] = MEMORY[0x1E0DE4FB8] + 16;
    *(_OWORD *)__p = 0u;
    v18 = 0u;
    v19 = 16;
    v10 = *(marisa::grimoire::trie::LoudsTrie **)(a1 + 8);
    if (!v10)
    {
      v14 = __cxa_allocate_exception(0x20uLL);
      *v14 = &off_1E8669F00;
      v14[1] = "/Library/Caches/com.apple.xbs/Sources/Morphun/ext/lib/Marisa/marisa-trie/lib/marisa/trie.cc";
      v14[2] = 0x1000000D5;
      v14[3] = "/Library/Caches/com.apple.xbs/Sources/Morphun/ext/lib/Marisa/marisa-trie/lib/marisa/trie.cc:213: MARISA_S"
               "TATE_ERROR: trie.trie_.get() == NULL";
    }
    v22 = 0;
    v23 = -1;
    v24 = &v15;
    v25 = 0;
    marisa::grimoire::io::Writer::write_data((uint64_t)&v22, "We love Marisa.", 0x10uLL);
    marisa::grimoire::trie::LoudsTrie::write_(v10, (marisa::grimoire::io::Writer *)&v22);
    v11 = (char *)&v16[-1] + *(_QWORD *)(v15 - 24);
    if ((*((_DWORD *)v11 + 8) & 5) == 0)
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**((_QWORD **)v11 + 5) + 32))(&v22, *((_QWORD *)v11 + 5), 0, 1, 16);
    std::ostream::write();
    std::stringbuf::str();
    std::ostream::write();
    if (SHIBYTE(v24) < 0)
      operator delete(v22);
    v15 = *v5;
    *(uint64_t *)((char *)&v16[-1] + *(_QWORD *)(v15 - 24)) = v5[3];
    v16[0] = v9 + 16;
    if (SBYTE7(v18) < 0)
      operator delete(__p[0]);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    return MEMORY[0x1D179D280](v20);
  }
  else
  {
    LODWORD(v15) = 0;
    return std::ostream::write();
  }
}

void sub_1CB5BE898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x1E0DE4F60];
  v3 = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)a1 = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x1E0DE4FB8] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1D179D280](a1 + 112);
  return a1;
}

_QWORD *morphun::dictionary::metadata::StringContainer::getString@<X0>(morphun::dictionary::metadata::StringContainer *this@<X0>, int a2@<W1>, std::basic_string<char16_t> *a3@<X8>)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;

  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  v8 = 0u;
  v7 = (unint64_t)a2;
  v6 = 0u;
  marisa::Trie::reverse_lookup((morphun::dictionary::metadata::StringContainer *)((char *)this + 8), (marisa::Agent **)&v6);
  morphun::dictionary::metadata::CharsetConverter::decode((uint64_t)this + 16, a3, *((uint64_t *)&v7 + 1), v8);
  return marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((_QWORD *)&v8 + 1);
}

void sub_1CB5BEA00(_Unwind_Exception *a1)
{
  uint64_t v1;
  _QWORD *v2;

  marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr(v2);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(a1);
}

uint64_t morphun::dictionary::metadata::StringContainer::getIdentifierIfAvailable(uint64_t a1, uint64_t a2, std::string::size_type __requested_capacity)
{
  int v3;
  std::string *v6;
  std::string::size_type size;
  int v8;
  unsigned int v9;
  _OWORD v11[2];
  __int128 v12;
  std::string v13;

  v3 = __requested_capacity;
  memset(&v13, 0, sizeof(v13));
  std::string::reserve(&v13, __requested_capacity);
  v12 = 0u;
  memset(v11, 0, sizeof(v11));
  morphun::dictionary::metadata::CharsetConverter::encode(a1 + 16, &v13, a2, v3);
  if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v6 = &v13;
  else
    v6 = (std::string *)v13.__r_.__value_.__r.__words[0];
  if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
  else
    size = v13.__r_.__value_.__l.__size_;
  marisa::Agent::set_query(v11, (const char *)v6, size);
  v8 = marisa::Trie::lookup((marisa::Trie *)(a1 + 8), (marisa::Agent *)v11);
  v9 = DWORD1(v12);
  marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((_QWORD *)&v12 + 1);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  if (v8)
    return v9;
  else
    return 0xFFFFFFFFLL;
}

void sub_1CB5BEAE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t morphun::dictionary::metadata::StringContainer::getIdentifier(uint64_t a1, void *a2, std::string::size_type a3)
{
  uint64_t result;
  _QWORD *exception;
  const std::basic_string<char16_t>::value_type *v7;
  std::basic_string<char16_t>::size_type v8;
  _QWORD v9[2];
  unsigned __int8 v10;
  std::basic_string<char16_t> __dst;
  std::basic_string<char16_t> v12;

  result = morphun::dictionary::metadata::StringContainer::getIdentifierIfAvailable(a1, (uint64_t)a2, a3);
  if ((result & 0x80000000) != 0)
  {
    exception = __cxa_allocate_exception(0x38uLL);
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"String not found: ");
    std::basic_string<char16_t>::basic_string<std::u16string_view,0>(v9, a2, a3);
    if ((v10 & 0x80u) == 0)
      v7 = (const std::basic_string<char16_t>::value_type *)v9;
    else
      v7 = (const std::basic_string<char16_t>::value_type *)v9[0];
    if ((v10 & 0x80u) == 0)
      v8 = v10;
    else
      v8 = v9[1];
    std::basic_string<char16_t>::append(&__dst, v7, v8);
    v12 = __dst;
    memset(&__dst, 0, sizeof(__dst));
    morphun::exception::Throwable::Throwable((uint64_t)exception, (__int128 *)&v12);
    *exception = &off_1E8673120;
  }
  return result;
}

void sub_1CB5BEBF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  int v26;
  void *v27;

  if (a26 < 0)
    operator delete(__p);
  if (a14 < 0)
    operator delete(a9);
  if (a20 < 0)
  {
    operator delete(a15);
    if ((v26 & 1) == 0)
LABEL_10:
      _Unwind_Resume(a1);
  }
  else if (!v26)
  {
    goto LABEL_10;
  }
  __cxa_free_exception(v27);
  goto LABEL_10;
}

uint64_t morphun::dictionary::metadata::StringContainer::convertIdentifierToBit(morphun::dictionary::metadata::StringContainer *this)
{
  return 1 << (char)this;
}

uint64_t morphun::dictionary::metadata::StringContainer::convertBitToIdentifier(morphun::dictionary::metadata::StringContainer *this)
{
  uint8x8_t v1;
  char v2;

  v1 = (uint8x8_t)vcnt_s8((int8x8_t)this);
  v1.i16[0] = vaddlv_u8(v1);
  v2 = vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)((char *)this - 1)));
  if (v1.u32[0] != 1)
    return -1;
  return v2;
}

uint64_t morphun::dictionary::metadata::StringContainer::size(morphun::dictionary::metadata::StringContainer *this)
{
  return *((unsigned int *)this + 8);
}

void morphun::tokenizer::ICUTokenExtractorIterator::~ICUTokenExtractorIterator(morphun::tokenizer::ICUTokenExtractorIterator *this)
{
  uint64_t v2;
  std::mutex *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  *(_QWORD *)this = &off_1E86734A8;
  v2 = *((_QWORD *)this + 1);
  v3 = (std::mutex *)CLASS_MUTEX();
  std::mutex::lock(v3);
  if (v2)
  {
    v4 = gTokenizerCache;
    if (gTokenizerCache
      && (v6 = *(_QWORD **)gTokenizerCache,
          v5 = *(_QWORD **)(gTokenizerCache + 8),
          v7 = (uint64_t)v5 - *(_QWORD *)gTokenizerCache,
          (unint64_t)v7 <= 0x207))
    {
      v8 = *(_QWORD *)(gTokenizerCache + 16);
      if ((unint64_t)v5 >= v8)
      {
        v10 = v7 >> 3;
        v11 = (v7 >> 3) + 1;
        if (v11 >> 61)
          std::vector<std::pair<morphun::dialog::DefaultArticleLookupFunction const*,std::vector<std::pair<std::basic_string<char16_t>,std::vector<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>> const>>::__throw_length_error[abi:ne180100]();
        v12 = v8 - (_QWORD)v6;
        if (v12 >> 2 > v11)
          v11 = v12 >> 2;
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
          v13 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v13 = v11;
        if (v13)
        {
          if (v13 >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v14 = (char *)operator new(8 * v13);
        }
        else
        {
          v14 = 0;
        }
        v15 = &v14[8 * v10];
        *(_QWORD *)v15 = v2;
        v9 = v15 + 8;
        if (v5 != v6)
        {
          do
          {
            v16 = *--v5;
            *((_QWORD *)v15 - 1) = v16;
            v15 -= 8;
          }
          while (v5 != v6);
          v5 = *(_QWORD **)v4;
        }
        *(_QWORD *)v4 = v15;
        *(_QWORD *)(v4 + 8) = v9;
        *(_QWORD *)(v4 + 16) = &v14[8 * v13];
        if (v5)
          operator delete(v5);
      }
      else
      {
        *v5 = v2;
        v9 = v5 + 1;
      }
      *(_QWORD *)(v4 + 8) = v9;
    }
    else
    {
      ubrk_close();
    }
  }
  std::mutex::unlock(v3);
  *((_QWORD *)this + 1) = 0;
  if (*((_BYTE *)this + 16))
    ubrk_close();
}

{
  morphun::tokenizer::ICUTokenExtractorIterator::~ICUTokenExtractorIterator(this);
  JUMPOUT(0x1D179D2ECLL);
}

void sub_1CB5BEE34()
{
  JUMPOUT(0x1CB5BEE3CLL);
}

uint64_t CLASS_MUTEX(void)
{
  unsigned __int8 v0;
  uint64_t result;
  uint64_t v2;
  morphun::exception::NullPointerException *exception;

  {
    v2 = operator new();
    *(_QWORD *)v2 = 850045863;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_QWORD *)(v2 + 56) = 0;
    CLASS_MUTEX(void)::classMutex = v2;
  }
  result = CLASS_MUTEX(void)::classMutex;
  if (!CLASS_MUTEX(void)::classMutex)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  return result;
}

void sub_1CB5BEF34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t morphun::tokenizer::ICUTokenExtractorIterator::ICUTokenExtractorIterator(uint64_t a1)
{
  std::mutex *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v8;
  _QWORD *exception;
  __int128 v10;
  int v11;

  *(_QWORD *)a1 = &off_1E86734A8;
  v2 = (std::mutex *)CLASS_MUTEX();
  std::mutex::lock(v2);
  v3 = (_QWORD *)gTokenizerCache;
  if (gTokenizerCache)
  {
    v4 = *(_QWORD *)gTokenizerCache;
  }
  else
  {
    v3 = (_QWORD *)operator new();
    v4 = 0;
    *v3 = 0;
    v3[1] = 0;
    v3[2] = 0;
    gTokenizerCache = (uint64_t)v3;
  }
  v5 = v3[1];
  if (v4 != v5)
  {
    v6 = *(_QWORD *)(v5 - 8);
    v3[1] = v5 - 8;
    if (v6)
      goto LABEL_6;
LABEL_9:
    exception = __cxa_allocate_exception(0x38uLL);
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v10, "B");
    morphun::exception::Throwable::Throwable((uint64_t)exception, &v10);
    *exception = &off_1E8673220;
  }
  v11 = 0;
  {
    LODWORD(v10) = 0;
    checkoutCachedTokenizer(void)::source = ubrk_open();
  }
  v6 = ubrk_clone();
  if (!v6)
    goto LABEL_9;
LABEL_6:
  std::mutex::unlock(v2);
  ubrk_setText();
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = 0;
  return a1;
}

void sub_1CB5BF1B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  std::mutex *v14;
  void *v15;

  __cxa_free_exception(v15);
  std::mutex::unlock(v14);
  _Unwind_Resume(a1);
}

void morphun::grammar::synthesis::NlGrammarSynthesizer_NlDisplayFunction::~NlGrammarSynthesizer_NlDisplayFunction(morphun::grammar::synthesis::NlGrammarSynthesizer_NlDisplayFunction *this)
{
  *(_QWORD *)this = &off_1E866E630;
  *((_QWORD *)this + 41) = &off_1E866B550;
  std::__tree<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>>>::destroy(*((char **)this + 50));
  std::__tree<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>>>::destroy(*((char **)this + 47));
  *((_QWORD *)this + 31) = &off_1E866B5A8;
  if (*((char *)this + 327) < 0)
    operator delete(*((void **)this + 38));
  if (*((char *)this + 303) < 0)
    operator delete(*((void **)this + 35));
  morphun::grammar::synthesis::NlGrammarSynthesizer_ArticleLookupFunction::~NlGrammarSynthesizer_ArticleLookupFunction((morphun::grammar::synthesis::NlGrammarSynthesizer_NlDisplayFunction *)((char *)this + 48));
  morphun::grammar::synthesis::NlGrammarSynthesizer_InflectorPatternChain::~NlGrammarSynthesizer_InflectorPatternChain((morphun::grammar::synthesis::NlGrammarSynthesizer_NlDisplayFunction *)((char *)this + 8));
}

{
  *(_QWORD *)this = &off_1E866E630;
  *((_QWORD *)this + 41) = &off_1E866B550;
  std::__tree<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>>>::destroy(*((char **)this + 50));
  std::__tree<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>>>::destroy(*((char **)this + 47));
  *((_QWORD *)this + 31) = &off_1E866B5A8;
  if (*((char *)this + 327) < 0)
    operator delete(*((void **)this + 38));
  if (*((char *)this + 303) < 0)
    operator delete(*((void **)this + 35));
  morphun::grammar::synthesis::NlGrammarSynthesizer_ArticleLookupFunction::~NlGrammarSynthesizer_ArticleLookupFunction((morphun::grammar::synthesis::NlGrammarSynthesizer_NlDisplayFunction *)((char *)this + 48));
  morphun::grammar::synthesis::NlGrammarSynthesizer_InflectorPatternChain::~NlGrammarSynthesizer_InflectorPatternChain((morphun::grammar::synthesis::NlGrammarSynthesizer_NlDisplayFunction *)((char *)this + 8));
  JUMPOUT(0x1D179D2ECLL);
}

morphun::dialog::SemanticFeatureModel_DisplayValue *morphun::grammar::synthesis::NlGrammarSynthesizer_NlDisplayFunction::getDisplayValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  const std::basic_string<char16_t> *v6;
  std::basic_string<char16_t>::size_type size;
  _QWORD *v8;
  _QWORD *v9;
  morphun::dialog::SemanticFeatureModel_DisplayValue *v10;
  std::basic_string<char16_t>::size_type v11;
  morphun::dialog::SemanticFeatureModel_DisplayValue *v12;
  morphun::exception::NullPointerException *exception;
  std::basic_string<char16_t> __p;
  std::basic_string<char16_t> v16;

  memset(&v16, 0, sizeof(v16));
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 == *(_QWORD *)(a2 + 16))
    return 0;
  v6 = (const std::basic_string<char16_t> *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
  std::basic_string<char16_t>::operator=(&v16, v6);
  size = HIBYTE(v16.__r_.__value_.__r.__words[2]);
  if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v16.__r_.__value_.__l.__size_;
  if (size)
  {
    v8 = *(_QWORD **)(a1 + 16);
    v9 = *(_QWORD **)(a1 + 24);
    while (v8 != v9)
    {
      if (!*v8)
      {
        exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
        morphun::exception::NullPointerException::NullPointerException(exception);
      }
      (*(void (**)(std::basic_string<char16_t> *__return_ptr, _QWORD, std::basic_string<char16_t> *, uint64_t))(*(_QWORD *)*v8 + 32))(&__p, *v8, &v16, a3);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        if (__p.__r_.__value_.__l.__size_)
          goto LABEL_22;
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      else if (*((_BYTE *)&__p.__r_.__value_.__s + 23))
      {
        goto LABEL_22;
      }
      ++v8;
    }
    if (*(_BYTE *)(a1 + 40))
    {
      if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
        std::basic_string<char16_t>::__init_copy_ctor_external(&__p, v16.__r_.__value_.__l.__data_, v16.__r_.__value_.__l.__size_);
      else
        __p = v16;
    }
    else
    {
      memset(&__p, 0, sizeof(__p));
    }
LABEL_22:
    v11 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v11 = __p.__r_.__value_.__l.__size_;
    if (v11)
      std::basic_string<char16_t>::operator=(&v16, &__p);
    v12 = (morphun::dialog::SemanticFeatureModel_DisplayValue *)operator new();
    morphun::dialog::SemanticFeatureModel_DisplayValue::SemanticFeatureModel_DisplayValue((uint64_t)v12, (__int128 *)&v16, a3);
    v10 = morphun::dialog::DefinitenessDisplayFunction::addDefiniteness((uint64_t *)(a1 + 328), v12, a3);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if ((*((_BYTE *)&v16.__r_.__value_.__s + 23) & 0x80) != 0)
      goto LABEL_29;
  }
  else
  {
    v10 = 0;
    if ((*((_BYTE *)&v16.__r_.__value_.__s + 23) & 0x80) != 0)
LABEL_29:
      operator delete(v16.__r_.__value_.__l.__data_);
  }
  return v10;
}

void sub_1CB5BF51C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  uint64_t v20;

  MEMORY[0x1D179D2EC](v20, 0x10B3C406733FD4BLL);
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(a1);
}

void morphun::dialog::language::HrCommonConceptFactory::~HrCommonConceptFactory(void **this)
{
  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(this, (void **)&off_1E8667918);
}

{
  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(this, (void **)&off_1E8667918);
  JUMPOUT(0x1D179D2ECLL);
}

void morphun::analysis::util::AttributeSource_StringAttributeReflector::~AttributeSource_StringAttributeReflector(morphun::analysis::util::AttributeSource_StringAttributeReflector *this)
{
  JUMPOUT(0x1D179D2ECLL);
}

std::basic_string<char16_t> *morphun::analysis::util::AttributeSource_StringAttributeReflector::reflect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  std::basic_string<char16_t> *v9;
  std::basic_string<char16_t> *v10;
  const char *v11;
  int32_t v12;
  const std::basic_string<char16_t>::value_type *v13;
  std::basic_string<char16_t>::size_type v14;
  std::basic_string<char16_t> *v15;
  int v16;
  const std::basic_string<char16_t>::value_type *v17;
  std::basic_string<char16_t>::size_type v18;
  std::basic_string<char16_t> *v19;
  std::basic_string<char16_t> *v20;
  int v21;
  const std::basic_string<char16_t>::value_type *v22;
  std::basic_string<char16_t>::size_type v23;
  void *__p;
  uint64_t v26;
  uint64_t v27;

  v8 = npc<std::basic_string<char16_t>>(*(_QWORD *)(a1 + 8));
  if (*(char *)(v8 + 23) < 0)
  {
    if (!*(_QWORD *)(v8 + 8))
      goto LABEL_4;
    goto LABEL_3;
  }
  if (*(_BYTE *)(v8 + 23))
  {
LABEL_3:
    v9 = (std::basic_string<char16_t> *)npc<std::basic_string<char16_t>>(*(_QWORD *)(a1 + 8));
    std::basic_string<char16_t>::append(v9, L",", 1uLL);
  }
LABEL_4:
  if (*(_BYTE *)(a1 + 16))
  {
    __p = 0;
    v26 = 0;
    v27 = 0;
    v10 = *(std::basic_string<char16_t> **)(a1 + 8);
    npc<std::basic_string<char16_t>>((uint64_t)v10);
    v11 = (const char *)(*(_QWORD *)(a2 + 8) & 0x7FFFFFFFFFFFFFFFLL);
    v12 = strlen(v11);
    morphun::util::StringViewUtils::convert((uint64_t)&__p, v11, v12);
    v13 = v27 >= 0
        ? (const std::basic_string<char16_t>::value_type *)&__p
        : (const std::basic_string<char16_t>::value_type *)__p;
    v14 = v27 >= 0 ? HIBYTE(v27) : v26;
    std::basic_string<char16_t>::append(v10, v13, v14);
    std::basic_string<char16_t>::append(v10, L"#", 1uLL);
    if (SHIBYTE(v27) < 0)
      operator delete(__p);
  }
  v15 = (std::basic_string<char16_t> *)npc<std::basic_string<char16_t>>(*(_QWORD *)(a1 + 8));
  v16 = *(char *)(a3 + 23);
  if (v16 >= 0)
    v17 = (const std::basic_string<char16_t>::value_type *)a3;
  else
    v17 = *(const std::basic_string<char16_t>::value_type **)a3;
  if (v16 >= 0)
    v18 = *(unsigned __int8 *)(a3 + 23);
  else
    v18 = *(_QWORD *)(a3 + 8);
  v19 = std::basic_string<char16_t>::append(v15, v17, v18);
  v20 = std::basic_string<char16_t>::append(v19, L"=", 1uLL);
  v21 = *(char *)(a4 + 23);
  if (v21 >= 0)
    v22 = (const std::basic_string<char16_t>::value_type *)a4;
  else
    v22 = *(const std::basic_string<char16_t>::value_type **)a4;
  if (v21 >= 0)
    v23 = *(unsigned __int8 *)(a4 + 23);
  else
    v23 = *(_QWORD *)(a4 + 8);
  return std::basic_string<char16_t>::append(v20, v22, v23);
}

void sub_1CB5BF728(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void morphun::analysis::util::AttributeSource_StringAttributeReflector::reflect(uint64_t a1, uint64_t a2, uint64_t a3, void (***a4)(void **__return_ptr, _QWORD))
{
  void *__p[2];
  char v8;

  if (a4)
    (**a4)(__p, a4);
  else
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, "n");
  (*(void (**)(uint64_t, uint64_t, uint64_t, void **))(*(_QWORD *)a1 + 24))(a1, a2, a3, __p);
  if (v8 < 0)
    operator delete(__p[0]);
}

void sub_1CB5BF7D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1CB5BF830(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void morphun::grammar::synthesis::TrGrammarSynthesizer_InterrogativeArticleLookupFunction::~TrGrammarSynthesizer_InterrogativeArticleLookupFunction(morphun::grammar::synthesis::TrGrammarSynthesizer_InterrogativeArticleLookupFunction *this)
{
  JUMPOUT(0x1D179D2ECLL);
}

uint64_t morphun::grammar::synthesis::TrGrammarSynthesizer_InterrogativeArticleLookupFunction::getFeatureValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t *v4;
  int v5;
  const UChar *v6;
  uint64_t v7;
  int VowelGroup;
  uint64_t v9;
  uint64_t v10;
  std::basic_string<char16_t> *p_p;
  const UChar *v12;
  char *v13;
  __int128 v14;
  int v15;
  morphun::exception::NullPointerException *exception;
  std::basic_string<char16_t> __p;
  _DWORD v19[2];

  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
  v4 = *(uint64_t **)(a1 + 24);
  if (!v4)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  v5 = *(char *)(v3 + 23);
  if (v5 >= 0)
    v6 = (const UChar *)v3;
  else
    v6 = *(const UChar **)v3;
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v3 + 23);
  else
    v7 = *(_QWORD *)(v3 + 8);
  VowelGroup = morphun::grammar::synthesis::TrGrammarSynthesizer_TrDisplayFunction::getVowelGroup(v4, v6, v7);
  v9 = operator new();
  if (*(char *)(v3 + 23) >= 0)
    v10 = *(unsigned __int8 *)(v3 + 23);
  else
    v10 = *(_QWORD *)(v3 + 8);
  p_p = &__p;
  std::basic_string<char16_t>::basic_string[abi:ne180100]((uint64_t)&__p, v10 + 2);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    p_p = (std::basic_string<char16_t> *)__p.__r_.__value_.__r.__words[0];
  if (v10)
  {
    if (*(char *)(v3 + 23) >= 0)
      v12 = (const UChar *)v3;
    else
      v12 = *(const UChar **)v3;
    memmove(p_p, v12, 2 * v10);
  }
  v13 = (char *)p_p + 2 * v10;
  *(_DWORD *)v13 = 7143456;
  *((_WORD *)v13 + 2) = 0;
  std::basic_string<char16_t>::push_back(&__p, morphun::grammar::synthesis::TrGrammarSynthesizer::getAffix(morphun::grammar::synthesis::TrGrammarSynthesizer::VowelGroup)::AFFIX[VowelGroup]);
  v14 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
  v19[0] = __p.__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v19 + 3) = *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[2] + 3);
  v15 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  memset(&__p, 0, sizeof(__p));
  *(_QWORD *)v9 = &off_1E866AD28;
  if (v15 < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)(v9 + 8), (const std::basic_string<char16_t>::value_type *)v14, *((std::basic_string<char16_t>::size_type *)&v14 + 1));
    *(_QWORD *)(v9 + 32) = 0;
    operator delete((void *)v14);
  }
  else
  {
    *(_OWORD *)(v9 + 8) = v14;
    *(_DWORD *)(v9 + 24) = v19[0];
    *(_DWORD *)(v9 + 27) = *(_DWORD *)((char *)v19 + 3);
    *(_BYTE *)(v9 + 31) = v15;
    *(_QWORD *)(v9 + 32) = 0;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v9;
}

void sub_1CB5BFA08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;
  void *v15;

  operator delete(v15);
  if (a14 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v14, 0x10B3C40F7FF9C27);
  _Unwind_Resume(a1);
}

void morphun::dialog::language::EsCommonConceptFactory_EsAndList::~EsCommonConceptFactory_EsAndList(morphun::dialog::language::EsCommonConceptFactory_EsAndList *this)
{
  morphun::dialog::SemanticConceptList::~SemanticConceptList(this, (uint64_t *)&off_1E8667E60);
}

{
  morphun::dialog::SemanticConceptList::~SemanticConceptList(this, (uint64_t *)&off_1E8667E60);
  JUMPOUT(0x1D179D2ECLL);
}

morphun::dialog::SemanticConceptList *morphun::dialog::language::EsCommonConceptFactory_EsAndList::clone(morphun::dialog::language::EsCommonConceptFactory_EsAndList *this)
{
  morphun::dialog::SemanticConceptList *v2;

  v2 = (morphun::dialog::SemanticConceptList *)operator new();
  *(_QWORD *)v2 = &off_1E865C360;
  morphun::dialog::SemanticConceptList::SemanticConceptList(v2, (const morphun::dialog::SemanticConceptList *)&off_1E8667E60, this);
  *(_QWORD *)v2 = &off_1E866DBB8;
  return v2;
}

void sub_1CB5BFB00(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C40223A8A63);
  _Unwind_Resume(a1);
}

void morphun::dialog::language::EsCommonConceptFactory_EsAndList::getBeforeLast(const morphun::dialog::SemanticFeatureConceptBase *a1@<X1>, const morphun::dialog::SpeakableString *a2@<X2>, const morphun::dialog::SemanticFeatureConceptBase *a3@<X3>, const morphun::dialog::SpeakableString *a4@<X4>, uint64_t a5@<X8>)
{
  morphun::dialog::language::EsCommonConceptFactory_EsAndList *v7;
  _QWORD *v8;
  unsigned __int8 v9;
  _QWORD *v10;
  unsigned __int8 v11;
  uint64_t v12;
  _QWORD *v13;
  int isStartsWithUnicodeSets;
  int v15;
  _QWORD *v16;
  _QWORD *v17;
  void *__p[2];
  _QWORD *v19;

  v7 = (morphun::dialog::language::EsCommonConceptFactory_EsAndList *)(*(uint64_t (**)(const morphun::dialog::SpeakableString *, const morphun::dialog::SemanticFeatureConceptBase *, const morphun::dialog::SpeakableString *, const morphun::dialog::SemanticFeatureConceptBase *))(*(_QWORD *)a4 + 32))(a4, a1, a2, a3);
  v8 = (_QWORD *)morphun::dialog::language::EsCommonConceptFactory_EsAndList::IMPORTANT_SET(v7);
  {
    v16 = (_QWORD *)operator new();
    icu4cxx::UnicodeSet::UnicodeSet((uint64_t)v16);
    MEMORY[0x1D179D970](*v16);
    morphun::dialog::language::I_SOUND(void)::I_SOUND_ = (uint64_t)v16;
  }
  v10 = (_QWORD *)morphun::dialog::language::I_SOUND(void)::I_SOUND_;
  npc<icu4cxx::UnicodeSet const>(morphun::dialog::language::I_SOUND(void)::I_SOUND_);
  if ((v11 & 1) == 0
  {
    v17 = (_QWORD *)operator new();
    icu4cxx::UnicodeSet::UnicodeSet((uint64_t)v17);
    MEMORY[0x1D179D970](*v17);
    morphun::dialog::language::EsCommonConceptFactory_EsAndList::NON_SPANISH_VOWEL_SET(void)::NON_SPANISH_VOWEL_SET_ = (uint64_t)v17;
  }
  v12 = morphun::dialog::language::EsCommonConceptFactory_EsAndList::NON_SPANISH_VOWEL_SET(void)::NON_SPANISH_VOWEL_SET_;
  npc<icu4cxx::UnicodeSet const>(morphun::dialog::language::EsCommonConceptFactory_EsAndList::NON_SPANISH_VOWEL_SET(void)::NON_SPANISH_VOWEL_SET_);
  v13 = operator new(8uLL);
  *v13 = v12;
  __p[1] = v13 + 1;
  v19 = v13 + 1;
  __p[0] = v13;
  isStartsWithUnicodeSets = morphun::dictionary::PhraseProperties::isStartsWithUnicodeSets((uint64_t)v7, v8, v10, (uint64_t **)__p);
  operator delete(v13);
  if (!isStartsWithUnicodeSets)
  {
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L" y ");
    *(_QWORD *)a5 = &off_1E866AD28;
    if (SHIBYTE(v19) < 0)
      goto LABEL_8;
LABEL_7:
    *(_OWORD *)(a5 + 8) = *(_OWORD *)__p;
    *(_QWORD *)(a5 + 24) = v19;
    *(_QWORD *)(a5 + 32) = 0;
    return;
  }
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L" e ");
  *(_QWORD *)a5 = &off_1E866AD28;
  if ((SHIBYTE(v19) & 0x80000000) == 0)
    goto LABEL_7;
LABEL_8:
  std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)(a5 + 8), (const std::basic_string<char16_t>::value_type *)__p[0], (std::basic_string<char16_t>::size_type)__p[1]);
  v15 = SHIBYTE(v19);
  *(_QWORD *)(a5 + 32) = 0;
  if (v15 < 0)
    operator delete(__p[0]);
}

void sub_1CB5BFD38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1D179D2EC](v15, 0x1020C405F07FB98);
  _Unwind_Resume(a1);
}

uint64_t morphun::dialog::language::EsCommonConceptFactory_EsAndList::IMPORTANT_SET(morphun::dialog::language::EsCommonConceptFactory_EsAndList *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    icu4cxx::UnicodeSet::UnicodeSet((uint64_t)v3);
    MEMORY[0x1D179D970](*v3);
    morphun::dialog::language::EsCommonConceptFactory_EsAndList::IMPORTANT_SET(void)::IMPORTANT_SET_ = (uint64_t)v3;
  }
  return npc<icu4cxx::UnicodeSet const>(morphun::dialog::language::EsCommonConceptFactory_EsAndList::IMPORTANT_SET(void)::IMPORTANT_SET_);
}

void sub_1CB5BFE50(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x1020C405F07FB98);
  _Unwind_Resume(a1);
}

void sub_1CB5BFECC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void morphun::util::lemmatization::InflectionIdentifier::~InflectionIdentifier(void **this)
{
  morphun::util::lemmatization::InflectionIdentifier::~InflectionIdentifier(this);
  JUMPOUT(0x1D179D2ECLL);
}

{
  if (*((char *)this + 55) < 0)
    operator delete(this[4]);
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

uint64_t morphun::util::lemmatization::InflectionIdentifier::InflectionIdentifier(uint64_t a1, __int128 *a2, __int128 *a3)
{
  __int128 v5;
  std::basic_string<char16_t> *v6;
  __int128 v7;

  *(_QWORD *)a1 = &off_1E866A718;
  if (*((char *)a2 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)(a1 + 8), *(const std::basic_string<char16_t>::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 2);
    *(_OWORD *)(a1 + 8) = v5;
  }
  v6 = (std::basic_string<char16_t> *)(a1 + 32);
  if (*((char *)a3 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(v6, *(const std::basic_string<char16_t>::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v7 = *a3;
    *(_QWORD *)(a1 + 48) = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  return a1;
}

void sub_1CB5BFFD8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void morphun::dialog::language::HeCommonConceptFactory_HeAndList::~HeCommonConceptFactory_HeAndList(morphun::dialog::language::HeCommonConceptFactory_HeAndList *this)
{
  morphun::dialog::SemanticConceptList::~SemanticConceptList(this, (uint64_t *)&off_1E8667EE8);
}

{
  morphun::dialog::SemanticConceptList::~SemanticConceptList(this, (uint64_t *)&off_1E8667EE8);
  JUMPOUT(0x1D179D2ECLL);
}

morphun::dialog::SemanticConceptList *morphun::dialog::language::HeCommonConceptFactory_HeAndList::clone(morphun::dialog::language::HeCommonConceptFactory_HeAndList *this)
{
  morphun::dialog::SemanticConceptList *v2;

  v2 = (morphun::dialog::SemanticConceptList *)operator new();
  *(_QWORD *)v2 = &off_1E865C630;
  morphun::dialog::SemanticConceptList::SemanticConceptList(v2, (const morphun::dialog::SemanticConceptList *)&off_1E8667EE8, this);
  *(_QWORD *)v2 = &off_1E866DD00;
  return v2;
}

void sub_1CB5C0090(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C40223A8A63);
  _Unwind_Resume(a1);
}

void morphun::dialog::language::HeCommonConceptFactory_HeAndList::getBeforeLast(morphun::dialog::language::HeCommonConceptFactory_HeAndList *this@<X0>, const morphun::dialog::SpeakableString *a2@<X4>, uint64_t a3@<X8>)
{
  _QWORD *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *__p[2];
  uint64_t v15;

  v8 = (_QWORD *)morphun::lang::StringFilterUtil::HEBREW_SCRIPT(this);
  v9 = (*(uint64_t (**)(const morphun::dialog::SpeakableString *))(*(_QWORD *)a2 + 32))(a2);
  v10 = *(char *)(v9 + 23);
  if (v10 >= 0)
    v11 = v9;
  else
    v11 = *(_QWORD *)v9;
  if (v10 >= 0)
    LODWORD(v12) = *(unsigned __int8 *)(v9 + 23);
  else
    v12 = *(_QWORD *)(v9 + 8);
  if (!morphun::util::UnicodeSetUtils::containsSome(v8, v11, v12))
  {
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, " ");
    *(_QWORD *)a3 = &off_1E866AD28;
    if (SHIBYTE(v15) < 0)
      goto LABEL_12;
LABEL_11:
    *(_OWORD *)(a3 + 8) = *(_OWORD *)__p;
    *(_QWORD *)(a3 + 24) = v15;
    *(_QWORD *)(a3 + 32) = 0;
    return;
  }
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, " ");
  *(_QWORD *)a3 = &off_1E866AD28;
  if ((SHIBYTE(v15) & 0x80000000) == 0)
    goto LABEL_11;
LABEL_12:
  std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)(a3 + 8), (const std::basic_string<char16_t>::value_type *)__p[0], (std::basic_string<char16_t>::size_type)__p[1]);
  v13 = SHIBYTE(v15);
  *(_QWORD *)(a3 + 32) = 0;
  if (v13 < 0)
    operator delete(__p[0]);
}

void sub_1CB5C01B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void morphun::grammar::synthesis::HeGrammarSynthesizer::addSemanticFeatures(morphun::grammar::synthesis::HeGrammarSynthesizer *this, morphun::dialog::SemanticFeatureModel *a2)
{
  uint64_t *v3;
  morphun::dictionary::DictionaryMetaData *v4;
  const morphun::util::ULocale *v5;
  morphun::util::LocaleUtils *Dictionary;
  morphun::dictionary::Inflector *v7;
  const morphun::util::ULocale *v8;
  morphun::util::LocaleUtils *Inflector;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  morphun::grammar::synthesis::GrammemeConstants *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  morphun::grammar::synthesis::GrammemeConstants *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  morphun::grammar::synthesis::HeGrammarSynthesizer *v47;
  uint64_t i;
  void *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *BinaryProperties;
  uint64_t v59;
  uint64_t *v60;
  morphun::grammar::synthesis::GrammemeConstants *v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  __int128 v66;
  uint64_t *v67;
  uint64_t j;
  uint64_t v69;
  uint64_t *v70;
  char *v71;
  uint64_t v72;
  morphun::util::LocaleUtils *v73;
  morphun::grammar::synthesis::GrammemeConstants *v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  __int128 v78;
  uint64_t k;
  morphun::util::LocaleUtils *v80;
  morphun::grammar::synthesis::GrammemeConstants *v81;
  uint64_t v82;
  __int128 v83;
  uint64_t v84;
  __int128 v85;
  uint64_t v86;
  __int128 v87;
  uint64_t m;
  uint64_t *v89;
  morphun::grammar::synthesis::GrammemeConstants *v90;
  uint64_t v91;
  __int128 v92;
  uint64_t v93;
  __int128 v94;
  uint64_t v95;
  __int128 v96;
  uint64_t n;
  uint64_t v98;
  uint64_t *v99;
  morphun::dialog::DefaultFeatureFunction *v100;
  morphun::exception::NullPointerException *exception;
  morphun::grammar::synthesis::GrammemeConstants *v102;
  void *p_dst;
  void *v104;
  char *v105;
  std::basic_string<char16_t> *p_p_dst;
  char v107;
  std::basic_string<char16_t> __p;
  std::basic_string<char16_t> v109;
  std::basic_string<char16_t> v110;
  __int128 __dst;
  uint64_t v112;
  __int128 v113;

  *(_QWORD *)&v113 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t *)operator new();
  *v3 = (uint64_t)&off_1E866E468;
  v4 = (morphun::dictionary::DictionaryMetaData *)morphun::util::LocaleUtils::HEBREW((morphun::util::LocaleUtils *)v3);
  Dictionary = (morphun::util::LocaleUtils *)morphun::dictionary::DictionaryMetaData::createDictionary(v4, v5);
  if (!Dictionary)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  v3[1] = (uint64_t)Dictionary;
  v7 = (morphun::dictionary::Inflector *)morphun::util::LocaleUtils::HEBREW(Dictionary);
  Inflector = (morphun::util::LocaleUtils *)morphun::dictionary::Inflector::getInflector(v7, v8);
  v3[2] = (uint64_t)Inflector;
  v102 = (morphun::grammar::synthesis::GrammemeConstants *)morphun::util::LocaleUtils::HEBREW(Inflector);
  v10 = morphun::grammar::synthesis::GrammemeConstants::POS_NOUN(v102);
  v11 = *(char *)(v10 + 23);
  if (v11 >= 0)
    v12 = v10;
  else
    v12 = *(_QWORD *)v10;
  if (v11 >= 0)
    v13 = *(unsigned __int8 *)(v10 + 23);
  else
    v13 = *(_QWORD *)(v10 + 8);
  v14 = morphun::grammar::synthesis::GrammemeConstants::POS_ADJECTIVE((morphun::grammar::synthesis::GrammemeConstants *)v10);
  v15 = *(char *)(v14 + 23);
  if (v15 >= 0)
    v16 = v14;
  else
    v16 = *(_QWORD *)v14;
  if (v15 >= 0)
    v17 = *(unsigned __int8 *)(v14 + 23);
  else
    v17 = *(_QWORD *)(v14 + 8);
  v18 = morphun::grammar::synthesis::GrammemeConstants::POS_VERB((morphun::grammar::synthesis::GrammemeConstants *)v14);
  v19 = *(unsigned __int8 *)(v18 + 23);
  v21 = *(_QWORD *)v18;
  v20 = *(_QWORD *)(v18 + 8);
  v22 = (morphun::grammar::synthesis::GrammemeConstants *)operator new(0x30uLL);
  __p.__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)v22 + 48;
  __p.__r_.__value_.__r.__words[2] = (std::basic_string<char16_t>::size_type)v22 + 48;
  if ((v19 & 0x80u) == 0)
    v23 = v18;
  else
    v23 = v21;
  if ((v19 & 0x80u) == 0)
    v24 = v19;
  else
    v24 = v20;
  *(_QWORD *)v22 = v12;
  *((_QWORD *)v22 + 1) = v13;
  *((_QWORD *)v22 + 2) = v16;
  *((_QWORD *)v22 + 3) = v17;
  *((_QWORD *)v22 + 4) = v23;
  *((_QWORD *)v22 + 5) = v24;
  __p.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)v22;
  v25 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_SINGULAR(v22);
  v26 = *(char *)(v25 + 23);
  if (v26 >= 0)
    v27 = v25;
  else
    v27 = *(_QWORD *)v25;
  if (v26 >= 0)
    v28 = *(unsigned __int8 *)(v25 + 23);
  else
    v28 = *(_QWORD *)(v25 + 8);
  v29 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL((morphun::grammar::synthesis::GrammemeConstants *)v25);
  v30 = *(unsigned __int8 *)(v29 + 23);
  v31 = *(_QWORD *)v29;
  v32 = *(_QWORD *)(v29 + 8);
  v109.__r_.__value_.__r.__words[0] = 0;
  v33 = (morphun::grammar::synthesis::GrammemeConstants *)operator new(0x20uLL);
  v109.__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)v33 + 32;
  v109.__r_.__value_.__r.__words[2] = (std::basic_string<char16_t>::size_type)v33 + 32;
  if ((v30 & 0x80u) == 0)
    v34 = v29;
  else
    v34 = v31;
  if ((v30 & 0x80u) == 0)
    v35 = v30;
  else
    v35 = v32;
  *(_QWORD *)v33 = v27;
  *((_QWORD *)v33 + 1) = v28;
  *((_QWORD *)v33 + 2) = v34;
  *((_QWORD *)v33 + 3) = v35;
  v109.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)v33;
  v36 = morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v33);
  v37 = *(char *)(v36 + 23);
  if (v37 >= 0)
    v38 = v36;
  else
    v38 = *(_QWORD *)v36;
  if (v37 >= 0)
    v39 = *(unsigned __int8 *)(v36 + 23);
  else
    v39 = *(_QWORD *)(v36 + 8);
  v40 = morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v36);
  v41 = *(unsigned __int8 *)(v40 + 23);
  v42 = *(_QWORD *)v40;
  v43 = *(_QWORD *)(v40 + 8);
  v110.__r_.__value_.__r.__words[0] = 0;
  v44 = operator new(0x20uLL);
  v110.__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)(v44 + 4);
  v110.__r_.__value_.__r.__words[2] = (std::basic_string<char16_t>::size_type)(v44 + 4);
  if ((v41 & 0x80u) == 0)
    v45 = v40;
  else
    v45 = v42;
  if ((v41 & 0x80u) == 0)
    v46 = v41;
  else
    v46 = v43;
  *v44 = v38;
  v44[1] = v39;
  v44[2] = v45;
  v44[3] = v46;
  v110.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)v44;
  v112 = 0;
  __dst = 0uLL;
  *(_QWORD *)&__dst = operator new(0x48uLL);
  *((_QWORD *)&__dst + 1) = __dst;
  v112 = __dst + 72;
  v47 = this;
  *((_QWORD *)&__dst + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::u16string_view>>,std::vector<std::u16string_view> const*,std::vector<std::u16string_view> const*,std::vector<std::u16string_view>*>((uint64_t)&v112, (uint64_t)&__p, (uint64_t)&__dst, (_QWORD *)__dst);
  p_dst = 0;
  v104 = 0;
  v105 = 0;
  morphun::dialog::DictionaryLookupInflector::DictionaryLookupInflector(v3 + 3, v102, (uint64_t)&__dst, (uint64_t **)&p_dst, 1);
  p_p_dst = (std::basic_string<char16_t> *)&p_dst;
  std::vector<std::vector<std::basic_string<char16_t>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p_dst);
  p_dst = &__dst;
  std::vector<std::vector<std::u16string_view>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_dst);
  for (i = 0; i != -9; i -= 3)
  {
    v49 = *(std::basic_string<char16_t>::pointer *)((char *)&v110.__r_.__value_.__l.__data_ + i * 8);
    if (v49)
    {
      v110.__r_.__value_.__r.__words[i + 1] = (std::basic_string<char16_t>::size_type)v49;
      operator delete(v49);
    }
  }
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__p, (char *)L"count");
  v50 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>((uint64_t)v47 + 8, (unsigned __int16 *)&__p);
  v51 = (char *)v47 + 16;
  if ((morphun::grammar::synthesis::HeGrammarSynthesizer *)((char *)v47 + 16) == (morphun::grammar::synthesis::HeGrammarSynthesizer *)v50)
    v52 = 0;
  else
    v52 = *(_QWORD *)(v50 + 56);
  npc<morphun::dialog::SemanticFeature const>(v52);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v3[32] = v52;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__p, (char *)L"gender");
  v53 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>((uint64_t)v47 + 8, (unsigned __int16 *)&__p);
  if (v51 == (char *)v53)
    v54 = 0;
  else
    v54 = *(_QWORD *)(v53 + 56);
  npc<morphun::dialog::SemanticFeature const>(v54);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v3[33] = v54;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__p, "d");
  v55 = std::__tree<std::basic_string<char16_t>>::find<std::basic_string<char16_t>>((uint64_t)v47 + 8, (unsigned __int16 *)&__p);
  if (v51 == (char *)v55)
    v56 = 0;
  else
    v56 = *(_QWORD *)(v55 + 56);
  npc<morphun::dialog::SemanticFeature const>(v56);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v3[34] = v56;
  *(_OWORD *)(v3 + 35) = 0u;
  *(_OWORD *)(v3 + 37) = 0u;
  v57 = v3[1];
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"noun");
  memset(&__p, 0, sizeof(__p));
  p_dst = &__p;
  LOBYTE(v104) = 0;
  __p.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)operator new(0x18uLL);
  __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
  __p.__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[0] + 24;
  __p.__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&__p.__r_.__value_.__r.__words[2], &__dst, &v113, (std::basic_string<char16_t> *)__p.__r_.__value_.__l.__data_);
  BinaryProperties = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v57, v3 + 36, (uint64_t *)&__p);
  morphun::util::Validate::notNull<long long>((uint64_t)BinaryProperties);
  p_dst = &__p;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_dst);
  if (SHIBYTE(v112) < 0)
    operator delete((void *)__dst);
  v59 = v3[1];
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "a");
  memset(&__p, 0, sizeof(__p));
  p_dst = &__p;
  LOBYTE(v104) = 0;
  __p.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)operator new(0x18uLL);
  __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
  __p.__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[0] + 24;
  __p.__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&__p.__r_.__value_.__r.__words[2], &__dst, &v113, (std::basic_string<char16_t> *)__p.__r_.__value_.__l.__data_);
  v60 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v59, v3 + 37, (uint64_t *)&__p);
  morphun::util::Validate::notNull<long long>((uint64_t)v60);
  p_dst = &__p;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_dst);
  if (SHIBYTE(v112) < 0)
    operator delete((void *)__dst);
  v62 = v3[1];
  v63 = morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v61);
  if (*(char *)(v63 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&__p, *(const std::basic_string<char16_t>::value_type **)v63, *(_QWORD *)(v63 + 8));
  }
  else
  {
    v64 = *(_OWORD *)v63;
    __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(v63 + 16);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v64;
  }
  v65 = morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v63);
  if (*(char *)(v65 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v109, *(const std::basic_string<char16_t>::value_type **)v65, *(_QWORD *)(v65 + 8));
  }
  else
  {
    v66 = *(_OWORD *)v65;
    v109.__r_.__value_.__r.__words[2] = *(_QWORD *)(v65 + 16);
    *(_OWORD *)&v109.__r_.__value_.__l.__data_ = v66;
  }
  __dst = 0uLL;
  v112 = 0;
  p_dst = &__dst;
  LOBYTE(v104) = 0;
  *(_QWORD *)&__dst = operator new(0x30uLL);
  *((_QWORD *)&__dst + 1) = __dst;
  v112 = __dst + 48;
  *((_QWORD *)&__dst + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v112, (__int128 *)&__p, (__int128 *)&v110, (std::basic_string<char16_t> *)__dst);
  v67 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v62, v3 + 35, (uint64_t *)&__dst);
  morphun::util::Validate::notNull<long long>((uint64_t)v67);
  p_dst = &__dst;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_dst);
  for (j = 0; j != -6; j -= 3)
  {
    if (SHIBYTE(v109.__r_.__value_.__r.__words[j + 2]) < 0)
      operator delete(*(void **)((char *)&__p + j * 8 + 24));
  }
  v69 = v3[1];
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"adposition");
  memset(&__p, 0, sizeof(__p));
  p_dst = &__p;
  LOBYTE(v104) = 0;
  __p.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)operator new(0x18uLL);
  __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
  __p.__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[0] + 24;
  __p.__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&__p.__r_.__value_.__r.__words[2], &__dst, &v113, (std::basic_string<char16_t> *)__p.__r_.__value_.__l.__data_);
  v70 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v69, v3 + 38, (uint64_t *)&__p);
  morphun::util::Validate::notNull<long long>((uint64_t)v70);
  p_dst = &__p;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_dst);
  if (SHIBYTE(v112) < 0)
    operator delete((void *)__dst);
  v71 = (char *)v3 + *(_QWORD *)(*v3 - 56);
  v72 = *((_QWORD *)v47 + 29);
  if (v72)
    (*(void (**)(uint64_t))(*(_QWORD *)v72 + 16))(v72);
  *((_QWORD *)v47 + 29) = v71;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&p_dst, (char *)L"gender");
  v73 = (morphun::util::LocaleUtils *)operator new();
  *(_QWORD *)v73 = &off_1E865D180;
  v74 = (morphun::grammar::synthesis::GrammemeConstants *)morphun::util::LocaleUtils::HEBREW(v73);
  v75 = morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE(v74);
  if (*(char *)(v75 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&__p, *(const std::basic_string<char16_t>::value_type **)v75, *(_QWORD *)(v75 + 8));
  }
  else
  {
    v76 = *(_OWORD *)v75;
    __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(v75 + 16);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v76;
  }
  v77 = morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE((morphun::grammar::synthesis::GrammemeConstants *)v75);
  if (*(char *)(v77 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v109, *(const std::basic_string<char16_t>::value_type **)v77, *(_QWORD *)(v77 + 8));
  }
  else
  {
    v78 = *(_OWORD *)v77;
    v109.__r_.__value_.__r.__words[2] = *(_QWORD *)(v77 + 16);
    *(_OWORD *)&v109.__r_.__value_.__l.__data_ = v78;
  }
  __dst = 0uLL;
  v112 = 0;
  p_p_dst = (std::basic_string<char16_t> *)&__dst;
  v107 = 0;
  *(_QWORD *)&__dst = operator new(0x30uLL);
  *((_QWORD *)&__dst + 1) = __dst;
  v112 = __dst + 48;
  *((_QWORD *)&__dst + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v112, (__int128 *)&__p, (__int128 *)&v110, (std::basic_string<char16_t> *)__dst);
  morphun::dialog::DictionaryLookupFunction::DictionaryLookupFunction((uint64_t)v73, (uint64_t *)off_1E8668210, v74, (uint64_t *)&__dst);
  p_p_dst = (std::basic_string<char16_t> *)&__dst;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p_dst);
  for (k = 0; k != -6; k -= 3)
  {
    if (SHIBYTE(v109.__r_.__value_.__r.__words[k + 2]) < 0)
      operator delete(*(void **)((char *)&__p + k * 8 + 24));
  }
  *(_QWORD *)v73 = &off_1E866EB80;
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)v47, (unsigned __int16 *)&p_dst, v73);
  if (SHIBYTE(v105) < 0)
    operator delete(p_dst);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"count");
  v80 = (morphun::util::LocaleUtils *)operator new();
  v81 = (morphun::grammar::synthesis::GrammemeConstants *)morphun::util::LocaleUtils::HEBREW(v80);
  v82 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_SINGULAR(v81);
  if (*(char *)(v82 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&__p, *(const std::basic_string<char16_t>::value_type **)v82, *(_QWORD *)(v82 + 8));
  }
  else
  {
    v83 = *(_OWORD *)v82;
    __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(v82 + 16);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v83;
  }
  v84 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL((morphun::grammar::synthesis::GrammemeConstants *)v82);
  if (*(char *)(v84 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v109, *(const std::basic_string<char16_t>::value_type **)v84, *(_QWORD *)(v84 + 8));
  }
  else
  {
    v85 = *(_OWORD *)v84;
    v109.__r_.__value_.__r.__words[2] = *(_QWORD *)(v84 + 16);
    *(_OWORD *)&v109.__r_.__value_.__l.__data_ = v85;
  }
  v86 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_DUAL((morphun::grammar::synthesis::GrammemeConstants *)v84);
  if (*(char *)(v86 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v110, *(const std::basic_string<char16_t>::value_type **)v86, *(_QWORD *)(v86 + 8));
  }
  else
  {
    v87 = *(_OWORD *)v86;
    v110.__r_.__value_.__r.__words[2] = *(_QWORD *)(v86 + 16);
    *(_OWORD *)&v110.__r_.__value_.__l.__data_ = v87;
  }
  p_dst = 0;
  v104 = 0;
  v105 = 0;
  p_p_dst = (std::basic_string<char16_t> *)&p_dst;
  v107 = 0;
  p_dst = operator new(0x48uLL);
  v104 = p_dst;
  v105 = (char *)p_dst + 72;
  v104 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v105, (__int128 *)&__p, &__dst, (std::basic_string<char16_t> *)p_dst);
  morphun::dialog::DictionaryLookupFunction::DictionaryLookupFunction((uint64_t)v80, v81, (uint64_t *)&p_dst);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)v47, (unsigned __int16 *)&__dst, (morphun::util::LocaleUtils *)((char *)v80 + *(_QWORD *)(*(_QWORD *)v80 - 56)));
  p_p_dst = (std::basic_string<char16_t> *)&p_dst;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p_dst);
  for (m = 0; m != -9; m -= 3)
  {
    if (SHIBYTE(v110.__r_.__value_.__r.__words[m + 2]) < 0)
      operator delete(*(void **)((char *)&v110.__r_.__value_.__l.__data_ + m * 8));
  }
  if (SHIBYTE(v112) < 0)
    operator delete((void *)__dst);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&p_dst, "d");
  v89 = (uint64_t *)operator new();
  *v89 = (uint64_t)&off_1E865E300;
  v90 = (morphun::grammar::synthesis::GrammemeConstants *)morphun::util::LocaleUtils::HEBREW((morphun::util::LocaleUtils *)v89);
  v91 = morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_DEFINITE(v90);
  if (*(char *)(v91 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&__p, *(const std::basic_string<char16_t>::value_type **)v91, *(_QWORD *)(v91 + 8));
  }
  else
  {
    v92 = *(_OWORD *)v91;
    __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(v91 + 16);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v92;
  }
  v93 = morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_INDEFINITE((morphun::grammar::synthesis::GrammemeConstants *)v91);
  if (*(char *)(v93 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v109, *(const std::basic_string<char16_t>::value_type **)v93, *(_QWORD *)(v93 + 8));
  }
  else
  {
    v94 = *(_OWORD *)v93;
    v109.__r_.__value_.__r.__words[2] = *(_QWORD *)(v93 + 16);
    *(_OWORD *)&v109.__r_.__value_.__l.__data_ = v94;
  }
  v95 = morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_CONSTRUCT((morphun::grammar::synthesis::GrammemeConstants *)v93);
  if (*(char *)(v95 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v110, *(const std::basic_string<char16_t>::value_type **)v95, *(_QWORD *)(v95 + 8));
  }
  else
  {
    v96 = *(_OWORD *)v95;
    v110.__r_.__value_.__r.__words[2] = *(_QWORD *)(v95 + 16);
    *(_OWORD *)&v110.__r_.__value_.__l.__data_ = v96;
  }
  __dst = 0uLL;
  v112 = 0;
  p_p_dst = (std::basic_string<char16_t> *)&__dst;
  v107 = 0;
  *(_QWORD *)&__dst = operator new(0x48uLL);
  *((_QWORD *)&__dst + 1) = __dst;
  v112 = __dst + 72;
  *((_QWORD *)&__dst + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v112, (__int128 *)&__p, &__dst, (std::basic_string<char16_t> *)__dst);
  morphun::dialog::DictionaryLookupFunction::DictionaryLookupFunction((uint64_t)v89, (uint64_t *)off_1E86687A8, v90, (uint64_t *)&__dst);
  p_p_dst = (std::basic_string<char16_t> *)&__dst;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p_dst);
  for (n = 0; n != -9; n -= 3)
  {
    if (SHIBYTE(v110.__r_.__value_.__r.__words[n + 2]) < 0)
      operator delete(*(void **)((char *)&v110.__r_.__value_.__l.__data_ + n * 8));
  }
  *v89 = (uint64_t)&off_1E866F628;
  v98 = v89[2];
  v89[26] = v98;
  v89[27] = 0;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"noun");
  memset(&__p, 0, sizeof(__p));
  p_p_dst = &__p;
  v107 = 0;
  __p.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)operator new(0x18uLL);
  __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
  __p.__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[0] + 24;
  __p.__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&__p.__r_.__value_.__r.__words[2], &__dst, &v113, (std::basic_string<char16_t> *)__p.__r_.__value_.__l.__data_);
  v99 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v98, v89 + 27, (uint64_t *)&__p);
  morphun::util::Validate::notNull<long long>((uint64_t)v99);
  p_p_dst = &__p;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p_dst);
  if (SHIBYTE(v112) < 0)
    operator delete((void *)__dst);
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)v47, (unsigned __int16 *)&p_dst, (morphun::dialog::DefaultFeatureFunction *)((char *)v89 + *(_QWORD *)(*v89 - 56)));
  if (SHIBYTE(v105) < 0)
    operator delete(p_dst);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__p, (char *)L"withConditionalHyphen");
  v100 = (morphun::dialog::DefaultFeatureFunction *)operator new();
  *(_QWORD *)v100 = &off_1E866F100;
  morphun::dialog::SemanticFeatureModel::putDefaultFeatureFunctionByName((uint64_t)v47, (unsigned __int16 *)&__p, v100);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_1CB5C0E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  uint64_t v35;
  void *v36;

  __cxa_free_exception(v36);
  MEMORY[0x1D179D2EC](v35, 0x10F3C40FEEDA326);
  _Unwind_Resume(a1);
}

void morphun::dialog::language::ZhCommonConceptFactory::~ZhCommonConceptFactory(void **this)
{
  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(this, (void **)&off_1E8667D58);
}

{
  morphun::dialog::CommonConceptFactoryImpl::~CommonConceptFactoryImpl(this, (void **)&off_1E8667D58);
  JUMPOUT(0x1D179D2ECLL);
}

void morphun::dialog::language::ZhCommonConceptFactory::quantifiedJoin(uint64_t a1@<X1>, uint64_t a2@<X2>, __int128 *a3@<X3>, _QWORD *a4@<X8>)
{
  _QWORD v7[5];
  _QWORD v8[5];

  morphun::dialog::SpeakableString::SpeakableString(v7, a3);
  morphun::dialog::SpeakableString::operator+(a1, (uint64_t)v7, v8);
  morphun::dialog::SpeakableString::operator+((uint64_t)v8, a2, a4);
}

void sub_1CB5C12FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  _Unwind_Resume(a1);
}

void morphun::analysis::stemmer::ItStemFilter::~ItStemFilter(morphun::analysis::stemmer::ItStemFilter *this)
{
  void *v2;
  void *v3;
  void **v4;

  *((_QWORD *)this + 13) = &unk_1E86639D8;
  *(_QWORD *)this = &unk_1E8663A30;
  v2 = (void *)*((_QWORD *)this + 38);
  if (v2)
  {
    *((_QWORD *)this + 39) = v2;
    operator delete(v2);
  }
  v4 = (void **)((char *)this + 280);
  std::vector<std::vector<std::u16string_view>>::__destroy_vector::operator()[abi:ne180100](&v4);
  v3 = (void *)*((_QWORD *)this + 32);
  if (v3)
  {
    *((_QWORD *)this + 33) = v3;
    operator delete(v3);
  }
  *((_QWORD *)this + 13) = &unk_1E8663A70;
  *(_QWORD *)this = &unk_1E8663AA8;
  morphun::analysis::TokenFilter::~TokenFilter(this, (uint64_t *)&off_1E8669AD8);
}

{
  void *v2;
  void *v3;
  void **v4;

  *((_QWORD *)this + 13) = &unk_1E86639D8;
  *(_QWORD *)this = &unk_1E8663A30;
  v2 = (void *)*((_QWORD *)this + 38);
  if (v2)
  {
    *((_QWORD *)this + 39) = v2;
    operator delete(v2);
  }
  v4 = (void **)((char *)this + 280);
  std::vector<std::vector<std::u16string_view>>::__destroy_vector::operator()[abi:ne180100](&v4);
  v3 = (void *)*((_QWORD *)this + 32);
  if (v3)
  {
    *((_QWORD *)this + 33) = v3;
    operator delete(v3);
  }
  *((_QWORD *)this + 13) = &unk_1E8663A70;
  *(_QWORD *)this = &unk_1E8663AA8;
  morphun::analysis::TokenFilter::~TokenFilter(this, (uint64_t *)&off_1E8669AD8);
  JUMPOUT(0x1D179D2ECLL);
}

uint64_t morphun::analysis::stemmer::ItStemFilter::incrementToken(morphun::analysis::stemmer::ItStemFilter *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  std::basic_string<char16_t>::size_type v7;
  std::basic_string<char16_t> *p_dst;
  uint64_t v9;
  uint64_t v10;
  std::basic_string<char16_t> *v11;
  std::basic_string<char16_t>::size_type size;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  const UChar *v17;
  uint64_t v18;
  std::basic_string<char16_t> *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  marisa::Trie *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int16 KeyId;
  std::basic_string<char16_t> *v29;
  uint64_t v30;
  uint64_t j;
  int v32;
  std::basic_string<char16_t> *v33;
  __int16 v34;
  std::basic_string<char16_t> *v35;
  uint64_t v36;
  int v37;
  std::basic_string<char16_t> *v38;
  unint64_t v39;
  std::basic_string<char16_t> *v40;
  std::basic_string<char16_t> *v41;
  int v42;
  const UChar *v43;
  uint64_t v44;
  uint64_t v45;
  std::basic_string<char16_t> *v46;
  std::basic_string<char16_t>::size_type v47;
  _QWORD *v49;
  uint64_t v50;
  const std::basic_string<char16_t> *v51;
  void **v52;
  int *v53;
  int *v54;
  std::basic_string<char16_t>::size_type v55;
  const std::basic_string<char16_t> *v56;
  std::basic_string<char16_t>::size_type v57;
  const std::basic_string<char16_t> *v58;
  std::basic_string<char16_t>::size_type v59;
  std::basic_string<char16_t>::size_type v60;
  std::basic_string<char16_t> *v61;
  _BOOL4 v62;
  uint64_t v63;
  std::basic_string<char16_t>::size_type v64;
  int v65;
  BOOL v66;
  uint64_t v67;
  std::basic_string<char16_t> *v68;
  uint64_t v69;
  std::basic_string<char16_t> *v70;
  uint64_t i;
  morphun::exception::NullPointerException *exception;
  morphun::exception::NullPointerException *v73;
  uint64_t v74;
  void *__p;
  char v76;
  char v77;
  std::basic_string<char16_t> __str;
  char v79;
  uint64_t v80;
  std::basic_string<char16_t> __dst;
  std::basic_string<char16_t> *v82;
  std::basic_string<char16_t> *v83;
  std::basic_string<char16_t> *v84;
  std::basic_string<char16_t> v85;
  _OWORD v86[3];
  char v87;
  uint64_t v88;
  uint64_t v89;
  std::basic_string<char16_t> v90;
  void **v91;
  void **v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;

  *(_QWORD *)&v96 = *MEMORY[0x1E0C80C00];
  v2 = *((_QWORD *)this + 12);
  if (!v2)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  if ((_DWORD)v3)
  {
    v4 = *((_QWORD *)this + 42);
    if (!v4 || ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 56))(v4) & 1) == 0)
    {
      v5 = (_QWORD *)npc<morphun::analysis::tokenattributes::CharTermAttribute>(*((_QWORD *)this + 41));
      v6 = (_QWORD *)((char *)v5 + *(_QWORD *)(*v5 - 96));
      if (*((char *)v6 + 23) < 0)
      {
        v7 = v6[1];
        if (v7 >= 0x7FFFFFFFFFFFFFF8)
          std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
        v6 = (_QWORD *)*v6;
      }
      else
      {
        v7 = *((unsigned __int8 *)v6 + 23);
      }
      if (v7 >= 0xB)
      {
        v9 = (v7 & 0x7FFFFFFFFFFFFFFCLL) + 4;
        if ((v7 | 3) != 0xB)
          v9 = v7 | 3;
        p_dst = (std::basic_string<char16_t> *)std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v9 + 1);
        __dst.__r_.__value_.__l.__size_ = v7;
        __dst.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
        __dst.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)p_dst;
      }
      else
      {
        *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v7;
        p_dst = &__dst;
        if (!v7)
        {
LABEL_16:
          p_dst->__r_.__value_.__s.__data_[v7] = 0;
          v80 = 0;
          if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v11 = &__dst;
          else
            v11 = (std::basic_string<char16_t> *)__dst.__r_.__value_.__r.__words[0];
          if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            size = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
          else
            size = __dst.__r_.__value_.__l.__size_;
          morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(*((_QWORD *)this + 14), (uint64_t)&v80, (const UChar *)v11, size);
          v13 = v80;
          if ((*((_QWORD *)this + 46) & v80) != 0)
          {
            if ((*((_QWORD *)this + 45) & v80) != 0)
            {
              if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
                std::basic_string<char16_t>::__init_copy_ctor_external(&__str, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
              else
                __str = __dst;
              v79 = 1;
              v19 = (std::basic_string<char16_t> *)(*((_QWORD *)this + 41) + *(_QWORD *)(**((_QWORD **)this + 41) - 96));
LABEL_30:
              std::basic_string<char16_t>::operator=(v19, &__str);
LABEL_71:
              if (*((_QWORD *)this + 43))
              {
                *(_QWORD *)&v86[0] = 0;
                v43 = (const UChar *)(*((_QWORD *)this + 41) + *(_QWORD *)(**((_QWORD **)this + 41) - 96));
                if (*((char *)v43 + 23) < 0)
                {
                  v43 = *(const UChar **)v43;
                  v44 = *(_QWORD *)(*((_QWORD *)this + 41) + *(_QWORD *)(**((_QWORD **)this + 41) - 96) + 8);
                }
                else
                {
                  v44 = *((unsigned __int8 *)v43 + 23);
                }
                if (morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(*((_QWORD *)this + 14), (uint64_t)v86, v43, v44))
                {
                  v45 = *((_QWORD *)this + 43);
                  if (!v45)
                  {
                    v73 = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
                    morphun::exception::NullPointerException::NullPointerException(v73);
                  }
                  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v45 + 64))(v45, *(_QWORD *)&v86[0]);
                }
              }
              if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v46 = &__dst;
              else
                v46 = (std::basic_string<char16_t> *)__dst.__r_.__value_.__r.__words[0];
              if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v47 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
              else
                v47 = __dst.__r_.__value_.__l.__size_;
              morphun::analysis::MorphologicalAnalyzerUtil::analyze_word((uint64_t)&__p, (uint64_t)v46, v47, v80, *((_QWORD *)this + 44), (uint64_t *)this + 13, 0);
              if (v77 && v76 < 0)
                operator delete(__p);
              if (v79 && SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__str.__r_.__value_.__l.__data_);
              if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__dst.__r_.__value_.__l.__data_);
              return v3;
            }
            v14 = *((_QWORD *)this + 14);
            v15 = *((_QWORD *)this + 15);
            v16 = (_QWORD *)npc<morphun::analysis::tokenattributes::CharTermAttribute>(*((_QWORD *)this + 41));
            v17 = (const UChar *)((char *)v16 + *(_QWORD *)(*v16 - 96));
            if (*((char *)v17 + 23) < 0)
            {
              v17 = *(const UChar **)v17;
              v18 = *(_QWORD *)((char *)v16 + *(_QWORD *)(*v16 - 96) + 8);
            }
            else
            {
              v18 = *((unsigned __int8 *)v17 + 23);
            }
            morphun::dictionary::DictionaryMetaData::getPropertyValues(v14, v17, v18, (unsigned __int16 *)"i", 0xAuLL, &v88);
            v20 = v88;
            v21 = v89;
            if (v88 != v89)
            {
              if ((*((_QWORD *)this + 48) & v13) != 0)
              {
                v74 = 0x800000000;
                v22 = 0x65006E0069006ELL;
                v23 = 0x69006D00650066;
              }
              else if ((*((_QWORD *)this + 47) & v13) != 0)
              {
                v22 = 0x6E0069006C0075;
                v23 = 0x6300730061006DLL;
                v74 = 0x900000065;
              }
              else
              {
                v74 = 0;
                v23 = 0;
                v22 = 0;
              }
              v24 = (marisa::Trie *)(v15 + 248);
              v25 = v15 + 8;
              while (1)
              {
                if (*(char *)(v20 + 23) < 0)
                {
                  v27 = *(_QWORD *)v20;
                  v26 = *(_QWORD *)(v20 + 8);
                }
                else
                {
                  LODWORD(v26) = *(unsigned __int8 *)(v20 + 23);
                  v27 = v20;
                }
                KeyId = morphun::dictionary::metadata::MarisaTrie<int>::getKeyId(v24, v27, v26);
                morphun::dictionary::Inflector_MMappedDictionary::getInflectionPattern((morphun::dictionary::Inflector_MMappedDictionary *)&v93, v25, KeyId);
                v86[0] = v93;
                v86[1] = v94;
                v86[2] = v95;
                v87 = 1;
                if (WORD1(v94))
                  break;
                v20 += 24;
                if (v20 == v21)
                  goto LABEL_44;
              }
              v49 = (_QWORD *)*((_QWORD *)this + 41);
              npc<morphun::analysis::tokenattributes::CharTermAttribute>((uint64_t)v49);
              v50 = *(_QWORD *)(*v49 - 96);
              std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&v93, "p");
              *((_QWORD *)&v94 + 1) = v23;
              *(_QWORD *)&v95 = v22;
              WORD4(v95) = v74;
              *(_DWORD *)((char *)&v95 + 10) = 0;
              BYTE14(v95) = 0;
              HIBYTE(v95) = BYTE4(v74);
              v83 = 0;
              v84 = 0;
              v82 = 0;
              v91 = (void **)&v82;
              LOBYTE(v92) = 0;
              v82 = (std::basic_string<char16_t> *)operator new(0x30uLL);
              v83 = v82;
              v84 = v82 + 2;
              v83 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v84, &v93, &v96, v82);
              morphun::dictionary::Inflector_InflectionPattern::constrain((unint64_t *)&v91, (uint64_t)v86, (uint64_t *)&v82, 1);
              v51 = (const std::basic_string<char16_t> *)((char *)v49 + v50);
              v52 = v91;
              v53 = (int *)v92;
              if (v91 == v92)
              {
LABEL_128:
                if (SHIBYTE(v51->__r_.__value_.__r.__words[2]) < 0)
                  std::basic_string<char16_t>::__init_copy_ctor_external(&v85, v51->__r_.__value_.__l.__data_, v51->__r_.__value_.__l.__size_);
                else
                  v85 = *v51;
LABEL_138:
                if (v52)
                  operator delete(v52);
                __str = v85;
                v79 = 1;
                v91 = (void **)&v82;
                std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v91);
                for (i = 0; i != -48; i -= 24)
                {
                  if (*((char *)&v95 + i + 15) < 0)
                    operator delete(*(void **)((char *)&v94 + i + 8));
                }
                *(_QWORD *)&v86[0] = &v88;
                std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)v86);
                v19 = (std::basic_string<char16_t> *)(*((_QWORD *)this + 41)
                                                    + *(_QWORD *)(**((_QWORD **)this + 41) - 96));
                goto LABEL_30;
              }
              v54 = (int *)v91;
              while (1)
              {
                v55 = HIBYTE(v51->__r_.__value_.__r.__words[2]);
                v56 = (const std::basic_string<char16_t> *)v51->__r_.__value_.__r.__words[0];
                v57 = v51->__r_.__value_.__l.__size_;
                morphun::dictionary::metadata::StringContainer::getString(*(morphun::dictionary::metadata::StringContainer **)(*(_QWORD *)v54 + 40), v54[2], &v90);
                if ((v55 & 0x80u) == 0)
                  v58 = v51;
                else
                  v58 = v56;
                if ((v55 & 0x80u) == 0)
                  v59 = v55;
                else
                  v59 = v57;
                v60 = HIBYTE(v90.__r_.__value_.__r.__words[2]);
                if ((v90.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v61 = &v90;
                else
                  v61 = (std::basic_string<char16_t> *)v90.__r_.__value_.__r.__words[0];
                if ((v90.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                  v60 = v90.__r_.__value_.__l.__size_;
                if (v59 < v60)
                  break;
                if (v60)
                {
                  v63 = -(uint64_t)v60;
                  v64 = (std::basic_string<char16_t>::size_type)v58 + 2 * v59;
                  do
                  {
                    v65 = (unsigned __int16)v61->__r_.__value_.__s.__data_[0];
                    v61 = (std::basic_string<char16_t> *)((char *)v61 + 2);
                    v62 = v65 == *(unsigned __int16 *)(v64 + 2 * v63);
                    v66 = v65 != *(unsigned __int16 *)(v64 + 2 * v63) || v63 == -1;
                    ++v63;
                  }
                  while (!v66);
                  if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
                    goto LABEL_108;
                }
                else
                {
                  v62 = 1;
                  if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
                    goto LABEL_108;
                }
LABEL_117:
                if (v62)
                {
                  morphun::dictionary::Inflector_Inflection::lemmatize(&v85, v54, v51);
                  goto LABEL_138;
                }
                v54 += 6;
                if (v54 == v53)
                  goto LABEL_128;
              }
              v62 = 0;
              if ((SHIBYTE(v90.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                goto LABEL_117;
LABEL_108:
              operator delete(v90.__r_.__value_.__l.__data_);
              goto LABEL_117;
            }
LABEL_44:
            *(_QWORD *)&v86[0] = &v88;
            std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)v86);
          }
          LOBYTE(__str.__r_.__value_.__l.__data_) = 0;
          v79 = 0;
          v29 = (std::basic_string<char16_t> *)(*((_QWORD *)this + 41) + *(_QWORD *)(**((_QWORD **)this + 41) - 96));
          if (SHIBYTE(v29->__r_.__value_.__r.__words[2]) < 0)
            v30 = LODWORD(v29->__r_.__value_.__r.__words[1]);
          else
            v30 = HIBYTE(v29->__r_.__value_.__r.__words[2]);
          if ((int)v30 >= 6)
          {
            for (j = 0; j != v30; ++j)
            {
              v32 = SHIBYTE(v29->__r_.__value_.__r.__words[2]);
              v33 = v29;
              if (v32 < 0)
                v33 = (std::basic_string<char16_t> *)v29->__r_.__value_.__r.__words[0];
              switch(v33->__r_.__value_.__s.__data_[j])
              {
                case 0xE0:
                case 0xE1:
                case 0xE2:
                case 0xE4:
                  v34 = 97;
                  goto LABEL_58;
                case 0xE8:
                case 0xE9:
                case 0xEA:
                case 0xEB:
                  v34 = 101;
                  goto LABEL_58;
                case 0xEC:
                case 0xED:
                case 0xEE:
                case 0xEF:
                  v34 = 105;
                  goto LABEL_58;
                case 0xF2:
                case 0xF3:
                case 0xF4:
                case 0xF6:
                  v34 = 111;
                  goto LABEL_58;
                case 0xF9:
                case 0xFA:
                case 0xFB:
                case 0xFC:
                  v34 = 117;
LABEL_58:
                  v35 = v29;
                  if (v32 < 0)
                    v35 = (std::basic_string<char16_t> *)v29->__r_.__value_.__r.__words[0];
                  v35->__r_.__value_.__s.__data_[j] = v34;
                  break;
                default:
                  break;
              }
            }
            v36 = (v30 - 1);
            v37 = SHIBYTE(v29->__r_.__value_.__r.__words[2]);
            v38 = v29;
            if (v37 < 0)
              v38 = (std::basic_string<char16_t> *)v29->__r_.__value_.__r.__words[0];
            HIDWORD(v39) = (unsigned __int16)v38->__r_.__value_.__s.__data_[v36] - 97;
            LODWORD(v39) = HIDWORD(v39);
            switch((v39 >> 1))
            {
              case 0u:
              case 7u:
                v30 = (v30 - 2);
                v40 = v29;
                if (v37 < 0)
                  v40 = (std::basic_string<char16_t> *)v29->__r_.__value_.__r.__words[0];
                v41 = (std::basic_string<char16_t> *)((char *)v40 + 2 * v30);
                v42 = 105;
                goto LABEL_68;
              case 2u:
                v67 = (v30 - 2);
                LODWORD(v30) = v30 - 2;
                if (v37 < 0)
                {
                  if (*(_WORD *)(v29->__r_.__value_.__r.__words[0] + 2 * v67) == 105)
                    break;
                  v68 = (std::basic_string<char16_t> *)v29->__r_.__value_.__r.__words[0];
                }
                else
                {
                  v68 = v29;
                  if (v29->__r_.__value_.__s.__data_[v67] == 105)
                    break;
                }
                v41 = (std::basic_string<char16_t> *)((char *)v68 + 2 * v67);
                v42 = 104;
                goto LABEL_68;
              case 4u:
                v69 = (v30 - 2);
                LODWORD(v30) = v30 - 2;
                if (v37 < 0)
                {
                  if (*(_WORD *)(v29->__r_.__value_.__r.__words[0] + 2 * v69) == 104)
                    break;
                  v70 = (std::basic_string<char16_t> *)v29->__r_.__value_.__r.__words[0];
                }
                else
                {
                  v70 = v29;
                  if (v29->__r_.__value_.__s.__data_[v69] == 104)
                    break;
                }
                v41 = (std::basic_string<char16_t> *)((char *)v70 + 2 * v69);
                v42 = 105;
LABEL_68:
                if ((unsigned __int16)v41->__r_.__value_.__s.__data_[0] != v42)
                  LODWORD(v30) = v36;
                break;
              default:
                break;
            }
          }
          std::basic_string<char16_t>::resize(v29, (int)v30, 0);
          goto LABEL_71;
        }
      }
      memmove(p_dst, v6, 2 * v7);
      goto LABEL_16;
    }
  }
  return v3;
}

void *morphun::analysis::stemmer::ItStemFilter::reset(morphun::analysis::stemmer::ItStemFilter *this)
{
  uint64_t v2;
  void *result;

  v2 = npc<morphun::analysis::TokenStream>(*((_QWORD *)this + 12));
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 40))(v2);
  *((_QWORD *)this + 42) = morphun::analysis::util::AttributeSource::getAttribute<morphun::analysis::tokenattributes::KeywordAttribute>((uint64_t)this);
  *((_QWORD *)this + 43) = morphun::analysis::util::AttributeSource::getAttribute<morphun::analysis::tokenattributes::GrammemeAttribute>((uint64_t)this);
  result = morphun::analysis::util::AttributeSource::getAttribute<morphun::analysis::tokenattributes::LemmaMappingAttribute>((uint64_t)this);
  *((_QWORD *)this + 44) = result;
  return result;
}

void `non-virtual thunk to'morphun::analysis::stemmer::ItStemFilter::~ItStemFilter(morphun::analysis::stemmer::ItStemFilter *this)
{
  morphun::analysis::TokenFilter *v2;
  void *v3;
  void *v4;
  void **v5;

  *((_QWORD *)this - 13) = &unk_1E8663A30;
  v2 = (morphun::analysis::stemmer::ItStemFilter *)((char *)this - 104);
  *(_QWORD *)this = &unk_1E86639D8;
  v3 = (void *)*((_QWORD *)this + 25);
  if (v3)
  {
    *((_QWORD *)this + 26) = v3;
    operator delete(v3);
  }
  v5 = (void **)((char *)this + 176);
  std::vector<std::vector<std::u16string_view>>::__destroy_vector::operator()[abi:ne180100](&v5);
  v4 = (void *)*((_QWORD *)this + 19);
  if (v4)
  {
    *((_QWORD *)this + 20) = v4;
    operator delete(v4);
  }
  *(_QWORD *)this = &unk_1E8663A70;
  *((_QWORD *)this - 13) = &unk_1E8663AA8;
  morphun::analysis::TokenFilter::~TokenFilter(v2, (uint64_t *)&off_1E8669AD8);
}

{
  morphun::analysis::TokenFilter *v2;
  void *v3;
  void *v4;
  void **v5;

  *((_QWORD *)this - 13) = &unk_1E8663A30;
  v2 = (morphun::analysis::stemmer::ItStemFilter *)((char *)this - 104);
  *(_QWORD *)this = &unk_1E86639D8;
  v3 = (void *)*((_QWORD *)this + 25);
  if (v3)
  {
    *((_QWORD *)this + 26) = v3;
    operator delete(v3);
  }
  v5 = (void **)((char *)this + 176);
  std::vector<std::vector<std::u16string_view>>::__destroy_vector::operator()[abi:ne180100](&v5);
  v4 = (void *)*((_QWORD *)this + 19);
  if (v4)
  {
    *((_QWORD *)this + 20) = v4;
    operator delete(v4);
  }
  *(_QWORD *)this = &unk_1E8663A70;
  *((_QWORD *)this - 13) = &unk_1E8663AA8;
  morphun::analysis::TokenFilter::~TokenFilter(v2, (uint64_t *)&off_1E8669AD8);
  JUMPOUT(0x1D179D2ECLL);
}

void sub_1CB5C1F4C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *morphun::TokenIterator::TokenIterator(_QWORD *this, const morphun::Token *a2, const morphun::Token *a3)
{
  *this = a2;
  this[1] = a3;
  return this;
}

{
  *this = a2;
  this[1] = a3;
  return this;
}

uint64_t morphun::TokenIterator::operator->(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t morphun::TokenIterator::operator*(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t morphun::TokenIterator::get(morphun::TokenIterator *this)
{
  return *(_QWORD *)this;
}

uint64_t *morphun::TokenIterator::operator++(uint64_t *a1)
{
  *a1 = *(_QWORD *)(npc<morphun::Token const>(*a1) + 80);
  return a1;
}

void sub_1CB5C1FFC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t morphun::TokenIterator::operator++(uint64_t *a1)
{
  uint64_t result;

  result = npc<morphun::Token const>(*a1);
  *a1 = *(_QWORD *)(result + 80);
  return result;
}

_QWORD *morphun::TokenIterator::operator--(_QWORD *result)
{
  uint64_t v1;
  morphun::exception::NullPointerException *exception;

  if (*result)
  {
    v1 = *(_QWORD *)(*result + 72);
    if (!v1)
    {
      exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
      morphun::exception::NullPointerException::NullPointerException(exception);
    }
  }
  else
  {
    v1 = result[1];
  }
  *result = v1;
  return result;
}

void sub_1CB5C209C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t morphun::TokenIterator::operator--(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  morphun::TokenIterator::operator--(a1);
  return v1;
}

BOOL morphun::TokenIterator::operator==(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

BOOL morphun::TokenIterator::operator!=(_QWORD *a1, _QWORD *a2)
{
  return *a1 != *a2;
}

const void *minf_toInflectableStringConcept(const void *a1)
{
  _QWORD *exception;
  __int128 __dst;

  if (!a1
  {
    exception = __cxa_allocate_exception(0x38uLL);
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"Object is not a PronounConcept");
    morphun::exception::Throwable::Throwable((uint64_t)exception, &__dst);
    *exception = &off_1E8673060;
  }
  return a1;
}

void sub_1CB5C21B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  const std::exception *v15;
  void *v16;
  int v17;
  const void **v20;
  __CFError **v21;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v17 & 1) == 0)
      goto LABEL_6;
  }
  else if (!v17)
  {
LABEL_6:
    if (a2 == 1)
    {
      v20 = (const void **)__cxa_begin_catch(exception_object);
      morphun::util::CFUtils::convert(v20, v15, v21);
      __cxa_end_catch();
      JUMPOUT(0x1CB5C2144);
    }
    _Unwind_Resume(exception_object);
  }
  __cxa_free_exception(v16);
  goto LABEL_6;
}

uint64_t minf_toSpeakableString(uint64_t a1)
{
  uint64_t v1;

  v1 = npc<morphun::dialog::InflectableStringConcept>(a1);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
}

uint64_t npc<morphun::dialog::InflectableStringConcept>(uint64_t result)
{
  morphun::exception::NullPointerException *exception;

  if (!result)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  return result;
}

void sub_1CB5C22D4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t minf_clone(uint64_t a1)
{
  uint64_t v1;

  v1 = npc<morphun::dialog::InflectableStringConcept>(a1);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 128))(v1);
}

morphun::dialog::InflectableStringConcept *minf_create(const morphun::dialog::SemanticFeatureModel *a1, const morphun::dialog::SpeakableString *a2)
{
  morphun::dialog::InflectableStringConcept *v4;
  _QWORD *exception;
  __int128 __dst;

  if (!a2)
  {
    exception = __cxa_allocate_exception(0x38uLL);
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "I");
    morphun::exception::Throwable::Throwable((uint64_t)exception, &__dst);
    *exception = &off_1E8673090;
  }
  v4 = (morphun::dialog::InflectableStringConcept *)operator new();
  morphun::dialog::InflectableStringConcept::InflectableStringConcept(v4, a1, a2);
  return v4;
}

void sub_1CB5C2414(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  const std::exception *v15;
  void *v16;
  int v17;
  const void **v20;
  __CFError **v21;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v17 & 1) == 0)
      goto LABEL_6;
  }
  else if (!v17)
  {
LABEL_6:
    if (a2 == 1)
    {
      v20 = (const void **)__cxa_begin_catch(exception_object);
      morphun::util::CFUtils::convert(v20, v15, v21);
      __cxa_end_catch();
      JUMPOUT(0x1CB5C23A0);
    }
    _Unwind_Resume(exception_object);
  }
  __cxa_free_exception(v16);
  goto LABEL_6;
}

uint64_t minf_destroy(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

uint64_t minf_isExists(uint64_t a1)
{
  uint64_t v1;

  v1 = npc<morphun::dialog::InflectableStringConcept>(a1);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 32))(v1);
}

void minf_putConstraintByName(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  std::basic_string<char16_t> __p;
  std::basic_string<char16_t> v7;

  npc<morphun::dialog::InflectableStringConcept>(a1);
  morphun::util::CFUtils::to_u16string(&v7, a2);
  morphun::util::CFUtils::to_u16string(&__p, a3);
  (*(void (**)(uint64_t, std::basic_string<char16_t> *, std::basic_string<char16_t> *))(*(_QWORD *)a1 + 72))(a1, &v7, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v7.__r_.__value_.__l.__data_);
}

void sub_1CB5C25BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  const std::exception *v20;
  const void **v23;
  __CFError **v24;

  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  if (a2 == 1)
  {
    v23 = (const void **)__cxa_begin_catch(exception_object);
    morphun::util::CFUtils::convert(v23, v20, v24);
    __cxa_end_catch();
    JUMPOUT(0x1CB5C25A8);
  }
  _Unwind_Resume(exception_object);
}

void minf_clearConstraintByName(uint64_t a1, const __CFString *a2)
{
  std::basic_string<char16_t> __p;

  npc<morphun::dialog::InflectableStringConcept>(a1);
  morphun::util::CFUtils::to_u16string(&__p, a2);
  (*(void (**)(uint64_t, std::basic_string<char16_t> *))(*(_QWORD *)a1 + 88))(a1, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_1CB5C269C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  const std::exception *v15;
  const void **v18;
  __CFError **v19;

  if (a15 < 0)
    operator delete(__p);
  if (a2 == 1)
  {
    v18 = (const void **)__cxa_begin_catch(exception_object);
    morphun::util::CFUtils::convert(v18, v15, v19);
    __cxa_end_catch();
    JUMPOUT(0x1CB5C2688);
  }
  _Unwind_Resume(exception_object);
}

uint64_t minf_reset(uint64_t a1)
{
  uint64_t v1;

  v1 = npc<morphun::dialog::InflectableStringConcept>(a1);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 96))(v1);
}

uint64_t minf_getFeatureValueByNameCopy(uint64_t a1, const __CFString *a2)
{
  uint64_t v4;
  std::basic_string<char16_t> __p;

  npc<morphun::dialog::InflectableStringConcept>(a1);
  morphun::util::CFUtils::to_u16string(&__p, a2);
  v4 = (*(uint64_t (**)(uint64_t, std::basic_string<char16_t> *))(*(_QWORD *)a1 + 112))(a1, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v4;
}

void sub_1CB5C27D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  const std::exception *v15;
  const void **v18;
  __CFError **v19;

  if (a15 < 0)
    operator delete(__p);
  if (a2 == 1)
  {
    v18 = (const void **)__cxa_begin_catch(exception_object);
    morphun::util::CFUtils::convert(v18, v15, v19);
    __cxa_end_catch();
    JUMPOUT(0x1CB5C27B8);
  }
  _Unwind_Resume(exception_object);
}

void morphun::analysis::FrAnalyzer::~FrAnalyzer(void **this)
{
  *this = &off_1E865FF30;
  morphun::analysis::Analyzer::~Analyzer((morphun::analysis::Analyzer *)this, (uint64_t *)&off_1E8668E40);
}

{
  *this = &off_1E865FF30;
  morphun::analysis::Analyzer::~Analyzer((morphun::analysis::Analyzer *)this, (uint64_t *)&off_1E8668E40);
  JUMPOUT(0x1D179D2ECLL);
}

morphun::analysis::util::FilteringTokenFilter *morphun::analysis::FrAnalyzer::addStopFilter(morphun::analysis::FrAnalyzer *this, morphun::analysis::TokenStream *a2)
{
  morphun::analysis::util::FilteringTokenFilter *v4;

  v4 = (morphun::analysis::util::FilteringTokenFilter *)operator new();
  morphun::analysis::core::StopFilter::StopFilter(v4, (uint64_t)a2, *((_QWORD *)this + 8));
  return v4;
}

void sub_1CB5C291C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F1C40C2748A64);
  _Unwind_Resume(a1);
}

morphun::analysis::util::AttributeSource *morphun::analysis::FrAnalyzer::addWordNormalizationFilter(const char **this, morphun::analysis::TokenStream *a2)
{
  morphun::analysis::filter::ContractionExpandingFilter *v4;
  uint64_t v5;
  morphun::analysis::util::AttributeSource *v6;
  morphun::dictionary::DictionaryMetaData *v7;
  uint64_t i;
  morphun::analysis::util::AttributeSource *v9;
  std::basic_string<char16_t> *v11;
  std::basic_string<char16_t> *v12;
  std::basic_string<char16_t> *v13;
  std::basic_string<char16_t> **v14;
  char v15;
  void *__p[2];
  char v17;
  _QWORD v18[3];
  __int128 v19;

  *(_QWORD *)&v19 = *MEMORY[0x1E0C80C00];
  v4 = (morphun::analysis::filter::ContractionExpandingFilter *)operator new();
  morphun::analysis::filter::ContractionExpandingFilter::ContractionExpandingFilter(v4, a2, this + 10);
  v5 = operator new();
  *(_QWORD *)v5 = &off_1E866A910;
  v6 = morphun::analysis::util::AttributeSource::AttributeSource((morphun::analysis::util::AttributeSource *)v5, (morphun::analysis::util::AttributeSource *)&off_1E8669A70, (uint64_t)v4);
  *(_QWORD *)v5 = &off_1E8663630;
  *(_QWORD *)(v5 + 96) = v4;
  v7 = (morphun::dictionary::DictionaryMetaData *)morphun::util::LocaleUtils::FRENCH(v6);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, (char *)L"noun");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v18, "a");
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = &v11;
  v15 = 0;
  v11 = (std::basic_string<char16_t> *)operator new(0x30uLL);
  v12 = v11;
  v13 = v11 + 2;
  v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v13, (__int128 *)__p, &v19, v11);
  morphun::analysis::stemmer::DictionaryGenderedNounLemmatizer::DictionaryGenderedNounLemmatizer(v5 + 104, (uint64_t *)&off_1E8669A90, v7, (uint64_t *)&v11);
  v14 = &v11;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  for (i = 0; i != -6; i -= 3)
  {
    if (SHIBYTE(v18[i + 2]) < 0)
      operator delete((void *)v18[i]);
  }
  *(_QWORD *)v5 = &off_1E86728C0;
  *(_QWORD *)(v5 + 104) = &unk_1E8672920;
  *(_OWORD *)(v5 + 432) = 0u;
  *(_OWORD *)(v5 + 448) = 0u;
  *(_QWORD *)(v5 + 432) = morphun::analysis::util::AttributeSource::addAttribute<morphun::analysis::tokenattributes::CharTermAttribute>(v5);
  v9 = (morphun::analysis::util::AttributeSource *)operator new();
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, "e");
  morphun::analysis::filter::AmpersandToAndFilter::AmpersandToAndFilter(v9, v5, (__int128 *)__p);
  if (v17 < 0)
    operator delete(__p[0]);
  return v9;
}

void sub_1CB5C2B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  uint64_t v19;

  if (a19 < 0)
    operator delete(__p);
  MEMORY[0x1D179D2EC](v19, 0x10F3C40C7D8954FLL);
  _Unwind_Resume(a1);
}

void sub_1CB5C2C30()
{
  JUMPOUT(0x1CB5C2C10);
}

void sub_1CB5C2C38()
{
  JUMPOUT(0x1CB5C2C1CLL);
}

uint64_t *morphun::analysis::FrAnalyzer::loadStopwordSet(morphun::analysis::FrAnalyzer *this)
{
  uint64_t *SnowballStopwordSet;
  uint64_t v2;
  void *__p[2];
  char v5;

  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, "f");
  SnowballStopwordSet = (uint64_t *)morphun::analysis::util::StopwordAnalyzerBase::loadSnowballStopwordSet((const void **)__p);
  if (v5 < 0)
    operator delete(__p[0]);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, "f");
  v2 = morphun::analysis::util::StopwordAnalyzerBase::loadSnowballStopwordSet((const void **)__p);
  if (v5 < 0)
    operator delete(__p[0]);
  std::set<std::basic_string<char16_t>>::insert[abi:ne180100]<std::__tree_const_iterator<std::basic_string<char16_t>,std::__tree_node<std::basic_string<char16_t>,void *> *,long>>(SnowballStopwordSet, *(unsigned __int16 **)v2, (unsigned __int16 *)(v2 + 8));
  std::__tree<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>>>::destroy(*(char **)(v2 + 8));
  MEMORY[0x1D179D2EC](v2, 0x1020C4062D53EE8);
  return SnowballStopwordSet;
}

void sub_1CB5C2CF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void morphun::grammar::synthesis::HeGrammarSynthesizer_HeDisplayFunction::~HeGrammarSynthesizer_HeDisplayFunction(morphun::grammar::synthesis::HeGrammarSynthesizer_HeDisplayFunction *this)
{
  *(_QWORD *)this = &off_1E866E468;
}

{
  *(_QWORD *)this = &off_1E866E468;
  JUMPOUT(0x1D179D2ECLL);
}

uint64_t morphun::grammar::synthesis::HeGrammarSynthesizer_HeDisplayFunction::getDisplayValue(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  const std::basic_string<char16_t> *v6;
  std::basic_string<char16_t>::size_type size;
  int v8;
  std::basic_string<char16_t>::size_type v9;
  std::basic_string<char16_t>::size_type v10;
  std::basic_string<char16_t> *v11;
  std::basic_string<char16_t>::size_type v12;
  uint64_t v13;
  morphun::grammar::synthesis::GrammemeConstants *v14;
  uint64_t i;
  int v16;
  std::basic_string<char16_t> *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  unsigned __int16 *v21;
  std::basic_string<char16_t> *p_s;
  std::basic_string<char16_t>::size_type v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  unsigned __int16 *v27;
  std::basic_string<char16_t> *v28;
  std::basic_string<char16_t>::size_type v29;
  std::basic_string<char16_t> *v30;
  char *v31;
  char *v32;
  unint64_t v33;
  char v34;
  std::basic_string<char16_t>::size_type v35;
  std::basic_string<char16_t>::size_type v36;
  __int128 v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  __int128 *v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  std::basic_string<char16_t>::size_type v50;
  BOOL v51;
  std::basic_string<char16_t> *v52;
  std::basic_string<char16_t> *v53;
  std::basic_string<char16_t>::size_type v54;
  morphun::grammar::synthesis::GrammemeConstants *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unsigned __int16 *v63;
  std::basic_string<char16_t> *v65;
  char *v66;
  const std::basic_string<char16_t>::value_type *v67;
  std::basic_string<char16_t>::size_type v68;
  __int16 KeyId;
  uint64_t InflectionPattern;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  int v75;
  unsigned __int16 *v76;
  unsigned __int16 *v77;
  unsigned __int16 *v78;
  uint64_t v79;
  unint64_t v80;
  std::basic_string<char16_t> *v81;
  std::basic_string<char16_t>::size_type v82;
  unint64_t v83;
  uint64_t v84;
  morphun::dictionary::DictionaryMetaData_MMappedDictionary *v85;
  unsigned __int16 *v86;
  unsigned __int16 *j;
  std::basic_string<char16_t>::size_type v88;
  unint64_t v89;
  std::basic_string<char16_t>::size_type v90;
  unint64_t v91;
  std::basic_string<char16_t> *v92;
  std::basic_string<char16_t> *v93;
  uint64_t v94;
  std::basic_string<char16_t> *v95;
  __int128 v96;
  std::basic_string<char16_t> *v97;
  std::basic_string<char16_t> *v98;
  void **v99;
  unsigned __int16 *v100;
  uint64_t v101;
  char v102;
  std::basic_string<char16_t>::size_type v103;
  std::basic_string<char16_t> *v104;
  std::basic_string<char16_t>::size_type v105;
  uint64_t v106;
  std::basic_string<char16_t>::size_type v107;
  __int128 *v108;
  char *v109;
  std::basic_string<char16_t> v110;
  std::basic_string<char16_t> v111;
  std::basic_string<char16_t> __s;
  std::basic_string<char16_t> v113;
  void *__p[2];
  char v115;
  unsigned __int8 v116;
  std::basic_string<char16_t> v117;
  std::basic_string<char16_t> v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122[2];
  unsigned __int8 v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  std::basic_string<char16_t> *v127;
  std::basic_string<char16_t> *v128;
  std::basic_string<char16_t> *v129;
  void **v130[3];
  std::basic_string<char16_t> v131;
  __int128 v132;
  _OWORD v133[2];
  void **v134;
  char v135;
  std::basic_string<char16_t> *v136;
  std::basic_string<char16_t> *v137;
  __int128 v138;
  _BYTE v139[32];
  __int128 v140;
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  memset(&v113, 0, sizeof(v113));
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 == *(_QWORD *)(a2 + 16))
    return 0;
  v6 = (const std::basic_string<char16_t> *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
  std::basic_string<char16_t>::operator=(&v113, v6);
  size = HIBYTE(v113.__r_.__value_.__r.__words[2]);
  if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v113.__r_.__value_.__l.__size_;
  if (size)
  {
    morphun::grammar::synthesis::GrammarSynthesizerUtil::getFeatureValue(&__s, a3, a1[32]);
    morphun::grammar::synthesis::GrammarSynthesizerUtil::getFeatureValue(&v111, a3, a1[33]);
    v8 = SHIBYTE(__s.__r_.__value_.__r.__words[2]);
    if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v9 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    else
      v9 = __s.__r_.__value_.__l.__size_;
    if (v9)
      goto LABEL_12;
    v10 = HIBYTE(v111.__r_.__value_.__r.__words[2]);
    if ((v111.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v10 = v111.__r_.__value_.__l.__size_;
    if (v10)
    {
LABEL_12:
      if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v11 = &v113;
      else
        v11 = (std::basic_string<char16_t> *)v113.__r_.__value_.__r.__words[0];
      if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v12 = HIBYTE(v113.__r_.__value_.__r.__words[2]);
      else
        v12 = v113.__r_.__value_.__l.__size_;
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
      {
        std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)&v138, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
      }
      else
      {
        v138 = *(_OWORD *)&__s.__r_.__value_.__l.__data_;
        *(_QWORD *)v139 = *((_QWORD *)&__s.__r_.__value_.__l + 2);
      }
      if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0)
        std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)&v139[8], v111.__r_.__value_.__l.__data_, v111.__r_.__value_.__l.__size_);
      else
        *(std::basic_string<char16_t> *)&v139[8] = v111;
      v132 = 0uLL;
      *(_QWORD *)&v133[0] = 0;
      v131.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)&v132;
      LOBYTE(v131.__r_.__value_.__r.__words[1]) = 0;
      *(_QWORD *)&v132 = operator new(0x30uLL);
      *((_QWORD *)&v132 + 1) = v132;
      *(_QWORD *)&v133[0] = v132 + 48;
      *((_QWORD *)&v132 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)v133, &v138, &v140, (std::basic_string<char16_t> *)v132);
      memset(&v131, 0, sizeof(v131));
      morphun::dialog::DictionaryLookupInflector::inflect((uint64_t)__p, (uint64_t)(a1 + 3), v11, v12, (std::basic_string<char16_t> *)&v132, &v131);
      v130[0] = (void **)&v131;
      std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](v130);
      v131.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)&v132;
      std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v131);
      for (i = 0; i != -48; i -= 24)
      {
        if ((char)v139[i + 31] < 0)
          operator delete(*(void **)&v139[i + 8]);
      }
      v16 = v116;
      if (v116)
      {
        if ((v115 & 0x80000000) == 0)
        {
          v17 = (std::basic_string<char16_t> *)__p;
          goto LABEL_122;
        }
        v17 = (std::basic_string<char16_t> *)__p;
        goto LABEL_124;
      }
      v18 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_DUAL(v14);
      v19 = *(unsigned __int8 *)(v18 + 23);
      v20 = (char)v19;
      if ((v19 & 0x80u) != 0)
        v19 = *(_QWORD *)(v18 + 8);
      if (v9 == v19)
      {
        if (!v9)
          goto LABEL_58;
        if (v20 >= 0)
          v21 = (unsigned __int16 *)v18;
        else
          v21 = *(unsigned __int16 **)v18;
        p_s = (std::basic_string<char16_t> *)__s.__r_.__value_.__r.__words[0];
        if (v8 >= 0)
          p_s = &__s;
        v23 = v9;
        while (*v21 == (unsigned __int16)p_s->__r_.__value_.__s.__data_[0])
        {
          p_s = (std::basic_string<char16_t> *)((char *)p_s + 2);
          ++v21;
          if (!--v23)
            goto LABEL_58;
        }
      }
      v24 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL((morphun::grammar::synthesis::GrammemeConstants *)v18);
      v25 = *(unsigned __int8 *)(v24 + 23);
      v26 = (char)v25;
      if ((v25 & 0x80u) != 0)
        v25 = *(_QWORD *)(v24 + 8);
      if (v9 != v25)
        goto LABEL_121;
      if (v9)
      {
        if (v26 >= 0)
          v27 = (unsigned __int16 *)v24;
        else
          v27 = *(unsigned __int16 **)v24;
        v28 = (std::basic_string<char16_t> *)__s.__r_.__value_.__r.__words[0];
        if (v8 >= 0)
          v28 = &__s;
        while (*v27 == (unsigned __int16)v28->__r_.__value_.__s.__data_[0])
        {
          v28 = (std::basic_string<char16_t> *)((char *)v28 + 2);
          ++v27;
          if (!--v9)
            goto LABEL_58;
        }
LABEL_121:
        v17 = &v113;
        if ((SHIBYTE(v113.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_122:
          v110 = *v17;
          if (!v16)
            goto LABEL_127;
          goto LABEL_125;
        }
LABEL_124:
        std::basic_string<char16_t>::__init_copy_ctor_external(&v110, v17->__r_.__value_.__l.__data_, v17->__r_.__value_.__l.__size_);
        if (!v16)
          goto LABEL_127;
        goto LABEL_125;
      }
LABEL_58:
      memset(&v118, 0, sizeof(v118));
      v29 = HIBYTE(v113.__r_.__value_.__r.__words[2]);
      v30 = &v113;
      if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      {
        v29 = v113.__r_.__value_.__l.__size_;
        v30 = (std::basic_string<char16_t> *)v113.__r_.__value_.__r.__words[0];
      }
      v138 = 0uLL;
      *(_QWORD *)v139 = &word_1CB73EE14;
      *(_QWORD *)&v139[8] = 1;
      *(_QWORD *)&v139[16] = v30;
      *(_QWORD *)&v139[24] = v29;
      *(_QWORD *)&v140 = v29;
      if ((int)v29 >= 1)
        morphun::util::DelimitedStringIterator::getNext((UChar *)&v138);
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 1;
      while (1)
      {
        if (SDWORD1(v140) >= (int)v140)
        {
          v35 = HIBYTE(v118.__r_.__value_.__r.__words[2]);
          v36 = v118.__r_.__value_.__l.__size_;
          if (!*((_QWORD *)&v138 + 1))
          {
            if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v50 = HIBYTE(v118.__r_.__value_.__r.__words[2]);
            else
              v50 = v118.__r_.__value_.__l.__size_;
            if (v50)
              v51 = 0;
            else
              v51 = v31 == v32;
            if (v51)
            {
              if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0)
                std::basic_string<char16_t>::__init_copy_ctor_external(&v110, v113.__r_.__value_.__l.__data_, v113.__r_.__value_.__l.__size_);
              else
                v110 = v113;
              goto LABEL_274;
            }
            if (((v31 != v32) & v34) != 1)
            {
              if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v65 = &v118;
              else
                v65 = (std::basic_string<char16_t> *)v118.__r_.__value_.__r.__words[0];
              (*(void (**)(std::basic_string<char16_t> *__return_ptr, uint64_t *, std::basic_string<char16_t> *, std::basic_string<char16_t>::size_type))(*a1 + 32))(&v110, a1, v65, v50);
              if (v31 != v32)
              {
                v66 = v31;
                do
                {
                  std::basic_string<char16_t>::push_back(&v110, 32);
                  (*(void (**)(__int128 *__return_ptr, uint64_t *, _QWORD, _QWORD))(*a1 + 32))(&v138, a1, *(_QWORD *)v66, *((_QWORD *)v66 + 1));
                  if (v139[7] >= 0)
                    v67 = (const std::basic_string<char16_t>::value_type *)&v138;
                  else
                    v67 = (const std::basic_string<char16_t>::value_type *)v138;
                  if (v139[7] >= 0)
                    v68 = v139[7];
                  else
                    v68 = *((_QWORD *)&v138 + 1);
                  std::basic_string<char16_t>::append(&v110, v67, v68);
                  if ((v139[7] & 0x80000000) != 0)
                    operator delete((void *)v138);
                  v66 += 16;
                }
                while (v66 != v32);
              }
              goto LABEL_274;
            }
            v126 = 0;
            if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v52 = &v118;
            else
              v52 = (std::basic_string<char16_t> *)v118.__r_.__value_.__r.__words[0];
            if (!morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(a1[1], (uint64_t)&v126, (const UChar *)v52, v50))
            {
              memset(&v117, 0, sizeof(v117));
              goto LABEL_251;
            }
            if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v53 = &v118;
            else
              v53 = (std::basic_string<char16_t> *)v118.__r_.__value_.__r.__words[0];
            if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v54 = HIBYTE(v118.__r_.__value_.__r.__words[2]);
            else
              v54 = v118.__r_.__value_.__l.__size_;
            morphun::dictionary::DictionaryMetaData::getPropertyValues(a1[1], (const UChar *)v53, v54, (unsigned __int16 *)"i", 0xAuLL, &v124);
            if (v124 == v125)
            {
              memset(&v117, 0, sizeof(v117));
              goto LABEL_248;
            }
            morphun::dictionary::DictionaryMetaData::getPropertyName((morphun::dictionary::DictionaryMetaData *)a1[1], (int8x8_t)(a1[35] & v126), (uint64_t)v122);
            v56 = morphun::grammar::synthesis::GrammemeConstants::CASE_GENITIVE(v55);
            v57 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL((morphun::grammar::synthesis::GrammemeConstants *)v56);
            v119 = 0;
            v120 = 0;
            v121 = 0;
            v58 = v124;
            if (v124 != v125)
            {
              v59 = v57;
              v60 = a1[2];
              if (*(char *)(v124 + 23) < 0)
              {
                v58 = *(_QWORD *)v124;
                v61 = *(_QWORD *)(v124 + 8);
              }
              else
              {
                LODWORD(v61) = *(unsigned __int8 *)(v124 + 23);
              }
              KeyId = morphun::dictionary::metadata::MarisaTrie<int>::getKeyId((marisa::Trie *)(v60 + 248), v58, v61);
              InflectionPattern = morphun::dictionary::Inflector_MMappedDictionary::getInflectionPattern((morphun::dictionary::Inflector_MMappedDictionary *)&v132, v60 + 8, KeyId);
              v138 = v132;
              *(_OWORD *)v139 = v133[0];
              *(_OWORD *)&v139[16] = v133[1];
              LOBYTE(v140) = 1;
              if (!WORD1(v133[0]))
              {
                if (SHIBYTE(v118.__r_.__value_.__r.__words[2]) < 0)
                  std::basic_string<char16_t>::__init_copy_ctor_external(&v117, v118.__r_.__value_.__l.__data_, v118.__r_.__value_.__l.__size_);
                else
                  v117 = v118;
                goto LABEL_244;
              }
              *(_OWORD *)&v131.__r_.__value_.__r.__words[1] = 0uLL;
              v131.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)&v131.__r_.__value_.__l.__size_;
              v71 = *(unsigned __int8 *)(v56 + 23);
              if ((v71 & 0x80u) != 0)
                v71 = *(_QWORD *)(v56 + 8);
              if (v71)
              {
                InflectionPattern = morphun::grammar::synthesis::GrammemeConstants::CASE_GENITIVE((morphun::grammar::synthesis::GrammemeConstants *)InflectionPattern);
                v72 = *(unsigned __int8 *)(v56 + 23);
                v73 = (char)v72;
                if ((v72 & 0x80u) != 0)
                  v72 = *(_QWORD *)(v56 + 8);
                v74 = *(unsigned __int8 *)(InflectionPattern + 23);
                v75 = (char)v74;
                if ((v74 & 0x80u) != 0)
                  v74 = *(_QWORD *)(InflectionPattern + 8);
                if (v72 == v74)
                {
                  if (v72)
                  {
                    if (v75 >= 0)
                      v76 = (unsigned __int16 *)InflectionPattern;
                    else
                      v76 = *(unsigned __int16 **)InflectionPattern;
                    if (v73 >= 0)
                      v77 = (unsigned __int16 *)v56;
                    else
                      v77 = *(unsigned __int16 **)v56;
                    while (*v76 == *v77)
                    {
                      ++v77;
                      ++v76;
                      if (!--v72)
                        goto LABEL_186;
                    }
                  }
                  else
                  {
LABEL_186:
                    v78 = (unsigned __int16 *)morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_CONSTRUCT((morphun::grammar::synthesis::GrammemeConstants *)InflectionPattern);
                    InflectionPattern = (uint64_t)std::__tree<std::basic_string<char16_t>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::basic_string<char16_t> const&>((uint64_t **)&v131, v78, (uint64_t)v78);
                  }
                }
              }
              v79 = *(unsigned __int8 *)(v59 + 23);
              if ((v79 & 0x80u) != 0)
                v79 = *(_QWORD *)(v59 + 8);
              if (!v79)
                v59 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_SINGULAR((morphun::grammar::synthesis::GrammemeConstants *)InflectionPattern);
              std::__tree<std::basic_string<char16_t>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::basic_string<char16_t> const&>((uint64_t **)&v131, (unsigned __int16 *)v59, v59);
              v80 = v123;
              if ((v123 & 0x80u) != 0)
                v80 = (unint64_t)v122[1];
              if (v80)
              {
                std::__tree<std::basic_string<char16_t>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::basic_string<char16_t> const&>((uint64_t **)&v131, (unsigned __int16 *)v122, (uint64_t)v122);
              }
              else
              {
                v127 = 0;
                if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v81 = &v118;
                else
                  v81 = (std::basic_string<char16_t> *)v118.__r_.__value_.__r.__words[0];
                if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v82 = HIBYTE(v118.__r_.__value_.__r.__words[2]);
                else
                  v82 = v118.__r_.__value_.__l.__size_;
                if (morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(a1[1], (uint64_t)&v127, (const UChar *)v81, v82))
                {
                  v83 = (unint64_t)v127;
                  v84 = a1[35];
                  v85 = (morphun::dictionary::DictionaryMetaData_MMappedDictionary *)npc<morphun::dictionary::DictionaryMetaData_MMappedDictionary>(*(_QWORD *)(a1[1] + 8));
                  morphun::dictionary::DictionaryMetaData_MMappedDictionary::getTypesOfValues(v85, v84 & v83, (uint64_t *)&v132);
                  v86 = (unsigned __int16 *)*((_QWORD *)&v132 + 1);
                  for (j = (unsigned __int16 *)v132; j != v86; j += 12)
                    std::__tree<std::basic_string<char16_t>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::basic_string<char16_t> const&>((uint64_t **)&v131, j, (uint64_t)j);
                  v130[0] = (void **)&v132;
                  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](v130);
                }
              }
              v88 = v131.__r_.__value_.__r.__words[0];
              v128 = 0;
              v129 = 0;
              v127 = 0;
              if ((std::basic_string<char16_t>::size_type *)v131.__r_.__value_.__l.__data_ != &v131.__r_.__value_.__r.__words[1])
              {
                v89 = 0;
                v90 = v131.__r_.__value_.__r.__words[0];
                do
                {
                  v91 = v89;
                  v92 = *(std::basic_string<char16_t> **)(v90 + 8);
                  if (v92)
                  {
                    do
                    {
                      v93 = v92;
                      v92 = (std::basic_string<char16_t> *)v92->__r_.__value_.__r.__words[0];
                    }
                    while (v92);
                  }
                  else
                  {
                    do
                    {
                      v93 = *(std::basic_string<char16_t> **)(v90 + 16);
                      v47 = v93->__r_.__value_.__r.__words[0] == v90;
                      v90 = (std::basic_string<char16_t>::size_type)v93;
                    }
                    while (!v47);
                  }
                  ++v89;
                  v90 = (std::basic_string<char16_t>::size_type)v93;
                }
                while (v93 != (std::basic_string<char16_t> *)&v131.__r_.__value_.__r.__words[1]);
                v134 = (void **)&v127;
                v135 = 0;
                if (v91 >= 0xAAAAAAAAAAAAAAALL)
                  std::vector<std::pair<morphun::dialog::DefaultArticleLookupFunction const*,std::vector<std::pair<std::basic_string<char16_t>,std::vector<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>> const>>::__throw_length_error[abi:ne180100]();
                v127 = (std::basic_string<char16_t> *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<std::basic_string<char16_t>>>>(v89);
                v128 = v127;
                v129 = &v127[v94];
                v136 = v127;
                v137 = v127;
                *(_QWORD *)&v132 = &v129;
                *((_QWORD *)&v132 + 1) = &v136;
                *(_QWORD *)&v133[0] = &v137;
                BYTE8(v133[0]) = 0;
                v95 = v127;
                do
                {
                  if (*(char *)(v88 + 55) < 0)
                  {
                    std::basic_string<char16_t>::__init_copy_ctor_external(v95, *(const std::basic_string<char16_t>::value_type **)(v88 + 32), *(_QWORD *)(v88 + 40));
                  }
                  else
                  {
                    v96 = *(_OWORD *)(v88 + 32);
                    v95->__r_.__value_.__r.__words[2] = *(_QWORD *)(v88 + 48);
                    *(_OWORD *)&v95->__r_.__value_.__l.__data_ = v96;
                  }
                  v97 = *(std::basic_string<char16_t> **)(v88 + 8);
                  if (v97)
                  {
                    do
                    {
                      v98 = v97;
                      v97 = (std::basic_string<char16_t> *)v97->__r_.__value_.__r.__words[0];
                    }
                    while (v97);
                  }
                  else
                  {
                    do
                    {
                      v98 = *(std::basic_string<char16_t> **)(v88 + 16);
                      v47 = v98->__r_.__value_.__r.__words[0] == v88;
                      v88 = (std::basic_string<char16_t>::size_type)v98;
                    }
                    while (!v47);
                  }
                  v95 = ++v137;
                  v88 = (std::basic_string<char16_t>::size_type)v98;
                }
                while (v98 != (std::basic_string<char16_t> *)&v131.__r_.__value_.__r.__words[1]);
                BYTE8(v133[0]) = 1;
                std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&v132);
                v128 = v95;
              }
              morphun::dictionary::Inflector_InflectionPattern::constrain((unint64_t *)v130, (uint64_t)&v138, (uint64_t *)&v127, 0);
              *(_QWORD *)&v132 = &v127;
              std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v132);
              v99 = v130[0];
              if (v130[0] != v130[1])
              {
                morphun::dictionary::Inflector_Inflection::inflect((std::basic_string<char16_t> *)&v132, (int *)v130[0], &v118);
                if (v121 >= 0)
                  v100 = (unsigned __int16 *)&v119;
                else
                  v100 = (unsigned __int16 *)v119;
                if (v121 >= 0)
                  v101 = HIBYTE(v121);
                else
                  v101 = v120;
                morphun::grammar::synthesis::HeGrammarSynthesizer_HeDisplayFunction::applyDefiniteness(&v117, (uint64_t)&v132, v100, v101);
                if (SBYTE7(v133[0]) < 0)
                  operator delete((void *)v132);
                if (v99)
                  operator delete(v99);
                std::__tree<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>>>::destroy((char *)v131.__r_.__value_.__l.__size_);
LABEL_244:
                if (SHIBYTE(v121) < 0)
                  operator delete(v119);
                if ((char)v123 < 0)
                  operator delete(v122[0]);
LABEL_248:
                *(_QWORD *)&v138 = &v124;
                std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v138);
                v102 = HIBYTE(v117.__r_.__value_.__r.__words[2]);
                v103 = v117.__r_.__value_.__l.__size_;
                if ((v117.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v103 = HIBYTE(v117.__r_.__value_.__r.__words[2]);
                if (!v103)
                {
LABEL_251:
                  if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                    v104 = &v118;
                  else
                    v104 = (std::basic_string<char16_t> *)v118.__r_.__value_.__r.__words[0];
                  if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                    v105 = HIBYTE(v118.__r_.__value_.__r.__words[2]);
                  else
                    v105 = v118.__r_.__value_.__l.__size_;
                  (*(void (**)(__int128 *__return_ptr, uint64_t *, std::basic_string<char16_t> *, std::basic_string<char16_t>::size_type))(*a1 + 32))(&v138, a1, v104, v105);
                  v106 = v139[7];
                  if (v139[7] < 0)
                    v106 = *((_QWORD *)&v138 + 1);
                  if (v106)
                  {
                    v107 = v106 - 1;
                    v108 = &v138;
                    if (v139[7] < 0)
                      v108 = (__int128 *)v138;
                    if (*((_WORD *)v108 + v107) == 1501)
                      std::basic_string<char16_t>::resize((std::basic_string<char16_t> *)&v138, v107, 0);
                  }
                  if (SHIBYTE(v117.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(v117.__r_.__value_.__l.__data_);
                  v117.__r_.__value_.__r.__words[2] = *(_QWORD *)v139;
                  *(_OWORD *)&v117.__r_.__value_.__l.__data_ = v138;
                  v102 = v139[7];
                }
                if (v102 < 0)
                  std::basic_string<char16_t>::__init_copy_ctor_external(&v110, v117.__r_.__value_.__l.__data_, v117.__r_.__value_.__l.__size_);
                else
                  v110 = v117;
                v109 = v31;
                do
                {
                  std::basic_string<char16_t>::push_back(&v110, 32);
                  std::basic_string<char16_t>::append(&v110, *(const std::basic_string<char16_t>::value_type **)v109, *((_QWORD *)v109 + 1));
                  v109 += 16;
                }
                while (v109 != v32);
                if (SHIBYTE(v117.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v117.__r_.__value_.__l.__data_);
LABEL_274:
                if (v31)
                  operator delete(v31);
                if (SHIBYTE(v118.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v118.__r_.__value_.__l.__data_);
                if (!v116)
                {
LABEL_127:
                  if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(v113.__r_.__value_.__l.__data_);
                  v113 = v110;
                  break;
                }
LABEL_125:
                if (v115 < 0)
                  operator delete(__p[0]);
                goto LABEL_127;
              }
              if (v130[0])
                operator delete(v130[0]);
              std::__tree<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>>>::destroy((char *)v131.__r_.__value_.__l.__size_);
            }
            memset(&v117, 0, sizeof(v117));
            goto LABEL_244;
          }
        }
        else
        {
          v35 = HIBYTE(v118.__r_.__value_.__r.__words[2]);
          v36 = v118.__r_.__value_.__l.__size_;
        }
        if ((v35 & 0x80u) != 0)
          v35 = v36;
        v37 = v138;
        if (v35)
        {
          if ((unint64_t)v32 >= v33)
          {
            v38 = (v32 - v31) >> 4;
            v39 = v38 + 1;
            if ((unint64_t)(v38 + 1) >> 60)
              std::vector<std::pair<morphun::dialog::DefaultArticleLookupFunction const*,std::vector<std::pair<std::basic_string<char16_t>,std::vector<std::pair<morphun::dialog::SemanticFeature const* const,std::basic_string<char16_t>>>>> const>>::__throw_length_error[abi:ne180100]();
            if ((uint64_t)(v33 - (_QWORD)v31) >> 3 > v39)
              v39 = (uint64_t)(v33 - (_QWORD)v31) >> 3;
            if (v33 - (unint64_t)v31 >= 0x7FFFFFFFFFFFFFF0)
              v40 = 0xFFFFFFFFFFFFFFFLL;
            else
              v40 = v39;
            if (v40)
              v40 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::u16string_view>>(v40);
            else
              v41 = 0;
            v42 = (__int128 *)(v40 + 16 * v38);
            *v42 = v37;
            if (v32 == v31)
            {
              v44 = (char *)(v40 + 16 * v38);
            }
            else
            {
              v43 = v40 + 16 * v38;
              do
              {
                v44 = (char *)(v43 - 16);
                *(_OWORD *)(v43 - 16) = *((_OWORD *)v32 - 1);
                v32 -= 16;
                v43 -= 16;
              }
              while (v32 != v31);
            }
            v33 = v40 + 16 * v41;
            v32 = (char *)(v42 + 1);
            if (v31)
              operator delete(v31);
            v31 = v44;
          }
          else
          {
            *(_OWORD *)v32 = v138;
            v32 += 16;
          }
          v45 = a1[1];
          v46 = a1[36];
          *(_QWORD *)&v132 = 0;
          if (morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(v45, (uint64_t)&v132, (const UChar *)v138, *((uint64_t *)&v138 + 1)))
          {
            v47 = ((unint64_t)v132 & v46) == v46;
          }
          else
          {
            v47 = 0;
          }
          if (!v47
            || (v48 = a1[1],
                v49 = a1[37],
                *(_QWORD *)&v132 = 0,
                morphun::dictionary::DictionaryMetaData::getCombinedBinaryType(v48, (uint64_t)&v132, (const UChar *)v138, *((uint64_t *)&v138 + 1)))&& ((unint64_t)v132 & v49) == v49)
          {
            v34 = 0;
          }
        }
        else
        {
          std::basic_string<char16_t>::__assign_external(&v118, (const std::basic_string<char16_t>::value_type *)v138, *((std::basic_string<char16_t>::size_type *)&v138 + 1));
        }
        morphun::util::DelimitedStringIterator::operator++((morphun::util::DelimitedStringIterator *)&v138);
      }
    }
    morphun::grammar::synthesis::GrammarSynthesizerUtil::getFeatureValue((std::basic_string<char16_t> *)&v138, a3, a1[34]);
    if ((v139[7] & 0x80000000) != 0)
    {
      v62 = *((_QWORD *)&v138 + 1);
      if (!*((_QWORD *)&v138 + 1))
        goto LABEL_138;
      v63 = (unsigned __int16 *)v138;
    }
    else
    {
      v62 = v139[7];
      if (!v139[7])
        goto LABEL_138;
      v63 = (unsigned __int16 *)&v138;
    }
    morphun::grammar::synthesis::HeGrammarSynthesizer_HeDisplayFunction::applyDefiniteness((std::basic_string<char16_t> *)&v132, (uint64_t)&v113, v63, v62);
    if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v113.__r_.__value_.__l.__data_);
    *(_OWORD *)&v113.__r_.__value_.__l.__data_ = v132;
    v113.__r_.__value_.__r.__words[2] = *(_QWORD *)&v133[0];
LABEL_138:
    v13 = operator new();
    morphun::dialog::SemanticFeatureModel_DisplayValue::SemanticFeatureModel_DisplayValue(v13, (__int128 *)&v113, a3);
    if ((v139[7] & 0x80000000) != 0)
      operator delete((void *)v138);
    if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v111.__r_.__value_.__l.__data_);
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__s.__r_.__value_.__l.__data_);
    if ((*((_BYTE *)&v113.__r_.__value_.__s + 23) & 0x80) != 0)
      goto LABEL_145;
    return v13;
  }
  v13 = 0;
  if ((*((_BYTE *)&v113.__r_.__value_.__s + 23) & 0x80) != 0)
LABEL_145:
    operator delete(v113.__r_.__value_.__l.__data_);
  return v13;
}

void sub_1CB5C3AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,char a40,void *a41,uint64_t a42,uint64_t a43,uint64_t a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,void *__p,uint64_t a52,int a53,__int16 a54,char a55,char a56,void *a57,uint64_t a58,int a59,__int16 a60,char a61,char a62,char a63)
{
  uint64_t a70;
  uint64_t a72;
  void *v72;

  std::__tree<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,morphun::grammar::synthesis::SvGrammarSynthesizer::Count>>>::destroy((char *)a72);
  if (a56 < 0)
    operator delete(__p);
  if (a62 < 0)
    operator delete(a57);
  a70 = (uint64_t)&a63;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a70);
  if (v72)
    operator delete(v72);
  if (a50 < 0)
    operator delete(a45);
  if (a40 && a39 < 0)
    operator delete(a34);
  if (a20 < 0)
    operator delete(a15);
  if (a26 < 0)
    operator delete(a21);
  if (a32 < 0)
    operator delete(a27);
  _Unwind_Resume(a1);
}

double morphun::grammar::synthesis::HeGrammarSynthesizer_HeDisplayFunction::singleWordStemToPlural@<D0>(char *__src@<X1>, unint64_t a2@<X2>, std::allocator<char16_t> *a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t *v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double result;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  unint64_t v23;
  std::basic_string<char16_t>::size_type v24;
  uint64_t v25;
  uint64_t *v26;
  std::basic_string<char16_t>::size_type v27;
  int v28;
  int v29;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  int v46;
  int v47;
  const std::basic_string<char16_t>::value_type *v49;
  std::basic_string<char16_t>::size_type v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  int v54;
  int v55;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  int v63;
  int v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __int128 *v85;
  const void *v86;
  char *v87;
  std::basic_string<char16_t> __p;
  __int128 v89;
  uint64_t v90;

  v4 = a4;
  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
  if (a2 >= 0xB)
  {
    v8 = (a2 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((a2 | 3) != 0xB)
      v8 = a2 | 3;
    v7 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v8 + 1);
    v4[1] = a2;
    v4[2] = v9 | 0x8000000000000000;
    *v4 = (uint64_t)v7;
  }
  else
  {
    *((_BYTE *)a4 + 23) = a2;
    v7 = a4;
    if (!a2)
      goto LABEL_9;
  }
  memmove(v7, __src, 2 * a2);
LABEL_9:
  v11 = 0;
  *((_WORD *)v7 + a2) = 0;
  do
  {
    v12 = *((unsigned __int8 *)v4 + 23);
    v13 = (char)v12;
    if ((v12 & 0x80u) != 0)
      v12 = v4[1];
    if (v12)
    {
      v14 = v13 >= 0 ? (uint64_t)v4 : *v4;
      v15 = v12 - 1;
      if (morphun::grammar::synthesis::FINAL_TO_MEDIAL_SUBSTITUTION[v11] == *(_WORD *)(v14 + 2 * v15))
        *(_WORD *)(v14 + 2 * v15) = morphun::grammar::synthesis::FINAL_TO_MEDIAL_SUBSTITUTION[v11 + 1];
    }
    v11 += 2;
  }
  while (v11 != 10);
  if (a2 == 3)
  {
    v16 = 0;
    while (*(unsigned __int16 *)&__src[v16 * 2] == (unsigned __int16)word_1CB73EE18[v16])
    {
      if (++v16 == 3)
      {
        if (*((char *)v4 + 23) < 0)
        {
          v4[1] = 5;
          v4 = (uint64_t *)*v4;
        }
        else
        {
          *((_BYTE *)v4 + 23) = 5;
        }
        *((_DWORD *)v4 + 2) = 1501;
        v33 = &qword_1CB73EE20;
        goto LABEL_135;
      }
    }
  }
  if (a2 != 2)
  {
    if (a2 == 4)
    {
      v18 = 0;
      while (*(unsigned __int16 *)&__src[v18 * 2] == (unsigned __int16)word_1CB73EE38[v18])
      {
        if (++v18 == 4)
        {
          if (*((char *)v4 + 23) < 0)
          {
            v4[1] = 4;
            v4 = (uint64_t *)*v4;
          }
          else
          {
            *((_BYTE *)v4 + 23) = 4;
          }
          v40 = 99157472;
LABEL_117:
          v42 = v40 | 0x5DD05D900000000;
          goto LABEL_132;
        }
      }
    }
    if (a2 == 3)
    {
      v19 = 0;
      while (*(unsigned __int16 *)&__src[v19 * 2] == (unsigned __int16)word_1CB73EE42[v19])
      {
        if (++v19 == 3)
        {
          if (*((char *)v4 + 23) < 0)
          {
            v4[1] = 4;
            v4 = (uint64_t *)*v4;
          }
          else
          {
            *((_BYTE *)v4 + 23) = 4;
          }
          v40 = 98567657;
          goto LABEL_117;
        }
      }
    }
    if (a2 == 4)
    {
      v20 = 0;
      while (*(unsigned __int16 *)&__src[v20 * 2] == (unsigned __int16)word_1CB73EE4A[v20])
      {
        if (++v20 == 4)
        {
          if (*((char *)v4 + 23) < 0)
          {
            v4[1] = 5;
            v4 = (uint64_t *)*v4;
          }
          else
          {
            *((_BYTE *)v4 + 23) = 5;
          }
          *((_DWORD *)v4 + 2) = 1501;
          v33 = &qword_1CB73EE54;
          goto LABEL_135;
        }
      }
    }
    if (a2 == 5)
    {
      v21 = 0;
      while (*(unsigned __int16 *)&__src[v21 * 2] == (unsigned __int16)word_1CB73EE60[v21])
      {
        if (++v21 == 5)
          goto LABEL_257;
      }
    }
    if (a2 == 4)
    {
      v32 = 0;
      while (*(unsigned __int16 *)&__src[v32 * 2] == (unsigned __int16)word_1CB73EE6C[v32])
      {
        if (++v32 == 4)
          goto LABEL_257;
      }
    }
    if (a2 == 5)
    {
      v34 = 0;
      while (*(unsigned __int16 *)&__src[v34 * 2] == (unsigned __int16)word_1CB73EE76[v34])
      {
        if (++v34 == 5)
          goto LABEL_257;
      }
    }
    if (a2 == 4)
    {
      v35 = 0;
      while (*(unsigned __int16 *)&__src[v35 * 2] == (unsigned __int16)word_1CB73EE82[v35])
      {
        if (++v35 == 4)
          goto LABEL_257;
      }
    }
    if (a2 == 5)
    {
      v36 = 0;
      while (*(unsigned __int16 *)&__src[v36 * 2] == (unsigned __int16)word_1CB73EE8C[v36])
      {
        if (++v36 == 5)
          goto LABEL_257;
      }
    }
    if (a2 == 6)
    {
      v39 = 0;
      while (*(unsigned __int16 *)&__src[v39 * 2] == (unsigned __int16)word_1CB73EE98[v39])
      {
        if (++v39 == 6)
          goto LABEL_257;
      }
    }
    if (a2 == 5)
    {
      v41 = 0;
      while (*(unsigned __int16 *)&__src[v41 * 2] == (unsigned __int16)word_1CB73EEA6[v41])
      {
        if (++v41 == 5)
          goto LABEL_257;
      }
      v57 = 0;
      while (*(unsigned __int16 *)&__src[v57 * 2] == (unsigned __int16)word_1CB73EEB2[v57])
      {
        if (++v57 == 5)
          goto LABEL_257;
      }
    }
    if (a2 == 4)
    {
      v58 = 0;
      while (*(unsigned __int16 *)&__src[v58 * 2] == (unsigned __int16)word_1CB73EEBE[v58])
      {
        if (++v58 == 4)
          goto LABEL_257;
      }
      v66 = 0;
      while (*(unsigned __int16 *)&__src[v66 * 2] == (unsigned __int16)word_1CB73EEC8[v66])
      {
        if (++v66 == 4)
          goto LABEL_257;
      }
      v59 = 1;
    }
    else
    {
      v59 = 0;
    }
    if (a2 == 5)
    {
      v67 = 0;
      while (*(unsigned __int16 *)&__src[v67 * 2] == (unsigned __int16)word_1CB73EED2[v67])
      {
        if (++v67 == 5)
          goto LABEL_257;
      }
    }
    if (v59)
    {
      v68 = 0;
      while (*(unsigned __int16 *)&__src[v68 * 2] == (unsigned __int16)word_1CB73EEDE[v68])
      {
        if (++v68 == 4)
          goto LABEL_257;
      }
    }
    if (a2 == 3)
    {
      v69 = 0;
      while (*(unsigned __int16 *)&__src[v69 * 2] == (unsigned __int16)word_1CB73EEE8[v69])
      {
        if (++v69 == 3)
          goto LABEL_257;
      }
      v70 = 0;
      while (*(unsigned __int16 *)&__src[v70 * 2] == (unsigned __int16)word_1CB73EEF0[v70])
      {
        if (++v70 == 3)
          goto LABEL_257;
      }
      v71 = 0;
      while (*(unsigned __int16 *)&__src[v71 * 2] == (unsigned __int16)word_1CB73EEF8[v71])
      {
        if (++v71 == 3)
          goto LABEL_257;
      }
    }
    if (a2 == 5)
    {
      v72 = 0;
      while (*(unsigned __int16 *)&__src[v72 * 2] == (unsigned __int16)word_1CB73EF00[v72])
      {
        if (++v72 == 5)
          goto LABEL_257;
      }
    }
    if (v59)
    {
      v73 = 0;
      while (*(unsigned __int16 *)&__src[v73 * 2] == (unsigned __int16)word_1CB73EF0C[v73])
      {
        if (++v73 == 4)
          goto LABEL_257;
      }
    }
    if (a2 == 3)
    {
      v74 = 0;
      while (*(unsigned __int16 *)&__src[v74 * 2] == (unsigned __int16)word_1CB73EF16[v74])
      {
        if (++v74 == 3)
          goto LABEL_257;
      }
      v75 = 0;
      while (*(unsigned __int16 *)&__src[v75 * 2] == (unsigned __int16)word_1CB73EF1E[v75])
      {
        if (++v75 == 3)
          goto LABEL_257;
      }
    }
    if (v59)
    {
      v76 = 0;
      while (*(unsigned __int16 *)&__src[v76 * 2] == (unsigned __int16)word_1CB73EF26[v76])
      {
        if (++v76 == 4)
          goto LABEL_257;
      }
    }
    if (a2 == 5)
    {
      v77 = 0;
      while (*(unsigned __int16 *)&__src[v77 * 2] == (unsigned __int16)word_1CB73EF30[v77])
      {
        if (++v77 == 5)
          goto LABEL_257;
      }
    }
    if (a2 == 3)
    {
      v78 = 0;
      while (*(unsigned __int16 *)&__src[v78 * 2] == (unsigned __int16)word_1CB73EF3C[v78])
      {
        if (++v78 == 3)
          goto LABEL_257;
      }
      v79 = 0;
      while (*(unsigned __int16 *)&__src[v79 * 2] == (unsigned __int16)word_1CB73EF44[v79])
      {
        if (++v79 == 3)
          goto LABEL_257;
      }
    }
    if (v59)
    {
      v80 = 0;
      while (*(unsigned __int16 *)&__src[v80 * 2] == (unsigned __int16)word_1CB73EF4C[v80])
      {
        if (++v80 == 4)
          goto LABEL_257;
      }
    }
    if (a2 == 3)
    {
      v81 = 0;
      while (*(unsigned __int16 *)&__src[v81 * 2] == (unsigned __int16)word_1CB73EF56[v81])
      {
        if (++v81 == 3)
          goto LABEL_257;
      }
      v82 = 0;
      while (*(unsigned __int16 *)&__src[v82 * 2] == (unsigned __int16)word_1CB73EF5E[v82])
      {
        if (++v82 == 3)
          goto LABEL_257;
      }
    }
    if (v59)
    {
      v83 = 0;
      while (*(unsigned __int16 *)&__src[v83 * 2] == (unsigned __int16)word_1CB73EF66[v83])
      {
        if (++v83 == 4)
          goto LABEL_257;
      }
    }
    goto LABEL_59;
  }
  v17 = *(unsigned __int16 *)__src;
  if (v17 == 1489)
  {
    if (*((_WORD *)__src + 1) == 1514)
    {
      if (*((char *)v4 + 23) < 0)
      {
        v4[1] = 4;
        v4 = (uint64_t *)*v4;
      }
      else
      {
        *((_BYTE *)v4 + 23) = 4;
      }
      v42 = 0x5EA05D505E005D1;
LABEL_132:
      *v4 = v42;
      *((_WORD *)v4 + 4) = 0;
      return result;
    }
LABEL_59:
    v22 = *((char *)v4 + 23);
    v23 = v4[1];
    if (v22 >= 0)
      v23 = *((unsigned __int8 *)v4 + 23);
    v24 = v23 - 2;
    if (v23 >= 2)
    {
      v25 = 0;
      v26 = (uint64_t *)*v4;
      if (v22 >= 0)
        v26 = v4;
      v27 = (std::basic_string<char16_t>::size_type)v26 + 2 * v24;
      do
      {
        v28 = *(unsigned __int16 *)(v27 + v25 * 2);
        v29 = (unsigned __int16)word_1CB73EF76[v25];
      }
      while (v29 == v28 && v25++ != 1);
      if (v29 == v28)
        goto LABEL_102;
    }
    if (!v23)
      return result;
    v24 = v23 - 1;
    v31 = (uint64_t *)*v4;
    if (v22 >= 0)
      v31 = v4;
    if (*((_WORD *)v31 + v24) == 1492)
      goto LABEL_102;
    v37 = v23 - 2;
    if (v23 >= 2)
    {
      v43 = 0;
      v44 = (uint64_t *)*v4;
      if (v22 >= 0)
        v44 = v4;
      v45 = (uint64_t)v44 + 2 * v37;
      do
      {
        v46 = *(unsigned __int16 *)(v45 + v43 * 2);
        v47 = (unsigned __int16)word_1CB73EF80[v43];
      }
      while (v47 == v46 && v43++ != 1);
      if (v47 == v46)
      {
        v49 = word_1CB73EE10;
        v50 = 1;
        goto LABEL_137;
      }
      v51 = 0;
      v52 = (uint64_t *)*v4;
      if (v22 >= 0)
        v52 = v4;
      v53 = (uint64_t)v52 + 2 * v37;
      do
      {
        v54 = *(unsigned __int16 *)(v53 + v51 * 2);
        v55 = (unsigned __int16)word_1CB73EF86[v51];
      }
      while (v55 == v54 && v51++ != 1);
      if (v55 == v54)
      {
        std::basic_string<char16_t>::basic_string(&__p, (const std::basic_string<char16_t> *)v4, 0, v23 - 2, a3);
        std::operator+[abi:ne180100]<char16_t,std::char_traits<char16_t>,std::allocator<char16_t>>((uint64_t)&v89, &__p, (std::basic_string<char16_t>::value_type *)word_1CB73EF8C);
        goto LABEL_168;
      }
      v60 = 0;
      v61 = (uint64_t *)*v4;
      if (v22 >= 0)
        v61 = v4;
      v62 = (uint64_t)v61 + 2 * v37;
      do
      {
        v63 = *(unsigned __int16 *)(v62 + v60 * 2);
        v64 = (unsigned __int16)word_1CB73EF70[v60];
      }
      while (v64 == v63 && v60++ != 1);
      if (v64 == v63)
      {
        std::basic_string<char16_t>::basic_string(&__p, (const std::basic_string<char16_t> *)v4, 0, v23 - 2, a3);
        std::operator+[abi:ne180100]<char16_t,std::char_traits<char16_t>,std::allocator<char16_t>>((uint64_t)&v89, &__p, word_1CB73EF94);
        goto LABEL_168;
      }
    }
    v38 = (uint64_t *)*v4;
    if (v22 >= 0)
      v38 = v4;
    if (*((_WORD *)v38 + v24) == 1514)
    {
LABEL_102:
      std::basic_string<char16_t>::basic_string(&__p, (const std::basic_string<char16_t> *)v4, 0, v24, a3);
      std::operator+[abi:ne180100]<char16_t,std::char_traits<char16_t>,std::allocator<char16_t>>((uint64_t)&v89, &__p, word_1CB73EF70);
LABEL_168:
      if (*((char *)v4 + 23) < 0)
        operator delete((void *)*v4);
      result = *(double *)&v89;
      *(_OWORD *)v4 = v89;
      v4[2] = v90;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      return result;
    }
    v49 = word_1CB73EF9E;
    v50 = 2;
LABEL_137:
    std::basic_string<char16_t>::append((std::basic_string<char16_t> *)v4, v49, v50);
    return result;
  }
  if (v17 != 1510)
  {
    if (v17 == 1488 && *((_WORD *)__src + 1) == 1489)
    {
LABEL_257:
      if (*((char *)v4 + 23) >= 0)
        v84 = *((unsigned __int8 *)v4 + 23);
      else
        v84 = v4[1];
      v85 = &v89;
      std::basic_string<char16_t>::basic_string[abi:ne180100]((uint64_t)&v89, v84 + 2);
      if (v90 < 0)
        v85 = (__int128 *)v89;
      if (v84)
      {
        if (*((char *)v4 + 23) >= 0)
          v86 = v4;
        else
          v86 = (const void *)*v4;
        memmove(v85, v86, 2 * v84);
      }
      v87 = (char *)v85 + 2 * v84;
      *(_DWORD *)v87 = 99222997;
      *((_WORD *)v87 + 2) = 0;
      if (*((char *)v4 + 23) < 0)
        operator delete((void *)*v4);
      result = *(double *)&v89;
      *(_OWORD *)v4 = v89;
      v4[2] = v90;
      return result;
    }
    goto LABEL_59;
  }
  if (*((_WORD *)__src + 1) != 1500)
    goto LABEL_59;
  if (*((char *)v4 + 23) < 0)
  {
    v4[1] = 5;
    v4 = (uint64_t *)*v4;
  }
  else
  {
    *((_BYTE *)v4 + 23) = 5;
  }
  *((_DWORD *)v4 + 2) = 1501;
  v33 = &qword_1CB73EE2C;
LABEL_135:
  *v4 = *v33;
  return result;
}

void sub_1CB5C48E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;

  if (a14 < 0)
    operator delete(__p);
  if (*(char *)(v14 + 23) < 0)
    operator delete(*(void **)v14);
  _Unwind_Resume(exception_object);
}

void morphun::grammar::synthesis::HeGrammarSynthesizer_HeDisplayFunction::applyDefiniteness(std::basic_string<char16_t> *this, uint64_t a2, unsigned __int16 *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  unsigned __int16 *v11;
  unsigned __int8 v12;
  int v13;
  const std::basic_string<char16_t>::value_type *v14;
  uint64_t v15;
  unsigned int v16;
  std::basic_string<char16_t>::size_type v17;
  unint64_t v18;
  int v19;
  const std::basic_string<char16_t>::value_type *v20;
  std::basic_string<char16_t>::size_type v21;
  std::allocator<char16_t> *v22;
  std::basic_string<char16_t>::size_type v23;
  char v24;
  std::basic_string<char16_t>::size_type size;
  std::basic_string<char16_t>::size_type v26;
  std::basic_string<char16_t>::size_type v27;
  std::basic_string<char16_t> *v28;
  std::basic_string<char16_t> *v29;
  std::basic_string<char16_t>::size_type v30;
  _QWORD *v31;
  morphun::exception::NullPointerException *exception;
  std::basic_string<char16_t> v33;
  std::basic_string<char16_t> v34;

  v6 = *(unsigned __int8 *)(a2 + 23);
  if ((v6 & 0x80u) != 0)
    v6 = *(_QWORD *)(a2 + 8);
  if (!v6)
    goto LABEL_31;
  v9 = morphun::grammar::synthesis::GrammemeConstants::DEFINITENESS_DEFINITE((morphun::grammar::synthesis::GrammemeConstants *)this);
  v10 = *(unsigned __int8 *)(v9 + 23);
  if ((v10 & 0x80u) == 0)
    v11 = (unsigned __int16 *)v9;
  else
    v11 = *(unsigned __int16 **)v9;
  if ((v10 & 0x80u) != 0)
    v10 = *(_QWORD *)(v9 + 8);
  if (v10 != a4)
  {
LABEL_31:
    if (*(char *)(a2 + 23) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(this, *(const std::basic_string<char16_t>::value_type **)a2, *(_QWORD *)(a2 + 8));
    }
    else
    {
      *(_OWORD *)&this->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
      this->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 16);
    }
    return;
  }
  if (v10)
  {
    while (*a3 == *v11)
    {
      ++v11;
      ++a3;
      if (!--v10)
        goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_13:
  this->__r_.__value_.__r.__words[0] = 0;
  this->__r_.__value_.__l.__size_ = 0;
  this->__r_.__value_.__r.__words[2] = 0;
  if ((v12 & 1) == 0
  {
    v31 = (_QWORD *)operator new();
    icu4cxx::UnicodeSet::UnicodeSet((uint64_t)v31);
    MEMORY[0x1D179D970](*v31);
    morphun::grammar::synthesis::DEFINITENESS_COMPOUND_SPLITTER(void)::DEFINITENESS_COMPOUND_SPLITTER_ = (uint64_t)v31;
  }
  if (!morphun::grammar::synthesis::DEFINITENESS_COMPOUND_SPLITTER(void)::DEFINITENESS_COMPOUND_SPLITTER_)
  {
    exception = (morphun::exception::NullPointerException *)__cxa_allocate_exception(0x38uLL);
    morphun::exception::NullPointerException::NullPointerException(exception);
  }
  v13 = *(char *)(a2 + 23);
  if (v13 >= 0)
    v14 = (const std::basic_string<char16_t>::value_type *)a2;
  else
    v14 = *(const std::basic_string<char16_t>::value_type **)a2;
  if (v13 >= 0)
    v15 = *(unsigned __int8 *)(a2 + 23);
  else
    v15 = *(unsigned int *)(a2 + 8);
  v16 = MEMORY[0x1D179D9C4](*(_QWORD *)morphun::grammar::synthesis::DEFINITENESS_COMPOUND_SPLITTER(void)::DEFINITENESS_COMPOUND_SPLITTER_, v14, v15, 0);
  memset(&v34, 0, sizeof(v34));
  if ((v16 & 0x80000000) != 0)
  {
    std::basic_string<char16_t>::operator=(&v34, (const std::basic_string<char16_t> *)a2);
  }
  else
  {
    v17 = v16;
    v18 = *(unsigned __int8 *)(a2 + 23);
    v19 = (char)v18;
    if ((v18 & 0x80u) != 0)
      v18 = *(_QWORD *)(a2 + 8);
    if (v19 >= 0)
      v20 = (const std::basic_string<char16_t>::value_type *)a2;
    else
      v20 = *(const std::basic_string<char16_t>::value_type **)a2;
    if (v18 >= v16)
      v21 = v16;
    else
      v21 = v18;
    std::basic_string<char16_t>::append(this, v20, v21);
    std::basic_string<char16_t>::basic_string(&v33, (const std::basic_string<char16_t> *)a2, v17, 0xFFFFFFFFFFFFFFFFLL, v22);
    v34 = v33;
  }
  v23 = HIBYTE(v34.__r_.__value_.__r.__words[2]);
  v24 = HIBYTE(v34.__r_.__value_.__r.__words[2]);
  size = v34.__r_.__value_.__l.__size_;
  if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v26 = HIBYTE(v34.__r_.__value_.__r.__words[2]);
  else
    v26 = v34.__r_.__value_.__l.__size_;
  if (!v26)
    goto LABEL_42;
  v27 = v34.__r_.__value_.__r.__words[0];
  v28 = &v34;
  if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v28 = (std::basic_string<char16_t> *)v34.__r_.__value_.__r.__words[0];
  if (v28->__r_.__value_.__s.__data_[0] != 1492)
  {
LABEL_42:
    std::basic_string<char16_t>::append(this, word_1CB73EF7C, 1uLL);
    v23 = HIBYTE(v34.__r_.__value_.__r.__words[2]);
    size = v34.__r_.__value_.__l.__size_;
    v27 = v34.__r_.__value_.__r.__words[0];
    v24 = HIBYTE(v34.__r_.__value_.__r.__words[2]);
  }
  if (v24 >= 0)
    v29 = &v34;
  else
    v29 = (std::basic_string<char16_t> *)v27;
  if (v24 >= 0)
    v30 = v23;
  else
    v30 = size;
  std::basic_string<char16_t>::append(this, (const std::basic_string<char16_t>::value_type *)v29, v30);
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v34.__r_.__value_.__l.__data_);
}

void sub_1CB5C4BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  uint64_t v18;
  uint64_t v19;

  MEMORY[0x1D179D2EC](v19, 0x1020C405F07FB98);
  if (*(char *)(v18 + 23) < 0)
    operator delete(*(void **)v18);
  _Unwind_Resume(a1);
}

void sub_1CB5C4C88(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void morphun::analysis::stemmer::RussianExposableMorphology::~RussianExposableMorphology(morphun::analysis::stemmer::RussianExposableMorphology *this)
{
  morphun::analysis::stemmer::RussianExposableMorphology::~RussianExposableMorphology(this);
  JUMPOUT(0x1D179D2ECLL);
}

{
  void *v2;
  void *v3;

  icu4cxx::UnicodeSet::~UnicodeSet((morphun::analysis::stemmer::RussianExposableMorphology *)((char *)this + 488));
  v2 = (void *)*((_QWORD *)this + 58);
  if (v2)
  {
    *((_QWORD *)this + 59) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 55);
  if (v3)
  {
    *((_QWORD *)this + 56) = v3;
    operator delete(v3);
  }
  std::__tree<std::__value_type<std::u16string_view,char16_t const*>,std::__map_value_compare<std::u16string_view,std::__value_type<std::u16string_view,char16_t const*>,std::less<std::u16string_view>,true>,std::allocator<std::__value_type<std::u16string_view,char16_t const*>>>::destroy(*((_QWORD **)this + 53));
  morphun::dialog::DictionaryLookupInflector::~DictionaryLookupInflector(this, &off_1E8669D00);
}

void morphun::analysis::stemmer::RussianExposableMorphology::selectLemmaInflection(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t **v10;
  uint64_t v11;
  uint64_t **v12;
  uint64_t **v13;

  v8 = *a2;
  v9 = a2[2];
  if ((a1[34] & a3) == a1[32] && (a1[50] & a3) == 0)
  {
    v11 = a1[43];
    v12 = (uint64_t **)(a1 + 58);
    v13 = (uint64_t **)(a1 + 55);
    if ((v11 & a3) != 0)
      v10 = v12;
    else
      v10 = v13;
  }
  else
  {
    v10 = (uint64_t **)(a1 + 55);
  }
  morphun::dictionary::Inflector_InflectionPattern::selectLemmaInflection(a4, v8, v9, v10);
}

morphun::analysis::stemmer::RussianExposableMorphology *morphun::analysis::stemmer::RussianExposableMorphology::RussianExposableMorphology(morphun::analysis::stemmer::RussianExposableMorphology *this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  morphun::grammar::synthesis::GrammemeConstants *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  morphun::grammar::synthesis::GrammemeConstants *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  morphun::grammar::synthesis::GrammemeConstants *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  morphun::grammar::synthesis::GrammemeConstants *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  unsigned __int8 v82;
  uint64_t v83;
  morphun::analysis::stemmer::RussianExposableMorphology *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  unsigned __int8 v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  uint64_t v101;
  __int128 v102;
  uint64_t i;
  uint64_t j;
  void *v105;
  uint64_t v106;
  uint64_t *BinaryProperties;
  uint64_t *v108;
  uint64_t *v109;
  uint64_t *v110;
  uint64_t *v111;
  uint64_t *v112;
  uint64_t *v113;
  uint64_t *v114;
  uint64_t *v115;
  uint64_t *v116;
  uint64_t *v117;
  uint64_t *v118;
  uint64_t *v119;
  uint64_t *v120;
  uint64_t *v121;
  uint64_t *v122;
  uint64_t *v123;
  uint64_t *v124;
  uint64_t *v125;
  uint64_t *v126;
  uint64_t *v127;
  morphun::grammar::synthesis::GrammemeConstants *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  int v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  int v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  _QWORD *v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  morphun::grammar::synthesis::GrammemeConstants *v152;
  uint64_t v153;
  char v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  int v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  int v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  _QWORD *v169;
  void *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  morphun::util::LocaleUtils *v174;
  morphun::lang::StringFilterUtil *v175;
  const morphun::util::ULocale *v176;
  morphun::lang::StringFilterUtil *ExemplarCharacters;
  _QWORD *v179;
  _QWORD *v180;
  uint64_t v181;
  morphun::grammar::synthesis::GrammemeConstants *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  _QWORD *v188;
  uint64_t v189;
  char *v190;
  uint64_t v191;
  char *v192;
  uint64_t v193;
  uint64_t v194;
  std::basic_string<char16_t> *v196;
  std::basic_string<char16_t> *v197;
  uint64_t *v198;
  morphun::grammar::synthesis::GrammemeConstants *v199;
  morphun::grammar::synthesis::GrammemeConstants *v200;
  _QWORD *v201;
  void **v202;
  uint64_t v203;
  uint64_t v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  _OWORD v215[3];
  std::basic_string<char16_t> __dst;
  std::basic_string<char16_t> v217;
  __int128 v218;
  uint64_t v219;
  __int128 *v220;

  v220 = (__int128 *)*MEMORY[0x1E0C80C00];
  *(_QWORD *)this = &off_1E866A910;
  v182 = (morphun::grammar::synthesis::GrammemeConstants *)morphun::util::LocaleUtils::RUSSIAN(this);
  v1 = morphun::grammar::synthesis::GrammemeConstants::POS_PROPER_NOUN(v182);
  v2 = *(char *)(v1 + 23);
  if (v2 >= 0)
    v3 = v1;
  else
    v3 = *(_QWORD *)v1;
  if (v2 >= 0)
    v4 = *(unsigned __int8 *)(v1 + 23);
  else
    v4 = *(_QWORD *)(v1 + 8);
  v5 = morphun::grammar::synthesis::GrammemeConstants::POS_NOUN((morphun::grammar::synthesis::GrammemeConstants *)v1);
  v6 = *(char *)(v5 + 23);
  if (v6 >= 0)
    v7 = v5;
  else
    v7 = *(_QWORD *)v5;
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(v5 + 23);
  else
    v8 = *(_QWORD *)(v5 + 8);
  v9 = morphun::grammar::synthesis::GrammemeConstants::POS_ADJECTIVE((morphun::grammar::synthesis::GrammemeConstants *)v5);
  v10 = *(char *)(v9 + 23);
  if (v10 >= 0)
    v11 = v9;
  else
    v11 = *(_QWORD *)v9;
  if (v10 >= 0)
    v12 = *(unsigned __int8 *)(v9 + 23);
  else
    v12 = *(_QWORD *)(v9 + 8);
  v13 = morphun::grammar::synthesis::GrammemeConstants::POS_VERB((morphun::grammar::synthesis::GrammemeConstants *)v9);
  v14 = *(unsigned __int8 *)(v13 + 23);
  v15 = *(_QWORD *)v13;
  v16 = *(_QWORD *)(v13 + 8);
  v17 = (morphun::grammar::synthesis::GrammemeConstants *)operator new(0x40uLL);
  *((_QWORD *)&v205 + 1) = (char *)v17 + 64;
  *(_QWORD *)&v206 = (char *)v17 + 64;
  if ((v14 & 0x80u) == 0)
    v18 = v13;
  else
    v18 = v15;
  if ((v14 & 0x80u) == 0)
    v19 = v14;
  else
    v19 = v16;
  *(_QWORD *)v17 = v3;
  *((_QWORD *)v17 + 1) = v4;
  *((_QWORD *)v17 + 2) = v7;
  *((_QWORD *)v17 + 3) = v8;
  *((_QWORD *)v17 + 4) = v11;
  *((_QWORD *)v17 + 5) = v12;
  *((_QWORD *)v17 + 6) = v18;
  *((_QWORD *)v17 + 7) = v19;
  *(_QWORD *)&v205 = v17;
  v20 = morphun::grammar::synthesis::GrammemeConstants::CASE_NOMINATIVE(v17);
  v21 = *(unsigned __int8 *)(v20 + 23);
  if ((v21 & 0x80u) == 0)
    v22 = v20;
  else
    v22 = *(_QWORD *)v20;
  if ((v21 & 0x80u) != 0)
    v21 = *(_QWORD *)(v20 + 8);
  v191 = v21;
  v193 = v22;
  v23 = morphun::grammar::synthesis::GrammemeConstants::CASE_GENITIVE((morphun::grammar::synthesis::GrammemeConstants *)v20);
  v24 = *(unsigned __int8 *)(v23 + 23);
  if ((v24 & 0x80u) == 0)
    v25 = v23;
  else
    v25 = *(_QWORD *)v23;
  if ((v24 & 0x80u) != 0)
    v24 = *(_QWORD *)(v23 + 8);
  v187 = v24;
  v189 = v25;
  v26 = morphun::grammar::synthesis::GrammemeConstants::CASE_DATIVE((morphun::grammar::synthesis::GrammemeConstants *)v23);
  v27 = *(_BYTE *)(v26 + 23);
  if (v27 >= 0)
    v28 = v26;
  else
    v28 = *(_QWORD *)v26;
  v184 = v28;
  if (v27 >= 0)
    v29 = *(unsigned __int8 *)(v26 + 23);
  else
    v29 = *(_QWORD *)(v26 + 8);
  v30 = morphun::grammar::synthesis::GrammemeConstants::CASE_ACCUSATIVE((morphun::grammar::synthesis::GrammemeConstants *)v26);
  v31 = *(char *)(v30 + 23);
  if (v31 >= 0)
    v32 = v30;
  else
    v32 = *(_QWORD *)v30;
  if (v31 >= 0)
    v33 = *(unsigned __int8 *)(v30 + 23);
  else
    v33 = *(_QWORD *)(v30 + 8);
  v34 = morphun::grammar::synthesis::GrammemeConstants::CASE_INSTRUMENTAL((morphun::grammar::synthesis::GrammemeConstants *)v30);
  v35 = *(char *)(v34 + 23);
  if (v35 >= 0)
    v36 = v34;
  else
    v36 = *(_QWORD *)v34;
  if (v35 >= 0)
    v37 = *(unsigned __int8 *)(v34 + 23);
  else
    v37 = *(_QWORD *)(v34 + 8);
  v38 = morphun::grammar::synthesis::GrammemeConstants::CASE_PREPOSITIONAL((morphun::grammar::synthesis::GrammemeConstants *)v34);
  v39 = *(unsigned __int8 *)(v38 + 23);
  v40 = *(_QWORD *)v38;
  v41 = *(_QWORD *)(v38 + 8);
  *((_QWORD *)&v206 + 1) = 0;
  *(_QWORD *)&v207 = 0;
  v42 = (morphun::grammar::synthesis::GrammemeConstants *)operator new(0x60uLL);
  *((_QWORD *)&v207 + 1) = (char *)v42 + 96;
  if ((v39 & 0x80u) == 0)
    v43 = v38;
  else
    v43 = v40;
  if ((v39 & 0x80u) == 0)
    v44 = v39;
  else
    v44 = v41;
  *(_QWORD *)v42 = v193;
  *((_QWORD *)v42 + 1) = v191;
  *((_QWORD *)v42 + 2) = v189;
  *((_QWORD *)v42 + 3) = v187;
  *((_QWORD *)v42 + 4) = v184;
  *((_QWORD *)v42 + 5) = v29;
  *((_QWORD *)v42 + 6) = v32;
  *((_QWORD *)v42 + 7) = v33;
  *((_QWORD *)v42 + 8) = v36;
  *((_QWORD *)v42 + 9) = v37;
  *((_QWORD *)v42 + 10) = v43;
  *((_QWORD *)v42 + 11) = v44;
  *((_QWORD *)&v206 + 1) = v42;
  *(_QWORD *)&v207 = (char *)v42 + 96;
  v45 = morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE(v42);
  v46 = *(char *)(v45 + 23);
  if (v46 >= 0)
    v47 = v45;
  else
    v47 = *(_QWORD *)v45;
  if (v46 >= 0)
    v48 = *(unsigned __int8 *)(v45 + 23);
  else
    v48 = *(_QWORD *)(v45 + 8);
  v49 = morphun::grammar::synthesis::GrammemeConstants::GENDER_FEMININE((morphun::grammar::synthesis::GrammemeConstants *)v45);
  v50 = *(char *)(v49 + 23);
  if (v50 >= 0)
    v51 = v49;
  else
    v51 = *(_QWORD *)v49;
  if (v50 >= 0)
    v52 = *(unsigned __int8 *)(v49 + 23);
  else
    v52 = *(_QWORD *)(v49 + 8);
  v53 = morphun::grammar::synthesis::GrammemeConstants::GENDER_NEUTER((morphun::grammar::synthesis::GrammemeConstants *)v49);
  v54 = *(unsigned __int8 *)(v53 + 23);
  v55 = *(_QWORD *)v53;
  v56 = *(_QWORD *)(v53 + 8);
  *(_QWORD *)&v208 = 0;
  v57 = (morphun::grammar::synthesis::GrammemeConstants *)operator new(0x30uLL);
  *((_QWORD *)&v208 + 1) = (char *)v57 + 48;
  *(_QWORD *)&v209 = (char *)v57 + 48;
  if ((v54 & 0x80u) == 0)
    v58 = v53;
  else
    v58 = v55;
  if ((v54 & 0x80u) == 0)
    v59 = v54;
  else
    v59 = v56;
  *(_QWORD *)v57 = v47;
  *((_QWORD *)v57 + 1) = v48;
  *((_QWORD *)v57 + 2) = v51;
  *((_QWORD *)v57 + 3) = v52;
  *((_QWORD *)v57 + 4) = v58;
  *((_QWORD *)v57 + 5) = v59;
  *(_QWORD *)&v208 = v57;
  v60 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_SINGULAR(v57);
  v61 = *(char *)(v60 + 23);
  if (v61 >= 0)
    v62 = v60;
  else
    v62 = *(_QWORD *)v60;
  if (v61 >= 0)
    v63 = *(unsigned __int8 *)(v60 + 23);
  else
    v63 = *(_QWORD *)(v60 + 8);
  v64 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL((morphun::grammar::synthesis::GrammemeConstants *)v60);
  v65 = *(unsigned __int8 *)(v64 + 23);
  v66 = *(_QWORD *)v64;
  v67 = *(_QWORD *)(v64 + 8);
  *((_QWORD *)&v209 + 1) = 0;
  v68 = (morphun::grammar::synthesis::GrammemeConstants *)operator new(0x20uLL);
  *(_QWORD *)&v210 = (char *)v68 + 32;
  *((_QWORD *)&v210 + 1) = (char *)v68 + 32;
  if ((v65 & 0x80u) == 0)
    v69 = v64;
  else
    v69 = v66;
  if ((v65 & 0x80u) == 0)
    v70 = v65;
  else
    v70 = v67;
  *(_QWORD *)v68 = v62;
  *((_QWORD *)v68 + 1) = v63;
  *((_QWORD *)v68 + 2) = v69;
  *((_QWORD *)v68 + 3) = v70;
  *((_QWORD *)&v209 + 1) = v68;
  v71 = morphun::grammar::synthesis::GrammemeConstants::ANIMACY_INANIMATE(v68);
  v72 = *(char *)(v71 + 23);
  if (v72 >= 0)
    v73 = v71;
  else
    v73 = *(_QWORD *)v71;
  if (v72 >= 0)
    v74 = *(unsigned __int8 *)(v71 + 23);
  else
    v74 = *(_QWORD *)(v71 + 8);
  v75 = morphun::grammar::synthesis::GrammemeConstants::ANIMACY_ANIMATE((morphun::grammar::synthesis::GrammemeConstants *)v71);
  v76 = *(unsigned __int8 *)(v75 + 23);
  v77 = *(_QWORD *)v75;
  v78 = *(_QWORD *)(v75 + 8);
  v211 = 0uLL;
  *(_QWORD *)&v212 = 0;
  v79 = operator new(0x20uLL);
  if ((v76 & 0x80u) == 0)
    v80 = v75;
  else
    v80 = v77;
  if ((v76 & 0x80u) == 0)
    v81 = v76;
  else
    v81 = v78;
  *((_QWORD *)&v211 + 1) = v79 + 4;
  *(_QWORD *)&v212 = v79 + 4;
  *v79 = v73;
  v79[1] = v74;
  v79[2] = v80;
  v79[3] = v81;
  *(_QWORD *)&v211 = v79;
  if ((v82 & 1) == 0
  {
    v179 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v179, (char *)L"patronymic");
    morphun::grammar::synthesis::GrammemeConstants::DERIVATIONTYPE_PATRONYMIC(void)::DERIVATIONTYPE_PATRONYMIC_ = (uint64_t)v179;
  }
  v83 = morphun::grammar::synthesis::GrammemeConstants::DERIVATIONTYPE_PATRONYMIC(void)::DERIVATIONTYPE_PATRONYMIC_;
  npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::DERIVATIONTYPE_PATRONYMIC(void)::DERIVATIONTYPE_PATRONYMIC_);
  v84 = this;
  v85 = *(unsigned __int8 *)(v83 + 23);
  v86 = *(_QWORD *)v83;
  v87 = *(_QWORD *)(v83 + 8);
  *((_QWORD *)&v212 + 1) = 0;
  v213 = 0uLL;
  v88 = operator new(0x10uLL);
  if ((v85 & 0x80u) == 0)
    v89 = v83;
  else
    v89 = v86;
  if ((v85 & 0x80u) == 0)
    v90 = v85;
  else
    v90 = v87;
  *(_QWORD *)&v213 = v88 + 2;
  *((_QWORD *)&v213 + 1) = v88 + 2;
  *v88 = v89;
  v88[1] = v90;
  *((_QWORD *)&v212 + 1) = v88;
  if ((v91 & 1) == 0
  {
    v180 = (_QWORD *)operator new();
    std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v180, "i");
    morphun::grammar::synthesis::GrammemeConstants::REGISTER_INFORMAL(void)::REGISTER_INFORMAL_ = (uint64_t)v180;
    v84 = this;
  }
  v92 = morphun::grammar::synthesis::GrammemeConstants::REGISTER_INFORMAL(void)::REGISTER_INFORMAL_;
  npc<std::basic_string<char16_t>>(morphun::grammar::synthesis::GrammemeConstants::REGISTER_INFORMAL(void)::REGISTER_INFORMAL_);
  v93 = *(unsigned __int8 *)(v92 + 23);
  v94 = *(_QWORD *)v92;
  v95 = *(_QWORD *)(v92 + 8);
  *(_QWORD *)&v214 = 0;
  v96 = operator new(0x10uLL);
  *((_QWORD *)&v214 + 1) = v96 + 2;
  *(_QWORD *)&v215[0] = v96 + 2;
  if ((v93 & 0x80u) == 0)
    v97 = v92;
  else
    v97 = v94;
  if ((v93 & 0x80u) == 0)
    v98 = v93;
  else
    v98 = v95;
  *v96 = v97;
  v96[1] = v98;
  *(_QWORD *)&v214 = v96;
  v200 = 0;
  v201 = 0;
  v199 = 0;
  __dst.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)&v199;
  LOBYTE(__dst.__r_.__value_.__r.__words[1]) = 0;
  v199 = (morphun::grammar::synthesis::GrammemeConstants *)operator new(0xA8uLL);
  v200 = v199;
  v201 = (_QWORD *)((char *)v199 + 168);
  v200 = (morphun::grammar::synthesis::GrammemeConstants *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::u16string_view>>,std::vector<std::u16string_view> const*,std::vector<std::u16string_view> const*,std::vector<std::u16string_view>*>((uint64_t)&v201, (uint64_t)&v205, (uint64_t)v215 + 8, v199);
  v99 = morphun::grammar::synthesis::GrammemeConstants::POS_PROPER_NOUN(v200);
  if (*(char *)(v99 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&__dst, *(const std::basic_string<char16_t>::value_type **)v99, *(_QWORD *)(v99 + 8));
  }
  else
  {
    v100 = *(_OWORD *)v99;
    __dst.__r_.__value_.__r.__words[2] = *(_QWORD *)(v99 + 16);
    *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v100;
  }
  v101 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_PLURAL((morphun::grammar::synthesis::GrammemeConstants *)v99);
  if (*(char *)(v101 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v217, *(const std::basic_string<char16_t>::value_type **)v101, *(_QWORD *)(v101 + 8));
  }
  else
  {
    v102 = *(_OWORD *)v101;
    v217.__r_.__value_.__r.__words[2] = *(_QWORD *)(v101 + 16);
    *(_OWORD *)&v217.__r_.__value_.__l.__data_ = v102;
  }
  v218 = 0uLL;
  v219 = 0;
  v202 = (void **)&v218;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v218 = operator new(0x30uLL);
  *((_QWORD *)&v218 + 1) = v218;
  v219 = v218 + 48;
  *((_QWORD *)&v218 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v219, (__int128 *)&__dst, &v218, (std::basic_string<char16_t> *)v218);
  v197 = 0;
  v198 = 0;
  v196 = 0;
  v202 = (void **)&v196;
  LOBYTE(v203) = 0;
  v196 = (std::basic_string<char16_t> *)operator new(0x18uLL);
  v197 = v196;
  v198 = (uint64_t *)&v196[1];
  v197 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::basic_string<char16_t>>>,std::vector<std::basic_string<char16_t>> const*,std::vector<std::basic_string<char16_t>> const*,std::vector<std::basic_string<char16_t>>*>((uint64_t)&v198, (__int128 **)&v218, &v220, v196);
  v202 = 0;
  v203 = 0;
  v204 = 0;
  morphun::analysis::MorphologicalAnalyzer::MorphologicalAnalyzer((uint64_t *)v84, (uint64_t *)&off_1E8669D08, v182, (uint64_t *)&v202, (uint64_t)&v199, (uint64_t **)&v196);
  *(_QWORD *)v84 = &off_1E8664338;
  *((_BYTE *)v84 + 224) = 1;
  v202 = (void **)&v196;
  std::vector<std::vector<std::basic_string<char16_t>>>::__destroy_vector::operator()[abi:ne180100](&v202);
  v202 = (void **)&v218;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  for (i = 0; i != -6; i -= 3)
  {
    if (SHIBYTE(v217.__r_.__value_.__r.__words[i + 2]) < 0)
      operator delete(*(void **)((char *)&__dst + i * 8 + 24));
  }
  __dst.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)&v199;
  std::vector<std::vector<std::u16string_view>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__dst);
  for (j = 0; j != -168; j -= 24)
  {
    v105 = *(void **)((char *)&v215[-1] + j);
    if (v105)
    {
      *(_QWORD *)((char *)&v214 + j + 8) = v105;
      operator delete(v105);
    }
  }
  *(_QWORD *)v84 = &off_1E8672CB0;
  *(_OWORD *)((char *)v84 + 232) = 0u;
  *(_OWORD *)((char *)v84 + 248) = 0u;
  *((_QWORD *)v84 + 51) = 0;
  *(_OWORD *)((char *)v84 + 264) = 0u;
  *(_OWORD *)((char *)v84 + 280) = 0u;
  *(_OWORD *)((char *)v84 + 296) = 0u;
  *(_OWORD *)((char *)v84 + 312) = 0u;
  *(_OWORD *)((char *)v84 + 328) = 0u;
  *(_OWORD *)((char *)v84 + 344) = 0u;
  *(_OWORD *)((char *)v84 + 360) = 0u;
  *(_OWORD *)((char *)v84 + 376) = 0u;
  *(_OWORD *)((char *)v84 + 392) = 0u;
  v215[0] = xmmword_1E8686B40;
  v215[1] = *(_OWORD *)&off_1E8686B50;
  v215[2] = xmmword_1E8686B60;
  v211 = xmmword_1E8686B00;
  v212 = *(_OWORD *)&off_1E8686B10;
  v213 = xmmword_1E8686B20;
  v214 = unk_1E8686B30;
  v207 = xmmword_1E8686AC0;
  v208 = unk_1E8686AD0;
  v209 = xmmword_1E8686AE0;
  v210 = *(_OWORD *)&off_1E8686AF0;
  v205 = xmmword_1E8686AA0;
  v206 = unk_1E8686AB0;
  std::set<std::u16string_view>::set[abi:ne180100]((uint64_t)v84 + 416, (uint64_t)&v205, 13);
  *(_OWORD *)((char *)v84 + 456) = 0u;
  *(_OWORD *)((char *)v84 + 472) = 0u;
  v190 = (char *)v84 + 464;
  v192 = (char *)v84 + 440;
  *(_OWORD *)((char *)v84 + 440) = 0u;
  icu4cxx::UnicodeSet::UnicodeSet((uint64_t)v84 + 488);
  v106 = *((_QWORD *)v84 + 1);
  v188 = (_QWORD *)((char *)v84 + 488);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"familyname");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  BinaryProperties = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 50, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)BinaryProperties);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "s");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v108 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 51, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v108);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"feminine");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v109 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 29, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v109);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "m");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v110 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 30, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v110);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "n");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v111 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 31, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v111);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"animate");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v112 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 32, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v112);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"inanimate");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v113 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 33, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v113);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  *((_QWORD *)v84 + 34) = *((_QWORD *)v84 + 33) | *((_QWORD *)v84 + 32);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"singular");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v114 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 35, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v114);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "p");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v115 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 36, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v115);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"nominative");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v116 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 37, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v116);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "g");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v117 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 38, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v117);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"dative");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v118 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 39, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v118);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"accusative");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v119 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 40, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v119);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "i");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v120 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 41, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v120);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"prepositional");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v121 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 42, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v121);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"noun");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v122 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 43, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v122);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "a");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v123 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 45, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v123);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "a");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v124 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 46, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v124);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"verb");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v125 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 47, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v125);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, "n");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v126 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 48, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v126);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__dst, (char *)L"proper-noun");
  v205 = 0uLL;
  *(_QWORD *)&v206 = 0;
  v202 = (void **)&v205;
  LOBYTE(v203) = 0;
  *(_QWORD *)&v205 = operator new(0x18uLL);
  *((_QWORD *)&v205 + 1) = v205;
  *(_QWORD *)&v206 = v205 + 24;
  *((_QWORD *)&v205 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::basic_string<char16_t>>,std::basic_string<char16_t> const*,std::basic_string<char16_t> const*,std::basic_string<char16_t>*>((uint64_t)&v206, (__int128 *)&__dst, (__int128 *)&v217, (std::basic_string<char16_t> *)v205);
  v127 = morphun::dictionary::DictionaryMetaData::getBinaryProperties(v106, (uint64_t *)v84 + 44, (uint64_t *)&v205);
  morphun::util::Validate::notNull<long long>((uint64_t)v127);
  v202 = (void **)&v205;
  std::vector<std::basic_string<char16_t>>::__destroy_vector::operator()[abi:ne180100](&v202);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  v194 = v106;
  *((_QWORD *)v84 + 49) = *((_QWORD *)v84 + 45) | *((_QWORD *)v84 + 43) | *((_QWORD *)v84 + 48) | *((_QWORD *)v84 + 44) | *((_QWORD *)v84 + 47) | *((_QWORD *)v84 + 46);
  v129 = morphun::grammar::synthesis::GrammemeConstants::VERBTYPE_INFINITIVE(v128);
  v130 = *(unsigned __int8 *)(v129 + 23);
  if ((v130 & 0x80u) == 0)
    v131 = v129;
  else
    v131 = *(_QWORD *)v129;
  if ((v130 & 0x80u) != 0)
    v130 = *(_QWORD *)(v129 + 8);
  v183 = v130;
  v185 = v131;
  v132 = morphun::grammar::synthesis::GrammemeConstants::CASE_NOMINATIVE((morphun::grammar::synthesis::GrammemeConstants *)v129);
  v133 = *(unsigned __int8 *)(v132 + 23);
  if ((v133 & 0x80u) == 0)
    v134 = v132;
  else
    v134 = *(_QWORD *)v132;
  if ((v133 & 0x80u) != 0)
    v133 = *(_QWORD *)(v132 + 8);
  v181 = v133;
  v135 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_SINGULAR((morphun::grammar::synthesis::GrammemeConstants *)v132);
  v136 = *(char *)(v135 + 23);
  if (v136 >= 0)
    v137 = v135;
  else
    v137 = *(_QWORD *)v135;
  if (v136 >= 0)
    v138 = *(unsigned __int8 *)(v135 + 23);
  else
    v138 = *(_QWORD *)(v135 + 8);
  v139 = morphun::grammar::synthesis::GrammemeConstants::GENDER_MASCULINE((morphun::grammar::synthesis::GrammemeConstants *)v135);
  v140 = *(char *)(v139 + 23);
  if (v140 >= 0)
    v141 = v139;
  else
    v141 = *(_QWORD *)v139;
  if (v140 >= 0)
    v142 = *(unsigned __int8 *)(v139 + 23);
  else
    v142 = *(_QWORD *)(v139 + 8);
  v143 = morphun::grammar::synthesis::GrammemeConstants::ANIMACY_INANIMATE((morphun::grammar::synthesis::GrammemeConstants *)v139);
  v144 = *(unsigned __int8 *)(v143 + 23);
  v146 = *(_QWORD *)v143;
  v145 = *(_QWORD *)(v143 + 8);
  v147 = operator new(0x50uLL);
  v148 = v147;
  __dst.__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)(v147 + 10);
  __dst.__r_.__value_.__r.__words[2] = (std::basic_string<char16_t>::size_type)(v147 + 10);
  if ((v144 & 0x80u) == 0)
    v149 = v143;
  else
    v149 = v146;
  if ((v144 & 0x80u) == 0)
    v150 = v144;
  else
    v150 = v145;
  *v147 = v185;
  v147[1] = v183;
  v147[2] = v134;
  v147[3] = v181;
  v147[4] = v137;
  v147[5] = v138;
  v147[6] = v141;
  v147[7] = v142;
  v147[8] = v149;
  v147[9] = v150;
  __dst.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)v147;
  morphun::analysis::MorphologicalAnalyzer::convertLemmaAttributes((uint64_t)&v205, v194, (uint64_t *)&__dst);
  v151 = *(void **)v192;
  if (*(_QWORD *)v192)
  {
    *((_QWORD *)this + 56) = v151;
    operator delete(v151);
    *(_QWORD *)v192 = 0;
    *((_QWORD *)v192 + 1) = 0;
    *((_QWORD *)v192 + 2) = 0;
  }
  *(_OWORD *)v192 = v205;
  *((_QWORD *)this + 57) = v206;
  operator delete(v148);
  v153 = morphun::grammar::synthesis::GrammemeConstants::VERBTYPE_INFINITIVE(v152);
  v154 = *(_BYTE *)(v153 + 23);
  if (v154 >= 0)
    v155 = v153;
  else
    v155 = *(_QWORD *)v153;
  v186 = v155;
  if (v154 >= 0)
    v156 = *(unsigned __int8 *)(v153 + 23);
  else
    v156 = *(_QWORD *)(v153 + 8);
  v157 = morphun::grammar::synthesis::GrammemeConstants::CASE_NOMINATIVE((morphun::grammar::synthesis::GrammemeConstants *)v153);
  v158 = *(char *)(v157 + 23);
  if (v158 >= 0)
    v159 = v157;
  else
    v159 = *(_QWORD *)v157;
  if (v158 >= 0)
    v160 = *(unsigned __int8 *)(v157 + 23);
  else
    v160 = *(_QWORD *)(v157 + 8);
  v161 = morphun::grammar::synthesis::GrammemeConstants::NUMBER_SINGULAR((morphun::grammar::synthesis::GrammemeConstants *)v157);
  v162 = *(char *)(v161 + 23);
  if (v162 >= 0)
    v163 = v161;
  else
    v163 = *(_QWORD *)v161;
  if (v162 >= 0)
    v164 = *(unsigned __int8 *)(v161 + 23);
  else
    v164 = *(_QWORD *)(v161 + 8);
  v165 = morphun::grammar::synthesis::GrammemeConstants::ANIMACY_INANIMATE((morphun::grammar::synthesis::GrammemeConstants *)v161);
  v166 = *(unsigned __int8 *)(v165 + 23);
  v168 = *(_QWORD *)v165;
  v167 = *(_QWORD *)(v165 + 8);
  v169 = operator new(0x40uLL);
  v170 = v169;
  __dst.__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)(v169 + 8);
  __dst.__r_.__value_.__r.__words[2] = (std::basic_string<char16_t>::size_type)(v169 + 8);
  if ((v166 & 0x80u) == 0)
    v171 = v165;
  else
    v171 = v168;
  if ((v166 & 0x80u) == 0)
    v172 = v166;
  else
    v172 = v167;
  *v169 = v186;
  v169[1] = v156;
  v169[2] = v159;
  v169[3] = v160;
  v169[4] = v163;
  v169[5] = v164;
  v169[6] = v171;
  v169[7] = v172;
  __dst.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)v169;
  morphun::analysis::MorphologicalAnalyzer::convertLemmaAttributes((uint64_t)&v205, v194, (uint64_t *)&__dst);
  v173 = *(void **)v190;
  if (*(_QWORD *)v190)
  {
    *((_QWORD *)this + 59) = v173;
    operator delete(v173);
    *(_QWORD *)v190 = 0;
    *((_QWORD *)v190 + 1) = 0;
    *((_QWORD *)v190 + 2) = 0;
  }
  *((_OWORD *)this + 29) = v205;
  *((_QWORD *)this + 60) = v206;
  operator delete(v170);
  v175 = (morphun::lang::StringFilterUtil *)morphun::util::LocaleUtils::RUSSIAN(v174);
  ExemplarCharacters = morphun::lang::StringFilterUtil::getExemplarCharacters(v175, v176);
  MEMORY[0x1D179D910](*v188, *(_QWORD *)ExemplarCharacters);
  MEMORY[0x1D179D970](*v188);
  return this;
}

void sub_1CB5C6340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, icu4cxx::UnicodeSet *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28)
{
  uint64_t v28;
  char *v29;
  char *v31;
  void *v32;
  void *v33;

  MEMORY[0x1D179D2EC](v28, 0x1012C40EC159624);
  v31 = v29;
  while (1)
  {
    v33 = (void *)*((_QWORD *)v31 - 3);
    v31 -= 24;
    v32 = v33;
    if (v33)
    {
      *((_QWORD *)v29 - 2) = v32;
      operator delete(v32);
    }
    v29 = v31;
    if (v31 == &a27)
      _Unwind_Resume(a1);
  }
}

uint64_t morphun::analysis::stemmer::RussianExposableMorphology::getInstance(morphun::analysis::stemmer::RussianExposableMorphology *this)
{
  unsigned __int8 v1;
  morphun::analysis::stemmer::RussianExposableMorphology *v3;

  if ((v1 & 1) == 0
  {
    v3 = (morphun::analysis::stemmer::RussianExposableMorphology *)operator new();
    morphun::analysis::stemmer::RussianExposableMorphology::RussianExposableMorphology(v3);
    morphun::analysis::stemmer::RussianExposableMorphology::getInstance(void)::INSTANCE_ = (uint64_t)v3;
  }
  return morphun::analysis::stemmer::RussianExposableMorphology::getInstance(void)::INSTANCE_;
}

void sub_1CB5C6774(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179D2EC](v1, 0x10F3C40BDA3BE62);
  _Unwind_Resume(a1);
}

uint64_t morphun::analysis::stemmer::RussianExposableMorphology::isInflectable(uint64_t a1, unsigned __int16 *a2, unint64_t a3)
{
  uint64_t result;

  if (a3 < 3)
    return 0;
  result = uset_containsAllCodePoints();
  if ((_DWORD)result)
    return std::__tree<std::u16string_view>::__count_unique<std::u16string_view>(*(_QWORD *)(a1 + 424), a2, a3) == 0;
  return result;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987D8](locale);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AE0](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B48](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1E0C98FE8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FF8](alloc, chars, numChars, contentsDeallocator);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

uint64_t QuasarCPDecTranslator_delete()
{
  return MEMORY[0x1E0D1F1A8]();
}

uint64_t QuasarCPDecTranslator_new()
{
  return MEMORY[0x1E0D1F1B0]();
}

uint64_t QuasarCPDecTranslator_translate()
{
  return MEMORY[0x1E0D1F1B8]();
}

uint64_t QuasarCSystemConfig_delete()
{
  return MEMORY[0x1E0D1F1C0]();
}

uint64_t QuasarCSystemConfig_new()
{
  return MEMORY[0x1E0D1F1C8]();
}

uint64_t QuasarCSystemConfig_readJsonFile()
{
  return MEMORY[0x1E0D1F1D0]();
}

uint64_t QuasarC_setLogLevel()
{
  return MEMORY[0x1E0D1F1E0]();
}

uint64_t ThaiTokenizerAdvanceToNextToken()
{
  return MEMORY[0x1E0DE3B58]();
}

uint64_t ThaiTokenizerCreate()
{
  return MEMORY[0x1E0DE3B60]();
}

uint64_t ThaiTokenizerDestroy()
{
  return MEMORY[0x1E0DE3B68]();
}

uint64_t ThaiTokenizerGetCurrentTokenRange()
{
  return MEMORY[0x1E0DE3B70]();
}

uint64_t ThaiTokenizerSetStringWithRange()
{
  return MEMORY[0x1E0DE3B80]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1E0DE41C8](this, __c, __pos);
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1E0DE41D0](this, __c, __pos);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::nested_exception *__cdecl std::nested_exception::nested_exception(std::nested_exception *this)
{
  return (std::nested_exception *)MEMORY[0x1E0DE4370](this);
}

void std::nested_exception::~nested_exception(std::nested_exception *this)
{
  MEMORY[0x1E0DE4378](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4408](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4450](this, __str, __pos, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x1E0DE44A8](this, __requested_capacity);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x1E0DE44B0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1E0DE4698]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1E0DE46A0]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x1E0DE46A8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::__weakly_canonical(std::__fs::filesystem::path *__return_ptr retstr, const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return (std::__fs::filesystem::path *)MEMORY[0x1E0DE49E8](retstr, __p, __ec);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x1E0DE4D40](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D78](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E8654C88();
}

void operator delete(void *__p)
{
  off_1E8654C90(__p);
}

uint64_t operator delete()
{
  return off_1E8654C98();
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E8654CA0(__sz, a2);
}

uint64_t operator new[]()
{
  return off_1E8654CA8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E8654CB0(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E8654CB8(__sz, a2);
}

uint64_t operator new()
{
  return off_1E8654CC0();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void __cxa_bad_cast(void)
{
  MEMORY[0x1E0DE5070]();
}

void __cxa_bad_typeid(void)
{
  MEMORY[0x1E0DE5078]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1E0DE50E0](lpsrc, lpstype, lpdtype, s2d);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C83028](a1, a2);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

uint64_t germantok_tokenize()
{
  return MEMORY[0x1E0DE5868]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

uint64_t mecab_destroy()
{
  return MEMORY[0x1E0DE6DD0]();
}

uint64_t mecab_new()
{
  return MEMORY[0x1E0DE6DF8]();
}

uint64_t mecab_sparse_tonode2()
{
  return MEMORY[0x1E0DE6E08]();
}

uint64_t mecab_strerror()
{
  return MEMORY[0x1E0DE6E10]();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

const char *__cdecl u_errorName(UErrorCode code)
{
  return (const char *)MEMORY[0x1E0DE5988](*(_QWORD *)&code);
}

UBool u_isUWhiteSpace(UChar32 c)
{
  return MEMORY[0x1E0DE5A08](*(_QWORD *)&c);
}

UBool u_isalnum(UChar32 c)
{
  return MEMORY[0x1E0DE5A18](*(_QWORD *)&c);
}

UBool u_isalpha(UChar32 c)
{
  return MEMORY[0x1E0DE5A20](*(_QWORD *)&c);
}

UBool u_isdigit(UChar32 c)
{
  return MEMORY[0x1E0DE5A30](*(_QWORD *)&c);
}

UBool u_ispunct(UChar32 c)
{
  return MEMORY[0x1E0DE5A48](*(_QWORD *)&c);
}

UBool u_isupper(UChar32 c)
{
  return MEMORY[0x1E0DE5A60](*(_QWORD *)&c);
}

UChar *__cdecl u_memcpy(UChar *dest, const UChar *src, int32_t count)
{
  return (UChar *)MEMORY[0x1E0DE5A70](dest, src, *(_QWORD *)&count);
}

int32_t u_strCaseCompare(const UChar *s1, int32_t length1, const UChar *s2, int32_t length2, uint32_t options, UErrorCode *pErrorCode)
{
  return MEMORY[0x1E0DE5A80](s1, *(_QWORD *)&length1, s2, *(_QWORD *)&length2, *(_QWORD *)&options, pErrorCode);
}

UChar *__cdecl u_strFindFirst(const UChar *s, int32_t length, const UChar *substring, int32_t subLength)
{
  return (UChar *)MEMORY[0x1E0DE5A88](s, *(_QWORD *)&length, substring, *(_QWORD *)&subLength);
}

UChar *__cdecl u_strFromUTF8(UChar *dest, int32_t destCapacity, int32_t *pDestLength, const char *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (UChar *)MEMORY[0x1E0DE5AA0](dest, *(_QWORD *)&destCapacity, pDestLength, src, *(_QWORD *)&srcLength, pErrorCode);
}

int32_t u_strToLower(UChar *dest, int32_t destCapacity, const UChar *src, int32_t srcLength, const char *locale, UErrorCode *pErrorCode)
{
  return MEMORY[0x1E0DE5AB0](dest, *(_QWORD *)&destCapacity, src, *(_QWORD *)&srcLength, locale, pErrorCode);
}

int32_t u_strToUpper(UChar *dest, int32_t destCapacity, const UChar *src, int32_t srcLength, const char *locale, UErrorCode *pErrorCode)
{
  return MEMORY[0x1E0DE5AC8](dest, *(_QWORD *)&destCapacity, src, *(_QWORD *)&srcLength, locale, pErrorCode);
}

int32_t u_strcmp(const UChar *s1, const UChar *s2)
{
  return MEMORY[0x1E0DE5AE0](s1, s2);
}

int32_t u_strlen(const UChar *s)
{
  return MEMORY[0x1E0DE5AF8](s);
}

UChar *__cdecl u_strncpy(UChar *dst, const UChar *src, int32_t n)
{
  return (UChar *)MEMORY[0x1E0DE5B00](dst, src, *(_QWORD *)&n);
}

UChar32 u_tolower(UChar32 c)
{
  return MEMORY[0x1E0DE5B10](*(_QWORD *)&c);
}

UChar32 u_toupper(UChar32 c)
{
  return MEMORY[0x1E0DE5B20](*(_QWORD *)&c);
}

uint64_t ubrk_clone()
{
  return MEMORY[0x1E0DE5C90]();
}

uint64_t ubrk_close()
{
  return MEMORY[0x1E0DE5C98]();
}

uint64_t ubrk_next()
{
  return MEMORY[0x1E0DE5CE0]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x1E0DE5CE8]();
}

uint64_t ubrk_setText()
{
  return MEMORY[0x1E0DE5D08]();
}

uint64_t ucnv_close()
{
  return MEMORY[0x1E0DE5E98]();
}

uint64_t ucnv_fromUChars()
{
  return MEMORY[0x1E0DE5EC0]();
}

uint64_t ucnv_open()
{
  return MEMORY[0x1E0DE5F20]();
}

uint64_t ucnv_safeClone()
{
  return MEMORY[0x1E0DE5F38]();
}

uint64_t ucnv_toUChars()
{
  return MEMORY[0x1E0DE5F60]();
}

uint64_t uenum_close()
{
  return MEMORY[0x1E0DE6240]();
}

uint64_t uenum_unext()
{
  return MEMORY[0x1E0DE6258]();
}

uint64_t ulistfmt_close()
{
  return MEMORY[0x1E0DE6348]();
}

uint64_t ulistfmt_format()
{
  return MEMORY[0x1E0DE6358]();
}

uint64_t ulistfmt_openForType()
{
  return MEMORY[0x1E0DE6370]();
}

uint64_t uloc_canonicalize()
{
  return MEMORY[0x1E0DE6390]();
}

uint64_t uloc_getCountry()
{
  return MEMORY[0x1E0DE63C0]();
}

uint64_t uloc_getLanguage()
{
  return MEMORY[0x1E0DE6430]();
}

uint64_t uloc_getScript()
{
  return MEMORY[0x1E0DE6448]();
}

uint64_t uloc_getVariant()
{
  return MEMORY[0x1E0DE6450]();
}

uint64_t ulocdata_close()
{
  return MEMORY[0x1E0DE6488]();
}

uint64_t ulocdata_getDelimiter()
{
  return MEMORY[0x1E0DE6498]();
}

uint64_t ulocdata_getExemplarSet()
{
  return MEMORY[0x1E0DE64A0]();
}

uint64_t ulocdata_open()
{
  return MEMORY[0x1E0DE64B0]();
}

int uname(utsname *a1)
{
  return MEMORY[0x1E0C859A0](a1);
}

uint64_t unorm2_getNFCInstance()
{
  return MEMORY[0x1E0DE64D0]();
}

uint64_t unorm2_getNFDInstance()
{
  return MEMORY[0x1E0DE64D8]();
}

uint64_t unorm2_getNFKCInstance()
{
  return MEMORY[0x1E0DE64E0]();
}

uint64_t unorm2_getNFKDInstance()
{
  return MEMORY[0x1E0DE64E8]();
}

uint64_t unorm2_normalize()
{
  return MEMORY[0x1E0DE64F8]();
}

uint64_t unum_close()
{
  return MEMORY[0x1E0DE6530]();
}

uint64_t unum_countAvailable()
{
  return MEMORY[0x1E0DE6538]();
}

uint64_t unum_formatDouble()
{
  return MEMORY[0x1E0DE6548]();
}

uint64_t unum_formatInt64()
{
  return MEMORY[0x1E0DE6560]();
}

uint64_t unum_getAvailable()
{
  return MEMORY[0x1E0DE6570]();
}

uint64_t unum_getTextAttribute()
{
  return MEMORY[0x1E0DE6590]();
}

uint64_t unum_open()
{
  return MEMORY[0x1E0DE6598]();
}

uint64_t unum_parseDouble()
{
  return MEMORY[0x1E0DE65B0]();
}

uint64_t unum_parseInt64()
{
  return MEMORY[0x1E0DE65B8]();
}

uint64_t unum_setAttribute()
{
  return MEMORY[0x1E0DE65C8]();
}

uint64_t unum_setTextAttribute()
{
  return MEMORY[0x1E0DE65E8]();
}

uint64_t uplrules_close()
{
  return MEMORY[0x1E0DE66B8]();
}

uint64_t uplrules_getKeywords()
{
  return MEMORY[0x1E0DE66C0]();
}

uint64_t uplrules_open()
{
  return MEMORY[0x1E0DE66C8]();
}

uint64_t uplrules_select()
{
  return MEMORY[0x1E0DE66D8]();
}

URegularExpression *__cdecl uregex_clone(const URegularExpression *regexp, UErrorCode *status)
{
  return (URegularExpression *)MEMORY[0x1E0DE6708](regexp, status);
}

void uregex_close(URegularExpression *regexp)
{
  MEMORY[0x1E0DE6710](regexp);
}

int32_t uregex_end(URegularExpression *regexp, int32_t groupNum, UErrorCode *status)
{
  return MEMORY[0x1E0DE6718](regexp, *(_QWORD *)&groupNum, status);
}

UBool uregex_find(URegularExpression *regexp, int32_t startIndex, UErrorCode *status)
{
  return MEMORY[0x1E0DE6728](regexp, *(_QWORD *)&startIndex, status);
}

int32_t uregex_group(URegularExpression *regexp, int32_t groupNum, UChar *dest, int32_t destCapacity, UErrorCode *status)
{
  return MEMORY[0x1E0DE6738](regexp, *(_QWORD *)&groupNum, dest, *(_QWORD *)&destCapacity, status);
}

int32_t uregex_groupCount(URegularExpression *regexp, UErrorCode *status)
{
  return MEMORY[0x1E0DE6740](regexp, status);
}

UBool uregex_matches(URegularExpression *regexp, int32_t startIndex, UErrorCode *status)
{
  return MEMORY[0x1E0DE6760](regexp, *(_QWORD *)&startIndex, status);
}

URegularExpression *__cdecl uregex_open(const UChar *pattern, int32_t patternLength, uint32_t flags, UParseError *pe, UErrorCode *status)
{
  return (URegularExpression *)MEMORY[0x1E0DE6768](pattern, *(_QWORD *)&patternLength, *(_QWORD *)&flags, pe, status);
}

void uregex_setText(URegularExpression *regexp, const UChar *text, int32_t textLength, UErrorCode *status)
{
  MEMORY[0x1E0DE67B0](regexp, text, *(_QWORD *)&textLength, status);
}

void uregex_setUText(URegularExpression *regexp, UText *text, UErrorCode *status)
{
  MEMORY[0x1E0DE67B8](regexp, text, status);
}

uint64_t uscript_getCode()
{
  return MEMORY[0x1E0DE6880]();
}

uint64_t uscript_getName()
{
  return MEMORY[0x1E0DE6888]();
}

uint64_t uscript_hasScript()
{
  return MEMORY[0x1E0DE68B0]();
}

uint64_t uset_add()
{
  return MEMORY[0x1E0DE6938]();
}

uint64_t uset_addAll()
{
  return MEMORY[0x1E0DE6940]();
}

uint64_t uset_addAllCodePoints()
{
  return MEMORY[0x1E0DE6948]();
}

uint64_t uset_clone()
{
  return MEMORY[0x1E0DE6978]();
}

uint64_t uset_cloneAsThawed()
{
  return MEMORY[0x1E0DE6980]();
}

uint64_t uset_close()
{
  return MEMORY[0x1E0DE6988]();
}

uint64_t uset_closeOver()
{
  return MEMORY[0x1E0DE6990]();
}

uint64_t uset_contains()
{
  return MEMORY[0x1E0DE6998]();
}

uint64_t uset_containsAllCodePoints()
{
  return MEMORY[0x1E0DE69A0]();
}

uint64_t uset_freeze()
{
  return MEMORY[0x1E0DE69A8]();
}

uint64_t uset_isEmpty()
{
  return MEMORY[0x1E0DE69C8]();
}

uint64_t uset_openEmpty()
{
  return MEMORY[0x1E0DE69D8]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1E0DE69E0]();
}

uint64_t uset_openPatternOptions()
{
  return MEMORY[0x1E0DE69E8]();
}

uint64_t uset_removeAll()
{
  return MEMORY[0x1E0DE69F0]();
}

uint64_t uset_span()
{
  return MEMORY[0x1E0DE6A18]();
}

uint64_t uset_spanBack()
{
  return MEMORY[0x1E0DE6A20]();
}

int32_t utext_extract(UText *ut, int64_t nativeStart, int64_t nativeLimit, UChar *dest, int32_t destCapacity, UErrorCode *status)
{
  return MEMORY[0x1E0DE6A60](ut, nativeStart, nativeLimit, dest, *(_QWORD *)&destCapacity, status);
}

int64_t utext_nativeLength(UText *ut)
{
  return MEMORY[0x1E0DE6A80](ut);
}

UText *__cdecl utext_openUChars(UText *ut, const UChar *s, int64_t length, UErrorCode *status)
{
  return (UText *)MEMORY[0x1E0DE6A90](ut, s, length, status);
}

uint64_t utrans_close()
{
  return MEMORY[0x1E0DE6AC8]();
}

uint64_t utrans_openU()
{
  return MEMORY[0x1E0DE6AD0]();
}

uint64_t utrans_trans()
{
  return MEMORY[0x1E0DE6AD8]();
}

uint64_t utrans_transUChars()
{
  return MEMORY[0x1E0DE6AE0]();
}

