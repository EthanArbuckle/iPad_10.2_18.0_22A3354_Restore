void sub_1C22F740C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, URegularExpression *regexp, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,char *a24,uint64_t a25,char a26)
{
  int v26;
  void *v27;
  uint64_t v28;

  if (a22 < 0)
    operator delete(__p);
  if (*(char *)(v28 - 97) < 0)
  {
    operator delete(*(void **)(v28 - 120));
    if ((v26 & 1) == 0)
    {
LABEL_8:
      a24 = 0;
      if (regexp)
        uregex_close(regexp);
      a24 = &a26;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a24);
      _Unwind_Resume(a1);
    }
  }
  else if (!v26)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v27);
  goto LABEL_8;
}

void nl_featurization::span_matching::span_processor::SpanProcessor::selectSpansMatchingOptions(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t *a4)
{
  __int128 *i;
  _OWORD *v7;
  _OWORD *v8;
  unint64_t v9;
  __int128 *v10;

  for (i = *(__int128 **)(a2 + 16); i; i = *(__int128 **)i)
  {
    if (*a3)
    {
      nl_featurization::span_matching::span_processor::SpanProcessor::selectSpansMatchingOptionsUsingOnlyLongestTokenChain(a1, i + 1, (uint64_t)i + 40, a4);
    }
    else
    {
      v7 = (_OWORD *)*((_QWORD *)i + 5);
      v8 = (_OWORD *)*((_QWORD *)i + 6);
      if (v7 != v8)
      {
        v9 = a4[1];
        do
        {
          v10 = i + 1;
          if (v9 >= a4[2])
          {
            a1 = std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::__emplace_back_slow_path<nl_featurization::span_matching::span_processor::SpanProcessor::Indices const&,std::basic_string<char16_t> const&>(a4, v7, v10);
            v9 = a1;
          }
          else
          {
            std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::__construct_one_at_end[abi:ne180100]<nl_featurization::span_matching::span_processor::SpanProcessor::Indices const&,std::basic_string<char16_t> const&>((uint64_t)a4, v7, v10);
            v9 += 56;
          }
          a4[1] = v9;
          v7 += 2;
        }
        while (v7 != v8);
      }
    }
  }
}

void std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 1) < 0)
          operator delete(*(v4 - 3));
        v4 -= 7;
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::basic_string<char16_t> const,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

void std::__destroy_at[abi:ne180100]<std::pair<std::basic_string<char16_t> const,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,0>(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(_QWORD *)(a1 + 32) = v2;
    operator delete(v2);
  }
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void nl_featurization::span_matching::span_processor::SpanProcessor::selectSpansMatchingOptionsUsingOnlyLongestTokenChain(uint64_t a1, __int128 *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  const void *v7;
  int64_t v8;
  __int128 *v9;
  __int128 *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  __int128 v15;
  std::basic_string<char16_t> *v16;
  __int128 v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  __int128 v25;
  std::basic_string<char16_t> *v26;
  __int128 v27;
  __int128 *v28;
  unint64_t v29;
  uint64_t v30;
  __int128 v31;
  _QWORD v32[2];
  unint64_t v33;
  unint64_t v34;
  uint64_t *v35;

  v7 = *(const void **)a3;
  v6 = *(_QWORD *)(a3 + 8);
  v8 = v6 - *(_QWORD *)a3;
  if (v6 == *(_QWORD *)a3)
  {
    v9 = 0;
    v10 = 0;
  }
  else
  {
    if (v8 < 0)
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    v9 = (__int128 *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,std::vector<unsigned long>>>>(v8 >> 5);
    memmove(v9, v7, v8);
    v10 = &v9[2 * (v8 >> 5)];
  }
  v11 = 126 - 2 * __clz(((char *)v10 - (char *)v9) >> 5);
  if (v10 == v9)
    v12 = 0;
  else
    v12 = v11;
  std::__introsort<std::_ClassicAlgPolicy,nl_featurization::span_matching::span_processor::SpanProcessor::selectSpansMatchingOptionsUsingOnlyLongestTokenChain(std::basic_string<char16_t> const&,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices> const&,std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>> &)::$_0 &,nl_featurization::span_matching::span_processor::SpanProcessor::Indices*,false>((uint64_t)v9, v10, v12, 1);
  v13 = a4[2];
  v14 = a4[1];
  if (v14 >= v13)
  {
    v18 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v14 - *a4) >> 3);
    if ((unint64_t)(v18 + 1) > 0x492492492492492)
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    v19 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v13 - *a4) >> 3);
    v20 = 2 * v19;
    if (2 * v19 <= v18 + 1)
      v20 = v18 + 1;
    if (v19 >= 0x249249249249249)
      v21 = 0x492492492492492;
    else
      v21 = v20;
    v35 = a4 + 2;
    if (v21)
      v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>>(v21);
    else
      v22 = 0;
    v24 = v21 + 56 * v18;
    v32[0] = v21;
    v32[1] = v24;
    v33 = v24;
    v34 = v21 + 56 * v22;
    v25 = v9[1];
    *(_OWORD *)v24 = *v9;
    *(_OWORD *)(v24 + 16) = v25;
    v26 = (std::basic_string<char16_t> *)(v24 + 32);
    if (*((char *)a2 + 23) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(v26, *(const std::basic_string<char16_t>::value_type **)a2, *((_QWORD *)a2 + 1));
      v24 = v33;
    }
    else
    {
      v27 = *a2;
      *(_QWORD *)(v24 + 48) = *((_QWORD *)a2 + 2);
      *(_OWORD *)&v26->__r_.__value_.__l.__data_ = v27;
    }
    v33 = v24 + 56;
    std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::__swap_out_circular_buffer(a4, v32);
    v23 = a4[1];
    std::__split_buffer<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::~__split_buffer((uint64_t)v32);
  }
  else
  {
    v15 = v9[1];
    *(_OWORD *)v14 = *v9;
    *(_OWORD *)(v14 + 16) = v15;
    v16 = (std::basic_string<char16_t> *)(v14 + 32);
    if (*((char *)a2 + 23) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(v16, *(const std::basic_string<char16_t>::value_type **)a2, *((_QWORD *)a2 + 1));
    }
    else
    {
      v17 = *a2;
      *(_QWORD *)(v14 + 48) = *((_QWORD *)a2 + 2);
      *(_OWORD *)&v16->__r_.__value_.__l.__data_ = v17;
    }
    v23 = v14 + 56;
    a4[1] = v23;
  }
  a4[1] = v23;
  if (v10 != v9)
  {
    v28 = v9;
    do
    {
      if (*((_QWORD *)v28 + 1) > *((_QWORD *)v9 + 1))
      {
        v29 = a4[1];
        if (v29 >= a4[2])
        {
          v30 = std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::__emplace_back_slow_path<nl_featurization::span_matching::span_processor::SpanProcessor::Indices const&,std::basic_string<char16_t> const&>(a4, v28, a2);
        }
        else
        {
          std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::__construct_one_at_end[abi:ne180100]<nl_featurization::span_matching::span_processor::SpanProcessor::Indices const&,std::basic_string<char16_t> const&>((uint64_t)a4, v28, a2);
          v30 = v29 + 56;
        }
        a4[1] = v30;
        v31 = v28[1];
        *v9 = *v28;
        v9[1] = v31;
      }
      v28 += 2;
    }
    while (v28 != v10);
  }
  operator delete(v9);
}

void sub_1C22F7918(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::~__split_buffer((uint64_t)va);
  operator delete(v2);
  _Unwind_Resume(a1);
}

void std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::__construct_one_at_end[abi:ne180100]<nl_featurization::span_matching::span_processor::SpanProcessor::Indices const&,std::basic_string<char16_t> const&>(uint64_t a1, _OWORD *a2, __int128 *a3)
{
  uint64_t v4;
  __int128 v5;
  std::basic_string<char16_t> *v6;
  __int128 v7;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = a2[1];
  *(_OWORD *)v4 = *a2;
  *(_OWORD *)(v4 + 16) = v5;
  v6 = (std::basic_string<char16_t> *)(v4 + 32);
  if (*((char *)a3 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(v6, *(const std::basic_string<char16_t>::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v7 = *a3;
    *(_QWORD *)(v4 + 48) = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  *(_QWORD *)(a1 + 8) = v4 + 56;
}

void sub_1C22F79AC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::__emplace_back_slow_path<nl_featurization::span_matching::span_processor::SpanProcessor::Indices const&,std::basic_string<char16_t> const&>(uint64_t *a1, _OWORD *a2, __int128 *a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __int128 v12;
  std::basic_string<char16_t> *v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v17[2];
  unint64_t v18;
  unint64_t v19;
  uint64_t *v20;

  v3 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 3);
  v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) > 0x492492492492492)
    std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
  v8 = a1 + 2;
  if (0xDB6DB6DB6DB6DB6ELL * ((a1[2] - *a1) >> 3) > v4)
    v4 = 0xDB6DB6DB6DB6DB6ELL * ((a1[2] - *a1) >> 3);
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((a1[2] - *a1) >> 3)) >= 0x249249249249249)
    v9 = 0x492492492492492;
  else
    v9 = v4;
  v20 = v8;
  if (v9)
    v9 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>>(v9);
  else
    v10 = 0;
  v11 = v9 + 56 * v3;
  v17[0] = v9;
  v17[1] = v11;
  v18 = v11;
  v19 = v9 + 56 * v10;
  v12 = a2[1];
  *(_OWORD *)v11 = *a2;
  *(_OWORD *)(v11 + 16) = v12;
  v13 = (std::basic_string<char16_t> *)(v11 + 32);
  if (*((char *)a3 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(v13, *(const std::basic_string<char16_t>::value_type **)a3, *((_QWORD *)a3 + 1));
    v11 = v18;
  }
  else
  {
    v14 = *a3;
    *(_QWORD *)(v11 + 48) = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
  }
  v18 = v11 + 56;
  std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::__swap_out_circular_buffer(a1, v17);
  v15 = a1[1];
  std::__split_buffer<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::~__split_buffer((uint64_t)v17);
  return v15;
}

void sub_1C22F7AE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>>(unint64_t a1)
{
  if (a1 >= 0x492492492492493)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(56 * a1);
}

uint64_t *std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

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
      v5 = v4 - 56;
      v6 = *(_OWORD *)(v3 - 56);
      *(_OWORD *)(v4 - 40) = *(_OWORD *)(v3 - 40);
      *(_OWORD *)(v4 - 56) = v6;
      v7 = *(_OWORD *)(v3 - 24);
      *(_QWORD *)(v4 - 8) = *(_QWORD *)(v3 - 8);
      *(_OWORD *)(v4 - 24) = v7;
      *(_QWORD *)(v3 - 16) = 0;
      *(_QWORD *)(v3 - 8) = 0;
      *(_QWORD *)(v3 - 24) = 0;
      v4 -= 56;
      v3 -= 56;
    }
    while (v3 != v2);
  }
  a2[1] = v5;
  v8 = *result;
  *result = v5;
  a2[1] = v8;
  v9 = result[1];
  result[1] = a2[2];
  a2[2] = v9;
  v10 = result[2];
  result[2] = a2[3];
  a2[3] = v10;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      v4 = v2 - 56;
      *(_QWORD *)(a1 + 16) = v2 - 56;
      if (*(char *)(v2 - 1) < 0)
      {
        operator delete(*(void **)(v2 - 24));
        v4 = *(_QWORD *)(a1 + 16);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__introsort<std::_ClassicAlgPolicy,nl_featurization::span_matching::span_processor::SpanProcessor::selectSpansMatchingOptionsUsingOnlyLongestTokenChain(std::basic_string<char16_t> const&,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices> const&,std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>> &)::$_0 &,nl_featurization::span_matching::span_processor::SpanProcessor::Indices*,false>(uint64_t a1, __int128 *a2, uint64_t a3, char a4)
{
  __int128 *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  __int128 *v23;
  unint64_t v24;
  unint64_t v25;
  _BOOL4 v26;
  _BOOL4 v27;
  unint64_t v28;
  unint64_t v29;
  BOOL v30;
  BOOL v31;
  __int128 *v32;
  __int128 v33;
  __int128 v34;
  unint64_t v35;
  unint64_t v36;
  BOOL v37;
  BOOL v38;
  unint64_t v39;
  unint64_t v40;
  _BOOL4 v41;
  _BOOL4 v42;
  __int128 v43;
  BOOL v44;
  unint64_t v45;
  BOOL v46;
  unint64_t v47;
  unint64_t v48;
  BOOL v49;
  BOOL v50;
  unint64_t *v51;
  unint64_t v52;
  _BOOL4 v53;
  _BOOL4 v54;
  __int128 *v55;
  unint64_t v56;
  unint64_t v57;
  BOOL v58;
  BOOL v59;
  __int128 v60;
  unint64_t v61;
  unint64_t v62;
  _BOOL4 v63;
  _BOOL4 v64;
  unint64_t v65;
  unint64_t v66;
  BOOL v67;
  BOOL v68;
  __int128 v69;
  unint64_t v70;
  _BOOL4 v71;
  __int128 v72;
  __int128 *v73;
  __int128 *v74;
  __int128 *v75;
  unint64_t v76;
  unint64_t v77;
  _BOOL4 v78;
  __int128 v79;
  __int128 v80;
  unint64_t v81;
  unint64_t v82;
  _BOOL4 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  unint64_t v87;
  unint64_t v88;
  _BOOL4 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  unint64_t v93;
  _BOOL4 v94;
  __int128 v95;
  __int128 *v96;
  BOOL v97;
  char v98;
  uint64_t v99;
  unint64_t v100;
  __int128 *v101;
  unint64_t v102;
  unint64_t v103;
  _BOOL4 v104;
  uint64_t v105;
  uint64_t v106;
  __int128 v107;
  unint64_t v108;
  BOOL v109;
  BOOL v110;
  uint64_t v111;
  int64_t v112;
  int64_t v113;
  int64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  _BOOL4 v119;
  unint64_t v120;
  unint64_t v121;
  unint64_t v122;
  BOOL v123;
  _OWORD *v124;
  __int128 v125;
  uint64_t v126;
  unint64_t v127;
  _BOOL4 v128;
  _BOOL4 v129;
  _BOOL4 v130;
  uint64_t v131;
  uint64_t v132;
  _OWORD *v133;
  __int128 *v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  _BOOL4 v138;
  __int128 v139;
  __int128 v140;
  uint64_t v141;
  unint64_t v142;
  unint64_t v143;
  unint64_t v144;
  unint64_t v145;
  _BOOL4 v146;
  __int128 *v147;
  __int128 v148;
  BOOL v149;
  uint64_t v151;
  unint64_t v152;
  unint64_t v153;
  _BOOL4 v154;
  uint64_t v155;
  __int128 v156;
  unint64_t v157;
  unint64_t v158;
  BOOL v159;
  BOOL v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;

__int128 *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::span_matching::span_processor::SpanProcessor::selectSpansMatchingOptionsUsingOnlyLongestTokenChain(std::basic_string<char16_t> const&,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices> const&,std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>> &)::$_0 &,nl_featurization::span_matching::span_processor::SpanProcessor::Indices*>(__int128 *result, unint64_t *a2, __int128 *a3)
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  _BOOL4 v6;
  BOOL v7;
  _BOOL4 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BOOL4 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BOOL4 v22;
  __int128 v23;

  v3 = *a2;
  v4 = a2[1];
  v5 = *a2 < *(_QWORD *)result;
  if (*a2 == *(_QWORD *)result)
    v5 = v4 > *((_QWORD *)result + 1);
  v6 = *((_QWORD *)a3 + 1) > v4;
  v7 = *(_QWORD *)a3 == v3;
  v8 = *(_QWORD *)a3 < v3;
  if (v7)
    v8 = v6;
  if (v5)
  {
    if (v8)
    {
      v10 = *result;
      v9 = result[1];
      v11 = a3[1];
      *result = *a3;
      result[1] = v11;
LABEL_17:
      *a3 = v10;
      a3[1] = v9;
      return result;
    }
    v20 = *result;
    v19 = result[1];
    v21 = *((_OWORD *)a2 + 1);
    *result = *(_OWORD *)a2;
    result[1] = v21;
    *(_OWORD *)a2 = v20;
    *((_OWORD *)a2 + 1) = v19;
    v22 = *(_QWORD *)a3 < *a2;
    if (*(_QWORD *)a3 == *a2)
      v22 = *((_QWORD *)a3 + 1) > a2[1];
    if (v22)
    {
      v10 = *(_OWORD *)a2;
      v9 = *((_OWORD *)a2 + 1);
      v23 = a3[1];
      *(_OWORD *)a2 = *a3;
      *((_OWORD *)a2 + 1) = v23;
      goto LABEL_17;
    }
  }
  else if (v8)
  {
    v13 = *(_OWORD *)a2;
    v12 = *((_OWORD *)a2 + 1);
    v14 = a3[1];
    *(_OWORD *)a2 = *a3;
    *((_OWORD *)a2 + 1) = v14;
    *a3 = v13;
    a3[1] = v12;
    v15 = *a2 < *(_QWORD *)result;
    if (*a2 == *(_QWORD *)result)
      v15 = a2[1] > *((_QWORD *)result + 1);
    if (v15)
    {
      v17 = *result;
      v16 = result[1];
      v18 = *((_OWORD *)a2 + 1);
      *result = *(_OWORD *)a2;
      result[1] = v18;
      *(_OWORD *)a2 = v17;
      *((_OWORD *)a2 + 1) = v16;
    }
  }
  return result;
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::span_matching::span_processor::SpanProcessor::selectSpansMatchingOptionsUsingOnlyLongestTokenChain(std::basic_string<char16_t> const&,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices> const&,std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>> &)::$_0 &,nl_featurization::span_matching::span_processor::SpanProcessor::Indices*>(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  __n128 result;
  _BOOL4 v9;
  __int128 v10;
  __int128 v11;
  _BOOL4 v12;
  __n128 v13;
  __n128 v14;
  _BOOL4 v15;
  __int128 v16;
  __n128 v17;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::span_matching::span_processor::SpanProcessor::selectSpansMatchingOptionsUsingOnlyLongestTokenChain(std::basic_string<char16_t> const&,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices> const&,std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>> &)::$_0 &,nl_featurization::span_matching::span_processor::SpanProcessor::Indices*>((__int128 *)a1, a2->n128_u64, (__int128 *)a3);
  v9 = *(_QWORD *)a4 < *(_QWORD *)a3;
  if (*(_QWORD *)a4 == *(_QWORD *)a3)
    v9 = *(_QWORD *)(a4 + 8) > *(_QWORD *)(a3 + 8);
  if (v9)
  {
    v10 = *(_OWORD *)a3;
    result = *(__n128 *)(a3 + 16);
    v11 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_OWORD *)(a3 + 16) = v11;
    *(_OWORD *)a4 = v10;
    *(__n128 *)(a4 + 16) = result;
    v12 = *(_QWORD *)a3 < a2->n128_u64[0];
    if (*(_QWORD *)a3 == a2->n128_u64[0])
      v12 = *(_QWORD *)(a3 + 8) > a2->n128_u64[1];
    if (v12)
    {
      v13 = *a2;
      result = a2[1];
      v14 = *(__n128 *)(a3 + 16);
      *a2 = *(__n128 *)a3;
      a2[1] = v14;
      *(__n128 *)a3 = v13;
      *(__n128 *)(a3 + 16) = result;
      v15 = a2->n128_u64[0] < *(_QWORD *)a1;
      if (a2->n128_u64[0] == *(_QWORD *)a1)
        v15 = a2->n128_u64[1] > *(_QWORD *)(a1 + 8);
      if (v15)
      {
        v16 = *(_OWORD *)a1;
        result = *(__n128 *)(a1 + 16);
        v17 = a2[1];
        *(__n128 *)a1 = *a2;
        *(__n128 *)(a1 + 16) = v17;
        *a2 = (__n128)v16;
        a2[1] = result;
      }
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::span_matching::span_processor::SpanProcessor::selectSpansMatchingOptionsUsingOnlyLongestTokenChain(std::basic_string<char16_t> const&,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices> const&,std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>> &)::$_0 &,nl_featurization::span_matching::span_processor::SpanProcessor::Indices*>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _BOOL8 result;
  unint64_t v6;
  __int128 *v7;
  BOOL v8;
  _BOOL4 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  unint64_t v23;
  BOOL v24;
  BOOL v25;
  uint64_t v26;
  __int128 *v27;
  __int128 *v28;
  __int128 *v29;
  unint64_t v30;
  unint64_t v31;
  __int128 *v32;
  unint64_t v33;
  _BOOL4 v34;
  _BOOL4 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unint64_t v39;
  unint64_t v40;
  _BOOL4 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  unint64_t v45;
  unint64_t v46;
  _BOOL4 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  unint64_t v51;
  _BOOL4 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;

  v4 = (a2 - a1) >> 5;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(_QWORD *)(a2 - 32);
      v7 = (__int128 *)(a2 - 32);
      v8 = v6 == *(_QWORD *)a1;
      v9 = v6 < *(_QWORD *)a1;
      if (v8)
        v9 = *(_QWORD *)(a2 - 24) > *(_QWORD *)(a1 + 8);
      if (v9)
      {
        v11 = *(_OWORD *)a1;
        v10 = *(_OWORD *)(a1 + 16);
        v12 = *(_OWORD *)(a2 - 16);
        *(_OWORD *)a1 = *v7;
        *(_OWORD *)(a1 + 16) = v12;
        *v7 = v11;
        *(_OWORD *)(a2 - 16) = v10;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::span_matching::span_processor::SpanProcessor::selectSpansMatchingOptionsUsingOnlyLongestTokenChain(std::basic_string<char16_t> const&,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices> const&,std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>> &)::$_0 &,nl_featurization::span_matching::span_processor::SpanProcessor::Indices*>((__int128 *)a1, (unint64_t *)(a1 + 32), (__int128 *)(a2 - 32));
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::span_matching::span_processor::SpanProcessor::selectSpansMatchingOptionsUsingOnlyLongestTokenChain(std::basic_string<char16_t> const&,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices> const&,std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>> &)::$_0 &,nl_featurization::span_matching::span_processor::SpanProcessor::Indices*>(a1, (__n128 *)(a1 + 32), a1 + 64, a2 - 32);
      return 1;
    case 5:
      v27 = (__int128 *)(a1 + 32);
      v28 = (__int128 *)(a1 + 64);
      v29 = (__int128 *)(a1 + 96);
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::span_matching::span_processor::SpanProcessor::selectSpansMatchingOptionsUsingOnlyLongestTokenChain(std::basic_string<char16_t> const&,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices> const&,std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>> &)::$_0 &,nl_featurization::span_matching::span_processor::SpanProcessor::Indices*>(a1, (__n128 *)(a1 + 32), a1 + 64, a1 + 96);
      v30 = *(_QWORD *)(a2 - 32);
      v31 = *(_QWORD *)(a2 - 24);
      v32 = (__int128 *)(a2 - 32);
      v33 = *(_QWORD *)(a1 + 96);
      v34 = v31 > *(_QWORD *)(a1 + 104);
      v8 = v30 == v33;
      v35 = v30 < v33;
      if (v8)
        v35 = v34;
      if (v35)
      {
        v37 = *v29;
        v36 = *(_OWORD *)(a1 + 112);
        v38 = v32[1];
        *v29 = *v32;
        *(_OWORD *)(a1 + 112) = v38;
        *v32 = v37;
        v32[1] = v36;
        v39 = *(_QWORD *)(a1 + 96);
        v40 = *(_QWORD *)(a1 + 64);
        v8 = v39 == v40;
        v41 = v39 < v40;
        if (v8)
          v41 = *(_QWORD *)(a1 + 104) > *(_QWORD *)(a1 + 72);
        if (v41)
        {
          v43 = *v28;
          v42 = *(_OWORD *)(a1 + 80);
          v44 = *(_OWORD *)(a1 + 112);
          *v28 = *v29;
          *(_OWORD *)(a1 + 80) = v44;
          *v29 = v43;
          *(_OWORD *)(a1 + 112) = v42;
          v45 = *(_QWORD *)(a1 + 64);
          v46 = *(_QWORD *)(a1 + 32);
          v8 = v45 == v46;
          v47 = v45 < v46;
          if (v8)
            v47 = *(_QWORD *)(a1 + 72) > *(_QWORD *)(a1 + 40);
          if (v47)
          {
            v49 = *v27;
            v48 = *(_OWORD *)(a1 + 48);
            v50 = *(_OWORD *)(a1 + 80);
            *v27 = *v28;
            *(_OWORD *)(a1 + 48) = v50;
            *v28 = v49;
            *(_OWORD *)(a1 + 80) = v48;
            v51 = *(_QWORD *)(a1 + 32);
            v8 = v51 == *(_QWORD *)a1;
            v52 = v51 < *(_QWORD *)a1;
            if (v8)
              v52 = *(_QWORD *)(a1 + 40) > *(_QWORD *)(a1 + 8);
            if (v52)
            {
              v54 = *(_OWORD *)a1;
              v53 = *(_OWORD *)(a1 + 16);
              v55 = *(_OWORD *)(a1 + 48);
              *(_OWORD *)a1 = *v27;
              *(_OWORD *)(a1 + 16) = v55;
              *v27 = v54;
              *(_OWORD *)(a1 + 48) = v53;
            }
          }
        }
      }
      return 1;
    default:
      v13 = (_QWORD *)(a1 + 64);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::span_matching::span_processor::SpanProcessor::selectSpansMatchingOptionsUsingOnlyLongestTokenChain(std::basic_string<char16_t> const&,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices> const&,std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>> &)::$_0 &,nl_featurization::span_matching::span_processor::SpanProcessor::Indices*>((__int128 *)a1, (unint64_t *)(a1 + 32), (__int128 *)(a1 + 64));
      v14 = a1 + 96;
      if (a1 + 96 == a2)
        return 1;
      v15 = 0;
      v16 = 0;
      break;
  }
  while (1)
  {
    v17 = *(_QWORD *)v14;
    v18 = *(_QWORD *)(v14 + 8);
    v19 = *(_QWORD *)v14 < *v13;
    if (*(_QWORD *)v14 == *v13)
      v19 = v18 > v13[1];
    if (v19)
    {
      v56 = *(_OWORD *)(v14 + 16);
      v20 = v15;
      while (1)
      {
        v21 = a1 + v20;
        v22 = *(_OWORD *)(a1 + v20 + 80);
        *(_OWORD *)(v21 + 96) = *(_OWORD *)(a1 + v20 + 64);
        *(_OWORD *)(v21 + 112) = v22;
        if (v20 == -64)
          break;
        v23 = *(_QWORD *)(v21 + 32);
        v24 = v18 > *(_QWORD *)(v21 + 40);
        v8 = v17 == v23;
        v25 = v17 < v23;
        if (!v8)
          v24 = v25;
        v20 -= 32;
        if (!v24)
        {
          v26 = a1 + v20 + 96;
          goto LABEL_19;
        }
      }
      v26 = a1;
LABEL_19:
      *(_QWORD *)v26 = v17;
      *(_QWORD *)(v26 + 8) = v18;
      *(_OWORD *)(v26 + 16) = v56;
      if (++v16 == 8)
        return v14 + 32 == a2;
    }
    v13 = (_QWORD *)v14;
    v15 += 32;
    v14 += 32;
    if (v14 == a2)
      return 1;
  }
}

char *std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 59)
    std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,std::vector<unsigned long>>>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

uint64_t nl_featurization::span_matching::span_processor::SpanProcessor::addSpansFromSubTokens(uint64_t a1, uint64_t a2, __int128 *a3, URegularExpression **a4, _QWORD *a5)
{
  uint64_t v8;
  uint64_t result;
  std::basic_string<char16_t>::value_type v11;
  std::basic_string<char16_t>::size_type v12;
  std::basic_string<char16_t> *v13;
  int32_t v14;
  int32_t v15;
  std::basic_string<char16_t>::value_type v16;
  __int128 v17;
  std::runtime_error *exception;
  std::string *v19;
  __int128 v20;
  std::runtime_error *v21;
  std::string *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  std::basic_string<char16_t> v26;
  UErrorCode status;

  v8 = a2;
  status = U_ZERO_ERROR;
  if (*(char *)(a2 + 23) < 0)
    a2 = *(_QWORD *)a2;
  uregex_setText(*a4, (const UChar *)a2, -1, &status);
  if (status >= U_ILLEGAL_ARGUMENT_ERROR)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    toString(v8, (std::string *)&v26);
    v19 = std::string::insert((std::string *)&v26, 0, "Failed to attach the regex expression to the token text: ");
    v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
    *(_QWORD *)&v25 = *((_QWORD *)&v19->__r_.__value_.__l + 2);
    v24 = v20;
    v19->__r_.__value_.__l.__size_ = 0;
    v19->__r_.__value_.__r.__words[2] = 0;
    v19->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, (const std::string *)&v24);
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  result = uregex_find(*a4, 0, &status);
  if (status >= U_ILLEGAL_ARGUMENT_ERROR)
  {
    v21 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    toString(v8, (std::string *)&v26);
    v22 = std::string::insert((std::string *)&v26, 0, "Failed to find match in text: ");
    v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
    *(_QWORD *)&v25 = *((_QWORD *)&v22->__r_.__value_.__l + 2);
    v24 = v23;
    v22->__r_.__value_.__l.__size_ = 0;
    v22->__r_.__value_.__r.__words[2] = 0;
    v22->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(v21, (const std::string *)&v24);
    __cxa_throw(v21, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  if ((_DWORD)result)
  {
    memset(&v26, 0, sizeof(v26));
    if (*(char *)(v8 + 23) >= 0)
      v12 = *(unsigned __int8 *)(v8 + 23);
    else
      v12 = *(_QWORD *)(v8 + 8);
    std::basic_string<char16_t>::resize(&v26, v12, v11);
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v13 = &v26;
    else
      v13 = (std::basic_string<char16_t> *)v26.__r_.__value_.__r.__words[0];
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v14 = HIBYTE(v26.__r_.__value_.__r.__words[2]);
    else
      v14 = v26.__r_.__value_.__r.__words[1];
    v15 = uregex_group(*a4, 1, (UChar *)v13, v14, &status);
    if (v15 >= 1
      && (std::basic_string<char16_t>::resize(&v26, v15, v16),
          nl_featurization::pattern_trie::PatternTrie::search((uint64_t **)(a1 + 40), (uint64_t)&v26)))
    {
      v17 = a3[1];
      v24 = *a3;
      v25 = v17;
      nl_featurization::span_matching::span_processor::SpanProcessor::appendMatchedSpan((_QWORD *)a1, (unsigned __int16 *)&v26, &v24, a5);
      if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v26.__r_.__value_.__l.__data_);
      return 1;
    }
    else
    {
      if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v26.__r_.__value_.__l.__data_);
      return 0;
    }
  }
  return result;
}

void sub_1C22F8C68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::basic_string<char16_t>::reserve(std::basic_string<char16_t> *this, std::basic_string<char16_t>::size_type __requested_capacity)
{
  unint64_t v3;
  std::basic_string<char16_t>::size_type v4;
  std::basic_string<char16_t>::size_type v5;
  unint64_t v6;
  unint64_t v7;
  std::basic_string<char16_t>::size_type v8;
  std::basic_string<char16_t>::size_type v9;
  uint64_t v10;
  uint64_t v11;
  std::basic_string<char16_t> *v12;
  int v13;
  void *v14;
  uint64_t v15;
  std::basic_string<char16_t>::size_type size;
  int v17;
  BOOL v18;
  std::basic_string<char16_t>::size_type v19;

  if (__requested_capacity >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  LODWORD(v3) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v3 & 0x80000000) == 0)
  {
    if (__requested_capacity <= 0xA)
      return;
    v4 = HIBYTE(this->__r_.__value_.__r.__words[2]);
    if (v4 <= __requested_capacity)
      v5 = __requested_capacity;
    else
      v5 = HIBYTE(this->__r_.__value_.__r.__words[2]);
    if ((v5 | 3) != 0xB)
    {
      v11 = (v5 | 3) + 1;
      goto LABEL_24;
    }
    v6 = (v5 & 0xFFFFFFFFFFFFFFFCLL) + 4;
LABEL_20:
    v11 = v6 + 1;
    if (v6 < 0xB)
    {
      v12 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
      v13 = 1;
      v14 = this;
      if ((v3 & 0x80) != 0)
        goto LABEL_28;
      goto LABEL_26;
    }
LABEL_24:
    v14 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v11);
    v11 = v15;
    LODWORD(v3) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
    if ((v3 & 0x80000000) != 0)
    {
      LOBYTE(v13) = 0;
      v12 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
LABEL_28:
      size = this->__r_.__value_.__l.__size_;
      v17 = 1;
LABEL_29:
      v18 = __CFADD__(size, 1);
      v19 = size + 1;
      if (v18)
      {
        if (v17)
          goto LABEL_35;
      }
      else
      {
        memmove(v14, v12, 2 * v19);
        if (v17)
        {
LABEL_35:
          operator delete(v12);
          if ((v13 & 1) == 0)
            goto LABEL_36;
          goto LABEL_33;
        }
      }
      if ((v13 & 1) == 0)
      {
LABEL_36:
        this->__r_.__value_.__l.__size_ = v4;
        this->__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
        this->__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)v14;
        return;
      }
LABEL_33:
      *((_BYTE *)&this->__r_.__value_.__s + 23) = v4 & 0x7F;
      return;
    }
    v13 = 0;
    v12 = this;
LABEL_26:
    size = v3;
    v17 = v13;
    goto LABEL_29;
  }
  v7 = this->__r_.__value_.__r.__words[2];
  v8 = (v7 & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if (v8 < __requested_capacity)
  {
    v4 = this->__r_.__value_.__l.__size_;
    if (v4 <= __requested_capacity)
      v9 = __requested_capacity;
    else
      v9 = this->__r_.__value_.__l.__size_;
    v10 = (v9 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((v9 | 3) != 0xB)
      v10 = v9 | 3;
    v6 = v9 >= 0xB ? v10 : 10;
    if (v6 != v8)
    {
      v3 = HIBYTE(v7);
      goto LABEL_20;
    }
  }
}

void sub_1C22F8E7C(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

void nl_featurization::span_matching::span_processor::SpanProcessor::appendMatchedSpan(_QWORD *a1, unsigned __int16 *a2, __int128 *a3, _QWORD *a4)
{
  unsigned __int16 *v8;
  __int128 *v9;
  __int128 *v10;
  unint64_t v11;
  int8x8_t v12;
  unint64_t v13;
  uint8x8_t v14;
  unint64_t v15;
  unint64_t v16;
  unsigned __int16 **v17;
  unsigned __int16 *i;
  unint64_t v19;
  unsigned __int16 *v20;
  _OWORD *v21;
  _QWORD *v22;
  _OWORD *v23;
  _QWORD *v24;
  _OWORD *v25;
  unsigned __int16 *v26;
  unsigned __int16 *v27;
  _OWORD *v28;
  unint64_t v29;
  _OWORD *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _OWORD *v37;
  char *v38;
  char *v39;
  _OWORD *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 *v44;
  __int128 *v45;
  uint64_t v46;
  __int128 *v47;
  __int128 **v48;

  if (!std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::find<std::basic_string<char16_t>>(a1, a2))__assert_rtn("appendMatchedSpan", "span_processor.cpp", 172, "mInternals.reverseMapping.find(str) != mInternals.reverseMapping.end() && \"Unable to find token chain in reverse mapping after a match was found in the pattern \" \"trie\"");
  v8 = std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::find<std::basic_string<char16_t>>(a1, a2);
  v45 = 0;
  v46 = 0;
  v44 = 0;
  std::vector<std::basic_string<char16_t>>::__init_with_size[abi:ne180100]<std::basic_string<char16_t>*,std::basic_string<char16_t>*>((uint64_t)&v44, *((__int128 **)v8 + 5), *((__int128 **)v8 + 6), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v8 + 6) - *((_QWORD *)v8 + 5)) >> 3));
  v9 = v44;
  v10 = v45;
  v42 = *a3;
  v43 = a3[1];
  while (v9 != v10)
  {
    v11 = std::__string_hash<char16_t>::operator()[abi:ne180100]((uint64_t)v9);
    v12 = (int8x8_t)a4[1];
    if (v12)
    {
      v13 = v11;
      v14 = (uint8x8_t)vcnt_s8(v12);
      v14.i16[0] = vaddlv_u8(v14);
      v15 = v14.u32[0];
      if (v14.u32[0] > 1uLL)
      {
        v16 = v11;
        if (v11 >= *(_QWORD *)&v12)
          v16 = v11 % *(_QWORD *)&v12;
      }
      else
      {
        v16 = (*(_QWORD *)&v12 - 1) & v11;
      }
      v17 = *(unsigned __int16 ***)(*a4 + 8 * v16);
      if (v17)
      {
        for (i = *v17; i; i = *(unsigned __int16 **)i)
        {
          v19 = *((_QWORD *)i + 1);
          if (v19 == v13)
          {
            if (std::equal_to<std::basic_string<char16_t>>::operator()[abi:ne180100](i + 8, (unsigned __int16 *)v9))
            {
              v47 = v9;
              v26 = std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::piecewise_construct_t const&,std::tuple<std::basic_string<char16_t> const&>,std::tuple<>>((uint64_t)a4, (unsigned __int16 *)v9, &v47);
              v27 = v26;
              v28 = (_OWORD *)*((_QWORD *)v26 + 6);
              v29 = *((_QWORD *)v26 + 7);
              if ((unint64_t)v28 >= v29)
              {
                v31 = *((_QWORD *)v26 + 5);
                v32 = ((uint64_t)v28 - v31) >> 5;
                v33 = v32 + 1;
                if ((unint64_t)(v32 + 1) >> 59)
                  std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
                v34 = v29 - v31;
                if (v34 >> 4 > v33)
                  v33 = v34 >> 4;
                if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFE0)
                  v35 = 0x7FFFFFFFFFFFFFFLL;
                else
                  v35 = v33;
                if (v35)
                  v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,std::vector<unsigned long>>>>(v35);
                else
                  v36 = 0;
                v37 = (_OWORD *)(v35 + 32 * v32);
                *v37 = v42;
                v37[1] = v43;
                v39 = (char *)*((_QWORD *)v27 + 5);
                v38 = (char *)*((_QWORD *)v27 + 6);
                v40 = v37;
                if (v38 != v39)
                {
                  do
                  {
                    v41 = *((_OWORD *)v38 - 1);
                    *(v40 - 2) = *((_OWORD *)v38 - 2);
                    *(v40 - 1) = v41;
                    v40 -= 2;
                    v38 -= 32;
                  }
                  while (v38 != v39);
                  v38 = (char *)*((_QWORD *)v27 + 5);
                }
                v30 = v37 + 2;
                *((_QWORD *)v27 + 5) = v40;
                *((_QWORD *)v27 + 6) = v37 + 2;
                *((_QWORD *)v27 + 7) = v35 + 32 * v36;
                if (v38)
                  operator delete(v38);
              }
              else
              {
                *v28 = v42;
                v28[1] = v43;
                v30 = v28 + 2;
              }
              *((_QWORD *)v27 + 6) = v30;
              goto LABEL_26;
            }
          }
          else
          {
            if (v15 > 1)
            {
              if (v19 >= *(_QWORD *)&v12)
                v19 %= *(_QWORD *)&v12;
            }
            else
            {
              v19 &= *(_QWORD *)&v12 - 1;
            }
            if (v19 != v16)
              break;
          }
        }
      }
    }
    v47 = v9;
    v20 = std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::piecewise_construct_t const&,std::tuple<std::basic_string<char16_t> const&>,std::tuple<>>((uint64_t)a4, (unsigned __int16 *)v9, &v47);
    v22 = v20 + 20;
    v21 = (_OWORD *)*((_QWORD *)v20 + 5);
    v23 = (_OWORD *)*((_QWORD *)v20 + 7);
    if (v23 == v21)
    {
      if (v23)
      {
        *((_QWORD *)v20 + 6) = v23;
        operator delete(v23);
        *v22 = 0;
        *((_QWORD *)v20 + 6) = 0;
        *((_QWORD *)v20 + 7) = 0;
      }
      std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>::__vallocate[abi:ne180100](v22, 1uLL);
      v25 = (_OWORD *)*((_QWORD *)v20 + 6);
      v24 = v20 + 24;
      v21 = v25;
    }
    else
    {
      v24 = v20 + 24;
    }
    *v21 = v42;
    v21[1] = v43;
    *v24 = v21 + 2;
LABEL_26:
    v9 = (__int128 *)((char *)v9 + 24);
  }
  v48 = &v44;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
}

void sub_1C22F9168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, void **a18)
{
  a18 = (void **)&a14;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a18);
  _Unwind_Resume(a1);
}

unsigned __int16 *std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::piecewise_construct_t const&,std::tuple<std::basic_string<char16_t> const&>,std::tuple<>>(uint64_t a1, unsigned __int16 *a2, __int128 **a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  unsigned __int16 **v12;
  unsigned __int16 *i;
  unint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  std::basic_string<char16_t> *v17;
  __int128 *v18;
  __int128 v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  int8x8_t prime;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  uint8x8_t v31;
  unint64_t v32;
  uint8x8_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  unsigned __int16 **v37;
  unint64_t v38;
  void *v40;
  _QWORD v41[2];
  char v42;

  v7 = std::__string_hash<char16_t>::operator()[abi:ne180100]((uint64_t)a2);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      v3 = v7;
      if (v7 >= v9)
        v3 = v7 % v9;
    }
    else
    {
      v3 = (v9 - 1) & v7;
    }
    v12 = *(unsigned __int16 ***)(*(_QWORD *)a1 + 8 * v3);
    if (v12)
    {
      for (i = *v12; i; i = *(unsigned __int16 **)i)
      {
        v14 = *((_QWORD *)i + 1);
        if (v14 == v8)
        {
          if (std::equal_to<std::basic_string<char16_t>>::operator()[abi:ne180100](i + 8, a2))
            return i;
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9)
              v14 %= v9;
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3)
            break;
        }
      }
    }
  }
  v15 = (_QWORD *)(a1 + 16);
  v16 = operator new(0x40uLL);
  v41[0] = v16;
  v41[1] = a1 + 16;
  v42 = 0;
  *v16 = 0;
  v16[1] = v8;
  v17 = (std::basic_string<char16_t> *)(v16 + 2);
  v18 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(v17, *(const std::basic_string<char16_t>::value_type **)v18, *((_QWORD *)v18 + 1));
  }
  else
  {
    v19 = *v18;
    v16[4] = *((_QWORD *)v18 + 2);
    *(_OWORD *)&v17->__r_.__value_.__l.__data_ = v19;
  }
  v16[5] = 0;
  v16[6] = 0;
  v16[7] = 0;
  v42 = 1;
  v20 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v21 = *(float *)(a1 + 32);
  if (!v9 || (float)(v21 * (float)v9) < v20)
  {
    v22 = 1;
    if (v9 >= 3)
      v22 = (v9 & (v9 - 1)) != 0;
    v23 = v22 | (2 * v9);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      prime = (int8x8_t)v24;
    else
      prime = (int8x8_t)v23;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v9 = *(_QWORD *)(a1 + 8);
    if (*(_QWORD *)&prime > v9)
      goto LABEL_33;
    if (*(_QWORD *)&prime < v9)
    {
      v32 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v9 < 3 || (v33 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v33.i16[0] = vaddlv_u8(v33), v33.u32[0] > 1uLL))
      {
        v32 = std::__next_prime(v32);
      }
      else
      {
        v34 = 1 << -(char)__clz(v32 - 1);
        if (v32 >= 2)
          v32 = v34;
      }
      if (*(_QWORD *)&prime <= v32)
        prime = (int8x8_t)v32;
      if (*(_QWORD *)&prime >= v9)
      {
        v9 = *(_QWORD *)(a1 + 8);
      }
      else
      {
        if (prime)
        {
LABEL_33:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v26 = operator new(8 * *(_QWORD *)&prime);
          v27 = *(void **)a1;
          *(_QWORD *)a1 = v26;
          if (v27)
            operator delete(v27);
          v28 = 0;
          *(int8x8_t *)(a1 + 8) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v28++) = 0;
          while (*(_QWORD *)&prime != v28);
          v29 = (_QWORD *)*v15;
          if (*v15)
          {
            v30 = v29[1];
            v31 = (uint8x8_t)vcnt_s8(prime);
            v31.i16[0] = vaddlv_u8(v31);
            if (v31.u32[0] > 1uLL)
            {
              if (v30 >= *(_QWORD *)&prime)
                v30 %= *(_QWORD *)&prime;
            }
            else
            {
              v30 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v30) = v15;
            v35 = (_QWORD *)*v29;
            if (*v29)
            {
              do
              {
                v36 = v35[1];
                if (v31.u32[0] > 1uLL)
                {
                  if (v36 >= *(_QWORD *)&prime)
                    v36 %= *(_QWORD *)&prime;
                }
                else
                {
                  v36 &= *(_QWORD *)&prime - 1;
                }
                if (v36 != v30)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v36))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v36) = v29;
                    goto LABEL_58;
                  }
                  *v29 = *v35;
                  *v35 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v36);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v36) = v35;
                  v35 = v29;
                }
                v36 = v30;
LABEL_58:
                v29 = v35;
                v35 = (_QWORD *)*v35;
                v30 = v36;
              }
              while (v35);
            }
          }
          v9 = (unint64_t)prime;
          goto LABEL_62;
        }
        v40 = *(void **)a1;
        *(_QWORD *)a1 = 0;
        if (v40)
          operator delete(v40);
        v9 = 0;
        *(_QWORD *)(a1 + 8) = 0;
      }
    }
LABEL_62:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v3 = v8 % v9;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v9 - 1) & v8;
    }
  }
  v37 = *(unsigned __int16 ***)(*(_QWORD *)a1 + 8 * v3);
  i = (unsigned __int16 *)v41[0];
  if (v37)
  {
    *(_QWORD *)v41[0] = *v37;
LABEL_75:
    *v37 = i;
    goto LABEL_76;
  }
  *(_QWORD *)v41[0] = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = v15;
  if (*(_QWORD *)i)
  {
    v38 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v38 >= v9)
        v38 %= v9;
    }
    else
    {
      v38 &= v9 - 1;
    }
    v37 = (unsigned __int16 **)(*(_QWORD *)a1 + 8 * v38);
    goto LABEL_75;
  }
LABEL_76:
  v41[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,void *>>>>::reset[abi:ne180100]((uint64_t)v41);
  return i;
}

void sub_1C22F95CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::basic_string<char16_t> const,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,0>((uint64_t)v1 + 16);
    operator delete(v1);
  }
}

uint64_t nl_featurization::span_matching::span_processor::SpanProcessor::matchCharacterBasedSpans@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, _BYTE *a3@<X2>, void **a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  __int128 v11;
  char *v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  __int128 v21;
  char *v22;
  int v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _OWORD v28[2];
  int v29;
  std::basic_string<char16_t> v30;
  __int128 v31;

  memset(v28, 0, sizeof(v28));
  v29 = 1065353216;
  nl_featurization::span_matching::span_processor::SpanProcessor::findAndAddSpans(a1, a2, v28);
  v25 = 0;
  v26 = 0;
  v27 = 0;
  nl_featurization::span_matching::span_processor::SpanProcessor::selectSpansMatchingOptions(v6, (uint64_t)v28, a3, &v25);
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  v7 = v25;
  v8 = v26;
  if (v25 != v26)
  {
    v9 = 0;
    while (1)
    {
      if (*(char *)(v7 + 55) < 0)
        std::basic_string<char16_t>::__init_copy_ctor_external(&v30, *(const std::basic_string<char16_t>::value_type **)(v7 + 32), *(_QWORD *)(v7 + 40));
      else
        v30 = *(std::basic_string<char16_t> *)(v7 + 32);
      v31 = *(_OWORD *)v7;
      v10 = (unint64_t)a4[2];
      if ((unint64_t)v9 >= v10)
        break;
      v11 = *(_OWORD *)&v30.__r_.__value_.__l.__data_;
      *((_QWORD *)v9 + 2) = *((_QWORD *)&v30.__r_.__value_.__l + 2);
      *(_OWORD *)v9 = v11;
      memset(&v30, 0, sizeof(v30));
      *(_OWORD *)(v9 + 24) = v31;
      v12 = v9 + 40;
      a4[1] = v9 + 40;
LABEL_29:
      v7 += 56;
      v9 = v12;
      if (v7 == v8)
        goto LABEL_33;
    }
    v13 = (char *)*a4;
    v14 = 0xCCCCCCCCCCCCCCCDLL * ((v9 - (_BYTE *)*a4) >> 3);
    v15 = v14 + 1;
    if (v14 + 1 > 0x666666666666666)
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    v16 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v10 - (_QWORD)v13) >> 3);
    if (2 * v16 > v15)
      v15 = 2 * v16;
    if (v16 >= 0x333333333333333)
      v17 = 0x666666666666666;
    else
      v17 = v15;
    if (v17)
    {
      if (v17 > 0x666666666666666)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v18 = (char *)operator new(40 * v17);
    }
    else
    {
      v18 = 0;
    }
    v19 = &v18[40 * v14];
    v20 = &v18[40 * v17];
    *(std::basic_string<char16_t> *)v19 = v30;
    memset(&v30, 0, sizeof(v30));
    *(_OWORD *)(v19 + 24) = v31;
    v12 = v19 + 40;
    if (v9 == v13)
    {
      *a4 = v19;
      a4[1] = v12;
      a4[2] = v20;
      if (!v9)
      {
LABEL_27:
        v23 = SHIBYTE(v30.__r_.__value_.__r.__words[2]);
        a4[1] = v12;
        if (v23 < 0)
          operator delete(v30.__r_.__value_.__l.__data_);
        goto LABEL_29;
      }
    }
    else
    {
      do
      {
        v21 = *(_OWORD *)(v9 - 40);
        *((_QWORD *)v19 - 3) = *((_QWORD *)v9 - 3);
        *(_OWORD *)(v19 - 40) = v21;
        *((_QWORD *)v9 - 4) = 0;
        *((_QWORD *)v9 - 3) = 0;
        *((_QWORD *)v9 - 5) = 0;
        *((_OWORD *)v19 - 1) = *((_OWORD *)v9 - 1);
        v19 -= 40;
        v9 -= 40;
      }
      while (v9 != v13);
      v22 = (char *)*a4;
      v9 = (char *)a4[1];
      *a4 = v19;
      a4[1] = v12;
      a4[2] = v20;
      if (v9 != v22)
      {
        do
        {
          if (*(v9 - 17) < 0)
            operator delete(*((void **)v9 - 5));
          v9 -= 40;
        }
        while (v9 != v22);
        v9 = v22;
      }
      if (!v9)
        goto LABEL_27;
    }
    operator delete(v9);
    goto LABEL_27;
  }
LABEL_33:
  v30.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)&v25;
  std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
  return std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>>>::~__hash_table((uint64_t)v28);
}

void sub_1C22F98BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  uint64_t v24;

  *(_QWORD *)(v24 - 88) = &a10;
  std::vector<std::tuple<nl_featurization::span_matching::span_processor::SpanProcessor::Indices,std::basic_string<char16_t>>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v24 - 88));
  std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,std::vector<nl_featurization::span_matching::span_processor::SpanProcessor::Indices>>>>::~__hash_table((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void std::vector<nl_featurization::MatchedCharacterSpan>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 17) < 0)
          operator delete(*(v4 - 5));
        v4 -= 5;
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void nl_featurization::bio::BioTagPayload::getLabel(nl_featurization::bio::BioTagPayload *this@<X0>, std::basic_string<char16_t> *a2@<X8>)
{
  if (*((char *)this + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(a2, *(const std::basic_string<char16_t>::value_type **)this, *((_QWORD *)this + 1));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)this;
    a2->__r_.__value_.__r.__words[2] = *((_QWORD *)this + 2);
  }
}

std::basic_string<char16_t> *nl_featurization::bio::BioTagPayload::getSemanticValue@<X0>(nl_featurization::bio::BioTagPayload *this@<X0>, std::basic_string<char16_t> *a2@<X8>)
{
  return std::__optional_copy_base<std::basic_string<char16_t>,false>::__optional_copy_base[abi:ne180100](a2, (__int128 *)((char *)this + 24));
}

uint64_t nl_featurization::bio::BioTag::BioTag(uint64_t a1, int a2, __int128 *a3)
{
  __int128 v6;
  std::logic_error *exception;

  *(_DWORD *)a1 = a2;
  *(_BYTE *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 64) = 0;
  if (*((_BYTE *)a3 + 56))
  {
    if (*((char *)a3 + 23) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)(a1 + 8), *(const std::basic_string<char16_t>::value_type **)a3, *((_QWORD *)a3 + 1));
    }
    else
    {
      v6 = *a3;
      *(_QWORD *)(a1 + 24) = *((_QWORD *)a3 + 2);
      *(_OWORD *)(a1 + 8) = v6;
    }
    std::__optional_copy_base<std::basic_string<char16_t>,false>::__optional_copy_base[abi:ne180100]((std::basic_string<char16_t> *)(a1 + 32), (__int128 *)((char *)a3 + 24));
    *(_BYTE *)(a1 + 64) = 1;
    if ((a2 & 0xFFFFFFFE) == 2)
    {
      if (!*((_BYTE *)a3 + 56))
      {
LABEL_9:
        exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
        std::logic_error::logic_error(exception, "Begin/inside BIO tags must have a payload component");
        goto LABEL_13;
      }
    }
    else if (*((_BYTE *)a3 + 56))
    {
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::logic_error::logic_error(exception, "Only begin/inside BIO tags can have a payload component");
LABEL_13:
      exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
      __cxa_throw(exception, (struct type_info *)off_1E7BE5148, MEMORY[0x1E0DE4360]);
    }
  }
  else if ((a2 & 0xFFFFFFFE) == 2)
  {
    goto LABEL_9;
  }
  return a1;
}

void sub_1C22F9AD0(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  __cxa_free_exception(v2);
  std::__optional_destruct_base<nl_featurization::bio::BioTagPayload,false>::~__optional_destruct_base[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t nl_featurization::bio::BioTag::getPrefix(nl_featurization::bio::BioTag *this)
{
  return *(unsigned int *)this;
}

std::basic_string<char16_t> *nl_featurization::bio::BioTag::getPayload@<X0>(nl_featurization::bio::BioTag *this@<X0>, std::basic_string<char16_t> *a2@<X8>)
{
  std::runtime_error *exception;

  if ((*(_DWORD *)this & 0xFFFFFFFE) != 2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Cannot extract payload from non-begin/inside BIO tag");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  if (!*((_BYTE *)this + 64))
    __assert_rtn("getPayload", "bio.cpp", 48, "mPayload.has_value()");
  if (*((char *)this + 31) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(a2, *((const std::basic_string<char16_t>::value_type **)this + 1), *((_QWORD *)this + 2));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 8);
    a2->__r_.__value_.__r.__words[2] = *((_QWORD *)this + 3);
  }
  return std::__optional_copy_base<std::basic_string<char16_t>,false>::__optional_copy_base[abi:ne180100](a2 + 1, (__int128 *)this + 2);
}

void sub_1C22F9BE0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void nl_featurization::bio::parseBioTag(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  std::basic_string<char16_t>::value_type v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  void **v9;
  const std::basic_string<char16_t>::value_type *v10;
  __int128 *v11;
  std::basic_string<char16_t> *v12;
  const UChar *v13;
  std::basic_string<char16_t>::value_type v14;
  std::basic_string<char16_t>::size_type size;
  std::basic_string<char16_t> *v16;
  int v17;
  uint64_t v18;
  UChar *v19;
  void **v20;
  UChar *v21;
  void **v22;
  std::basic_string<char16_t>::value_type v23;
  UChar *v24;
  int32_t v25;
  std::basic_string<char16_t>::value_type v26;
  std::basic_string<char16_t> *v27;
  int32_t v28;
  std::basic_string<char16_t>::value_type v29;
  std::basic_string<char16_t> *v30;
  int v31;
  std::basic_string<char16_t> *v32;
  const UChar *v33;
  int v34;
  std::basic_string<char16_t>::size_type v35;
  std::basic_string<char16_t> *v36;
  int v37;
  std::basic_string<char16_t> *v38;
  std::logic_error *v39;
  std::logic_error *v40;
  std::logic_error *exception;
  std::basic_string<char16_t> v42[2];
  std::basic_string<char16_t> v43;
  std::basic_string<char16_t> v44;
  unsigned __int8 v45;
  std::basic_string<char16_t> v46;
  std::basic_string<char16_t> v47;
  std::basic_string<char16_t> __p;
  char v49;
  std::basic_string<char16_t> v50;
  void *v51[2];
  char v52;
  char v53;
  std::basic_string<char16_t> v54;
  void *v55[2];
  char v56;
  UChar *saveState;
  std::basic_string<char16_t> v58;
  std::basic_string<char16_t> v59;
  std::basic_string<char16_t> v60;
  __int128 v61[3];
  char v62;
  __int128 v63[3];
  char v64;
  void *__dst[2];
  unsigned __int8 v66;

  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__dst, (char *)L"[PAD]");
  v5 = *(unsigned __int8 *)(a1 + 23);
  v6 = (char)v5;
  if ((v5 & 0x80u) != 0)
    v5 = *(_QWORD *)(a1 + 8);
  v7 = v66;
  if ((v66 & 0x80u) != 0)
    v7 = (unint64_t)__dst[1];
  if (v5 == v7)
  {
    if (!v5)
    {
LABEL_14:
      LOBYTE(v63[0]) = 0;
      v64 = 0;
      nl_featurization::bio::BioTag::BioTag(a2, 0, v63);
      v11 = v63;
LABEL_21:
      std::__optional_destruct_base<nl_featurization::bio::BioTagPayload,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v11);
      goto LABEL_109;
    }
    v8 = 0;
    v9 = __dst;
    if ((v66 & 0x80u) != 0)
      v9 = (void **)__dst[0];
    if (v6 >= 0)
      v10 = (const std::basic_string<char16_t>::value_type *)a1;
    else
      v10 = *(const std::basic_string<char16_t>::value_type **)a1;
    while (*((unsigned __int16 *)v9 + v8) == (unsigned __int16)v10[v8])
    {
      if (v5 == ++v8)
        goto LABEL_14;
    }
  }
  else if (v6 >= 0)
  {
    v10 = (const std::basic_string<char16_t>::value_type *)a1;
  }
  else
  {
    v10 = *(const std::basic_string<char16_t>::value_type **)a1;
  }
  if (v5 == 1)
  {
    if (*v10 == 79)
    {
      LOBYTE(v61[0]) = 0;
      v62 = 0;
      nl_featurization::bio::BioTag::BioTag(a2, 1, v61);
      v11 = v61;
      goto LABEL_21;
    }
LABEL_114:
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Well-formed BIO tags must be >=3 characters long, but got: ");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E7BE5148, MEMORY[0x1E0DE4360]);
  }
  if (v5 <= 2)
    goto LABEL_114;
  memset(&v60, 0, sizeof(v60));
  std::basic_string<char16_t>::resize(&v60, 2uLL, v4);
  if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v12 = &v60;
  else
    v12 = (std::basic_string<char16_t> *)v60.__r_.__value_.__r.__words[0];
  if (*(char *)(a1 + 23) >= 0)
    v13 = (const UChar *)a1;
  else
    v13 = *(const UChar **)a1;
  u_strncpy((UChar *)v12, v13, 2);
  size = HIBYTE(v60.__r_.__value_.__r.__words[2]);
  if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v60.__r_.__value_.__l.__size_;
  if (size != 2)
    goto LABEL_113;
  v16 = &v60;
  if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v16 = (std::basic_string<char16_t> *)v60.__r_.__value_.__r.__words[0];
  if ((v17 = (unsigned __int16)v16->__r_.__value_.__s.__data_[0], v17 != 73) && v17 != 66
    || v16->__r_.__value_.__s.__data_[1] != 95)
  {
LABEL_113:
    v40 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(v40, "BIO tag has no prefix");
    v40->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
    __cxa_throw(v40, (struct type_info *)off_1E7BE5148, MEMORY[0x1E0DE4360]);
  }
  memset(&v59, 0, sizeof(v59));
  v18 = *(unsigned __int8 *)(a1 + 23);
  if ((v18 & 0x80u) != 0)
    v18 = *(_QWORD *)(a1 + 8);
  std::basic_string<char16_t>::resize(&v59, v18 - 2, v14);
  if (*(char *)(a1 + 23) < 0)
    std::basic_string<char16_t>::__init_copy_ctor_external(&v58, *(const std::basic_string<char16_t>::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    v58 = *(std::basic_string<char16_t> *)a1;
  saveState = 0;
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v55, (char *)L":");
  if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v19 = (UChar *)&v58.__r_.__value_.__s.__data_[2];
  else
    v19 = (UChar *)(v58.__r_.__value_.__r.__words[0] + 4);
  if (v56 >= 0)
    v20 = v55;
  else
    v20 = (void **)v55[0];
  v21 = u_strtok_r(v19, (const UChar *)v20, &saveState);
  if (v56 >= 0)
    v22 = v55;
  else
    v22 = (void **)v55[0];
  v24 = u_strtok_r(0, (const UChar *)v22, &saveState);
  memset(&v54, 0, sizeof(v54));
  LOBYTE(v51[0]) = 0;
  v53 = 0;
  if (v24)
  {
    v25 = u_strlen(v21);
    std::basic_string<char16_t>::resize(&v54, v25, v26);
    if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v27 = &v54;
    else
      v27 = (std::basic_string<char16_t> *)v54.__r_.__value_.__r.__words[0];
    u_strcpy((UChar *)v27, v21);
    memset(&v50, 0, sizeof(v50));
    v28 = u_strlen(v24);
    std::basic_string<char16_t>::resize(&v50, v28, v29);
    if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v30 = &v50;
    else
      v30 = (std::basic_string<char16_t> *)v50.__r_.__value_.__r.__words[0];
    u_strcpy((UChar *)v30, v24);
    if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
      std::basic_string<char16_t>::__init_copy_ctor_external(&v47, v50.__r_.__value_.__l.__data_, v50.__r_.__value_.__l.__size_);
    else
      v47 = v50;
    LOBYTE(__p.__r_.__value_.__l.__data_) = 1;
    std::__optional_storage_base<std::basic_string<char16_t>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::basic_string<char16_t>,false>>((uint64_t)v51, (__n128 *)&v47);
    if (LOBYTE(__p.__r_.__value_.__l.__data_) && SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v47.__r_.__value_.__l.__data_);
    if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v50.__r_.__value_.__l.__data_);
  }
  else
  {
    v31 = HIBYTE(v58.__r_.__value_.__r.__words[2]);
    if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v31 = v58.__r_.__value_.__r.__words[1];
    std::basic_string<char16_t>::resize(&v54, (v31 - 2), v23);
    if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v32 = &v54;
    else
      v32 = (std::basic_string<char16_t> *)v54.__r_.__value_.__r.__words[0];
    if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v33 = (const UChar *)&v58.__r_.__value_.__s.__data_[2];
    else
      v33 = (const UChar *)(v58.__r_.__value_.__r.__words[0] + 4);
    u_strcpy((UChar *)v32, v33);
  }
  if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
    std::basic_string<char16_t>::__init_copy_ctor_external(&v46, v54.__r_.__value_.__l.__data_, v54.__r_.__value_.__l.__size_);
  else
    v46 = v54;
  std::__optional_copy_base<std::basic_string<char16_t>,false>::__optional_copy_base[abi:ne180100](&v44, (__int128 *)v51);
  v47 = v46;
  LOBYTE(__p.__r_.__value_.__l.__data_) = 0;
  v49 = 0;
  v34 = v45;
  if (v45)
  {
    __p = v44;
    memset(&v44, 0, sizeof(v44));
    v49 = 1;
  }
  v35 = v60.__r_.__value_.__l.__size_;
  if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v35 = HIBYTE(v60.__r_.__value_.__r.__words[2]);
  if (v35 != 2)
    goto LABEL_112;
  v36 = &v60;
  if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v36 = (std::basic_string<char16_t> *)v60.__r_.__value_.__r.__words[0];
  v37 = (unsigned __int16)v36->__r_.__value_.__s.__data_[0];
  if (v37 != 73)
  {
    if (v37 == 66 && v36->__r_.__value_.__s.__data_[1] == 95)
    {
      std::__optional_destruct_base<nl_featurization::bio::BioTagPayload,false>::__optional_destruct_base[abi:ne180100]<nl_featurization::bio::BioTagPayload const&>(&v43, (__int128 *)&v47);
      v38 = &v43;
      nl_featurization::bio::BioTag::BioTag(a2, 2, (__int128 *)&v43);
      goto LABEL_91;
    }
LABEL_112:
    v39 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(v39, "Unrecognized BIO tag prefix");
    v39->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
    __cxa_throw(v39, (struct type_info *)off_1E7BE5148, MEMORY[0x1E0DE4360]);
  }
  if (v36->__r_.__value_.__s.__data_[1] != 95)
    goto LABEL_112;
  std::__optional_destruct_base<nl_featurization::bio::BioTagPayload,false>::__optional_destruct_base[abi:ne180100]<nl_featurization::bio::BioTagPayload const&>(v42, (__int128 *)&v47);
  v38 = v42;
  nl_featurization::bio::BioTag::BioTag(a2, 3, (__int128 *)v42);
LABEL_91:
  std::__optional_destruct_base<nl_featurization::bio::BioTagPayload,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v38);
  if (v34 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v47.__r_.__value_.__l.__data_);
  if (v53 && v52 < 0)
    operator delete(v51[0]);
  if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v54.__r_.__value_.__l.__data_);
  if (v56 < 0)
    operator delete(v55[0]);
  if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v58.__r_.__value_.__l.__data_);
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v59.__r_.__value_.__l.__data_);
  if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v60.__r_.__value_.__l.__data_);
LABEL_109:
  if ((char)v66 < 0)
    operator delete(__dst[0]);
}

void sub_1C22FA238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *__p,uint64_t a42,int a43,__int16 a44,char a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52,int a53,__int16 a54,char a55,char a56,void *a57,uint64_t a58,int a59,__int16 a60,char a61,char a62,uint64_t a63)
{
  void *a64;
  char a69;
  uint64_t v69;

  if (a46 < 0)
    operator delete(__p);
  if (a56 < 0)
    operator delete(a51);
  if (a62 < 0)
    operator delete(a57);
  if (a69 < 0)
    operator delete(a64);
  if (*(char *)(v69 - 225) < 0)
    operator delete(*(void **)(v69 - 248));
  if (*(char *)(v69 - 201) < 0)
    operator delete(*(void **)(v69 - 224));
  if (*(char *)(v69 - 49) < 0)
    operator delete(*(void **)(v69 - 72));
  _Unwind_Resume(a1);
}

__n128 std::__optional_storage_base<std::basic_string<char16_t>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::basic_string<char16_t>,false>>(uint64_t a1, __n128 *a2)
{
  __n128 result;

  if (*(unsigned __int8 *)(a1 + 24) == a2[1].n128_u8[8])
  {
    if (*(_BYTE *)(a1 + 24))
    {
      if (*(char *)(a1 + 23) < 0)
        operator delete(*(void **)a1);
      result = *a2;
      *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
      *(__n128 *)a1 = result;
      a2[1].n128_u8[7] = 0;
      a2->n128_u16[0] = 0;
    }
  }
  else if (*(_BYTE *)(a1 + 24))
  {
    if (*(char *)(a1 + 23) < 0)
      operator delete(*(void **)a1);
    *(_BYTE *)(a1 + 24) = 0;
  }
  else
  {
    result = *a2;
    *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
    *(__n128 *)a1 = result;
    a2->n128_u64[1] = 0;
    a2[1].n128_u64[0] = 0;
    a2->n128_u64[0] = 0;
    *(_BYTE *)(a1 + 24) = 1;
  }
  return result;
}

std::basic_string<char16_t> *std::__optional_destruct_base<nl_featurization::bio::BioTagPayload,false>::__optional_destruct_base[abi:ne180100]<nl_featurization::bio::BioTagPayload const&>(std::basic_string<char16_t> *this, __int128 *a2)
{
  __int128 v4;

  if (*((char *)a2 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(this, *(const std::basic_string<char16_t>::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  std::__optional_copy_base<std::basic_string<char16_t>,false>::__optional_copy_base[abi:ne180100](this + 1, (__int128 *)((char *)a2 + 24));
  LOBYTE(this[2].__r_.__value_.__r.__words[1]) = 1;
  return this;
}

void sub_1C22FA498(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t nl_featurization::bio::convertToLabelledSpans@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X8>)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  const std::basic_string<char16_t>::value_type **v24;
  __int128 v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  std::logic_error *exception;
  std::basic_string<char16_t> v42;
  __int128 v43;
  char v44;
  char v45;
  __int128 v46;
  __int128 v47;
  std::basic_string<char16_t> v48;
  std::basic_string<char16_t> __p;
  __int128 v50;
  uint64_t v51;
  char v52;
  __int128 v53;
  std::basic_string<char16_t> v54;
  std::basic_string<char16_t> v55;
  char v56;
  int v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  std::basic_string<char16_t>::size_type v61;
  char v62;
  std::basic_string<char16_t>::size_type v63;
  std::basic_string<char16_t> v64;
  __int128 v65;
  uint64_t v66;
  char v67;
  __int128 v68;
  char v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t *v74;

  v5 = 0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 4);
  v6 = *a1;
  v7 = a1[1];
  if (v5 != 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 3))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, "Number of tokens differs from number of BIO tags");
    goto LABEL_103;
  }
  if (v5 != (uint64_t)(a2[1] - *a2) >> 4)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, "Number of tokens differs from number of group IDs");
LABEL_103:
    __cxa_throw(exception, (struct type_info *)off_1E7BE5148, MEMORY[0x1E0DE4360]);
  }
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  LOBYTE(v59) = 0;
  v69 = 0;
  if (v7 == v6)
    return std::__optional_destruct_base<nl_featurization::bio::CurrentSpan,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v59);
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 1;
  do
  {
    nl_featurization::bio::parseBioTag(v6 + v9, (uint64_t)&v57);
    v13 = v12 - 1;
    v14 = *a3;
    v15 = v57;
    if (v57 != 3)
    {
      if (v69)
      {
        if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0)
          std::basic_string<char16_t>::__init_copy_ctor_external(&v54, v64.__r_.__value_.__l.__data_, v64.__r_.__value_.__l.__size_);
        else
          v54 = v64;
        std::__optional_copy_base<std::basic_string<char16_t>,false>::__optional_copy_base[abi:ne180100](&v55, &v65);
        *(_QWORD *)&v46 = v63;
        *((_QWORD *)&v46 + 1) = v12 - 1;
        *(_QWORD *)&v47 = v59;
        *((_QWORD *)&v47 + 1) = *(_QWORD *)(v14 + v11 - 40);
        if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
          std::basic_string<char16_t>::__init_copy_ctor_external(&v48, v54.__r_.__value_.__l.__data_, v54.__r_.__value_.__l.__size_);
        else
          v48 = v54;
        std::__optional_copy_base<std::basic_string<char16_t>,false>::__optional_copy_base[abi:ne180100](&__p, (__int128 *)&v55);
        *((_QWORD *)&v50 + 1) = v68;
        LOBYTE(v51) = BYTE8(v68);
        v17 = a4[1];
        v16 = a4[2];
        if (v17 >= v16)
        {
          v19 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v17 - *a4) >> 3);
          v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) > 0x276276276276276)
            std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
          v21 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v16 - *a4) >> 3);
          if (2 * v21 > v20)
            v20 = 2 * v21;
          if (v21 >= 0x13B13B13B13B13BLL)
            v22 = 0x276276276276276;
          else
            v22 = v20;
          *((_QWORD *)&v43 + 1) = a4 + 2;
          if (v22)
            v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<nl_featurization::postprocessing::LabelledSpan>>(v22);
          else
            v23 = 0;
          v42.__r_.__value_.__r.__words[0] = v22;
          v42.__r_.__value_.__l.__size_ = v22 + 104 * v19;
          v42.__r_.__value_.__r.__words[2] = v42.__r_.__value_.__l.__size_;
          *(_QWORD *)&v43 = v22 + 104 * v23;
          std::allocator<nl_featurization::postprocessing::LabelledSpan>::construct[abi:ne180100]<nl_featurization::postprocessing::LabelledSpan,nl_featurization::postprocessing::LabelledSpan>(v42.__r_.__value_.__l.__size_, (uint64_t)&v46);
          v42.__r_.__value_.__r.__words[2] += 104;
          std::vector<nl_featurization::postprocessing::LabelledSpan>::__swap_out_circular_buffer(a4, &v42);
          v18 = a4[1];
          std::__split_buffer<nl_featurization::postprocessing::LabelledSpan>::~__split_buffer((uint64_t)&v42);
        }
        else
        {
          std::allocator<nl_featurization::postprocessing::LabelledSpan>::construct[abi:ne180100]<nl_featurization::postprocessing::LabelledSpan,nl_featurization::postprocessing::LabelledSpan>(a4[1], (uint64_t)&v46);
          v18 = v17 + 104;
          a4[1] = v18;
        }
        a4[1] = v18;
        if ((_BYTE)v50 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v48.__r_.__value_.__l.__data_);
        std::__optional_destruct_base<nl_featurization::bio::CurrentSpan,false>::reset[abi:ne180100]((uint64_t)&v59);
        if (v56 && SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v55.__r_.__value_.__l.__data_);
        if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v54.__r_.__value_.__l.__data_);
        v15 = v57;
      }
      if (v15 == 2)
      {
        v46 = *(_OWORD *)(v14 + v11);
        v24 = (const std::basic_string<char16_t>::value_type **)(v14 + v11 + 16);
        if (*(char *)(v14 + v11 + 39) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)&v47, *v24, *(_QWORD *)(v14 + v11 + 24));
        }
        else
        {
          v25 = *(_OWORD *)v24;
          v48.__r_.__value_.__r.__words[0] = *(_QWORD *)(v14 + v11 + 32);
          v47 = v25;
        }
        LOBYTE(v48.__r_.__value_.__r.__words[1]) = *(_BYTE *)(v14 + v11 + 40);
        v48.__r_.__value_.__r.__words[2] = v12 - 1;
        nl_featurization::bio::BioTag::getPayload((nl_featurization::bio::BioTag *)&v57, &__p);
        if (v13 >= (uint64_t)(a2[1] - *a2) >> 4)
          std::vector<nlv4_inference_orchestrator::trees::TreeNode>::__throw_out_of_range[abi:ne180100]();
        v26 = (uint64_t *)(*a2 + v10);
        v27 = *v26;
        BYTE8(v53) = *((_BYTE *)v26 + 8);
        *(_QWORD *)&v53 = v27;
        v59 = v46;
        if (v69)
        {
          if (SHIBYTE(v61) < 0)
            operator delete((void *)v60);
          v60 = v47;
          v61 = v48.__r_.__value_.__r.__words[0];
          HIBYTE(v48.__r_.__value_.__r.__words[0]) = 0;
          LOWORD(v47) = 0;
          v62 = v48.__r_.__value_.__r.__words[1];
          v63 = v48.__r_.__value_.__r.__words[2];
          if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v64.__r_.__value_.__l.__data_);
          v64 = __p;
          *((_BYTE *)&__p.__r_.__value_.__s + 23) = 0;
          __p.__r_.__value_.__s.__data_[0] = 0;
          std::__optional_storage_base<std::basic_string<char16_t>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::basic_string<char16_t>,false>>((uint64_t)&v65, (__n128 *)&v50);
          *(_QWORD *)&v68 = v53;
          BYTE8(v68) = BYTE8(v53);
          if (!v52)
            goto LABEL_53;
        }
        else
        {
          v60 = v47;
          v61 = v48.__r_.__value_.__r.__words[0];
          v48.__r_.__value_.__r.__words[0] = 0;
          v47 = 0uLL;
          v62 = v48.__r_.__value_.__r.__words[1];
          v63 = v48.__r_.__value_.__r.__words[2];
          v64 = __p;
          memset(&__p, 0, sizeof(__p));
          LOBYTE(v65) = 0;
          v67 = 0;
          if (v52)
          {
            v65 = v50;
            v66 = v51;
            v51 = 0;
            v50 = 0uLL;
            v67 = 1;
          }
          v68 = v53;
          v69 = 1;
          if (!v52)
            goto LABEL_53;
        }
        if (SHIBYTE(v51) < 0)
          operator delete((void *)v50);
LABEL_53:
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        if (SHIBYTE(v48.__r_.__value_.__r.__words[0]) < 0)
          operator delete((void *)v47);
      }
    }
    if (v13 == -1 - 0x5555555555555555 * ((a1[1] - *a1) >> 3) && (v57 & 0xFFFFFFFE) == 2 && v69 != 0)
    {
      *(_QWORD *)&v46 = v63;
      *((_QWORD *)&v46 + 1) = v12;
      *(_QWORD *)&v47 = v59;
      *((_QWORD *)&v47 + 1) = *(_QWORD *)(v14 + v11 + 8);
      nl_featurization::bio::BioTag::getPayload((nl_featurization::bio::BioTag *)&v57, &v54);
      if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
        std::basic_string<char16_t>::__init_copy_ctor_external(&v48, v54.__r_.__value_.__l.__data_, v54.__r_.__value_.__l.__size_);
      else
        v48 = v54;
      nl_featurization::bio::BioTag::getPayload((nl_featurization::bio::BioTag *)&v57, &v42);
      std::__optional_copy_base<std::basic_string<char16_t>,false>::__optional_copy_base[abi:ne180100](&__p, &v43);
      *((_QWORD *)&v50 + 1) = v68;
      LOBYTE(v51) = BYTE8(v68);
      v30 = a4[1];
      v29 = a4[2];
      if (v30 >= v29)
      {
        v32 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v30 - *a4) >> 3);
        v33 = v32 + 1;
        if ((unint64_t)(v32 + 1) > 0x276276276276276)
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        v34 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v29 - *a4) >> 3);
        if (2 * v34 > v33)
          v33 = 2 * v34;
        if (v34 >= 0x13B13B13B13B13BLL)
          v35 = 0x276276276276276;
        else
          v35 = v33;
        v74 = a4 + 2;
        if (v35)
          v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<nl_featurization::postprocessing::LabelledSpan>>(v35);
        else
          v36 = 0;
        v70 = v35;
        v71 = v35 + 104 * v32;
        v72 = v71;
        v73 = v35 + 104 * v36;
        std::allocator<nl_featurization::postprocessing::LabelledSpan>::construct[abi:ne180100]<nl_featurization::postprocessing::LabelledSpan,nl_featurization::postprocessing::LabelledSpan>(v71, (uint64_t)&v46);
        v72 += 104;
        std::vector<nl_featurization::postprocessing::LabelledSpan>::__swap_out_circular_buffer(a4, &v70);
        v31 = a4[1];
        std::__split_buffer<nl_featurization::postprocessing::LabelledSpan>::~__split_buffer((uint64_t)&v70);
      }
      else
      {
        std::allocator<nl_featurization::postprocessing::LabelledSpan>::construct[abi:ne180100]<nl_featurization::postprocessing::LabelledSpan,nl_featurization::postprocessing::LabelledSpan>(a4[1], (uint64_t)&v46);
        v31 = v30 + 104;
        a4[1] = v30 + 104;
      }
      a4[1] = v31;
      if ((_BYTE)v50 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v48.__r_.__value_.__l.__data_);
      if (v45 && v44 < 0)
        operator delete((void *)v43);
      if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v42.__r_.__value_.__l.__data_);
      if (v56 && SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v55.__r_.__value_.__l.__data_);
      if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v54.__r_.__value_.__l.__data_);
      std::__optional_destruct_base<nl_featurization::bio::CurrentSpan,false>::reset[abi:ne180100]((uint64_t)&v59);
    }
    std::__optional_destruct_base<nl_featurization::bio::BioTagPayload,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v58);
    v6 = *a1;
    v11 += 48;
    v10 += 16;
    v9 += 24;
  }
  while (v12++ < 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3));
  if (v69)
    __assert_rtn("convertToLabelledSpans", "bio.cpp", 181, "!currentSpan.has_value()");
  return std::__optional_destruct_base<nl_featurization::bio::CurrentSpan,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v59);
}

void sub_1C22FAD40(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__optional_destruct_base<nl_featurization::bio::CurrentSpan,false>::reset[abi:ne180100](uint64_t a1)
{
  if (*(_BYTE *)(a1 + 128))
  {
    if (*(_BYTE *)(a1 + 104) && *(char *)(a1 + 103) < 0)
      operator delete(*(void **)(a1 + 80));
    if (*(char *)(a1 + 79) < 0)
      operator delete(*(void **)(a1 + 56));
    if (*(char *)(a1 + 39) < 0)
      operator delete(*(void **)(a1 + 16));
    *(_BYTE *)(a1 + 128) = 0;
  }
}

uint64_t std::__optional_destruct_base<nl_featurization::bio::CurrentSpan,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(_BYTE *)(a1 + 128))
  {
    if (*(_BYTE *)(a1 + 104) && *(char *)(a1 + 103) < 0)
      operator delete(*(void **)(a1 + 80));
    if (*(char *)(a1 + 79) < 0)
      operator delete(*(void **)(a1 + 56));
    if (*(char *)(a1 + 39) < 0)
      operator delete(*(void **)(a1 + 16));
  }
  return a1;
}

void nl_featurization::bio::buildBeginBioTagsFromEntityLabels(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  const std::basic_string<char16_t>::value_type *v7;
  std::basic_string<char16_t>::size_type v8;
  std::basic_string<char16_t> __p;
  uint64_t *i;
  std::basic_string<char16_t> v11;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<std::basic_string<char16_t>>::reserve(a2, 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3));
  v5 = *a1;
  v4 = a1[1];
  for (i = a2; v5 != v4; v5 += 24)
  {
    *((_BYTE *)&v11.__r_.__value_.__s + 23) = 2;
    LODWORD(v11.__r_.__value_.__l.__data_) = 6225986;
    v11.__r_.__value_.__s.__data_[2] = 0;
    v6 = *(char *)(v5 + 23);
    if (v6 >= 0)
      v7 = (const std::basic_string<char16_t>::value_type *)v5;
    else
      v7 = *(const std::basic_string<char16_t>::value_type **)v5;
    if (v6 >= 0)
      v8 = *(unsigned __int8 *)(v5 + 23);
    else
      v8 = *(_QWORD *)(v5 + 8);
    std::basic_string<char16_t>::append(&v11, v7, v8);
    __p = v11;
    std::back_insert_iterator<std::vector<std::basic_string<char16_t>>>::operator=[abi:ne180100](&i, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1C22FB014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a17);
  _Unwind_Resume(a1);
}

void nl_featurization::bio::buildAllBioTagsFromEntityLabels(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  std::basic_string<char16_t>::size_type v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const std::basic_string<char16_t>::value_type *v17;
  std::basic_string<char16_t>::size_type v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const std::basic_string<char16_t>::value_type *v22;
  std::basic_string<char16_t>::size_type v23;
  std::basic_string<char16_t> __p;
  uint64_t *v25[2];
  std::basic_string<char16_t> v26;
  unint64_t v27;
  uint64_t *v28;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v4 = (0x5555555555555556 * ((a1[1] - *a1) >> 3)) | 1;
  std::vector<std::basic_string<char16_t>>::reserve(a2, v4);
  v5 = a2[2];
  v6 = a2[1];
  if (v6 >= v5)
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - *a2) >> 3);
    v9 = v8 + 1;
    if (v8 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a2) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    v28 = a2 + 2;
    if (v11)
      v11 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(v11);
    else
      v12 = 0;
    v13 = v11 + 24 * v8;
    v26.__r_.__value_.__r.__words[0] = v11;
    v26.__r_.__value_.__l.__size_ = v13;
    v26.__r_.__value_.__r.__words[2] = v13;
    v27 = v11 + 24 * v12;
    *(_BYTE *)(v13 + 23) = 1;
    *(_WORD *)v13 = 79;
    *(_WORD *)(v13 + 2) = 0;
    v26.__r_.__value_.__r.__words[2] += 24;
    std::vector<std::basic_string<char16_t>>::__swap_out_circular_buffer(a2, &v26);
    v7 = a2[1];
    std::__split_buffer<std::basic_string<char16_t>>::~__split_buffer((uint64_t)&v26);
  }
  else
  {
    *(_BYTE *)(v6 + 23) = 1;
    *(_DWORD *)v6 = 79;
    v7 = v6 + 24;
    a2[1] = v6 + 24;
  }
  a2[1] = v7;
  v14 = *a1;
  v15 = a1[1];
  v25[0] = a2;
  if (v14 != v15)
  {
    do
    {
      *((_BYTE *)&v26.__r_.__value_.__s + 23) = 2;
      LODWORD(v26.__r_.__value_.__l.__data_) = 6225986;
      v26.__r_.__value_.__s.__data_[2] = 0;
      v16 = *(char *)(v14 + 23);
      if (v16 >= 0)
        v17 = (const std::basic_string<char16_t>::value_type *)v14;
      else
        v17 = *(const std::basic_string<char16_t>::value_type **)v14;
      if (v16 >= 0)
        v18 = *(unsigned __int8 *)(v14 + 23);
      else
        v18 = *(_QWORD *)(v14 + 8);
      std::basic_string<char16_t>::append(&v26, v17, v18);
      __p = v26;
      std::back_insert_iterator<std::vector<std::basic_string<char16_t>>>::operator=[abi:ne180100](v25, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v14 += 24;
    }
    while (v14 != v15);
    v20 = *a1;
    v19 = a1[1];
    for (v25[0] = a2; v20 != v19; v20 += 24)
    {
      *((_BYTE *)&v26.__r_.__value_.__s + 23) = 2;
      LODWORD(v26.__r_.__value_.__l.__data_) = 6225993;
      v26.__r_.__value_.__s.__data_[2] = 0;
      v21 = *(char *)(v20 + 23);
      if (v21 >= 0)
        v22 = (const std::basic_string<char16_t>::value_type *)v20;
      else
        v22 = *(const std::basic_string<char16_t>::value_type **)v20;
      if (v21 >= 0)
        v23 = *(unsigned __int8 *)(v20 + 23);
      else
        v23 = *(_QWORD *)(v20 + 8);
      std::basic_string<char16_t>::append(&v26, v22, v23);
      __p = v26;
      std::back_insert_iterator<std::vector<std::basic_string<char16_t>>>::operator=[abi:ne180100](v25, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) != v4)
    __assert_rtn("buildAllBioTagsFromEntityLabels", "bio.cpp", 211, "bioTags.size() == expectedFinalSize");
}

void sub_1C22FB2F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0)
    operator delete(__p);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a16);
  _Unwind_Resume(a1);
}

void nl_featurization::FeaturizerImpl::~FeaturizerImpl(nl_featurization::FeaturizerImpl *this)
{
  char *v2;

  *(_QWORD *)this = off_1E7BE94A0;
  v2 = (char *)this + 168;
  std::__hash_table<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::__unordered_map_hasher<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::hash<char16_t>,std::equal_to<char16_t>,true>,std::__unordered_map_equal<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::equal_to<char16_t>,std::hash<char16_t>,true>,std::allocator<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>>>::~__hash_table((uint64_t)this + 216);
  std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>>>::~__hash_table((uint64_t)v2);
  std::__hash_table<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>>>::~__hash_table((uint64_t)this + 128);
  if (*((char *)this + 127) < 0)
    operator delete(*((void **)this + 13));
  std::__tree<std::__value_type<unsigned long,std::string>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::string>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::string>>>::destroy(*((char **)this + 11));
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(*((char **)this + 8));
  if (*((char *)this + 55) < 0)
    operator delete(*((void **)this + 4));
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

{
  char *v2;

  *(_QWORD *)this = off_1E7BE94A0;
  v2 = (char *)this + 168;
  std::__hash_table<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::__unordered_map_hasher<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::hash<char16_t>,std::equal_to<char16_t>,true>,std::__unordered_map_equal<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::equal_to<char16_t>,std::hash<char16_t>,true>,std::allocator<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>>>::~__hash_table((uint64_t)this + 216);
  std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>>>::~__hash_table((uint64_t)v2);
  std::__hash_table<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>>>::~__hash_table((uint64_t)this + 128);
  if (*((char *)this + 127) < 0)
    operator delete(*((void **)this + 13));
  std::__tree<std::__value_type<unsigned long,std::string>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::string>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::string>>>::destroy(*((char **)this + 11));
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(*((char **)this + 8));
  if (*((char *)this + 55) < 0)
    operator delete(*((void **)this + 4));
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
  JUMPOUT(0x1C3BB9B44);
}

void nl_featurization::FeaturizerImpl::featurize(nl_featurization::FeaturizerImpl *this@<X0>, const nl_featurization::FeaturizerInput *a2@<X1>, uint64_t a3@<X8>)
{
  const std::basic_string<char16_t>::value_type **v6;
  const std::basic_string<char16_t>::value_type **v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  unint64_t *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  __int128 v22;
  char *v23;
  __int128 v24;
  unint64_t *v25;
  __int128 *v26;
  __int128 *v27;
  unint64_t v28;
  uint64_t v29;
  __int128 v30;
  int8x16_t v31;
  unint64_t v32;
  __int128 v33;
  int v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void **v39;
  void **v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  std::runtime_error *exception;
  nl_featurization::FeaturizerImpl *v45;
  uint64_t v46;
  void *v47;
  _BYTE *v48;
  uint64_t v49;
  void *__p[2];
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  _BYTE v55[27];
  __int128 v56;
  void *v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const std::basic_string<char16_t>::value_type **v67;
  const std::basic_string<char16_t>::value_type **v68;
  char v69;
  __int128 *v70;
  __int128 *v71;
  uint64_t v72;
  void **v73;
  void **v74;
  void **v75;
  void **v76;
  unint64_t *v77;

  v70 = 0;
  v71 = 0;
  v72 = 0;
  std::vector<nl_featurization::Token>::__init_with_size[abi:ne180100]<nl_featurization::Token*,nl_featurization::Token*>(&v70, *(__int128 **)a2, *((__int128 **)a2 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 1) - *(_QWORD *)a2) >> 4));
  v69 = 0;
  nl_featurization::span_matching::span_processor::SpanProcessor::matchSpans((uint64_t)this + 168, &v70, &v69, (uint64_t *)&v67);
  v64 = 0;
  v65 = 0;
  v66 = 0;
  v6 = v67;
  v7 = v68;
  v8 = (char *)v68 - (char *)v67;
  v9 = ((uint64_t)(*((_QWORD *)a2 + 4) - *((_QWORD *)a2 + 3)) >> 5) + (((char *)v68 - (char *)v67) >> 5);
  if (v9)
  {
    if (v9 >> 59)
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    *(_QWORD *)&v55[16] = &v66;
    *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,std::vector<unsigned long>>>>(v9);
    *((_QWORD *)&v54 + 1) = v54;
    *(_QWORD *)v55 = v54;
    *(_QWORD *)&v55[8] = v54 + 32 * v10;
    std::vector<nl_featurization::span_matching::MatchedSpan>::__swap_out_circular_buffer(&v64, &v54);
    std::__split_buffer<std::pair<sirinluinternal::MatchingSpan_MatcherName,std::string>>::~__split_buffer((uint64_t)&v54);
    v11 = v65;
    v6 = v67;
    v7 = v68;
    v8 = (char *)v68 - (char *)v67;
  }
  else
  {
    v11 = 0;
  }
  std::vector<nl_featurization::span_matching::MatchedSpan>::__insert_with_size[abi:ne180100]<std::__wrap_iter<nl_featurization::span_matching::MatchedSpan const*>,std::__wrap_iter<nl_featurization::span_matching::MatchedSpan const*>>(&v64, v11, v6, v7, v8 >> 5);
  v45 = this;
  v46 = a3;
  std::vector<nl_featurization::span_matching::MatchedSpan>::__insert_with_size[abi:ne180100]<std::__wrap_iter<nl_featurization::span_matching::MatchedSpan const*>,std::__wrap_iter<nl_featurization::span_matching::MatchedSpan const*>>(&v64, v65, *((const std::basic_string<char16_t>::value_type ***)a2 + 3), *((const std::basic_string<char16_t>::value_type ***)a2 + 4), (uint64_t)(*((_QWORD *)a2 + 4) - *((_QWORD *)a2 + 3)) >> 5);
  v61 = 0;
  v62 = 0;
  v63 = 0;
  v12 = v64;
  v13 = v65;
  if (v64 != v65)
  {
    while (1)
    {
      *(_QWORD *)&v14 = *(_QWORD *)v12;
      *((_QWORD *)&v14 + 1) = HIDWORD(*(_QWORD *)v12);
      v54 = v14;
      if (*(char *)(v12 + 31) < 0)
      {
        std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)v55, *(const std::basic_string<char16_t>::value_type **)(v12 + 8), *(_QWORD *)(v12 + 16));
      }
      else
      {
        *(_OWORD *)v55 = *(_OWORD *)(v12 + 8);
        *(_QWORD *)&v55[16] = *(_QWORD *)(v12 + 24);
      }
      v15 = (unint64_t *)v62;
      if (v62 >= v63)
        break;
      *(_OWORD *)v62 = v54;
      *((_OWORD *)v15 + 1) = *(_OWORD *)v55;
      v15[4] = *(_QWORD *)&v55[16];
      memset(v55, 0, 24);
      v62 = (char *)(v15 + 5);
LABEL_32:
      v12 += 32;
      if (v12 == v13)
        goto LABEL_36;
    }
    v16 = v61;
    v17 = 0xCCCCCCCCCCCCCCCDLL * ((v62 - (char *)v61) >> 3);
    v18 = v17 + 1;
    if (v17 + 1 > 0x666666666666666)
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    if (0x999999999999999ALL * ((v63 - (char *)v61) >> 3) > v18)
      v18 = 0x999999999999999ALL * ((v63 - (char *)v61) >> 3);
    if (0xCCCCCCCCCCCCCCCDLL * ((v63 - (char *)v61) >> 3) >= 0x333333333333333)
      v19 = 0x666666666666666;
    else
      v19 = v18;
    if (v19)
    {
      if (v19 > 0x666666666666666)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v20 = (char *)operator new(40 * v19);
    }
    else
    {
      v20 = 0;
    }
    v21 = &v20[40 * v17];
    v22 = *(_OWORD *)v55;
    *(_OWORD *)v21 = v54;
    *((_OWORD *)v21 + 1) = v22;
    *((_QWORD *)v21 + 4) = *(_QWORD *)&v55[16];
    memset(v55, 0, 24);
    v23 = v21 + 40;
    if (v15 == v16)
    {
      v61 = (unint64_t *)v21;
      v62 = v21 + 40;
      v63 = &v20[40 * v19];
      if (!v15)
      {
LABEL_30:
        v62 = v23;
        if ((v55[23] & 0x80000000) != 0)
          operator delete(*(void **)v55);
        goto LABEL_32;
      }
    }
    else
    {
      do
      {
        *(_OWORD *)(v21 - 40) = *(_OWORD *)(v15 - 5);
        v24 = *(_OWORD *)(v15 - 3);
        *((_QWORD *)v21 - 1) = *(v15 - 1);
        *(_OWORD *)(v21 - 24) = v24;
        v21 -= 40;
        *(v15 - 2) = 0;
        *(v15 - 1) = 0;
        *(v15 - 3) = 0;
        v15 -= 5;
      }
      while (v15 != v16);
      v25 = v61;
      v15 = (unint64_t *)v62;
      v61 = (unint64_t *)v21;
      v62 = v23;
      v63 = &v20[40 * v19];
      if (v15 != v25)
      {
        do
        {
          if (*((char *)v15 - 1) < 0)
            operator delete((void *)*(v15 - 3));
          v15 -= 5;
        }
        while (v15 != v25);
        v15 = v25;
      }
      if (!v15)
        goto LABEL_30;
    }
    operator delete(v15);
    goto LABEL_30;
  }
LABEL_36:
  v58 = 0;
  v59 = 0;
  v60 = 0;
  v26 = v70;
  v27 = v71;
  if (v71 != v70)
  {
    v28 = 0xAAAAAAAAAAAAAAABLL * (v71 - v70);
    if (v28 > 0x38E38E38E38E38ELL)
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    *(_QWORD *)&v55[16] = &v60;
    *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<snlp::ssu::app::SSUAppIntent>>(v28);
    *((_QWORD *)&v54 + 1) = v54;
    *(_QWORD *)v55 = v54;
    *(_QWORD *)&v55[8] = v54 + 72 * v29;
    std::vector<nl_featurization::nlv4_types::Token>::__swap_out_circular_buffer(&v58, &v54);
    std::__split_buffer<nl_featurization::nlv4_types::Token>::~__split_buffer((uint64_t)&v54);
    v26 = v70;
    v27 = v71;
  }
  for (; v26 != v27; v26 += 3)
  {
    if (*((char *)v26 + 39) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)&v54, *((const std::basic_string<char16_t>::value_type **)v26 + 2), *((_QWORD *)v26 + 3));
    }
    else
    {
      v30 = v26[1];
      *(_QWORD *)v55 = *((_QWORD *)v26 + 4);
      v54 = v30;
    }
    v31.i64[0] = 0xFFFFFFFFLL;
    v31.i64[1] = 0xFFFFFFFFLL;
    *(int8x16_t *)&v55[8] = vandq_s8(*(int8x16_t *)v26, v31);
    *(_WORD *)&v55[24] = 0;
    v55[26] = 0;
    v57 = 0;
    v56 = 0uLL;
    v32 = v59;
    if (v59 >= v60)
    {
      v36 = 0x8E38E38E38E38E39 * ((uint64_t)(v59 - v58) >> 3);
      v37 = v36 + 1;
      if (v36 + 1 > 0x38E38E38E38E38ELL)
        std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
      if (0x1C71C71C71C71C72 * ((uint64_t)(v60 - v58) >> 3) > v37)
        v37 = 0x1C71C71C71C71C72 * ((uint64_t)(v60 - v58) >> 3);
      if (0x8E38E38E38E38E39 * ((uint64_t)(v60 - v58) >> 3) >= 0x1C71C71C71C71C7)
        v38 = 0x38E38E38E38E38ELL;
      else
        v38 = v37;
      v77 = &v60;
      v39 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<snlp::ssu::app::SSUAppIntent>>(v38);
      v40 = &v39[9 * v36];
      v73 = v39;
      v74 = v40;
      v76 = &v39[9 * v41];
      v42 = v54;
      v40[2] = *(void **)v55;
      *(_OWORD *)v40 = v42;
      *(_QWORD *)v55 = 0;
      v54 = 0uLL;
      v43 = *(_OWORD *)&v55[8];
      *(_DWORD *)((char *)v40 + 39) = *(_DWORD *)&v55[23];
      *(_OWORD *)(v40 + 3) = v43;
      v40[7] = 0;
      v40[8] = 0;
      v40[6] = 0;
      *((_OWORD *)v40 + 3) = v56;
      v40[8] = v57;
      v56 = 0uLL;
      v57 = 0;
      v75 = v40 + 9;
      std::vector<nl_featurization::nlv4_types::Token>::__swap_out_circular_buffer(&v58, &v73);
      v35 = v59;
      std::__split_buffer<nl_featurization::nlv4_types::Token>::~__split_buffer((uint64_t)&v73);
    }
    else
    {
      v33 = v54;
      *(_QWORD *)(v59 + 16) = *(_QWORD *)v55;
      *(_OWORD *)v32 = v33;
      *(_QWORD *)v55 = 0;
      v54 = 0uLL;
      v34 = *(_DWORD *)&v55[23];
      *(_OWORD *)(v32 + 24) = *(_OWORD *)&v55[8];
      *(_DWORD *)(v32 + 39) = v34;
      *(_QWORD *)(v32 + 56) = 0;
      *(_QWORD *)(v32 + 64) = 0;
      *(_QWORD *)(v32 + 48) = 0;
      *(_OWORD *)(v32 + 48) = v56;
      *(_QWORD *)(v32 + 64) = v57;
      v56 = 0uLL;
      v57 = 0;
      v35 = v32 + 72;
    }
    v59 = v35;
    v73 = (void **)&v56;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v73);
    if ((v55[7] & 0x80000000) != 0)
      operator delete((void *)v54);
  }
  nl_featurization::span_matching::MatchedSpansFeaturizer::featurize((unsigned __int16 *)v45 + 4, &v61, &v58, (uint64_t)&v54);
  v52 = 0uLL;
  v53 = 0;
  std::vector<nl_featurization::Token>::__init_with_size[abi:ne180100]<nl_featurization::Token*,nl_featurization::Token*>(&v52, v70, v71, 0xAAAAAAAAAAAAAAABLL * (v71 - v70));
  v47 = 0;
  v48 = 0;
  v49 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v47, (const void *)v54, *((uint64_t *)&v54 + 1), (uint64_t)(*((_QWORD *)&v54 + 1) - v54) >> 3);
  __p[0] = 0;
  __p[1] = 0;
  v51 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(__p, *(const void **)&v55[8], *(uint64_t *)&v55[16], (uint64_t)(*(_QWORD *)&v55[16] - *(_QWORD *)&v55[8]) >> 3);
  *(_OWORD *)v46 = v52;
  *(_QWORD *)(v46 + 16) = v53;
  v53 = 0;
  v52 = 0uLL;
  *(_QWORD *)(v46 + 24) = 0;
  *(_QWORD *)(v46 + 32) = 0;
  *(_QWORD *)(v46 + 40) = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>((_QWORD *)(v46 + 24), v47, (uint64_t)v48, (v48 - (_BYTE *)v47) >> 3);
  *(_OWORD *)(v46 + 48) = *(_OWORD *)__p;
  *(_QWORD *)(v46 + 64) = v51;
  __p[1] = 0;
  v51 = 0;
  __p[0] = 0;
  v73 = 0;
  v74 = 0;
  v75 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v73, *(const void **)(v46 + 24), *(_QWORD *)(v46 + 32), (uint64_t)(*(_QWORD *)(v46 + 32) - *(_QWORD *)(v46 + 24)) >> 3);
  if ((char *)v74 - (char *)v73 != 16)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Span labels tensor is of incorrect shape");
    goto LABEL_71;
  }
  if ((void *)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v46 + 8) - *(_QWORD *)v46) >> 4)) != *v73)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Span labels tensor shape does not match tokens size");
LABEL_71:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v74 = v73;
  operator delete(v73);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v47)
  {
    v48 = v47;
    operator delete(v47);
  }
  v73 = (void **)&v52;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100](&v73);
  if (*(_QWORD *)&v55[8])
  {
    *(_QWORD *)&v55[16] = *(_QWORD *)&v55[8];
    operator delete(*(void **)&v55[8]);
  }
  if ((_QWORD)v54)
  {
    *((_QWORD *)&v54 + 1) = v54;
    operator delete((void *)v54);
  }
  *(_QWORD *)&v54 = &v58;
  std::vector<nl_featurization::nlv4_types::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v54);
  *(_QWORD *)&v54 = &v61;
  std::vector<nl_featurization::nlv4_types::MatchedSpan>::__destroy_vector::operator()[abi:ne180100]((void ***)&v54);
  *(_QWORD *)&v54 = &v64;
  std::vector<std::pair<sirinluinternal::MatchingSpan_MatcherName,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v54);
  *(_QWORD *)&v54 = &v67;
  std::vector<std::pair<sirinluinternal::MatchingSpan_MatcherName,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v54);
  *(_QWORD *)&v54 = &v70;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v54);
}

void sub_1C22FBBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t **a33,uint64_t a34,uint64_t a35,uint64_t *a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  itfm_inference_orchestrator::inference_engine::ITFMModuleOutputType *v39;
  void *v40;
  uint64_t v41;
  void *v43;

  __cxa_free_exception(v40);
  v43 = *(void **)(v41 - 136);
  if (v43)
  {
    *(_QWORD *)(v41 - 128) = v43;
    operator delete(v43);
  }
  itfm_inference_orchestrator::inference_engine::ITFMModuleOutputType::~ITFMModuleOutputType(v39);
  *(_QWORD *)(v41 - 96) = a10;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 96));
  itfm_inference_orchestrator::inference_engine::ITFMModuleOutputType::~ITFMModuleOutputType((itfm_inference_orchestrator::inference_engine::ITFMModuleOutputType *)&__p);
  *(_QWORD *)(v41 - 96) = &a17;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 96));
  itfm_inference_orchestrator::inference_engine::ITFMModuleOutputType::~ITFMModuleOutputType((itfm_inference_orchestrator::inference_engine::ITFMModuleOutputType *)&a21);
  *(_QWORD *)(v41 - 96) = &a33;
  std::vector<nl_featurization::nlv4_types::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 96));
  a33 = &a36;
  std::vector<nl_featurization::nlv4_types::MatchedSpan>::__destroy_vector::operator()[abi:ne180100]((void ***)&a33);
  a36 = &a39;
  std::vector<std::pair<sirinluinternal::MatchingSpan_MatcherName,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a36);
  a39 = v41 - 192;
  std::vector<std::pair<sirinluinternal::MatchingSpan_MatcherName,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a39);
  *(_QWORD *)(v41 - 192) = v41 - 160;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 192));
  _Unwind_Resume(a1);
}

void std::vector<nl_featurization::span_matching::MatchedSpan>::__insert_with_size[abi:ne180100]<std::__wrap_iter<nl_featurization::span_matching::MatchedSpan const*>,std::__wrap_iter<nl_featurization::span_matching::MatchedSpan const*>>(uint64_t *a1, uint64_t a2, const std::basic_string<char16_t>::value_type **a3, const std::basic_string<char16_t>::value_type **a4, uint64_t a5)
{
  const std::basic_string<char16_t>::value_type **v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const std::basic_string<char16_t>::value_type **v21;
  const std::basic_string<char16_t>::value_type **v22;
  char *v23;
  const std::basic_string<char16_t>::value_type **v24;
  std::basic_string<char16_t> *v25;
  __int128 v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  std::basic_string<char16_t> *v31;
  const std::basic_string<char16_t>::value_type **v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  const std::basic_string<char16_t> *v51;
  const std::basic_string<char16_t>::value_type *v52;
  std::basic_string<char16_t> *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  __int128 v57;
  unint64_t v58;
  uint64_t v59;
  _QWORD v60[3];
  char v61;
  uint64_t v62;
  _QWORD *v63;

  if (a5 < 1)
    return;
  v6 = a3;
  v8 = *a1;
  v9 = a2 - *a1;
  v10 = v9 >> 5;
  v11 = *a1 + (v9 & 0xFFFFFFFFFFFFFFE0);
  v13 = (uint64_t)(a1 + 2);
  v12 = a1[2];
  v14 = (_QWORD *)a1[1];
  if (a5 <= (v12 - (uint64_t)v14) >> 5)
  {
    v19 = ((uint64_t)v14 - v11) >> 5;
    if (v19 >= a5)
    {
      v21 = &a3[4 * a5];
      v23 = (char *)a1[1];
    }
    else
    {
      v56 = a1 + 2;
      v60[0] = v14;
      v63 = v14;
      v21 = &a3[4 * v19];
      *(_QWORD *)&v57 = &v63;
      *((_QWORD *)&v57 + 1) = v60;
      LOBYTE(v58) = 0;
      if (v21 == a4)
      {
        v23 = (char *)v14;
      }
      else
      {
        v54 = v8;
        v55 = v10;
        v22 = v21 + 1;
        v23 = (char *)v14;
        do
        {
          v24 = v22 - 1;
          *(_QWORD *)v23 = *(v22 - 1);
          v25 = (std::basic_string<char16_t> *)(v23 + 8);
          if (*((char *)v22 + 23) < 0)
          {
            std::basic_string<char16_t>::__init_copy_ctor_external(v25, *v22, (std::basic_string<char16_t>::size_type)v22[1]);
            v23 = (char *)v60[0];
          }
          else
          {
            v26 = *(_OWORD *)v22;
            *((_QWORD *)v23 + 3) = v22[2];
            *(_OWORD *)&v25->__r_.__value_.__l.__data_ = v26;
          }
          v23 += 32;
          v60[0] = v23;
          v22 += 4;
        }
        while (v24 + 4 != a4);
        v8 = v54;
        v10 = v55;
      }
      LOBYTE(v58) = 1;
      std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nl_featurization::span_matching::MatchedSpan>,nl_featurization::span_matching::MatchedSpan*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&v56);
      a1[1] = (uint64_t)v23;
      if ((uint64_t)v14 - v11 < 1)
        return;
    }
    v40 = (char *)(v11 + 32 * a5);
    v41 = &v23[-32 * a5];
    v42 = v23;
    if (v41 < (char *)v14)
    {
      v42 = v23;
      do
      {
        *(_QWORD *)v42 = *(_QWORD *)v41;
        v43 = *(_OWORD *)(v41 + 8);
        *((_QWORD *)v42 + 3) = *((_QWORD *)v41 + 3);
        *(_OWORD *)(v42 + 8) = v43;
        *((_QWORD *)v41 + 2) = 0;
        *((_QWORD *)v41 + 3) = 0;
        *((_QWORD *)v41 + 1) = 0;
        v42 += 32;
        v41 += 32;
      }
      while (v41 < (char *)v14);
    }
    a1[1] = (uint64_t)v42;
    if (v23 != v40)
    {
      v44 = 0;
      v45 = (v23 - v40) >> 5;
      v46 = v8 + 32 * v10 + 32 * v45;
      v47 = -32 * v45;
      do
      {
        v48 = v46 + v44;
        *(_QWORD *)&v23[v44 - 32] = *(_QWORD *)(v46 + v44 - 32);
        v49 = (uint64_t)&v23[v44 - 24];
        if (v23[v44 - 1] < 0)
          operator delete(*(void **)v49);
        v44 -= 32;
        v50 = *(_OWORD *)(v48 - 24);
        *(_QWORD *)(v49 + 16) = *(_QWORD *)(v48 - 8);
        *(_OWORD *)v49 = v50;
        *(_BYTE *)(v48 - 1) = 0;
        *(_WORD *)(v48 - 24) = 0;
      }
      while (v47 != v44);
    }
    while (v6 != v21)
    {
      v51 = (const std::basic_string<char16_t> *)(v6 + 1);
      v52 = *v6;
      v6 += 4;
      v53 = (std::basic_string<char16_t> *)(v11 + 8);
      *(_QWORD *)v11 = v52;
      v11 += 32;
      std::basic_string<char16_t>::operator=(v53, v51);
    }
  }
  else
  {
    v15 = a5 + (((uint64_t)v14 - v8) >> 5);
    if (v15 >> 59)
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    v16 = v12 - v8;
    if (v16 >> 4 > v15)
      v15 = v16 >> 4;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFE0)
      v17 = 0x7FFFFFFFFFFFFFFLL;
    else
      v17 = v15;
    v59 = v13;
    if (v17)
      v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,std::vector<unsigned long>>>>(v17);
    else
      v18 = 0;
    v27 = 0;
    v28 = v17 + 32 * v10;
    v56 = (uint64_t *)v17;
    *(_QWORD *)&v57 = v28;
    *((_QWORD *)&v57 + 1) = v28;
    v58 = v17 + 32 * v18;
    v29 = 32 * a5;
    v30 = v28 + 32 * a5;
    do
    {
      *(_QWORD *)(v28 + v27) = v6[v27 / 8];
      v31 = (std::basic_string<char16_t> *)(v28 + v27 + 8);
      v32 = &v6[v27 / 8 + 1];
      if (SHIBYTE(v6[v27 / 8 + 3]) < 0)
      {
        std::basic_string<char16_t>::__init_copy_ctor_external(v31, *v32, (std::basic_string<char16_t>::size_type)v6[v27 / 8 + 2]);
      }
      else
      {
        v33 = *(_OWORD *)v32;
        *(_QWORD *)(v28 + v27 + 24) = v6[v27 / 8 + 3];
        *(_OWORD *)&v31->__r_.__value_.__l.__data_ = v33;
      }
      v27 += 32;
    }
    while (v29 != v27);
    *((_QWORD *)&v57 + 1) = v30;
    std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<nl_featurization::span_matching::MatchedSpan>,std::reverse_iterator<nl_featurization::span_matching::MatchedSpan*>,std::reverse_iterator<nl_featurization::span_matching::MatchedSpan*>,std::reverse_iterator<nl_featurization::span_matching::MatchedSpan*>>(v13, v11, v11, *a1, *a1, v57, v57);
    *(_QWORD *)&v57 = v34;
    v35 = a1[1];
    v63 = (_QWORD *)v30;
    v62 = v30;
    v60[0] = v13;
    v60[1] = &v62;
    v60[2] = &v63;
    if (v11 != v35)
    {
      do
      {
        *(_QWORD *)v30 = *(_QWORD *)v11;
        v36 = *(_OWORD *)(v11 + 8);
        *(_QWORD *)(v30 + 24) = *(_QWORD *)(v11 + 24);
        *(_OWORD *)(v30 + 8) = v36;
        *(_QWORD *)(v11 + 16) = 0;
        *(_QWORD *)(v11 + 24) = 0;
        *(_QWORD *)(v11 + 8) = 0;
        v30 += 32;
        v11 += 32;
      }
      while (v11 != v35);
      v63 = (_QWORD *)v30;
    }
    v61 = 1;
    std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nl_featurization::span_matching::MatchedSpan>,nl_featurization::span_matching::MatchedSpan*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v60);
    v37 = *(_OWORD *)a1;
    v38 = v58;
    *a1 = v57;
    a1[1] = v30;
    v57 = v37;
    v39 = a1[2];
    a1[2] = v38;
    v58 = v39;
    v56 = (uint64_t *)v37;
    std::__split_buffer<std::pair<sirinluinternal::MatchingSpan_MatcherName,std::string>>::~__split_buffer((uint64_t)&v56);
  }
}

void sub_1C22FC0D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v4;
  uint64_t v5;
  va_list va;

  va_start(va, a4);
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nl_featurization::span_matching::MatchedSpan>,nl_featurization::span_matching::MatchedSpan*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)va);
  *(_QWORD *)(v4 + 8) = v5;
  _Unwind_Resume(a1);
}

void nl_featurization::nlv4_types::Token::~Token(void **this)
{
  void **v2;

  v2 = this + 6;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v2);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

void std::vector<nl_featurization::nlv4_types::MatchedSpan>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 1) < 0)
          operator delete(*(v4 - 3));
        v4 -= 5;
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t *std::vector<nl_featurization::nlv4_types::Token>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

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
      v5 = v4 - 72;
      v6 = *(_OWORD *)(v3 - 72);
      *(_QWORD *)(v4 - 56) = *(_QWORD *)(v3 - 56);
      *(_OWORD *)(v4 - 72) = v6;
      *(_QWORD *)(v3 - 64) = 0;
      *(_QWORD *)(v3 - 56) = 0;
      *(_QWORD *)(v3 - 72) = 0;
      v7 = *(_OWORD *)(v3 - 48);
      *(_DWORD *)(v4 - 33) = *(_DWORD *)(v3 - 33);
      *(_OWORD *)(v4 - 48) = v7;
      *(_QWORD *)(v4 - 16) = 0;
      *(_QWORD *)(v4 - 8) = 0;
      *(_QWORD *)(v4 - 24) = 0;
      *(_OWORD *)(v4 - 24) = *(_OWORD *)(v3 - 24);
      *(_QWORD *)(v4 - 8) = *(_QWORD *)(v3 - 8);
      *(_QWORD *)(v3 - 24) = 0;
      *(_QWORD *)(v3 - 16) = 0;
      *(_QWORD *)(v3 - 8) = 0;
      v4 -= 72;
      v3 -= 72;
    }
    while (v3 != v2);
  }
  a2[1] = v5;
  v8 = *result;
  *result = v5;
  a2[1] = v8;
  v9 = result[1];
  result[1] = a2[2];
  a2[2] = v9;
  v10 = result[2];
  result[2] = a2[3];
  a2[3] = v10;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<nl_featurization::nlv4_types::Token>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 72;
    std::allocator<nl_featurization::nlv4_types::Token>::destroy[abi:ne180100](i - 72);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nl_featurization::span_matching::MatchedSpan>,nl_featurization::span_matching::MatchedSpan*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  if (!*(_BYTE *)(a1 + 24))
  {
    v3 = **(_QWORD **)(a1 + 16);
    v4 = **(_QWORD **)(a1 + 8);
    while (v3 != v4)
    {
      if (*(char *)(v3 - 1) < 0)
        operator delete(*(void **)(v3 - 24));
      v3 -= 32;
    }
  }
  return a1;
}

void nl_featurization::buildFeaturizer(nl_featurization *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5;
  void *v6;
  void *v7;
  _BYTE v8[48];
  void *v9[5];
  int v10;
  _OWORD v11[2];
  int v12;
  std::basic_string<char16_t> v13;
  std::basic_string<char16_t> v14;
  std::basic_string<char16_t> __p;
  char **v16;
  char *v17[2];
  char **v18;
  char *v19[2];
  std::basic_string<char16_t> v20;
  void *v21;
  char v22;
  char *v23;
  char *v24;
  void *v25;
  char v26;
  uint64_t v27;
  std::basic_string<char16_t> v28;
  std::basic_string<char16_t> v29;
  char **v30;
  char *v31;
  char *v32;
  char **v33;
  char *v34;
  char *v35;
  _BYTE v36[40];
  char v37;
  void *v38[5];
  int v39;
  std::basic_string<char16_t> v40;
  void *v41;
  char v42;
  char *v43;
  char *v44;
  void *v45;
  char v46;
  uint64_t v47;

  nl_featurization::vocabulary::Vocabulary::Vocabulary(&v28);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    std::basic_string<char16_t>::__init_copy_ctor_external(&v14, v28.__r_.__value_.__l.__data_, v28.__r_.__value_.__l.__size_);
  else
    v14 = v28;
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    std::basic_string<char16_t>::__init_copy_ctor_external(&__p, v29.__r_.__value_.__l.__data_, v29.__r_.__value_.__l.__size_);
  else
    __p = v29;
  v16 = v30;
  v17[0] = v31;
  v17[1] = v32;
  if (v32)
  {
    *((_QWORD *)v31 + 2) = v17;
    v30 = &v31;
    v31 = 0;
    v32 = 0;
  }
  else
  {
    v16 = v17;
  }
  v18 = v33;
  v19[0] = v34;
  v19[1] = v35;
  if (v35)
  {
    *((_QWORD *)v34 + 2) = v19;
    v33 = &v34;
    v34 = 0;
    v35 = 0;
  }
  else
  {
    v18 = v19;
  }
  if (*((char *)this + 31) < 0)
    std::basic_string<char16_t>::__init_copy_ctor_external(&v13, *((const std::basic_string<char16_t>::value_type **)this + 1), *((_QWORD *)this + 2));
  else
    v13 = *(std::basic_string<char16_t> *)((char *)this + 8);
  memset(v11, 0, sizeof(v11));
  v12 = 1065353216;
  nl_featurization::span_matching::MatchedSpansFeaturizer::MatchedSpansFeaturizer(&v20, (__int128 *)&v14, (uint64_t)&v13, (uint64_t *)v11);
  std::__hash_table<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>>>::~__hash_table((uint64_t)v11);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  std::__tree<std::__value_type<unsigned long,std::string>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::string>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::string>>>::destroy(v19[0]);
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(v17[0]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  nl_featurization::span_matching::span_processor::SpanProcessor::buildReverseMappingAndPatternTrie((uint64_t *)this + 4, (uint64_t)v8);
  v5 = operator new();
  nl_featurization::span_matching::MatchedSpansFeaturizer::MatchedSpansFeaturizer(&v40, (__int128 *)&v20);
  std::unordered_map<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>::unordered_map((uint64_t)v36, (uint64_t)v8);
  v37 = v8[40];
  std::unordered_map<char16_t,nl_featurization::pattern_trie::PatternTrieNode>::unordered_map((uint64_t)v38, (uint64_t)v9);
  v39 = v10;
  *(_QWORD *)v5 = off_1E7BE94A0;
  nl_featurization::span_matching::MatchedSpansFeaturizer::MatchedSpansFeaturizer((std::basic_string<char16_t> *)(v5 + 8), (__int128 *)&v40);
  std::unordered_map<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>::unordered_map(v5 + 168, (uint64_t)v36);
  *(_BYTE *)(v5 + 208) = v37;
  std::unordered_map<char16_t,nl_featurization::pattern_trie::PatternTrieNode>::unordered_map(v5 + 216, (uint64_t)v38);
  *(_DWORD *)(v5 + 256) = v39;
  std::__hash_table<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::__unordered_map_hasher<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::hash<char16_t>,std::equal_to<char16_t>,true>,std::__unordered_map_equal<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::equal_to<char16_t>,std::hash<char16_t>,true>,std::allocator<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>>>::__deallocate_node((_QWORD *)v38[2]);
  v6 = v38[0];
  v38[0] = 0;
  if (v6)
    operator delete(v6);
  std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>>>::~__hash_table((uint64_t)v36);
  std::__hash_table<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>>>::~__hash_table((uint64_t)&v47);
  if (v46 < 0)
    operator delete(v45);
  std::__tree<std::__value_type<unsigned long,std::string>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::string>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::string>>>::destroy(v44);
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(v43);
  if (v42 < 0)
    operator delete(v41);
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v40.__r_.__value_.__l.__data_);
  *a2 = v5;
  std::__hash_table<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::__unordered_map_hasher<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::hash<char16_t>,std::equal_to<char16_t>,true>,std::__unordered_map_equal<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::equal_to<char16_t>,std::hash<char16_t>,true>,std::allocator<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>>>::__deallocate_node((_QWORD *)v9[2]);
  v7 = v9[0];
  v9[0] = 0;
  if (v7)
    operator delete(v7);
  std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,std::vector<std::basic_string<char16_t>>>>>::~__hash_table((uint64_t)v8);
  std::__hash_table<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>>>::~__hash_table((uint64_t)&v27);
  if (v26 < 0)
    operator delete(v25);
  std::__tree<std::__value_type<unsigned long,std::string>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::string>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::string>>>::destroy(v24);
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(v23);
  if (v22 < 0)
    operator delete(v21);
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v20.__r_.__value_.__l.__data_);
  std::__tree<std::__value_type<unsigned long,std::string>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::string>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::string>>>::destroy(v34);
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(v31);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v29.__r_.__value_.__l.__data_);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v28.__r_.__value_.__l.__data_);
}

void sub_1C22FC680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  nl_featurization::vocabulary::Vocabulary::~Vocabulary((nl_featurization::vocabulary::Vocabulary *)&__p);
  nl_featurization::vocabulary::Vocabulary::~Vocabulary((nl_featurization::vocabulary::Vocabulary *)&a63);
  _Unwind_Resume(a1);
}

void nl_featurization::span_matching::MatchedSpansFeaturizer::~MatchedSpansFeaturizer(nl_featurization::span_matching::MatchedSpansFeaturizer *this)
{
  std::__hash_table<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>>>::~__hash_table((uint64_t)this + 120);
  if (*((char *)this + 119) < 0)
    operator delete(*((void **)this + 12));
  std::__tree<std::__value_type<unsigned long,std::string>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::string>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::string>>>::destroy(*((char **)this + 10));
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(*((char **)this + 7));
  if (*((char *)this + 47) < 0)
    operator delete(*((void **)this + 3));
  if (*((char *)this + 23) < 0)
    operator delete(*(void **)this);
}

std::basic_string<char16_t> *nl_featurization::span_matching::MatchedSpansFeaturizer::MatchedSpansFeaturizer(std::basic_string<char16_t> *this, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  std::basic_string<char16_t>::size_type *p_size;
  _QWORD *v7;
  std::basic_string<char16_t>::size_type v8;
  std::basic_string<char16_t>::size_type *v9;
  std::basic_string<char16_t>::size_type *v10;
  std::basic_string<char16_t>::size_type *v11;
  BOOL v12;
  uint64_t **v13;
  uint64_t *v14;
  std::basic_string<char16_t> *v15;
  __int128 v16;
  _QWORD *v17;
  _QWORD *v18;
  std::basic_string<char16_t>::size_type *v19;
  __int128 *v20;
  uint64_t *v21;
  std::basic_string<char16_t>::size_type *v22;
  std::basic_string<char16_t>::size_type *v23;
  std::basic_string<char16_t>::size_type *v24;
  std::basic_string<char16_t>::size_type v25;
  uint64_t **v26;
  uint64_t **v27;
  uint64_t *v28;
  std::basic_string<char16_t> *v29;
  __int128 v30;
  unint64_t v31;
  __int128 *v32;
  __int128 *v33;
  __int128 v34;
  std::basic_string<char16_t>::size_type *v36;

  if (*((char *)a2 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(this, *(const std::basic_string<char16_t>::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  if (*((char *)a2 + 47) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(this + 1, *((const std::basic_string<char16_t>::value_type **)a2 + 3), *((_QWORD *)a2 + 4));
  }
  else
  {
    v5 = *(__int128 *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 5);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v5;
  }
  this[2].__r_.__value_.__l.__size_ = 0;
  p_size = &this[2].__r_.__value_.__l.__size_;
  this[2].__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)&this[2].__r_.__value_.__l.__size_;
  this[2].__r_.__value_.__r.__words[2] = 0;
  v7 = (_QWORD *)*((_QWORD *)a2 + 6);
  if (v7 != (_QWORD *)((char *)a2 + 56))
  {
    do
    {
      v8 = *p_size;
      v9 = &this[2].__r_.__value_.__l.__size_;
      if ((std::basic_string<char16_t>::size_type *)this[2].__r_.__value_.__l.__data_ == p_size)
        goto LABEL_14;
      v10 = (std::basic_string<char16_t>::size_type *)*p_size;
      v11 = &this[2].__r_.__value_.__l.__size_;
      if (v8)
      {
        do
        {
          v9 = v10;
          v10 = (std::basic_string<char16_t>::size_type *)v10[1];
        }
        while (v10);
      }
      else
      {
        do
        {
          v9 = (std::basic_string<char16_t>::size_type *)v11[2];
          v12 = *v9 == (_QWORD)v11;
          v11 = v9;
        }
        while (v12);
      }
      if (std::less<std::basic_string<char16_t>>::operator()[abi:ne180100]((unsigned __int16 *)v9 + 16, (unsigned __int16 *)v7 + 16))
      {
LABEL_14:
        if (!v8)
        {
          v36 = &this[2].__r_.__value_.__l.__size_;
          v13 = (uint64_t **)&this[2].__r_.__value_.__l.__size_;
LABEL_20:
          v14 = (uint64_t *)operator new(0x40uLL);
          v15 = (std::basic_string<char16_t> *)(v14 + 4);
          if (*((char *)v7 + 55) < 0)
          {
            std::basic_string<char16_t>::__init_copy_ctor_external(v15, (const std::basic_string<char16_t>::value_type *)v7[4], v7[5]);
          }
          else
          {
            v16 = *((_OWORD *)v7 + 2);
            v14[6] = v7[6];
            *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v16;
          }
          v14[7] = v7[7];
          std::__tree<boost::archive::detail::basic_iarchive_impl::cobject_type>::__insert_node_at((uint64_t **)&this[2], (uint64_t)v36, v13, v14);
          goto LABEL_24;
        }
        v36 = v9;
        v13 = (uint64_t **)(v9 + 1);
      }
      else
      {
        v13 = (uint64_t **)std::__tree<std::__value_type<std::basic_string<char16_t>,unsigned long>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,unsigned long>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,unsigned long>>>::__find_equal<std::basic_string<char16_t>>((uint64_t)&this[2], &v36, (unsigned __int16 *)v7 + 16);
      }
      if (!*v13)
        goto LABEL_20;
LABEL_24:
      v17 = (_QWORD *)v7[1];
      if (v17)
      {
        do
        {
          v18 = v17;
          v17 = (_QWORD *)*v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          v18 = (_QWORD *)v7[2];
          v12 = *v18 == (_QWORD)v7;
          v7 = v18;
        }
        while (!v12);
      }
      v7 = v18;
    }
    while (v18 != (_QWORD *)((char *)a2 + 56));
  }
  this[3].__r_.__value_.__l.__size_ = 0;
  v19 = &this[3].__r_.__value_.__l.__size_;
  this[3].__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)&this[3].__r_.__value_.__l.__size_;
  this[3].__r_.__value_.__r.__words[2] = 0;
  v20 = (__int128 *)*((_QWORD *)a2 + 9);
  if (v20 != a2 + 5)
  {
    do
    {
      v21 = (uint64_t *)*v19;
      v22 = &this[3].__r_.__value_.__l.__size_;
      if ((std::basic_string<char16_t>::size_type *)this[3].__r_.__value_.__l.__data_ == v19)
        goto LABEL_37;
      v23 = (std::basic_string<char16_t>::size_type *)*v19;
      v24 = &this[3].__r_.__value_.__l.__size_;
      if (v21)
      {
        do
        {
          v22 = v23;
          v23 = (std::basic_string<char16_t>::size_type *)v23[1];
        }
        while (v23);
      }
      else
      {
        do
        {
          v22 = (std::basic_string<char16_t>::size_type *)v24[2];
          v12 = *v22 == (_QWORD)v24;
          v24 = v22;
        }
        while (v12);
      }
      v25 = *((_QWORD *)v20 + 4);
      if (v22[4] < v25)
      {
LABEL_37:
        if (v21)
          v26 = (uint64_t **)v22;
        else
          v26 = (uint64_t **)&this[3].__r_.__value_.__l.__size_;
        if (v21)
          v27 = (uint64_t **)(v22 + 1);
        else
          v27 = (uint64_t **)&this[3].__r_.__value_.__l.__size_;
      }
      else
      {
        v26 = (uint64_t **)&this[3].__r_.__value_.__l.__size_;
        v27 = (uint64_t **)&this[3].__r_.__value_.__l.__size_;
        if (v21)
        {
          v27 = (uint64_t **)&this[3].__r_.__value_.__l.__size_;
          while (1)
          {
            while (1)
            {
              v26 = (uint64_t **)v21;
              v31 = v21[4];
              if (v25 >= v31)
                break;
              v21 = *v26;
              v27 = v26;
              if (!*v26)
                goto LABEL_44;
            }
            if (v31 >= v25)
              break;
            v27 = v26 + 1;
            v21 = v26[1];
            if (!v21)
              goto LABEL_44;
          }
        }
      }
      if (!*v27)
      {
LABEL_44:
        v28 = (uint64_t *)operator new(0x40uLL);
        v28[4] = *((_QWORD *)v20 + 4);
        v29 = (std::basic_string<char16_t> *)(v28 + 5);
        if (*((char *)v20 + 63) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external(v29, *((const std::basic_string<char16_t>::value_type **)v20 + 5), *((_QWORD *)v20 + 6));
        }
        else
        {
          v30 = *(__int128 *)((char *)v20 + 40);
          v28[7] = *((_QWORD *)v20 + 7);
          *(_OWORD *)&v29->__r_.__value_.__l.__data_ = v30;
        }
        std::__tree<boost::archive::detail::basic_iarchive_impl::cobject_type>::__insert_node_at((uint64_t **)&this[3], (uint64_t)v26, v27, v28);
      }
      v32 = (__int128 *)*((_QWORD *)v20 + 1);
      if (v32)
      {
        do
        {
          v33 = v32;
          v32 = *(__int128 **)v32;
        }
        while (v32);
      }
      else
      {
        do
        {
          v33 = (__int128 *)*((_QWORD *)v20 + 2);
          v12 = *(_QWORD *)v33 == (_QWORD)v20;
          v20 = v33;
        }
        while (!v12);
      }
      v20 = v33;
    }
    while (v33 != a2 + 5);
  }
  if (*((char *)a2 + 119) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(this + 4, *((const std::basic_string<char16_t>::value_type **)a2 + 12), *((_QWORD *)a2 + 13));
  }
  else
  {
    v34 = a2[6];
    this[4].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 14);
    *(_OWORD *)&this[4].__r_.__value_.__l.__data_ = v34;
  }
  std::unordered_set<std::basic_string<char16_t>>::unordered_set((uint64_t)&this[5], (uint64_t)a2 + 120);
  return this;
}

void sub_1C22FCB60(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  std::__tree<std::__value_type<unsigned long,std::string>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::string>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::string>>>::destroy(*(char **)(v1 + 80));
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(*(char **)(v1 + 56));
  if (*(char *)(v1 + 47) < 0)
    operator delete(*v2);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(a1);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::basic_string<char16_t>,unsigned long>,void *>>>::operator()[abi:ne180100](char a1, void **__p)
{
  if (a1)
  {
    if (*((char *)__p + 55) < 0)
      operator delete(__p[4]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

BOOL std::less<std::basic_string<char16_t>>::operator()[abi:ne180100](unsigned __int16 *a1, unsigned __int16 *a2)
{
  unint64_t v2;
  int v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  unsigned __int16 *v7;
  unsigned __int16 *v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;

  v2 = *((unsigned __int8 *)a2 + 23);
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *((_QWORD *)a2 + 1);
  v4 = *((unsigned __int8 *)a1 + 23);
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = *((_QWORD *)a1 + 1);
  if (v2 >= v4)
    v6 = v4;
  else
    v6 = v2;
  if (v6)
  {
    if (v5 >= 0)
      v7 = a1;
    else
      v7 = *(unsigned __int16 **)a1;
    if (v3 >= 0)
      v8 = a2;
    else
      v8 = *(unsigned __int16 **)a2;
    while (1)
    {
      v9 = *v7;
      v10 = *v8;
      if (v10 != v9)
        break;
      ++v7;
      ++v8;
      if (!--v6)
        goto LABEL_17;
    }
    v11 = v9 >= v10;
  }
  else
  {
LABEL_17:
    v11 = v4 >= v2;
  }
  return !v11;
}

_QWORD *std::__tree<std::__value_type<std::basic_string<char16_t>,unsigned long>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,unsigned long>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,unsigned long>>>::__find_equal<std::basic_string<char16_t>>(uint64_t a1, _QWORD *a2, unsigned __int16 *a3)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v7;
  unsigned __int16 *v8;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        v7 = (_QWORD *)v4;
        v8 = (unsigned __int16 *)(v4 + 32);
        if (!std::less<std::basic_string<char16_t>>::operator()[abi:ne180100](a3, (unsigned __int16 *)(v4 + 32)))
          break;
        v4 = *v7;
        v5 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (!std::less<std::basic_string<char16_t>>::operator()[abi:ne180100](v8, a3))
        break;
      v5 = v7 + 1;
      v4 = v7[1];
    }
    while (v4);
  }
  else
  {
    v7 = (_QWORD *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t nl_featurization::FeaturizerConfig::getSpanVocabularyDataFilePath(nl_featurization::FeaturizerConfig *this)
{
  return (uint64_t)this + 56;
}

uint64_t nl_featurization::FeaturizerConfig::getBioTagDelimiter(nl_featurization::FeaturizerConfig *this)
{
  return (uint64_t)this + 8;
}

uint64_t nl_featurization::FeaturizerConfig::getSpanMatcherPatterns(nl_featurization::FeaturizerConfig *this)
{
  return (uint64_t)this + 32;
}

uint64_t nl_featurization::FeaturizerConfig::getFlags(nl_featurization::FeaturizerConfig *this)
{
  return *(_QWORD *)this;
}

uint64_t nl_featurization::FeaturizerOutput::getSpanLabelsTensor(nl_featurization::FeaturizerOutput *this)
{
  return (uint64_t)this + 24;
}

void convert(std::string *this, uint64_t a2)
{
  _QWORD *v2;
  _BYTE *v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  std::string::size_type v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  std::string::value_type __s[4];
  char v17;

  v2 = (_QWORD *)a2;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    *this->__r_.__value_.__l.__data_ = 0;
    this->__r_.__value_.__l.__size_ = 0;
    v4 = (_BYTE *)(a2 + 23);
    v5 = *(char *)(a2 + 23);
    if (v5 >= 0)
      LODWORD(v6) = *(unsigned __int8 *)(a2 + 23);
    else
      v6 = *(_QWORD *)(a2 + 8);
    if ((this->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v7 = 22;
    else
      v7 = LODWORD(this->__r_.__value_.__r.__words[2]) - 1;
  }
  else
  {
    this->__r_.__value_.__s.__data_[0] = 0;
    *((_BYTE *)&this->__r_.__value_.__s + 23) = 0;
    v4 = (_BYTE *)(a2 + 23);
    v5 = *(char *)(a2 + 23);
    if (v5 >= 0)
      LODWORD(v6) = *(unsigned __int8 *)(a2 + 23);
    else
      v6 = *(_QWORD *)(a2 + 8);
    v7 = 22;
  }
  if (v7 < (int)v6)
  {
    std::string::reserve(this, (int)v6);
    LOBYTE(v5) = *v4;
  }
  v17 = 0;
  *(_DWORD *)__s = 0;
  if ((v5 & 0x80u) != 0)
    v2 = (_QWORD *)*v2;
  if ((int)v6 >= 1)
  {
    v8 = 0;
    while (1)
    {
      v9 = v8 + 1;
      v10 = *((unsigned __int16 *)v2 + v8);
      if ((v10 & 0xFC00) == 0xD800 && (_DWORD)v9 != (_DWORD)v6)
        break;
      if (v10 > 0x7F)
      {
        if (v10 <= 0x7FF)
        {
          __s[0] = (v10 >> 6) | 0xC0;
          v15 = 1;
LABEL_31:
          v12 = v15 + 1;
          __s[v15] = v10 & 0x3F | 0x80;
          goto LABEL_32;
        }
LABEL_29:
        __s[0] = (v10 >> 12) | 0xE0;
        v14 = 1;
LABEL_30:
        v15 = v14 + 1;
        *(_BYTE *)((unint64_t)__s | v14) = (v10 >> 6) & 0x3F | 0x80;
        goto LABEL_31;
      }
      __s[0] = *((_WORD *)v2 + v8);
      v12 = 1;
LABEL_32:
      std::string::append(this, __s, v12);
      v8 = v9;
      if ((int)v9 >= (int)v6)
        return;
    }
    v13 = *((unsigned __int16 *)v2 + v9);
    if ((v13 & 0xFC00) != 0xDC00)
      goto LABEL_29;
    LODWORD(v9) = v8 + 2;
    v10 = v13 + (v10 << 10) - 56613888;
    __s[0] = (v10 >> 18) | 0xF0;
    __s[1] = (v10 >> 12) & 0x3F | 0x80;
    v14 = 2;
    goto LABEL_30;
  }
}

uint64_t isU16CharAppendSafe()
{
  return 1;
}

void normalize(uint64_t a1@<X0>, int a2@<W1>, std::basic_string<char16_t> *a3@<X8>)
{
  std::basic_string<char16_t>::value_type v5;
  uint64_t v6;
  int v7;
  std::basic_string<char16_t>::value_type v8;
  int v9;
  std::runtime_error *v10;
  std::string *v11;
  __int128 v12;
  std::string *v13;
  __int128 v14;
  char *v15;
  const std::string::value_type *v16;
  std::string::size_type v17;
  std::string *v18;
  __int128 v19;
  std::runtime_error *exception;
  _QWORD v21[2];
  unsigned __int8 v22;
  std::string v23;
  std::string v24;
  std::string v25;
  std::string v26;
  UErrorCode v27;

  v27 = U_ZERO_ERROR;
  switch(a2)
  {
    case 0:
      unorm2_getNFCInstance();
      break;
    case 1:
      unorm2_getNFDInstance();
      break;
    case 2:
      unorm2_getNFKCInstance();
      break;
    case 3:
      unorm2_getNFKDInstance();
      break;
    default:
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Unable to instantiate a normalizer form the input normalizer choice");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  if (*(char *)(a1 + 23) >= 0)
    LODWORD(v6) = *(unsigned __int8 *)(a1 + 23);
  else
    v6 = *(_QWORD *)(a1 + 8);
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  a3->__r_.__value_.__r.__words[0] = 0;
  if ((int)v6 >= 1)
  {
    std::basic_string<char16_t>::resize(a3, v6, v5);
    v7 = unorm2_normalize();
    if (v7 != (_DWORD)v6)
      std::basic_string<char16_t>::resize(a3, v7, v8);
    v9 = v27;
    if (v27 == U_BUFFER_OVERFLOW_ERROR)
    {
      v27 = U_ZERO_ERROR;
      unorm2_normalize();
      v9 = 0;
    }
    if (v9 >= 1)
    {
      v10 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      toString(a1, &v23);
      v11 = std::string::insert(&v23, 0, "Failed to normalize string ");
      v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
      v24.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v12;
      v11->__r_.__value_.__l.__size_ = 0;
      v11->__r_.__value_.__r.__words[2] = 0;
      v11->__r_.__value_.__r.__words[0] = 0;
      v13 = std::string::append(&v24, " - due to error: ");
      v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
      v25.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v14;
      v13->__r_.__value_.__l.__size_ = 0;
      v13->__r_.__value_.__r.__words[2] = 0;
      v13->__r_.__value_.__r.__words[0] = 0;
      v15 = (char *)u_errorName(v27);
      std::string::basic_string[abi:ne180100]<0>(v21, v15);
      if ((v22 & 0x80u) == 0)
        v16 = (const std::string::value_type *)v21;
      else
        v16 = (const std::string::value_type *)v21[0];
      if ((v22 & 0x80u) == 0)
        v17 = v22;
      else
        v17 = v21[1];
      v18 = std::string::append(&v25, v16, v17);
      v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
      v26.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v19;
      v18->__r_.__value_.__l.__size_ = 0;
      v18->__r_.__value_.__r.__words[2] = 0;
      v18->__r_.__value_.__r.__words[0] = 0;
      std::runtime_error::runtime_error(v10, &v26);
      __cxa_throw(v10, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
  }
}

void sub_1C22FD258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;
  void *v34;
  int v35;
  uint64_t v36;

  if (*(char *)(v36 - 57) < 0)
    operator delete(*(void **)(v36 - 80));
  if (a14 < 0)
    operator delete(__p);
  if (a33 < 0)
    operator delete(a28);
  if (a26 < 0)
    operator delete(a21);
  if (a20 < 0)
  {
    operator delete(a15);
    if ((v35 & 1) == 0)
    {
LABEL_14:
      if (*(char *)(v33 + 23) < 0)
        operator delete(*(void **)v33);
      _Unwind_Resume(a1);
    }
  }
  else if (!v35)
  {
    goto LABEL_14;
  }
  __cxa_free_exception(v34);
  goto LABEL_14;
}

void toString(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  convert(a2, a1);
}

void sub_1C22FD3B8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void toU16String(const char *a1@<X0>, std::basic_string<char16_t>::size_type a2@<X1>, std::basic_string<char16_t> *a3@<X8>)
{
  int v3;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  std::basic_string<char16_t>::size_type v11;
  unsigned int v12;
  unint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  std::basic_string<char16_t>::value_type __s[2];
  __int16 v20;

  v3 = a2;
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  std::basic_string<char16_t>::reserve(a3, a2);
  LODWORD(v6) = 0;
  v20 = 0;
  *(_DWORD *)__s = 0;
  while ((int)v6 < v3)
  {
    v7 = v6;
    v8 = (int)v6 + 1;
    v9 = a1[(int)v6];
    v10 = a1[(int)v6];
    if ((v9 & 0x80000000) == 0)
      goto LABEL_4;
    if ((_DWORD)v8 == v3)
      goto LABEL_6;
    if (v10 < 0xE0)
    {
      if (v10 < 0xC2)
        goto LABEL_23;
      v15 = v10 & 0x1F;
    }
    else
    {
      if (v10 > 0xEF)
      {
        if (v10 > 0xF4
          || (v18 = v10 - 240, v13 = a1[v8], ((byte_1C2313ACD[v13 >> 4] >> v18) & 1) == 0))
        {
LABEL_23:
          v12 = -1;
          LOWORD(v10) = -1;
          LODWORD(v6) = v8;
          goto LABEL_24;
        }
        v6 = (int)v6 + 2;
        if (v7 + 2 == v3)
        {
LABEL_6:
          v12 = -1;
          LOWORD(v10) = -1;
          LODWORD(v6) = v3;
          goto LABEL_24;
        }
        v14 = a1[v6] ^ 0x80;
        if (v14 > 0x3F)
        {
          v12 = -1;
          LOWORD(v10) = -1;
          goto LABEL_24;
        }
        LODWORD(v13) = v13 & 0x3F | (v18 << 6);
        LODWORD(v8) = v6;
      }
      else
      {
        v13 = v9 & 0xF;
        if (((a00000000000000[v13] >> (a1[v8] >> 5)) & 1) == 0)
          goto LABEL_23;
        v14 = a1[v8] & 0x3F;
      }
      LODWORD(v8) = v8 + 1;
      if ((_DWORD)v8 == v3)
        goto LABEL_6;
      v15 = v14 | ((_DWORD)v13 << 6);
    }
    v16 = a1[(int)v8] ^ 0x80;
    if (v16 >= 0x40)
      goto LABEL_23;
    v10 = v16 | (v15 << 6);
    LODWORD(v8) = v8 + 1;
    v17 = (unsigned __int16)(v15 >> 10);
    LODWORD(v6) = v8;
    v12 = v10;
    if (!v17)
    {
LABEL_4:
      __s[0] = v10;
      LODWORD(v6) = v8;
      v11 = 1;
      goto LABEL_25;
    }
LABEL_24:
    __s[0] = (v12 >> 10) - 10304;
    __s[1] = v10 & 0x3FF | 0xDC00;
    v11 = 2;
LABEL_25:
    std::basic_string<char16_t>::append(a3, __s, v11);
  }
}

void sub_1C22FD594(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void toU16String(const char *a1@<X0>, std::basic_string<char16_t> *a2@<X8>)
{
  std::basic_string<char16_t>::size_type v2;
  std::basic_string<char16_t>::size_type v3;

  v2 = *((_QWORD *)a1 + 1);
  if (a1[23] >= 0)
  {
    v3 = *((unsigned __int8 *)a1 + 23);
  }
  else
  {
    a1 = *(const char **)a1;
    v3 = v2;
  }
  toU16String(a1, v3, a2);
}

BOOL u16strCaseCompare(uint64_t *a1, uint64_t a2)
{
  int32_t v2;
  int32_t v3;
  char v4;
  const UChar *v5;
  int32_t v6;
  int32_t v7;
  std::runtime_error *exception;
  char *v10;
  std::string *v11;
  __int128 v12;
  std::string v13;
  std::string v14;
  UErrorCode pErrorCode;

  pErrorCode = U_ZERO_ERROR;
  v2 = *((unsigned __int8 *)a1 + 23);
  v3 = *((_DWORD *)a1 + 2);
  if ((v2 & 0x80u) != 0)
  {
    a1 = (uint64_t *)*a1;
    v2 = v3;
  }
  v4 = *(_BYTE *)(a2 + 23);
  if (v4 >= 0)
    v5 = (const UChar *)a2;
  else
    v5 = *(const UChar **)a2;
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(a2 + 23);
  else
    v6 = *(_DWORD *)(a2 + 8);
  v7 = u_strCaseCompare((const UChar *)a1, v2, v5, v6, 0x8000u, &pErrorCode);
  if (pErrorCode >= U_ILLEGAL_ARGUMENT_ERROR)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    v10 = (char *)u_errorName(pErrorCode);
    std::string::basic_string[abi:ne180100]<0>(&v13, v10);
    v11 = std::string::insert(&v13, 0, "Failed to compare strings - due to error: ");
    v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v14.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v14);
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  return v7 == 0;
}

void sub_1C22FD6D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

void u16strCaseFold(uint64_t a1@<X0>, std::basic_string<char16_t>::value_type a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  UChar *v6;
  const UChar *v7;
  int32_t v8;
  std::basic_string<char16_t>::value_type v9;
  int32_t v10;
  UErrorCode v11;
  UChar *v12;
  const UChar *v13;
  std::runtime_error *exception;
  std::string *v15;
  __int128 v16;
  std::string *v17;
  __int128 v18;
  char *v19;
  const std::string::value_type *v20;
  std::string::size_type v21;
  std::string *v22;
  __int128 v23;
  _QWORD v24[2];
  unsigned __int8 v25;
  std::string v26;
  std::string v27;
  std::string v28;
  std::string v29;
  UErrorCode pErrorCode;

  pErrorCode = U_ZERO_ERROR;
  if (*(char *)(a1 + 23) >= 0)
    LODWORD(v5) = *(unsigned __int8 *)(a1 + 23);
  else
    v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)a3 = 0;
  std::basic_string<char16_t>::resize((std::basic_string<char16_t> *)a3, (int)v5, a2);
  if (*(char *)(a3 + 23) >= 0)
    v6 = (UChar *)a3;
  else
    v6 = *(UChar **)a3;
  if (*(char *)(a1 + 23) >= 0)
    v7 = (const UChar *)a1;
  else
    v7 = *(const UChar **)a1;
  v8 = u_strFoldCase(v6, v5, v7, v5, 0, &pErrorCode);
  v10 = v8;
  if (v8 != (_DWORD)v5)
    std::basic_string<char16_t>::resize((std::basic_string<char16_t> *)a3, v8, v9);
  v11 = pErrorCode;
  if (pErrorCode == U_BUFFER_OVERFLOW_ERROR)
  {
    pErrorCode = U_ZERO_ERROR;
    if (*(char *)(a3 + 23) >= 0)
      v12 = (UChar *)a3;
    else
      v12 = *(UChar **)a3;
    if (*(char *)(a1 + 23) >= 0)
      v13 = (const UChar *)a1;
    else
      v13 = *(const UChar **)a1;
    u_strFoldCase(v12, v10, v13, v5, 0, &pErrorCode);
    v11 = pErrorCode;
  }
  if (v11 >= U_ILLEGAL_ARGUMENT_ERROR)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    toString(a1, &v26);
    v15 = std::string::insert(&v26, 0, "Failed to casefold string: ");
    v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    v27.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    v17 = std::string::append(&v27, " - due to error: ");
    v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
    v28.__r_.__value_.__r.__words[2] = v17->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v18;
    v17->__r_.__value_.__l.__size_ = 0;
    v17->__r_.__value_.__r.__words[2] = 0;
    v17->__r_.__value_.__r.__words[0] = 0;
    v19 = (char *)u_errorName(pErrorCode);
    std::string::basic_string[abi:ne180100]<0>(v24, v19);
    if ((v25 & 0x80u) == 0)
      v20 = (const std::string::value_type *)v24;
    else
      v20 = (const std::string::value_type *)v24[0];
    if ((v25 & 0x80u) == 0)
      v21 = v25;
    else
      v21 = v24[1];
    v22 = std::string::append(&v28, v20, v21);
    v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
    v29.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v23;
    v22->__r_.__value_.__l.__size_ = 0;
    v22->__r_.__value_.__r.__words[2] = 0;
    v22->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v29);
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
}

void sub_1C22FD918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;
  void *v34;
  int v35;
  uint64_t v36;

  if (*(char *)(v36 - 41) < 0)
    operator delete(*(void **)(v36 - 64));
  if (a14 < 0)
    operator delete(__p);
  if (a33 < 0)
    operator delete(a28);
  if (a26 < 0)
    operator delete(a21);
  if (a20 < 0)
  {
    operator delete(a15);
    if ((v35 & 1) == 0)
    {
LABEL_14:
      if (*(char *)(v33 + 23) < 0)
        operator delete(*(void **)v33);
      _Unwind_Resume(a1);
    }
  }
  else if (!v35)
  {
    goto LABEL_14;
  }
  __cxa_free_exception(v34);
  goto LABEL_14;
}

void u16Substring(uint64_t *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, std::basic_string<char16_t> *a4@<X8>)
{
  int v6;
  unint64_t v7;
  BOOL v9;
  std::basic_string<char16_t>::size_type v10;
  uint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  int v15;
  BOOL v16;
  int v17;
  std::basic_string<char16_t>::size_type v18;
  __int16 v19;
  std::runtime_error *exception;
  std::string *v21;
  __int128 v22;
  std::string *v23;
  __int128 v24;
  std::string *v25;
  std::string::size_type size;
  std::string *v27;
  __int128 v28;
  std::runtime_error *v29;
  std::string *v30;
  __int128 v31;
  std::string *v32;
  __int128 v33;
  std::string *v34;
  std::string::size_type v35;
  std::string *v36;
  __int128 v37;
  std::string *v38;
  __int128 v39;
  std::string v40;
  std::string v41;
  std::string v42;
  std::string v43;
  std::string v44;
  std::string __s;

  v6 = *((char *)a1 + 23);
  if (v6 >= 0)
    v7 = *((unsigned __int8 *)a1 + 23);
  else
    v7 = a1[1];
  if (v7 < a3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v42, a3);
    v21 = std::string::insert(&v42, 0, "Invalid substring range. The endIndex");
    v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
    v43.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v22;
    v21->__r_.__value_.__l.__size_ = 0;
    v21->__r_.__value_.__r.__words[2] = 0;
    v21->__r_.__value_.__r.__words[0] = 0;
    v23 = std::string::append(&v43, " >= src length ");
    v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
    v44.__r_.__value_.__r.__words[2] = v23->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v24;
    v23->__r_.__value_.__l.__size_ = 0;
    v23->__r_.__value_.__r.__words[2] = 0;
    v23->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v41, v7);
    if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v25 = &v41;
    else
      v25 = (std::string *)v41.__r_.__value_.__r.__words[0];
    if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v41.__r_.__value_.__r.__words[2]);
    else
      size = v41.__r_.__value_.__l.__size_;
    v27 = std::string::append(&v44, (const std::string::value_type *)v25, size);
    v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
    __s.__r_.__value_.__r.__words[2] = v27->__r_.__value_.__r.__words[2];
    *(_OWORD *)&__s.__r_.__value_.__l.__data_ = v28;
    v27->__r_.__value_.__l.__size_ = 0;
    v27->__r_.__value_.__r.__words[2] = 0;
    v27->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &__s);
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v9 = a3 >= a2;
  v10 = a3 - a2;
  if (v10 == 0 || !v9)
  {
    v29 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v41, a2);
    v30 = std::string::insert(&v41, 0, "Invalid substring range. startIndex  (");
    v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
    v42.__r_.__value_.__r.__words[2] = v30->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v31;
    v30->__r_.__value_.__l.__size_ = 0;
    v30->__r_.__value_.__r.__words[2] = 0;
    v30->__r_.__value_.__r.__words[0] = 0;
    v32 = std::string::append(&v42, ") >= endIndex (");
    v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
    v43.__r_.__value_.__r.__words[2] = v32->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v33;
    v32->__r_.__value_.__l.__size_ = 0;
    v32->__r_.__value_.__r.__words[2] = 0;
    v32->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v40, a3);
    if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v34 = &v40;
    else
      v34 = (std::string *)v40.__r_.__value_.__r.__words[0];
    if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v35 = HIBYTE(v40.__r_.__value_.__r.__words[2]);
    else
      v35 = v40.__r_.__value_.__l.__size_;
    v36 = std::string::append(&v43, (const std::string::value_type *)v34, v35);
    v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
    v44.__r_.__value_.__r.__words[2] = v36->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v37;
    v36->__r_.__value_.__l.__size_ = 0;
    v36->__r_.__value_.__r.__words[2] = 0;
    v36->__r_.__value_.__r.__words[0] = 0;
    v38 = std::string::append(&v44, ")");
    v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
    __s.__r_.__value_.__r.__words[2] = v38->__r_.__value_.__r.__words[2];
    *(_OWORD *)&__s.__r_.__value_.__l.__data_ = v39;
    v38->__r_.__value_.__l.__size_ = 0;
    v38->__r_.__value_.__r.__words[2] = 0;
    v38->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(v29, &__s);
    __cxa_throw(v29, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  a4->__r_.__value_.__r.__words[0] = 0;
  a4->__r_.__value_.__l.__size_ = 0;
  a4->__r_.__value_.__r.__words[2] = 0;
  if (v6 >= 0)
    v11 = a1;
  else
    v11 = (uint64_t *)*a1;
  *(_DWORD *)&__s.__r_.__value_.__s.__data_[2] = 0;
  std::basic_string<char16_t>::reserve(a4, v10);
  v12 = 0;
  do
  {
    v13 = v12 + 1;
    v14 = *((unsigned __int16 *)v11 + v12);
    if (v12 + 1 != v7 && (v14 & 0xFC00) == 0xD800)
    {
      v15 = *((unsigned __int16 *)v11 + v13);
      v16 = (v15 & 0xFC00) == 56320;
      v17 = v15 + (v14 << 10) - 56613888;
      if (v16)
        v14 = v17;
      if (v16)
        v13 = v12 + 2;
      else
        v13 = v12 + 1;
    }
    if (v12 >= a2)
    {
      if (HIWORD(v14))
      {
        v19 = v14 & 0x3FF | 0xDC00;
        v14 = (v14 >> 10) - 10304;
        *(_WORD *)&__s.__r_.__value_.__s.__data_[2] = v19;
        v18 = 2;
      }
      else
      {
        v18 = 1;
      }
      LOWORD(__s.__r_.__value_.__l.__data_) = v14;
      std::basic_string<char16_t>::append(a4, (const std::basic_string<char16_t>::value_type *)&__s, v18);
    }
    v12 = v13;
  }
  while (v13 < a3);
}

void sub_1C22FDD08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  void *v40;
  int v41;
  uint64_t v42;

  if (*(char *)(v42 - 89) < 0)
    operator delete(*(void **)(v42 - 112));
  if (a40 < 0)
    operator delete(__p);
  if (a14 < 0)
    operator delete(a9);
  if (a33 < 0)
    operator delete(a28);
  if (a26 < 0)
    operator delete(a21);
  if (a20 < 0)
  {
    operator delete(a15);
    if ((v41 & 1) == 0)
LABEL_16:
      _Unwind_Resume(a1);
  }
  else if (!v41)
  {
    goto LABEL_16;
  }
  __cxa_free_exception(v40);
  goto LABEL_16;
}

void nl_featurization::vocabulary::Vocabulary::insertToken(uint64_t a1, uint64_t a2, std::basic_string<char16_t>::size_type a3)
{
  uint64_t **v6;
  uint64_t **v7;
  uint64_t **v8;
  uint64_t *v9;
  std::basic_string<char16_t> *v10;
  char v11;
  uint64_t *v12;
  uint64_t **v13;
  uint64_t **v14;
  std::basic_string<char16_t>::size_type v15;
  char *v16;
  std::basic_string<char16_t> __p;
  std::basic_string<char16_t>::size_type v18;
  uint64_t v19;

  if (*(_QWORD *)(a1 + 88) != *(_QWORD *)(a1 + 64))
    __assert_rtn("insertToken", "vocabulary.cpp", 16, "mIdToText.size() == mTextToId.size()");
  v6 = (uint64_t **)(a1 + 48);
  if (*(char *)(a2 + 23) < 0)
    std::basic_string<char16_t>::__init_copy_ctor_external(&__p, *(const std::basic_string<char16_t>::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    __p = *(std::basic_string<char16_t> *)a2;
  v18 = a3;
  v7 = (uint64_t **)std::__tree<std::__value_type<std::basic_string<char16_t>,unsigned long>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,unsigned long>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,unsigned long>>>::__find_equal<std::basic_string<char16_t>>((uint64_t)v6, &v19, (unsigned __int16 *)&__p);
  if (*v7)
  {
    if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  v8 = v7;
  v9 = (uint64_t *)operator new(0x40uLL);
  v10 = (std::basic_string<char16_t> *)(v9 + 4);
  v11 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(v10, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    v9[6] = __p.__r_.__value_.__r.__words[2];
  }
  v9[7] = a3;
  std::__tree<boost::archive::detail::basic_iarchive_impl::cobject_type>::__insert_node_at(v6, v19, v8, v9);
  if (v11 < 0)
LABEL_7:
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_8:
  __p.__r_.__value_.__r.__words[0] = a3;
  if (*(char *)(a2 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)&__p.__r_.__value_.__r.__words[1], *(const std::basic_string<char16_t>::value_type **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = *(_OWORD *)a2;
    v18 = *(_QWORD *)(a2 + 16);
  }
  v13 = (uint64_t **)(a1 + 80);
  v12 = *(uint64_t **)(a1 + 80);
  if (v12)
  {
    while (1)
    {
      while (1)
      {
        v14 = (uint64_t **)v12;
        v15 = v12[4];
        if (__p.__r_.__value_.__r.__words[0] >= v15)
          break;
        v12 = *v14;
        v13 = v14;
        if (!*v14)
          goto LABEL_21;
      }
      if (v15 >= __p.__r_.__value_.__r.__words[0])
        break;
      v12 = v14[1];
      if (!v12)
      {
        v13 = v14 + 1;
        goto LABEL_21;
      }
    }
    if (SHIBYTE(v18) < 0)
      operator delete((void *)__p.__r_.__value_.__l.__size_);
  }
  else
  {
    v14 = (uint64_t **)(a1 + 80);
LABEL_21:
    v16 = (char *)operator new(0x40uLL);
    *(std::basic_string<char16_t> *)(v16 + 32) = __p;
    *((_QWORD *)v16 + 7) = v18;
    *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
    v18 = 0;
    std::__tree<boost::archive::detail::basic_iarchive_impl::cobject_type>::__insert_node_at((uint64_t **)(a1 + 72), (uint64_t)v14, v13, (uint64_t *)v16);
  }
}

void sub_1C22FE0A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  void **v18;

  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::basic_string<char16_t>,unsigned long>,void *>>>::operator()[abi:ne180100](0, v18);
  operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t nl_featurization::vocabulary::Vocabulary::getPadTokenId(nl_featurization::vocabulary::Vocabulary *this)
{
  _QWORD *v2;

  v2 = (_QWORD *)std::__tree<std::__value_type<std::basic_string<char16_t>,unsigned long>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,unsigned long>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,unsigned long>>>::find<std::basic_string<char16_t>>((uint64_t)this + 48, (unsigned __int16 *)this + 12);
  if ((_QWORD *)((char *)this + 56) == v2)
    return 0;
  else
    return v2[7];
}

uint64_t std::__tree<std::__value_type<std::basic_string<char16_t>,unsigned long>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,unsigned long>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,unsigned long>>>::find<std::basic_string<char16_t>>(uint64_t a1, unsigned __int16 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t *v7;

  v2 = a1 + 8;
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return v2;
  v5 = a1 + 8;
  do
  {
    v6 = std::less<std::basic_string<char16_t>>::operator()[abi:ne180100]((unsigned __int16 *)(v3 + 32), a2);
    v7 = (uint64_t *)(v3 + 8);
    if (!v6)
    {
      v7 = (uint64_t *)v3;
      v5 = v3;
    }
    v3 = *v7;
  }
  while (*v7);
  if (v5 == v2 || std::less<std::basic_string<char16_t>>::operator()[abi:ne180100](a2, (unsigned __int16 *)(v5 + 32)))
    return v2;
  return v5;
}

uint64_t nl_featurization::vocabulary::Vocabulary::getUnknownTokenId(nl_featurization::vocabulary::Vocabulary *this)
{
  _QWORD *v2;

  v2 = (_QWORD *)std::__tree<std::__value_type<std::basic_string<char16_t>,unsigned long>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,unsigned long>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,unsigned long>>>::find<std::basic_string<char16_t>>((uint64_t)this + 48, (unsigned __int16 *)this);
  if ((_QWORD *)((char *)this + 56) == v2)
    return 0;
  else
    return v2[7];
}

void nl_featurization::vocabulary::Vocabulary::initializeFromStream(uint64_t a1, _QWORD *a2)
{
  std::basic_string<char16_t>::size_type v4;
  std::locale::id *v5;
  const std::locale::facet *v6;
  unsigned __int8 v7;
  _QWORD *v8;
  std::basic_string<char16_t>::size_type v9;
  const char *v10;
  std::basic_string<char16_t> __p;
  void *v12;
  std::basic_string<char16_t>::size_type v13;
  uint64_t v14;

  v4 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v5 = (std::locale::id *)MEMORY[0x1E0DE4A90];
  while (1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a2 + *(_QWORD *)(*a2 - 24)));
    v6 = std::locale::use_facet((const std::locale *)&__p, v5);
    v7 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 10);
    std::locale::~locale((std::locale *)&__p);
    v8 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&v12, v7);
    if ((*((_BYTE *)v8 + *(_QWORD *)(*v8 - 24) + 32) & 5) != 0)
      break;
    if (v14 >= 0)
      v9 = HIBYTE(v14);
    else
      v9 = v13;
    if (v9)
    {
      if (v14 >= 0)
        v10 = (const char *)&v12;
      else
        v10 = (const char *)v12;
      toU16String(v10, v9, &__p);
      nl_featurization::vocabulary::Vocabulary::insertToken(a1, (uint64_t)&__p, v4);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      ++v4;
    }
  }
  if (v14 < 0)
    operator delete(v12);
}

void sub_1C22FE314(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *nl_featurization::vocabulary::Vocabulary::Vocabulary(_QWORD *a1)
{
  _QWORD *v2;
  std::runtime_error *exception;
  std::string v5;
  _QWORD v6[2];
  _BYTE v7[408];
  _QWORD v8[20];

  v8[19] = *MEMORY[0x1E0C80C00];
  v2 = std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(a1, (char *)L"[UNK]");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v2 + 3, (char *)L"[PAD]");
  a1[10] = 0;
  a1[7] = 0;
  a1[6] = a1 + 7;
  a1[11] = 0;
  a1[8] = 0;
  a1[9] = a1 + 10;
  std::ifstream::basic_ifstream(v6);
  if ((v7[*(_QWORD *)(v6[0] - 24) + 16] & 5) != 0)
  {
    std::ifstream::close(v6);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::operator+<char>();
    std::runtime_error::runtime_error(exception, &v5);
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  nl_featurization::vocabulary::Vocabulary::initializeFromStream((uint64_t)a1, v6);
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)((char *)v6 + *(_QWORD *)(v6[0] - 24)), *(_DWORD *)&v7[*(_QWORD *)(v6[0] - 24) + 16] | 4);
  v6[0] = *MEMORY[0x1E0DE4F40];
  *(_QWORD *)((char *)v6 + *(_QWORD *)(v6[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F40] + 24);
  MEMORY[0x1C3BB970C](v7);
  std::istream::~istream();
  MEMORY[0x1C3BB9A90](v8);
  return a1;
}

void sub_1C22FE4FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15)
{
  uint64_t v15;
  void **v16;
  void *v17;
  int v18;

  if (a14 < 0)
  {
    operator delete(__p);
    if ((v18 & 1) == 0)
    {
LABEL_6:
      std::ifstream::~ifstream(&a15);
      std::__tree<std::__value_type<unsigned long,std::string>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::string>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::string>>>::destroy(*(char **)(v15 + 80));
      std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(*(char **)(v15 + 56));
      if (*(char *)(v15 + 47) < 0)
        operator delete(*v16);
      if (*(char *)(v15 + 23) < 0)
        operator delete(*(void **)v15);
      _Unwind_Resume(a1);
    }
  }
  else if (!v18)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v17);
  goto LABEL_6;
}

_QWORD *nl_featurization::vocabulary::Vocabulary::Vocabulary(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;

  v4 = std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(a1, (char *)L"[UNK]");
  std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(v4 + 3, (char *)L"[PAD]");
  a1[7] = 0;
  a1[6] = a1 + 7;
  a1[11] = 0;
  a1[10] = 0;
  a1[8] = 0;
  a1[9] = a1 + 10;
  nl_featurization::vocabulary::Vocabulary::initializeFromStream((uint64_t)a1, a2);
  return a1;
}

void sub_1C22FE5FC(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  std::__tree<std::__value_type<unsigned long,std::string>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::string>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::string>>>::destroy(*(char **)(v1 + 80));
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(*(char **)(v1 + 56));
  if (*(char *)(v1 + 47) < 0)
    operator delete(*v2);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(a1);
}

uint64_t nl_featurization::vocabulary::Vocabulary::numericalizeToken(unsigned __int16 *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  std::logic_error *exception;
  uint64_t v8;

  v2 = *(unsigned __int8 *)(a2 + 23);
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a2 + 8);
  if (!v2)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, "tokenText argument is empty");
    goto LABEL_10;
  }
  v4 = (uint64_t)(a1 + 24);
  v5 = std::__tree<std::__value_type<std::basic_string<char16_t>,unsigned long>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,unsigned long>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,unsigned long>>>::find<std::basic_string<char16_t>>((uint64_t)(a1 + 24), (unsigned __int16 *)a2);
  if (a1 + 28 != (unsigned __int16 *)v5)
    return *(_QWORD *)(v5 + 56);
  if (v5 == std::__tree<std::__value_type<std::basic_string<char16_t>,unsigned long>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,unsigned long>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,unsigned long>>>::find<std::basic_string<char16_t>>(v4, a1))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, "Encountered unknown token text and the vocabulary hasno special unknown token");
LABEL_10:
    __cxa_throw(exception, (struct type_info *)off_1E7BE5148, MEMORY[0x1E0DE4360]);
  }
  v5 = *std::__tree<std::__value_type<std::basic_string<char16_t>,unsigned long>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,unsigned long>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,unsigned long>>>::__find_equal<std::basic_string<char16_t>>(v4, &v8, a1);
  if (!v5)
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  return *(_QWORD *)(v5 + 56);
}

void sub_1C22FE72C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void nl_featurization::vocabulary::Vocabulary::denumericalizeToken(nl_featurization::vocabulary::Vocabulary *this@<X0>, unint64_t a2@<X1>, std::basic_string<char16_t> *a3@<X8>)
{
  char *v3;
  _QWORD *v4;
  _QWORD *v5;
  char *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  std::runtime_error *exception;

  v5 = (_QWORD *)*((_QWORD *)this + 10);
  v3 = (char *)this + 80;
  v4 = v5;
  if (!v5)
    goto LABEL_15;
  v6 = v3;
  do
  {
    v7 = v4[4];
    v8 = v7 >= a2;
    if (v7 >= a2)
      v9 = v4;
    else
      v9 = v4 + 1;
    if (v8)
      v6 = (char *)v4;
    v4 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 == v3 || *((_QWORD *)v6 + 4) > a2)
  {
LABEL_15:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::range_error::range_error[abi:ne180100](exception, "Encountered unknown token ID");
    __cxa_throw(exception, (struct type_info *)off_1E7BE5128, MEMORY[0x1E0DE42B0]);
  }
  if (v6[63] < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(a3, *((const std::basic_string<char16_t>::value_type **)v6 + 5), *((_QWORD *)v6 + 6));
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)(v6 + 40);
    a3->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 7);
  }
}

void sub_1C22FE7F4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t nl_featurization::vocabulary::Vocabulary::size(nl_featurization::vocabulary::Vocabulary *this)
{
  return *((_QWORD *)this + 8);
}

void nl_featurization::bio::TagBucketList::addBIOUL(int8x8_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  int8x8_t *v5;
  uint64_t v7;
  unint64_t v8;
  int8x8_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned __int16 **v14;
  unsigned __int16 *i;
  unint64_t v16;
  unint64_t v17;
  int8x8_t v18;
  uint64_t *v19;
  int v20;
  const std::basic_string<char16_t>::value_type *v21;
  std::basic_string<char16_t>::size_type v22;
  std::basic_string<char16_t>::size_type v23;
  char v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  int v33;
  const std::basic_string<char16_t>::value_type *v34;
  std::basic_string<char16_t>::size_type v35;
  std::basic_string<char16_t>::size_type v36;
  char v37;
  unint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t *v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  const void **v64;
  const void **v65;
  std::basic_string<char16_t>::size_type *p_size;
  unint64_t v67;
  uint64_t v68;
  int8x8_t v69;
  int v70;
  const std::basic_string<char16_t>::value_type *v71;
  std::basic_string<char16_t>::size_type v72;
  std::basic_string<char16_t>::size_type v73;
  char v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  std::basic_string<char16_t>::size_type *v81;
  int8x8_t *v82;
  const void **v83;
  uint64_t *v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  int8x8_t v91;
  int v92;
  const std::basic_string<char16_t>::value_type *v93;
  std::basic_string<char16_t>::size_type v94;
  std::basic_string<char16_t>::size_type v95;
  char v96;
  unint64_t v97;
  unint64_t *v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t *v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  std::runtime_error *exception;
  unint64_t v114;
  std::basic_string<char16_t>::size_type v115;
  const void **v116;
  std::basic_string<char16_t> v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  unint64_t v121;
  unint64_t *v122;
  _QWORD v123[3];

  v123[2] = *MEMORY[0x1E0C80C00];
  if (a4 < a3 || (v5 = a1, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&a1[2] - *(_QWORD *)&a1[1]) >> 3) < a4))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Token indices out of range.");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v7 = a2;
  v8 = std::__string_hash<char16_t>::operator()[abi:ne180100](a2);
  v9 = v5[8];
  if (v9)
  {
    v10 = v8;
    v11 = (uint8x8_t)vcnt_s8(v9);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v13 = v8;
      if (v8 >= *(_QWORD *)&v9)
        v13 = v8 % *(_QWORD *)&v9;
    }
    else
    {
      v13 = (*(_QWORD *)&v9 - 1) & v8;
    }
    v14 = *(unsigned __int16 ***)(*(_QWORD *)&v5[7] + 8 * v13);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int16 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v10 == v16)
        {
          if (std::equal_to<std::basic_string<char16_t>>::operator()[abi:ne180100](i + 8, (unsigned __int16 *)v7))
          {
            v56 = (uint64_t *)(*(_QWORD *)&v5[1] + 24 * a3);
            v57 = v56 + 1;
            v58 = v56[1];
            if (v58 >= v56[2])
            {
              v59 = std::vector<std::basic_string<char16_t>>::__emplace_back_slow_path<std::basic_string<char16_t> const&>(v56, (__int128 *)v7);
            }
            else
            {
              std::vector<std::basic_string<char16_t>>::__construct_one_at_end[abi:ne180100]<std::basic_string<char16_t> const&>((uint64_t)v56, (__int128 *)v7);
              v59 = v58 + 24;
            }
            *v57 = v59;
            return;
          }
        }
        else
        {
          if (v12 > 1)
          {
            if (v16 >= *(_QWORD *)&v9)
              v16 %= *(_QWORD *)&v9;
          }
          else
          {
            v16 &= *(_QWORD *)&v9 - 1;
          }
          if (v16 != v13)
            break;
        }
      }
    }
  }
  v17 = a4 - a3;
  if (a4 != a3)
  {
    v18 = v5[1];
    v19 = (uint64_t *)(*(_QWORD *)&v18 + 24 * a3);
    if (v17 == 1)
    {
      std::operator+[abi:ne180100]<char16_t,std::char_traits<char16_t>,std::allocator<char16_t>>(&v117, (const void **)&v5[24], (const void **)&v5[4]);
      v20 = *(char *)(v7 + 23);
      if (v20 >= 0)
        v21 = (const std::basic_string<char16_t>::value_type *)v7;
      else
        v21 = *(const std::basic_string<char16_t>::value_type **)v7;
      if (v20 >= 0)
        v22 = *(unsigned __int8 *)(v7 + 23);
      else
        v22 = *(_QWORD *)(v7 + 8);
      std::basic_string<char16_t>::append(&v117, v21, v22);
      v123[0] = v117.__r_.__value_.__l.__size_;
      v23 = v117.__r_.__value_.__r.__words[0];
      *(_QWORD *)((char *)v123 + 7) = *(std::basic_string<char16_t>::size_type *)((char *)&v117.__r_.__value_.__r.__words[1]
                                                                                + 7);
      v24 = HIBYTE(v117.__r_.__value_.__r.__words[2]);
      memset(&v117, 0, sizeof(v117));
      v25 = *(_QWORD *)&v18 + 24 * a3;
      v28 = *(_QWORD *)(v25 + 16);
      v26 = (unint64_t *)(v25 + 16);
      v27 = v28;
      v30 = (uint64_t *)(v26 - 1);
      v29 = *(v26 - 1);
      if (v29 >= v28)
      {
        v46 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v29 - *v19) >> 3);
        v47 = v46 + 1;
        if (v46 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        v48 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v27 - *v19) >> 3);
        if (2 * v48 > v47)
          v47 = 2 * v48;
        if (v48 >= 0x555555555555555)
          v49 = 0xAAAAAAAAAAAAAAALL;
        else
          v49 = v47;
        v122 = v26;
        if (v49)
          v49 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(v49);
        else
          v50 = 0;
        v60 = v49 + 24 * v46;
        v118 = v49;
        v119 = v60;
        v121 = v49 + 24 * v50;
        v61 = v123[0];
        *(_QWORD *)v60 = v23;
        *(_QWORD *)(v60 + 8) = v61;
        *(_QWORD *)(v60 + 15) = *(_QWORD *)((char *)v123 + 7);
        *(_BYTE *)(v60 + 23) = v24;
        v120 = v60 + 24;
        std::vector<std::basic_string<char16_t>>::__swap_out_circular_buffer(v19, &v118);
        v32 = *v30;
        std::__split_buffer<std::basic_string<char16_t>>::~__split_buffer((uint64_t)&v118);
      }
      else
      {
        v31 = v123[0];
        *(_QWORD *)v29 = v23;
        *(_QWORD *)(v29 + 8) = v31;
        *(_QWORD *)(v29 + 15) = *(_QWORD *)((char *)v123 + 7);
        *(_BYTE *)(v29 + 23) = v24;
        v32 = v29 + 24;
        *v30 = v29 + 24;
      }
      *v30 = v32;
    }
    else
    {
      std::operator+[abi:ne180100]<char16_t,std::char_traits<char16_t>,std::allocator<char16_t>>(&v117, (const void **)&v5[12], (const void **)&v5[4]);
      v116 = (const void **)&v5[4];
      v33 = *(char *)(v7 + 23);
      if (v33 >= 0)
        v34 = (const std::basic_string<char16_t>::value_type *)v7;
      else
        v34 = *(const std::basic_string<char16_t>::value_type **)v7;
      if (v33 >= 0)
        v35 = *(unsigned __int8 *)(v7 + 23);
      else
        v35 = *(_QWORD *)(v7 + 8);
      std::basic_string<char16_t>::append(&v117, v34, v35);
      v123[0] = v117.__r_.__value_.__l.__size_;
      v36 = v117.__r_.__value_.__r.__words[0];
      *(_QWORD *)((char *)v123 + 7) = *(std::basic_string<char16_t>::size_type *)((char *)&v117.__r_.__value_.__r.__words[1]
                                                                                + 7);
      v37 = HIBYTE(v117.__r_.__value_.__r.__words[2]);
      memset(&v117, 0, sizeof(v117));
      v38 = *(_QWORD *)&v18 + 24 * a3;
      v41 = *(_QWORD *)(v38 + 16);
      v39 = (unint64_t *)(v38 + 16);
      v40 = v41;
      v43 = (uint64_t *)(v39 - 1);
      v42 = *(v39 - 1);
      if (v42 >= v41)
      {
        v51 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v42 - *v19) >> 3);
        v52 = v51 + 1;
        if (v51 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        v53 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v40 - *v19) >> 3);
        if (2 * v53 > v52)
          v52 = 2 * v53;
        if (v53 >= 0x555555555555555)
          v54 = 0xAAAAAAAAAAAAAAALL;
        else
          v54 = v52;
        v122 = v39;
        if (v54)
          v54 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(v54);
        else
          v55 = 0;
        v62 = v54 + 24 * v51;
        v118 = v54;
        v119 = v62;
        v121 = v54 + 24 * v55;
        v63 = v123[0];
        *(_QWORD *)v62 = v36;
        *(_QWORD *)(v62 + 8) = v63;
        *(_QWORD *)(v62 + 15) = *(_QWORD *)((char *)v123 + 7);
        *(_BYTE *)(v62 + 23) = v37;
        v120 = v62 + 24;
        std::vector<std::basic_string<char16_t>>::__swap_out_circular_buffer(v19, &v118);
        v45 = *v43;
        std::__split_buffer<std::basic_string<char16_t>>::~__split_buffer((uint64_t)&v118);
      }
      else
      {
        v44 = v123[0];
        *(_QWORD *)v42 = v36;
        *(_QWORD *)(v42 + 8) = v44;
        *(_QWORD *)(v42 + 15) = *(_QWORD *)((char *)v123 + 7);
        *(_BYTE *)(v42 + 23) = v37;
        v45 = v42 + 24;
        *v43 = v42 + 24;
      }
      *v43 = v45;
      if (SHIBYTE(v117.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v117.__r_.__value_.__l.__data_);
      v114 = a4 - 1;
      v64 = (const void **)&v5[4];
      if (a3 + 1 < a4 - 1)
      {
        v65 = (const void **)&v5[15];
        p_size = &v117.__r_.__value_.__l.__size_;
        v67 = v17 - 2;
        v68 = 24 * a3;
        do
        {
          v69 = v5[1];
          std::operator+[abi:ne180100]<char16_t,std::char_traits<char16_t>,std::allocator<char16_t>>(&v117, v65, v64);
          v70 = *(char *)(v7 + 23);
          if (v70 >= 0)
            v71 = (const std::basic_string<char16_t>::value_type *)v7;
          else
            v71 = *(const std::basic_string<char16_t>::value_type **)v7;
          if (v70 >= 0)
            v72 = *(unsigned __int8 *)(v7 + 23);
          else
            v72 = *(_QWORD *)(v7 + 8);
          std::basic_string<char16_t>::append(&v117, v71, v72);
          v73 = v117.__r_.__value_.__r.__words[0];
          v123[0] = *p_size;
          *(_QWORD *)((char *)v123 + 7) = *(std::basic_string<char16_t>::size_type *)((char *)p_size + 7);
          v74 = HIBYTE(v117.__r_.__value_.__r.__words[2]);
          memset(&v117, 0, sizeof(v117));
          v75 = *(_QWORD *)&v69 + v68;
          v76 = *(_QWORD *)(*(_QWORD *)&v69 + v68 + 32);
          v77 = (unint64_t *)(*(_QWORD *)&v69 + v68 + 40);
          if (v76 >= *v77)
          {
            v115 = v73;
            v80 = v7;
            v81 = p_size;
            v82 = v5;
            v83 = v65;
            v84 = (uint64_t *)(*(_QWORD *)&v69 + v68 + 24);
            v85 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v76 - *v84) >> 3);
            v86 = v85 + 1;
            if (v85 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * ((uint64_t)(*v77 - *v84) >> 3) > v86)
              v86 = 0x5555555555555556 * ((uint64_t)(*v77 - *v84) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v77 - *v84) >> 3) >= 0x555555555555555)
              v87 = 0xAAAAAAAAAAAAAAALL;
            else
              v87 = v86;
            v122 = v77;
            if (v87)
              v87 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(v87);
            else
              v88 = 0;
            v89 = v87 + 24 * v85;
            v118 = v87;
            v119 = v89;
            v121 = v87 + 24 * v88;
            v90 = v123[0];
            *(_QWORD *)v89 = v115;
            *(_QWORD *)(v89 + 8) = v90;
            *(_QWORD *)(v89 + 15) = *(_QWORD *)((char *)v123 + 7);
            *(_BYTE *)(v89 + 23) = v74;
            v120 = v89 + 24;
            std::vector<std::basic_string<char16_t>>::__swap_out_circular_buffer(v84, &v118);
            v79 = *(_QWORD *)(v75 + 32);
            std::__split_buffer<std::basic_string<char16_t>>::~__split_buffer((uint64_t)&v118);
            v65 = v83;
            v5 = v82;
            p_size = v81;
            v7 = v80;
          }
          else
          {
            v78 = v123[0];
            *(_QWORD *)v76 = v73;
            *(_QWORD *)(v76 + 8) = v78;
            *(_QWORD *)(v76 + 15) = *(_QWORD *)((char *)v123 + 7);
            *(_BYTE *)(v76 + 23) = v74;
            v79 = v76 + 24;
            *(_QWORD *)(v75 + 32) = v76 + 24;
          }
          *(_QWORD *)(v75 + 32) = v79;
          if (SHIBYTE(v117.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v117.__r_.__value_.__l.__data_);
          v68 += 24;
          --v67;
          v64 = v116;
        }
        while (v67);
      }
      v91 = v5[1];
      std::operator+[abi:ne180100]<char16_t,std::char_traits<char16_t>,std::allocator<char16_t>>(&v117, (const void **)&v5[18], v64);
      v92 = *(char *)(v7 + 23);
      if (v92 >= 0)
        v93 = (const std::basic_string<char16_t>::value_type *)v7;
      else
        v93 = *(const std::basic_string<char16_t>::value_type **)v7;
      if (v92 >= 0)
        v94 = *(unsigned __int8 *)(v7 + 23);
      else
        v94 = *(_QWORD *)(v7 + 8);
      std::basic_string<char16_t>::append(&v117, v93, v94);
      v123[0] = v117.__r_.__value_.__l.__size_;
      v95 = v117.__r_.__value_.__r.__words[0];
      *(_QWORD *)((char *)v123 + 7) = *(std::basic_string<char16_t>::size_type *)((char *)&v117.__r_.__value_.__r.__words[1]
                                                                                + 7);
      v96 = HIBYTE(v117.__r_.__value_.__r.__words[2]);
      memset(&v117, 0, sizeof(v117));
      v97 = *(_QWORD *)&v91 + 24 * v114;
      v100 = *(_QWORD *)(v97 + 16);
      v98 = (unint64_t *)(v97 + 16);
      v99 = v100;
      v102 = (uint64_t *)(v98 - 1);
      v101 = *(v98 - 1);
      if (v101 >= v100)
      {
        v105 = (uint64_t *)(*(_QWORD *)&v91 + 24 * v114);
        v106 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v101 - *v105) >> 3);
        v107 = v106 + 1;
        if (v106 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        v108 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v99 - *v105) >> 3);
        if (2 * v108 > v107)
          v107 = 2 * v108;
        if (v108 >= 0x555555555555555)
          v109 = 0xAAAAAAAAAAAAAAALL;
        else
          v109 = v107;
        v122 = v98;
        if (v109)
          v109 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(v109);
        else
          v110 = 0;
        v111 = v109 + 24 * v106;
        v118 = v109;
        v119 = v111;
        v121 = v109 + 24 * v110;
        v112 = v123[0];
        *(_QWORD *)v111 = v95;
        *(_QWORD *)(v111 + 8) = v112;
        *(_QWORD *)(v111 + 15) = *(_QWORD *)((char *)v123 + 7);
        *(_BYTE *)(v111 + 23) = v96;
        v120 = v111 + 24;
        std::vector<std::basic_string<char16_t>>::__swap_out_circular_buffer(v105, &v118);
        v104 = *v102;
        std::__split_buffer<std::basic_string<char16_t>>::~__split_buffer((uint64_t)&v118);
      }
      else
      {
        v103 = v123[0];
        *(_QWORD *)v101 = v95;
        *(_QWORD *)(v101 + 8) = v103;
        *(_QWORD *)(v101 + 15) = *(_QWORD *)((char *)v123 + 7);
        *(_BYTE *)(v101 + 23) = v96;
        v104 = v101 + 24;
        *v102 = v101 + 24;
      }
      *v102 = v104;
    }
    if (SHIBYTE(v117.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v117.__r_.__value_.__l.__data_);
  }
}

void sub_1C22FEFB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;
  int v18;

  if (v18 < 0)
    operator delete(v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::operator+[abi:ne180100]<char16_t,std::char_traits<char16_t>,std::allocator<char16_t>>(_QWORD *result, const void **a2, const void **a3)
{
  int v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v10;
  char *v11;
  const void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *((char *)a2 + 23);
  if (v3 >= 0)
    v4 = *((unsigned __int8 *)a2 + 23);
  else
    v4 = (unint64_t)a2[1];
  v5 = *((char *)a3 + 23);
  if (v5 >= 0)
    v6 = *((unsigned __int8 *)a3 + 23);
  else
    v6 = (unint64_t)a3[1];
  v7 = v6 + v4;
  if (v6 + v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v10 = result;
  if (v7 > 0xA)
  {
    v14 = (v7 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((v7 | 3) != 0xB)
      v14 = v7 | 3;
    v15 = v14 + 1;
    if (v14 + 1 < 0)
      std::__throw_bad_array_new_length[abi:ne180100]();
    result = operator new(2 * v15);
    v11 = (char *)result;
    v10[1] = v7;
    v10[2] = v15 | 0x8000000000000000;
    *v10 = result;
    if (v4)
      goto LABEL_13;
  }
  else
  {
    result[1] = 0;
    result[2] = 0;
    *result = 0;
    *((_BYTE *)result + 23) = v7;
    if ((v7 & 0x80u) == 0)
      v11 = (char *)result;
    else
      v11 = 0;
    if (v4)
    {
LABEL_13:
      if (v3 >= 0)
        v12 = a2;
      else
        v12 = *a2;
      result = memmove(v11, v12, 2 * v4);
    }
  }
  if (v6)
  {
    if (v5 >= 0)
      v13 = a3;
    else
      v13 = *a3;
    result = memmove(&v11[2 * v4], v13, 2 * v6);
  }
  *(_WORD *)&v11[2 * v4 + 2 * v6] = 0;
  return result;
}

uint64_t nl_featurization::bio::TagBucketList::getBucketLists@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  __int128 **v3;
  __int128 **v4;
  _QWORD *v5;
  _QWORD v6[3];
  char v7;
  _QWORD *v8;
  _QWORD *v9;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v3 = *(__int128 ***)(this + 8);
  v4 = *(__int128 ***)(this + 16);
  if (v4 != v3)
  {
    std::vector<std::vector<std::pair<std::string,std::reference_wrapper<sirinluinternal::MatchingSpan const>>>>::__vallocate[abi:ne180100](a2, 0xAAAAAAAAAAAAAAABLL * (v4 - v3));
    v8 = (_QWORD *)a2[1];
    v9 = v8;
    v6[0] = a2 + 2;
    v6[1] = &v8;
    v6[2] = &v9;
    v7 = 0;
    v5 = v8;
    do
    {
      *v5 = 0;
      v5[1] = 0;
      v5[2] = 0;
      std::vector<std::basic_string<char16_t>>::__init_with_size[abi:ne180100]<std::basic_string<char16_t>*,std::basic_string<char16_t>*>((uint64_t)v5, *v3, v3[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v3[1] - (char *)*v3) >> 3));
      v5 = v9 + 3;
      v9 += 3;
      v3 += 3;
    }
    while (v3 != v4);
    v7 = 1;
    this = std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<uaap_orchestration::grammar::Path>,uaap_orchestration::grammar::Path*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v6);
    a2[1] = v5;
  }
  return this;
}

void sub_1C22FF234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<uaap_orchestration::grammar::Path>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

unsigned __int16 *nl_featurization::pattern_trie::PatternTrie::insert(unsigned __int16 *result, uint64_t a2)
{
  unsigned __int16 *v2;
  uint64_t v3;
  unsigned __int16 *v4;
  _QWORD *v5;
  unint64_t v6;
  int8x8_t v7;
  uint8x8_t v8;
  unint64_t v9;
  uint64_t ***v10;
  uint64_t **i;
  unint64_t v12;
  unsigned __int16 *v13;
  unsigned __int16 *v14;
  uint64_t v15;
  uint64_t j;
  void *v17;

  v2 = (unsigned __int16 *)a2;
  if (*(char *)(a2 + 23) < 0)
  {
    v3 = *(_QWORD *)(a2 + 8);
    if (!v3)
      return result;
    v2 = *(unsigned __int16 **)a2;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
    if (!*(_BYTE *)(a2 + 23))
      return result;
  }
  v4 = &v2[v3];
  do
  {
    v5 = result + 4;
    v6 = *v2;
    v7 = *(int8x8_t *)(result + 8);
    if (v7)
    {
      v8 = (uint8x8_t)vcnt_s8(v7);
      v8.i16[0] = vaddlv_u8(v8);
      if (v8.u32[0] > 1uLL)
      {
        v9 = *v2;
        if (*(_QWORD *)&v7 <= v6)
          v9 = v6 % *(_QWORD *)&v7;
      }
      else
      {
        v9 = (v7.i32[0] - 1) & v6;
      }
      v10 = *(uint64_t ****)(*v5 + 8 * v9);
      if (v10)
      {
        for (i = *v10; i; i = (uint64_t **)*i)
        {
          v12 = (unint64_t)i[1];
          if (v12 == v6)
          {
            if (*((unsigned __int16 *)i + 8) == (_DWORD)v6)
              goto LABEL_31;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v12 >= *(_QWORD *)&v7)
                v12 %= *(_QWORD *)&v7;
            }
            else
            {
              v12 &= *(_QWORD *)&v7 - 1;
            }
            if (v12 != v9)
              break;
          }
        }
      }
    }
    v13 = std::__hash_table<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::__unordered_map_hasher<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::hash<char16_t>,std::equal_to<char16_t>,true>,std::__unordered_map_equal<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::equal_to<char16_t>,std::hash<char16_t>,true>,std::allocator<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>>>::__emplace_unique_key_args<char16_t,std::piecewise_construct_t const&,std::tuple<char16_t const&>,std::tuple<>>((uint64_t)(result + 4), v6, v2);
    v14 = v13;
    *((_BYTE *)v13 + 24) = 0;
    if (*((_QWORD *)v13 + 7))
    {
      std::__hash_table<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::__unordered_map_hasher<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::hash<char16_t>,std::equal_to<char16_t>,true>,std::__unordered_map_equal<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::equal_to<char16_t>,std::hash<char16_t>,true>,std::allocator<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>>>::__deallocate_node(*((_QWORD **)v13 + 6));
      *((_QWORD *)v14 + 6) = 0;
      v15 = *((_QWORD *)v14 + 5);
      if (v15)
      {
        for (j = 0; j != v15; ++j)
          *(_QWORD *)(*((_QWORD *)v14 + 4) + 8 * j) = 0;
      }
      *((_QWORD *)v14 + 7) = 0;
    }
    v17 = (void *)*((_QWORD *)v14 + 4);
    *((_QWORD *)v14 + 4) = 0;
    if (v17)
      operator delete(v17);
    *((_QWORD *)v14 + 6) = 0;
    *((_QWORD *)v14 + 5) = 0;
    *((_QWORD *)v14 + 7) = 0;
    *((_DWORD *)v14 + 16) = 1065353216;
    std::__hash_table<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::__unordered_map_hasher<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::hash<char16_t>,std::equal_to<char16_t>,true>,std::__unordered_map_equal<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::equal_to<char16_t>,std::hash<char16_t>,true>,std::allocator<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>>>::__deallocate_node(0);
    LOWORD(v6) = *v2;
LABEL_31:
    result = std::__hash_table<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::__unordered_map_hasher<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::hash<char16_t>,std::equal_to<char16_t>,true>,std::__unordered_map_equal<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::equal_to<char16_t>,std::hash<char16_t>,true>,std::allocator<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>>>::__emplace_unique_key_args<char16_t,std::piecewise_construct_t const&,std::tuple<char16_t const&>,std::tuple<>>((uint64_t)v5, v6, v2++)+ 12;
  }
  while (v2 != v4);
  *(_BYTE *)result = 1;
  return result;
}

void sub_1C22FF468(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::__unordered_map_hasher<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::hash<char16_t>,std::equal_to<char16_t>,true>,std::__unordered_map_equal<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::equal_to<char16_t>,std::hash<char16_t>,true>,std::allocator<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int16 *std::__hash_table<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::__unordered_map_hasher<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::hash<char16_t>,std::equal_to<char16_t>,true>,std::__unordered_map_equal<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::equal_to<char16_t>,std::hash<char16_t>,true>,std::allocator<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>>>::__emplace_unique_key_args<char16_t,std::piecewise_construct_t const&,std::tuple<char16_t const&>,std::tuple<>>(uint64_t a1, unsigned __int16 a2, unsigned __int16 *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  unsigned __int16 *v10;
  unint64_t v11;
  _QWORD *v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  _QWORD v23[2];
  char v24;

  v6 = a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = a2;
      if (v7 <= a2)
        v3 = a2 % v7;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & a2;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = (unsigned __int16 *)*v9;
      if (*v9)
      {
        do
        {
          v11 = *((_QWORD *)v10 + 1);
          if (v11 == a2)
          {
            if (v10[8] == a2)
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = *(unsigned __int16 **)v10;
        }
        while (v10);
      }
    }
  }
  v12 = (_QWORD *)(a1 + 16);
  v10 = (unsigned __int16 *)operator new(0x48uLL);
  v23[0] = v10;
  v23[1] = a1 + 16;
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = v6;
  v10[8] = *a3;
  *(_OWORD *)(v10 + 28) = 0u;
  *(_OWORD *)(v10 + 12) = 0u;
  *(_OWORD *)(v10 + 20) = 0u;
  *((_DWORD *)v10 + 16) = 1065353216;
  v24 = 1;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v7 || (float)(v14 * (float)v7) < v13)
  {
    v15 = 1;
    if (v7 >= 3)
      v15 = (v7 & (v7 - 1)) != 0;
    v16 = v15 | (2 * v7);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v18);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v20)
  {
    *(_QWORD *)v10 = *v20;
LABEL_38:
    *v20 = v10;
    goto LABEL_39;
  }
  *(_QWORD *)v10 = *v12;
  *v12 = v10;
  *(_QWORD *)(v19 + 8 * v3) = v12;
  if (*(_QWORD *)v10)
  {
    v21 = *(_QWORD *)(*(_QWORD *)v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v21 >= v7)
        v21 %= v7;
    }
    else
    {
      v21 &= v7 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  v23[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,void *>>>>::reset[abi:ne180100]((uint64_t)v23);
  return v10;
}

void sub_1C22FF6B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t **nl_featurization::pattern_trie::PatternTrie::search(uint64_t **a1, uint64_t a2)
{
  unsigned __int16 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t **result;

  v2 = (unsigned __int16 *)a2;
  if (*(char *)(a2 + 23) < 0)
  {
    v3 = *(_QWORD *)(a2 + 8);
    if (!v3)
      return 0;
    v2 = *(unsigned __int16 **)a2;
  }
  else
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
    if (!*(_BYTE *)(a2 + 23))
      return 0;
  }
  v4 = 2 * v3;
  while (1)
  {
    result = std::__hash_table<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::__unordered_map_hasher<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::hash<char16_t>,std::equal_to<char16_t>,true>,std::__unordered_map_equal<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::equal_to<char16_t>,std::hash<char16_t>,true>,std::allocator<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>>>::find<char16_t>(a1 + 1, *v2);
    if (!result)
      break;
    a1 = result + 3;
    ++v2;
    v4 -= 2;
    if (!v4)
      return (uint64_t **)(*(_BYTE *)a1 != 0);
  }
  return result;
}

uint64_t **std::__hash_table<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::__unordered_map_hasher<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::hash<char16_t>,std::equal_to<char16_t>,true>,std::__unordered_map_equal<char16_t,std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>,std::equal_to<char16_t>,std::hash<char16_t>,true>,std::allocator<std::__hash_value_type<char16_t,nl_featurization::pattern_trie::PatternTrieNode>>>::find<char16_t>(_QWORD *a1, unsigned __int16 a2)
{
  unint64_t v2;
  uint8x8_t v3;
  unint64_t v4;
  uint64_t ***v5;
  uint64_t **result;
  unint64_t v7;

  v2 = a1[1];
  if (!v2)
    return 0;
  v3 = (uint8x8_t)vcnt_s8((int8x8_t)v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    v4 = a2;
    if (v2 <= a2)
      v4 = a2 % v2;
  }
  else
  {
    v4 = ((_DWORD)v2 - 1) & a2;
  }
  v5 = *(uint64_t ****)(*a1 + 8 * v4);
  if (!v5)
    return 0;
  for (result = *v5; result; result = (uint64_t **)*result)
  {
    v7 = (unint64_t)result[1];
    if (v7 == a2)
    {
      if (*((unsigned __int16 *)result + 8) == a2)
        return result;
    }
    else
    {
      if (v3.u32[0] > 1uLL)
      {
        if (v7 >= v2)
          v7 %= v2;
      }
      else
      {
        v7 &= v2 - 1;
      }
      if (v7 != v4)
        return 0;
    }
  }
  return result;
}

void nl_featurization::postprocessing::base::postProcessBaseModelInner(nl_featurization::postprocessing::base *this@<X0>, const nl_featurization::postprocessing::base::BaseModelQueryContextInner *a2@<X1>, std::basic_string<char16_t> *a3@<X8>)
{
  uint64_t *v5;
  unint64_t v6;
  _QWORD *v8;
  unint64_t *v10;
  unint64_t *v11;
  nl_featurization::vocabulary::Vocabulary *v12;
  std::basic_string<char16_t> *v13;
  char v14;
  std::basic_string<char16_t> *v15;
  char v16;
  __int128 v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  __int128 v24;
  const std::basic_string<char16_t>::value_type **v25;
  __int128 v26;
  char *v27;
  std::logic_error *exception;
  std::basic_string<char16_t> __p;
  uint64_t v30;
  std::basic_string<char16_t> *v31;
  unint64_t v32;
  std::basic_string<char16_t> v33;
  std::basic_string<char16_t> *p_p;
  char v35;

  v5 = (uint64_t *)((char *)this + 192);
  v6 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)this + 25) - *((_QWORD *)this + 24)) >> 4);
  if (v6 != (uint64_t)(*((_QWORD *)a2 + 2) - *((_QWORD *)a2 + 1)) >> 3)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, "Number of tokens differs from number of BIO tags");
    goto LABEL_30;
  }
  v8 = (_QWORD *)((char *)a2 + 32);
  if (v6 != (uint64_t)(*((_QWORD *)a2 + 5) - *((_QWORD *)a2 + 4)) >> 4)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, "Number of tokens differs from number of group IDs");
LABEL_30:
    __cxa_throw(exception, (struct type_info *)off_1E7BE5148, MEMORY[0x1E0DE4360]);
  }
  nl_featurization::vocabulary::Vocabulary::denumericalizeToken(this, *(_QWORD *)a2, &v33);
  v30 = 0;
  v31 = 0;
  v32 = 0;
  v10 = (unint64_t *)*((_QWORD *)a2 + 1);
  v11 = (unint64_t *)*((_QWORD *)a2 + 2);
  if (v10 != v11)
  {
    v12 = (nl_featurization::postprocessing::base *)((char *)this + 96);
    do
    {
      nl_featurization::vocabulary::Vocabulary::denumericalizeToken(v12, *v10, &__p);
      v13 = v31;
      if ((unint64_t)v31 >= v32)
      {
        v15 = (std::basic_string<char16_t> *)std::vector<std::basic_string<char16_t>>::__push_back_slow_path<std::basic_string<char16_t> const&>(&v30, (__int128 *)&__p);
        v14 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v14 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external(v31, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        }
        else
        {
          *(_OWORD *)&v31->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          v13->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
        }
        v15 = v13 + 1;
      }
      v31 = v15;
      if (v14 < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      ++v10;
    }
    while (v10 != v11);
  }
  nl_featurization::bio::convertToLabelledSpans(&v30, v8, v5, (uint64_t *)&__p);
  v16 = HIBYTE(v33.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    std::basic_string<char16_t>::__init_copy_ctor_external(a3, v33.__r_.__value_.__l.__data_, v33.__r_.__value_.__l.__size_);
  else
    *a3 = v33;
  a3[1].__r_.__value_.__r.__words[0] = 0;
  a3[1].__r_.__value_.__l.__size_ = 0;
  a3[1].__r_.__value_.__r.__words[2] = 0;
  v17 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
  p_p = a3 + 1;
  v35 = 0;
  if (__p.__r_.__value_.__l.__size_ != __p.__r_.__value_.__r.__words[0])
  {
    v18 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3);
    if (v18 >= 0x276276276276277)
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nl_featurization::postprocessing::LabelledSpan>>(v18);
    v20 = 0;
    a3[1].__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)v19;
    a3[1].__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)v19;
    a3[1].__r_.__value_.__r.__words[2] = (std::basic_string<char16_t>::size_type)&v19[104 * v21];
    do
    {
      v22 = &v19[v20];
      v23 = v17 + v20;
      v24 = *(_OWORD *)(v17 + v20 + 16);
      *(_OWORD *)v22 = *(_OWORD *)(v17 + v20);
      *((_OWORD *)v22 + 1) = v24;
      v25 = (const std::basic_string<char16_t>::value_type **)(v17 + v20 + 32);
      if (*(char *)(v17 + v20 + 55) < 0)
      {
        std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)&v19[v20 + 32], *v25, *(_QWORD *)(v23 + 40));
      }
      else
      {
        v26 = *(_OWORD *)v25;
        *(_QWORD *)&v19[v20 + 48] = *(_QWORD *)(v17 + v20 + 48);
        *(_OWORD *)&v19[v20 + 32] = v26;
      }
      std::__optional_copy_base<std::basic_string<char16_t>,false>::__optional_copy_base[abi:ne180100]((std::basic_string<char16_t> *)&v19[v20 + 56], (__int128 *)(v17 + v20 + 56));
      *(_OWORD *)&v19[v20 + 88] = *(_OWORD *)(v23 + 88);
      v20 += 104;
    }
    while (v23 + 104 != *((_QWORD *)&v17 + 1));
    v27 = &v19[v20];
    v16 = HIBYTE(v33.__r_.__value_.__r.__words[2]);
    a3[1].__r_.__value_.__l.__size_ = (std::basic_string<char16_t>::size_type)v27;
  }
  p_p = &__p;
  std::vector<nl_featurization::postprocessing::LabelledSpan>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
  __p.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)&v30;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  if (v16 < 0)
    operator delete(v33.__r_.__value_.__l.__data_);
}

void sub_1C22FFAC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void **a25)
{
  a25 = (void **)&a10;
  std::vector<nl_featurization::postprocessing::LabelledSpan>::__destroy_vector::operator()[abi:ne180100](&a25);
  a10 = &a16;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void nl_featurization::postprocessing::base::postProcessBaseModel(__int128 **this@<X0>, const nl_featurization::postprocessing::base::BaseModelQueryContext *a2@<X1>, std::basic_string<char16_t> *a3@<X8>)
{
  std::basic_string<char16_t> v7;
  std::basic_string<char16_t> v8;
  char **v9;
  _QWORD v10[2];
  char **v11;
  _QWORD v12[2];
  std::basic_string<char16_t> v13;
  std::basic_string<char16_t> v14;
  char **v15;
  _QWORD v16[2];
  char **v17;
  _QWORD v18[2];
  _QWORD v19[4];
  std::basic_string<char16_t> v20;
  std::basic_string<char16_t> __p;
  char **v22;
  char *v23;
  uint64_t v24;
  char **v25;
  char *v26;
  uint64_t v27;
  std::basic_string<char16_t> v28;
  std::basic_string<char16_t> v29;
  char **v30;
  char *v31;
  uint64_t v32;
  char **v33;
  char *v34;
  uint64_t v35;

  nl_featurization::vocabulary::Vocabulary::Vocabulary(&v28);
  nl_featurization::vocabulary::Vocabulary::Vocabulary(&v20);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    std::basic_string<char16_t>::__init_copy_ctor_external(&v7, v28.__r_.__value_.__l.__data_, v28.__r_.__value_.__l.__size_);
  else
    v7 = v28;
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    std::basic_string<char16_t>::__init_copy_ctor_external(&v8, v29.__r_.__value_.__l.__data_, v29.__r_.__value_.__l.__size_);
  else
    v8 = v29;
  v9 = v30;
  v10[0] = v31;
  v10[1] = v32;
  if (v32)
  {
    *((_QWORD *)v31 + 2) = v10;
    v30 = &v31;
    v31 = 0;
    v32 = 0;
  }
  else
  {
    v9 = (char **)v10;
  }
  v11 = v33;
  v12[0] = v34;
  v12[1] = v35;
  if (v35)
  {
    *((_QWORD *)v34 + 2) = v12;
    v33 = &v34;
    v34 = 0;
    v35 = 0;
  }
  else
  {
    v11 = (char **)v12;
  }
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
    std::basic_string<char16_t>::__init_copy_ctor_external(&v13, v20.__r_.__value_.__l.__data_, v20.__r_.__value_.__l.__size_);
  else
    v13 = v20;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::basic_string<char16_t>::__init_copy_ctor_external(&v14, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v14 = __p;
  v15 = v22;
  v16[0] = v23;
  v16[1] = v24;
  if (v24)
  {
    *((_QWORD *)v23 + 2) = v16;
    v22 = &v23;
    v23 = 0;
    v24 = 0;
  }
  else
  {
    v15 = (char **)v16;
  }
  v17 = v25;
  v18[0] = v26;
  v18[1] = v27;
  if (v27)
  {
    *((_QWORD *)v26 + 2) = v18;
    v25 = &v26;
    v26 = 0;
    v27 = 0;
  }
  else
  {
    v17 = (char **)v18;
  }
  memset(v19, 0, 24);
  std::vector<nl_featurization::Token>::__init_with_size[abi:ne180100]<nl_featurization::Token*,nl_featurization::Token*>(v19, this[6], this[7], 0xAAAAAAAAAAAAAAABLL * (this[7] - this[6]));
  nl_featurization::postprocessing::base::postProcessBaseModelInner((nl_featurization::postprocessing::base *)&v7, a2, a3);
  nl_featurization::postprocessing::base::BaseModelQueryContextInner::~BaseModelQueryContextInner((nl_featurization::postprocessing::base::BaseModelQueryContextInner *)&v7);
  std::__tree<std::__value_type<unsigned long,std::string>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::string>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::string>>>::destroy(v26);
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(v23);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v20.__r_.__value_.__l.__data_);
  std::__tree<std::__value_type<unsigned long,std::string>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::string>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::string>>>::destroy(v34);
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(v31);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v29.__r_.__value_.__l.__data_);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v28.__r_.__value_.__l.__data_);
}

void sub_1C22FFE2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  uint64_t v43;

  if (a29 < 0)
    operator delete(__p);
  nl_featurization::vocabulary::Vocabulary::~Vocabulary((nl_featurization::vocabulary::Vocabulary *)&a9);
  nl_featurization::vocabulary::Vocabulary::~Vocabulary((nl_featurization::vocabulary::Vocabulary *)&a43);
  nl_featurization::vocabulary::Vocabulary::~Vocabulary((nl_featurization::vocabulary::Vocabulary *)(v43 - 144));
  _Unwind_Resume(a1);
}

void nl_featurization::postprocessing::base::BaseModelQueryContextInner::~BaseModelQueryContextInner(nl_featurization::postprocessing::base::BaseModelQueryContextInner *this)
{
  void **v2;

  v2 = (void **)((char *)this + 192);
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100](&v2);
  std::__tree<std::__value_type<unsigned long,std::string>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::string>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::string>>>::destroy(*((char **)this + 22));
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(*((char **)this + 19));
  if (*((char *)this + 143) < 0)
    operator delete(*((void **)this + 15));
  if (*((char *)this + 119) < 0)
    operator delete(*((void **)this + 12));
  std::__tree<std::__value_type<unsigned long,std::string>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::string>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::string>>>::destroy(*((char **)this + 10));
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(*((char **)this + 7));
  if (*((char *)this + 47) < 0)
    operator delete(*((void **)this + 3));
  if (*((char *)this + 23) < 0)
    operator delete(*(void **)this);
}

_QWORD *nl_featurization::beam_search::isSequenceUnique(uint64_t a1, uint64_t a2, unint64_t a3)
{
  _QWORD *result;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;

  result = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::unique_ptr<uaap::UPDDSpan>>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::unique_ptr<uaap::UPDDSpan>>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::unique_ptr<uaap::UPDDSpan>>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::unique_ptr<uaap::UPDDSpan>>>>>::find<unsigned long>(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a1 + 16));
  if (result)
  {
    v7 = (_QWORD *)result[4];
    v5 = result + 4;
    v6 = v7;
    if (!v7)
      goto LABEL_13;
    v8 = v5;
    do
    {
      v9 = v6[4];
      v10 = v9 >= a3;
      if (v9 >= a3)
        v11 = v6;
      else
        v11 = v6 + 1;
      if (v10)
        v8 = v6;
      v6 = (_QWORD *)*v11;
    }
    while (*v11);
    if (v8 == v5 || v8[4] > a3)
LABEL_13:
      v8 = v5;
    return (_QWORD *)(v8 != v5);
  }
  return result;
}

_QWORD *nl_featurization::beam_search::isSequenceIndexable(uint64_t a1, uint64_t a2, unint64_t a3)
{
  _QWORD *result;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;

  result = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::unique_ptr<uaap::UPDDSpan>>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::unique_ptr<uaap::UPDDSpan>>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::unique_ptr<uaap::UPDDSpan>>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::unique_ptr<uaap::UPDDSpan>>>>>::find<unsigned long>(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a1 + 16));
  if (result)
  {
    v7 = (_QWORD *)result[4];
    v5 = result + 4;
    v6 = v7;
    if (!v7)
      goto LABEL_13;
    v8 = v5;
    do
    {
      v9 = v6[4];
      v10 = v9 >= a3;
      if (v9 >= a3)
        v11 = v6;
      else
        v11 = v6 + 1;
      if (v10)
        v8 = v6;
      v6 = (_QWORD *)*v11;
    }
    while (*v11);
    if (v8 == v5 || v8[4] > a3)
LABEL_13:
      v8 = v5;
    return (_QWORD *)(v8 != v5);
  }
  return result;
}

BOOL nl_featurization::beam_search::isEntityNewGroup(_QWORD *a1, unint64_t a2)
{
  if (!a2)
    return 1;
  if (a2 >= (uint64_t)(a1[1] - *a1) >> 3)
    std::vector<nlv4_inference_orchestrator::trees::TreeNode>::__throw_out_of_range[abi:ne180100]();
  return *(double *)(*a1 + 8 * a2) > 0.5;
}

uint64_t nl_featurization::beam_search::getHighestExistingGroupId(unint64_t **a1)
{
  unint64_t *v1;
  uint64_t *v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v1 = *a1;
  v2 = (uint64_t *)a1[1];
  if (*a1 == (unint64_t *)v2)
  {
    v5 = 0;
    v3 = 0;
  }
  else
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = *v1;
      v7 = *v1;
      if ((v5 | (v3 << 8)) > *v1)
        v6 = v5 | (v3 << 8);
      v8 = v6;
      v9 = v6 >> 8;
      if (v4)
        v7 = v8;
      else
        v9 = *v1 >> 8;
      if (*((_BYTE *)v1 + 8))
      {
        v5 = v7;
        v4 = 1;
        v3 = v9;
      }
      v1 += 2;
    }
    while (v1 != (unint64_t *)v2);
  }
  return v5 | (v3 << 8);
}

unint64_t nl_featurization::beam_search::getGroupIdForSequence(uint64_t a1, uint64_t a2, uint64_t a3, char a4, int a5, unint64_t a6)
{
  unint64_t v9;
  unint64_t v10;
  char v11;

  if (nl_featurization::beam_search::isSequenceIndexable(a2, a1, a6))
  {
    if (!a4 || (a5 & 1) != 0)
    {
      v10 = (a3 + 1) & 0xFFFFFFFFFFFFFF00;
      if (a5)
        v11 = a3 + 1;
      else
        v11 = 1;
      if (!a5)
        v10 = 0;
      if (a4)
        LOBYTE(a3) = v11;
      else
        LOBYTE(a3) = 1;
      if (a4)
        v9 = v10;
      else
        v9 = 0;
    }
    else
    {
      v9 = a3 & 0xFFFFFFFFFFFFFF00;
    }
  }
  else
  {
    LOBYTE(a3) = 0;
    v9 = 0;
  }
  return v9 | a3;
}

void nl_featurization::beam_search::getCandidatesFromEntityScores(uint64_t *a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X3>, _QWORD *a5@<X4>, _QWORD *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  unint64_t v19;
  BOOL v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _BOOL4 v25;
  uint64_t HighestExistingGroupId;
  char v27;
  unint64_t GroupIdForSequence;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  unint64_t *v32;
  uint64_t v33;
  unint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t *v40;
  unint64_t *v41;
  unint64_t v42;
  char v43;
  double v44;
  double v45;
  double v46;
  double v47;
  unint64_t *v48;
  unint64_t *v49;
  unint64_t *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  unint64_t *v56;
  unint64_t v57;
  double v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t *v72;
  uint64_t v77[3];
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  _BYTE v84[40];
  _QWORD *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *__p;
  void *v91;
  uint64_t v92[3];
  unint64_t *v93;
  unint64_t *v94;
  unint64_t v95;
  unint64_t *v96;
  unint64_t *v97;
  unint64_t v98;
  _QWORD v99[6];

  *a9 = 0;
  a9[1] = 0;
  a9[2] = 0;
  v10 = *a1;
  v68 = a1[1];
  if (*a1 != v68)
  {
    v11 = a2;
    v69 = a9 + 2;
    v13 = *a2;
    v12 = a2[1];
    v14 = v12;
    v72 = a9;
    do
    {
      if (v14 == v13)
      {
        v14 = v13;
      }
      else
      {
        v15 = 0;
        v16 = (_QWORD *)(v10 + 40);
        do
        {
          v17 = (_QWORD *)*v16;
          if (!*v16)
            goto LABEL_16;
          v18 = v16;
          do
          {
            v19 = v17[4];
            v20 = v19 >= v15;
            if (v19 >= v15)
              v21 = v17;
            else
              v21 = v17 + 1;
            if (v20)
              v18 = v17;
            v17 = (_QWORD *)*v21;
          }
          while (*v21);
          if (v18 == v16 || v15 < v18[4])
          {
LABEL_16:
            v23 = *(_QWORD *)(v10 + 56);
            v22 = *(_QWORD *)(v10 + 64);
            if (v22 == v23)
            {
              v25 = 1;
            }
            else
            {
              v24 = (v22 - v23) >> 3;
              if (v24 >= (uint64_t)(a3[1] - *a3) >> 3)
                std::vector<nlv4_inference_orchestrator::trees::TreeNode>::__throw_out_of_range[abi:ne180100]();
              v25 = *(double *)(*a3 + 8 * v24) > 0.5;
            }
            HighestExistingGroupId = nl_featurization::beam_search::getHighestExistingGroupId((unint64_t **)(v10 + 104));
            GroupIdForSequence = nl_featurization::beam_search::getGroupIdForSequence(a8, v10, HighestExistingGroupId, v27, v25, v15);
            v30 = v29;
            v96 = 0;
            v97 = 0;
            v98 = 0;
            std::vector<std::optional<unsigned long>>::__init_with_size[abi:ne180100]<std::optional<unsigned long>*,std::optional<unsigned long>*>(&v96, *(const void **)(v10 + 104), *(_QWORD *)(v10 + 112), (uint64_t)(*(_QWORD *)(v10 + 112) - *(_QWORD *)(v10 + 104)) >> 4);
            v31 = v11;
            v32 = v97;
            if ((unint64_t)v97 >= v98)
            {
              v34 = v96;
              v35 = ((char *)v97 - (char *)v96) >> 4;
              v36 = v35 + 1;
              if ((unint64_t)(v35 + 1) >> 60)
                std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
              v37 = v98 - (_QWORD)v96;
              if ((uint64_t)(v98 - (_QWORD)v96) >> 3 > v36)
                v36 = v37 >> 3;
              if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0)
                v38 = 0xFFFFFFFFFFFFFFFLL;
              else
                v38 = v36;
              if (v38)
                v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>(v38);
              else
                v39 = 0;
              v40 = (unint64_t *)(v38 + 16 * v35);
              *v40 = GroupIdForSequence;
              v40[1] = v30;
              v41 = v40;
              if (v32 != v34)
              {
                do
                {
                  v42 = *(v32 - 2);
                  v32 -= 2;
                  v43 = *((_BYTE *)v32 + 8);
                  *(v41 - 2) = v42;
                  v41 -= 2;
                  *((_BYTE *)v41 + 8) = v43;
                }
                while (v32 != v34);
                v32 = v96;
              }
              v33 = (uint64_t)(v40 + 2);
              v96 = v41;
              v98 = v38 + 16 * v39;
              if (v32)
                operator delete(v32);
            }
            else
            {
              *v97 = GroupIdForSequence;
              v32[1] = v30;
              v33 = (uint64_t)(v32 + 2);
            }
            v97 = (unint64_t *)v33;
            v11 = v31;
            v44 = log(*(long double *)(*v31 + 8 * v15));
            v45 = log(*(long double *)(*(_QWORD *)(*a4 + 24 * *(_QWORD *)(v10 + 16)) + 8 * v15));
            v46 = log(*(long double *)(*a5 + 8 * v15));
            if (v22 != v23)
              v46 = log(*(long double *)(*(_QWORD *)(*a6 + 24 * *(_QWORD *)(v10 + 24)) + 8 * v15));
            v47 = v46;
            v93 = 0;
            v94 = 0;
            v95 = 0;
            std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v93, *(const void **)(v10 + 80), *(_QWORD *)(v10 + 88), (uint64_t)(*(_QWORD *)(v10 + 88) - *(_QWORD *)(v10 + 80)) >> 3);
            v48 = v94;
            if ((unint64_t)v94 >= v95)
            {
              v50 = v93;
              v51 = v94 - v93;
              v52 = v51 + 1;
              if ((unint64_t)(v51 + 1) >> 61)
                std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
              v53 = v95 - (_QWORD)v93;
              if ((uint64_t)(v95 - (_QWORD)v93) >> 2 > v52)
                v52 = v53 >> 2;
              if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF8)
                v54 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v54 = v52;
              if (v54)
              {
                v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v95, v54);
                v50 = v93;
                v48 = v94;
              }
              else
              {
                v55 = 0;
              }
              v56 = (unint64_t *)&v55[8 * v51];
              *v56 = v15;
              v49 = v56 + 1;
              while (v48 != v50)
              {
                v57 = *--v48;
                *--v56 = v57;
              }
              v93 = v56;
              v94 = v49;
              v95 = (unint64_t)&v55[8 * v54];
              if (v50)
                operator delete(v50);
            }
            else
            {
              *v94 = v15;
              v49 = v48 + 1;
            }
            v94 = v49;
            std::set<unsigned long>::set[abi:ne180100]((uint64_t)v92, (_QWORD *)(v10 + 32));
            if (nl_featurization::beam_search::isSequenceUnique(v10, a7, v15))
              std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(v92, v15, v15);
            v82 = 0;
            v83 = 0;
            v81 = 0;
            std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v81, v93, (uint64_t)v94, v94 - v93);
            v78 = 0;
            v79 = 0;
            v80 = 0;
            std::vector<std::optional<unsigned long>>::__init_with_size[abi:ne180100]<std::optional<unsigned long>*,std::optional<unsigned long>*>(&v78, v96, v33, (v33 - (uint64_t)v96) >> 4);
            v58 = *(double *)(v10 + 8);
            std::set<unsigned long>::set[abi:ne180100]((uint64_t)v77, v92);
            nl_featurization::beam_search::BeamSequence::BeamSequence((uint64_t)v84, (uint64_t)&v81, (uint64_t)&v78, v77, v47 + v45 + v44 + v58);
            v60 = v72[1];
            v59 = v72[2];
            if (v60 >= v59)
            {
              v62 = (uint64_t)(v60 - *v72) >> 7;
              if ((unint64_t)(v62 + 1) >> 57)
                std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
              v63 = v59 - *v72;
              v64 = v63 >> 6;
              if (v63 >> 6 <= (unint64_t)(v62 + 1))
                v64 = v62 + 1;
              if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFF80)
                v65 = 0x1FFFFFFFFFFFFFFLL;
              else
                v65 = v64;
              v99[4] = v69;
              if (v65)
                v65 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<nl_featurization::beam_search::BeamSequence>>(v65);
              else
                v66 = 0;
              v67 = v65 + (v62 << 7);
              v99[0] = v65;
              v99[1] = v67;
              v99[3] = v65 + (v66 << 7);
              std::allocator<nl_featurization::beam_search::BeamSequence>::construct[abi:ne180100]<nl_featurization::beam_search::BeamSequence,nl_featurization::beam_search::BeamSequence>(v67, (uint64_t)v84);
              v99[2] = v67 + 128;
              std::vector<nl_featurization::beam_search::BeamSequence>::__swap_out_circular_buffer(v72, v99);
              v61 = v72[1];
              std::__split_buffer<nl_featurization::beam_search::BeamSequence>::~__split_buffer((uint64_t)v99);
            }
            else
            {
              std::allocator<nl_featurization::beam_search::BeamSequence>::construct[abi:ne180100]<nl_featurization::beam_search::BeamSequence,nl_featurization::beam_search::BeamSequence>(v72[1], (uint64_t)v84);
              v61 = v60 + 128;
              v72[1] = v60 + 128;
            }
            v72[1] = v61;
            if (__p)
            {
              v91 = __p;
              operator delete(__p);
            }
            v16 = (_QWORD *)(v10 + 40);
            if (v88)
            {
              v89 = v88;
              operator delete(v88);
            }
            if (v86)
            {
              v87 = v86;
              operator delete(v86);
            }
            std::__tree<unsigned long>::destroy(v85);
            std::__tree<unsigned long>::destroy((_QWORD *)v77[1]);
            if (v78)
            {
              v79 = v78;
              operator delete(v78);
            }
            if (v81)
            {
              v82 = v81;
              operator delete(v81);
            }
            std::__tree<unsigned long>::destroy((_QWORD *)v92[1]);
            if (v93)
            {
              v94 = v93;
              operator delete(v93);
            }
            if (v96)
              operator delete(v96);
            v13 = *v31;
            v12 = v31[1];
          }
          ++v15;
          v14 = v12;
        }
        while (v15 < (v12 - v13) >> 3);
      }
      v10 += 128;
    }
    while (v10 != v68);
  }
}

void sub_1C230073C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  uint64_t v32;
  void *v34;

  v34 = *(void **)(v32 - 224);
  if (v34)
  {
    *(_QWORD *)(v32 - 216) = v34;
    operator delete(v34);
  }
  if (*(_QWORD *)(v32 - 200))
    operator delete(*(void **)(v32 - 200));
  std::vector<nl_featurization::beam_search::BeamSequence>::__destroy_vector::operator()[abi:ne180100]((void ***)&a32);
  _Unwind_Resume(a1);
}

void sub_1C2300800()
{
  JUMPOUT(0x1C23007ECLL);
}

uint64_t std::set<unsigned long>::set[abi:ne180100](uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;
  unint64_t v11;
  uint64_t **v12;
  uint64_t **v13;
  uint64_t *v14;
  _QWORD *v15;
  _QWORD *v16;
  unint64_t v17;

  *(_QWORD *)(a1 + 8) = 0;
  v3 = (_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  v4 = a2 + 1;
  v5 = (_QWORD *)*a2;
  if ((_QWORD *)*a2 != a2 + 1)
  {
    do
    {
      v6 = *(uint64_t **)(a1 + 8);
      v7 = v3;
      if (*(_QWORD **)a1 == v3)
        goto LABEL_8;
      v8 = *(_QWORD **)(a1 + 8);
      v9 = v3;
      if (v6)
      {
        do
        {
          v7 = v8;
          v8 = (_QWORD *)v8[1];
        }
        while (v8);
      }
      else
      {
        do
        {
          v7 = (_QWORD *)v9[2];
          v10 = *v7 == (_QWORD)v9;
          v9 = v7;
        }
        while (v10);
      }
      v11 = v5[4];
      if (v7[4] < v11)
      {
LABEL_8:
        if (v6)
          v12 = (uint64_t **)v7;
        else
          v12 = (uint64_t **)v3;
        if (v6)
          v13 = (uint64_t **)(v7 + 1);
        else
          v13 = (uint64_t **)v3;
      }
      else
      {
        v12 = (uint64_t **)v3;
        v13 = (uint64_t **)v3;
        if (v6)
        {
          v13 = (uint64_t **)v3;
          while (1)
          {
            while (1)
            {
              v12 = (uint64_t **)v6;
              v17 = v6[4];
              if (v11 >= v17)
                break;
              v6 = *v12;
              v13 = v12;
              if (!*v12)
                goto LABEL_15;
            }
            if (v17 >= v11)
              break;
            v13 = v12 + 1;
            v6 = v12[1];
            if (!v6)
              goto LABEL_15;
          }
        }
      }
      if (!*v13)
      {
LABEL_15:
        v14 = (uint64_t *)operator new(0x28uLL);
        v14[4] = v5[4];
        std::__tree<boost::archive::detail::basic_iarchive_impl::cobject_type>::__insert_node_at((uint64_t **)a1, (uint64_t)v12, v13, v14);
      }
      v15 = (_QWORD *)v5[1];
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
          v16 = (_QWORD *)v5[2];
          v10 = *v16 == (_QWORD)v5;
          v5 = v16;
        }
        while (!v10);
      }
      v5 = v16;
    }
    while (v16 != v4);
  }
  return a1;
}

void sub_1C230096C(_Unwind_Exception *a1)
{
  _QWORD **v1;

  std::__tree<unsigned long>::destroy(*v1);
  _Unwind_Resume(a1);
}

uint64_t nl_featurization::beam_search::BeamSequence::BeamSequence(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, long double a5)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _QWORD *v17;
  const void *v18;
  int64_t v19;
  char *v20;
  std::runtime_error *exception;
  std::runtime_error *v23;

  *(long double *)a1 = exp(a5);
  *(long double *)(a1 + 8) = a5;
  v10 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)a2 == v10)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Beam sequence is empty getIntent");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  *(_QWORD *)(a1 + 16) = **(_QWORD **)a2;
  v11 = *a4;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(a1 + 32) = v11;
  v12 = a4 + 1;
  v13 = a4[1];
  *(_QWORD *)(a1 + 40) = v13;
  v14 = a1 + 40;
  v15 = a4[2];
  *(_QWORD *)(a1 + 48) = v15;
  if (v15)
  {
    *(_QWORD *)(v13 + 16) = v14;
    *a4 = (uint64_t)v12;
    *v12 = 0;
    a4[2] = 0;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = v14;
  }
  v17 = *(_QWORD **)a2;
  v16 = *(char **)(a2 + 8);
  if (*(char **)a2 == v16)
  {
    v23 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v23, "Beam sequence is empty getEntities");
    __cxa_throw(v23, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  v18 = v17 + 1;
  *(_QWORD *)(a1 + 72) = 0;
  v19 = v16 - (char *)(v17 + 1);
  if (v16 != (char *)(v17 + 1))
  {
    std::vector<double>::__vallocate[abi:ne180100]((_QWORD *)(a1 + 56), v19 >> 3);
    v20 = *(char **)(a1 + 64);
    memmove(v20, v18, v19);
    *(_QWORD *)(a1 + 64) = &v20[8 * (v19 >> 3)];
  }
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_OWORD *)(a1 + 104) = *(_OWORD *)a3;
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a3 + 16);
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  return a1;
}

void sub_1C2300B1C(_Unwind_Exception *a1)
{
  _QWORD **v1;

  std::__tree<unsigned long>::destroy(*v1);
  _Unwind_Resume(a1);
}

void nl_featurization::beam_search::BeamSequence::~BeamSequence(nl_featurization::beam_search::BeamSequence *this)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)*((_QWORD *)this + 13);
  if (v2)
  {
    *((_QWORD *)this + 14) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 10);
  if (v3)
  {
    *((_QWORD *)this + 11) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 7);
  if (v4)
  {
    *((_QWORD *)this + 8) = v4;
    operator delete(v4);
  }
  std::__tree<unsigned long>::destroy(*((_QWORD **)this + 5));
}

__n128 std::allocator<nl_featurization::beam_search::BeamSequence>::construct[abi:ne180100]<nl_featurization::beam_search::BeamSequence,nl_featurization::beam_search::BeamSequence>(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __n128 result;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v3 = (_QWORD *)(a2 + 40);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = a1 + 40;
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v6;
  if (v6)
  {
    *(_QWORD *)(v4 + 16) = v5;
    *(_QWORD *)(a2 + 32) = v3;
    *v3 = 0;
    *(_QWORD *)(a2 + 48) = 0;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = v5;
  }
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 88) = 0;
  *(_QWORD *)(a2 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  result = *(__n128 *)(a2 + 104);
  *(__n128 *)(a1 + 104) = result;
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a2 + 104) = 0;
  *(_QWORD *)(a2 + 112) = 0;
  *(_QWORD *)(a2 + 120) = 0;
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<nl_featurization::beam_search::BeamSequence>>(unint64_t a1)
{
  if (a1 >> 57)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(a1 << 7);
}

void std::vector<nl_featurization::beam_search::BeamSequence>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *a1;
  v4 = a1[1];
  v6 = a2[1];
  while (v4 != v5)
  {
    v6 -= 128;
    v4 -= 128;
    std::allocator<nl_featurization::beam_search::BeamSequence>::construct[abi:ne180100]<nl_featurization::beam_search::BeamSequence,nl_featurization::beam_search::BeamSequence>(v6, v4);
  }
  a2[1] = v6;
  v7 = *a1;
  *a1 = v6;
  a2[1] = v7;
  v8 = a1[1];
  a1[1] = a2[2];
  a2[2] = v8;
  v9 = a1[2];
  a1[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
}

uint64_t std::__split_buffer<nl_featurization::beam_search::BeamSequence>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 128;
    std::allocator<nl_featurization::beam_search::BeamSequence>::destroy[abi:ne180100](i - 128);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t nl_featurization::beam_search::validateInputTransitions(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  std::runtime_error *exception;

  v6 = *(_QWORD **)result;
  v5 = *(_QWORD **)(result + 8);
  if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v5 - *(_QWORD *)result) >> 3) != a4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "First dimension of intentEntityTransitions does not equal number of intents");
    goto LABEL_13;
  }
  while (v6 != v5)
  {
    if (a5 != (uint64_t)(v6[1] - *v6) >> 3)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Second dimension of intentEntityTransitions does not equal number of BIO tags");
      goto LABEL_13;
    }
    v6 += 3;
  }
  if (a5 != (uint64_t)(a2[1] - *a2) >> 3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Size of startEntityTransitions does not equal number of BIO tags");
    goto LABEL_13;
  }
  v8 = *(_QWORD **)a3;
  v7 = *(_QWORD **)(a3 + 8);
  if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - *(_QWORD *)a3) >> 3) != a5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "First dimension of entityTransitions does not equal number of BIO tags");
LABEL_13:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  while (v8 != v7)
  {
    if (a5 != (uint64_t)(v8[1] - *v8) >> 3)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Second dimension of entityTransitions does not equal number of BIO tags");
      goto LABEL_13;
    }
    v8 += 3;
  }
  return result;
}

void sub_1C2300EC0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t nl_featurization::beam_search::validateInputLabels(uint64_t result, uint64_t a2, unint64_t a3, unint64_t a4)
{
  _QWORD *i;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  BOOL v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  std::runtime_error *exception;

  for (i = *(_QWORD **)(result + 16); i; i = (_QWORD *)*i)
  {
    if (i[2] >= a3)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Out-of-range intent label (key) in uniqueLabels");
      goto LABEL_26;
    }
    v5 = (_QWORD *)i[3];
    if (v5 != i + 4)
    {
      do
      {
        if (v5[4] >= a4)
        {
          exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(exception, "Out-of-range BIO label (value) in uniqueLabels");
          goto LABEL_26;
        }
        v6 = (_QWORD *)v5[1];
        if (v6)
        {
          do
          {
            v7 = v6;
            v6 = (_QWORD *)*v6;
          }
          while (v6);
        }
        else
        {
          do
          {
            v7 = (_QWORD *)v5[2];
            v8 = *v7 == (_QWORD)v5;
            v5 = v7;
          }
          while (!v8);
        }
        v5 = v7;
      }
      while (v7 != i + 4);
    }
  }
  v9 = *(_QWORD **)(a2 + 16);
  if (v9)
  {
    while (v9[2] < a3)
    {
      v10 = (_QWORD *)v9[3];
      if (v10 != v9 + 4)
      {
        while (v10[4] < a4)
        {
          v11 = (_QWORD *)v10[1];
          if (v11)
          {
            do
            {
              v12 = v11;
              v11 = (_QWORD *)*v11;
            }
            while (v11);
          }
          else
          {
            do
            {
              v12 = (_QWORD *)v10[2];
              v8 = *v12 == (_QWORD)v10;
              v10 = v12;
            }
            while (!v8);
          }
          v10 = v12;
          if (v12 == v9 + 4)
            goto LABEL_22;
        }
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Out-of-range BIO label (value) in indexableLabels");
LABEL_26:
        __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
LABEL_22:
      v9 = (_QWORD *)*v9;
      if (!v9)
        return result;
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Out-of-range intent label (key) in indexableLabels");
    goto LABEL_26;
  }
  return result;
}

void sub_1C2301060(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t nl_featurization::beam_search::validateInputs(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  std::logic_error *exception;
  struct type_info *v10;
  void (*v11)(void *);
  std::logic_error *v12;
  uint64_t v13;
  std::logic_error *v14;
  std::string *v15;
  __int128 v16;
  std::string *v17;
  __int128 v18;
  std::string *v19;
  std::string::size_type size;
  std::string *v21;
  __int128 v22;
  std::string *v23;
  __int128 v24;
  std::string v25;
  std::string v26;
  std::string v27;
  std::string v28;
  std::string v29;
  std::string v30;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD **)(v1 + 8);
  if (v2 == v3)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, "Empty entitiesScores (implies no tokens)");
    v10 = (struct type_info *)off_1E7BE5148;
    v11 = (void (*)(void *))MEMORY[0x1E0DE4360];
    goto LABEL_14;
  }
  v5 = 0xAAAAAAAAAAAAAAABLL * (v3 - v2);
  if (v5 != (uint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 8) - **(_QWORD **)(a1 + 16)) >> 3)
  {
    v12 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    v13 = a1;
    v14 = v12;
    std::to_string(&v26, (uint64_t)(*(_QWORD *)(*(_QWORD *)(v13 + 16) + 8) - **(_QWORD **)(v13 + 16)) >> 3);
    v15 = std::string::insert(&v26, 0, "Size of groupScores (");
    v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    v27.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    v17 = std::string::append(&v27, ") does not equal number of tokens (");
    v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
    v28.__r_.__value_.__r.__words[2] = v17->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v18;
    v17->__r_.__value_.__l.__size_ = 0;
    v17->__r_.__value_.__r.__words[2] = 0;
    v17->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v25, v5);
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v19 = &v25;
    else
      v19 = (std::string *)v25.__r_.__value_.__r.__words[0];
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v25.__r_.__value_.__r.__words[2]);
    else
      size = v25.__r_.__value_.__l.__size_;
    v21 = std::string::append(&v28, (const std::string::value_type *)v19, size);
    v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
    v29.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v22;
    v21->__r_.__value_.__l.__size_ = 0;
    v21->__r_.__value_.__r.__words[2] = 0;
    v21->__r_.__value_.__r.__words[0] = 0;
    v23 = std::string::append(&v29, ")");
    v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
    v30.__r_.__value_.__r.__words[2] = v23->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v30.__r_.__value_.__l.__data_ = v24;
    v23->__r_.__value_.__l.__size_ = 0;
    v23->__r_.__value_.__r.__words[2] = 0;
    v23->__r_.__value_.__r.__words[0] = 0;
    std::logic_error::logic_error(v14, &v30);
    v14->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
    __cxa_throw(v14, (struct type_info *)off_1E7BE5148, MEMORY[0x1E0DE4360]);
  }
  v6 = (uint64_t)(*(_QWORD *)(*(_QWORD *)a1 + 8) - **(_QWORD **)a1) >> 3;
  v7 = (uint64_t)(v2[1] - *v2) >> 3;
  nl_featurization::beam_search::validateInputTransitions(*(_QWORD *)(a1 + 24), *(_QWORD **)(a1 + 32), *(_QWORD *)(a1 + 40), v6, v7);
  result = nl_featurization::beam_search::validateInputLabels(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v6, v7);
  if ((unint64_t)(*(_QWORD *)(a1 + 64) - 6) <= 0xFFFFFFFFFFFFFFFALL)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error((std::runtime_error *)exception, "Invalid beamSize. Should be in the interval (0, 5]");
    v10 = (struct type_info *)MEMORY[0x1E0DE4E80];
    v11 = (void (*)(void *))MEMORY[0x1E0DE4338];
LABEL_14:
    __cxa_throw(exception, v10, v11);
  }
  return result;
}

void sub_1C23012BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  void *v33;
  int v34;
  uint64_t v35;

  if (*(char *)(v35 - 41) < 0)
    operator delete(*(void **)(v35 - 64));
  if (*(char *)(v35 - 73) < 0)
    operator delete(*(void **)(v35 - 96));
  if (a14 < 0)
    operator delete(__p);
  if (a33 < 0)
    operator delete(a28);
  if (a26 < 0)
    operator delete(a21);
  if (a20 < 0)
  {
    operator delete(a15);
    if ((v34 & 1) == 0)
LABEL_16:
      _Unwind_Resume(a1);
  }
  else if (!v34)
  {
    goto LABEL_16;
  }
  __cxa_free_exception(v33);
  goto LABEL_16;
}

uint64_t nl_featurization::beam_search::BeamSequence::toString(nl_featurization::beam_search::BeamSequence *this)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t i;
  _QWORD *v6;
  uint64_t v7;
  uint64_t j;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v12[2];
  _QWORD v13[11];
  char v14;
  uint64_t v15;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"BeamSequence[\n", 14);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"  score = ", 10);
  v2 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"  intent = ", 11);
  v3 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"  entities = ", 13);
  v4 = *((_QWORD *)this + 7);
  for (i = *((_QWORD *)this + 8); v4 != i; v4 += 8)
  {
    v6 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)",", 1);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"  groupIds = ", 13);
  v7 = *((_QWORD *)this + 13);
  for (j = *((_QWORD *)this + 14); v7 != j; v7 += 16)
  {
    if (*(_BYTE *)(v7 + 8))
      v9 = (_QWORD *)std::ostream::operator<<();
    else
      v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"(none)", 6);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)",", 1);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"]\n", 2);
  std::stringbuf::str();
  v12[0] = *MEMORY[0x1E0DE4F50];
  v10 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
  v13[0] = v10;
  v13[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v14 < 0)
    operator delete((void *)v13[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x1C3BB9A90](&v15);
}

void sub_1C23015B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void nl_featurization::beam_search::beamSearch(uint64_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X3>, _QWORD *a5@<X4>, _QWORD *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  long double *v16;
  uint64_t v17;
  long double *v18;
  unint64_t v19;
  long double *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  long double *v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  long double *v34;
  uint64_t v35;
  _QWORD *v36;
  long double v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  void **v46;
  _QWORD *v47;
  _QWORD *v48;
  unint64_t v49;
  uint64_t v50;
  __int128 *v51;
  __int128 *v52;
  __int128 *v53;
  int64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  __int128 *v66;
  uint64_t v67;
  uint64_t i;
  uint64_t v69;
  uint64_t v76;
  _QWORD **v77;
  _QWORD *v78[2];
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  _QWORD *v84;
  char *v85;
  char *v86;
  __int128 *v87;
  __int128 *v88;
  uint64_t v89;
  _QWORD *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *__p;
  void *v96;
  _QWORD v97[10];
  void **v98[6];

  v97[0] = a1;
  v97[1] = a2;
  v97[2] = a3;
  v97[3] = a4;
  v97[4] = a5;
  v97[5] = a6;
  v97[6] = a7;
  v97[7] = a8;
  v97[8] = a10;
  nl_featurization::beam_search::validateInputs((uint64_t)v97);
  v13 = *a1;
  v14 = a1[1];
  v15 = v14 - *a1;
  if (v14 == *a1)
  {
    v16 = 0;
    v18 = 0;
  }
  else
  {
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF9)
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    v16 = (long double *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>(v15 >> 3);
    v18 = &v16[2 * v17];
    v13 = *a1;
    v14 = a1[1];
  }
  v69 = a2;
  if (v14 == v13)
  {
    v20 = v16;
  }
  else
  {
    v19 = 0;
    v20 = v16;
    do
    {
      v21 = *(_QWORD *)(v13 + 8 * v19);
      if (v20 >= v18)
      {
        v22 = ((char *)v20 - (char *)v16) >> 4;
        v23 = v22 + 1;
        if ((unint64_t)(v22 + 1) >> 60)
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        if (v18 - v16 > v23)
          v23 = v18 - v16;
        if ((unint64_t)((char *)v18 - (char *)v16) >= 0x7FFFFFFFFFFFFFF0)
          v24 = 0xFFFFFFFFFFFFFFFLL;
        else
          v24 = v23;
        if (v24)
          v24 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>(v24);
        else
          v25 = 0;
        v26 = (unint64_t *)(v24 + 16 * v22);
        *v26 = v19;
        v26[1] = v21;
        if (v20 == v16)
        {
          v28 = (long double *)(v24 + 16 * v22);
        }
        else
        {
          v27 = v24 + 16 * v22;
          do
          {
            v28 = (long double *)(v27 - 16);
            *(_OWORD *)(v27 - 16) = *((_OWORD *)v20 - 1);
            v20 -= 2;
            v27 -= 16;
          }
          while (v20 != v16);
        }
        v18 = (long double *)(v24 + 16 * v25);
        v20 = (long double *)(v26 + 2);
        if (v16)
          operator delete(v16);
        v16 = v28;
      }
      else
      {
        *(_QWORD *)v20 = v19;
        *((_QWORD *)v20 + 1) = v21;
        v20 += 2;
      }
      ++v19;
      v13 = *a1;
    }
    while (v19 < (a1[1] - *a1) >> 3);
  }
  v29 = 126 - 2 * __clz(((char *)v20 - (char *)v16) >> 4);
  if (v20 == v16)
    v30 = 0;
  else
    v30 = v29;
  std::__introsort<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *,false>(v16, v20, v30, 1);
  *(_QWORD *)a9 = 0;
  *(_QWORD *)(a9 + 8) = 0;
  *(_QWORD *)(a9 + 16) = 0;
  v76 = a9 + 16;
  v31 = a10;
  if (a10)
  {
    if (a10 >> 57)
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    v89 = a9 + 16;
    v85 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nl_featurization::beam_search::BeamSequence>>(a10);
    v86 = v85;
    v87 = (__int128 *)v85;
    v88 = (__int128 *)&v85[128 * v32];
    std::vector<nl_featurization::beam_search::BeamSequence>::__swap_out_circular_buffer((uint64_t *)a9, &v85);
    std::__split_buffer<nl_featurization::beam_search::BeamSequence>::~__split_buffer((uint64_t)&v85);
  }
  if ((a1[1] - *a1) >> 3 >= a10)
    v33 = a10;
  else
    v33 = (a1[1] - *a1) >> 3;
  if (v33)
  {
    v34 = v16 + 1;
    do
    {
      v35 = *((_QWORD *)v34 - 1);
      v36 = operator new(8uLL);
      v81 = 0;
      v82 = v36;
      *v36 = v35;
      v83 = v36 + 1;
      v84 = v36 + 1;
      v79 = 0;
      v80 = 0;
      v37 = log(*v34);
      v78[0] = 0;
      v78[1] = 0;
      v77 = v78;
      nl_featurization::beam_search::BeamSequence::BeamSequence((uint64_t)&v85, (uint64_t)&v82, (uint64_t)&v79, (uint64_t *)&v77, v37);
      v39 = *(_QWORD *)(a9 + 8);
      v38 = *(_QWORD *)(a9 + 16);
      if (v39 >= v38)
      {
        v41 = (uint64_t)(v39 - *(_QWORD *)a9) >> 7;
        if ((unint64_t)(v41 + 1) >> 57)
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        v42 = v38 - *(_QWORD *)a9;
        v43 = v42 >> 6;
        if (v42 >> 6 <= (unint64_t)(v41 + 1))
          v43 = v41 + 1;
        if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFF80)
          v44 = 0x1FFFFFFFFFFFFFFLL;
        else
          v44 = v43;
        v98[4] = (void **)(a9 + 16);
        if (v44)
          v44 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<nl_featurization::beam_search::BeamSequence>>(v44);
        else
          v45 = 0;
        v46 = (void **)(v44 + (v41 << 7));
        v98[0] = (void **)v44;
        v98[1] = v46;
        v98[3] = (void **)(v44 + (v45 << 7));
        std::allocator<nl_featurization::beam_search::BeamSequence>::construct[abi:ne180100]<nl_featurization::beam_search::BeamSequence,nl_featurization::beam_search::BeamSequence>((uint64_t)v46, (uint64_t)&v85);
        v98[2] = v46 + 16;
        std::vector<nl_featurization::beam_search::BeamSequence>::__swap_out_circular_buffer((uint64_t *)a9, v98);
        v40 = *(_QWORD *)(a9 + 8);
        std::__split_buffer<nl_featurization::beam_search::BeamSequence>::~__split_buffer((uint64_t)v98);
      }
      else
      {
        std::allocator<nl_featurization::beam_search::BeamSequence>::construct[abi:ne180100]<nl_featurization::beam_search::BeamSequence,nl_featurization::beam_search::BeamSequence>(*(_QWORD *)(a9 + 8), (uint64_t)&v85);
        v40 = v39 + 128;
        *(_QWORD *)(a9 + 8) = v40;
      }
      *(_QWORD *)(a9 + 8) = v40;
      if (__p)
      {
        v96 = __p;
        operator delete(__p);
      }
      if (v93)
      {
        v94 = v93;
        operator delete(v93);
      }
      if (v91)
      {
        v92 = v91;
        operator delete(v91);
      }
      std::__tree<unsigned long>::destroy(v90);
      std::__tree<unsigned long>::destroy(v78[0]);
      if (v79)
      {
        v80 = v79;
        operator delete(v79);
      }
      if (v82)
      {
        v83 = v82;
        operator delete(v82);
      }
      v34 += 2;
      --v33;
    }
    while (v33);
  }
  v47 = *(_QWORD **)v69;
  v48 = *(_QWORD **)(v69 + 8);
  if (*(_QWORD **)v69 != v48)
  {
    do
    {
      nl_featurization::beam_search::getCandidatesFromEntityScores((uint64_t *)a9, v47, a3, a4, a5, a6, a7, a8, (uint64_t *)&v85);
      v49 = 126 - 2 * __clz((v86 - v85) >> 7);
      if (v86 == v85)
        v50 = 0;
      else
        v50 = v49;
      std::__introsort<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_1 &,nl_featurization::beam_search::BeamSequence *,false>((__int128 *)v85, (__int128 *)v86, v50, 1);
      v51 = (__int128 *)v86;
      if (v31 < (v86 - v85) >> 7)
      {
        v52 = (__int128 *)&v85[128 * v31];
        if (v52 >= (__int128 *)v86)
          __assert_rtn("beamSearch", "beam_search.cpp", 387, "allCandidates.begin() + beamSize < allCandidates.end()");
        while (v51 != v52)
        {
          v51 -= 8;
          std::allocator<nl_featurization::beam_search::BeamSequence>::destroy[abi:ne180100]((uint64_t)v51);
        }
        v86 = (char *)v52;
        v51 = v52;
      }
      if (&v85 == (char **)a9)
        goto LABEL_92;
      v53 = (__int128 *)v85;
      v54 = (char *)v51 - v85;
      v55 = ((char *)v51 - v85) >> 7;
      v56 = *(_QWORD *)(a9 + 16);
      v57 = *(_QWORD *)a9;
      if (v55 <= (v56 - *(_QWORD *)a9) >> 7)
      {
        v65 = (*(_QWORD *)(a9 + 8) - v57) >> 7;
        if (v65 >= v55)
        {
          v31 = a10;
          v67 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nl_featurization::beam_search::BeamSequence *,nl_featurization::beam_search::BeamSequence *,nl_featurization::beam_search::BeamSequence *>((uint64_t)v85, (uint64_t)v51, *(_QWORD *)a9);
          for (i = *(_QWORD *)(a9 + 8);
                i != v67;
                std::allocator<nl_featurization::beam_search::BeamSequence>::destroy[abi:ne180100](i))
          {
            i -= 128;
          }
          goto LABEL_91;
        }
        v66 = (__int128 *)&v85[128 * v65];
        std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nl_featurization::beam_search::BeamSequence *,nl_featurization::beam_search::BeamSequence *,nl_featurization::beam_search::BeamSequence *>((uint64_t)v85, (uint64_t)v66, *(_QWORD *)a9);
        v31 = a10;
        v64 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nl_featurization::beam_search::BeamSequence>,nl_featurization::beam_search::BeamSequence*,nl_featurization::beam_search::BeamSequence*,nl_featurization::beam_search::BeamSequence*>(v76, (uint64_t)v66, (uint64_t)v51, *(_QWORD *)(a9 + 8));
      }
      else
      {
        if (v57)
        {
          v58 = *(_QWORD *)(a9 + 8);
          v59 = *(void **)a9;
          if (v58 != v57)
          {
            do
            {
              v58 -= 128;
              std::allocator<nl_featurization::beam_search::BeamSequence>::destroy[abi:ne180100](v58);
            }
            while (v58 != v57);
            v59 = *(void **)a9;
          }
          *(_QWORD *)(a9 + 8) = v57;
          operator delete(v59);
          v56 = 0;
          *(_QWORD *)a9 = 0;
          *(_QWORD *)(a9 + 8) = 0;
          *(_QWORD *)(a9 + 16) = 0;
        }
        if (v54 < 0)
          goto LABEL_101;
        v60 = v56 >> 6;
        if (v56 >> 6 <= v55)
          v60 = v55;
        v61 = (unint64_t)v56 >= 0x7FFFFFFFFFFFFF80 ? 0x1FFFFFFFFFFFFFFLL : v60;
        if (v61 >> 57)
LABEL_101:
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nl_featurization::beam_search::BeamSequence>>(v61);
        v31 = a10;
        *(_QWORD *)a9 = v62;
        *(_QWORD *)(a9 + 8) = v62;
        *(_QWORD *)(a9 + 16) = &v62[128 * v63];
        v64 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nl_featurization::beam_search::BeamSequence>,nl_featurization::beam_search::BeamSequence*,nl_featurization::beam_search::BeamSequence*,nl_featurization::beam_search::BeamSequence*>(v76, (uint64_t)v53, (uint64_t)v51, (uint64_t)v62);
      }
      v67 = v64;
LABEL_91:
      *(_QWORD *)(a9 + 8) = v67;
LABEL_92:
      v98[0] = (void **)&v85;
      std::vector<nl_featurization::beam_search::BeamSequence>::__destroy_vector::operator()[abi:ne180100](v98);
      v47 += 3;
    }
    while (v47 != v48);
  }
  if (v16)
    operator delete(v16);
}

void sub_1C2301CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;
  void *v28;
  uint64_t v29;

  *(_QWORD *)(v29 - 136) = v27;
  std::vector<nl_featurization::beam_search::BeamSequence>::__destroy_vector::operator()[abi:ne180100]((void ***)(v29 - 136));
  if (v28)
    operator delete(v28);
  _Unwind_Resume(a1);
}

double *std::__introsort<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *,false>(double *result, double *a2, uint64_t a3, char a4)
{
  double *v7;
  double *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double *v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double *v17;
  double *v18;
  double *v19;
  double *v20;
  double v21;
  double *v22;
  double v23;
  double *v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  BOOL v29;
  double *v30;
  double v31;
  double *v32;
  double v33;
  double *v34;
  double *v35;
  double v36;
  double v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  uint64_t v52;
  double v53;
  double v54;
  double *v55;
  BOOL v57;
  uint64_t v58;
  double *v59;
  double *v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  double *v64;
  uint64_t v65;
  int64_t v66;
  int64_t v67;
  int64_t v68;
  uint64_t v69;
  double *v70;
  double v71;
  double v72;
  double *v73;
  uint64_t v74;
  double *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  double v80;
  uint64_t v81;
  double *v82;
  double *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  double v88;
  double v89;
  uint64_t v90;
  unint64_t v91;
  double *v92;
  double *v94;
  double *v95;
  double v96;
  uint64_t v97;
  double *v98;
  double v99;

  v7 = result;
LABEL_2:
  v8 = v7;
  while (2)
  {
    v7 = v8;
    v9 = (char *)a2 - (char *)v8;
    v10 = ((char *)a2 - (char *)v8) >> 4;
    switch(v10)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v41 = *(a2 - 1);
        v42 = v8[1];
        if (v41 > v42)
        {
          v43 = *v8;
          *v8 = *(a2 - 2);
          *(a2 - 2) = v43;
          v8[1] = v41;
          *(a2 - 1) = v42;
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(v8, v8 + 2, a2 - 2);
      case 4uLL:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(v8, v8 + 2, v8 + 4, a2 - 2);
      case 5uLL:
        result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(v8, v8 + 2, v8 + 4, v8 + 6);
        v44 = *(a2 - 1);
        v45 = v8[7];
        if (v44 > v45)
        {
          v46 = *((_QWORD *)v8 + 6);
          v8[6] = *(a2 - 2);
          *((_QWORD *)a2 - 2) = v46;
          v8[7] = v44;
          *(a2 - 1) = v45;
          v47 = v8[7];
          v48 = v8[5];
          if (v47 > v48)
          {
            v49 = *((_QWORD *)v8 + 4);
            v50 = *((_QWORD *)v8 + 6);
            *((_QWORD *)v8 + 4) = v50;
            *((_QWORD *)v8 + 6) = v49;
            v8[5] = v47;
            v8[7] = v48;
            v51 = v8[3];
            if (v47 > v51)
            {
              v52 = *((_QWORD *)v8 + 2);
              *((_QWORD *)v8 + 2) = v50;
              *((_QWORD *)v8 + 4) = v52;
              v8[3] = v47;
              v8[5] = v51;
              v53 = v8[1];
              if (v47 > v53)
              {
                v54 = *v8;
                *(_QWORD *)v8 = v50;
                v8[2] = v54;
                v8[1] = v47;
                v8[3] = v53;
              }
            }
          }
        }
        return result;
      default:
        if (v9 <= 383)
        {
          v55 = v8 + 2;
          v57 = v8 == a2 || v55 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v57)
            {
              v58 = 0;
              v59 = v8;
              do
              {
                v60 = v55;
                v61 = v59[3];
                if (v61 > v59[1])
                {
                  v62 = *((_QWORD *)v59 + 2);
                  v63 = v58;
                  while (1)
                  {
                    v64 = (double *)((char *)v8 + v63);
                    v64[2] = *(double *)((char *)v8 + v63);
                    v64[3] = *(double *)((char *)v8 + v63 + 8);
                    if (!v63)
                      break;
                    v63 -= 16;
                    if (v61 <= *(v64 - 1))
                    {
                      v65 = (uint64_t)v8 + v63 + 16;
                      goto LABEL_79;
                    }
                  }
                  v65 = (uint64_t)v8;
LABEL_79:
                  *(_QWORD *)v65 = v62;
                  *(double *)(v65 + 8) = v61;
                }
                v55 = v60 + 2;
                v58 += 16;
                v59 = v60;
              }
              while (v60 + 2 != a2);
            }
          }
          else if (!v57)
          {
            v94 = v8 + 1;
            do
            {
              v95 = v55;
              v96 = v7[3];
              if (v96 > v7[1])
              {
                v97 = *((_QWORD *)v7 + 2);
                v98 = v94;
                do
                {
                  v98[1] = *(v98 - 1);
                  v98[2] = *v98;
                  v99 = *(v98 - 2);
                  v98 -= 2;
                }
                while (v96 > v99);
                *((_QWORD *)v98 + 1) = v97;
                v98[2] = v96;
              }
              v55 = v95 + 2;
              v94 += 2;
              v7 = v95;
            }
            while (v95 + 2 != a2);
          }
          return result;
        }
        if (!a3)
        {
          if (v8 != a2)
          {
            v66 = (v10 - 2) >> 1;
            v67 = v66;
            do
            {
              v68 = v67;
              if (v66 >= v67)
              {
                v69 = (2 * v67) | 1;
                v70 = &v8[2 * v69];
                if (2 * v68 + 2 < (uint64_t)v10 && v70[1] > v70[3])
                {
                  v70 += 2;
                  v69 = 2 * v68 + 2;
                }
                v71 = v70[1];
                v72 = v8[2 * v68 + 1];
                if (v71 <= v72)
                {
                  v73 = &v8[2 * v68];
                  v74 = *(_QWORD *)v73;
                  do
                  {
                    v75 = v73;
                    v73 = v70;
                    *v75 = *v70;
                    v75[1] = v71;
                    if (v66 < v69)
                      break;
                    v76 = 2 * v69;
                    v69 = (2 * v69) | 1;
                    v70 = &v8[2 * v69];
                    v77 = v76 + 2;
                    if (v77 < (uint64_t)v10 && v70[1] > v70[3])
                    {
                      v70 += 2;
                      v69 = v77;
                    }
                    v71 = v70[1];
                  }
                  while (v71 <= v72);
                  *(_QWORD *)v73 = v74;
                  v73[1] = v72;
                }
              }
              v67 = v68 - 1;
            }
            while (v68);
            v78 = (unint64_t)v9 >> 4;
            do
            {
              v79 = 0;
              v80 = *v8;
              v81 = *((_QWORD *)v8 + 1);
              v82 = v8;
              do
              {
                v83 = v82;
                v82 += 2 * v79 + 2;
                v84 = 2 * v79;
                v79 = (2 * v79) | 1;
                v85 = v84 + 2;
                if (v85 < v78 && v82[1] > v82[3])
                {
                  v82 += 2;
                  v79 = v85;
                }
                *v83 = *v82;
                v83[1] = v82[1];
              }
              while (v79 <= (uint64_t)((unint64_t)(v78 - 2) >> 1));
              if (v82 == a2 - 2)
              {
                *v82 = v80;
                *((_QWORD *)v82 + 1) = v81;
              }
              else
              {
                *v82 = *(a2 - 2);
                v82[1] = *(a2 - 1);
                *(a2 - 2) = v80;
                *((_QWORD *)a2 - 1) = v81;
                v86 = (char *)v82 - (char *)v8 + 16;
                if (v86 >= 17)
                {
                  v87 = (((unint64_t)v86 >> 4) - 2) >> 1;
                  v88 = v8[2 * v87 + 1];
                  v89 = v82[1];
                  if (v88 > v89)
                  {
                    v90 = *(_QWORD *)v82;
                    do
                    {
                      v91 = v87;
                      v92 = v82;
                      v82 = &v8[2 * v91];
                      *v92 = *v82;
                      v92[1] = v88;
                      if (!v91)
                        break;
                      v87 = (v91 - 1) >> 1;
                      v88 = v8[2 * v87 + 1];
                    }
                    while (v88 > v89);
                    *(_QWORD *)v82 = v90;
                    v8[2 * v91 + 1] = v89;
                  }
                }
              }
              a2 -= 2;
            }
            while (v78-- > 2);
          }
          return result;
        }
        v11 = v10 >> 1;
        v12 = &v8[2 * (v10 >> 1)];
        if ((unint64_t)v9 < 0x801)
        {
          result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(&v7[2 * (v10 >> 1)], v7, a2 - 2);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(v7, &v7[2 * (v10 >> 1)], a2 - 2);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(v7 + 2, v12 - 2, a2 - 4);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(v7 + 4, &v7[2 * v11 + 2], a2 - 6);
          result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(v12 - 2, v12, &v7[2 * v11 + 2]);
          v13 = *v7;
          *v7 = *v12;
          *v12 = v13;
          v14 = *((_QWORD *)v7 + 1);
          v7[1] = v12[1];
          *((_QWORD *)v12 + 1) = v14;
        }
        --a3;
        v15 = *v7;
        if ((a4 & 1) == 0)
        {
          v16 = v7[1];
          if (*(v7 - 1) > v16)
            goto LABEL_12;
          if (v16 <= *(a2 - 1))
          {
            v32 = v7 + 2;
            do
            {
              v8 = v32;
              if (v32 >= a2)
                break;
              v33 = v32[1];
              v32 += 2;
            }
            while (v16 <= v33);
          }
          else
          {
            v30 = v7;
            do
            {
              v8 = v30 + 2;
              v31 = v30[3];
              v30 += 2;
            }
            while (v16 <= v31);
          }
          v34 = a2;
          if (v8 < a2)
          {
            v35 = a2;
            do
            {
              v34 = v35 - 2;
              v36 = *(v35 - 1);
              v35 -= 2;
            }
            while (v16 > v36);
          }
          while (v8 < v34)
          {
            v37 = *v8;
            *v8 = *v34;
            *v34 = v37;
            v38 = *((_QWORD *)v8 + 1);
            v8[1] = v34[1];
            *((_QWORD *)v34 + 1) = v38;
            do
            {
              v39 = v8[3];
              v8 += 2;
            }
            while (v16 <= v39);
            do
            {
              v40 = *(v34 - 1);
              v34 -= 2;
            }
            while (v16 > v40);
          }
          if (v8 - 2 != v7)
          {
            *v7 = *(v8 - 2);
            v7[1] = *(v8 - 1);
          }
          a4 = 0;
          *(v8 - 2) = v15;
          *(v8 - 1) = v16;
          continue;
        }
        v16 = v7[1];
LABEL_12:
        v17 = v7;
        do
        {
          v18 = v17;
          v17 += 2;
        }
        while (v18[3] > v16);
        v19 = a2;
        if (v18 == v7)
        {
          v22 = a2;
          while (v17 < v22)
          {
            v20 = v22 - 2;
            v23 = *(v22 - 1);
            v22 -= 2;
            if (v23 > v16)
              goto LABEL_22;
          }
          v20 = v22;
        }
        else
        {
          do
          {
            v20 = v19 - 2;
            v21 = *(v19 - 1);
            v19 -= 2;
          }
          while (v21 <= v16);
        }
LABEL_22:
        v8 = v17;
        if (v17 < v20)
        {
          v24 = v20;
          do
          {
            v25 = *v8;
            *v8 = *v24;
            *v24 = v25;
            v26 = *((_QWORD *)v8 + 1);
            v8[1] = v24[1];
            *((_QWORD *)v24 + 1) = v26;
            do
            {
              v27 = v8[3];
              v8 += 2;
            }
            while (v27 > v16);
            do
            {
              v28 = *(v24 - 1);
              v24 -= 2;
            }
            while (v28 <= v16);
          }
          while (v8 < v24);
        }
        if (v8 - 2 != v7)
        {
          *v7 = *(v8 - 2);
          v7[1] = *(v8 - 1);
        }
        *(v8 - 2) = v15;
        *(v8 - 1) = v16;
        if (v17 < v20)
        {
LABEL_33:
          result = (double *)std::__introsort<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *,false>(v7, v8 - 2, a3, a4 & 1);
          a4 = 0;
          continue;
        }
        v29 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(v7, v8 - 2);
        result = (double *)std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(v8, a2);
        if (!(_DWORD)result)
        {
          if (v29)
            continue;
          goto LABEL_33;
        }
        a2 = v8 - 2;
        if (!v29)
          goto LABEL_2;
        return result;
    }
  }
}

void std::__introsort<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_1 &,nl_featurization::beam_search::BeamSequence *,false>(__int128 *a1, __int128 *a2, uint64_t a3, char a4)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __int128 *v11;
  uint64_t v12;
  __int128 v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  unint64_t v17;
  _QWORD *v18;
  __int128 v19;
  __int128 *v20;
  double v21;
  __int128 *v22;
  double v23;
  double v24;
  __int128 *v25;
  double v26;
  double v27;
  __int128 *v28;
  __int128 v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  _QWORD *v33;
  void *v34;
  _QWORD *v35;
  __int128 v36;
  unint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  __int128 v44;
  _QWORD *v45;
  _QWORD *v46;
  double v47;
  unint64_t v48;
  __int128 *v49;
  double v50;
  double v51;
  double v52;
  __int128 *v53;
  __int128 v54;
  void *v55;
  _QWORD *v56;
  void *v57;
  _QWORD *v58;
  void *v59;
  _QWORD *v60;
  __int128 v61;
  unint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  __int128 *v68;
  __int128 *v69;
  __int128 *v70;
  __int128 *v71;
  __int128 *v72;
  __int128 *v73;
  uint64_t v74;
  __int128 *v75;
  __int128 *v76;
  __int128 v77;
  _QWORD *v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  __int128 v85;
  void *v86;
  void *v87;
  _QWORD *v88;
  char *v89;
  void *v90;
  char *v91;
  double v92;
  uint64_t *v93;
  char *v94;
  _OWORD *v95;
  char *v96;
  __int128 v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  int64_t v104;
  _QWORD *v105;
  int64_t v106;
  uint64_t v107;
  __int128 *v108;
  __int128 *v109;
  __int128 v110;
  _QWORD *v111;
  _QWORD *v112;
  _QWORD *v113;
  _QWORD *v114;
  _QWORD *v115;
  _QWORD *v116;
  __int128 *v117;
  __int128 v118;
  _QWORD *v119;
  void *v120;
  void **v121;
  void *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  __int128 v126;
  uint64_t v127;
  _QWORD *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  __int128 *v134;
  uint64_t v135;
  _QWORD *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  __int128 v141;
  uint64_t *v142;
  void *v143;
  void **v144;
  void *v145;
  _QWORD *v146;
  void *v147;
  _QWORD *v148;
  __int128 *v149;
  __int128 v150;
  void *v151;
  void **v152;
  void *v153;
  __int128 *v154;
  void *v155;
  _QWORD *v156;
  uint64_t v157;
  _QWORD *v158;
  uint64_t v159;
  uint64_t v160;
  _QWORD *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  unint64_t v167;
  __int128 *v168;
  __int128 v169;
  _QWORD *v170;
  _QWORD *v171;
  void *v172;
  void *v173;
  void *v174;
  uint64_t v175;
  __int128 v176;
  uint64_t *v177;
  void *v178;
  void **v179;
  void *v180;
  void *v181;
  __int128 v182;
  uint64_t v183;
  _QWORD *v184;
  uint64_t v185;
  void *v186;
  void *v187;
  void *v188;
  __int128 *v190;
  unint64_t v191;
  __int128 *v192;
  __int128 v193;
  _QWORD *v194;
  _QWORD *v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  void *v199;
  _QWORD *v200;
  void *v201;
  void *v202;
  unint64_t v203;
  double v204;
  __int128 *v205;
  __int128 v206;
  unint64_t v207;
  _QWORD *v208;
  uint64_t v209;
  _QWORD *v210;
  void *v211;
  _QWORD *v212;
  void *v213;
  void *v214;
  __int128 *v215;
  _QWORD *v216;
  __int128 *v217;
  _QWORD *v218;
  _QWORD *v220;
  __int128 *v221;
  _QWORD *v222;
  __int128 *v223;
  int64_t v224;
  __int128 *v225;
  __int128 v227;
  __int128 v228;
  _QWORD **v229;
  _QWORD *v230;
  uint64_t v231;
  void *v232[2];
  uint64_t v233;
  void *v234[2];
  uint64_t v235;
  void *__p[2];
  uint64_t v237;
  __int128 v238;
  __int128 v239;
  _QWORD **v240;
  _QWORD *v241;
  uint64_t v242;
  __int128 v243;
  uint64_t v244;
  __int128 v245;
  uint64_t v246;
  __int128 v247;
  uint64_t v248;

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nl_featurization::beam_search::BeamSequence *,nl_featurization::beam_search::BeamSequence *,nl_featurization::beam_search::BeamSequence *>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  char *v10;
  _QWORD *v11;
  char *v12;
  char *v13;
  _BYTE *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void **v20;
  uint64_t v21;
  _BYTE *v22;
  unint64_t v23;
  char *v24;
  uint64_t v28;
  uint64_t v29;

  v3 = a3;
  if (a1 != a2)
  {
    v4 = a2;
    v5 = 0;
    v28 = a1;
    v29 = a1 + 40;
    v6 = a3;
    do
    {
      v7 = a1 + v5;
      v8 = v3 + v5;
      v9 = *(_OWORD *)(a1 + v5 + 16);
      *(_OWORD *)v8 = *(_OWORD *)(a1 + v5);
      *(_OWORD *)(v8 + 16) = v9;
      if (a1 != v3)
      {
        std::__tree<unsigned long>::__assign_multi<std::__tree_const_iterator<unsigned long,std::__tree_node<unsigned long,void *> *,long>>(v8 + 32, *(_QWORD **)(v7 + 32), (_QWORD *)(v29 + v5));
        std::vector<sentencepiece::unigram::Lattice::Node *>::__assign_with_size[abi:ne180100]<sentencepiece::unigram::Lattice::Node **,sentencepiece::unigram::Lattice::Node **>((char *)(v8 + 56), *(char **)(v7 + 56), *(_QWORD *)(v7 + 64), (uint64_t)(*(_QWORD *)(v7 + 64) - *(_QWORD *)(v7 + 56)) >> 3);
        std::vector<sentencepiece::unigram::Lattice::Node *>::__assign_with_size[abi:ne180100]<sentencepiece::unigram::Lattice::Node **,sentencepiece::unigram::Lattice::Node **>((char *)(v8 + 80), *(char **)(v7 + 80), *(_QWORD *)(v7 + 88), (uint64_t)(*(_QWORD *)(v7 + 88) - *(_QWORD *)(v7 + 80)) >> 3);
        v12 = *(char **)(v8 + 104);
        v11 = (_QWORD *)(v8 + 104);
        v10 = v12;
        v13 = *(char **)(v7 + 104);
        v14 = *(_BYTE **)(v7 + 112);
        v15 = v14 - v13;
        v16 = (v14 - v13) >> 4;
        v17 = v11[2];
        if (v16 <= (v17 - (uint64_t)v12) >> 4)
        {
          v20 = (void **)(v6 + 112);
          v21 = v3 + v5;
          v22 = *(_BYTE **)(v21 + 112);
          v23 = (v22 - v10) >> 4;
          if (v23 >= v16)
          {
            if (v14 != v13)
              memmove(v10, v13, v15 - 7);
            v3 = a3;
          }
          else
          {
            if (v22 != v10)
            {
              memmove(v10, v13, v22 - v10 - 7);
              v10 = *(char **)(v21 + 112);
            }
            v3 = a3;
            v24 = &v13[16 * v23];
            v15 = v14 - v24;
            if (v14 != v24)
              memmove(v10, v24, v15 - 7);
          }
          v4 = a2;
        }
        else
        {
          if (v10)
          {
            *(_QWORD *)(v3 + v5 + 112) = v10;
            operator delete(v10);
            v17 = 0;
            *v11 = 0;
            v11[1] = 0;
            v11[2] = 0;
          }
          if (v15 < 0)
            std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
          v18 = v17 >> 3;
          if (v17 >> 3 <= v16)
            v18 = (v14 - v13) >> 4;
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0)
            v19 = 0xFFFFFFFFFFFFFFFLL;
          else
            v19 = v18;
          std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](v11, v19);
          v20 = (void **)(v3 + v5 + 112);
          v10 = (char *)*v20;
          if (v14 != v13)
            memmove(*(void **)(v3 + v5 + 112), v13, v15 - 7);
        }
        a1 = v28;
        *v20 = &v10[v15];
      }
      v6 += 128;
      v5 += 128;
    }
    while (a1 + v5 != v4);
    v3 += v5;
  }
  return v3;
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nl_featurization::beam_search::BeamSequence>,nl_featurization::beam_search::BeamSequence*,nl_featurization::beam_search::BeamSequence*,nl_featurization::beam_search::BeamSequence*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  if (a2 != a3)
  {
    v7 = 0;
    do
    {
      v8 = a4 + v7;
      v9 = a2 + v7;
      v10 = *(_OWORD *)(a2 + v7 + 16);
      *(_OWORD *)v8 = *(_OWORD *)(a2 + v7);
      *(_OWORD *)(v8 + 16) = v10;
      std::set<unsigned long>::set[abi:ne180100](a4 + v7 + 32, (_QWORD *)(a2 + v7 + 32));
      *(_QWORD *)(v8 + 56) = 0;
      *(_QWORD *)(v8 + 64) = 0;
      *(_QWORD *)(v8 + 72) = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>((_QWORD *)(a4 + v7 + 56), *(const void **)(v9 + 56), *(_QWORD *)(v9 + 64), (uint64_t)(*(_QWORD *)(v9 + 64) - *(_QWORD *)(v9 + 56)) >> 3);
      v11 = a4 + v7;
      v12 = a4 + v7;
      *(_QWORD *)(v12 + 80) = 0;
      *(_QWORD *)(v12 + 88) = 0;
      *(_QWORD *)(a4 + v7 + 96) = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>((_QWORD *)(a4 + v7 + 80), *(const void **)(v9 + 80), *(_QWORD *)(v9 + 88), (uint64_t)(*(_QWORD *)(v9 + 88) - *(_QWORD *)(v9 + 80)) >> 3);
      *(_QWORD *)(v11 + 104) = 0;
      *(_QWORD *)(v11 + 112) = 0;
      v13 = (_QWORD *)(a4 + v7 + 104);
      v13[2] = 0;
      std::vector<std::optional<unsigned long>>::__init_with_size[abi:ne180100]<std::optional<unsigned long>*,std::optional<unsigned long>*>(v13, *(const void **)(v9 + 104), *(_QWORD *)(v9 + 112), (uint64_t)(*(_QWORD *)(v9 + 112) - *(_QWORD *)(v9 + 104)) >> 4);
      v7 += 128;
    }
    while (v9 + 128 != a3);
    a4 += v7;
  }
  return a4;
}

void sub_1C230418C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  void **v3;
  void **v4;
  void *v6;
  void *v7;

  v6 = *v4;
  if (*v4)
  {
    *(_QWORD *)(v2 + 88) = v6;
    operator delete(v6);
  }
  v7 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v2 + 64) = v7;
    operator delete(v7);
  }
  std::__tree<unsigned long>::destroy(*(_QWORD **)(v2 + 40));
  while (v2 != v1)
  {
    v2 -= 128;
    std::allocator<nl_featurization::beam_search::BeamSequence>::destroy[abi:ne180100](v2);
  }
  _Unwind_Resume(a1);
}

void std::__tree<unsigned long>::__move_assign(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a1 + 1;
  std::__tree<unsigned long>::destroy((_QWORD *)a1[1]);
  *a1 = *a2;
  v5 = a2 + 1;
  v6 = a2[1];
  *v4 = v6;
  v7 = a2[2];
  a1[2] = v7;
  if (v7)
  {
    *(_QWORD *)(v6 + 16) = v4;
    *a2 = v5;
    *v5 = 0;
    a2[2] = 0;
  }
  else
  {
    *a1 = v4;
  }
}

void std::swap[abi:ne180100]<nl_featurization::beam_search::BeamSequence>(__int128 *a1, __int128 *a2)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v6;
  _QWORD *v7;
  __int128 v8;
  __int128 v9;
  void **v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  _QWORD **v22;
  _QWORD *v23;
  uint64_t v24;
  void *v25[2];
  uint64_t v26;
  void *__p[2];
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v20 = *a1;
  v21 = a1[1];
  v5 = (_QWORD **)*((_QWORD *)a1 + 4);
  v4 = a1 + 2;
  v6 = (_QWORD *)a1 + 5;
  v7 = (_QWORD *)*((_QWORD *)a1 + 5);
  v22 = v5;
  v23 = v7;
  v24 = *((_QWORD *)a1 + 6);
  if (v24)
  {
    v7[2] = &v23;
    *v4 = v6;
    *v6 = 0;
    *((_QWORD *)a1 + 6) = 0;
  }
  else
  {
    v22 = &v23;
  }
  *(_OWORD *)v25 = *(__int128 *)((char *)a1 + 56);
  v26 = *((_QWORD *)a1 + 9);
  *((_QWORD *)a1 + 8) = 0;
  *((_QWORD *)a1 + 9) = 0;
  *((_QWORD *)a1 + 7) = 0;
  *(_OWORD *)__p = a1[5];
  v28 = *((_QWORD *)a1 + 12);
  *((_QWORD *)a1 + 11) = 0;
  *((_QWORD *)a1 + 12) = 0;
  v8 = *(__int128 *)((char *)a1 + 104);
  *((_QWORD *)a1 + 10) = 0;
  v29 = v8;
  v30 = *((_QWORD *)a1 + 15);
  *((_QWORD *)a1 + 13) = 0;
  *((_QWORD *)a1 + 14) = 0;
  *((_QWORD *)a1 + 15) = 0;
  v9 = a2[1];
  *a1 = *a2;
  a1[1] = v9;
  std::__tree<unsigned long>::__move_assign(v4, (_QWORD *)a2 + 4);
  v10 = (void **)a2 + 7;
  v11 = (void *)*((_QWORD *)a1 + 7);
  if (v11)
  {
    *((_QWORD *)a1 + 8) = v11;
    operator delete(v11);
    *((_QWORD *)a1 + 7) = 0;
    *((_QWORD *)a1 + 8) = 0;
    *((_QWORD *)a1 + 9) = 0;
  }
  *(__int128 *)((char *)a1 + 56) = *(__int128 *)((char *)a2 + 56);
  *((_QWORD *)a1 + 9) = *((_QWORD *)a2 + 9);
  *v10 = 0;
  *((_QWORD *)a2 + 8) = 0;
  *((_QWORD *)a2 + 9) = 0;
  v12 = (void *)*((_QWORD *)a1 + 10);
  if (v12)
  {
    *((_QWORD *)a1 + 11) = v12;
    operator delete(v12);
    *((_QWORD *)a1 + 10) = 0;
    *((_QWORD *)a1 + 11) = 0;
    *((_QWORD *)a1 + 12) = 0;
  }
  a1[5] = a2[5];
  *((_QWORD *)a1 + 12) = *((_QWORD *)a2 + 12);
  *((_QWORD *)a2 + 10) = 0;
  *((_QWORD *)a2 + 11) = 0;
  *((_QWORD *)a2 + 12) = 0;
  v13 = (void *)*((_QWORD *)a1 + 13);
  if (v13)
  {
    *((_QWORD *)a1 + 14) = v13;
    operator delete(v13);
    *((_QWORD *)a1 + 13) = 0;
    *((_QWORD *)a1 + 14) = 0;
    *((_QWORD *)a1 + 15) = 0;
  }
  *(__int128 *)((char *)a1 + 104) = *(__int128 *)((char *)a2 + 104);
  *((_QWORD *)a1 + 15) = *((_QWORD *)a2 + 15);
  *((_QWORD *)a2 + 13) = 0;
  *((_QWORD *)a2 + 14) = 0;
  *((_QWORD *)a2 + 15) = 0;
  *a2 = v20;
  a2[1] = v21;
  v14 = (uint64_t)a2 + 40;
  std::__tree<unsigned long>::destroy(*((_QWORD **)a2 + 5));
  v15 = v23;
  *((_QWORD *)a2 + 4) = v22;
  *((_QWORD *)a2 + 5) = v15;
  v16 = v24;
  *((_QWORD *)a2 + 6) = v24;
  if (v16)
  {
    v15[2] = v14;
    v23 = 0;
    v24 = 0;
  }
  else
  {
    *((_QWORD *)a2 + 4) = v14;
  }
  v17 = *v10;
  if (*v10)
  {
    *((_QWORD *)a2 + 8) = v17;
    operator delete(v17);
  }
  *(__int128 *)((char *)a2 + 56) = *(_OWORD *)v25;
  *((_QWORD *)a2 + 9) = v26;
  v25[1] = 0;
  v26 = 0;
  v25[0] = 0;
  v18 = (void *)*((_QWORD *)a2 + 10);
  if (v18)
  {
    *((_QWORD *)a2 + 11) = v18;
    operator delete(v18);
  }
  a2[5] = *(_OWORD *)__p;
  *((_QWORD *)a2 + 12) = v28;
  __p[1] = 0;
  v28 = 0;
  __p[0] = 0;
  v19 = (void *)*((_QWORD *)a2 + 13);
  if (v19)
  {
    *((_QWORD *)a2 + 14) = v19;
    operator delete(v19);
    v19 = __p[0];
  }
  *(__int128 *)((char *)a2 + 104) = v29;
  *((_QWORD *)a2 + 15) = v30;
  v30 = 0;
  v29 = 0uLL;
  if (v19)
  {
    __p[1] = v19;
    operator delete(v19);
  }
  if (v25[0])
  {
    v25[1] = v25[0];
    operator delete(v25[0]);
  }
  std::__tree<unsigned long>::destroy(v23);
}

void std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_1 &,nl_featurization::beam_search::BeamSequence *>(__int128 *a1, __int128 *a2, __int128 *a3)
{
  double *v5;
  double v6;
  double v7;
  __int128 *v8;

  v5 = (double *)a1;
  v6 = *(double *)a2;
  v7 = *(double *)a3;
  if (*(double *)a2 > *(double *)a1)
  {
    if (v7 <= v6)
    {
      std::swap[abi:ne180100]<nl_featurization::beam_search::BeamSequence>(a1, a2);
      if (*(double *)a3 <= *(double *)a2)
        return;
      a1 = a2;
    }
    v8 = a3;
    goto LABEL_9;
  }
  if (v7 > v6)
  {
    std::swap[abi:ne180100]<nl_featurization::beam_search::BeamSequence>(a2, a3);
    if (*(double *)a2 > *v5)
    {
      a1 = (__int128 *)v5;
      v8 = a2;
LABEL_9:
      std::swap[abi:ne180100]<nl_featurization::beam_search::BeamSequence>(a1, v8);
    }
  }
}

void std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_1 &,nl_featurization::beam_search::BeamSequence *>(__int128 *a1, __int128 *a2, __int128 *a3, __int128 *a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_1 &,nl_featurization::beam_search::BeamSequence *>(a1, a2, a3);
  if (*(double *)a4 > *(double *)a3)
  {
    std::swap[abi:ne180100]<nl_featurization::beam_search::BeamSequence>(a3, a4);
    if (*(double *)a3 > *(double *)a2)
    {
      std::swap[abi:ne180100]<nl_featurization::beam_search::BeamSequence>(a2, a3);
      if (*(double *)a2 > *(double *)a1)
        std::swap[abi:ne180100]<nl_featurization::beam_search::BeamSequence>(a1, a2);
    }
  }
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_1 &,nl_featurization::beam_search::BeamSequence *>(__int128 *a1, __int128 *a2)
{
  __int128 *v2;
  uint64_t v4;
  _BOOL8 result;
  __int128 *v6;
  __int128 *v7;
  double *v8;
  __int128 *v9;
  uint64_t v10;
  int v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  char *v15;
  __int128 v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  char *v20;
  void *v21;
  char *v22;
  double v23;
  uint64_t *v24;
  char *v25;
  __int128 *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  double *v41;
  __int128 *v42;
  double v43;
  __int128 *v44;
  __int128 v45;
  __int128 v46;
  _QWORD **v47;
  _QWORD *v48;
  uint64_t v49;
  void *v50[2];
  uint64_t v51;
  void *__p[2];
  uint64_t v53;
  __int128 v54;
  uint64_t v55;

  v2 = a2;
  v4 = ((char *)a2 - (char *)a1) >> 7;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (*((double *)a2 - 16) > *(double *)a1)
      {
        v6 = a1;
        v7 = a2 - 8;
        goto LABEL_4;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_1 &,nl_featurization::beam_search::BeamSequence *>(a1, a1 + 8, a2 - 8);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_1 &,nl_featurization::beam_search::BeamSequence *>(a1, a1 + 8, a1 + 16, a2 - 8);
      return 1;
    case 5:
      v41 = (double *)(a1 + 16);
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_1 &,nl_featurization::beam_search::BeamSequence *>(a1, a1 + 8, a1 + 16, a1 + 24);
      v43 = *((double *)v2 - 16);
      v42 = v2 - 8;
      if (v43 > *((double *)a1 + 48))
      {
        std::swap[abi:ne180100]<nl_featurization::beam_search::BeamSequence>(a1 + 24, v42);
        if (*((double *)a1 + 48) > *v41)
        {
          std::swap[abi:ne180100]<nl_featurization::beam_search::BeamSequence>(a1 + 16, a1 + 24);
          if (*v41 > *((double *)a1 + 16))
          {
            std::swap[abi:ne180100]<nl_featurization::beam_search::BeamSequence>(a1 + 8, a1 + 16);
            if (*((double *)a1 + 16) > *(double *)a1)
            {
              v6 = a1;
              v7 = a1 + 8;
LABEL_4:
              std::swap[abi:ne180100]<nl_featurization::beam_search::BeamSequence>(v6, v7);
            }
          }
        }
      }
      return 1;
    default:
      v8 = (double *)(a1 + 16);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_1 &,nl_featurization::beam_search::BeamSequence *>(a1, a1 + 8, a1 + 16);
      v9 = a1 + 24;
      if (a1 + 24 == v2)
        return 1;
      v10 = 0;
      v11 = 0;
      v44 = v2;
      break;
  }
  while (1)
  {
    if (*(double *)v9 > *v8)
    {
      v45 = *v9;
      v46 = v9[1];
      v12 = (_QWORD *)v9 + 5;
      v13 = (_QWORD *)*((_QWORD *)v9 + 5);
      v47 = (_QWORD **)*((_QWORD *)v9 + 4);
      v48 = v13;
      v49 = *((_QWORD *)v9 + 6);
      if (v49)
      {
        v13[2] = &v48;
        *((_QWORD *)v9 + 4) = v12;
        *v12 = 0;
        *((_QWORD *)v9 + 6) = 0;
      }
      else
      {
        v47 = &v48;
      }
      *(_OWORD *)v50 = *(__int128 *)((char *)v9 + 56);
      v51 = *((_QWORD *)v9 + 9);
      *((_QWORD *)v9 + 7) = 0;
      *((_QWORD *)v9 + 8) = 0;
      *(_OWORD *)__p = v9[5];
      v53 = *((_QWORD *)v9 + 12);
      *((_QWORD *)v9 + 9) = 0;
      *((_QWORD *)v9 + 10) = 0;
      *((_QWORD *)v9 + 11) = 0;
      *((_QWORD *)v9 + 12) = 0;
      v54 = *(__int128 *)((char *)v9 + 104);
      v55 = *((_QWORD *)v9 + 15);
      *((_QWORD *)v9 + 14) = 0;
      *((_QWORD *)v9 + 15) = 0;
      v14 = v10;
      *((_QWORD *)v9 + 13) = 0;
      while (1)
      {
        v15 = (char *)a1 + v14;
        v16 = *(__int128 *)((char *)a1 + v14 + 272);
        *((_OWORD *)v15 + 24) = *(__int128 *)((char *)a1 + v14 + 256);
        *((_OWORD *)v15 + 25) = v16;
        std::__tree<unsigned long>::__move_assign((__int128 *)((char *)a1 + v14 + 416), (__int128 *)((char *)a1 + v14 + 288));
        v17 = *(void **)((char *)a1 + v14 + 440);
        if (v17)
        {
          *((_QWORD *)v15 + 56) = v17;
          operator delete(v17);
          *((_QWORD *)v15 + 57) = 0;
        }
        *(_OWORD *)(v15 + 440) = *(_OWORD *)(v15 + 312);
        *((_QWORD *)v15 + 57) = *((_QWORD *)v15 + 41);
        *((_QWORD *)v15 + 39) = 0;
        *((_QWORD *)v15 + 40) = 0;
        *((_QWORD *)v15 + 41) = 0;
        v18 = (void *)*((_QWORD *)v15 + 58);
        if (v18)
        {
          *(_QWORD *)((char *)a1 + v14 + 472) = v18;
          operator delete(v18);
          *(_QWORD *)((char *)a1 + v14 + 480) = 0;
        }
        v19 = v15 + 336;
        *((_OWORD *)v15 + 29) = *((_OWORD *)v15 + 21);
        v20 = (char *)a1 + v14;
        *(_QWORD *)((char *)a1 + v14 + 480) = *(_QWORD *)((char *)a1 + v14 + 352);
        *v19 = 0;
        v19[1] = 0;
        v19[2] = 0;
        v21 = *(void **)((char *)a1 + v14 + 488);
        if (v21)
        {
          *((_QWORD *)v20 + 62) = v21;
          operator delete(v21);
          *((_QWORD *)v20 + 63) = 0;
        }
        *(_OWORD *)(v20 + 488) = *(_OWORD *)(v20 + 360);
        *((_QWORD *)v20 + 63) = *((_QWORD *)v20 + 47);
        *((_QWORD *)v20 + 45) = 0;
        *((_QWORD *)v20 + 46) = 0;
        *((_QWORD *)v20 + 47) = 0;
        if (v14 == -256)
          break;
        v22 = (char *)a1 + v14;
        v23 = *(double *)((char *)a1 + v14 + 128);
        v14 -= 128;
        if (*(double *)&v45 <= v23)
        {
          v24 = (uint64_t *)(v22 + 288);
          v25 = v22 + 312;
          v26 = (__int128 *)(v22 + 336);
          v27 = (uint64_t)a1 + v14 + 384;
          v28 = v22 + 360;
          goto LABEL_23;
        }
      }
      v24 = (uint64_t *)(a1 + 2);
      v25 = (char *)a1 + 56;
      v26 = a1 + 5;
      v28 = (char *)a1 + 104;
      v27 = (uint64_t)a1;
LABEL_23:
      *(_OWORD *)v27 = v45;
      *(_OWORD *)(v27 + 16) = v46;
      v29 = v27 + 40;
      std::__tree<unsigned long>::destroy(*(_QWORD **)(v27 + 40));
      v30 = v48;
      *v24 = (uint64_t)v47;
      *(_QWORD *)(v27 + 40) = v30;
      v31 = v49;
      *(_QWORD *)(v27 + 48) = v49;
      if (v31)
      {
        v30[2] = v29;
        v48 = 0;
        v49 = 0;
      }
      else
      {
        *v24 = v29;
      }
      v2 = v44;
      v32 = *(void **)v25;
      if (*(_QWORD *)v25)
      {
        *(_QWORD *)(v27 + 64) = v32;
        operator delete(v32);
        *(_QWORD *)v25 = 0;
        *((_QWORD *)v25 + 1) = 0;
        *((_QWORD *)v25 + 2) = 0;
      }
      v33 = v50[1];
      *(void **)v25 = v50[0];
      v34 = v51;
      *(_QWORD *)(v27 + 64) = v33;
      *(_QWORD *)(v27 + 72) = v34;
      v50[1] = 0;
      v51 = 0;
      v50[0] = 0;
      v35 = *(void **)v26;
      if (*(_QWORD *)v26)
      {
        *(_QWORD *)(v27 + 88) = v35;
        operator delete(v35);
        *(_QWORD *)v26 = 0;
        *((_QWORD *)v26 + 1) = 0;
        *((_QWORD *)v26 + 2) = 0;
      }
      v36 = __p[1];
      *(void **)v26 = __p[0];
      v37 = v53;
      *(_QWORD *)(v27 + 88) = v36;
      *(_QWORD *)(v27 + 96) = v37;
      __p[1] = 0;
      v53 = 0;
      __p[0] = 0;
      v38 = *(void **)v28;
      if (*(_QWORD *)v28)
      {
        *(_QWORD *)(v27 + 112) = v38;
        operator delete(v38);
        *(_QWORD *)v28 = 0;
        *((_QWORD *)v28 + 1) = 0;
        *((_QWORD *)v28 + 2) = 0;
        v38 = __p[0];
      }
      v39 = *((_QWORD *)&v54 + 1);
      *(_QWORD *)v28 = v54;
      v40 = v55;
      *(_QWORD *)(v27 + 112) = v39;
      *(_QWORD *)(v27 + 120) = v40;
      v55 = 0;
      v54 = 0uLL;
      if (v38)
      {
        __p[1] = v38;
        operator delete(v38);
      }
      if (v50[0])
      {
        v50[1] = v50[0];
        operator delete(v50[0]);
      }
      ++v11;
      std::__tree<unsigned long>::destroy(v48);
      if (v11 == 8)
        return v9 + 8 == v44;
    }
    v8 = (double *)v9;
    v10 += 128;
    v9 += 8;
    if (v9 == v2)
      return 1;
  }
}

double *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(double *result, double *a2, double *a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = *a2;
  v4 = a2[1];
  v5 = result[1];
  v6 = a3[1];
  if (v4 <= v5)
  {
    if (v6 > v4)
    {
      *a2 = *a3;
      *a3 = v3;
      a2[1] = v6;
      a3[1] = v4;
      v8 = a2[1];
      v9 = result[1];
      if (v8 > v9)
      {
        v10 = *result;
        *result = *a2;
        *a2 = v10;
        result[1] = v8;
        a2[1] = v9;
      }
    }
  }
  else
  {
    v7 = *result;
    if (v6 <= v4)
    {
      *result = v3;
      *a2 = v7;
      result[1] = v4;
      a2[1] = v5;
      v11 = a3[1];
      if (v11 <= v5)
        return result;
      *a2 = *a3;
      *a3 = v7;
      a2[1] = v11;
    }
    else
    {
      *result = *a3;
      *a3 = v7;
      result[1] = v6;
    }
    a3[1] = v5;
  }
  return result;
}

double *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(double *a1, double *a2, double *a3, double *a4)
{
  double *result;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(a1, a2, a3);
  v9 = a4[1];
  v10 = a3[1];
  if (v9 > v10)
  {
    v11 = *a3;
    *a3 = *a4;
    *a4 = v11;
    a3[1] = v9;
    a4[1] = v10;
    v12 = a3[1];
    v13 = a2[1];
    if (v12 > v13)
    {
      v14 = *a2;
      *a2 = *a3;
      *a3 = v14;
      a2[1] = v12;
      a3[1] = v13;
      v15 = a2[1];
      v16 = a1[1];
      if (v15 > v16)
      {
        v17 = *a1;
        *a1 = *a2;
        *a2 = v17;
        a1[1] = v15;
        a2[1] = v16;
      }
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(double *a1, double *a2)
{
  uint64_t v4;
  _BOOL8 result;
  double v6;
  double v7;
  double v8;
  double *v9;
  double *v10;
  uint64_t v11;
  int v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;

  v4 = ((char *)a2 - (char *)a1) >> 4;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(a2 - 1);
      v7 = a1[1];
      if (v6 > v7)
      {
        v8 = *a1;
        *a1 = *(a2 - 2);
        *(a2 - 2) = v8;
        a1[1] = v6;
        *(a2 - 1) = v7;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(a1, a1 + 2, a2 - 2);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(a1, a1 + 2, a1 + 4, a2 - 2);
      return 1;
    case 5:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(a1, a1 + 2, a1 + 4, a1 + 6);
      v18 = *(a2 - 1);
      v19 = a1[7];
      if (v18 > v19)
      {
        v20 = *((_QWORD *)a1 + 6);
        a1[6] = *(a2 - 2);
        *((_QWORD *)a2 - 2) = v20;
        a1[7] = v18;
        *(a2 - 1) = v19;
        v21 = a1[7];
        v22 = a1[5];
        if (v21 > v22)
        {
          v23 = *((_QWORD *)a1 + 4);
          v24 = *((_QWORD *)a1 + 6);
          *((_QWORD *)a1 + 4) = v24;
          *((_QWORD *)a1 + 6) = v23;
          a1[5] = v21;
          a1[7] = v22;
          v25 = a1[3];
          if (v21 > v25)
          {
            v26 = *((_QWORD *)a1 + 2);
            *((_QWORD *)a1 + 2) = v24;
            *((_QWORD *)a1 + 4) = v26;
            a1[3] = v21;
            a1[5] = v25;
            v27 = a1[1];
            if (v21 > v27)
            {
              v28 = *a1;
              *(_QWORD *)a1 = v24;
              a1[2] = v28;
              a1[1] = v21;
              a1[3] = v27;
            }
          }
        }
      }
      return 1;
    default:
      v9 = a1 + 4;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,nl_featurization::beam_search::beamSearch(std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::vector<double> const&,std::vector<std::vector<double>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,std::unordered_map<unsigned long,std::set<unsigned long>> const&,unsigned long)::$_0 &,std::pair<unsigned long,double> *>(a1, a1 + 2, a1 + 4);
      v10 = a1 + 6;
      if (a1 + 6 == a2)
        return 1;
      v11 = 0;
      v12 = 0;
      break;
  }
  while (1)
  {
    v13 = v10[1];
    if (v13 > v9[1])
    {
      v14 = *(_QWORD *)v10;
      v15 = v11;
      while (1)
      {
        v16 = (double *)((char *)a1 + v15);
        v16[6] = *(double *)((char *)a1 + v15 + 32);
        v16[7] = *(double *)((char *)a1 + v15 + 40);
        if (v15 == -32)
          break;
        v15 -= 16;
        if (v13 <= v16[3])
        {
          v17 = (uint64_t)a1 + v15 + 48;
          goto LABEL_13;
        }
      }
      v17 = (uint64_t)a1;
LABEL_13:
      *(_QWORD *)v17 = v14;
      *(double *)(v17 + 8) = v13;
      if (++v12 == 8)
        return v10 + 2 == a2;
    }
    v9 = v10;
    v11 += 16;
    v10 += 2;
    if (v10 == a2)
      return 1;
  }
}

_QWORD *nl_featurization::Embedding::getCoordinates@<X0>(nl_featurization::Embedding *this@<X0>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, *(const void **)this, *((_QWORD *)this + 1), (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 3);
}

uint64_t nl_featurization::Embedding::getDimension(nl_featurization::Embedding *this)
{
  return (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 3;
}

BOOL nl_featurization::operator==(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  double *v4;
  uint64_t v5;
  double v6;
  _BOOL8 result;
  BOOL v8;

  v3 = *a1;
  v2 = a1[1];
  v4 = *(double **)a2;
  if (v2 - *a1 != *(_QWORD *)(a2 + 8) - *(_QWORD *)a2)
    return 0;
  if (v3 == v2)
    return 1;
  v5 = v3 + 8;
  do
  {
    v6 = *v4++;
    result = *(double *)(v5 - 8) == v6;
    v8 = *(double *)(v5 - 8) != v6 || v5 == v2;
    v5 += 8;
  }
  while (!v8);
  return result;
}

_QWORD *nl_featurization::operator<<(_QWORD *a1, uint64_t a2)
{
  _BYTE *v3;
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *__p;
  _BYTE *v11;
  uint64_t v12;
  char v13;

  __p = 0;
  v11 = 0;
  v12 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"Embedding[", 10);
  v3 = __p;
  v4 = v11;
  v5 = v11 - (_BYTE *)__p;
  v6 = (v11 - (_BYTE *)__p) >> 3;
  if (v6 >= 3)
    v6 = 3;
  if (v6)
  {
    v7 = 0;
    do
    {
      if (v7)
      {
        v13 = 32;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)&v13, 1);
        v3 = __p;
        v4 = v11;
      }
      if (v7 >= (v4 - v3) >> 3)
        std::vector<nlv4_inference_orchestrator::trees::TreeNode>::__throw_out_of_range[abi:ne180100]();
      std::ostream::operator<<();
      ++v7;
      v3 = __p;
      v4 = v11;
      v5 = v11 - (_BYTE *)__p;
      v8 = (v11 - (_BYTE *)__p) >> 3;
      if (v8 >= 3)
        v8 = 3;
    }
    while (v7 < v8);
  }
  if (v5 > 0x18)
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)" ...", 4);
  v13 = 93;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)&v13, 1);
  if (__p)
  {
    v11 = __p;
    operator delete(__p);
  }
  return a1;
}

void sub_1C2304FAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::basic_string<char16_t> *nl_featurization::span_matching::MatchedSpansFeaturizer::MatchedSpansFeaturizer(std::basic_string<char16_t> *this, __int128 *a2, uint64_t a3, uint64_t *a4)
{
  __int128 v8;
  std::basic_string<char16_t> *v9;
  __int128 v10;
  _QWORD *v11;
  std::basic_string<char16_t>::size_type v12;
  std::basic_string<char16_t>::size_type *p_size;
  std::basic_string<char16_t>::size_type v14;
  _QWORD *v15;
  std::basic_string<char16_t>::size_type v16;
  std::basic_string<char16_t>::size_type *v17;
  std::basic_string<char16_t>::size_type v18;
  std::basic_string<char16_t>::size_type v19;
  char v20;
  uint64_t v22[5];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (*((char *)a2 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(this, *(const std::basic_string<char16_t>::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v8 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v8;
  }
  v9 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(v9, *((const std::basic_string<char16_t>::value_type **)a2 + 3), *((_QWORD *)a2 + 4));
  }
  else
  {
    v10 = *(__int128 *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 5);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
  }
  this[2].__r_.__value_.__r.__words[0] = *((_QWORD *)a2 + 6);
  v11 = (_QWORD *)a2 + 7;
  v12 = *((_QWORD *)a2 + 7);
  this[2].__r_.__value_.__l.__size_ = v12;
  p_size = &this[2].__r_.__value_.__l.__size_;
  v14 = *((_QWORD *)a2 + 8);
  this[2].__r_.__value_.__r.__words[2] = v14;
  if (v14)
  {
    *(_QWORD *)(v12 + 16) = p_size;
    *((_QWORD *)a2 + 6) = v11;
    *v11 = 0;
    *((_QWORD *)a2 + 8) = 0;
  }
  else
  {
    this[2].__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)p_size;
  }
  this[3].__r_.__value_.__r.__words[0] = *((_QWORD *)a2 + 9);
  v15 = a2 + 5;
  v16 = *((_QWORD *)a2 + 10);
  this[3].__r_.__value_.__l.__size_ = v16;
  v17 = &this[3].__r_.__value_.__l.__size_;
  v18 = *((_QWORD *)a2 + 11);
  this[3].__r_.__value_.__r.__words[2] = v18;
  if (v18)
  {
    *(_QWORD *)(v16 + 16) = v17;
    *((_QWORD *)a2 + 9) = v15;
    *v15 = 0;
    *((_QWORD *)a2 + 11) = 0;
  }
  else
  {
    this[3].__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)v17;
  }
  v19 = *(_QWORD *)a3;
  v23[0] = *(_QWORD *)(a3 + 8);
  *(_QWORD *)((char *)v23 + 7) = *(_QWORD *)(a3 + 15);
  v20 = *(_BYTE *)(a3 + 23);
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)a3 = 0;
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__hash_table((uint64_t)v22, a4);
  this[4].__r_.__value_.__r.__words[0] = v19;
  this[4].__r_.__value_.__l.__size_ = v23[0];
  *(std::basic_string<char16_t>::size_type *)((char *)&this[4].__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)v23 + 7);
  *((_BYTE *)&this[4].__r_.__value_.__s + 23) = v20;
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__hash_table((uint64_t)&this[5], v22);
  std::__hash_table<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,snlp::common::espresso_inference::e5ml::WeightsHandler::EspressoWeightType>>>::~__hash_table((uint64_t)v22);
  nl_featurization::span_matching::MatchedSpansFeaturizer::validateVocabulary((nl_featurization::span_matching::MatchedSpansFeaturizer *)this);
  return this;
}

void sub_1C2305164(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

nl_featurization::span_matching::MatchedSpansFeaturizer *nl_featurization::span_matching::MatchedSpansFeaturizer::validateVocabulary(nl_featurization::span_matching::MatchedSpansFeaturizer *this)
{
  nl_featurization::span_matching::MatchedSpansFeaturizer *result;
  std::runtime_error *exception;

  result = (nl_featurization::span_matching::MatchedSpansFeaturizer *)std::__tree<std::__value_type<std::basic_string<char16_t>,unsigned long>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,unsigned long>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,unsigned long>>>::find<std::basic_string<char16_t>>((uint64_t)this + 48, (unsigned __int16 *)this + 12);
  if ((nl_featurization::span_matching::MatchedSpansFeaturizer *)((char *)this + 56) == result)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Label vocabulary does not contain pad token");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  return result;
}

void sub_1C23051FC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void nl_featurization::span_matching::MatchedSpansFeaturizer::featurize(unsigned __int16 *a1@<X0>, unint64_t **a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  void *v6[3];
  void **v7;

  nl_featurization::bio::BilouEncoder::encode((uint64_t)(a1 + 48), a2, a3, v6);
  nl_featurization::span_matching::MatchedSpansFeaturizer::tensorise(a1, (__int128 **)v6, a4);
  v7 = v6;
  std::vector<nl_featurization::nlv4_types::Token>::__destroy_vector::operator()[abi:ne180100](&v7);
}

void sub_1C2305270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::vector<nl_featurization::nlv4_types::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void nl_featurization::span_matching::MatchedSpansFeaturizer::tensorise(unsigned __int16 *a1@<X0>, __int128 **a2@<X1>, uint64_t a3@<X8>)
{
  __int128 *v4;
  __int128 *v5;
  __int128 *v7;
  __int128 *v8;
  _QWORD *v9;
  __int128 v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  uint64_t v18;
  __int128 *v19;
  __int128 *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  std::logic_error *exception;
  void *__p;
  void *v33;
  _QWORD *v34;
  std::basic_string<char16_t> v35;
  _BYTE v36[19];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void **v40;

  v4 = *a2;
  v5 = a2[1];
  if (*a2 == v5)
  {
    v9 = operator new(0x10uLL);
    *v9 = 0;
    v9[1] = 0;
    *(_QWORD *)&v10 = v9;
    *((_QWORD *)&v10 + 1) = v9 + 2;
    *(_OWORD *)&v35.__r_.__value_.__l.__data_ = v10;
    v35.__r_.__value_.__r.__words[2] = (std::basic_string<char16_t>::size_type)(v9 + 2);
    nl_featurization::tensor::Tensor<unsigned long>::Tensor((_QWORD *)a3, (uint64_t)&v35, 0);
    v11 = (void *)v35.__r_.__value_.__r.__words[0];
    if (!v35.__r_.__value_.__r.__words[0])
      return;
    goto LABEL_28;
  }
  v7 = (__int128 *)((char *)v4 + 72);
  if ((__int128 *)((char *)v4 + 72) == v5)
  {
    v8 = *a2;
  }
  else
  {
    v8 = *a2;
    do
    {
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v8 + 7) - *((_QWORD *)v8 + 6)) >> 3) < 0xAAAAAAAAAAAAAAABLL
                                                                                              * ((uint64_t)(*((_QWORD *)v7 + 7) - *((_QWORD *)v7 + 6)) >> 3))
        v8 = v7;
      v7 = (__int128 *)((char *)v7 + 72);
    }
    while (v7 != v5);
  }
  if (*((char *)v8 + 23) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v35, *(const std::basic_string<char16_t>::value_type **)v8, *((_QWORD *)v8 + 1));
  }
  else
  {
    v12 = *v8;
    v35.__r_.__value_.__r.__words[2] = *((_QWORD *)v8 + 2);
    *(_OWORD *)&v35.__r_.__value_.__l.__data_ = v12;
  }
  v13 = *(__int128 *)((char *)v8 + 24);
  *(_DWORD *)&v36[15] = *(_DWORD *)((char *)v8 + 39);
  *(_OWORD *)v36 = v13;
  v38 = 0;
  v39 = 0;
  v37 = 0;
  std::vector<std::basic_string<char16_t>>::__init_with_size[abi:ne180100]<std::basic_string<char16_t>*,std::basic_string<char16_t>*>((uint64_t)&v37, *((__int128 **)v8 + 6), *((__int128 **)v8 + 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v8 + 7) - *((_QWORD *)v8 + 6)) >> 3));
  v15 = v37;
  v14 = v38;
  v16 = operator new(0x10uLL);
  v17 = 0xAAAAAAAAAAAAAAABLL * ((v14 - v15) >> 3);
  v33 = v16 + 2;
  v34 = v16 + 2;
  if (v17 <= 1)
    v17 = 1;
  *v16 = 0x8E38E38E38E38E39 * (((char *)v5 - (char *)v4) >> 3);
  v16[1] = v17;
  __p = v16;
  v18 = std::__tree<std::__value_type<std::basic_string<char16_t>,unsigned long>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,unsigned long>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,unsigned long>>>::find<std::basic_string<char16_t>>((uint64_t)(a1 + 24), a1 + 12);
  if (a1 + 28 == (unsigned __int16 *)v18)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Cannot get value for empty optional!");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E7BE5148, MEMORY[0x1E0DE4360]);
  }
  nl_featurization::tensor::Tensor<unsigned long>::Tensor((_QWORD *)a3, (uint64_t)&__p, *(_QWORD *)(v18 + 56));
  if (__p)
  {
    v33 = __p;
    operator delete(__p);
  }
  v20 = *a2;
  v19 = a2[1];
  if (v19 != *a2)
  {
    v21 = 0;
    do
    {
      v22 = (uint64_t)v20 + 72 * v21;
      v25 = *(_QWORD *)(v22 + 48);
      v24 = (uint64_t *)(v22 + 48);
      v23 = v25;
      if (v24[1] != v25)
      {
        v26 = 0;
        v27 = 0;
        do
        {
          v28 = nl_featurization::vocabulary::Vocabulary::numericalizeToken(a1, v23 + v26);
          v29 = (uint64_t *)operator new(0x10uLL);
          *v29 = v21;
          v29[1] = v27;
          *(_QWORD *)(*(_QWORD *)(a3 + 24)
                    + 8
                    * nl_featurization::tensor::Tensor<unsigned long>::computeAddress(*(uint64_t **)a3, *(_QWORD **)(a3 + 8), v29, (uint64_t)(v29 + 2))) = v28;
          operator delete(v29);
          ++v27;
          v23 = *v24;
          v26 += 24;
        }
        while (v27 < 0xAAAAAAAAAAAAAAABLL * ((v24[1] - *v24) >> 3));
        v20 = *a2;
        v19 = a2[1];
      }
      ++v21;
    }
    while (v21 < 0x8E38E38E38E38E39 * (((char *)v19 - (char *)v20) >> 3));
  }
  v40 = (void **)&v37;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v40);
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
  {
    v11 = (void *)v35.__r_.__value_.__r.__words[0];
LABEL_28:
    operator delete(v11);
  }
}

void sub_1C23055A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  void *v20;
  void *v21;

  __cxa_free_exception(v20);
  operator delete(v21);
  nl_featurization::nlv4_types::Token::~Token(&__p);
  _Unwind_Resume(a1);
}

_QWORD *nl_featurization::tensor::Tensor<unsigned long>::Tensor(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t *v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v10 = a3;
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = *(_QWORD *)(a2 + 16);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  v4 = a1 + 3;
  v5 = (uint64_t *)*a1;
  v6 = (uint64_t *)a1[1];
  if ((uint64_t *)*a1 == v6)
  {
    v7 = 0;
  }
  else
  {
    v7 = 1;
    do
    {
      v8 = *v5++;
      v7 *= v8;
    }
    while (v5 != v6);
  }
  std::vector<unsigned long>::vector(v4, v7, &v10);
  return a1;
}

void sub_1C23056AC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void __cxx_global_var_init_5032()
{
  {
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectHeader>>::get_instance();
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectHeader>>::m_instance = (uint64_t)boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectHeader>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_3_5033()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectHeader>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectHeader>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectHeader>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_4_5034()
{
  {
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectIntentList>>::get_instance();
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectIntentList>>::m_instance = (uint64_t)boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectIntentList>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_5_5035()
{
  {
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<snlp::ssu::cache::SSUCacheObjectIntent>>>::get_instance();
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<snlp::ssu::cache::SSUCacheObjectIntent>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<snlp::ssu::cache::SSUCacheObjectIntent>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_6_5036()
{
  {
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectIntent>>::get_instance();
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectIntent>>::m_instance = (uint64_t)boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectIntent>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_7_5037()
{
  {
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<snlp::ssu::cache::SSUCacheObjectParameter>>>::get_instance();
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<snlp::ssu::cache::SSUCacheObjectParameter>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<snlp::ssu::cache::SSUCacheObjectParameter>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_8_5038()
{
  {
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectParameter>>::get_instance();
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectParameter>>::m_instance = (uint64_t)boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectParameter>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_9_5039()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectParameter>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectParameter>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectParameter>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_10_5040()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<snlp::ssu::cache::SSUCacheObjectParameter>>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<snlp::ssu::cache::SSUCacheObjectParameter>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<snlp::ssu::cache::SSUCacheObjectParameter>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_11_5041()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectIntent>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectIntent>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectIntent>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_12_5042()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<snlp::ssu::cache::SSUCacheObjectIntent>>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<snlp::ssu::cache::SSUCacheObjectIntent>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<snlp::ssu::cache::SSUCacheObjectIntent>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_13_5043()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectIntentList>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectIntentList>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectIntentList>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_14_5044()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectParameter>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectParameter>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectParameter>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_15_5045()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<snlp::ssu::cache::SSUCacheObjectParameter>>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<snlp::ssu::cache::SSUCacheObjectParameter>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<snlp::ssu::cache::SSUCacheObjectParameter>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_16_5046()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectIntent>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectIntent>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectIntent>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_17_5047()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<snlp::ssu::cache::SSUCacheObjectIntent>>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<snlp::ssu::cache::SSUCacheObjectIntent>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<snlp::ssu::cache::SSUCacheObjectIntent>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_18_5048()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectIntentList>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectIntentList>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectIntentList>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_19_5049()
{
  {
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectEncodingsBatchNegative>>::get_instance();
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectEncodingsBatchNegative>>::m_instance = (uint64_t)boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectEncodingsBatchNegative>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_20_5050()
{
  {
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<unsigned long>>>::get_instance();
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<unsigned long>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<unsigned long>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_21_5051()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<unsigned long>>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<unsigned long>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<unsigned long>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_22_5052()
{
  {
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<float>>>::get_instance();
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<float>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<float>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_23_5053()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<float>>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<float>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<float>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_24_5054()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectEncodingsBatchNegative>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectEncodingsBatchNegative>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectEncodingsBatchNegative>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_25_5055()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<unsigned long>>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<unsigned long>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<unsigned long>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_26_5056()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<float>>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<float>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<float>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_27_5057()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectEncodingsBatchNegative>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectEncodingsBatchNegative>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectEncodingsBatchNegative>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_28_5058()
{
  {
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectEncodingsBatchPositive>>::get_instance();
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectEncodingsBatchPositive>>::m_instance = (uint64_t)boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectEncodingsBatchPositive>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_29_5059()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectEncodingsBatchPositive>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectEncodingsBatchPositive>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectEncodingsBatchPositive>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_30_5060()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectEncodingsBatchPositive>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectEncodingsBatchPositive>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectEncodingsBatchPositive>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_31_5061()
{
  {
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectDebugInformation>>::get_instance();
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectDebugInformation>>::m_instance = (uint64_t)boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectDebugInformation>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_32_5062()
{
  {
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectPlaintextPositiveExamples>>::get_instance();
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectPlaintextPositiveExamples>>::m_instance = (uint64_t)boost::serialization::singleton<boost::serialization::extended_type_info_typeid<snlp::ssu::cache::SSUCacheObjectPlaintextPositiveExamples>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_33_5063()
{
  {
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<std::vector<unsigned long>>>>::get_instance();
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<std::vector<unsigned long>>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<std::vector<unsigned long>>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_34_5064()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<std::vector<unsigned long>>>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<std::vector<unsigned long>>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<std::vector<unsigned long>>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_35_5065()
{
  {
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<std::string>>>::get_instance();
    boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<std::string>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::serialization::extended_type_info_typeid<std::vector<std::string>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_36_5066()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<std::string>>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<std::string>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,std::vector<std::string>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_37_5067()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectPlaintextPositiveExamples>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectPlaintextPositiveExamples>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectPlaintextPositiveExamples>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_38_5068()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectDebugInformation>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectDebugInformation>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::binary_oarchive,snlp::ssu::cache::SSUCacheObjectDebugInformation>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_39_5069()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<std::vector<unsigned long>>>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<std::vector<unsigned long>>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<std::vector<unsigned long>>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_40_5070()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<std::string>>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<std::string>>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,std::vector<std::string>>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_41_5071()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectPlaintextPositiveExamples>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectPlaintextPositiveExamples>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectPlaintextPositiveExamples>>::get_instance(void)::t;
  }
}

void __cxx_global_var_init_42_5072()
{
  {
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectDebugInformation>>::get_instance();
    boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectDebugInformation>>::m_instance = (uint64_t)boost::serialization::singleton<boost::archive::detail::oserializer<boost::archive::text_oarchive,snlp::ssu::cache::SSUCacheObjectDebugInformation>>::get_instance(void)::t;
  }
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
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

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1E0C98040](locArray, prefArray);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1E0C98630](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  double result;

  MEMORY[0x1E0C990D0](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C993C8](allocator, buffer, bufLen, isDirectory);
}

uint64_t DDFastIntegerExtraction()
{
  return MEMORY[0x1E0D1CBD0]();
}

uint64_t DDResultExtractGregorianYear()
{
  return MEMORY[0x1E0D1CC88]();
}

uint64_t DDResultGetRange()
{
  return MEMORY[0x1E0D1CCD0]();
}

uint64_t DDResultGetSubResults()
{
  return MEMORY[0x1E0D1CCF0]();
}

uint64_t DDResultGetSubresultWithType()
{
  return MEMORY[0x1E0D1CCF8]();
}

uint64_t DDResultGetType()
{
  return MEMORY[0x1E0D1CD00]();
}

uint64_t DDResultGetValue()
{
  return MEMORY[0x1E0D1CD08]();
}

uint64_t DDResultHasType()
{
  return MEMORY[0x1E0D1CD18]();
}

uint64_t DDScannerCopyResultsWithOptions()
{
  return MEMORY[0x1E0D1CDA8]();
}

uint64_t DDScannerCreateWithCacheFile()
{
  return MEMORY[0x1E0D1CDB8]();
}

uint64_t DDScannerScanString()
{
  return MEMORY[0x1E0D1CDE8]();
}

uint64_t DDScannerSetLocale()
{
  return MEMORY[0x1E0D1CE00]();
}

uint64_t DDScannerSetOptions()
{
  return MEMORY[0x1E0D1CE08]();
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t siri_nlu_types::ssu_compression_utilities::decompressFromCompressedSSUFilePath(siri_nlu_types::ssu_compression_utilities *this, const std::__fs::filesystem::path *a2, const std::__fs::filesystem::path *a3)
{
  return MEMORY[0x1E0D9FAF0](this, a2, a3);
}

uint64_t sirinluexternal::UserAccepted::makeReference(sirinluexternal::UserAccepted *this)
{
  return MEMORY[0x1E0D9FB18](this);
}

uint64_t sirinluexternal::UserRejected::makeReference(sirinluexternal::UserRejected *this)
{
  return MEMORY[0x1E0D9FB20](this);
}

uint64_t sirinluexternal::UserCancelled::makeReference(sirinluexternal::UserCancelled *this)
{
  return MEMORY[0x1E0D9FB28](this);
}

uint64_t sirinluexternal::UserDialogAct::makeAccepted(sirinluexternal::UserDialogAct *this)
{
  return MEMORY[0x1E0D9FB30](this);
}

uint64_t sirinluexternal::UserDialogAct::makeRejected(sirinluexternal::UserDialogAct *this)
{
  return MEMORY[0x1E0D9FB38](this);
}

uint64_t sirinluexternal::UserDialogAct::makeCancelled(sirinluexternal::UserDialogAct *this)
{
  return MEMORY[0x1E0D9FB40](this);
}

uint64_t sirinluexternal::UserDialogAct::makeDelegated(sirinluexternal::UserDialogAct *this)
{
  return MEMORY[0x1E0D9FB48](this);
}

uint64_t sirinluexternal::UserDialogAct::makeAcknowledged(sirinluexternal::UserDialogAct *this)
{
  return MEMORY[0x1E0D9FB50](this);
}

uint64_t sirinluexternal::UserDialogAct::makeWantedToPause(sirinluexternal::UserDialogAct *this)
{
  return MEMORY[0x1E0D9FB58](this);
}

uint64_t sirinluexternal::UserDialogAct::makeUserStatedTask(sirinluexternal::UserDialogAct *this)
{
  return MEMORY[0x1E0D9FB60](this);
}

uint64_t sirinluexternal::UserDialogAct::makeWantedToRepeat(sirinluexternal::UserDialogAct *this)
{
  return MEMORY[0x1E0D9FB68](this);
}

uint64_t sirinluexternal::UserDialogAct::makeWantedToProceed(sirinluexternal::UserDialogAct *this)
{
  return MEMORY[0x1E0D9FB70](this);
}

uint64_t sirinluexternal::UserDialogAct::UserDialogAct(sirinluexternal::UserDialogAct *this, const sirinluexternal::UserDialogAct *a2)
{
  return MEMORY[0x1E0D9FB78](this, a2);
}

uint64_t sirinluexternal::UserDialogAct::UserDialogAct(sirinluexternal::UserDialogAct *this)
{
  return MEMORY[0x1E0D9FB80](this);
}

uint64_t sirinluexternal::UserStatedTask::makeTask(sirinluexternal::UserStatedTask *this)
{
  return MEMORY[0x1E0D9FBD0](this);
}

uint64_t sirinluexternal::LegacyNLContext::LegacyNLContext()
{
  return MEMORY[0x1E0D9FBF8]();
}

{
  return MEMORY[0x1E0D9FC00]();
}

void sirinluexternal::LegacyNLContext::~LegacyNLContext(sirinluexternal::LegacyNLContext *this)
{
  MEMORY[0x1E0D9FC08](this);
}

uint64_t sirinluexternal::LegacyNLContext::operator=()
{
  return MEMORY[0x1E0D9FC10]();
}

uint64_t sirinluexternal::SystemDialogAct::SystemDialogAct()
{
  return MEMORY[0x1E0D9FC18]();
}

uint64_t sirinluexternal::UserAcknowledged::makeReference(sirinluexternal::UserAcknowledged *this)
{
  return MEMORY[0x1E0D9FC20](this);
}

uint64_t sirinluexternal::UserAcknowledged::makeSystemDialogActId(sirinluexternal::UserAcknowledged *this)
{
  return MEMORY[0x1E0D9FC28](this);
}

uint64_t sirinluexternal::UserWantedToPause::makeReference(sirinluexternal::UserWantedToPause *this)
{
  return MEMORY[0x1E0D9FC30](this);
}

uint64_t sirinluexternal::UserWantedToRepeat::makeReference(sirinluexternal::UserWantedToRepeat *this)
{
  return MEMORY[0x1E0D9FC38](this);
}

uint64_t sirinluexternal::UserWantedToRepeat::makeSystemDialogActId(sirinluexternal::UserWantedToRepeat *this)
{
  return MEMORY[0x1E0D9FC40](this);
}

uint64_t sirinluexternal::UserWantedToProceed::makeReference(sirinluexternal::UserWantedToProceed *this)
{
  return MEMORY[0x1E0D9FC60](this);
}

uint64_t sirinluexternal::SystemDialogActGroup::makeSystemDialogAct(sirinluexternal::SystemDialogActGroup *this)
{
  return MEMORY[0x1E0D9FC88](this);
}

uint64_t sirinluexternal::SystemDialogActGroup::SystemDialogActGroup(sirinluexternal::SystemDialogActGroup *this)
{
  return MEMORY[0x1E0D9FC90](this);
}

void sirinluexternal::SystemDialogActGroup::~SystemDialogActGroup(sirinluexternal::SystemDialogActGroup *this)
{
  MEMORY[0x1E0D9FC98](this);
}

uint64_t sirinluexternal::SystemDialogActGroup::operator=()
{
  return MEMORY[0x1E0D9FCA0]();
}

uint64_t sirinluexternal::UUID::UUID(sirinluexternal::UUID *this)
{
  return MEMORY[0x1E0D9FCB0](this);
}

uint64_t sirinluexternal::UsoGraph::UsoGraph(sirinluexternal::UsoGraph *this, const UsoGraph *a2)
{
  return MEMORY[0x1E0D9FCB8](this, a2);
}

uint64_t sirinluexternal::UsoGraph::UsoGraph(sirinluexternal::UsoGraph *this)
{
  return MEMORY[0x1E0D9FCC0](this);
}

void sirinluexternal::UsoGraph::~UsoGraph(sirinluexternal::UsoGraph *this)
{
  MEMORY[0x1E0D9FCC8](this);
}

uint64_t sirinluexternal::NLContext::NLContext()
{
  return MEMORY[0x1E0D9FCD0]();
}

{
  return MEMORY[0x1E0D9FCD8]();
}

void sirinluexternal::NLContext::~NLContext(sirinluexternal::NLContext *this)
{
  MEMORY[0x1E0D9FCE0](this);
}

uint64_t sirinluexternal::NLContext::operator=()
{
  return MEMORY[0x1E0D9FCE8]();
}

uint64_t sirinluexternal::RequestID::RequestID()
{
  return MEMORY[0x1E0D9FCF0]();
}

void sirinluexternal::RequestID::~RequestID(sirinluexternal::RequestID *this)
{
  MEMORY[0x1E0D9FCF8](this);
}

uint64_t sirinluexternal::UserParse::makeParser(sirinluexternal::UserParse *this)
{
  return MEMORY[0x1E0D9FD00](this);
}

uint64_t sirinluexternal::UserParse::makeIdA(sirinluexternal::UserParse *this)
{
  return MEMORY[0x1E0D9FD08](this);
}

uint64_t sirinluexternal::UserParse::UserParse()
{
  return MEMORY[0x1E0D9FD10]();
}

uint64_t sirinluexternal::UserParse::UserParse(sirinluexternal::UserParse *this, const sirinluexternal::UserParse *a2)
{
  return MEMORY[0x1E0D9FD18](this, a2);
}

uint64_t sirinluexternal::UserParse::UserParse(sirinluexternal::UserParse *this)
{
  return MEMORY[0x1E0D9FD20](this);
}

uint64_t sirinluinternal::MatchingSpan::MatchingSpan()
{
  return MEMORY[0x1E0D9FD30]();
}

{
  return MEMORY[0x1E0D9FD38]();
}

uint64_t sirinluinternal::MatchingSpan::MatchingSpan(sirinluinternal::MatchingSpan *this)
{
  return MEMORY[0x1E0D9FD40](this);
}

void sirinluinternal::MatchingSpan::~MatchingSpan(sirinluinternal::MatchingSpan *this)
{
  MEMORY[0x1E0D9FD48](this);
}

uint64_t sirinluinternal::MatchingSpan::operator=()
{
  return MEMORY[0x1E0D9FD50]();
}

{
  return MEMORY[0x1E0D9FD58]();
}

uint64_t sirinluinternal::SubwordToken::SubwordToken()
{
  return MEMORY[0x1E0D9FD60]();
}

uint64_t sirinluinternal::SubwordToken::SubwordToken(sirinluinternal::SubwordToken *this)
{
  return MEMORY[0x1E0D9FD68](this);
}

void sirinluinternal::SubwordToken::~SubwordToken(sirinluinternal::SubwordToken *this)
{
  MEMORY[0x1E0D9FD70](this);
}

uint64_t sirinluinternal::SubwordTokenChain::SubwordTokenChain(sirinluinternal::SubwordTokenChain *this, const SubwordTokenChain *a2)
{
  return MEMORY[0x1E0D9FD88](this, a2);
}

uint64_t sirinluinternal::SubwordTokenChain::SubwordTokenChain(sirinluinternal::SubwordTokenChain *this)
{
  return MEMORY[0x1E0D9FD90](this);
}

void sirinluinternal::SubwordTokenChain::~SubwordTokenChain(sirinluinternal::SubwordTokenChain *this)
{
  MEMORY[0x1E0D9FD98](this);
}

uint64_t sirinluinternal::SubwordTokenChain::operator=()
{
  return MEMORY[0x1E0D9FDA0]();
}

{
  return MEMORY[0x1E0D9FDA8]();
}

uint64_t sirinluinternal::swap(sirinluinternal *this, sirinluinternal::MatchingSpan *a2, sirinluinternal::MatchingSpan *a3)
{
  return MEMORY[0x1E0D9FDC0](this, a2, a3);
}

uint64_t sirinluinternal::Token::Token(sirinluinternal::Token *this, const Token *a2)
{
  return MEMORY[0x1E0D9FDC8](this, a2);
}

void sirinluinternal::Token::~Token(sirinluinternal::Token *this)
{
  MEMORY[0x1E0D9FDD0](this);
}

uint64_t sirinluinternalssu::SSUResponse::SSUResponse(sirinluinternalssu::SSUResponse *this)
{
  return MEMORY[0x1E0D9FDD8](this);
}

uint64_t sirinluinternalssu::SSUEncodingResult::SSUEncodingResult(sirinluinternalssu::SSUEncodingResult *this)
{
  return MEMORY[0x1E0D9FDE0](this);
}

void sirinluinternalssu::SSUEncodingResult::~SSUEncodingResult(sirinluinternalssu::SSUEncodingResult *this)
{
  MEMORY[0x1E0D9FDE8](this);
}

uint64_t sirinluinternalitfm::ITFMHypothesis::ITFMHypothesis()
{
  return MEMORY[0x1E0D9FDF0]();
}

{
  return MEMORY[0x1E0D9FDF8]();
}

uint64_t sirinluinternalitfm::ITFMHypothesis::ITFMHypothesis(sirinluinternalitfm::ITFMHypothesis *this)
{
  return MEMORY[0x1E0D9FE00](this);
}

void sirinluinternalitfm::ITFMHypothesis::~ITFMHypothesis(sirinluinternalitfm::ITFMHypothesis *this)
{
  MEMORY[0x1E0D9FE08](this);
}

uint64_t sirinluinternalitfm::ITFMParserRequest::ITFMParserRequest(sirinluinternalitfm::ITFMParserRequest *this)
{
  return MEMORY[0x1E0D9FE10](this);
}

uint64_t sirinluinternalitfm::ITFMParserResponse::ITFMParserResponse()
{
  return MEMORY[0x1E0D9FE18]();
}

uint64_t sirinluinternalitfm::ITFMParserResponse::ITFMParserResponse(sirinluinternalitfm::ITFMParserResponse *this, const ITFMParserResponse *a2)
{
  return MEMORY[0x1E0D9FE20](this, a2);
}

uint64_t sirinluinternalitfm::ITFMParserResponse::ITFMParserResponse(sirinluinternalitfm::ITFMParserResponse *this)
{
  return MEMORY[0x1E0D9FE28](this);
}

void sirinluinternalitfm::ITFMParserResponse::~ITFMParserResponse(sirinluinternalitfm::ITFMParserResponse *this)
{
  MEMORY[0x1E0D9FE30](this);
}

uint64_t sirinluinternalitfm::ITFMParserResponse::operator=()
{
  return MEMORY[0x1E0D9FE38]();
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserResponse::NLv4ParserResponse(sirinluinternalnlv4_parser::NLv4ParserResponse *this)
{
  return MEMORY[0x1E0D9FE40](this);
}

uint64_t PB::Reader::Reader(PB::Reader *this, const unsigned __int8 *a2)
{
  return MEMORY[0x1E0D82F68](this, a2);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x1E0D82FF0](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
  MEMORY[0x1E0D82FF8](this);
}

uint64_t sirinluinternalsnlp_intermediate::ITFMAssetVersion::makeVersion(sirinluinternalsnlp_intermediate::ITFMAssetVersion *this)
{
  return MEMORY[0x1E0D9FE90](this);
}

uint64_t sirinluinternalsnlp_intermediate::ITFMAssetVersion::ITFMAssetVersion(sirinluinternalsnlp_intermediate::ITFMAssetVersion *this)
{
  return MEMORY[0x1E0D9FE98](this);
}

void sirinluinternalsnlp_intermediate::ITFMAssetVersion::~ITFMAssetVersion(sirinluinternalsnlp_intermediate::ITFMAssetVersion *this)
{
  MEMORY[0x1E0D9FEA0](this);
}

uint64_t sirinluinternalsnlp_intermediate::LinearizedTensor::LinearizedTensor(sirinluinternalsnlp_intermediate::LinearizedTensor *this)
{
  return MEMORY[0x1E0D9FEA8](this);
}

uint64_t sirinluinternalsnlp_intermediate::NLv4AssetVersion::makeVersion(sirinluinternalsnlp_intermediate::NLv4AssetVersion *this)
{
  return MEMORY[0x1E0D9FEB0](this);
}

uint64_t sirinluinternalsnlp_intermediate::NLv4AssetVersion::NLv4AssetVersion(sirinluinternalsnlp_intermediate::NLv4AssetVersion *this)
{
  return MEMORY[0x1E0D9FEB8](this);
}

void sirinluinternalsnlp_intermediate::NLv4AssetVersion::~NLv4AssetVersion(sirinluinternalsnlp_intermediate::NLv4AssetVersion *this)
{
  MEMORY[0x1E0D9FEC0](this);
}

uint64_t sirinluinternalsnlp_intermediate::SNLPAssetVersion::SNLPAssetVersion()
{
  return MEMORY[0x1E0D9FEC8]();
}

uint64_t sirinluinternalsnlp_intermediate::SNLPAssetVersion::SNLPAssetVersion(sirinluinternalsnlp_intermediate::SNLPAssetVersion *this)
{
  return MEMORY[0x1E0D9FED0](this);
}

void sirinluinternalsnlp_intermediate::SNLPAssetVersion::~SNLPAssetVersion(sirinluinternalsnlp_intermediate::SNLPAssetVersion *this)
{
  MEMORY[0x1E0D9FED8](this);
}

uint64_t sirinluinternalsnlp_intermediate::SNLPHandcraftedRules::SNLPHandcraftedRules()
{
  return MEMORY[0x1E0D9FEE0]();
}

uint64_t sirinluinternalsnlp_intermediate::SNLPHandcraftedRules::SNLPHandcraftedRules(sirinluinternalsnlp_intermediate::SNLPHandcraftedRules *this)
{
  return MEMORY[0x1E0D9FEE8](this);
}

void sirinluinternalsnlp_intermediate::SNLPHandcraftedRules::~SNLPHandcraftedRules(sirinluinternalsnlp_intermediate::SNLPHandcraftedRules *this)
{
  MEMORY[0x1E0D9FEF0](this);
}

uint64_t sirinluinternalsnlp_intermediate::SpanFeaturizerResponse::makeTensor(sirinluinternalsnlp_intermediate::SpanFeaturizerResponse *this)
{
  return MEMORY[0x1E0D9FEF8](this);
}

uint64_t sirinluinternalsnlp_intermediate::SpanFeaturizerResponse::SpanFeaturizerResponse(sirinluinternalsnlp_intermediate::SpanFeaturizerResponse *this)
{
  return MEMORY[0x1E0D9FF00](this);
}

uint64_t sirinluinternalsnlp_intermediate::ContextFeaturizerResponse::makeTensor(sirinluinternalsnlp_intermediate::ContextFeaturizerResponse *this)
{
  return MEMORY[0x1E0D9FF08](this);
}

uint64_t sirinluinternalsnlp_intermediate::ContextFeaturizerResponse::ContextFeaturizerResponse(sirinluinternalsnlp_intermediate::ContextFeaturizerResponse *this)
{
  return MEMORY[0x1E0D9FF10](this);
}

uint64_t sirinluinternalsnlp_intermediate::ITFMSpanFeaturizerResponse::makeResponse(sirinluinternalsnlp_intermediate::ITFMSpanFeaturizerResponse *this)
{
  return MEMORY[0x1E0D9FF18](this);
}

uint64_t sirinluinternalsnlp_intermediate::ITFMSpanFeaturizerResponse::ITFMSpanFeaturizerResponse(sirinluinternalsnlp_intermediate::ITFMSpanFeaturizerResponse *this)
{
  return MEMORY[0x1E0D9FF20](this);
}

void sirinluinternalsnlp_intermediate::ITFMSpanFeaturizerResponse::~ITFMSpanFeaturizerResponse(sirinluinternalsnlp_intermediate::ITFMSpanFeaturizerResponse *this)
{
  MEMORY[0x1E0D9FF28](this);
}

uint64_t sirinluinternalsnlp_intermediate::NLv4SpanFeaturizerResponse::makeResponse(sirinluinternalsnlp_intermediate::NLv4SpanFeaturizerResponse *this)
{
  return MEMORY[0x1E0D9FF30](this);
}

uint64_t sirinluinternalsnlp_intermediate::NLv4SpanFeaturizerResponse::NLv4SpanFeaturizerResponse(sirinluinternalsnlp_intermediate::NLv4SpanFeaturizerResponse *this)
{
  return MEMORY[0x1E0D9FF38](this);
}

void sirinluinternalsnlp_intermediate::NLv4SpanFeaturizerResponse::~NLv4SpanFeaturizerResponse(sirinluinternalsnlp_intermediate::NLv4SpanFeaturizerResponse *this)
{
  MEMORY[0x1E0D9FF40](this);
}

uint64_t sirinluinternalsnlp_intermediate::ITFMExecutedHandcraftedRules::makeRules(sirinluinternalsnlp_intermediate::ITFMExecutedHandcraftedRules *this)
{
  return MEMORY[0x1E0D9FF48](this);
}

uint64_t sirinluinternalsnlp_intermediate::ITFMExecutedHandcraftedRules::ITFMExecutedHandcraftedRules(sirinluinternalsnlp_intermediate::ITFMExecutedHandcraftedRules *this)
{
  return MEMORY[0x1E0D9FF50](this);
}

void sirinluinternalsnlp_intermediate::ITFMExecutedHandcraftedRules::~ITFMExecutedHandcraftedRules(sirinluinternalsnlp_intermediate::ITFMExecutedHandcraftedRules *this)
{
  MEMORY[0x1E0D9FF58](this);
}

uint64_t sirinluinternalsnlp_intermediate::NLv4ExecutedHandcraftedRules::makeRules(sirinluinternalsnlp_intermediate::NLv4ExecutedHandcraftedRules *this)
{
  return MEMORY[0x1E0D9FF60](this);
}

uint64_t sirinluinternalsnlp_intermediate::NLv4ExecutedHandcraftedRules::NLv4ExecutedHandcraftedRules(sirinluinternalsnlp_intermediate::NLv4ExecutedHandcraftedRules *this)
{
  return MEMORY[0x1E0D9FF68](this);
}

void sirinluinternalsnlp_intermediate::NLv4ExecutedHandcraftedRules::~NLv4ExecutedHandcraftedRules(sirinluinternalsnlp_intermediate::NLv4ExecutedHandcraftedRules *this)
{
  MEMORY[0x1E0D9FF70](this);
}

uint64_t sirinluinternalsnlp_intermediate::ITFMContextFeaturizerResponse::makeResponse(sirinluinternalsnlp_intermediate::ITFMContextFeaturizerResponse *this)
{
  return MEMORY[0x1E0D9FF78](this);
}

uint64_t sirinluinternalsnlp_intermediate::ITFMContextFeaturizerResponse::ITFMContextFeaturizerResponse(sirinluinternalsnlp_intermediate::ITFMContextFeaturizerResponse *this)
{
  return MEMORY[0x1E0D9FF80](this);
}

void sirinluinternalsnlp_intermediate::ITFMContextFeaturizerResponse::~ITFMContextFeaturizerResponse(sirinluinternalsnlp_intermediate::ITFMContextFeaturizerResponse *this)
{
  MEMORY[0x1E0D9FF88](this);
}

uint64_t sirinluinternalsnlp_intermediate::NLv4ContextFeaturizerResponse::makeResponse(sirinluinternalsnlp_intermediate::NLv4ContextFeaturizerResponse *this)
{
  return MEMORY[0x1E0D9FF90](this);
}

uint64_t sirinluinternalsnlp_intermediate::NLv4ContextFeaturizerResponse::NLv4ContextFeaturizerResponse(sirinluinternalsnlp_intermediate::NLv4ContextFeaturizerResponse *this)
{
  return MEMORY[0x1E0D9FF98](this);
}

void sirinluinternalsnlp_intermediate::NLv4ContextFeaturizerResponse::~NLv4ContextFeaturizerResponse(sirinluinternalsnlp_intermediate::NLv4ContextFeaturizerResponse *this)
{
  MEMORY[0x1E0D9FFA0](this);
}

uint64_t E5RT::E5Compiler::GetCompiler(E5RT::E5Compiler *this)
{
  return MEMORY[0x1E0D1F570](this);
}

uint64_t E5RT::E5Compiler::Compile()
{
  return MEMORY[0x1E0D1F588]();
}

uint64_t E5RT::BufferObject::AllocMemory()
{
  return MEMORY[0x1E0D1F590]();
}

uint64_t E5RT::BufferObject::GetDataSpan(E5RT::BufferObject *this)
{
  return MEMORY[0x1E0D1F598](this);
}

uint64_t E5RT::MemoryObject::TryAsBuffer(E5RT::MemoryObject *this)
{
  return MEMORY[0x1E0D1F5A0](this);
}

uint64_t E5RT::ProgramLibrary::GetExportedFunctions(E5RT::ProgramLibrary *this)
{
  return MEMORY[0x1E0D1F5B0](this);
}

uint64_t E5RT::TensorDataType::TensorDataType()
{
  return MEMORY[0x1E0D1F5B8]();
}

void E5RT::TensorDataType::~TensorDataType(E5RT::TensorDataType *this)
{
  MEMORY[0x1E0D1F5C0](this);
}

uint64_t E5RT::ExecutionStream::ResetStream(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1E0D1F5C8](this);
}

uint64_t E5RT::ExecutionStream::EncodeOperation()
{
  return MEMORY[0x1E0D1F5D0]();
}

uint64_t E5RT::ExecutionStream::ExecuteStreamSync(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1E0D1F5D8](this);
}

uint64_t E5RT::ExecutionStream::CreateExecutionStream(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1E0D1F5E0](this);
}

uint64_t E5RT::TensorDescriptor::CreateTensorDesc()
{
  return MEMORY[0x1E0D1F5E8]();
}

uint64_t E5RT::E5CompilerOptions::SetForceRecompilation(E5RT::E5CompilerOptions *this)
{
  return MEMORY[0x1E0D1F5F8](this);
}

uint64_t E5RT::E5CompilerOptions::SetForceFetchFromCache(E5RT::E5CompilerOptions *this)
{
  return MEMORY[0x1E0D1F600](this);
}

uint64_t E5RT::E5CompilerOptions::SetPreferredCpuBackend()
{
  return MEMORY[0x1E0D1F608]();
}

uint64_t E5RT::E5CompilerOptions::SetComputeDeviceTypesAllowed()
{
  return MEMORY[0x1E0D1F610]();
}

uint64_t E5RT::E5CompilerOptions::SetEnableReshapeWithMinimalAllocations(E5RT::E5CompilerOptions *this)
{
  return MEMORY[0x1E0D1F618](this);
}

uint64_t E5RT::E5CompilerOptions::Create(E5RT::E5CompilerOptions *this)
{
  return MEMORY[0x1E0D1F620](this);
}

uint64_t E5RT::ExecutionStreamOperation::ReshapeOperation()
{
  return MEMORY[0x1E0D1F658]();
}

uint64_t E5RT::ExecutionStreamOperation::CreatePreCompiledComputeOp()
{
  return MEMORY[0x1E0D1F660]();
}

{
  return MEMORY[0x1E0D1F668]();
}

uint64_t E5RT::PrecompiledComputeOpCreateOptions::Create()
{
  return MEMORY[0x1E0D1F678]();
}

uint64_t E5RT::IOPort::GetMemoryObject(E5RT::IOPort *this)
{
  return MEMORY[0x1E0D1F680](this);
}

uint64_t E5RT::IOPort::BindMemoryObject()
{
  return MEMORY[0x1E0D1F688]();
}

uint64_t siri::ontology::UsoGraphNode::setSuccessor()
{
  return MEMORY[0x1E0DA2E18]();
}

uint64_t siri::ontology::UsoEntityNode::addIdentifier()
{
  return MEMORY[0x1E0DA2E28]();
}

{
  return MEMORY[0x1E0DA2E30]();
}

uint64_t siri::ontology::UsoEntityNode::addUtteranceAlignment()
{
  return MEMORY[0x1E0DA2E38]();
}

{
  return MEMORY[0x1E0DA2E48]();
}

uint64_t siri::ontology::UsoEntityNode::addUtteranceAlignment(siri::ontology::UsoEntityNode *this)
{
  return MEMORY[0x1E0DA2E40](this);
}

uint64_t siri::ontology::UsoVocabManager::createCustomEdgeName()
{
  return MEMORY[0x1E0DA2E60]();
}

uint64_t siri::ontology::UsoVocabManager::createCustomVerbName()
{
  return MEMORY[0x1E0DA2E68]();
}

uint64_t siri::ontology::UsoVocabManager::createCustomEntityName()
{
  return MEMORY[0x1E0DA2E70]();
}

uint64_t siri::ontology::UsoGraphProtoReader::fromProtobuf(siri::ontology::UsoGraphProtoReader *this, const sirinluexternal::UsoGraph *a2)
{
  return MEMORY[0x1E0D9FFA8](this, a2);
}

uint64_t siri::ontology::UsoGraphProtoReader::fromProtobuf(siri::ontology::UsoGraphProtoReader *this, const sirinluexternal::UsoGraph *a2, UsoGraph *a3)
{
  return MEMORY[0x1E0D9FFB0](this, a2, a3);
}

uint64_t siri::ontology::UsoGraphProtoWriter::toProtobuf(siri::ontology::UsoGraphProtoWriter *this, const UsoGraph *a2)
{
  return MEMORY[0x1E0D9FFB8](this, a2);
}

uint64_t siri::ontology::UsoGraphProtoWriter::toProtobuf()
{
  return MEMORY[0x1E0D9FFC0]();
}

uint64_t siri::ontology::getSharedUsoVocabManager(siri::ontology *this)
{
  return MEMORY[0x1E0DA2E88](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_at(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2EA0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Date(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2EA8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Time(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2EB0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_end(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2EB8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Agent(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2EC0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Group(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2ED0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_date(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2EF0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_hour(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2EF8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_name(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F00](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_task(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F08](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_time(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F10](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_unit(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F20](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_year(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F28](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Number(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F30](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Person(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F38](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_label(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F48](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_start(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F58](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_value(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F60](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Integer(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F68](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_entity(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F78](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_minute(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F80](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_second(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F88](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTime(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F98](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Duration(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2FA0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Meridiem(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2FA8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_TimeUnit(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2FB0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_payload(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2FC8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AppEntity(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2FD0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DayOfWeek(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2FD8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Time_Noon(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2FE8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_meridiem(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2FF8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Date_Today(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3008](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_appEntity(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3020](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_dayOfWeek(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3028](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_direction(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3030](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_qualifier(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3038](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_reference(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3040](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Meridiem_AM(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3048](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Meridiem_PM(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3050](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MonthOfYear(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3058](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_PhoneNumber(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3060](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_components(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3068](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_dayOfMonth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3070](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_weekOfYear(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3080](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTime_Now(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3090](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_EmailAddress(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3098](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA30A0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_TimeUnit_Day(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA30B8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_VoiceCommand(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA30C0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_monthOfYear(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA30C8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_occurringIn(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA30D0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_offsetValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA30D8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_stringValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA30E0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRange(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA30F0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Date_Tomorrow(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA30F8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MixedFraction(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3108](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_TimeUnit_Hour(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3118](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_TimeUnit_Week(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3120](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_TimeUnit_Year(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3128](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Time_Midnight(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3130](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_definedValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3138](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_integerValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3140](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ContactAddress(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3148](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Date_Yesterday(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3150](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_OffsetDateTime(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3158](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_TimeUnit_Month(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3160](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MonthOfYear_May(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3180](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_OffsetDirection(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3188](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Time12HourClock(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3190](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Time24HourClock(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3198](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_TimeUnit_Minute(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA31A0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_TimeUnit_Second(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA31A8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_numeratorValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA31B0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DayOfWeek_Friday(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA31B8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DayOfWeek_Monday(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA31C0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DayOfWeek_Sunday(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA31C8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MonthOfYear_July(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA31D0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MonthOfYear_June(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA31D8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_offsetReference(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA31E0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_usoListPosition(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA31E8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DayOfWeek_Tuesday(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA31F0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DurationComponent(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA31F8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Last(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3200](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Next(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3208](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MonthOfYear_April(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3210](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MonthOfYear_March(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3218](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_RecurringDateTime(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3220](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_denominatorValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3228](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_recurrencePeriod(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3230](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DayOfWeek_Saturday(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3238](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DayOfWeek_Thursday(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3240](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Fifth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3248](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_First(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3250](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Ninth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3258](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Sixth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3260](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Tenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3268](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Third(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3270](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MonthOfYear_August(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3280](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRange_Night(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3288](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DayOfWeek_Wednesday(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3290](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Eighth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3298](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Fourth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA32A0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Second(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA32A8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MonthOfYear_January(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA32C0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MonthOfYear_October(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA32C8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Number_MaximumValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA32D0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Number_MinimumValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA32D8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_VoiceCommandPayload(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA32E0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRange_Autumn(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA32E8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRange_Spring(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA32F0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRange_Summer(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA32F8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRange_Winter(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3300](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Current(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3308](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Seventh(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3310](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Twelfth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3318](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MonthOfYear_December(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3328](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MonthOfYear_February(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3330](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MonthOfYear_November(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3338](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_recurrenceDateTimes(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3348](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRange_Daytime(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3350](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRange_Evening(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3358](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRange_Morning(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3360](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRange_Weekend(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3368](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Date_DayAfterTomorrow(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3370](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Eleventh(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3378](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Previous(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3380](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MonthOfYear_September(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3388](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_OffsetDirection_After(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3390](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_TimeUnit_SeasonOfYear(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3398](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRangeQualifier(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA33A0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRange_Workweek(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA33A8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Fifteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA33B0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Sixteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA33B8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Twentieth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA33C0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_OffsetDirection_Before(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA33C8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_TimeUnit_QuarterOfYear(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA33D0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRange_Afternoon(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA33D8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRange_LunchTime(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA33E0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Date_DayBeforeYesterday(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA33E8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Eighteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA33F0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Fourteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA33F8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Nineteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3400](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Thirteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3408](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRange_BrunchTime(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3410](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRange_DinnerTime(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3418](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Seventeenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3420](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentyFifth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3428](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentyFirst(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3430](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentyThird(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3438](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::ReferenceNumberTrigger_setNumber(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3440](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentyFourth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3448](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentySecond(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3450](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_specifyingContactAddress(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3458](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::ReferenceNumberTrigger_decreaseBy(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3460](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::ReferenceNumberTrigger_increaseBy(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3468](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRange_BreakfastTime(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3470](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::ReferenceVoiceCommandPayload_execute(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3478](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRangeQualifier_RestOf(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3480](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRangeQualifier_StartOf(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3488](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRangeQualifier_MiddleOf(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3490](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTimeRangeQualifier_EarlierPartOf(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3498](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Root(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA34A0](this);
}

uint64_t siri::ontology::UsoGraph::createIntNode()
{
  return MEMORY[0x1E0DA34A8]();
}

uint64_t siri::ontology::UsoGraph::createTaskNode()
{
  return MEMORY[0x1E0DA34B0]();
}

uint64_t siri::ontology::UsoGraph::createEntityNode()
{
  return MEMORY[0x1E0DA34B8]();
}

uint64_t siri::ontology::UsoGraph::createStringNode()
{
  return MEMORY[0x1E0DA34C0]();
}

uint64_t siri::ontology::UsoGraph::createOperatorNode()
{
  return MEMORY[0x1E0DA34C8]();
}

uint64_t siri::ontology::UsoGraph::UsoGraph()
{
  return MEMORY[0x1E0DA34D0]();
}

{
  return MEMORY[0x1E0DA34D8]();
}

void siri::ontology::UsoGraph::~UsoGraph(siri::ontology::UsoGraph *this)
{
  MEMORY[0x1E0DA34E0](this);
}

uint64_t siri::ontology::operator==()
{
  return MEMORY[0x1E0DA34E8]();
}

uint64_t siri::ontology::operator!=()
{
  return MEMORY[0x1E0DA34F0]();
}

uint64_t boost::archive::text_iarchive_impl<boost::archive::text_iarchive>::init()
{
  return __ZN5boost7archive18text_iarchive_implINS0_13text_iarchiveEE4initEv();
}

uint64_t morphun::util::StringUtils::to_string()
{
  return MEMORY[0x1E0DE73C0]();
}

uint64_t sirinluinternal::SubwordTokenChain::writeTo(sirinluinternal::SubwordTokenChain *this, PB::Writer *a2)
{
  return MEMORY[0x1E0D9FFD8](this, a2);
}

uint64_t sirinluinternalitfm::ITFMParserResponse::writeTo(sirinluinternalitfm::ITFMParserResponse *this, PB::Writer *a2)
{
  return MEMORY[0x1E0D9FFE0](this, a2);
}

uint64_t E5RT::TensorDataType::GetComponentPack(E5RT::TensorDataType *this)
{
  return MEMORY[0x1E0D1F758](this);
}

uint64_t E5RT::TensorDataType::GetComponentDataType(E5RT::TensorDataType *this)
{
  return MEMORY[0x1E0D1F760](this);
}

uint64_t E5RT::TensorDescriptor::GetNumElements(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x1E0D1F780](this);
}

uint64_t E5RT::TensorDescriptor::GetTensorShape(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x1E0D1F788](this);
}

uint64_t E5RT::TensorDescriptor::GetTensorDataType(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x1E0D1F790](this);
}

uint64_t E5RT::TensorDescriptor::GetRank(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x1E0D1F7A0](this);
}

uint64_t E5RT::TensorDescriptor::GetSize(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x1E0D1F7A8](this);
}

uint64_t E5RT::OperandDescriptor::TensorDescriptor(E5RT::OperandDescriptor *this)
{
  return MEMORY[0x1E0D1F7B0](this);
}

uint64_t E5RT::OperandDescriptor::TryAsTensorDescriptor(E5RT::OperandDescriptor *this)
{
  return MEMORY[0x1E0D1F7C0](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetInputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x1E0D1F7D0](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetOutputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x1E0D1F7D8](this);
}

uint64_t E5RT::IOPort::GetPortDescriptor(E5RT::IOPort *this)
{
  return MEMORY[0x1E0D1F7E0](this);
}

uint64_t E5RT::Status::GetErrorCode(E5RT::Status *this)
{
  return MEMORY[0x1E0D1F7F0](this);
}

uint64_t E5RT::E5RTError::GetStatus(E5RT::E5RTError *this)
{
  return MEMORY[0x1E0D1F800](this);
}

uint64_t siri::ontology::UsoEntityNode::getIdentifiers(siri::ontology::UsoEntityNode *this)
{
  return MEMORY[0x1E0DA3500](this);
}

uint64_t siri::ontology::UsoEntityNode::getUtteranceAlignment(siri::ontology::UsoEntityNode *this)
{
  return MEMORY[0x1E0DA3508](this);
}

uint64_t siri::ontology::UsoVocabManager::getEdgeName()
{
  return MEMORY[0x1E0DA3520]();
}

uint64_t siri::ontology::UsoVocabManager::getNodeName()
{
  return MEMORY[0x1E0DA3530]();
}

uint64_t siri::ontology::UsoVocabManager::getVerbName()
{
  return MEMORY[0x1E0DA3540]();
}

uint64_t siri::ontology::UsoUtteranceAlignment::getSpans(siri::ontology::UsoUtteranceAlignment *this)
{
  return MEMORY[0x1E0DA3550](this);
}

uint64_t siri::ontology::UsoGraph::prettyPrint()
{
  return MEMORY[0x1E0DA3558]();
}

uint64_t siri::ontology::UsoGraph::prettyPrint(siri::ontology::UsoGraph *this)
{
  return MEMORY[0x1E0DA3560](this);
}

uint64_t siri::ontology::UsoGraph::getSuccessors(siri::ontology::UsoGraph *this, const UsoGraphNode *a2)
{
  return MEMORY[0x1E0DA3568](this, a2);
}

uint64_t siri::ontology::UsoGraph::getSuccessors()
{
  return MEMORY[0x1E0DA3570]();
}

uint64_t siri::ontology::UsoGraph::deepCopyToGraph(siri::ontology::UsoGraph *this, const UsoGraphNode *a2, siri::ontology::UsoGraph *a3)
{
  return MEMORY[0x1E0DA3578](this, a2, a3);
}

uint64_t siri::ontology::UsoGraph::getSuccessorsWithEdges(siri::ontology::UsoGraph *this, const UsoGraphNode *a2)
{
  return MEMORY[0x1E0DA3580](this, a2);
}

uint64_t siri::ontology::UsoGraph::getPredecessorsWithEdges(siri::ontology::UsoGraph *this, const UsoGraphNode *a2)
{
  return MEMORY[0x1E0DA3588](this, a2);
}

uint64_t siri::ontology::UsoGraph::getNodes(siri::ontology::UsoGraph *this)
{
  return MEMORY[0x1E0DA3598](this);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x1E0DE4190](this);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1E0DE41C8](this, __c, __pos);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1E0DE41D8](this, __s);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::directory_iterator::__dereference(const std::__fs::filesystem::directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x1E0DE41F8](this);
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::recursive_directory_iterator::__dereference(const std::__fs::filesystem::recursive_directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x1E0DE4200](this);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4208](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__extension(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4210](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4218](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4220](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

int std::__fs::filesystem::path::__compare(const std::__fs::filesystem::path *this, std::__fs::filesystem::path::__string_view a2)
{
  return MEMORY[0x1E0DE4238](this, a2.__data_, a2.__size_);
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x1E0DE4240](retstr, this);
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

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4290](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1E0DE4320](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4310](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1E0DE4328](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4318](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1E0DE4330](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x1E0DE4338](this);
}

{
  MEMORY[0x1E0DE4340](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x1E0DE43B0](this, *(_QWORD *)&__ecode);
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

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1E0DE4438](this, __n, __c);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4448](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4468](this, __pos, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x1E0DE4490](this, __pos, __n1, __s, __n2);
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

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1E0DE44E0](this, __c);
}

void std::wstring::resize(std::wstring *this, std::wstring::size_type __n, std::wstring::value_type __c)
{
  MEMORY[0x1E0DE4508](this, __n, *(_QWORD *)&__c);
}

std::system_error *__cdecl std::system_error::system_error(std::system_error *this, std::error_code __ec, const std::string *__what_arg)
{
  return (std::system_error *)MEMORY[0x1E0DE4578](this, *(_QWORD *)&__ec.__val_, __ec.__cat_, __what_arg);
}

void std::system_error::~system_error(std::system_error *this)
{
  MEMORY[0x1E0DE4588](this);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1E0DE4590]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x1E0DE4598]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1E0DE45A8]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1E0DE45B0]();
}

uint64_t std::istream::get()
{
  return MEMORY[0x1E0DE45C0]();
}

uint64_t std::istream::peek()
{
  return MEMORY[0x1E0DE45C8]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x1E0DE45D0]();
}

uint64_t std::istream::sync()
{
  return MEMORY[0x1E0DE45D8]();
}

uint64_t std::istream::ignore()
{
  return MEMORY[0x1E0DE4600]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1E0DE4608]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1E0DE4628]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x1E0DE4630]();
}

{
  return MEMORY[0x1E0DE4640]();
}

{
  return MEMORY[0x1E0DE4648]();
}

{
  return MEMORY[0x1E0DE4650]();
}

{
  return MEMORY[0x1E0DE4658]();
}

{
  return MEMORY[0x1E0DE4660]();
}

{
  return MEMORY[0x1E0DE4668]();
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

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46D0]();
}

{
  return MEMORY[0x1E0DE46E0]();
}

{
  return MEMORY[0x1E0DE46E8]();
}

{
  return MEMORY[0x1E0DE46F8]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4718]();
}

{
  return MEMORY[0x1E0DE4720]();
}

{
  return MEMORY[0x1E0DE4728]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x1E0DE4770](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
  MEMORY[0x1E0DE4778](this);
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x1E0DE4780](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x1E0DE47C8](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
  MEMORY[0x1E0DE4820](this);
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
  MEMORY[0x1E0DE4828](this);
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x1E0DE4838](this);
}

void std::recursive_mutex::~recursive_mutex(std::recursive_mutex *this)
{
  MEMORY[0x1E0DE4840](this);
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x1E0DE4848]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x1E0DE4910](retstr, __s);
}

uintmax_t std::__fs::filesystem::__remove_all(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return MEMORY[0x1E0DE4980](a1, __ec);
}

void std::__fs::filesystem::filesystem_error::__create_what(std::__fs::filesystem::filesystem_error *this, int __num_paths)
{
  MEMORY[0x1E0DE49B0](this, *(_QWORD *)&__num_paths);
}

BOOL std::__fs::filesystem::__create_directory(const std::__fs::filesystem::path *a1, std::error_code *a2)
{
  return MEMORY[0x1E0DE49D8](a1, a2);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::__increment(std::__fs::filesystem::directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x1E0DE49F0](this, __ec);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::directory_iterator(std::__fs::filesystem::directory_iterator *this, const std::__fs::filesystem::path *a2, std::error_code *a3, std::__fs::filesystem::directory_options a4)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x1E0DE49F8](this, a2, a3, a4);
}

BOOL std::__fs::filesystem::__create_directories(const std::__fs::filesystem::path *a1, std::error_code *a2)
{
  return MEMORY[0x1E0DE4A00](a1, a2);
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::__increment(std::__fs::filesystem::recursive_directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::recursive_directory_iterator *)MEMORY[0x1E0DE4A10](this, __ec);
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::recursive_directory_iterator(std::__fs::filesystem::recursive_directory_iterator *this, const std::__fs::filesystem::path *__p, std::__fs::filesystem::directory_options __opt, std::error_code *__ec)
{
  return (std::__fs::filesystem::recursive_directory_iterator *)MEMORY[0x1E0DE4A18](this, __p, __opt, __ec);
}

BOOL std::__fs::filesystem::__remove(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return MEMORY[0x1E0DE4A38](a1, __ec);
}

void std::__fs::filesystem::__rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0DE4A40](__from, __to, __ec);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x1E0DE4A48](a1, __ec);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1E0DE4A78](__str, __idx, *(_QWORD *)&__base);
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

unint64_t std::stoul(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1E0DE4AC8](__str, __idx, *(_QWORD *)&__base);
}

uint64_t std::__sort<std::__less<char,char> &,char *>()
{
  return MEMORY[0x1E0DE4AD8]();
}

uint64_t std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>()
{
  return MEMORY[0x1E0DE4B10]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x1E0DE4B38]();
}

void std::locale::__install_ctor(std::locale *this, const std::locale *a2, std::locale::facet *a3, uint64_t a4)
{
  MEMORY[0x1E0DE4B68](this, a2, a3, a4);
}

uint64_t std::locale::id::__get(std::locale::id *this)
{
  return MEMORY[0x1E0DE4B70](this);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x1E0DE4B88](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x1E0DE4B90](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

const std::locale *__cdecl std::locale::operator=(std::locale *this, const std::locale *a2)
{
  return (const std::locale *)MEMORY[0x1E0DE4BA0](this, a2);
}

void std::codecvt<char,char,__mbstate_t>::~codecvt(std::codecvt<char, char, mbstate_t> *this)
{
  MEMORY[0x1E0DE4BF0](this);
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

std::locale std::ios_base::imbue(std::ios_base *this, const std::locale *__loc)
{
  return (std::locale)MEMORY[0x1E0DE4C88](this, __loc);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x1E0DE4D40](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x1E0DE4D50](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D60](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D70](retstr, __val);
}

{
  return (std::string *)MEMORY[0x1E0DE4D80](retstr, __val);
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

int std::uncaught_exceptions(void)
{
  return MEMORY[0x1E0DE4E08]();
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E7BE56C0();
}

void operator delete(void *__p)
{
  off_1E7BE56C8(__p);
}

void operator delete(void *__p, std::align_val_t a2)
{
  off_1E7BE56D0(__p, a2);
}

uint64_t operator delete()
{
  return off_1E7BE56D8();
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_1E7BE56E0(__sz);
}

uint64_t operator new[]()
{
  return off_1E7BE56E8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E7BE56F0(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E7BE56F8(__sz, a2);
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  return (void *)off_1E7BE5700(__sz, a2);
}

uint64_t operator new()
{
  return off_1E7BE5708();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_cast(void)
{
  MEMORY[0x1E0DE5070]();
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

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void cblas_sgemv(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const int __M, const int __N, const float __alpha, const float *__A, const int __lda, const float *__X, const int __incX, const float __beta, float *__Y, const int __incY)
{
  MEMORY[0x1E0C8BC20](*(_QWORD *)&__Order, *(_QWORD *)&__TransA, *(_QWORD *)&__M, *(_QWORD *)&__N, __A, *(_QWORD *)&__lda, __X, *(_QWORD *)&__incX, __alpha, __beta);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x1E0D1FEE8]();
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x1E0D1FF00]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1E0D1FF10]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1E0D1FF38]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1E0D1FF40]();
}

uint64_t espresso_get_input_blob_name()
{
  return MEMORY[0x1E0D1FF90]();
}

uint64_t espresso_get_output_blob_name()
{
  return MEMORY[0x1E0D1FFA8]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1E0D1FFB8]();
}

uint64_t espresso_network_change_input_blob_shapes_seq_rank()
{
  return MEMORY[0x1E0D20028]();
}

uint64_t espresso_network_query_blob_shape()
{
  return MEMORY[0x1E0D20070]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1E0D200B0]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1E0D200C8]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x1E0D200D8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1E0D200E8]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1E0D20100]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

long double expm1(long double __x)
{
  long double result;

  MEMORY[0x1E0C832A0](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x1E0C83B98]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

float log1pf(float a1)
{
  float result;

  MEMORY[0x1E0C83BD8](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int openat_authenticated_np(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1E0C844A8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1E0C85550](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x1E0C85618](a1, a2);
  return result;
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

const char *__cdecl u_errorName(UErrorCode code)
{
  return (const char *)MEMORY[0x1E0DE5988](*(_QWORD *)&code);
}

UBool u_isspace(UChar32 c)
{
  return MEMORY[0x1E0DE5A50](*(_QWORD *)&c);
}

int32_t u_strCaseCompare(const UChar *s1, int32_t length1, const UChar *s2, int32_t length2, uint32_t options, UErrorCode *pErrorCode)
{
  return MEMORY[0x1E0DE5A80](s1, *(_QWORD *)&length1, s2, *(_QWORD *)&length2, *(_QWORD *)&options, pErrorCode);
}

int32_t u_strFoldCase(UChar *dest, int32_t destCapacity, const UChar *src, int32_t srcLength, uint32_t options, UErrorCode *pErrorCode)
{
  return MEMORY[0x1E0DE5A90](dest, *(_QWORD *)&destCapacity, src, *(_QWORD *)&srcLength, *(_QWORD *)&options, pErrorCode);
}

UChar *__cdecl u_strcpy(UChar *dst, const UChar *src)
{
  return (UChar *)MEMORY[0x1E0DE5AE8](dst, src);
}

int32_t u_strlen(const UChar *s)
{
  return MEMORY[0x1E0DE5AF8](s);
}

UChar *__cdecl u_strncpy(UChar *dst, const UChar *src, int32_t n)
{
  return (UChar *)MEMORY[0x1E0DE5B00](dst, src, *(_QWORD *)&n);
}

UChar *__cdecl u_strtok_r(UChar *src, const UChar *delim, UChar **saveState)
{
  return (UChar *)MEMORY[0x1E0DE5B08](src, delim, saveState);
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

void uregex_close(URegularExpression *regexp)
{
  MEMORY[0x1E0DE6710](regexp);
}

UBool uregex_find(URegularExpression *regexp, int32_t startIndex, UErrorCode *status)
{
  return MEMORY[0x1E0DE6728](regexp, *(_QWORD *)&startIndex, status);
}

int32_t uregex_group(URegularExpression *regexp, int32_t groupNum, UChar *dest, int32_t destCapacity, UErrorCode *status)
{
  return MEMORY[0x1E0DE6738](regexp, *(_QWORD *)&groupNum, dest, *(_QWORD *)&destCapacity, status);
}

URegularExpression *__cdecl uregex_openC(const char *pattern, uint32_t flags, UParseError *pe, UErrorCode *status)
{
  return (URegularExpression *)MEMORY[0x1E0DE6770](pattern, *(_QWORD *)&flags, pe, status);
}

void uregex_setText(URegularExpression *regexp, const UChar *text, int32_t textLength, UErrorCode *status)
{
  MEMORY[0x1E0DE67B0](regexp, text, *(_QWORD *)&textLength, status);
}

size_t wcslen(const __int32 *a1)
{
  return MEMORY[0x1E0C85C20](a1);
}

