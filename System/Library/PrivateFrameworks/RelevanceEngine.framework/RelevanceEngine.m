uint64_t BayesianModel::LoadModel(uint64_t a1, const std::string *a2, int a3)
{
  const std::locale::facet *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  char KeyValueDouble;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  int v23;
  const std::locale::facet *v24;
  unsigned __int8 v25;
  _QWORD *v26;
  std::locale::__imp *v27;
  __int128 v28;
  uint64_t v29;
  uint64_t i;
  unint64_t v31;
  const char *v32;
  const char *v33;
  double v34;
  char v35;
  const char *locale;
  double v37;
  double v38;
  char *v39;
  char *v40;
  int v41;
  uint64_t v42;
  double v43;
  double *j;
  double v45;
  double v46;
  double v47;
  char *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  void *__p[2];
  char v56;
  void *v57[2];
  char v58;
  void *v59[2];
  char v60;
  void *v61[2];
  char v62;
  void *v63[2];
  char v64;
  char *__endptr[2];
  char v66;
  std::locale v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  int v77;
  int v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[13];
  char v83;
  uint64_t v84;

  pthread_rwlock_wrlock((pthread_rwlock_t *)a1);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](v82, a2, 24);
  v79 = 0;
  v80 = 0;
  v81 = 0;
  v78 = 1;
  v77 = 0;
  v75 = 0;
  v76 = 0;
  v73 = 0x3FF0000000000000;
  v74 = 0;
  v72 = 0x3FF0000000000000;
  v70 = 0u;
  v69 = 0u;
  v71 = 1065353216;
  std::ios_base::getloc((const std::ios_base *)((char *)v82 + *(_QWORD *)(v82[0] - 24)));
  v6 = std::locale::use_facet(&v67, MEMORY[0x24BEDB350]);
  LOBYTE(a2) = ((uint64_t (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 10);
  std::locale::~locale(&v67);
  v7 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v82, (uint64_t)&v79, a2);
  if ((*((_BYTE *)v7 + *(_QWORD *)(*v7 - 24) + 32) & 5) == 0)
  {
    if (SHIBYTE(v81) < 0)
    {
      if (v80 != 15)
        goto LABEL_90;
      v16 = (uint64_t *)v79;
    }
    else
    {
      if (SHIBYTE(v81) != 15)
        goto LABEL_90;
      v16 = (uint64_t *)&v79;
    }
    v17 = *v16;
    v18 = *(uint64_t *)((char *)v16 + 7);
    if (v17 != 0x6665446C65646F4DLL || v18 != 0x6E6F6974696E6966)
      goto LABEL_90;
  }
  v8 = std::string::basic_string[abi:ne180100]<0>(&v67, "ModelVersion");
  if (BayesianModel::GetKeyValueInt((uint64_t)v8, v82, (unsigned __int8 *)&v67, &v77))
  {
    v9 = std::string::basic_string[abi:ne180100]<0>(__endptr, "FeaturesCount");
    if (BayesianModel::GetKeyValueInt((uint64_t)v9, v82, (unsigned __int8 *)__endptr, &v78))
    {
      v10 = std::string::basic_string[abi:ne180100]<0>(v63, "TotalTrue");
      if (BayesianModel::GetKeyValueUInt64((uint64_t)v10, v82, (unsigned __int8 *)v63, &v76))
      {
        v11 = std::string::basic_string[abi:ne180100]<0>(v61, "TotalExamples");
        if (BayesianModel::GetKeyValueUInt64((uint64_t)v11, v82, (unsigned __int8 *)v61, &v75))
        {
          v12 = std::string::basic_string[abi:ne180100]<0>(v59, "SumPredictions");
          if (BayesianModel::GetKeyValueDouble((uint64_t)v12, v82, (unsigned __int8 *)v59, (double *)&v74))
          {
            v13 = std::string::basic_string[abi:ne180100]<0>(v57, "LogScore");
            if (BayesianModel::GetKeyValueDouble((uint64_t)v13, v82, (unsigned __int8 *)v57, (double *)&v73))
            {
              v14 = std::string::basic_string[abi:ne180100]<0>(__p, "NormalizedLogScore");
              KeyValueDouble = BayesianModel::GetKeyValueDouble((uint64_t)v14, v82, (unsigned __int8 *)__p, (double *)&v72);
              if (v56 < 0)
                operator delete(__p[0]);
            }
            else
            {
              KeyValueDouble = 0;
            }
            if (v58 < 0)
              operator delete(v57[0]);
          }
          else
          {
            KeyValueDouble = 0;
          }
          if (v60 < 0)
            operator delete(v59[0]);
        }
        else
        {
          KeyValueDouble = 0;
        }
        if (v62 < 0)
          operator delete(v61[0]);
      }
      else
      {
        KeyValueDouble = 0;
      }
      if (v64 < 0)
        operator delete(v63[0]);
    }
    else
    {
      KeyValueDouble = 0;
    }
    if (v66 < 0)
      operator delete(__endptr[0]);
  }
  else
  {
    KeyValueDouble = 0;
  }
  if (SHIBYTE(v68) < 0)
    operator delete(v67.__locale_);
  v20 = -80;
  do
  {
    v21 = std::string::basic_string[abi:ne180100]<0>(&v67, "CalibrationTrue");
    BayesianModel::GetKeyValueUInt64((uint64_t)v21, v82, (unsigned __int8 *)&v67, (unint64_t *)(a1 + v20 + 384));
    if (SHIBYTE(v68) < 0)
      operator delete(v67.__locale_);
    v22 = std::string::basic_string[abi:ne180100]<0>(&v67, "CalibrationCount");
    BayesianModel::GetKeyValueUInt64((uint64_t)v22, v82, (unsigned __int8 *)&v67, (unint64_t *)(a1 + v20 + 464));
    if (SHIBYTE(v68) < 0)
      operator delete(v67.__locale_);
    v20 += 8;
  }
  while (v20);
  if ((KeyValueDouble & 1) == 0)
    goto LABEL_90;
  if ((a3 & 1) != 0)
  {
    v23 = v78;
    if (*(_DWORD *)(a1 + 240) < v78)
      goto LABEL_90;
  }
  else
  {
    if (v77 != *(_DWORD *)(a1 + 296))
      goto LABEL_90;
    v23 = v78;
    if (v78 != *(_DWORD *)(a1 + 240))
      goto LABEL_90;
  }
  std::ios_base::getloc((const std::ios_base *)((char *)v82 + *(_QWORD *)(v82[0] - 24)));
  v24 = std::locale::use_facet(&v67, MEMORY[0x24BEDB350]);
  v25 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
  std::locale::~locale(&v67);
  v26 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v82, (uint64_t)&v79, v25);
  if ((*((_BYTE *)v26 + *(_QWORD *)(*v26 - 24) + 32) & 5) == 0)
  {
    if (SHIBYTE(v81) < 0)
    {
      if (v80 != 8)
        goto LABEL_90;
      v52 = v79;
    }
    else
    {
      if (SHIBYTE(v81) != 8)
        goto LABEL_90;
      v52 = &v79;
    }
    if (*v52 == 0x7365727574616546)
      goto LABEL_52;
LABEL_90:
    v51 = 0;
    goto LABEL_91;
  }
LABEL_52:
  v63[0] = 0;
  v27 = (std::locale::__imp *)operator new(0x28uLL);
  v67.__locale_ = v27;
  v68 = xmmword_2133E4220;
  *(_QWORD *)&v28 = 0x2020202020202020;
  *((_QWORD *)&v28 + 1) = 0x2020202020202020;
  *(_OWORD *)v27 = v28;
  *((_OWORD *)v27 + 1) = v28;
  *((_BYTE *)v27 + 32) = 0;
  v29 = 128;
  for (i = 32; ; i = v68)
  {
    v31 = (v29 & 0x80u) == 0 ? v29 : i;
    if (!ReadStreamToCharacter(v82, (uint64_t)&v67, 9u, v31))
      break;
    __endptr[0] = 0;
    v32 = v68 >= 0 ? (const char *)&v67 : (const char *)v67.__locale_;
    v63[0] = (void *)strtoull(v32, __endptr, 16);
    if (!ReadStreamToCharacter(v82, (uint64_t)&v67, 9u, v31))
      break;
    v33 = v68 >= 0 ? (const char *)&v67 : (const char *)v67.__locale_;
    v34 = atof(v33);
    if ((ReadStreamToCharacter(v82, (uint64_t)&v67, 0xAu, v31) & 1) == 0)
      break;
    v35 = HIBYTE(v68);
    if (v68 >= 0)
      locale = (const char *)&v67;
    else
      locale = (const char *)v67.__locale_;
    v37 = atof(locale);
    if ((*(_QWORD *)&v34 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
      || (v38 = v37, (*(_QWORD *)&v37 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000))
    {
      v51 = 0;
      if ((v35 & 0x80) == 0)
        goto LABEL_91;
      goto LABEL_86;
    }
    __endptr[0] = (char *)v63;
    v39 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v69, v63, (uint64_t)&std::piecewise_construct, (_QWORD **)__endptr);
    *((double *)v39 + 3) = v38;
    *((double *)v39 + 4) = v34;
    v29 = HIBYTE(v68);
  }
  if (a3 && v23 < *(_DWORD *)(a1 + 240))
  {
    v61[0] = (void *)0xFF00000000000000;
    __endptr[0] = (char *)v61;
    v40 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v69, v61, (uint64_t)&std::piecewise_construct, (_QWORD **)__endptr);
    v41 = *(_DWORD *)(a1 + 240);
    v42 = *((_QWORD *)v40 + 3);
    v43 = *((double *)v40 + 4);
    for (j = (double *)v70; j; j = *(double **)j)
    {
      v45 = j[3];
      if (1.0 / v45 < 1.0)
      {
        v46 = 1.0 / (1.0 / v45 + (1.0 - 1.0 / v45) * 0.2);
        v47 = v46 * (j[4] / v45);
        j[3] = v46;
        j[4] = v47;
      }
    }
    __endptr[0] = (char *)v61;
    v48 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v69, v61, (uint64_t)&std::piecewise_construct, (_QWORD **)__endptr);
    *((_QWORD *)v48 + 3) = v42;
    *((double *)v48 + 4) = v43 / sqrt((double)v23 + (double)v23) * sqrt((double)v41 + (double)v41);
  }
  v49 = v75;
  *(_QWORD *)(a1 + 248) = v76;
  *(_QWORD *)(a1 + 256) = v49;
  v50 = v73;
  *(_QWORD *)(a1 + 264) = v74;
  *(_QWORD *)(a1 + 272) = v50;
  *(_QWORD *)(a1 + 280) = v72;
  if ((__int128 *)(a1 + 200) != &v69)
  {
    *(_DWORD *)(a1 + 232) = v71;
    std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned long long,Gaussian>,void *> *>>((_QWORD *)(a1 + 200), (uint64_t *)v70, 0);
  }
  *(_DWORD *)(a1 + 296) = v77;
  v51 = 1;
  if ((HIBYTE(v68) & 0x80) != 0)
LABEL_86:
    operator delete(v67.__locale_);
LABEL_91:
  std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::~__hash_table((uint64_t)&v69);
  if (SHIBYTE(v81) < 0)
    operator delete(v79);
  v82[0] = *MEMORY[0x24BEDB7F0];
  v53 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v82 + *(_QWORD *)(v82[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v82[2] = v53;
  v82[3] = MEMORY[0x24BEDB848] + 16;
  if (v83 < 0)
    operator delete((void *)v82[11]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x2199B1DEC](&v84);
  pthread_rwlock_unlock((pthread_rwlock_t *)a1);
  return v51;
}

void sub_2132FBECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,void *a40,uint64_t a41,int a42,__int16 a43,char a44,char a45,void *a46,uint64_t a47,int a48,__int16 a49,char a50,char a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *a64;
  char a69;
  char a70;
  pthread_rwlock_t *v70;

  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a27 < 0)
    operator delete(a22);
  if (a33 < 0)
    operator delete(a28);
  if (a39 < 0)
    operator delete(a34);
  if (a45 < 0)
    operator delete(a40);
  if (a51 < 0)
    operator delete(a46);
  std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::~__hash_table((uint64_t)&a52);
  if (a69 < 0)
    operator delete(a64);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a70);
  pthread_rwlock_unlock(v70);
  _Unwind_Resume(a1);
}

uint64_t ReadStreamToCharacter(_QWORD *a1, uint64_t a2, unsigned __int8 a3, unint64_t a4)
{
  uint64_t result;
  std::string::size_type v8;
  int v9;
  _QWORD *v10;
  std::string::size_type v11;
  unint64_t v12;
  std::string::value_type v13;
  std::string::value_type __s;

  result = 0;
  if ((*((_BYTE *)a1 + *(_QWORD *)(*a1 - 24) + 32) & 2) == 0)
  {
    v8 = 0;
    v9 = a3;
    while (1)
    {
      v10 = (_QWORD *)std::istream::read();
      if ((*((_BYTE *)v10 + *(_QWORD *)(*v10 - 24) + 32) & 5) != 0)
        return 0;
      if (!v9)
        break;
      __s = 0;
      if (v8 < a4)
        goto LABEL_9;
      v11 = *(unsigned __int8 *)(a2 + 23);
      if ((v11 & 0x80u) != 0)
        v11 = *(_QWORD *)(a2 + 8);
      if (v11 <= v8)
        std::string::append((std::string *)a2, &__s, 1uLL);
      else
LABEL_9:
        *std::string::at((std::string *)a2, v8) = 0;
      ++v8;
      if ((*((_BYTE *)a1 + *(_QWORD *)(*a1 - 24) + 32) & 2) != 0)
        return 0;
    }
    v13 = 0;
    if (v8 < a4)
      goto LABEL_17;
    v12 = *(unsigned __int8 *)(a2 + 23);
    if ((v12 & 0x80u) != 0)
      v12 = *(_QWORD *)(a2 + 8);
    if (v12 <= v8)
      std::string::append((std::string *)a2, &v13, 1uLL);
    else
LABEL_17:
      *std::string::at((std::string *)a2, v8) = 0;
    return 1;
  }
  return result;
}

char *std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t a1, _QWORD *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  char *v11;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  v7 = *a2 ^ HIDWORD(*a2);
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2 ^ HIDWORD(*a2);
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = (char *)*v10;
      if (*v10)
      {
        do
        {
          v12 = *((_QWORD *)v11 + 1);
          if (v12 == v7)
          {
            if (*((_QWORD *)v11 + 2) == *a2)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = *(char **)v11;
        }
        while (v11);
      }
    }
  }
  v11 = (char *)operator new(0x28uLL);
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = v7;
  *((_QWORD *)v11 + 2) = **a4;
  *(_OWORD *)(v11 + 24) = xmmword_2133E4210;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    v15 = 1;
    if (v8 >= 3)
      v15 = (v8 & (v8 - 1)) != 0;
    v16 = v15 | (2 * v8);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__rehash<true>(a1, v18);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v20)
  {
    *(_QWORD *)v11 = *v20;
LABEL_38:
    *v20 = v11;
    goto LABEL_39;
  }
  *(_QWORD *)v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v19 + 8 * v4) = a1 + 16;
  if (*(_QWORD *)v11)
  {
    v21 = *(_QWORD *)(*(_QWORD *)v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8)
        v21 %= v8;
    }
    else
    {
      v21 &= v8 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_2132FC384(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t BayesianModel::GetKeyValueUInt64(uint64_t a1, _QWORD *a2, unsigned __int8 *a3, unint64_t *a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *p_p;
  _QWORD *v12;
  uint64_t v13;
  const char *v15;
  char *v16;
  void *__p;
  uint64_t v18;
  uint64_t v19;

  __p = 0;
  v18 = 0;
  v19 = 0;
  v7 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&__p, 9u);
  if ((*((_BYTE *)v7 + *(_QWORD *)(*v7 - 24) + 32) & 5) != 0)
    goto LABEL_18;
  v8 = a3[23];
  if ((v8 & 0x80u) == 0)
    v9 = a3[23];
  else
    v9 = *((_QWORD *)a3 + 1);
  v10 = HIBYTE(v19);
  if (v19 < 0)
    v10 = v18;
  if (v9 != v10)
    goto LABEL_18;
  if (v19 >= 0)
    p_p = (unsigned __int8 *)&__p;
  else
    p_p = (unsigned __int8 *)__p;
  if ((v8 & 0x80) != 0)
  {
    if (memcmp(*(const void **)a3, p_p, *((_QWORD *)a3 + 1)))
      goto LABEL_18;
  }
  else if (a3[23])
  {
    while (*a3 == *p_p)
    {
      ++a3;
      ++p_p;
      if (!--v8)
        goto LABEL_17;
    }
    goto LABEL_18;
  }
LABEL_17:
  v12 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&__p, 0xAu);
  if ((*((_BYTE *)v12 + *(_QWORD *)(*v12 - 24) + 32) & 5) == 0)
  {
    v16 = 0;
    if (v19 >= 0)
      v15 = (const char *)&__p;
    else
      v15 = (const char *)__p;
    *a4 = strtoull(v15, &v16, 10);
    v13 = 1;
    goto LABEL_19;
  }
LABEL_18:
  v13 = 0;
LABEL_19:
  if (SHIBYTE(v19) < 0)
    operator delete(__p);
  return v13;
}

void sub_2132FC4EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

uint64_t BayesianModel::GetKeyValueDouble(uint64_t a1, _QWORD *a2, unsigned __int8 *a3, double *a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *p_p;
  _QWORD *v12;
  uint64_t v13;
  const char *v15;
  void *__p;
  uint64_t v17;
  uint64_t v18;

  __p = 0;
  v17 = 0;
  v18 = 0;
  v7 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&__p, 9u);
  if ((*((_BYTE *)v7 + *(_QWORD *)(*v7 - 24) + 32) & 5) != 0)
    goto LABEL_18;
  v8 = a3[23];
  if ((v8 & 0x80u) == 0)
    v9 = a3[23];
  else
    v9 = *((_QWORD *)a3 + 1);
  v10 = HIBYTE(v18);
  if (v18 < 0)
    v10 = v17;
  if (v9 != v10)
    goto LABEL_18;
  if (v18 >= 0)
    p_p = (unsigned __int8 *)&__p;
  else
    p_p = (unsigned __int8 *)__p;
  if ((v8 & 0x80) != 0)
  {
    if (memcmp(*(const void **)a3, p_p, *((_QWORD *)a3 + 1)))
      goto LABEL_18;
  }
  else if (a3[23])
  {
    while (*a3 == *p_p)
    {
      ++a3;
      ++p_p;
      if (!--v8)
        goto LABEL_17;
    }
    goto LABEL_18;
  }
LABEL_17:
  v12 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&__p, 0xAu);
  if ((*((_BYTE *)v12 + *(_QWORD *)(*v12 - 24) + 32) & 5) == 0)
  {
    if (v18 >= 0)
      v15 = (const char *)&__p;
    else
      v15 = (const char *)__p;
    *a4 = atof(v15);
    v13 = 1;
    goto LABEL_19;
  }
LABEL_18:
  v13 = 0;
LABEL_19:
  if (SHIBYTE(v18) < 0)
    operator delete(__p);
  return v13;
}

void sub_2132FC884(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t BayesianModel::GetKeyValueInt(uint64_t a1, _QWORD *a2, unsigned __int8 *a3, int *a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *p_p;
  _QWORD *v12;
  uint64_t v13;
  const char *v15;
  void *__p;
  uint64_t v17;
  uint64_t v18;

  __p = 0;
  v17 = 0;
  v18 = 0;
  v7 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&__p, 9u);
  if ((*((_BYTE *)v7 + *(_QWORD *)(*v7 - 24) + 32) & 5) != 0)
    goto LABEL_18;
  v8 = a3[23];
  if ((v8 & 0x80u) == 0)
    v9 = a3[23];
  else
    v9 = *((_QWORD *)a3 + 1);
  v10 = HIBYTE(v18);
  if (v18 < 0)
    v10 = v17;
  if (v9 != v10)
    goto LABEL_18;
  if (v18 >= 0)
    p_p = (unsigned __int8 *)&__p;
  else
    p_p = (unsigned __int8 *)__p;
  if ((v8 & 0x80) != 0)
  {
    if (memcmp(*(const void **)a3, p_p, *((_QWORD *)a3 + 1)))
      goto LABEL_18;
  }
  else if (a3[23])
  {
    while (*a3 == *p_p)
    {
      ++a3;
      ++p_p;
      if (!--v8)
        goto LABEL_17;
    }
    goto LABEL_18;
  }
LABEL_17:
  v12 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&__p, 0xAu);
  if ((*((_BYTE *)v12 + *(_QWORD *)(*v12 - 24) + 32) & 5) == 0)
  {
    if (v18 >= 0)
      v15 = (const char *)&__p;
    else
      v15 = (const char *)__p;
    *a4 = atoi(v15);
    v13 = 1;
    goto LABEL_19;
  }
LABEL_18:
  v13 = 0;
LABEL_19:
  if (SHIBYTE(v18) < 0)
    operator delete(__p);
  return v13;
}

void sub_2132FC9E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::~__hash_table(uint64_t a1)
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

void std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned long long,Gaussian>,void *> *>>(_QWORD *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t i;
  uint64_t *v8;
  unint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  _QWORD *inserted;
  uint64_t *v13;

  v6 = a1[1];
  if (!v6)
    goto LABEL_9;
  for (i = 0; i != v6; *(_QWORD *)(*a1 + 8 * i++) = 0)
    ;
  v8 = (uint64_t *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v8)
  {
    while (a2 != a3)
    {
      v9 = a2[2];
      v8[2] = v9;
      *(_OWORD *)(v8 + 3) = *(_OWORD *)(a2 + 3);
      v10 = (uint64_t *)*v8;
      v11 = v9 ^ HIDWORD(v9);
      v8[1] = v11;
      inserted = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__node_insert_multi_prepare((uint64_t)a1, v11, v8 + 2);
      std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__node_insert_multi_perform(a1, v8, inserted);
      a2 = (uint64_t *)*a2;
      v8 = v10;
      if (!v10)
        goto LABEL_9;
    }
    do
    {
      v13 = (uint64_t *)*v8;
      operator delete(v8);
      v8 = v13;
    }
    while (v13);
  }
  else
  {
LABEL_9:
    while (a2 != a3)
    {
      std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_multi<std::pair<unsigned long long const,Gaussian> const&>(a1, (uint64_t)(a2 + 2));
      a2 = (uint64_t *)*a2;
    }
  }
}

void sub_2132FCB2C(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  __cxa_begin_catch(a1);
  do
  {
    v2 = (_QWORD *)*v1;
    operator delete(v1);
    v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_2132FCB4C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_multi<std::pair<unsigned long long const,Gaussian> const&>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  unint64_t v5;
  _QWORD *inserted;

  v4 = operator new(0x28uLL);
  *((_OWORD *)v4 + 1) = *(_OWORD *)a2;
  v4[4] = *(_QWORD *)(a2 + 16);
  v5 = v4[2] ^ HIDWORD(v4[2]);
  *v4 = 0;
  v4[1] = v5;
  inserted = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__node_insert_multi_prepare((uint64_t)a1, v5, v4 + 2);
  std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__node_insert_multi_perform(a1, v4, inserted);
  return v4;
}

void sub_2132FCBD0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v6;
  float v7;
  float v8;
  uint64_t v9;
  _BOOL8 v10;
  size_t v11;
  unint64_t v12;
  size_t v13;
  uint8x8_t v14;
  unint64_t v15;
  _QWORD *v16;
  int v17;
  _QWORD *result;
  unint64_t v19;
  unint64_t v20;
  _BOOL4 v21;
  int v22;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    v9 = 2 * v6;
    v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    v11 = v10 | v9;
    v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12)
      v13 = v12;
    else
      v13 = v11;
    std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__rehash<false>(a1, v13);
    v6 = *(_QWORD *)(a1 + 8);
  }
  v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    v15 = a2;
    if (v6 <= a2)
      v15 = a2 % v6;
  }
  else
  {
    v15 = (v6 - 1) & a2;
  }
  v16 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
  if (!v16)
    return 0;
  v17 = 0;
  do
  {
    result = v16;
    v16 = (_QWORD *)*v16;
    if (!v16)
      break;
    v19 = v16[1];
    if (v14.u32[0] > 1uLL)
    {
      v20 = v16[1];
      if (v19 >= v6)
        v20 = v19 % v6;
    }
    else
    {
      v20 = v19 & (v6 - 1);
    }
    if (v20 != v15)
      break;
    v21 = v19 == a2 && v16[2] == *a3;
    v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__node_insert_multi_perform(_QWORD *result, _QWORD *a2, _QWORD *a3)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(_QWORD *)(*result + 8 * v4) = result + 2;
    if (!*a2)
      goto LABEL_19;
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
LABEL_18:
    *(_QWORD *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
    if (v6 != v4)
      goto LABEL_18;
  }
LABEL_19:
  ++result[3];
  return result;
}

void std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__rehash<false>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__do_rehash<false>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__do_rehash<false>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v13;
  _QWORD *v14;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      for (i = (_QWORD *)*v7; *v7; i = (_QWORD *)*v7)
      {
        v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2)
            v12 %= a2;
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          v7 = i;
        }
        else
        {
          v13 = i;
          if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
          {
            do
            {
              v14 = v13;
              v13 = (_QWORD *)*v13;
            }
            while (v13 && i[2] == v13[2]);
            *v7 = v13;
            *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = i;
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
            v7 = i;
            v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void sub_2132FE658(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 248));
  _Unwind_Resume(a1);
}

id RERootFeatureSetForFeatures(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    if (objc_msgSend(v1, "count") == 1)
    {
      objc_msgSend(v1, "allFeatures");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_rootFeatures");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[REFeatureSet featureSet](REMutableFeatureSet, "featureSet");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = v1;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "_rootFeatures", (_QWORD)v12);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "unionFeatureSet:", v10);

            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }

      v4 = (void *)objc_msgSend(v2, "copy");
    }

  }
  else
  {
    +[REFeatureSet featureSet](REFeatureSet, "featureSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

uint64_t REFeatureValueHashForTaggedPointer(void *a1)
{
  if (!a1)
    return 0;
  if ((a1 & 1) != 0)
    __asm { BR              X10 }
  return objc_msgSend(a1, "hash");
}

CFTypeRef RERetainFeatureValueTaggedPointer(CFTypeRef cf)
{
  if (cf)
  {
    if ((cf & 1) == 0)
      return CFRetain(cf);
  }
  return cf;
}

id REIntrinsicFeatureSet()
{
  if (REIntrinsicFeatureSet_onceToken != -1)
    dispatch_once(&REIntrinsicFeatureSet_onceToken, &__block_literal_global_22);
  return (id)REIntrinsicFeatureSet_IntrinsicFeatures;
}

void sub_213301508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213301A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t RECreateFeatureValueTaggedPointer(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  double v5;
  void *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  unint64_t v11;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    switch(objc_msgSend(v1, "type"))
    {
      case 0:
        if (objc_msgSend(v2, "BOOLValue"))
          v3 = 9;
        else
          v3 = 1;
        break;
      case 1:
        v4 = objc_msgSend(v2, "int64Value");
        if (v4 >> 61)
          goto LABEL_22;
        v3 = (8 * v4) | 3;
        break;
      case 2:
        objc_msgSend(v2, "doubleValue");
        if (((*(_QWORD *)&v5 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE
          || vabdd_f64(COERCE_DOUBLE(*(_QWORD *)&v5 & 0xFFFFFFFFFFFFFFF8), v5) >= *(double *)&REFloatingPointTaggedPointerPrecision)
        {
          goto LABEL_22;
        }
        v3 = *(_QWORD *)&v5 & 0xFFFFFFFFFFFFFFF8 | 5;
        break;
      case 3:
        objc_msgSend(v2, "stringValue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!_RECanEncodeStringValue(v6))
        {

          goto LABEL_22;
        }
        v7 = v6;
        v8 = objc_msgSend(v7, "length");
        v9 = 0;
        if (!v8)
          goto LABEL_17;
        for (i = 0; i != v8; v9 = (char)objc_msgSend(v7, "characterAtIndex:", i++) | (v9 << 8))
          ;
        if (v8 < 7)
        {
LABEL_17:
          v11 = v8 - 7;
          do
            v9 <<= 8;
          while (!__CFADD__(v11++, 1));
        }

        v3 = (8 * v9) | 7;
        break;
      default:
LABEL_22:
        v3 = v2;
        break;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL _RECanEncodeStringValue(void *a1)
{
  id v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int v6;
  _BOOL8 v7;

  v1 = a1;
  if (!objc_msgSend(v1, "canBeConvertedToEncoding:", 1))
    goto LABEL_9;
  v2 = objc_msgSend(v1, "length");
  if (v2 > 7)
    goto LABEL_9;
  v3 = v2;
  if (!v2)
  {
    v7 = 1;
    goto LABEL_10;
  }
  if (objc_msgSend(v1, "characterAtIndex:", 0) <= 0x7F)
  {
    v4 = 1;
    do
    {
      v5 = v4;
      if (v3 == v4)
        break;
      v6 = objc_msgSend(v1, "characterAtIndex:", v4);
      v4 = v5 + 1;
    }
    while (v6 < 0x80);
    v7 = v5 >= v3;
  }
  else
  {
LABEL_9:
    v7 = 0;
  }
LABEL_10:

  return v7;
}

void REReleaseFeatureValueTaggedPointer(CFTypeRef cf)
{
  if (cf)
  {
    if ((cf & 1) == 0)
      CFRelease(cf);
  }
}

void REEnsureFeatureWithType(void *a1, unint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v3 = a1;
  v19 = v3;
  if (!v3)
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Feature must be non-nil"), v4, v5, v6, v7, v8, v9, v17);
    v3 = 0;
  }
  if (objc_msgSend(v3, "featureType") != a2)
  {
    v10 = (void *)*MEMORY[0x24BDBCAB8];
    REStringFromFeatureType(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    RERaiseInternalException(v10, CFSTR("Feature (%@) must be a %@ feature"), v11, v12, v13, v14, v15, v16, (uint64_t)v19);

  }
}

void REEnsureMatchingFeatureTypes(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v19 = a1;
  v9 = a2;
  v10 = v19;
  if (v19)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Feature must be non-nil"), v3, v4, v5, v6, v7, v8, v18);
    v10 = 0;
    if (v9)
      goto LABEL_3;
  }
  RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Feature must be non-nil"), v3, v4, v5, v6, v7, v8, v18);
  v10 = v19;
LABEL_3:
  v11 = objc_msgSend(v10, "featureType");
  if (v11 != objc_msgSend(v9, "featureType"))
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Feature (%@) must match feature type of %@"), v12, v13, v14, v15, v16, v17, (uint64_t)v19);

}

uint64_t RECreateIntegerFeatureValueTaggedPointer(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  double v5;
  void *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  unint64_t v11;

  +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", a1);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    switch(objc_msgSend(v1, "type"))
    {
      case 0:
        if (objc_msgSend(v2, "BOOLValue"))
          v3 = 9;
        else
          v3 = 1;
        break;
      case 1:
        v4 = objc_msgSend(v2, "int64Value");
        if (v4 >> 61)
          goto LABEL_22;
        v3 = (8 * v4) | 3;
        break;
      case 2:
        objc_msgSend(v2, "doubleValue");
        if (((*(_QWORD *)&v5 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE
          || vabdd_f64(COERCE_DOUBLE(*(_QWORD *)&v5 & 0xFFFFFFFFFFFFFFF8), v5) >= *(double *)&REFloatingPointTaggedPointerPrecision)
        {
          goto LABEL_22;
        }
        v3 = *(_QWORD *)&v5 & 0xFFFFFFFFFFFFFFF8 | 5;
        break;
      case 3:
        objc_msgSend(v2, "stringValue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!_RECanEncodeStringValue(v6))
        {

          goto LABEL_22;
        }
        v7 = v6;
        v8 = objc_msgSend(v7, "length");
        v9 = 0;
        if (!v8)
          goto LABEL_17;
        for (i = 0; i != v8; v9 = (char)objc_msgSend(v7, "characterAtIndex:", i++) | (v9 << 8))
          ;
        if (v8 < 7)
        {
LABEL_17:
          v11 = v8 - 7;
          do
            v9 <<= 8;
          while (!__CFADD__(v11++, 1));
        }

        v3 = (8 * v9) | 7;
        break;
      default:
LABEL_22:
        v3 = v2;
        break;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t REInvertRelation(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) > 6)
    return 4;
  else
    return qword_2133E43C8[a1 + 2];
}

uint64_t RECreateBooleanFeatureValueTaggedPointer(int a1)
{
  if (a1)
    return 9;
  else
    return 1;
}

id REFeatureValueForTaggedPointer(void *a1)
{
  id v1;

  if (a1)
  {
    if ((a1 & 1) != 0)
      __asm { BR              X10 }
    v1 = a1;
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

uint64_t REFeatureValueTypeForTaggedPointer(unint64_t a1)
{
  if ((a1 & 1) != 0)
    return (a1 >> 1) & 3;
  else
    return objc_msgSend((id)a1, "type");
}

uint64_t RECreateDoubleFeatureValueTaggedPointer()
{
  id v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  double v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  unint64_t v10;

  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    switch(objc_msgSend(v0, "type"))
    {
      case 0:
        if (objc_msgSend(v1, "BOOLValue"))
          v2 = 9;
        else
          v2 = 1;
        break;
      case 1:
        v3 = objc_msgSend(v1, "int64Value");
        if (v3 >> 61)
          goto LABEL_22;
        v2 = (8 * v3) | 3;
        break;
      case 2:
        objc_msgSend(v1, "doubleValue");
        if (((*(_QWORD *)&v4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE
          || vabdd_f64(COERCE_DOUBLE(*(_QWORD *)&v4 & 0xFFFFFFFFFFFFFFF8), v4) >= *(double *)&REFloatingPointTaggedPointerPrecision)
        {
          goto LABEL_22;
        }
        v2 = *(_QWORD *)&v4 & 0xFFFFFFFFFFFFFFF8 | 5;
        break;
      case 3:
        objc_msgSend(v1, "stringValue");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!_RECanEncodeStringValue(v5))
        {

          goto LABEL_22;
        }
        v6 = v5;
        v7 = objc_msgSend(v6, "length");
        v8 = 0;
        if (!v7)
          goto LABEL_17;
        for (i = 0; i != v7; v8 = (char)objc_msgSend(v6, "characterAtIndex:", i++) | (v8 << 8))
          ;
        if (v7 < 7)
        {
LABEL_17:
          v10 = v7 - 7;
          do
            v8 <<= 8;
          while (!__CFADD__(v10++, 1));
        }

        v2 = (8 * v8) | 7;
        break;
      default:
LABEL_22:
        v2 = v1;
        break;
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_213307888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_213308D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void __Block_byref_object_dispose__18(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void __Block_byref_object_dispose__19(uint64_t a1)
{

}

void __Block_byref_object_dispose__20(uint64_t a1)
{

}

void __Block_byref_object_dispose__21(uint64_t a1)
{

}

void __Block_byref_object_dispose__22(uint64_t a1)
{

}

void __Block_byref_object_dispose__23(uint64_t a1)
{

}

void __Block_byref_object_dispose__24(uint64_t a1)
{

}

void __Block_byref_object_dispose__25(uint64_t a1)
{

}

void __Block_byref_object_dispose__26(uint64_t a1)
{

}

void __Block_byref_object_dispose__27(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void __Block_byref_object_dispose__28(uint64_t a1)
{

}

void __Block_byref_object_dispose__29(uint64_t a1)
{

}

void __Block_byref_object_dispose__30(uint64_t a1)
{

}

void sub_21330A22C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  _Block_object_dispose(&a50, 8);
  _Unwind_Resume(a1);
}

id RELogForDomain(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (RELogForDomain_onceToken != -1)
    dispatch_once(&RELogForDomain_onceToken, &__block_literal_global_51);
  v2 = (void *)RELogForDomain_LogForDomains;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_21330C328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void REExtractRules(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _UNKNOWN **v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  uint64_t v20;
  _UNKNOWN **v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    v28 = *MEMORY[0x24BDBCAB0];
    v11 = &off_24CF89000;
    do
    {
      v12 = 0;
      v27 = v9;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v5);
        v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v7;
LABEL_10:
          objc_msgSend(v14, "addObject:", v13);
          goto LABEL_11;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v6;
          goto LABEL_10;
        }
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v16 = (void *)MEMORY[0x24BDBCE88];
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v28, CFSTR("Rule %@ cannot be used. Only filtering and ranking rules are allowed to be used by a section"), v13);
        }
        else
        {
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = v10;
          v21 = v11;
          v22 = v7;
          v23 = v5;
          v24 = v6;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "raise:format:", v28, CFSTR("Unexpected rule %@. Use %@ or %@ instead."), v13, v18, v25);

          v6 = v24;
          v5 = v23;
          v7 = v22;
          v11 = v21;
          v10 = v20;
          v9 = v27;

        }
LABEL_11:
        ++v12;
      }
      while (v9 != v12);
      v26 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v9 = v26;
    }
    while (v26);
  }

}

BOOL REBundleConfiguraitonSupportsElementGroups(void *a1)
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "methodForSelector:", sel_elementGroupWithIdentifier_);
  return v1 != +[REBundleConfiguration instanceMethodForSelector:](REBundleConfiguration, "instanceMethodForSelector:", sel_elementGroupWithIdentifier_);
}

void sub_21330EF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, id *a11, id *a12, id *location, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  id a64;

  _Block_object_dispose(&a38, 8);
  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a64);
  _Unwind_Resume(a1);
}

void sub_21330F280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21331058C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21331116C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

dispatch_queue_t _RECreateSharedQueueAttr(void *a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  const char *v9;
  dispatch_queue_t v10;

  v3 = _RECreateSharedQueueAttr_onceToken;
  v4 = a2;
  v5 = a1;
  if (v3 != -1)
    dispatch_once(&_RECreateSharedQueueAttr_onceToken, &__block_literal_global_6);
  dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("com.apple.RelevanceEngine."), "stringByAppendingString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_retainAutorelease(v7);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  v10 = dispatch_queue_create_with_target_V2(v9, v6, (dispatch_queue_t)_RECreateSharedQueueAttr_SharedQueue);

  return v10;
}

dispatch_queue_t RECreateSharedQueue(void *a1)
{
  return _RECreateSharedQueueAttr(a1, 0);
}

void sub_213312008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  id *v11;
  uint64_t v12;

  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 152));
  _Unwind_Resume(a1);
}

BOOL RESubclassOverridesMethod(void *a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v5 = a1;
  v6 = objc_msgSend(a2, "instanceMethodForSelector:", a3);
  v7 = objc_msgSend(v5, "methodForSelector:", a3);

  if (v7)
    v8 = v7 == v6;
  else
    v8 = 1;
  return !v8;
}

const __CFString *RESignificantTimeChangeNotification()
{
  id v0;

  v0 = +[_RESignificantTimeChangeNotifier sharedInstance](_RESignificantTimeChangeNotifier, "sharedInstance");
  return CFSTR("RESignificantTimeChangeNotification");
}

BOOL REDeviceUnlockedSinceBoot()
{
  if (_RERegisterForLockedStatusChangeIfNecessary_onceToken != -1)
    dispatch_once(&_RERegisterForLockedStatusChangeIfNecessary_onceToken, &__block_literal_global_75_0);
  return MKBGetDeviceLockState() == 3 || MKBDeviceUnlockedSinceBoot() == 1;
}

id RETokenizeString(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *__p[2];
  char v15;
  void **v16;

  v1 = a1;
  if (RETokenizeString::onceToken != -1)
    dispatch_once(&RETokenizeString::onceToken, &__block_literal_global_4);
  os_unfair_lock_lock((os_unfair_lock_t)&RETokenizeString::CacheLock);
  objc_msgSend((id)RETokenizeString::TokenizedStringCache, "objectForKey:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&RETokenizeString::CacheLock);
  if (!v2)
  {
    v3 = v1;
    v4 = v3;
    if (v3)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
      v11 = 0;
      v12 = 0;
      v13 = 0;
      if ((re_tokenize_string((uint64_t *)__p, &v11) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((v12 - v11) >> 3));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 != v11)
        {
          v6 = 0;
          v7 = 0;
          do
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v8);

            ++v7;
            v6 += 24;
          }
          while (v7 < 0xAAAAAAAAAAAAAAABLL * ((v12 - v11) >> 3));
        }
        v2 = (void *)objc_msgSend(v5, "copy");

      }
      else
      {
        v2 = (void *)MEMORY[0x24BDBD1A8];
      }
      v16 = (void **)&v11;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v16);
      if (v15 < 0)
        operator delete(__p[0]);
    }
    else
    {
      v2 = (void *)MEMORY[0x24BDBD1A8];
    }

    os_unfair_lock_lock((os_unfair_lock_t)&RETokenizeString::CacheLock);
    objc_msgSend((id)RETokenizeString::TokenizedStringCache, "setObject:forKey:", v2, v4);
    os_unfair_lock_unlock((os_unfair_lock_t)&RETokenizeString::CacheLock);
  }
  v9 = v2;

  return v9;
}

void sub_213313198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char *a19)
{
  void *v19;
  void *v20;
  void *v21;

  a19 = &a10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  if (a18 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2133155EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_213315AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, pthread_rwlock_t *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  pthread_rwlock_unlock(a11);
  _Unwind_Resume(a1);
}

BOOL REFancyShrinkingDictionary::LoadModel(uint64_t a1, const std::string *a2)
{
  const std::locale::facet *v3;
  unsigned __int8 v4;
  _QWORD *v5;
  uint64_t KeyValueInt;
  std::string *v7;
  uint64_t *p_p;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v14;
  std::string::size_type v15;
  int v16;
  std::string *v18;
  std::string::size_type v19;
  uint64_t v20;
  uint64_t v22;
  const std::locale::facet *v24;
  unsigned __int8 v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  int v31;
  std::string v32;
  __int128 v33;
  __int128 v34;
  int v35;
  int v36;
  void *__p;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[13];
  char v41;
  uint64_t v42;
  std::locale v43;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](v40, a2, 24);
  __p = 0;
  v38 = 0;
  v39 = 0;
  v36 = 0;
  v33 = 0u;
  v34 = 0u;
  v35 = 1065353216;
  std::ios_base::getloc((const std::ios_base *)((char *)v40 + *(_QWORD *)(v40[0] - 24)));
  v3 = std::locale::use_facet((const std::locale *)&v32, MEMORY[0x24BEDB350]);
  v4 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, 10);
  std::locale::~locale((std::locale *)&v32);
  v5 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v40, (uint64_t)&__p, v4);
  if ((*((_BYTE *)v5 + *(_QWORD *)(*v5 - 24) + 32) & 5) != 0)
    goto LABEL_2;
  if ((SHIBYTE(v39) & 0x80000000) == 0)
  {
    if (SHIBYTE(v39) == 24)
    {
      p_p = (uint64_t *)&__p;
      goto LABEL_11;
    }
LABEL_18:
    v14 = 0;
    goto LABEL_40;
  }
  if (v38 != 24)
    goto LABEL_18;
  p_p = (uint64_t *)__p;
LABEL_11:
  v9 = *p_p;
  v10 = p_p[1];
  v11 = p_p[2];
  if (v9 != 0x72685379636E6146 || v10 != 0x6944676E696B6E69 || v11 != 0x7972616E6F697463)
    goto LABEL_18;
LABEL_2:
  memset(&v32, 0, sizeof(v32));
  KeyValueInt = REFancyShrinkingDictionary::getKeyValueInt((uint64_t)v5, v40, &v32, &v36);
  if ((_DWORD)KeyValueInt)
  {
    if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v32.__r_.__value_.__l.__size_ != 12)
        goto LABEL_37;
      v7 = (std::string *)v32.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) != 12)
        goto LABEL_37;
      v7 = &v32;
    }
    v15 = v7->__r_.__value_.__r.__words[0];
    v16 = v7->__r_.__value_.__r.__words[1];
    if (v15 != 0x7265566C65646F4DLL || v16 != 1852795251)
      goto LABEL_37;
    if (v36 != *(_DWORD *)(a1 + 56))
      goto LABEL_37;
    v31 = 0;
    if ((REFancyShrinkingDictionary::getKeyValueInt(KeyValueInt, v40, &v32, &v31) & 1) == 0)
      goto LABEL_37;
    if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v32.__r_.__value_.__l.__size_ != 11)
        goto LABEL_37;
      v18 = (std::string *)v32.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) != 11)
        goto LABEL_37;
      v18 = &v32;
    }
    v19 = v18->__r_.__value_.__r.__words[0];
    v20 = *(std::string::size_type *)((char *)v18->__r_.__value_.__r.__words + 3);
    if (v19 == 0x6F43736E656B6F54 && v20 == 0x746E756F43736E65)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)v40 + *(_QWORD *)(v40[0] - 24)));
      v24 = std::locale::use_facet(&v43, MEMORY[0x24BEDB350]);
      v25 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
      std::locale::~locale(&v43);
      v26 = (uint64_t)std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v40, (uint64_t)&__p, v25);
      if ((*(_BYTE *)(v26 + *(_QWORD *)(*(_QWORD *)v26 - 24) + 32) & 5) != 0
        || (v26 = std::operator!=[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, "Tokens"),
            (v26 & 1) == 0))
      {
        v30 = 0;
        v27 = v31;
        if (v31)
        {
          v14 = 0;
          v28 = 0;
          while ((REFancyShrinkingDictionary::getKeyValueInt(v26, v40, &v32, &v30) & 1) != 0)
          {
            v29 = v30;
            v43.__locale_ = (std::locale::__imp *)&v32;
            v26 = (uint64_t)std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v33, (unsigned __int8 *)&v32, (uint64_t)&std::piecewise_construct, (__int128 **)&v43);
            *(_WORD *)(v26 + 40) = v29;
            v14 = ++v28 >= v27;
            if (v27 == v28)
              goto LABEL_51;
          }
        }
        else
        {
LABEL_51:
          if (&v33 != (__int128 *)a1)
          {
            *(_DWORD *)(a1 + 32) = v35;
            std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *> *>>((_QWORD *)a1, (uint64_t *)v34, 0);
          }
          v14 = 1;
        }
        goto LABEL_38;
      }
    }
  }
LABEL_37:
  v14 = 0;
LABEL_38:
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v32.__r_.__value_.__l.__data_);
LABEL_40:
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table((uint64_t)&v33);
  if (SHIBYTE(v39) < 0)
    operator delete(__p);
  v40[0] = *MEMORY[0x24BEDB7F0];
  v22 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v40 + *(_QWORD *)(v40[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v40[2] = v22;
  v40[3] = MEMORY[0x24BEDB848] + 16;
  if (v41 < 0)
    operator delete((void *)v40[11]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x2199B1DEC](&v42);
  return v14;
}

void sub_213315FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28)
{
  if (a15 < 0)
    operator delete(__p);
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table((uint64_t)&a16);
  if (a27 < 0)
    operator delete(a22);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a28);
  _Unwind_Resume(a1);
}

uint64_t REFancyShrinkingDictionary::getKeyValueInt(uint64_t a1, _QWORD *a2, std::string *a3, int *a4)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  std::string *p_str;
  std::string __str;

  memset(&__str, 0, sizeof(__str));
  v7 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&__str, 9u);
  if ((*((_BYTE *)v7 + *(_QWORD *)(*v7 - 24) + 32) & 5) != 0
    || (std::string::operator=(a3, &__str),
        v8 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&__str, 0xAu),
        (*((_BYTE *)v8 + *(_QWORD *)(*v8 - 24) + 32) & 5) != 0))
  {
    v9 = 0;
  }
  else
  {
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_str = &__str;
    else
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    *a4 = atoi((const char *)p_str);
    v9 = 1;
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  return v9;
}

void sub_2133160F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[3];

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    v19 = 1;
    if (v11 >= 3)
      v19 = (v11 & (v11 - 1)) != 0;
    v20 = v19 | (2 * v11);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__rehash<true>(a1, v22);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11)
          v24 %= v11;
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_21331637C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100]((uint64_t)&a13, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x30uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = (std::string *)(v8 + 16);
  v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    *((_QWORD *)v8 + 4) = *((_QWORD *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  *((_WORD *)v8 + 20) = 0;
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_21331642C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *> *>>(_QWORD *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t i;
  void **v8;
  BOOL v9;
  void **v10;
  BOOL v11;

  v4 = a2;
  v6 = a1[1];
  if (v6)
  {
    for (i = 0; i != v6; ++i)
      *(_QWORD *)(*a1 + 8 * i) = 0;
    v8 = (void **)a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8)
      v9 = a2 == a3;
    else
      v9 = 1;
    if (v9)
    {
      v10 = v8;
    }
    else
    {
      do
      {
        std::string::operator=((std::string *)(v8 + 2), (const std::string *)(v4 + 2));
        *((_WORD *)v8 + 20) = *((_WORD *)v4 + 20);
        v10 = (void **)*v8;
        std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__node_insert_multi(a1, v8);
        v4 = (uint64_t *)*v4;
        if (v10)
          v11 = v4 == a3;
        else
          v11 = 1;
        v8 = v10;
      }
      while (!v11);
    }
    std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__deallocate_node((int)a1, v10);
  }
  while (v4 != a3)
  {
    std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_multi<std::pair<std::string const,unsigned short> const&>(a1, (uint64_t)(v4 + 2));
    v4 = (uint64_t *)*v4;
  }
}

void sub_213316518(void *a1)
{
  int v1;
  void **v2;

  __cxa_begin_catch(a1);
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__deallocate_node(v1, v2);
  __cxa_rethrow();
}

void sub_213316534(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_multi<std::pair<std::string const,unsigned short> const&>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__construct_node<std::pair<std::string const,unsigned short> const&>((uint64_t)a1, a2, (uint64_t)&v4);
  return std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__node_insert_multi(a1, v4);
}

void sub_213316580(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__node_insert_multi(_QWORD *a1, _QWORD *a2)
{
  unsigned __int8 *v4;
  unint64_t v5;
  unsigned __int8 *inserted;

  v4 = (unsigned __int8 *)(a2 + 2);
  v5 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)(a2 + 2));
  a2[1] = v5;
  inserted = std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__node_insert_multi_prepare((uint64_t)a1, v5, v4);
  std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__node_insert_multi_perform(a1, a2, inserted);
  return a2;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  uint64_t v6;
  float v7;
  unint64_t v8;
  float v9;
  _BOOL8 v10;
  unint64_t v11;
  unint64_t v12;
  size_t v13;
  uint8x8_t v14;
  unint64_t v15;
  unint64_t v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  int v22;

  v6 = a1 + 32;
  v7 = *(float *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 8);
  v9 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  if (!v8 || (float)(v7 * (float)v8) < v9)
  {
    v10 = 1;
    if (v8 >= 3)
      v10 = (v8 & (v8 - 1)) != 0;
    v11 = v10 | (2 * v8);
    v12 = vcvtps_u32_f32(v9 / v7);
    if (v11 <= v12)
      v13 = v12;
    else
      v13 = v11;
    std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__rehash<false>(a1, v13);
    v8 = *(_QWORD *)(a1 + 8);
  }
  v14 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
  v14.i16[0] = vaddlv_u8(v14);
  v15 = v14.u32[0];
  if (v14.u32[0] > 1uLL)
  {
    v16 = a2;
    if (v8 <= a2)
      v16 = a2 % v8;
  }
  else
  {
    v16 = (v8 - 1) & a2;
  }
  v17 = *(unsigned __int8 **)(*(_QWORD *)a1 + 8 * v16);
  if (v17)
  {
    v18 = *(unsigned __int8 **)v17;
    if (*(_QWORD *)v17)
    {
      v19 = 0;
      do
      {
        v20 = *((_QWORD *)v18 + 1);
        if (v15 > 1)
        {
          v21 = *((_QWORD *)v18 + 1);
          if (v20 >= v8)
            v21 = v20 % v8;
        }
        else
        {
          v21 = v20 & (v8 - 1);
        }
        if (v21 != v16)
          break;
        v22 = v20 == a2 ? std::equal_to<std::string>::operator()[abi:ne180100](v6, v18 + 16, a3) : 0;
        if ((v19 & (v22 ^ 1) & 1) != 0)
          break;
        v19 |= v22;
        v17 = *(unsigned __int8 **)v17;
        v18 = *(unsigned __int8 **)v17;
      }
      while (*(_QWORD *)v17);
    }
  }
  return v17;
}

unint64_t std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__construct_node<std::pair<std::string const,unsigned short> const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  char *v7;
  char *v8;
  _OWORD *v9;
  unint64_t result;

  v6 = a1 + 16;
  v7 = (char *)operator new(0x30uLL);
  v8 = v7;
  *(_QWORD *)(a3 + 8) = v6;
  *(_QWORD *)a3 = v7;
  *(_BYTE *)(a3 + 16) = 0;
  v9 = v7 + 16;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(v7 + 16), *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *v9 = *(_OWORD *)a2;
    *((_QWORD *)v7 + 4) = *(_QWORD *)(a2 + 16);
  }
  *((_WORD *)v8 + 20) = *(_WORD *)(a2 + 24);
  *(_BYTE *)(a3 + 16) = 1;
  result = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)v9);
  *((_QWORD *)v8 + 1) = result;
  return result;
}

void sub_213316818(_Unwind_Exception *a1)
{
  void **v1;
  _QWORD *v2;
  uint64_t v3;

  *v2 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100](v3, v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__rehash<false>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__do_rehash<false>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__do_rehash<false>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 **v7;
  unint64_t v8;
  uint8x8_t v9;
  unint64_t v10;
  void *v11;
  unsigned __int8 *v12;
  unint64_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  int v16;
  unsigned __int8 *v17;
  unint64_t v18;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(unsigned __int8 ***)(a1 + 16);
    if (v7)
    {
      v8 = (unint64_t)v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      v10 = v9.u32[0];
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v12 = *v7;
      if (*v7)
      {
        v18 = v9.u32[0];
        do
        {
          v13 = *((_QWORD *)v12 + 1);
          if (v10 > 1)
          {
            if (v13 >= a2)
              v13 %= a2;
          }
          else
          {
            v13 &= a2 - 1;
          }
          if (v13 == v8)
          {
            v7 = (unsigned __int8 **)v12;
          }
          else if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v13))
          {
            v14 = *(unsigned __int8 **)v12;
            if (*(_QWORD *)v12)
            {
              v15 = v12;
              while (1)
              {
                v16 = std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, v12 + 16, v14 + 16);
                v17 = *(unsigned __int8 **)v15;
                if (!v16)
                  break;
                v14 = *(unsigned __int8 **)v17;
                v15 = *(unsigned __int8 **)v15;
                if (!*(_QWORD *)v17)
                  goto LABEL_32;
              }
              v14 = *(unsigned __int8 **)v15;
              v17 = v15;
LABEL_32:
              v10 = v18;
            }
            else
            {
              v17 = v12;
            }
            *v7 = v14;
            *(_QWORD *)v17 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v13);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v13) = v12;
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v13) = v7;
            v7 = (unsigned __int8 **)v12;
            v8 = v13;
          }
          v12 = *v7;
        }
        while (*v7);
      }
    }
  }
  else
  {
    v11 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v11)
      operator delete(v11);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void sub_213316BC8(_Unwind_Exception *a1)
{
  pthread_rwlock_t *v1;

  pthread_rwlock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__deallocate_node(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__move_assign(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::clear(a1);
  v4 = *a2;
  *a2 = 0;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v4;
  if (v5)
    operator delete(v5);
  v8 = a2[2];
  v7 = a2 + 2;
  v6 = v8;
  v9 = *(v7 - 1);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  v10 = v7[1];
  *(_QWORD *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    v11 = *(_QWORD *)(v6 + 8);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v11 %= v12;
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v11) = a1 + 16;
    *v7 = 0;
    v7[1] = 0;
  }
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void REFancyShrinkingDictionary::REFancyShrinkingDictionary(REFancyShrinkingDictionary *this, unint64_t a2, unint64_t a3, int a4, BOOL a5, BOOL a6)
{
  this->m_mapDocumentFrequency.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&this->m_mapDocumentFrequency.__table_.__p1_.__value_.__next_ = 0u;
  this->m_mapDocumentFrequency.__table_.__p3_.__value_ = 1.0;
  this->m_maxSize = a2;
  this->m_shrinkSize = a3;
  this->m_nVersion = a4;
  this->m_trimTop = a5;
  this->m_shinksOnTotalCount = a6;
}

{
  this->m_mapDocumentFrequency.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&this->m_mapDocumentFrequency.__table_.__p1_.__value_.__next_ = 0u;
  this->m_mapDocumentFrequency.__table_.__p3_.__value_ = 1.0;
  this->m_maxSize = a2;
  this->m_shrinkSize = a3;
  this->m_nVersion = a4;
  this->m_trimTop = a5;
  this->m_shinksOnTotalCount = a6;
}

void sub_2133170AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void REOptimizeFeatureSetGraph(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v1;
  objc_msgSend(v1, "allFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  while (1)
  {

    if (!objc_msgSend(v4, "count"))
      break;
    objc_msgSend(v4, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeLastObject");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "_dependentFeatures");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v2, "member:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v11;
          if (v11)
            v13 = v11 == (_QWORD)v10;
          else
            v13 = 1;
          if (v13)
          {
            if (!v11)
            {
              objc_msgSend(v4, "addObject:", v10);
              objc_msgSend(v2, "addObject:", v10);
            }
          }
          else
          {
            objc_msgSend(v3, "_replaceDependentFeature:withFeature:", v10, v11);
            v14 = v12;

            v10 = v14;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__18(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__27(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__30(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x2199B2434](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void sub_213318018(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL BayesianModel::InitializeFeatures(BayesianModel *this, int a2, int a3, double a4, unint64_t a5, double a6)
{
  double v12;
  double v13;
  int m_nFeaturesCount;
  char *v15;
  unint64_t v17;
  unint64_t *v18;

  pthread_rwlock_wrlock(&this->m_rwlock);
  this->m_nFeaturesCount = a3 + 1;
  if (a3 <= 249)
  {
    *(_OWORD *)&this->m_nTotalTrue = 0u;
    this->m_nNumberOfTraining = 0;
    *(_OWORD *)&this->m_dSumPredictions = 0u;
    this->m_dNormalizedLogScore = 0.0;
    *(_OWORD *)this->m_nCalibrationCurveTrue = 0u;
    *(_OWORD *)&this->m_nCalibrationCurveTrue[2] = 0u;
    *(_OWORD *)&this->m_nCalibrationCurveTrue[4] = 0u;
    *(_OWORD *)&this->m_nCalibrationCurveTrue[6] = 0u;
    *(_OWORD *)&this->m_nCalibrationCurveTrue[8] = 0u;
    *(_OWORD *)this->m_nCalibrationCurveCount = 0u;
    *(_OWORD *)&this->m_nCalibrationCurveCount[2] = 0u;
    *(_OWORD *)&this->m_nCalibrationCurveCount[4] = 0u;
    *(_OWORD *)&this->m_nCalibrationCurveCount[6] = 0u;
    this->m_nModelVersion = a2;
    *(_OWORD *)&this->m_nCalibrationCurveCount[8] = 0u;
    std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::clear(&this->m_features.__table_.__bucket_list_.__ptr_.__value_);
    this->m_maxFeatureCoordinates = a5;
    this->m_dEpsilon = a6;
    StdNormal_Inv(a4);
    v13 = v12;
    m_nFeaturesCount = this->m_nFeaturesCount;
    v17 = 0xFF00000000000000;
    v18 = &v17;
    v15 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&this->m_features, &v17, (uint64_t)&std::piecewise_construct, &v18);
    *((_QWORD *)v15 + 3) = 0x3FF0000000000000;
    *((double *)v15 + 4) = v13 * sqrt((double)m_nFeaturesCount + (double)m_nFeaturesCount);
  }
  pthread_rwlock_unlock(&this->m_rwlock);
  return a3 < 250;
}

void sub_21331829C(_Unwind_Exception *a1)
{
  pthread_rwlock_t *v1;

  pthread_rwlock_unlock(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::clear(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result[3])
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      do
      {
        v2 = (_QWORD *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void StdNormal_Inv(double a1)
{
  BOOL v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v1 = a1 >= 0.0 && a1 <= 1.0;
  if (v1 && a1 != 0.0 && a1 != 1.0)
  {
    if (1.0 - a1 >= a1)
      v2 = a1;
    else
      v2 = 1.0 - a1;
    if (v2 <= 0.02425)
    {
      v6 = sqrt(log(v2) * -2.0);
      v5 = (((((v6 * -0.007784894 + -0.322396458) * v6 + -2.40075828) * v6 + -2.54973254) * v6 + 4.37466414) * v6
          + 2.93816398)
         / ((((v6 * 0.00778469571 + 0.322467129) * v6 + 2.44513414) * v6 + 3.75440866) * v6 + 1.0);
    }
    else
    {
      v3 = v2 + -0.5;
      v4 = v3 * v3;
      v5 = v3
         * (((((v3 * v3 * -39.6968303 + 220.946098) * (v3 * v3) + -275.92851) * (v3 * v3) + 138.357752) * (v3 * v3)
           + -30.6647981)
          * (v3
           * v3)
          + 2.50662828)
         / (((((v4 * -54.4760988 + 161.585837) * v4 + -155.69898) * v4 + 66.8013119) * v4 + -13.2806816) * v4 + 1.0);
    }
    StdNormal_Cdf(v5);
    exp(v5 * v5 * 0.5);
  }
}

void StdNormal_Cdf(double a1)
{
  double v1;

  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
  {
    v1 = fabs(a1);
    if (v1 > 0.662912607)
      exp(-(v1 * v1) * 0.5);
  }
}

void BayesianModel::BayesianModel(BayesianModel *this)
{
  this->m_features.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&this->m_features.__table_.__p1_.__value_.__next_ = 0u;
  this->m_features.__table_.__p3_.__value_ = 1.0;
  this->m_empty = (Gaussian)xmmword_2133E4210;
  this->m_nFeaturesCount = 0;
  this->m_nNumberOfTraining = 0;
  *(_OWORD *)&this->m_nTotalTrue = 0u;
  this->m_dNormalizedLogScore = 0.0;
  *(_OWORD *)&this->m_dSumPredictions = 0u;
  *(_OWORD *)this->m_nCalibrationCurveTrue = 0u;
  *(_OWORD *)&this->m_nCalibrationCurveTrue[2] = 0u;
  *(_OWORD *)&this->m_nCalibrationCurveTrue[4] = 0u;
  *(_OWORD *)&this->m_nCalibrationCurveTrue[6] = 0u;
  *(_OWORD *)&this->m_nCalibrationCurveTrue[8] = 0u;
  *(_OWORD *)this->m_nCalibrationCurveCount = 0u;
  *(_OWORD *)&this->m_nCalibrationCurveCount[2] = 0u;
  *(_OWORD *)&this->m_nCalibrationCurveCount[4] = 0u;
  *(_OWORD *)&this->m_nCalibrationCurveCount[6] = 0u;
  *(_OWORD *)&this->m_nCalibrationCurveCount[8] = 0u;
  pthread_rwlock_init(&this->m_rwlock, 0);
}

void sub_2133189F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

id REValidateObjectOfClass(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id REValidateObjectOfClasses(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        REValidateObjectOfClass(v3);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

float RERelevanceScaleForPriority(unint64_t a1)
{
  float result;

  result = 1.0;
  if (a1 <= 3)
    return flt_2133E40B0[a1];
  return result;
}

double REPercentThroughRange(double a1, double a2, double a3)
{
  double result;

  result = fmin((a1 - a2) / (a3 - a2), 1.0);
  if (result < 0.0)
    return 0.0;
  return result;
}

double REValueThroughRange(double a1, double a2, double a3)
{
  return a2 + (a3 - a2) * a1;
}

uint64_t REScheduledUpdateSortedByDate(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(a1, "updateDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "compare:", v5);
  return v6;
}

void sub_21331D6CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21331E6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return NSRequestConcreteImplementation();
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_21331EBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getNLTagSchemeLemma()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getNLTagSchemeLemmaSymbolLoc_ptr;
  v7 = getNLTagSchemeLemmaSymbolLoc_ptr;
  if (!getNLTagSchemeLemmaSymbolLoc_ptr)
  {
    v1 = (void *)NaturalLanguageLibrary();
    v0 = (id *)dlsym(v1, "NLTagSchemeLemma");
    v5[3] = (uint64_t)v0;
    getNLTagSchemeLemmaSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[RELemmaEnumerator init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t NaturalLanguageLibrary()
{
  uint64_t v0;
  void *v2;

  if (!NaturalLanguageLibraryCore_frameworkLibrary)
    NaturalLanguageLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = NaturalLanguageLibraryCore_frameworkLibrary;
  if (!NaturalLanguageLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getNLTaggerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t *v3;
  uint64_t *v4;

  NaturalLanguageLibrary();
  result = objc_getClass("NLTagger");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getNLTaggerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (uint64_t *)__getNLTaggerClass_block_invoke_cold_1();
    return (Class)re_tokenize_string(v3, v4);
  }
  return result;
}

uint64_t re_tokenize_string(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t i;
  uint64_t v13;
  uint64_t v14;
  const std::string::value_type *v15;
  const std::string::value_type *v16;
  int v17;
  const std::string::value_type *v18;
  std::string::size_type v19;
  std::string *v20;
  std::string::size_type v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  std::string *v31;
  std::string *v32;
  std::string::size_type v33;
  unsigned int v35;
  void *v36;
  std::string v37;
  void *__p[2];
  char v39;
  _QWORD v40[5];
  std::__split_buffer<std::string> __v;
  _QWORD v42[4];

  v42[2] = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return 0;
  if (re_tokenize_string(std::string const&,std::vector<std::string> *)::onceToken != -1)
    dispatch_once(&re_tokenize_string(std::string const&,std::vector<std::string> *)::onceToken, &__block_literal_global_2);
  if (!re_tokenize_string(std::string const&,std::vector<std::string> *)::Enumerator)
    return 0;
  pthread_rwlock_wrlock(&re_tokenize_string(std::string const&,std::vector<std::string> *)::m_rwlock);
  if (*((char *)a1 + 23) >= 0)
    v4 = a1;
  else
    v4 = (uint64_t *)*a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = ___Z18re_tokenize_stringRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPNS_6vectorIS5_NS3_IS5_EEEE_block_invoke_2;
  v40[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
  v40[4] = a2;
  v6 = objc_msgSend((id)re_tokenize_string(std::string const&,std::vector<std::string> *)::Enumerator, "enumerateLemmasInString:withBlock:", v5, v40);
  v7 = v6;
  if ((v6 & 1) != 0)
  {
    v35 = v6;
    v36 = v5;
    v9 = *a2;
    v8 = a2[1];
    std::string::basic_string[abi:ne180100]<0>(__p, " ");
    v10 = (v8 - v9) / 24;
    if (v10 >= 2)
    {
      v11 = 0;
      for (i = 1; i != v10; ++i)
      {
        if (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) <= i - 1)
          std::vector<std::string>::__throw_out_of_range[abi:ne180100]();
        std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)(*a2 + v11), (const void **)__p, (uint64_t)&v37);
        if (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) <= i)
          std::vector<std::string>::__throw_out_of_range[abi:ne180100]();
        v13 = *a2 + v11;
        v16 = *(const std::string::value_type **)(v13 + 24);
        v14 = v13 + 24;
        v15 = v16;
        v17 = *(char *)(v14 + 23);
        if (v17 >= 0)
          v18 = (const std::string::value_type *)v14;
        else
          v18 = v15;
        if (v17 >= 0)
          v19 = *(unsigned __int8 *)(v14 + 23);
        else
          v19 = *(_QWORD *)(v14 + 8);
        v20 = std::string::append(&v37, v18, v19);
        v21 = v20->__r_.__value_.__r.__words[0];
        v42[0] = v20->__r_.__value_.__l.__size_;
        *(_QWORD *)((char *)v42 + 7) = *(std::string::size_type *)((char *)&v20->__r_.__value_.__r.__words[1] + 7);
        v22 = HIBYTE(v20->__r_.__value_.__r.__words[2]);
        v20->__r_.__value_.__l.__size_ = 0;
        v20->__r_.__value_.__r.__words[2] = 0;
        v20->__r_.__value_.__r.__words[0] = 0;
        v23 = a2[1];
        v24 = a2[2];
        if (v23 >= v24)
        {
          v27 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v23 - *a2) >> 3);
          v28 = v27 + 1;
          if (v27 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          v29 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v24 - *a2) >> 3);
          if (2 * v29 > v28)
            v28 = 2 * v29;
          if (v29 >= 0x555555555555555)
            v30 = 0xAAAAAAAAAAAAAAALL;
          else
            v30 = v28;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a2 + 2);
          if (v30)
            v31 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a2 + 2), v30);
          else
            v31 = 0;
          v32 = v31 + v27;
          __v.__first_ = v31;
          __v.__begin_ = v32;
          __v.__end_cap_.__value_ = &v31[v30];
          v33 = v42[0];
          v32->__r_.__value_.__r.__words[0] = v21;
          v32->__r_.__value_.__l.__size_ = v33;
          *(std::string::size_type *)((char *)&v32->__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)v42 + 7);
          *((_BYTE *)&v32->__r_.__value_.__s + 23) = v22;
          __v.__end_ = v32 + 1;
          std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a2, &__v);
          v26 = a2[1];
          std::__split_buffer<std::string>::~__split_buffer(&__v);
        }
        else
        {
          v25 = v42[0];
          *(_QWORD *)v23 = v21;
          *(_QWORD *)(v23 + 8) = v25;
          *(_QWORD *)(v23 + 15) = *(_QWORD *)((char *)v42 + 7);
          *(_BYTE *)(v23 + 23) = v22;
          v26 = v23 + 24;
          a2[1] = v23 + 24;
        }
        a2[1] = v26;
        if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v37.__r_.__value_.__l.__data_);
        v11 += 24;
      }
    }
    if (v39 < 0)
      operator delete(__p[0]);
    v5 = v36;
    v7 = v35;
  }

  pthread_rwlock_unlock(&re_tokenize_string(std::string const&,std::vector<std::string> *)::m_rwlock);
  return v7;
}

void sub_21331F294(_Unwind_Exception *a1, uint64_t a2, void *__p, uint64_t a4, int a5, __int16 a6, char a7, char a8, void *a9, void *a10, int __pa, __int16 __p_4, char __p_6, char __p_7, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, std::__split_buffer<std::string> *a20)
{

  pthread_rwlock_unlock(&re_tokenize_string(std::string const&,std::vector<std::string> *)::m_rwlock);
  _Unwind_Resume(a1);
}

void ___Z18re_tokenize_stringRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPNS_6vectorIS5_NS3_IS5_EEEE_block_invoke()
{
  RELemmaEnumerator *v0;
  void *v1;

  pthread_rwlock_init(&re_tokenize_string(std::string const&,std::vector<std::string> *)::m_rwlock, 0);
  v0 = objc_alloc_init(RELemmaEnumerator);
  v1 = (void *)re_tokenize_string(std::string const&,std::vector<std::string> *)::Enumerator;
  re_tokenize_string(std::string const&,std::vector<std::string> *)::Enumerator = (uint64_t)v0;

}

void ___Z18re_tokenize_stringRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPNS_6vectorIS5_NS3_IS5_EEEE_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  std::string *v13;
  std::string *v14;
  __int128 v15;
  uint64_t v16;
  int v17;
  void *__p[2];
  std::string::size_type v19;
  std::__split_buffer<std::string> __v;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = objc_retainAutorelease(v3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  v6 = *(_QWORD *)(v4 + 16);
  v7 = *(_QWORD *)(v4 + 8);
  if (v7 >= v6)
  {
    v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - *(_QWORD *)v4) >> 3);
    v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - *(_QWORD *)v4) >> 3);
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v10;
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)(v4 + 16);
    if (v12)
      v13 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v4 + 16, v12);
    else
      v13 = 0;
    v14 = v13 + v9;
    __v.__first_ = v13;
    __v.__begin_ = v14;
    __v.__end_cap_.__value_ = &v13[v12];
    v15 = *(_OWORD *)__p;
    v14->__r_.__value_.__r.__words[2] = v19;
    *(_OWORD *)&v14->__r_.__value_.__l.__data_ = v15;
    __p[1] = 0;
    v19 = 0;
    __p[0] = 0;
    __v.__end_ = v14 + 1;
    std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)v4, &__v);
    v16 = *(_QWORD *)(v4 + 8);
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    v17 = SHIBYTE(v19);
    *(_QWORD *)(v4 + 8) = v16;
    if (v17 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v8 = *(_OWORD *)__p;
    *(_QWORD *)(v7 + 16) = v19;
    *(_OWORD *)v7 = v8;
    *(_QWORD *)(v4 + 8) = v7 + 24;
  }

}

void sub_21331F4CC(_Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, std::__split_buffer<std::string> *a7, uint64_t a8, void *__pa, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15)
{
  void *v15;

  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a15);
  if (a14 < 0)
    operator delete(__pa);

  _Unwind_Resume(__p);
}

uint64_t std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  size_t v5;
  size_t v6;
  uint64_t result;
  char *v8;
  const void *v9;
  char *v10;
  const void *v11;

  if (*((char *)a1 + 23) >= 0)
    v5 = *((unsigned __int8 *)a1 + 23);
  else
    v5 = (size_t)a1[1];
  if (*((char *)a2 + 23) >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  result = std::string::basic_string[abi:ne180100](a3, v6 + v5);
  if (*(char *)(result + 23) >= 0)
    v8 = (char *)result;
  else
    v8 = *(char **)result;
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0)
      v9 = a1;
    else
      v9 = *a1;
    result = (uint64_t)memmove(v8, v9, v5);
  }
  v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0)
      v11 = a2;
    else
      v11 = *a2;
    result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

void RETokenizeStringPrewarm()
{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *__p[2];
  char v9;
  void **v10;

  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(&stru_24CF92178, "UTF8String"));
  v5 = 0;
  v6 = 0;
  v7 = 0;
  if ((re_tokenize_string((uint64_t *)__p, &v5) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((v6 - v5) >> 3));
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 != v5)
    {
      v1 = 0;
      v2 = 0;
      do
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "addObject:", v3);

        ++v2;
        v1 += 24;
      }
      while (v2 < 0xAAAAAAAAAAAAAAABLL * ((v6 - v5) >> 3));
    }
    v4 = (void *)objc_msgSend(v0, "copy");

  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  v10 = (void **)&v5;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v10);
  if (v9 < 0)
    operator delete(__p[0]);

}

void sub_21331F740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char *a19)
{
  void *v19;

  a19 = &a10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
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

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::string *v4;
  std::string *begin;
  std::string *end;
  std::string *value;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void std::vector<std::string>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24CF89FE0, MEMORY[0x24BEDAAF0]);
}

void sub_21331F8F0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v9;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100]((uint64_t)this, (void **)&this->__begin_->__r_.__value_.__l.__data_);
  if (this->__first_)
    operator delete(this->__first_);
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::vector<std::string>::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]("vector");
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24CF89FE8, MEMORY[0x24BEDAB00]);
}

void sub_21331FC44(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a2 > 0x16)
  {
    v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17)
      v4 = a2 | 7;
    v5 = v4 + 1;
    v6 = operator new(v4 + 1);
    *(_QWORD *)(a1 + 8) = a2;
    *(_QWORD *)(a1 + 16) = v5 | 0x8000000000000000;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 23) = a2;
  }
  return a1;
}

float REPercentBetweenDates(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  float v15;
  double v16;
  float v17;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, -1, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v11 = v10;

  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v13 = v12;

  v14 = (v13 - v9) / (v11 - v9);
  v15 = expf(v14) * 0.367879441;
  v16 = fmin(v15, 1.0);
  if (v16 < 0.0)
    v16 = 0.0;
  v17 = v16;

  return v17;
}

id REDateFromPercentFromDate(void *a1, float a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  float v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;

  v3 = a1;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, -1, v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2 <= 0.001)
  {
    v11 = v5;
  }
  else
  {
    v6 = fmin((float)(logf(a2) + 1.0), 1.0);
    if (v6 < 0.0)
      v6 = 0.0;
    v7 = v6;
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v9 = v8;
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", REValueThroughRange(v7, v9, v10));
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

void sub_213322DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21332310C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  id *v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v16);
  _Unwind_Resume(a1);
}

__CFString *REStringForUpdateType(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_24CF8AF38[a1];
}

void sub_213324ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133252F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

id RECreateSharedQueueWithQOS(void *a1, dispatch_qos_class_t a2)
{
  void *v3;
  void *v4;

  dispatch_queue_attr_make_with_qos_class(0, a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _RECreateSharedQueueAttr(a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_213326E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213327270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133274D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21332775C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_213327A54(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_213327D18(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_213327F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213328648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21332893C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213328B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t REUpNextUnmodifiedDateBySettingHour()
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "date");
}

void REEnumerateContentAttributesOfElement(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(id, void *, _BYTE *);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v21 = 0;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v6, "content", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v15, "contentEncodedString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v7[2](v7, v16, &v21);
              if (v21)
              {

                goto LABEL_15;
              }
            }

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_15:

  }
}

void sub_21332CFD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21332E11C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_8(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id _REIconDescriptionForDevice(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _Unwind_Exception *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = 2 * (a2 == 1);
  if (a1)
    v4 = 0;
  if (a1 == 1)
    v5 = 2 * (a2 == 1);
  else
    v5 = v4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v6 = (void *)getISImageDescriptorClass_softClass;
  v21 = getISImageDescriptorClass_softClass;
  if (!getISImageDescriptorClass_softClass)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = (uint64_t)__getISImageDescriptorClass_block_invoke;
    v16 = &unk_24CF8AC38;
    v17 = &v18;
    __getISImageDescriptorClass_block_invoke((uint64_t)&v13);
    v6 = (void *)v19[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v18, 8);
  v13 = 0;
  v14 = (uint64_t)&v13;
  v15 = 0x2020000000;
  v8 = (_QWORD *)getkISImageDescriptorHomeScreenSymbolLoc_ptr;
  v16 = (void *)getkISImageDescriptorHomeScreenSymbolLoc_ptr;
  if (!getkISImageDescriptorHomeScreenSymbolLoc_ptr)
  {
    v9 = (void *)IconServicesLibrary();
    v8 = dlsym(v9, "kISImageDescriptorHomeScreen");
    *(_QWORD *)(v14 + 24) = v8;
    getkISImageDescriptorHomeScreenSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v13, 8);
  if (!v8)
  {
    v12 = (_Unwind_Exception *)-[RELemmaEnumerator init].cold.1();
    _Block_object_dispose(&v18, 8);
    _Unwind_Resume(v12);
  }
  objc_msgSend(v7, "imageDescriptorNamed:", *v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setScale:", a3);
  objc_msgSend(v10, "setShape:", v5);
  return v10;
}

uint64_t _REIconVariantForDevice(uint64_t result, uint64_t a2, float a3)
{
  unsigned int v4;

  if (result == 1)
  {
    if (a2)
      return 42;
  }
  else
  {
    if (result)
      return result;
    if (a2)
    {
      if (a3 < 3.0)
        return 47;
      else
        return 48;
    }
  }
  if (a3 < 3.0)
    v4 = 15;
  else
    v4 = 32;
  if (a3 >= 2.0)
    return v4;
  else
    return 0;
}

void sub_213330060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213330294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getISImageDescriptorClass_block_invoke(uint64_t a1)
{
  Class result;

  IconServicesLibrary();
  result = objc_getClass("ISImageDescriptor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getISImageDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getISImageDescriptorClass_block_invoke_cold_1();
    return (Class)IconServicesLibrary();
  }
  return result;
}

uint64_t IconServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!IconServicesLibraryCore_frameworkLibrary)
    IconServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = IconServicesLibraryCore_frameworkLibrary;
  if (!IconServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getNanoResourceGrabberClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!NanoResourceGrabberLibraryCore_frameworkLibrary)
  {
    NanoResourceGrabberLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!NanoResourceGrabberLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("NanoResourceGrabber");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getNanoResourceGrabberClass_block_invoke_cold_1();
    free(v3);
  }
  getNanoResourceGrabberClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

REHTMLDataElement *__getISIconClass_block_invoke(uint64_t a1)
{
  REHTMLDataElement *result;
  REHTMLDataElement *v3;
  SEL v4;
  id v5;

  IconServicesLibrary();
  result = (REHTMLDataElement *)objc_getClass("ISIcon");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getISIconClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (REHTMLDataElement *)__getISIconClass_block_invoke_cold_1();
    return -[REHTMLDataElement initWithData:](v3, v4, v5);
  }
  return result;
}

void sub_213330B60(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_21333128C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133320B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

BOOL REIsPreprocessStartCharacter(int a1)
{
  return a1 == 64;
}

uint64_t REIsAlphaCharacter(int a1)
{
  return ((a1 - 65) < 0x3A) & (0x3FFFFFF03FFFFFFuLL >> (a1 - 65));
}

uint64_t REIsIdentifierStartCharacter(int a1)
{
  if (a1 == 95)
    return 1;
  else
    return ((a1 - 65) < 0x3A) & (0x3FFFFFF03FFFFFFuLL >> (a1 - 65));
}

BOOL REIsIdentifierCharacter(int a1)
{
  if ((a1 - 65) < 0x3A && ((0x3FFFFFF43FFFFFFuLL >> (a1 - 65)) & 1) != 0)
    return 1;
  return a1 == 45 || (a1 - 48) < 0xA;
}

BOOL REIsNumericCharacter(int a1)
{
  return (a1 - 48) < 0xA;
}

uint64_t REIsOperatorCharacter(uint64_t a1)
{
  if (RELoadOperatorCharacterMap_onceToken != -1)
    dispatch_once(&RELoadOperatorCharacterMap_onceToken, &__block_literal_global_13);
  return objc_msgSend((id)REOperatorCharacterSet, "characterIsMember:", a1);
}

__CFString *REStringForPeriodOfDay(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_24CF8BEE8[a1];
}

id REDateIntervalUnion(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3)
  {
    v13 = v4;
LABEL_6:
    v12 = v13;
    goto LABEL_7;
  }
  if (!v4)
  {
    v13 = v3;
    goto LABEL_6;
  }
  objc_msgSend(v3, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "earlierDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "laterDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v8, v11);
LABEL_7:

  return v12;
}

id REDateIntervalMidpoint(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "duration");
  v4 = v3;

  objc_msgSend(v2, "dateByAddingTimeInterval:", v4 * 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id REUpNextDuplicateIntervalsByAddingUnit(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v24 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = a4;
  if (a4)
  {
    v25 = 0;
    do
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v7 = v24;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v8)
      {
        v9 = v8;
        v27 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v30 != v27)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v11, "endDate");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "firstObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "startDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "components:fromDate:toDate:options:", a2, v12, v14, 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = objc_msgSend(v15, "valueForComponent:", a2);
            if (v16 >= 0)
              v17 = v16;
            else
              v17 = -v16;
            if (v17 < a3)
            {
              objc_msgSend(v11, "startDate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", a2, v25 * a3, v18, 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              v20 = objc_alloc(MEMORY[0x24BDD1508]);
              objc_msgSend(v11, "duration");
              v21 = (void *)objc_msgSend(v20, "initWithStartDate:duration:", v19);
              objc_msgSend(v26, "addObject:", v21);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v9);
      }

      ++v25;
    }
    while (v25 != v23);
  }
  objc_msgSend(v26, "sortUsingComparator:", &__block_literal_global_15);

  return v26;
}

uint64_t REIndexOfDateInPeriodsOfDay(void *a1, void *a2)
{
  id v3;
  id v4;
  _REPeriodOfDay *v5;
  void *v6;
  _REPeriodOfDay *v7;
  uint64_t v8;

  v3 = a2;
  v4 = a1;
  v5 = [_REPeriodOfDay alloc];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v4, 0.0);

  v7 = -[_REPeriodOfDay initWithInterval:periodOfDay:](v5, "initWithInterval:periodOfDay:", v6, 2);
  v8 = objc_msgSend(v3, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(v3, "count"), 256, &__block_literal_global_44);

  return v8;
}

void sub_213337084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2133387F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2133389C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_213338CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21333932C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_CDContextQueriesClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_CDContextQueriesClass_softClass;
  v7 = get_CDContextQueriesClass_softClass;
  if (!get_CDContextQueriesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_CDContextQueriesClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __get_CDContextQueriesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2133395C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_CDContextualPredicateClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_CDContextualPredicateClass_softClass;
  v7 = get_CDContextualPredicateClass_softClass;
  if (!get_CDContextualPredicateClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_CDContextualPredicateClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __get_CDContextualPredicateClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213339680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_CDMDCSContextualPredicateClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_CDMDCSContextualPredicateClass_softClass;
  v7 = get_CDMDCSContextualPredicateClass_softClass;
  if (!get_CDMDCSContextualPredicateClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_CDMDCSContextualPredicateClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __get_CDMDCSContextualPredicateClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213339738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_CDContextualChangeRegistrationClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_CDContextualChangeRegistrationClass_softClass;
  v7 = get_CDContextualChangeRegistrationClass_softClass;
  if (!get_CDContextualChangeRegistrationClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_CDContextualChangeRegistrationClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __get_CDContextualChangeRegistrationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213339F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21333A49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21333AFB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void CoreDuetContextLibrary()
{
  void *v0;

  if (!CoreDuetContextLibraryCore_frameworkLibrary)
    CoreDuetContextLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreDuetContextLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void sub_21333BA04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_21333BC60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21333C338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  _Block_object_dispose(&a17, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getHKUnitClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getHKUnitClass_softClass;
  v7 = getHKUnitClass_softClass;
  if (!getHKUnitClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getHKUnitClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __getHKUnitClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21333CD14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void HealthKitLibrary()
{
  void *v0;

  if (!HealthKitLibraryCore_frameworkLibrary)
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getHKUnitClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  HealthKitLibrary();
  result = objc_getClass("HKUnit");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKUnitClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getHKUnitClass_block_invoke_cold_1();
    return (Class)+[REWorkoutRelevanceProvider relevanceSimulatorID](v3, v4);
  }
  return result;
}

void sub_21333D778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21333EFD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21333F70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27)
{
  id *v27;

  _Block_object_dispose(&a27, 8);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21333FB4C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21333FC48(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21333FF20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21334054C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  _Block_object_dispose(&a23, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HealthKitLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (!HealthKitLibraryCore_frameworkLibrary_0)
    HealthKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = HealthKitLibraryCore_frameworkLibrary_0;
  if (!HealthKitLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getHKObserverQueryClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary_0();
  result = objc_getClass("HKObserverQuery");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKObserverQueryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKObserverQueryClass_block_invoke_cold_1();
    return (Class)__getHKSampleTypeClass_block_invoke(v3);
  }
  return result;
}

Class __getHKSampleTypeClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary_0();
  result = objc_getClass("HKSampleType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKSampleTypeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKSampleTypeClass_block_invoke_cold_1();
    return (Class)__getHKQueryClass_block_invoke(v3);
  }
  return result;
}

Class __getHKQueryClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary_0();
  result = objc_getClass("HKQuery");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKQueryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKQueryClass_block_invoke_cold_1();
    return (Class)__getHKSourceClass_block_invoke(v3);
  }
  return result;
}

Class __getHKSourceClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary_0();
  result = objc_getClass("HKSource");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKSourceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKSourceClass_block_invoke_cold_1();
    return (Class)__getHKSampleQueryClass_block_invoke(v3);
  }
  return result;
}

Class __getHKSampleQueryClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  HealthKitLibrary_0();
  result = objc_getClass("HKSampleQuery");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKSampleQueryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getHKSampleQueryClass_block_invoke_cold_1();
    return (Class)__getHKObjectTypeClass_block_invoke(v3);
  }
  return result;
}

Class __getHKObjectTypeClass_block_invoke(uint64_t a1)
{
  Class result;
  REHealthStore *v3;
  SEL v4;

  HealthKitLibrary_0();
  result = objc_getClass("HKObjectType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKObjectTypeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (REHealthStore *)__getHKObjectTypeClass_block_invoke_cold_1();
    return (Class)-[REHealthStore _init](v3, v4);
  }
  return result;
}

id getHKHealthStoreClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getHKHealthStoreClass_softClass;
  v7 = getHKHealthStoreClass_softClass;
  if (!getHKHealthStoreClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getHKHealthStoreClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __getHKHealthStoreClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213340FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKHealthStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HealthKitLibraryCore_frameworkLibrary_1)
  {
    HealthKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!HealthKitLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HKHealthStore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getHKHealthStoreClass_block_invoke_cold_1();
    free(v3);
  }
  getHKHealthStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_213341E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *REDescriptionForTokenType(unint64_t a1)
{
  if (a1 > 0x2D)
    return 0;
  else
    return off_24CF8C5F0[a1];
}

unint64_t REIntegerGCD(unint64_t a1, unint64_t a2)
{
  unint64_t v2;

  if (!a2)
    return a1;
  do
  {
    v2 = a2;
    a2 = a1 % a2;
    a1 = v2;
  }
  while (a2);
  return v2;
}

void sub_2133432D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  uint64_t v21;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v21 - 96), 8);
  _Unwind_Resume(a1);
}

__CFString *REStringForDailyRoutineType(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_24CF8C820[a1];
}

uint64_t REDailyRoutineTypeFromString(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "lowercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("morning")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("evening")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_2133443DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213344744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213344A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213344C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213348704(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_2133496F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMItemTypeClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getBMItemTypeClass_softClass;
  v7 = getBMItemTypeClass_softClass;
  if (!getBMItemTypeClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getBMItemTypeClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __getBMItemTypeClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213349D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMItemClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getBMItemClass_softClass;
  v7 = getBMItemClass_softClass;
  if (!getBMItemClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getBMItemClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __getBMItemClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21334A04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21334A7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMRetrievalFilterClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getBMRetrievalFilterClass_softClass;
  v7 = getBMRetrievalFilterClass_softClass;
  if (!getBMRetrievalFilterClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getBMRetrievalFilterClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __getBMRetrievalFilterClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21334A880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getBMBehaviorRetrieverClass_block_invoke(uint64_t a1)
{
  BehaviorMinerLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("BMBehaviorRetriever");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBMBehaviorRetrieverClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBMBehaviorRetrieverClass_block_invoke_cold_1();
    BehaviorMinerLibrary();
  }
}

void BehaviorMinerLibrary()
{
  void *v0;

  if (!BehaviorMinerLibraryCore_frameworkLibrary)
    BehaviorMinerLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!BehaviorMinerLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getBMItemTypeClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  BehaviorMinerLibrary();
  result = objc_getClass("BMItemType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBMItemTypeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getBMItemTypeClass_block_invoke_cold_1();
    return (Class)__getBMItemClass_block_invoke(v3);
  }
  return result;
}

Class __getBMItemClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  BehaviorMinerLibrary();
  result = objc_getClass("BMItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBMItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getBMItemClass_block_invoke_cold_1();
    return (Class)__getBMRetrievalFilterClass_block_invoke(v3);
  }
  return result;
}

Class __getBMRetrievalFilterClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  BehaviorMinerLibrary();
  result = objc_getClass("BMRetrievalFilter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBMRetrievalFilterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getBMRetrievalFilterClass_block_invoke_cold_1();
    return (Class)__getBMBehaviorStorageClass_block_invoke(v3);
  }
  return result;
}

Class __getBMBehaviorStorageClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;
  unint64_t v4;

  BehaviorMinerLibrary();
  result = objc_getClass("BMBehaviorStorage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBMBehaviorStorageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBMBehaviorStorageClass_block_invoke_cold_1();
    return (Class)BayesianModel::SuperHasher::operator()(v3, v4);
  }
  return result;
}

unint64_t BayesianModel::SuperHasher::operator()(uint64_t a1, unint64_t a2)
{
  return a2 ^ HIDWORD(a2);
}

BOOL BayesianModel::SuperHasher::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a2 == a3;
}

void BayesianModel::~BayesianModel(BayesianModel *this)
{
  pthread_rwlock_destroy(&this->m_rwlock);
  std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::~__hash_table((uint64_t)&this->m_features);
}

uint64_t BayesianModel::SaveModel(uint64_t a1, _QWORD *a2, int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  double v14;
  _QWORD *v15;
  uint64_t i;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *j;
  uint64_t v21;
  _QWORD *v22;
  size_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  size_t v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  size_t v34;
  char __s[16];
  __int128 v37;
  char __str[16];
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  pthread_rwlock_rdlock((pthread_rwlock_t *)a1);
  *(_QWORD *)((char *)a2 + *(_QWORD *)(*a2 - 24) + 16) = 15;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"ModelDefinition\n", 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"ModelVersion\t", 13);
  v6 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"FeaturesCount\t", 14);
  v7 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"TotalTrue\t", 10);
  v8 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"TotalExamples\t", 14);
  v9 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"SumPredictions\t", 15);
  v10 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"LogScore\t", 9);
  v11 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"NormalizedLogScore\t", 19);
  v12 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"\n", 1);
  if ((a3 & 1) != 0)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"\n", 1);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"NegativeEntropy\t", 16);
    v13 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"\n", 1);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"NormalizedEntropy\t", 18);
    v14 = *(double *)(a1 + 280);
    if (v14 != 0.0 && v14 < -1000000.0)
    {
      *(_QWORD *)(a1 + 272) = 0;
      *(_QWORD *)(a1 + 280) = 0;
    }
    v15 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"\n", 1);
  }
  for (i = 0; i != 80; i += 8)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"CalibrationTrue\t", 16);
    v17 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"\n", 1);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"CalibrationCount\t", 17);
    v18 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"\n", 1);
    if (a3)
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"CalibrationValue\t", 17);
      v19 = (_QWORD *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)"\n\n", 2);
    }
  }
  *(_OWORD *)__str = 0u;
  v39 = 0u;
  *(_OWORD *)__s = 0u;
  v37 = 0u;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"Features\n", 9);
  if (a3)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"\n\n\n", 3);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"FeatureID_Value\tFeatureID\tFeatureValue\tPrecisionMean\tPrecision\tMean\tVariance\n", 77);
  }
  for (j = *(_QWORD **)(a1 + 216); j; j = (_QWORD *)*j)
  {
    v21 = j[2];
    snprintf(__str, 0x1FuLL, "%016llX", v21);
    if (a3)
    {
      snprintf(__s, 0x1FuLL, "%016llX", v21 & 0xFFFFFFFFFFFFFFLL);
      v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"0x", 2);
      v23 = strlen(__str);
      v24 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)__str, v23);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)"\t", 1);
      v25 = (_QWORD *)std::ostream::operator<<();
      v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)"\t0x", 3);
      v27 = strlen(__s);
      v28 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)__s, v27);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, (uint64_t)"\t", 1);
      v29 = (_QWORD *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)"\t", 1);
      v30 = (_QWORD *)std::ostream::operator<<();
    }
    else
    {
      v33 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"0x", 2);
      v34 = strlen(__str);
      v30 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)__str, v34);
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v30, (uint64_t)"\t", 1);
    v31 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"\t", 1);
    v32 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)"\n", 1);
  }
  return pthread_rwlock_unlock((pthread_rwlock_t *)a1);
}

void sub_21334B170(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

double BayesianModel::getAverageNegativeEntropy(BayesianModel *this)
{
  unint64_t m_nTotalExamples;

  m_nTotalExamples = this->m_nTotalExamples;
  if (m_nTotalExamples)
    return this->m_dLogScore / (double)m_nTotalExamples;
  else
    return 0.0;
}

BayesianModel *BayesianModel::getAverageNormalizedEntropy(BayesianModel *this)
{
  double m_dNormalizedLogScore;

  m_dNormalizedLogScore = this->m_dNormalizedLogScore;
  if (m_dNormalizedLogScore != 0.0 && m_dNormalizedLogScore < -1000000.0)
  {
    this->m_dLogScore = 0.0;
    this->m_dNormalizedLogScore = 0.0;
  }
  return this;
}

uint64_t BayesianModel::CaptureDebugTable(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  std::string *v5;
  std::string *v6;
  uint64_t v7;
  __int128 v8;
  std::string *end;
  std::vector<std::string>::pointer v10;
  __int128 v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  std::string *v15;
  std::string *v16;
  __int128 v17;
  std::string *v18;
  std::vector<std::string>::pointer v19;
  __int128 v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  std::string *v24;
  std::string *v25;
  __int128 v26;
  std::string *v27;
  std::vector<std::string>::pointer v28;
  __int128 v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  std::string *v33;
  std::string *v34;
  __int128 v35;
  std::string *v36;
  std::vector<std::string>::pointer v37;
  __int128 v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  std::string *v42;
  std::string *v43;
  __int128 v44;
  std::string *v45;
  unint64_t v46;
  uint64_t v47;
  double *i;
  unint64_t v49;
  double v50;
  double v51;
  std::string *v52;
  char *v53;
  char v54;
  std::vector<std::string>::pointer v55;
  std::string::size_type v56;
  std::string *v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  std::string *v61;
  std::string *v62;
  std::string::size_type v63;
  std::vector<std::string>::pointer v64;
  __int128 v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  std::string *v69;
  std::string *v70;
  __int128 v71;
  std::string *v72;
  std::string *v73;
  char *v74;
  char v75;
  std::vector<std::string>::pointer v76;
  std::string::size_type v77;
  std::string *v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  std::string *v82;
  std::string *v83;
  std::string::size_type v84;
  std::vector<std::string>::pointer v85;
  __int128 v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  std::string *v90;
  std::string *v91;
  __int128 v92;
  std::string *v93;
  std::vector<std::string>::pointer v94;
  __int128 v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  std::string *v99;
  std::string *v100;
  __int128 v101;
  std::string *v102;
  unint64_t v103;
  uint64_t v104;
  std::string v106;
  std::vector<std::string> v107;
  std::vector<std::string> v108;
  std::__split_buffer<std::string> __v;
  _QWORD v110[2];
  std::string::value_type __s[16];
  __int128 v112;
  char __str[16];
  __int128 v114;
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  pthread_rwlock_rdlock((pthread_rwlock_t *)a1);
  v4 = *a2;
  v5 = (std::string *)a2[1];
  while (v5 != (std::string *)v4)
  {
    __v.__first_ = --v5;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  }
  a2[1] = v4;
  memset(&v108, 0, sizeof(v108));
  std::string::basic_string[abi:ne180100]<0>(__str, "FeatureID_Value");
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v108.__end_cap_;
  v6 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v108.__end_cap_, 1uLL);
  __v.__first_ = v6;
  __v.__begin_ = v6;
  __v.__end_cap_.__value_ = &v6[v7];
  v8 = *(_OWORD *)__str;
  v6->__r_.__value_.__r.__words[2] = v114;
  *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v8;
  *(_QWORD *)&v114 = 0;
  memset(__str, 0, sizeof(__str));
  __v.__end_ = v6 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v108, &__v);
  end = v108.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v108.__end_ = end;
  if (SBYTE7(v114) < 0)
    operator delete(*(void **)__str);
  std::string::basic_string[abi:ne180100]<0>(__str, "FeatureID");
  v10 = v108.__end_;
  if (v108.__end_ >= v108.__end_cap_.__value_)
  {
    v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)v108.__end_ - (char *)v108.__begin_) >> 3);
    v13 = v12 + 1;
    if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    if (0x5555555555555556 * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3) > v13)
      v13 = 0x5555555555555556 * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3);
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3) >= 0x555555555555555)
      v14 = 0xAAAAAAAAAAAAAAALL;
    else
      v14 = v13;
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v108.__end_cap_;
    if (v14)
      v15 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v108.__end_cap_, v14);
    else
      v15 = 0;
    v16 = v15 + v12;
    __v.__first_ = v15;
    __v.__begin_ = v16;
    __v.__end_cap_.__value_ = &v15[v14];
    v17 = *(_OWORD *)__str;
    v16->__r_.__value_.__r.__words[2] = v114;
    *(_OWORD *)&v16->__r_.__value_.__l.__data_ = v17;
    *(_QWORD *)&v114 = 0;
    memset(__str, 0, sizeof(__str));
    __v.__end_ = v16 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(&v108, &__v);
    v18 = v108.__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    v108.__end_ = v18;
    if (SBYTE7(v114) < 0)
      operator delete(*(void **)__str);
  }
  else
  {
    v11 = *(_OWORD *)__str;
    v108.__end_->__r_.__value_.__r.__words[2] = v114;
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
    v108.__end_ = v10 + 1;
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "FeatureValue");
  v19 = v108.__end_;
  if (v108.__end_ >= v108.__end_cap_.__value_)
  {
    v21 = 0xAAAAAAAAAAAAAAABLL * (((char *)v108.__end_ - (char *)v108.__begin_) >> 3);
    v22 = v21 + 1;
    if (v21 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    if (0x5555555555555556 * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3) > v22)
      v22 = 0x5555555555555556 * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3);
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3) >= 0x555555555555555)
      v23 = 0xAAAAAAAAAAAAAAALL;
    else
      v23 = v22;
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v108.__end_cap_;
    if (v23)
      v24 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v108.__end_cap_, v23);
    else
      v24 = 0;
    v25 = v24 + v21;
    __v.__first_ = v24;
    __v.__begin_ = v25;
    __v.__end_cap_.__value_ = &v24[v23];
    v26 = *(_OWORD *)__str;
    v25->__r_.__value_.__r.__words[2] = v114;
    *(_OWORD *)&v25->__r_.__value_.__l.__data_ = v26;
    *(_QWORD *)&v114 = 0;
    memset(__str, 0, sizeof(__str));
    __v.__end_ = v25 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(&v108, &__v);
    v27 = v108.__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    v108.__end_ = v27;
    if (SBYTE7(v114) < 0)
      operator delete(*(void **)__str);
  }
  else
  {
    v20 = *(_OWORD *)__str;
    v108.__end_->__r_.__value_.__r.__words[2] = v114;
    *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
    v108.__end_ = v19 + 1;
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "Mean");
  v28 = v108.__end_;
  if (v108.__end_ >= v108.__end_cap_.__value_)
  {
    v30 = 0xAAAAAAAAAAAAAAABLL * (((char *)v108.__end_ - (char *)v108.__begin_) >> 3);
    v31 = v30 + 1;
    if (v30 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    if (0x5555555555555556 * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3) > v31)
      v31 = 0x5555555555555556 * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3);
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3) >= 0x555555555555555)
      v32 = 0xAAAAAAAAAAAAAAALL;
    else
      v32 = v31;
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v108.__end_cap_;
    if (v32)
      v33 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v108.__end_cap_, v32);
    else
      v33 = 0;
    v34 = v33 + v30;
    __v.__first_ = v33;
    __v.__begin_ = v34;
    __v.__end_cap_.__value_ = &v33[v32];
    v35 = *(_OWORD *)__str;
    v34->__r_.__value_.__r.__words[2] = v114;
    *(_OWORD *)&v34->__r_.__value_.__l.__data_ = v35;
    *(_QWORD *)&v114 = 0;
    memset(__str, 0, sizeof(__str));
    __v.__end_ = v34 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(&v108, &__v);
    v36 = v108.__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    v108.__end_ = v36;
    if (SBYTE7(v114) < 0)
      operator delete(*(void **)__str);
  }
  else
  {
    v29 = *(_OWORD *)__str;
    v108.__end_->__r_.__value_.__r.__words[2] = v114;
    *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
    v108.__end_ = v28 + 1;
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "Variance");
  v37 = v108.__end_;
  if (v108.__end_ >= v108.__end_cap_.__value_)
  {
    v39 = 0xAAAAAAAAAAAAAAABLL * (((char *)v108.__end_ - (char *)v108.__begin_) >> 3);
    v40 = v39 + 1;
    if (v39 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    if (0x5555555555555556 * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3) > v40)
      v40 = 0x5555555555555556 * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3);
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3) >= 0x555555555555555)
      v41 = 0xAAAAAAAAAAAAAAALL;
    else
      v41 = v40;
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v108.__end_cap_;
    if (v41)
      v42 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v108.__end_cap_, v41);
    else
      v42 = 0;
    v43 = v42 + v39;
    __v.__first_ = v42;
    __v.__begin_ = v43;
    __v.__end_cap_.__value_ = &v42[v41];
    v44 = *(_OWORD *)__str;
    v43->__r_.__value_.__r.__words[2] = v114;
    *(_OWORD *)&v43->__r_.__value_.__l.__data_ = v44;
    *(_QWORD *)&v114 = 0;
    memset(__str, 0, sizeof(__str));
    __v.__end_ = v43 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(&v108, &__v);
    v45 = v108.__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    v108.__end_ = v45;
    if (SBYTE7(v114) < 0)
      operator delete(*(void **)__str);
  }
  else
  {
    v38 = *(_OWORD *)__str;
    v108.__end_->__r_.__value_.__r.__words[2] = v114;
    *(_OWORD *)&v37->__r_.__value_.__l.__data_ = v38;
    v108.__end_ = v37 + 1;
  }
  v46 = a2[1];
  if (v46 >= a2[2])
  {
    v47 = std::vector<std::vector<std::string>>::__push_back_slow_path<std::vector<std::string> const&>(a2, (__int128 **)&v108);
  }
  else
  {
    std::vector<std::vector<std::string>>::__construct_one_at_end[abi:ne180100]<std::vector<std::string> const&>((uint64_t)a2, (__int128 **)&v108);
    v47 = v46 + 24;
  }
  a2[1] = v47;
  *(_OWORD *)__str = 0u;
  v114 = 0u;
  *(_OWORD *)__s = 0u;
  v112 = 0u;
  for (i = *(double **)(a1 + 216); i; i = *(double **)i)
  {
    v49 = *((_QWORD *)i + 2);
    snprintf(__str, 0x1FuLL, "%016llX", v49);
    v50 = i[3];
    v51 = i[4];
    snprintf(__s, 0x1FuLL, "%016llX", v49 & 0xFFFFFFFFFFFFFFLL);
    memset(&v107, 0, sizeof(v107));
    std::string::basic_string[abi:ne180100]<0>(&v106, "0x");
    v52 = std::string::append(&v106, __str);
    v53 = (char *)v52->__r_.__value_.__r.__words[0];
    v110[0] = v52->__r_.__value_.__l.__size_;
    *(_QWORD *)((char *)v110 + 7) = *(std::string::size_type *)((char *)&v52->__r_.__value_.__r.__words[1] + 7);
    v54 = HIBYTE(v52->__r_.__value_.__r.__words[2]);
    v52->__r_.__value_.__l.__size_ = 0;
    v52->__r_.__value_.__r.__words[2] = 0;
    v52->__r_.__value_.__r.__words[0] = 0;
    v55 = v107.__end_;
    if (v107.__end_ >= v107.__end_cap_.__value_)
    {
      v58 = 0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_ - (char *)v107.__begin_) >> 3);
      v59 = v58 + 1;
      if (v58 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) > v59)
        v59 = 0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) >= 0x555555555555555)
        v60 = 0xAAAAAAAAAAAAAAALL;
      else
        v60 = v59;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v107.__end_cap_;
      if (v60)
        v61 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v107.__end_cap_, v60);
      else
        v61 = 0;
      v62 = v61 + v58;
      __v.__first_ = v61;
      __v.__begin_ = v62;
      __v.__end_cap_.__value_ = &v61[v60];
      v63 = v110[0];
      v62->__r_.__value_.__r.__words[0] = (std::string::size_type)v53;
      v62->__r_.__value_.__l.__size_ = v63;
      *(std::string::size_type *)((char *)&v62->__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)v110 + 7);
      *((_BYTE *)&v62->__r_.__value_.__s + 23) = v54;
      __v.__end_ = v62 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v107, &__v);
      v57 = v107.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
    }
    else
    {
      v56 = v110[0];
      v107.__end_->__r_.__value_.__l.__data_ = v53;
      v55->__r_.__value_.__l.__size_ = v56;
      *(std::string::size_type *)((char *)&v55->__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)v110 + 7);
      *((_BYTE *)&v55->__r_.__value_.__s + 23) = v54;
      v57 = v55 + 1;
    }
    v107.__end_ = v57;
    if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v106.__r_.__value_.__l.__data_);
    std::to_string(&v106, HIBYTE(v49));
    v64 = v107.__end_;
    if (v107.__end_ >= v107.__end_cap_.__value_)
    {
      v66 = 0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_ - (char *)v107.__begin_) >> 3);
      v67 = v66 + 1;
      if (v66 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) > v67)
        v67 = 0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) >= 0x555555555555555)
        v68 = 0xAAAAAAAAAAAAAAALL;
      else
        v68 = v67;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v107.__end_cap_;
      if (v68)
        v69 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v107.__end_cap_, v68);
      else
        v69 = 0;
      v70 = v69 + v66;
      __v.__first_ = v69;
      __v.__begin_ = v70;
      __v.__end_cap_.__value_ = &v69[v68];
      v71 = *(_OWORD *)&v106.__r_.__value_.__l.__data_;
      v70->__r_.__value_.__r.__words[2] = v106.__r_.__value_.__r.__words[2];
      *(_OWORD *)&v70->__r_.__value_.__l.__data_ = v71;
      memset(&v106, 0, sizeof(v106));
      __v.__end_ = v70 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v107, &__v);
      v72 = v107.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v107.__end_ = v72;
      if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v106.__r_.__value_.__l.__data_);
    }
    else
    {
      v65 = *(_OWORD *)&v106.__r_.__value_.__l.__data_;
      v107.__end_->__r_.__value_.__r.__words[2] = v106.__r_.__value_.__r.__words[2];
      *(_OWORD *)&v64->__r_.__value_.__l.__data_ = v65;
      v107.__end_ = v64 + 1;
    }
    std::string::basic_string[abi:ne180100]<0>(&v106, "0x");
    v73 = std::string::append(&v106, __s);
    v74 = (char *)v73->__r_.__value_.__r.__words[0];
    v110[0] = v73->__r_.__value_.__l.__size_;
    *(_QWORD *)((char *)v110 + 7) = *(std::string::size_type *)((char *)&v73->__r_.__value_.__r.__words[1] + 7);
    v75 = HIBYTE(v73->__r_.__value_.__r.__words[2]);
    v73->__r_.__value_.__l.__size_ = 0;
    v73->__r_.__value_.__r.__words[2] = 0;
    v73->__r_.__value_.__r.__words[0] = 0;
    v76 = v107.__end_;
    if (v107.__end_ >= v107.__end_cap_.__value_)
    {
      v79 = 0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_ - (char *)v107.__begin_) >> 3);
      v80 = v79 + 1;
      if (v79 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) > v80)
        v80 = 0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) >= 0x555555555555555)
        v81 = 0xAAAAAAAAAAAAAAALL;
      else
        v81 = v80;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v107.__end_cap_;
      if (v81)
        v82 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v107.__end_cap_, v81);
      else
        v82 = 0;
      v83 = v82 + v79;
      __v.__first_ = v82;
      __v.__begin_ = v83;
      __v.__end_cap_.__value_ = &v82[v81];
      v84 = v110[0];
      v83->__r_.__value_.__r.__words[0] = (std::string::size_type)v74;
      v83->__r_.__value_.__l.__size_ = v84;
      *(std::string::size_type *)((char *)&v83->__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)v110 + 7);
      *((_BYTE *)&v83->__r_.__value_.__s + 23) = v75;
      __v.__end_ = v83 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v107, &__v);
      v78 = v107.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
    }
    else
    {
      v77 = v110[0];
      v107.__end_->__r_.__value_.__l.__data_ = v74;
      v76->__r_.__value_.__l.__size_ = v77;
      *(std::string::size_type *)((char *)&v76->__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)v110 + 7);
      *((_BYTE *)&v76->__r_.__value_.__s + 23) = v75;
      v78 = v76 + 1;
    }
    v107.__end_ = v78;
    if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v106.__r_.__value_.__l.__data_);
    std::to_string(&v106, v51 / v50);
    v85 = v107.__end_;
    if (v107.__end_ >= v107.__end_cap_.__value_)
    {
      v87 = 0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_ - (char *)v107.__begin_) >> 3);
      v88 = v87 + 1;
      if (v87 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) > v88)
        v88 = 0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) >= 0x555555555555555)
        v89 = 0xAAAAAAAAAAAAAAALL;
      else
        v89 = v88;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v107.__end_cap_;
      if (v89)
        v90 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v107.__end_cap_, v89);
      else
        v90 = 0;
      v91 = v90 + v87;
      __v.__first_ = v90;
      __v.__begin_ = v91;
      __v.__end_cap_.__value_ = &v90[v89];
      v92 = *(_OWORD *)&v106.__r_.__value_.__l.__data_;
      v91->__r_.__value_.__r.__words[2] = v106.__r_.__value_.__r.__words[2];
      *(_OWORD *)&v91->__r_.__value_.__l.__data_ = v92;
      memset(&v106, 0, sizeof(v106));
      __v.__end_ = v91 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v107, &__v);
      v93 = v107.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v107.__end_ = v93;
      if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v106.__r_.__value_.__l.__data_);
    }
    else
    {
      v86 = *(_OWORD *)&v106.__r_.__value_.__l.__data_;
      v107.__end_->__r_.__value_.__r.__words[2] = v106.__r_.__value_.__r.__words[2];
      *(_OWORD *)&v85->__r_.__value_.__l.__data_ = v86;
      v107.__end_ = v85 + 1;
    }
    std::to_string(&v106, 1.0 / v50);
    v94 = v107.__end_;
    if (v107.__end_ >= v107.__end_cap_.__value_)
    {
      v96 = 0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_ - (char *)v107.__begin_) >> 3);
      v97 = v96 + 1;
      if (v96 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) > v97)
        v97 = 0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) >= 0x555555555555555)
        v98 = 0xAAAAAAAAAAAAAAALL;
      else
        v98 = v97;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v107.__end_cap_;
      if (v98)
        v99 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v107.__end_cap_, v98);
      else
        v99 = 0;
      v100 = v99 + v96;
      __v.__first_ = v99;
      __v.__begin_ = v100;
      __v.__end_cap_.__value_ = &v99[v98];
      v101 = *(_OWORD *)&v106.__r_.__value_.__l.__data_;
      v100->__r_.__value_.__r.__words[2] = v106.__r_.__value_.__r.__words[2];
      *(_OWORD *)&v100->__r_.__value_.__l.__data_ = v101;
      memset(&v106, 0, sizeof(v106));
      __v.__end_ = v100 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v107, &__v);
      v102 = v107.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v107.__end_ = v102;
      if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v106.__r_.__value_.__l.__data_);
    }
    else
    {
      v95 = *(_OWORD *)&v106.__r_.__value_.__l.__data_;
      v107.__end_->__r_.__value_.__r.__words[2] = v106.__r_.__value_.__r.__words[2];
      *(_OWORD *)&v94->__r_.__value_.__l.__data_ = v95;
      v107.__end_ = v94 + 1;
    }
    v103 = a2[1];
    if (v103 >= a2[2])
    {
      v104 = std::vector<std::vector<std::string>>::__push_back_slow_path<std::vector<std::string> const&>(a2, (__int128 **)&v107);
    }
    else
    {
      std::vector<std::vector<std::string>>::__construct_one_at_end[abi:ne180100]<std::vector<std::string> const&>((uint64_t)a2, (__int128 **)&v107);
      v104 = v103 + 24;
    }
    a2[1] = v104;
    __v.__first_ = (std::__split_buffer<std::string>::pointer)&v107;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  }
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v108;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  return pthread_rwlock_unlock((pthread_rwlock_t *)a1);
}

void sub_21334BE30(_Unwind_Exception *a1, uint64_t a2, void *__p, uint64_t a4, int a5, __int16 a6, char a7, char a8, char a9, uint64_t a10, void *__pa, char a12, uint64_t a13, uint64_t a14, std::__split_buffer<std::string> *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  pthread_rwlock_t *v20;
  uint64_t v21;

  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a20);
  if (*(char *)(v21 - 137) < 0)
    operator delete(*(void **)(v21 - 160));
  *(_QWORD *)(v21 - 160) = &a17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v21 - 160));
  pthread_rwlock_unlock(v20);
  _Unwind_Resume(a1);
}

_QWORD *std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v8;
  int v9;
  char v11;

  MEMORY[0x2199B1D08](&v11, a1, 1);
  if (!v11)
    return a1;
  if (*(char *)(a2 + 23) < 0)
  {
    **(_BYTE **)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 23) = 0;
  }
  v6 = 0;
  while (1)
  {
    v7 = *(_QWORD **)((char *)a1 + *(_QWORD *)(*a1 - 24) + 40);
    v8 = (_BYTE *)v7[3];
    if (v8 != (_BYTE *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(_QWORD *))(*v7 + 80))(v7);
    if ((_DWORD)v7 == -1)
      break;
LABEL_9:
    if (v7 == a3)
    {
      v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(_QWORD *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6)
    v9 = 2;
  else
    v9 = 6;
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_21334C098(void *a1)
{
  _QWORD *v1;
  uint64_t v2;

  __cxa_begin_catch(a1);
  v2 = *v1;
  *(_DWORD *)((char *)v1 + *(_QWORD *)(*v1 - 24) + 32) |= 1u;
  if ((*((_BYTE *)v1 + *(_QWORD *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x21334C064);
  }
  __cxa_rethrow();
}

void sub_21334C0DC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

BOOL GaussianValueIsValid(double a1)
{
  return (*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000;
}

_QWORD *std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](_QWORD *a1, const std::string *a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  std::ios_base *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = MEMORY[0x24BEDB858];
  v6 = MEMORY[0x24BEDB858] + 104;
  a1[16] = MEMORY[0x24BEDB858] + 104;
  a1[2] = v5 + 64;
  v7 = a1 + 2;
  v8 = (uint64_t)(a1 + 3);
  v9 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v10 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v11 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  *a1 = v10;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v10 - 24)) = v11;
  a1[1] = 0;
  v12 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  std::ios_base::init(v12, a1 + 3);
  v12[1].__vftable = 0;
  v12[1].__fmtflags_ = -1;
  v13 = v9[4];
  v14 = v9[5];
  a1[2] = v13;
  *(_QWORD *)((char *)v7 + *(_QWORD *)(v13 - 24)) = v14;
  v15 = v9[1];
  *a1 = v15;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v15 - 24)) = v9[6];
  *a1 = v5 + 24;
  a1[16] = v6;
  a1[2] = v5 + 64;
  std::stringbuf::basic_stringbuf[abi:ne180100](v8, a2, a3);
  return a1;
}

void sub_21334C200(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x2199B1DEC](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x24BEDB7F0];
  v3 = *MEMORY[0x24BEDB7F0];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x2199B1DEC](a1 + 128);
  return a1;
}

BOOL BayesianModel::Train(BayesianModel *a1, uint64_t *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BayesianModel *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  long double v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  unint64_t v27;
  double v28;
  double v29;
  double m_dEpsilon;
  double *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double *v37;
  double v38;
  double v39;
  unsigned int v40;
  double v41;
  double v42;
  unint64_t v45;
  double v46;
  double __C;
  void *__p;
  _BYTE *v49;
  uint64_t v50;
  void *v51;
  double *v52;
  uint64_t v53;
  unint64_t *v54;

  v3 = (a2[1] - *a2) >> 3;
  v4 = a1->m_nFeaturesCount - 1;
  if (v3 == v4)
  {
    pthread_rwlock_wrlock(&a1->m_rwlock);
    v51 = 0;
    v52 = 0;
    v53 = 0;
    __p = 0;
    v49 = 0;
    v50 = 0;
    BayesianModel::GetGaussiansAndBias2((uint64_t)a1, a2, (uint64_t)&v51, (uint64_t)&__p);
    ++a1->m_nNumberOfTraining;
    v46 = 0.0;
    __C = 0.0;
    vDSP_sveD((const double *)v51, 1, &__C, ((char *)v52 - (_BYTE *)v51) >> 3);
    vDSP_sveD((const double *)__p, 1, &v46, (v49 - (_BYTE *)__p) >> 3);
    v8 = v46 + (double)a1->m_nFeaturesCount;
    v9 = sqrt(v8);
    v10 = 1.0 / v9;
    if (a3)
      v11 = 1.0;
    else
      v11 = -1.0;
    v12 = v11 * __C * v10;
    StdNormal_Cdf(v12);
    v15 = -v12;
    if (v14 >= 1.0e-300)
      v15 = exp(v12 * v15 * 0.5) / 2.50662827 / v14;
    BayesianModel::w(v13, v10 * (v11 * __C));
    v17 = v16;
    StdNormal_Cdf(__C / sqrt(v46 + (double)a1->m_nFeaturesCount));
    v19 = (int)fmin(v18 * 10.0, 9.0);
    ++a1->m_nCalibrationCurveCount[v19];
    v20 = a1->m_nTotalExamples + 1;
    a1->m_nTotalExamples = v20;
    a1->m_dSumPredictions = v18 + a1->m_dSumPredictions;
    if (a3)
    {
      v21 = v19;
      v22 = a1->m_nTotalTrue + 1;
      a1->m_nTotalTrue = v22;
      a1->m_dLogScore = log(v18) + a1->m_dLogScore;
      a1->m_dNormalizedLogScore = a1->m_dNormalizedLogScore
                                + log((double)(unint64_t)v22 / (double)(unint64_t)v20);
      ++a1->m_nCalibrationCurveTrue[v21];
    }
    else
    {
      a1->m_dLogScore = log(1.0 - v18) + a1->m_dLogScore;
      a1->m_dNormalizedLogScore = a1->m_dNormalizedLogScore
                                + log(1.0 - (double)a1->m_nTotalTrue / (double)(unint64_t)v20);
    }
    v23 = v11 * v15 / v9;
    v24 = *a2;
    v25 = v17 / v8;
    if (a2[1] != *a2)
    {
      v26 = 0;
      v27 = 0;
      do
      {
        v28 = *(double *)((char *)v51 + v26);
        v29 = *(double *)((char *)__p + v26);
        m_dEpsilon = a1->m_dEpsilon;
        v31 = (double *)std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(&a1->m_features.__table_.__bucket_list_.__ptr_.__value_, (_QWORD *)(v24 + v26));
        if (!v31)
        {
          v54 = (unint64_t *)(*a2 + v26);
          v31 = (double *)std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&a1->m_features, v54, (uint64_t)&std::piecewise_construct, &v54);
        }
        v32 = v29 * (1.0 - v29 * v25);
        v33 = v32 / (1.0 - m_dEpsilon + m_dEpsilon * v32);
        v31[3] = 1.0 / v33;
        v31[4] = v33 * ((v28 + v29 * v23) * (1.0 - m_dEpsilon) / v32) * (1.0 / v33);
        ++v27;
        v24 = *a2;
        v26 += 8;
      }
      while (v27 < (a2[1] - *a2) >> 3);
    }
    v45 = 0xFF00000000000000;
    v34 = *(v52 - 1);
    v35 = *(double *)((char *)__p + (char *)v52 - (_BYTE *)v51 - 8);
    v36 = a1->m_dEpsilon;
    v37 = (double *)std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(&a1->m_features.__table_.__bucket_list_.__ptr_.__value_, &v45);
    if (!v37)
    {
      v54 = &v45;
      v37 = (double *)std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&a1->m_features, &v45, (uint64_t)&std::piecewise_construct, &v54);
    }
    v38 = v35 * (1.0 - v35 * v25);
    v39 = v38 / (1.0 - v36 + v36 * v38);
    v37[3] = 1.0 / v39;
    v37[4] = v39 * ((v34 + v35 * v23) * (1.0 - v36) / v38) * (1.0 / v39);
    if (a1->m_features.__table_.__p2_.__value_ > a1->m_maxFeatureCoordinates)
    {
      v40 = 0;
      v41 = 0.95;
      v42 = 0.005;
      do
      {
        BayesianModel::PruneByMean(a1, v42);
        BayesianModel::PruneByVariance(a1, v41);
        v42 = v42 + 0.005;
        v41 = v41 + -0.05;
      }
      while ((double)a1->m_maxFeatureCoordinates * 0.9 < (double)a1->m_features.__table_.__p2_.__value_ && v40++ < 9);
    }
    if (__p)
    {
      v49 = __p;
      operator delete(__p);
    }
    if (v51)
    {
      v52 = (double *)v51;
      operator delete(v51);
    }
    pthread_rwlock_unlock(&a1->m_rwlock);
  }
  return v3 == v4;
}

void sub_21334C700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  pthread_rwlock_t *v17;

  if (__p)
    operator delete(__p);
  if (a16)
    operator delete(a16);
  pthread_rwlock_unlock(v17);
  _Unwind_Resume(a1);
}

void BayesianModel::GetGaussiansAndBias2(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  double *v10;
  unint64_t v11;
  double *v12;
  double v13;
  double *v14;
  double *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  double *v21;
  uint64_t v22;
  unint64_t v23;
  double *v24;
  double v25;
  double *v26;
  double *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  double *v33;
  uint64_t v34;
  _QWORD *v35;
  double *v36;
  unint64_t v37;
  double *v38;
  double v39;
  double *v40;
  double *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  double *v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  double *v51;
  double v52;
  double *v53;
  double *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
  double *v60;
  char *v61;
  uint64_t v62;
  unint64_t v64;

  std::vector<double>::reserve((void **)a3, ((a2[1] - *a2) >> 3) + 1);
  std::vector<double>::reserve((void **)a4, ((a2[1] - *a2) >> 3) + 1);
  v7 = *a2;
  if (a2[1] != *a2)
  {
    v8 = 0;
    do
    {
      v64 = *(_QWORD *)(v7 + 8 * v8);
      v9 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>((_QWORD *)(a1 + 200), &v64);
      if (v9)
        v10 = (double *)(v9 + 3);
      else
        v10 = (double *)(a1 + 480);
      v12 = *(double **)(a3 + 8);
      v11 = *(_QWORD *)(a3 + 16);
      v13 = v10[1] / *v10;
      if ((unint64_t)v12 >= v11)
      {
        v15 = *(double **)a3;
        v16 = ((uint64_t)v12 - *(_QWORD *)a3) >> 3;
        v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 61)
          goto LABEL_75;
        v18 = v11 - (_QWORD)v15;
        if (v18 >> 2 > v17)
          v17 = v18 >> 2;
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
          v19 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v19 = v17;
        if (v19)
        {
          v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(a3 + 16, v19);
          v15 = *(double **)a3;
          v12 = *(double **)(a3 + 8);
        }
        else
        {
          v20 = 0;
        }
        v21 = (double *)&v20[8 * v16];
        *v21 = v13;
        v14 = v21 + 1;
        while (v12 != v15)
        {
          v22 = *((_QWORD *)v12-- - 1);
          *((_QWORD *)v21-- - 1) = v22;
        }
        *(_QWORD *)a3 = v21;
        *(_QWORD *)(a3 + 8) = v14;
        *(_QWORD *)(a3 + 16) = &v20[8 * v19];
        if (v15)
          operator delete(v15);
      }
      else
      {
        *v12 = v13;
        v14 = v12 + 1;
      }
      *(_QWORD *)(a3 + 8) = v14;
      v24 = *(double **)(a4 + 8);
      v23 = *(_QWORD *)(a4 + 16);
      v25 = 1.0 / *v10;
      if ((unint64_t)v24 >= v23)
      {
        v27 = *(double **)a4;
        v28 = ((uint64_t)v24 - *(_QWORD *)a4) >> 3;
        v29 = v28 + 1;
        if ((unint64_t)(v28 + 1) >> 61)
          goto LABEL_76;
        v30 = v23 - (_QWORD)v27;
        if (v30 >> 2 > v29)
          v29 = v30 >> 2;
        if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8)
          v31 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v31 = v29;
        if (v31)
        {
          v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(a4 + 16, v31);
          v27 = *(double **)a4;
          v24 = *(double **)(a4 + 8);
        }
        else
        {
          v32 = 0;
        }
        v33 = (double *)&v32[8 * v28];
        *v33 = v25;
        v26 = v33 + 1;
        while (v24 != v27)
        {
          v34 = *((_QWORD *)v24-- - 1);
          *((_QWORD *)v33-- - 1) = v34;
        }
        *(_QWORD *)a4 = v33;
        *(_QWORD *)(a4 + 8) = v26;
        *(_QWORD *)(a4 + 16) = &v32[8 * v31];
        if (v27)
          operator delete(v27);
      }
      else
      {
        *v24 = v25;
        v26 = v24 + 1;
      }
      *(_QWORD *)(a4 + 8) = v26;
      ++v8;
      v7 = *a2;
    }
    while (v8 < (a2[1] - *a2) >> 3);
  }
  v64 = 0xFF00000000000000;
  v35 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>((_QWORD *)(a1 + 200), &v64);
  if (v35)
    v36 = (double *)(v35 + 3);
  else
    v36 = (double *)(a1 + 480);
  v37 = *(_QWORD *)(a3 + 16);
  v38 = *(double **)(a3 + 8);
  v39 = v36[1] / *v36;
  if ((unint64_t)v38 >= v37)
  {
    v41 = *(double **)a3;
    v42 = ((uint64_t)v38 - *(_QWORD *)a3) >> 3;
    v43 = v42 + 1;
    if ((unint64_t)(v42 + 1) >> 61)
LABEL_75:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v44 = v37 - (_QWORD)v41;
    if (v44 >> 2 > v43)
      v43 = v44 >> 2;
    if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8)
      v45 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v45 = v43;
    if (v45)
    {
      v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(a3 + 16, v45);
      v41 = *(double **)a3;
      v38 = *(double **)(a3 + 8);
    }
    else
    {
      v46 = 0;
    }
    v47 = (double *)&v46[8 * v42];
    v48 = &v46[8 * v45];
    *v47 = v39;
    v40 = v47 + 1;
    while (v38 != v41)
    {
      v49 = *((_QWORD *)v38-- - 1);
      *((_QWORD *)v47-- - 1) = v49;
    }
    *(_QWORD *)a3 = v47;
    *(_QWORD *)(a3 + 8) = v40;
    *(_QWORD *)(a3 + 16) = v48;
    if (v41)
      operator delete(v41);
  }
  else
  {
    *v38 = v39;
    v40 = v38 + 1;
  }
  *(_QWORD *)(a3 + 8) = v40;
  v50 = *(_QWORD *)(a4 + 16);
  v51 = *(double **)(a4 + 8);
  v52 = 1.0 / *v36;
  if ((unint64_t)v51 >= v50)
  {
    v54 = *(double **)a4;
    v55 = ((uint64_t)v51 - *(_QWORD *)a4) >> 3;
    v56 = v55 + 1;
    if ((unint64_t)(v55 + 1) >> 61)
LABEL_76:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v57 = v50 - (_QWORD)v54;
    if (v57 >> 2 > v56)
      v56 = v57 >> 2;
    if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF8)
      v58 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v58 = v56;
    if (v58)
    {
      v59 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(a4 + 16, v58);
      v54 = *(double **)a4;
      v51 = *(double **)(a4 + 8);
    }
    else
    {
      v59 = 0;
    }
    v60 = (double *)&v59[8 * v55];
    v61 = &v59[8 * v58];
    *v60 = v52;
    v53 = v60 + 1;
    while (v51 != v54)
    {
      v62 = *((_QWORD *)v51-- - 1);
      *((_QWORD *)v60-- - 1) = v62;
    }
    *(_QWORD *)a4 = v60;
    *(_QWORD *)(a4 + 8) = v53;
    *(_QWORD *)(a4 + 16) = v61;
    if (v54)
      operator delete(v54);
  }
  else
  {
    *v51 = v52;
    v53 = v51 + 1;
  }
  *(_QWORD *)(a4 + 8) = v53;
}

void BayesianModel::v(BayesianModel *this, double a2)
{
  double v3;

  StdNormal_Cdf(a2);
  if (v3 >= 1.0e-300)
    exp(-a2 * a2 * 0.5);
}

void BayesianModel::w(BayesianModel *this, double a2)
{
  double v3;

  StdNormal_Cdf(a2);
  if (v3 >= 1.0e-300)
    exp(-a2 * a2 * 0.5);
}

uint64_t BayesianModel::PruneByMean(BayesianModel *this, double a2)
{
  double *next;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;
  void *__p;
  char *v19;
  char *v20;

  pthread_rwlock_wrlock(&this->m_rwlock);
  __p = 0;
  v19 = 0;
  v20 = 0;
  next = (double *)this->m_features.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v5 = 0;
    do
    {
      if (fabs(next[4] / next[3]) < a2)
      {
        if (v5 >= v20)
        {
          v7 = (char *)__p;
          v8 = (v5 - (_BYTE *)__p) >> 3;
          v9 = v8 + 1;
          if ((unint64_t)(v8 + 1) >> 61)
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          v10 = v20 - (_BYTE *)__p;
          if ((v20 - (_BYTE *)__p) >> 2 > v9)
            v9 = v10 >> 2;
          if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
            v11 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v11 = v9;
          if (v11)
          {
            v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&v20, v11);
            v7 = (char *)__p;
            v5 = v19;
          }
          else
          {
            v12 = 0;
          }
          v13 = &v12[8 * v8];
          *(double *)v13 = next[2];
          v6 = v13 + 8;
          while (v5 != v7)
          {
            v14 = *((_QWORD *)v5 - 1);
            v5 -= 8;
            *((_QWORD *)v13 - 1) = v14;
            v13 -= 8;
          }
          __p = v13;
          v19 = v6;
          v20 = &v12[8 * v11];
          if (v7)
            operator delete(v7);
        }
        else
        {
          *(double *)v5 = next[2];
          v6 = v5 + 8;
        }
        v19 = v6;
        v5 = v6;
      }
      next = *(double **)next;
    }
    while (next);
    v15 = (char *)__p;
    if (__p != v5)
    {
      do
      {
        v17 = *(_QWORD *)v15;
        std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__erase_unique<unsigned long long>(&this->m_features.__table_.__bucket_list_.__ptr_.__value_, &v17);
        v15 += 8;
      }
      while (v15 != v5);
      v5 = (char *)__p;
    }
    if (v5)
    {
      v19 = v5;
      operator delete(v5);
    }
  }
  return pthread_rwlock_unlock(&this->m_rwlock);
}

void sub_21334CD9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  pthread_rwlock_t *v11;

  if (__p)
    operator delete(__p);
  pthread_rwlock_unlock(v11);
  _Unwind_Resume(a1);
}

uint64_t BayesianModel::PruneByVariance(BayesianModel *this, double a2)
{
  double *next;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;
  void *__p;
  char *v19;
  char *v20;

  pthread_rwlock_wrlock(&this->m_rwlock);
  __p = 0;
  v19 = 0;
  v20 = 0;
  next = (double *)this->m_features.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v5 = 0;
    do
    {
      if (1.0 / next[3] >= a2)
      {
        if (v5 >= v20)
        {
          v7 = (char *)__p;
          v8 = (v5 - (_BYTE *)__p) >> 3;
          v9 = v8 + 1;
          if ((unint64_t)(v8 + 1) >> 61)
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          v10 = v20 - (_BYTE *)__p;
          if ((v20 - (_BYTE *)__p) >> 2 > v9)
            v9 = v10 >> 2;
          if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
            v11 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v11 = v9;
          if (v11)
          {
            v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&v20, v11);
            v7 = (char *)__p;
            v5 = v19;
          }
          else
          {
            v12 = 0;
          }
          v13 = &v12[8 * v8];
          *(double *)v13 = next[2];
          v6 = v13 + 8;
          while (v5 != v7)
          {
            v14 = *((_QWORD *)v5 - 1);
            v5 -= 8;
            *((_QWORD *)v13 - 1) = v14;
            v13 -= 8;
          }
          __p = v13;
          v19 = v6;
          v20 = &v12[8 * v11];
          if (v7)
            operator delete(v7);
        }
        else
        {
          *(double *)v5 = next[2];
          v6 = v5 + 8;
        }
        v19 = v6;
        v5 = v6;
      }
      next = *(double **)next;
    }
    while (next);
    v15 = (char *)__p;
    if (__p != v5)
    {
      do
      {
        v17 = *(_QWORD *)v15;
        std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__erase_unique<unsigned long long>(&this->m_features.__table_.__bucket_list_.__ptr_.__value_, &v17);
        v15 += 8;
      }
      while (v15 != v5);
      v5 = (char *)__p;
    }
    if (v5)
    {
      v19 = v5;
      operator delete(v5);
    }
  }
  return pthread_rwlock_unlock(&this->m_rwlock);
}

void sub_21334CF5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  pthread_rwlock_t *v11;

  if (__p)
    operator delete(__p);
  pthread_rwlock_unlock(v11);
  _Unwind_Resume(a1);
}

uint64_t BayesianModel::Predict@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  int v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v20;
  double __C;
  void *__p;
  _BYTE *v23;
  uint64_t v24;
  void *v25;
  _BYTE *v26;
  uint64_t v27;

  pthread_rwlock_rdlock((pthread_rwlock_t *)a1);
  if (*(int *)(a1 + 240) - 1 == (a2[1] - *a2) >> 3)
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
    __p = 0;
    v23 = 0;
    v24 = 0;
    BayesianModel::GetGaussiansAndBias2(a1, a2, (uint64_t)&v25, (uint64_t)&__p);
    v20 = 0.0;
    __C = 0.0;
    vDSP_sveD((const double *)v25, 1, &__C, (v26 - (_BYTE *)v25) >> 3);
    vDSP_sveD((const double *)__p, 1, &v20, (v23 - (_BYTE *)__p) >> 3);
    v8 = *(_DWORD *)(a1 + 240);
    v9 = v20;
    StdNormal_Inv((a4 + 1.0) * 0.5);
    StdNormal_Cdf(1.0 / sqrt((double)v8) * (__C - v10 * sqrt(v9)));
    *(_QWORD *)(a3 + 24) = v11;
    StdNormal_Cdf(__C / sqrt(v20 + (double)*(int *)(a1 + 240)));
    *(_QWORD *)(a3 + 16) = v12;
    v13 = v20;
    *(double *)a3 = __C;
    *(double *)(a3 + 8) = v13;
    *(_BYTE *)(a3 + 32) = 1;
    if (__p)
    {
      v23 = __p;
      operator delete(__p);
    }
    if (v25)
    {
      v26 = v25;
      operator delete(v25);
    }
  }
  else
  {
    __asm { FMOV            V1.2D, #0.5 }
    *(_OWORD *)a3 = xmmword_2133E4230;
    *(_OWORD *)(a3 + 16) = _Q1;
    *(_BYTE *)(a3 + 32) = 0;
  }
  return pthread_rwlock_unlock((pthread_rwlock_t *)a1);
}

void sub_21334D0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15)
{
  pthread_rwlock_t *v15;

  if (__p)
    operator delete(__p);
  if (a14)
    operator delete(a14);
  pthread_rwlock_unlock(v15);
  _Unwind_Resume(a1);
}

BOOL BayesianModel::Absorb(BayesianModel *this, const BayesianModel *a2)
{
  int m_nFeaturesCount;
  int v3;

  m_nFeaturesCount = this->m_nFeaturesCount;
  v3 = a2->m_nFeaturesCount;
  if (m_nFeaturesCount == v3)
  {
    pthread_rwlock_wrlock(&this->m_rwlock);
    pthread_rwlock_rdlock(&a2->m_rwlock);
    if (this != a2)
    {
      this->m_features.__table_.__p3_.__value_ = a2->m_features.__table_.__p3_.__value_;
      std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned long long,Gaussian>,void *> *>>(&this->m_features.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)a2->m_features.__table_.__p1_.__value_.__next_, 0);
    }
    pthread_rwlock_unlock(&a2->m_rwlock);
    pthread_rwlock_unlock(&this->m_rwlock);
  }
  return m_nFeaturesCount == v3;
}

void sub_21334D1BC(_Unwind_Exception *a1)
{
  pthread_rwlock_t *v1;
  pthread_rwlock_t *v2;

  pthread_rwlock_unlock(v2);
  pthread_rwlock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t BayesianModel::IncreaseVariance(BayesianModel *this, double a2)
{
  double *i;
  double v5;
  double v6;
  double v7;

  pthread_rwlock_wrlock(&this->m_rwlock);
  for (i = (double *)this->m_features.__table_.__p1_.__value_.__next_; i; i = *(double **)i)
  {
    v5 = i[3];
    if (1.0 / v5 < 1.0)
    {
      v6 = 1.0 / (1.0 / v5 + (1.0 - 1.0 / v5) * a2);
      v7 = v6 * (i[4] / v5);
      i[3] = v6;
      i[4] = v7;
    }
  }
  return pthread_rwlock_unlock(&this->m_rwlock);
}

void BayesianModel::GetSums(uint64_t a1, uint64_t a2, double *a3, double *a4)
{
  double *v4;
  uint64_t v5;
  unint64_t v6;
  double v7;

  *a3 = 0.0;
  *a4 = 0.0;
  v4 = *(double **)a2;
  v5 = *(_QWORD *)(a2 + 8) - *(_QWORD *)a2;
  if (v5)
  {
    v6 = v5 >> 4;
    if (v6 <= 1)
      v6 = 1;
    do
    {
      *a3 = *a3 + v4[1] / *v4;
      v7 = *v4;
      v4 += 2;
      *a4 = *a4 + 1.0 / v7;
      --v6;
    }
    while (v6);
  }
}

void BayesianModel::GetGaussiansAndBias(uint64_t a1, uint64_t *a2, char **a3)
{
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  _OWORD *v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  _QWORD *v21;
  _OWORD *v22;
  unint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  unint64_t v36;

  std::vector<Gaussian>::reserve((void **)a3, ((a2[1] - *a2) >> 3) + 1);
  v5 = *a2;
  if (a2[1] != *a2)
  {
    v6 = 0;
    do
    {
      v36 = *(_QWORD *)(v5 + 8 * v6);
      v7 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>((_QWORD *)(a1 + 200), &v36);
      if (v7)
        v8 = v7 + 3;
      else
        v8 = (_OWORD *)(a1 + 480);
      v10 = a3[1];
      v9 = (unint64_t)a3[2];
      if ((unint64_t)v10 >= v9)
      {
        v12 = (v10 - *a3) >> 4;
        v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 60)
          goto LABEL_43;
        v14 = v9 - (_QWORD)*a3;
        if (v14 >> 3 > v13)
          v13 = v14 >> 3;
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
          v15 = 0xFFFFFFFFFFFFFFFLL;
        else
          v15 = v13;
        if (v15)
          v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Gaussian>>((uint64_t)(a3 + 2), v15);
        else
          v16 = 0;
        v17 = &v16[16 * v12];
        *(_OWORD *)v17 = *v8;
        v19 = *a3;
        v18 = a3[1];
        v20 = v17;
        if (v18 != *a3)
        {
          do
          {
            *((_OWORD *)v20 - 1) = *((_OWORD *)v18 - 1);
            v20 -= 16;
            v18 -= 16;
          }
          while (v18 != v19);
          v18 = *a3;
        }
        v11 = v17 + 16;
        *a3 = v20;
        a3[1] = v17 + 16;
        a3[2] = &v16[16 * v15];
        if (v18)
          operator delete(v18);
      }
      else
      {
        *(_OWORD *)v10 = *v8;
        v11 = v10 + 16;
      }
      a3[1] = v11;
      ++v6;
      v5 = *a2;
    }
    while (v6 < (a2[1] - *a2) >> 3);
  }
  v36 = 0xFF00000000000000;
  v21 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>((_QWORD *)(a1 + 200), &v36);
  if (v21)
    v22 = v21 + 3;
  else
    v22 = (_OWORD *)(a1 + 480);
  v23 = (unint64_t)a3[2];
  v24 = a3[1];
  if ((unint64_t)v24 >= v23)
  {
    v26 = (v24 - *a3) >> 4;
    v27 = v26 + 1;
    if ((unint64_t)(v26 + 1) >> 60)
LABEL_43:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v28 = v23 - (_QWORD)*a3;
    if (v28 >> 3 > v27)
      v27 = v28 >> 3;
    if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0)
      v29 = 0xFFFFFFFFFFFFFFFLL;
    else
      v29 = v27;
    if (v29)
      v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Gaussian>>((uint64_t)(a3 + 2), v29);
    else
      v30 = 0;
    v31 = &v30[16 * v26];
    v32 = &v30[16 * v29];
    *(_OWORD *)v31 = *v22;
    v25 = v31 + 16;
    v34 = *a3;
    v33 = a3[1];
    if (v33 != *a3)
    {
      do
      {
        *((_OWORD *)v31 - 1) = *((_OWORD *)v33 - 1);
        v31 -= 16;
        v33 -= 16;
      }
      while (v33 != v34);
      v33 = *a3;
    }
    *a3 = v31;
    a3[1] = v25;
    a3[2] = v32;
    if (v33)
      operator delete(v33);
  }
  else
  {
    *(_OWORD *)v24 = *v22;
    v25 = v24 + 16;
  }
  a3[1] = v25;
}

void std::vector<Gaussian>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 4)
  {
    if (a2 >> 60)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Gaussian>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    v9 = &v6[16 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

Gaussian *BayesianModel::GetGaussian(BayesianModel *this, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v5;

  v5 = a2;
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(&this->m_features.__table_.__bucket_list_.__ptr_.__value_, &v5);
  if (v3)
    return (Gaussian *)(v3 + 3);
  else
    return &this->m_empty;
}

{
  _QWORD *v3;
  uint64_t v5;

  v5 = a2;
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(&this->m_features.__table_.__bucket_list_.__ptr_.__value_, &v5);
  if (v3)
    return (Gaussian *)(v3 + 3);
  else
    return &this->m_empty;
}

Gaussian *BayesianModel::GetGaussian(BayesianModel *this, unsigned __int8 a2, uint64_t a3)
{
  _QWORD *v4;
  unint64_t v6;

  v6 = a3 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)a2 << 56);
  v4 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(&this->m_features.__table_.__bucket_list_.__ptr_.__value_, &v6);
  if (v4)
    return (Gaussian *)(v4 + 3);
  else
    return &this->m_empty;
}

void std::vector<double>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_QWORD *)v11 - 1);
        v11 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

uint64_t BayesianModel::GetFeaturesCount(BayesianModel *this)
{
  return this->m_nFeaturesCount;
}

double BayesianModel::getAverageProbability(BayesianModel *this)
{
  return (double)this->m_nTotalTrue / (double)this->m_nTotalExamples;
}

double BayesianModel::getAveragePrediction(BayesianModel *this)
{
  return this->m_dSumPredictions / (double)this->m_nTotalExamples;
}

double BayesianModel::getMean(BayesianModel *this, unsigned __int8 a2, uint64_t a3)
{
  _QWORD *v4;
  Gaussian *p_m_empty;
  unint64_t v7;

  v7 = a3 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)a2 << 56);
  v4 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(&this->m_features.__table_.__bucket_list_.__ptr_.__value_, &v7);
  p_m_empty = (Gaussian *)(v4 + 3);
  if (!v4)
    p_m_empty = &this->m_empty;
  return p_m_empty->m_dPredicionMean / p_m_empty->m_dPrecision;
}

double BayesianModel::getVariance(BayesianModel *this, unsigned __int8 a2, uint64_t a3)
{
  _QWORD *v4;
  Gaussian *p_m_empty;
  unint64_t v7;

  v7 = a3 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)a2 << 56);
  v4 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(&this->m_features.__table_.__bucket_list_.__ptr_.__value_, &v7);
  p_m_empty = (Gaussian *)(v4 + 3);
  if (!v4)
    p_m_empty = &this->m_empty;
  return 1.0 / p_m_empty->m_dPrecision;
}

double BayesianModel::getCalibration(BayesianModel *this, unsigned int a2)
{
  double result;
  unint64_t v3;

  result = 0.0;
  if (a2 <= 9)
  {
    v3 = this->m_nCalibrationCurveCount[a2];
    if (v3)
      return (double)this->m_nCalibrationCurveTrue[a2] / (double)v3;
  }
  return result;
}

double BayesianModel::getCalibrationCount(BayesianModel *this, unsigned int a2)
{
  double result;

  result = 0.0;
  if (a2 <= 9)
    return (double)this->m_nCalibrationCurveCount[a2];
  return result;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x2199B1D20](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x2199B1D2C](v13);
  return a1;
}

void sub_21334D95C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x2199B1D2C](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21334D93CLL);
}

void sub_21334D9A4(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_21334DAD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *std::vector<std::vector<std::string>>::__construct_one_at_end[abi:ne180100]<std::vector<std::string> const&>(uint64_t a1, __int128 **a2)
{
  std::string *v3;
  std::string *result;

  v3 = *(std::string **)(a1 + 8);
  v3->__r_.__value_.__r.__words[0] = 0;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  result = std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v3, *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3));
  *(_QWORD *)(a1 + 8) = v3 + 1;
  return result;
}

void sub_21334DB48(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<std::string>>::__push_back_slow_path<std::vector<std::string> const&>(uint64_t *a1, __int128 **a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  std::string *v11;
  uint64_t v12;
  void *v14[2];
  std::string *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  else
    v10 = 0;
  v11 = (std::string *)&v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v15 = v11;
  v16 = &v10[24 * v9];
  v11->__r_.__value_.__r.__words[0] = 0;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v11, *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3));
  ++v15;
  std::vector<std::vector<std::string>>::__swap_out_circular_buffer(a1, v14);
  v12 = a1[1];
  std::__split_buffer<std::vector<std::string>>::~__split_buffer(v14);
  return v12;
}

void sub_21334DC5C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<std::string>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  std::string *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_21334DCD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  __int128 v7;
  _QWORD v9[3];
  char v10;
  std::string *v11;
  std::string *v12;

  v4 = this;
  v11 = this;
  v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        v4 = v12;
      }
      else
      {
        v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      v12 = ++v4;
    }
    while (v6 != a3);
  }
  v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_21334DDEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0)
      operator delete(*(void **)(v1 - 24));
    v1 -= 24;
  }
}

uint64_t std::vector<std::vector<std::string>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<std::string>>,std::reverse_iterator<std::vector<std::string>*>,std::reverse_iterator<std::vector<std::string>*>,std::reverse_iterator<std::vector<std::string>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<std::string>>,std::reverse_iterator<std::vector<std::string>*>,std::reverse_iterator<std::vector<std::string>*>,std::reverse_iterator<std::vector<std::string>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::string>>,std::reverse_iterator<std::vector<std::string>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::string>>,std::reverse_iterator<std::vector<std::string>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::string>>,std::reverse_iterator<std::vector<std::string>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::string>>,std::reverse_iterator<std::vector<std::string>*>>::operator()[abi:ne180100](uint64_t a1)
{
  void **v1;
  void **v2;
  void **v3;

  v1 = *(void ***)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(void ***)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = v1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v3);
    v1 += 3;
  }
}

void **std::__split_buffer<std::vector<std::string>>::~__split_buffer(void **a1)
{
  std::__split_buffer<std::vector<std::string>>::clear[abi:ne180100]((uint64_t)a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<std::vector<std::string>>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t i;
  uint64_t v2;
  void **v4;
  void **v5;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    v4 = (void **)(i - 24);
    *(_QWORD *)(a1 + 16) = v4;
    v5 = v4;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v5);
  }
}

uint64_t std::stringbuf::basic_stringbuf[abi:ne180100](uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6;

  v6 = std::streambuf::basic_streambuf();
  *(_QWORD *)v6 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  std::stringbuf::__init_buf_ptrs[abi:ne180100](a1);
  return a1;
}

void sub_21334E180(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 87) < 0)
    operator delete(*v2);
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void std::stringbuf::__init_buf_ptrs[abi:ne180100](uint64_t a1)
{
  std::string *v2;
  char v3;
  std::string *v4;
  unint64_t v5;
  int v6;
  std::string::size_type v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  *(_QWORD *)(a1 + 88) = 0;
  v2 = (std::string *)(a1 + 64);
  v3 = *(_BYTE *)(a1 + 87);
  if (v3 < 0)
  {
    v4 = *(std::string **)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 72);
  }
  else
  {
    v4 = v2;
    v5 = *(unsigned __int8 *)(a1 + 87);
  }
  v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
    v7 = v3 < 0 ? (*(_QWORD *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    v8 = *(char *)(a1 + 87) < 0 ? *(_QWORD *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(_QWORD *)(a1 + 40) = v4;
    *(_QWORD *)(a1 + 48) = v4;
    *(_QWORD *)(a1 + 56) = (char *)v4 + v8;
    if ((*(_BYTE *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        v5 = v5 - v10 - 0x7FFFFFFF;
        *(_QWORD *)(a1 + 48) = v4;
      }
      if (v5)
        *(_QWORD *)(a1 + 48) = (char *)v4 + v5;
    }
  }
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(_QWORD *a1, _QWORD *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2 ^ HIDWORD(*a2);
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2 ^ HIDWORD(*a2);
    if (v3 >= *(_QWORD *)&v2)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(_QWORD **)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  result = (_QWORD *)*v6;
  if (*v6)
  {
    do
    {
      v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == *a2)
          return result;
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(_QWORD *)&v2)
            v8 %= *(_QWORD *)&v2;
        }
        else
        {
          v8 &= *(_QWORD *)&v2 - 1;
        }
        if (v8 != v5)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2 ^ HIDWORD(*a2);
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2 ^ HIDWORD(*a2);
    if (v3 >= *(_QWORD *)&v2)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(_QWORD **)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  result = (_QWORD *)*v6;
  if (*v6)
  {
    do
    {
      v8 = result[1];
      if (v3 == v8)
      {
        if (result[2] == *a2)
          return result;
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(_QWORD *)&v2)
            v8 %= *(_QWORD *)&v2;
        }
        else
        {
          v8 &= *(_QWORD *)&v2 - 1;
        }
        if (v8 != v5)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__erase_unique<unsigned long long>(_QWORD *a1, _QWORD *a2)
{
  uint64_t *result;

  result = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::erase(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  void *v3;
  void *__p;

  v2 = *a2;
  std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::remove(a1, a2, (uint64_t)&__p);
  v3 = __p;
  __p = 0;
  if (v3)
    operator delete(v3);
  return v2;
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::remove@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  v6 = *(_QWORD **)(*result + 8 * v4);
  do
  {
    v7 = v6;
    v6 = (_QWORD *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2)
    goto LABEL_18;
  v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(_QWORD *)&v3)
      v8 %= *(_QWORD *)&v3;
  }
  else
  {
    v8 &= *(_QWORD *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2)
      goto LABEL_19;
    v9 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(_QWORD *)&v3)
        v9 %= *(_QWORD *)&v3;
    }
    else
    {
      v9 &= *(_QWORD *)&v3 - 1;
    }
    if (v9 != v4)
LABEL_19:
      *(_QWORD *)(*result + 8 * v4) = 0;
  }
  v10 = *a2;
  if (*a2)
  {
    v11 = *(_QWORD *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(_QWORD *)&v3)
        v11 %= *(_QWORD *)&v3;
    }
    else
    {
      v11 &= *(_QWORD *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(_QWORD *)(*result + 8 * v11) = v7;
      v10 = *a2;
    }
  }
  *v7 = v10;
  *a2 = 0;
  --result[3];
  *(_QWORD *)a3 = a2;
  *(_QWORD *)(a3 + 8) = result + 2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Gaussian>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

void sub_21334EB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_21334EF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  void *v12;

  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);

  _Unwind_Resume(a1);
}

void sub_21334F0A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21334F20C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  if (a14 < 0)
    operator delete(__p);
  std::ostream::~ostream();
  std::stringbuf::~stringbuf(v15 - 136);
  _Unwind_Resume(a1);
}

uint64_t std::stringbuf::~stringbuf(uint64_t a1)
{
  *(_QWORD *)a1 = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 87) < 0)
    operator delete(*(void **)(a1 + 64));
  return std::streambuf::~streambuf();
}

void sub_21334F3A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  if (a14 < 0)
    operator delete(__p);
  std::ostream::~ostream();
  std::stringbuf::~stringbuf(v15 - 136);
  _Unwind_Resume(a1);
}

std::vector<std::string> *__cdecl std::vector<std::string>::vector(std::vector<std::string> *this, std::vector<std::string>::size_type __n)
{
  std::vector<std::string>::pointer end;
  size_t v5;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<std::string>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    v5 = 24 * ((24 * __n - 24) / 0x18) + 24;
    bzero(end, v5);
    this->__end_ = (std::vector<std::string>::pointer)((char *)end + v5);
  }
  return this;
}

void sub_21334F50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void sub_213351E84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2133521FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, pthread_rwlock_t *a10, void *a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  MEMORY[0x2199B1CF0](&a34);
  pthread_rwlock_unlock(a10);

  _Unwind_Resume(a1);
}

void sub_213352538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  void *v24;
  pthread_rwlock_t *v25;

  pthread_rwlock_unlock(v25);

  _Unwind_Resume(a1);
}

void sub_213352708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  pthread_rwlock_t *v16;

  if (a15 < 0)
    operator delete(__p);
  pthread_rwlock_unlock(v16);

  _Unwind_Resume(a1);
}

void sub_2133527B4(_Unwind_Exception *a1)
{
  pthread_rwlock_t *v1;

  pthread_rwlock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_213352888(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  std::string *v10;
  std::__split_buffer<std::string>::pointer end;
  __int128 v12;
  uint64_t v13;
  std::__split_buffer<std::string> __v;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9)
    v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  else
    v10 = 0;
  end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    end = __v.__end_;
  }
  else
  {
    v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_213352A24(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
}

void RERelevanceEngineDisplayDebugProbabilitiesDidUpdate()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  +[RESingleton sharedInstance](RERelevanceEngineDebugger, "sharedInstance", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "availableEngines");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v6, "coordinator");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "elementRelevanceEngine");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "refreshContent");

        +[RESingleton sharedInstance](RERelevanceEngineDebugger, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "reloadDataSourceForEngine:", v6);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

void sub_2133540B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 232), 8);
  _Unwind_Resume(a1);
}

void REHandlePredictedActionsUpdated(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16C8]), "initWithName:object:userInfo:", a3, a4, a5);
  objc_msgSend(a2, "_requestPredictions:", v6);

}

void sub_21335670C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id soft_RESignificantLocationUpdateNotification()
{
  id *v0;
  id v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  void *(*v8)(uint64_t);
  void *v9;
  uint64_t *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!RelevanceEngineLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24CF8CE80;
    v8 = 0;
    RelevanceEngineLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (RelevanceEngineLibraryCore_frameworkLibrary)
  {
    v3 = 0;
    v4 = &v3;
    v5 = 0x2020000000;
    v0 = (id *)getRESignificantLocationUpdateNotificationSymbolLoc_ptr;
    v6 = getRESignificantLocationUpdateNotificationSymbolLoc_ptr;
    if (!getRESignificantLocationUpdateNotificationSymbolLoc_ptr)
    {
      *(_QWORD *)&v7 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v7 + 1) = 3221225472;
      v8 = __getRESignificantLocationUpdateNotificationSymbolLoc_block_invoke;
      v9 = &unk_24CF8AC38;
      v10 = &v3;
      __getRESignificantLocationUpdateNotificationSymbolLoc_block_invoke((uint64_t)&v7);
      v0 = (id *)v4[3];
    }
    _Block_object_dispose(&v3, 8);
    if (!v0)
    {
      -[RELemmaEnumerator init].cold.1();
      __break(1u);
    }
    v1 = *v0;
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

void sub_213356870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_213356D74(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2133573B0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_213357C50(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void *__getRESignificantLocationUpdateNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (RelevanceEngineLibraryCore_frameworkLibrary)
  {
    v2 = (void *)RelevanceEngineLibraryCore_frameworkLibrary;
  }
  else
  {
    RelevanceEngineLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)RelevanceEngineLibraryCore_frameworkLibrary;
    if (!RelevanceEngineLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "RESignificantLocationUpdateNotification");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getRESignificantLocationUpdateNotificationSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t RECrossFeatureValues(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v6[7];
  _QWORD v7[4];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __RECrossFeatureValues_block_invoke;
  v6[3] = &unk_24CF8CEB8;
  v6[5] = &v8;
  v6[6] = a1;
  v6[4] = v7;
  objc_msgSend(v3, "enumerateObjectsWithOptions:usingBlock:", 2, v6);
  v4 = v9[3];
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(&v8, 8);

  return v4;
}

void sub_213358C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

id RELogFileBaseDirectory()
{
  id v0;

  if (RELogFileBaseDirectory_onceToken != -1)
    dispatch_once(&RELogFileBaseDirectory_onceToken, &__block_literal_global_24);
  if (RELogFileBaseDirectory_ValidDirectory)
  {
    v0 = (id)RELogFileBaseDirectory_BaseDirectory;
  }
  else
  {
    NSTemporaryDirectory();
    v0 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v0;
}

id RENewLogFileNameForTask(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v12;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 252, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)v3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RelevanceEngine-%@-"), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(v1, "stringByAppendingString:", CFSTR("-"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_24CF92178;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%04ld-%02ld-%02ld-%02ld%02ld%02ld"), objc_msgSend(v6, "year"), objc_msgSend(v6, "month"), objc_msgSend(v6, "day"), objc_msgSend(v6, "hour"), objc_msgSend(v6, "minute"), objc_msgSend(v6, "second"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@.logs"), v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id RENewLogFilePathForTask(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  RELogFileBaseDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  RENewLogFileNameForTask(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void REStoreLogFileForTask(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;

  v3 = a2;
  v4 = a1;
  RENewLogFilePathForTask(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v4, "writeToFile:atomically:encoding:error:", v5, 1, 4, &v9);

  v7 = v9;
  if ((v6 & 1) == 0)
  {
    RELogForDomain(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      REStoreLogFileForTask_cold_1((uint64_t)v3, (uint64_t)v7, v8);

  }
}

void sub_213359EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21335A090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21335A244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21335A96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21335AA7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21335B7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  id *v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v15);
  _Unwind_Resume(a1);
}

void sub_21335BDC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  id *v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v11);
  _Unwind_Resume(a1);
}

void sub_21335D408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21335D938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _REPurgeIntentsImageCaches__49165157(int a1)
{
  if (a1)
    dispatch_sync(MEMORY[0x24BDAC9B8], &__block_literal_global_26);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_26);
}

void sub_21335DDD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21335E2A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKSystemEventStreamsClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_DKSystemEventStreamsClass_softClass;
  v7 = get_DKSystemEventStreamsClass_softClass;
  if (!get_DKSystemEventStreamsClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_DKSystemEventStreamsClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __get_DKSystemEventStreamsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21335E92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKKnowledgeStorageDidInsertEventsNotification()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)get_DKKnowledgeStorageDidInsertEventsNotificationSymbolLoc_ptr;
  v7 = get_DKKnowledgeStorageDidInsertEventsNotificationSymbolLoc_ptr;
  if (!get_DKKnowledgeStorageDidInsertEventsNotificationSymbolLoc_ptr)
  {
    v1 = (void *)CoreDuetLibrary();
    v0 = (id *)dlsym(v1, "_DKKnowledgeStorageDidInsertEventsNotification");
    v5[3] = (uint64_t)v0;
    get_DKKnowledgeStorageDidInsertEventsNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[RELemmaEnumerator init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id get_DKKnowledgeStorageDidTombstoneEventsNotification()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)get_DKKnowledgeStorageDidTombstoneEventsNotificationSymbolLoc_ptr;
  v7 = get_DKKnowledgeStorageDidTombstoneEventsNotificationSymbolLoc_ptr;
  if (!get_DKKnowledgeStorageDidTombstoneEventsNotificationSymbolLoc_ptr)
  {
    v1 = (void *)CoreDuetLibrary();
    v0 = (id *)dlsym(v1, "_DKKnowledgeStorageDidTombstoneEventsNotification");
    v5[3] = (uint64_t)v0;
    get_DKKnowledgeStorageDidTombstoneEventsNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[RELemmaEnumerator init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

BOOL isFutureDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  _BOOL8 v5;

  if (!a1)
    return 0;
  v1 = (void *)MEMORY[0x24BDBCE60];
  v2 = a1;
  objc_msgSend(v1, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3);

  v5 = v4 == 1;
  return v5;
}

void sub_21335EFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21335F550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21335F9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21335FE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreDuetLibrary()
{
  uint64_t v0;
  void *v2;

  if (!CoreDuetLibraryCore_frameworkLibrary)
    CoreDuetLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = CoreDuetLibraryCore_frameworkLibrary;
  if (!CoreDuetLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_213360D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *REDisplayStringForPropertyName(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (REDisplayStringForPropertyName_onceToken != -1)
      dispatch_once(&REDisplayStringForPropertyName_onceToken, &__block_literal_global_27);
    objc_msgSend((id)REDisplayStringForPropertyName_CamelCaseRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v1, 0, 0, objc_msgSend(v1, "length"), CFSTR("$1 $2"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedCapitalizedString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = &stru_24CF92178;
  }

  return v3;
}

void sub_2133629F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_213365528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_213366BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

const __CFString *REDescriptionStringFromRelevanceBehavior(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("min");
  if (a1)
    v1 = 0;
  if (a1 == 1)
    return CFSTR("max");
  else
    return v1;
}

uint64_t RETrainingSimulationIsCurrentlyActive()
{
  void *v0;
  uint64_t v1;

  if (_fetchedInternalBuildOnceToken_1 != -1)
    dispatch_once(&_fetchedInternalBuildOnceToken_1, &__block_literal_global_30);
  if (!_isInternalDevice_1)
    return 0;
  +[RESingleton sharedInstance](RETrainingSimulationCoordinator, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isActivelyTraining");

  return v1;
}

void sub_213369F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21336A2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21336A548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getUIWindowClass_block_invoke(uint64_t a1)
{
  Class result;
  id v3;

  if (!UIKitLibraryCore_frameworkLibrary)
  {
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!UIKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("UIWindow");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = __getUIWindowClass_block_invoke_cold_1();
    free(v3);
  }
  getUIWindowClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id REStringForSectionPath(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BDD17C8];
  v2 = a1;
  objc_msgSend(v2, "sectionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "element");

  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@ - %lu"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_21336B930(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

const void *kTaggedFeatureCFRetain(uint64_t a1, const void *a2)
{
  RERetainFeatureValueTaggedPointer(a2);
  return a2;
}

void kTaggedFeatureCFRelease(uint64_t a1, const void *a2)
{
  REReleaseFeatureValueTaggedPointer(a2);
}

uint64_t kTaggedFeatureCFEqual(void *a1, void *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (a1 == a2)
    return 1;
  v4 = REFeatureValueTypeForTaggedPointer((unint64_t)a1);
  if (v4 != REFeatureValueTypeForTaggedPointer((unint64_t)a2))
    return 0;
  REFeatureValueForTaggedPointer(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  REFeatureValueForTaggedPointer(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

uint64_t kTaggedFeatureCFDescription(void *a1)
{
  REDescriptionForTaggedPointer(a1);
  return objc_claimAutoreleasedReturnValue();
}

uint64_t kTaggedFeatureCFApplier(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  if (a2)
  {
    if (!a2[8])
      return (*(uint64_t (**)(void))(*(_QWORD *)a2 + 16))();
  }
  return result;
}

void sub_21336D46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{

  _Unwind_Resume(a1);
}

id REBundleConfiguraitonFromBundle(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;

  v1 = a1;
  v2 = (void *)objc_msgSend(v1, "principalClass");
  if (!v2)
  {
    RELogForDomain(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __53__REDirectoryClassLoader__enumerateClassesWithBlock___block_invoke_cold_1((uint64_t)v1, v4);

    goto LABEL_7;
  }
  if (!objc_msgSend(v2, "isSubclassOfClass:", objc_opt_class()))
  {
LABEL_7:
    v3 = 0;
    goto LABEL_8;
  }
  v3 = (void *)objc_opt_new();
LABEL_8:

  return v3;
}

id REScriptParseOptionsValues(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a1;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "push");
  objc_msgSend(v3, "currentToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 != 32)
  {
LABEL_12:
    objc_msgSend(v3, "consume");
    v11 = (void *)objc_msgSend(v4, "copy");
    goto LABEL_15;
  }
  objc_msgSend(v3, "next");
  if (!REExpectTokenTypeInBuffer(v3, 6uLL, a2))
  {
LABEL_10:
    if (!REExpectTokenTypeInBuffer(v3, 0x21uLL, a2))
    {
      objc_msgSend(v3, "pop");
      goto LABEL_14;
    }
    objc_msgSend(v3, "next");
    goto LABEL_12;
  }
  while (1)
  {
    objc_msgSend(v3, "currentToken");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "next");
    objc_msgSend(v3, "currentToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "type");

    v10 = v7;
    if (v9 != 29)
      goto LABEL_6;
    objc_msgSend(v3, "next");
    if (!REExpectTokenTypeInBuffer(v3, 6uLL, a2))
      break;
    objc_msgSend(v3, "currentToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "next");
LABEL_6:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v7);
    if (!REExpectTokenTypeInBuffer(v3, 0x1BuLL, a2))
    {

      goto LABEL_10;
    }
    objc_msgSend(v3, "next");

    if (!REExpectTokenTypeInBuffer(v3, 6uLL, a2))
      goto LABEL_10;
  }
  objc_msgSend(v3, "pop");

LABEL_14:
  v11 = 0;
LABEL_15:

  return v11;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return objc_opt_class();
}

void sub_21336F3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21336F8EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, const __CFString *a12, uint64_t a13)
{
  void *v13;
  void *v14;
  _QWORD *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  if (a2 == 1)
  {
    v16 = objc_begin_catch(exception_object);
    if (v15)
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v13, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "description");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Unable to transformer %@: %@"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      a12 = CFSTR("REErrorTokenKey");
      objc_msgSend(v14, "token");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      a13 = (uint64_t)v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &a13, &a12, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      RECreateErrorWithCodeMessageAndUseInfo(211, v19, v21);
      *v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_end_catch();
    JUMPOUT(0x21336F8A4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t REPropertyIsInternalAttribute(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("$attrib-"));
}

id REPropertyNameFromInternalAttribute(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  objc_msgSend(v1, "substringFromIndex:", objc_msgSend(CFSTR("$attrib-"), "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t REInternalProperty(uint64_t a1)
{
  return objc_msgSend(CFSTR("$attrib-"), "stringByAppendingString:", a1);
}

uint64_t REEncodeIdentificationProperites()
{
  return objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24CFC1D00);
}

id REUpNextSiriServerInterface()
{
  if (REUpNextSiriServerInterface_onceToken != -1)
    dispatch_once(&REUpNextSiriServerInterface_onceToken, &__block_literal_global_34);
  return (id)REUpNextSiriServerInterface_interface;
}

id REUpNextSiriClientInterface()
{
  if (REUpNextSiriClientInterface_onceToken != -1)
    dispatch_once(&REUpNextSiriClientInterface_onceToken, &__block_literal_global_45);
  return (id)REUpNextSiriClientInterface_interface;
}

void sub_2133724AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133728DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213372A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213372B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCSLPRFDefaultAppDataProviderClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CarouselPreferenceServicesLibraryCore_frameworkLibrary)
  {
    CarouselPreferenceServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CarouselPreferenceServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CSLPRFDefaultAppDataProvider");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCSLPRFDefaultAppDataProviderClass_block_invoke_cold_1();
    free(v3);
  }
  getCSLPRFDefaultAppDataProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *RERelationDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) > 6)
    return 0;
  else
    return off_24CF8E678[a1 + 2];
}

__CFString *REStringFromFeatureType(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_24CF8E6B0[a1];
}

void sub_213376D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2133772F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMPAVRoutingControllerActiveSystemRouteDidChangeNotification()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getMPAVRoutingControllerActiveSystemRouteDidChangeNotificationSymbolLoc_ptr;
  v7 = getMPAVRoutingControllerActiveSystemRouteDidChangeNotificationSymbolLoc_ptr;
  if (!getMPAVRoutingControllerActiveSystemRouteDidChangeNotificationSymbolLoc_ptr)
  {
    v1 = (void *)MediaPlayerLibrary();
    v0 = (id *)dlsym(v1, "MPAVRoutingControllerActiveSystemRouteDidChangeNotification");
    v5[3] = (uint64_t)v0;
    getMPAVRoutingControllerActiveSystemRouteDidChangeNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[RELemmaEnumerator init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

void sub_213377BE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_213377DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMPRequestResponseControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  MediaPlayerLibrary();
  result = objc_getClass("MPRequestResponseController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPRequestResponseControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMPRequestResponseControllerClass_block_invoke_cold_1();
    return (Class)MediaPlayerLibrary();
  }
  return result;
}

uint64_t MediaPlayerLibrary()
{
  uint64_t v0;
  void *v2;

  if (!MediaPlayerLibraryCore_frameworkLibrary)
    MediaPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = MediaPlayerLibraryCore_frameworkLibrary;
  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void __getMPAVRoutingControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v2;

  MediaPlayerLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPAVRoutingController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPAVRoutingControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = __getMPAVRoutingControllerClass_block_invoke_cold_1();
    __getMPCPlayerRequestClass_block_invoke(v2);
  }
}

void __getMPCPlayerRequestClass_block_invoke(uint64_t a1)
{
  MediaPlaybackCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPCPlayerRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPCPlayerRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMPCPlayerRequestClass_block_invoke_cold_1();
    MediaPlaybackCoreLibrary();
  }
}

void MediaPlaybackCoreLibrary()
{
  void *v0;

  if (!MediaPlaybackCoreLibraryCore_frameworkLibrary)
    MediaPlaybackCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!MediaPlaybackCoreLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void __getMPCPlayerPathClass_block_invoke(uint64_t a1)
{
  REDataSourceCatalog *v2;
  SEL v3;

  MediaPlaybackCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPCPlayerPath");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPCPlayerPathClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (REDataSourceCatalog *)__getMPCPlayerPathClass_block_invoke_cold_1();
    -[REDataSourceCatalog dealloc](v2, v3);
  }
}

uint64_t REApplicationIsRestricted(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  +[REApplicationCache sharedInstance](REApplicationCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "applicationIsRestricted:", v1);

  return v3;
}

uint64_t REApplicationIsRemoved(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  +[REApplicationCache sharedInstance](REApplicationCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "applicationIsRemoved:", v1);

  return v3;
}

uint64_t REApplicationIsRemote(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  +[REApplicationCache sharedInstance](REApplicationCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "applicationIsRemote:", v1);

  return v3;
}

id RELocalApplicationIdentifierForRemoteApplication(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  +[REApplicationCache sharedInstance](REApplicationCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localApplicationForRemoteApplication:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id RERemoteApplicationIdentifierForLocalApplication(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  +[REApplicationCache sharedInstance](REApplicationCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteApplicationForLocalApplication:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id REWatchKitExtensionForApplicationIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  +[REApplicationCache sharedInstance](REApplicationCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "watchKitExtensionForApplication:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t REApplicationGetType(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  +[REApplicationCache sharedInstance](REApplicationCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "typeForApplication:", v1);

  return v3;
}

id REApplicationCachePrewarm()
{
  return +[REApplicationCache sharedInstance](REApplicationCache, "sharedInstance");
}

void normal_erf(double a1)
{
  double v1;

  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
  {
    v1 = fabs(a1);
    if (v1 > 0.662912607)
      exp(-(v1 * v1) * 0.5);
  }
}

double scaled_box_muller(double a1, double a2, double a3)
{
  int v6;
  double v7;
  int v8;
  double v9;
  double v10;
  double v11;

  do
  {
    v6 = rand();
    v7 = ((double)v6 + (double)v6) / 2147483650.0 + -1.0;
    v8 = rand();
    v9 = ((double)v8 + (double)v8) / 2147483650.0 + -1.0;
    v10 = v9 * v9;
    v11 = v10 + v7 * v7;
  }
  while (v11 == 0.0 || v11 > 1.0);
  return a1 + v7 * sqrt(log(v10 + v7 * v7) * -2.0 / v11) * a3 * sqrt(a2);
}

void sub_21337A41C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_21337A44C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  sub_21337A41C(a1);
}

id RESharedSerialDispatchQueue()
{
  if (RESharedSerialDispatchQueue_onceToken != -1)
    dispatch_once(&RESharedSerialDispatchQueue_onceToken, &__block_literal_global_42);
  return (id)RESharedSerialDispatchQueue_queue;
}

BOOL REDeviceIsLocked()
{
  int v0;
  BOOL v1;

  if (_RERegisterForLockedStatusChangeIfNecessary_onceToken != -1)
    dispatch_once(&_RERegisterForLockedStatusChangeIfNecessary_onceToken, &__block_literal_global_75_0);
  v0 = MKBGetDeviceLockState();
  if (v0)
    v1 = v0 == 3;
  else
    v1 = 1;
  return !v1;
}

void sub_21337B980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _significantTimeChangeForScheduler(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "schedule");
}

uint64_t _REGetIsInternalBuild()
{
  if (_REGetIsInternalBuild_onceToken != -1)
    dispatch_once(&_REGetIsInternalBuild_onceToken, &__block_literal_global_33);
  return _REGetIsInternalBuild_internal;
}

void _REClearSupergreenUsedQuery()
{
  void *v0;

  os_unfair_lock_lock((os_unfair_lock_t)&lastQueryLock);
  v0 = (void *)lastQueryDate;
  lastQueryDate = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&lastQueryLock);
}

uint64_t _REIsSupergreenUsedInLastInterval(double a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  NSObject *v24;
  const __CFString *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  double v32;
  __int16 v33;
  const __CFString *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)&lastQueryLock);
  if (!_REIsSupergreenUsedInLastInterval_lastInUseCache)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)_REIsSupergreenUsedInLastInterval_lastInUseCache;
    _REIsSupergreenUsedInLastInterval_lastInUseCache = v2;

  }
  if (!lastQueryDate || (objc_msgSend((id)lastQueryDate, "timeIntervalSinceNow"), fabs(v4) > 3600.0))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)lastQueryDate;
    lastQueryDate = v5;

    v7 = (void *)_REIsSupergreenUsedInLastInterval_lastInUseDate;
    _REIsSupergreenUsedInLastInterval_lastInUseDate = 0;

    v8 = CFSTR("com.apple.RelevanceEngine");
    v9 = CFSTR("SupergreenLastInUseDate");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getAllDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:pairedDevice:", v8, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
          objc_msgSend(v16, "objectForKey:", v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17 && (!_REIsSupergreenUsedInLastInterval_lastInUseDate || objc_msgSend(v17, "compare:") == 1))
            objc_storeStrong((id *)&_REIsSupergreenUsedInLastInterval_lastInUseDate, v18);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v13);
    }

    objc_msgSend((id)_REIsSupergreenUsedInLastInterval_lastInUseCache, "removeAllObjects");
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_REIsSupergreenUsedInLastInterval_lastInUseCache, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend((id)_REIsSupergreenUsedInLastInterval_lastInUseCache, "objectForKeyedSubscript:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");
  }
  else
  {
    if (_REIsSupergreenUsedInLastInterval_lastInUseDate)
    {
      objc_msgSend((id)_REIsSupergreenUsedInLastInterval_lastInUseDate, "timeIntervalSinceNow");
      v22 = v23 >= 0.0 || -v23 < a1;
      RELogForDomain(0);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = CFSTR("NO");
        if ((_DWORD)v22)
          v25 = CFSTR("YES");
        *(_DWORD *)buf = 134218242;
        v32 = a1;
        v33 = 2112;
        v34 = v25;
        _os_log_impl(&dword_2132F7000, v24, OS_LOG_TYPE_DEFAULT, "_REIsSupergreenUsedInLastInterval(%f): %@", buf, 0x16u);
      }
    }
    else
    {
      RELogForDomain(0);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v32 = a1;
        _os_log_impl(&dword_2132F7000, v24, OS_LOG_TYPE_DEFAULT, "_REIsSupergreenUsedInLastInterval(%f): NO (no date pref)", buf, 0xCu);
      }
      v22 = 0;
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_REIsSupergreenUsedInLastInterval_lastInUseCache, "setObject:forKeyedSubscript:", v21, v19);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&lastQueryLock);
  return v22;
}

uint64_t REIsSupergreenUsedInLastSevenDays()
{
  return _REIsSupergreenUsedInLastInterval(648000.0);
}

uint64_t REIsSupergreenUsedInLastOneDay()
{
  return _REIsSupergreenUsedInLastInterval(129600.0);
}

float RESupergreenSuggestedImageDonationWidth()
{
  return 68.0;
}

uint64_t REProcessIsRelevanced()
{
  if (REProcessIsRelevanced_onceToken != -1)
    dispatch_once(&REProcessIsRelevanced_onceToken, &__block_literal_global_45_0);
  return REProcessIsRelevanced_IsRelevanced;
}

id REBuildVersion()
{
  if (REBuildVersion_onceToken != -1)
    dispatch_once(&REBuildVersion_onceToken, &__block_literal_global_47_1);
  return (id)REBuildVersion_BuildVersion;
}

id REUpNextDemoUserDefaults()
{
  if (REUpNextDemoUserDefaults_onceToken != -1)
    dispatch_once(&REUpNextDemoUserDefaults_onceToken, &__block_literal_global_50_0);
  return (id)REUpNextDemoUserDefaults_defaults;
}

void RERaiseInternalException(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;

  v10 = (objc_class *)MEMORY[0x24BDD17C8];
  v11 = a2;
  v12 = a1;
  v13 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  RELogForDomain(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    RERaiseInternalException_cold_1(v13, v14);

  RESubmitError(v12, v13);
}

void _REGenerateSimulatedCrash(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void (*v16)(uint64_t, uint64_t, id);
  _Unwind_Exception *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  v10 = a1;
  v11 = a2;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v11, &a9);
  RELogForDomain(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    _REGenerateSimulatedCrash_cold_2(v12, v13);

  v14 = getpid();
  v15 = v12;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v16 = (void (*)(uint64_t, uint64_t, id))getSimulateCrashSymbolLoc_ptr;
  v22 = getSimulateCrashSymbolLoc_ptr;
  if (!getSimulateCrashSymbolLoc_ptr)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __getSimulateCrashSymbolLoc_block_invoke;
    v18[3] = &unk_24CF8AC38;
    v18[4] = &v19;
    __getSimulateCrashSymbolLoc_block_invoke((uint64_t)v18);
    v16 = (void (*)(uint64_t, uint64_t, id))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v16)
  {
    v17 = (_Unwind_Exception *)-[RELemmaEnumerator init].cold.1();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v17);
  }
  v16(v14, 195936478, v15);

}

uint64_t REIsCurrentLocaleCJK()
{
  void *v0;
  void *v1;
  uint64_t v2;

  if (REIsCurrentLocaleCJK_onceToken != -1)
    dispatch_once(&REIsCurrentLocaleCJK_onceToken, &__block_literal_global_55);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend((id)REIsCurrentLocaleCJK__cjkSet, "containsObject:", v1);
  return v2;
}

uint64_t REShowRecentDeveloperDonations()
{
  NSObject *v0;
  const __CFString *v1;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (REShowRecentDeveloperDonations_onceToken != -1)
    dispatch_once(&REShowRecentDeveloperDonations_onceToken, &__block_literal_global_64);
  objc_msgSend((id)REShowRecentDeveloperDonations_defaultAccessLock, "lock");
  if ((REShowRecentDeveloperDonations___needsUpdate & 1) == 0)
  {
    REShowRecentDeveloperDonations___flag = CFPreferencesGetAppBooleanValue(CFSTR("displayRecentDonations"), CFSTR("com.apple.duetexpertd"), 0) != 0;
    RELogForDomain(0);
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      if (REShowRecentDeveloperDonations___flag)
        v1 = CFSTR("YES");
      else
        v1 = CFSTR("NO");
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_2132F7000, v0, OS_LOG_TYPE_DEFAULT, "Is the Display Recent Donations switch on? : %@", (uint8_t *)&v3, 0xCu);
    }

    REShowRecentDeveloperDonations___needsUpdate = 1;
  }
  objc_msgSend((id)REShowRecentDeveloperDonations_defaultAccessLock, "unlock");
  return REShowRecentDeveloperDonations___flag;
}

id REBundle()
{
  if (REBundle_onceToken != -1)
    dispatch_once(&REBundle_onceToken, &__block_literal_global_73_0);
  return (id)REBundle_Bundle;
}

void *__getSimulateCrashSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (CrashReporterSupportLibraryCore_frameworkLibrary)
  {
    v2 = (void *)CrashReporterSupportLibraryCore_frameworkLibrary;
  }
  else
  {
    CrashReporterSupportLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)CrashReporterSupportLibraryCore_frameworkLibrary;
    if (!CrashReporterSupportLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "SimulateCrash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSimulateCrashSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_21337EE64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21337FB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCSLPRFDefaultAppDataProviderClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CarouselPreferenceServicesLibraryCore_frameworkLibrary_0)
  {
    CarouselPreferenceServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!CarouselPreferenceServicesLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CSLPRFDefaultAppDataProvider");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCSLPRFDefaultAppDataProviderClass_block_invoke_cold_1();
    free(v3);
  }
  getCSLPRFDefaultAppDataProviderClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t Int64_SafeTimeIntervalToNSEC(double a1)
{
  if (a1 <= 9223372040.0)
    return (uint64_t)(a1 * 1000000000.0);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

unint64_t UInt64_SafeTimeIntervalToNSEC(double a1)
{
  if (a1 > 1.84467441e10)
    return -1;
  else
    return (unint64_t)(a1 * 1000000000.0);
}

void sub_21338053C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21338210C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id soft__REEngineDefaults()
{
  void *v0;
  id v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  Class (*v8)(uint64_t);
  void *v9;
  uint64_t *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!RelevanceEngineLibraryCore_frameworkLibrary_0)
  {
    v7 = xmmword_24CF8EF30;
    v8 = 0;
    RelevanceEngineLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!RelevanceEngineLibraryCore_frameworkLibrary_0)
    return 0;
  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  v0 = (void *)get_REEngineDefaultsClass_softClass;
  v6 = get_REEngineDefaultsClass_softClass;
  if (!get_REEngineDefaultsClass_softClass)
  {
    *(_QWORD *)&v7 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v7 + 1) = 3221225472;
    v8 = __get_REEngineDefaultsClass_block_invoke;
    v9 = &unk_24CF8AC38;
    v10 = &v3;
    __get_REEngineDefaultsClass_block_invoke((uint64_t)&v7);
    v0 = (void *)v4[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_213385294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void __RE_Cached_updateValue__ShowAllElements()
{
  os_unfair_lock_lock((os_unfair_lock_t)&__RE_Cached_lock__ShowAllElements);
  __RE_Cached_hasValue__ShowAllElements = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&__RE_Cached_lock__ShowAllElements);
  RERelevanceEngineDisplayDebugProbabilitiesDidUpdate();
}

void sub_213385B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id REStartOfDayForDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDBCE48];
    v2 = a1;
    objc_msgSend(v1, "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startOfDayForDate:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id REStartOfNextDayForDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDBCE48];
    v2 = a1;
    objc_msgSend(v1, "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, 1, v2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "startOfDayForDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

id REEndOfDayForDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDBCE48];
    v2 = a1;
    objc_msgSend(v1, "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "components:fromDate:", 30, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setHour:", 23);
    objc_msgSend(v4, "setMinute:", 59);
    objc_msgSend(v4, "setSecond:", 59);
    objc_msgSend(v4, "setNanosecond:", 99999999);
    objc_msgSend(v3, "dateFromComponents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

id RERoundDateDownToNearestMinute(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDBCE48];
    v2 = a1;
    objc_msgSend(v1, "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "components:fromDate:", 126, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "dateFromComponents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

id REEndOfDayAfterNumberOfDaysForDate(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v3 = (void *)MEMORY[0x24BDBCE48];
    v4 = a1;
    objc_msgSend(v3, "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setDay:", a2);
    objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    REEndOfDayForDate(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

id REDemoPivotDate()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  REStartOfDayForDate(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateByAddingTimeInterval:", 64800.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id REDemoDateForIdentifier(void *a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = REDemoDateForIdentifier_onceToken;
  v4 = a1;
  if (v3 != -1)
    dispatch_once(&REDemoDateForIdentifier_onceToken, &__block_literal_global_48);
  v5 = objc_msgSend((id)REDemoDateForIdentifier_defaults, "integerForKey:", v4);

  if (v5)
    v6 = v5;
  else
    v6 = a2;
  REDemoPivotDate();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", (double)v6 * 60.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

REForcedRelevanceProvider *REAbsoluteRelevanceProviderForDate(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  REForcedRelevanceProvider *v11;
  double v12;
  REForcedRelevanceProvider *v13;
  REForcedRelevanceProvider *v14;
  double v15;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDD1508]);
  REStartOfDayForDate(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  REEndOfDayForDate(v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  if ((objc_msgSend(v6, "containsDate:", v1) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "components:fromDate:", 96, v1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (float)objc_msgSend(v8, "minute");
    v10 = 1.0 - ((v9 + (float)objc_msgSend(v8, "hour") * 60.0) / 1440.0 * 0.9 + 0.1);
    v11 = [REForcedRelevanceProvider alloc];
    *(float *)&v12 = v10;
    v13 = -[REForcedRelevanceProvider initWithForcedRelevance:](v11, "initWithForcedRelevance:", v12);

  }
  else
  {
    v14 = [REForcedRelevanceProvider alloc];
    LODWORD(v15) = 0;
    v13 = -[REForcedRelevanceProvider initWithForcedRelevance:](v14, "initWithForcedRelevance:", v15);
  }

  return v13;
}

id REDemoElementsFromElements(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        __REDemoElementsFromElements_block_invoke(v4, *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8, (_QWORD)v11);

        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v5 = v4;
    }
    while (v4);
  }

  v9 = (void *)objc_msgSend(v2, "copy");
  return v9;
}

id REDateByRemovingSubseconds(void *a1)
{
  double v1;

  if (a1)
  {
    objc_msgSend(a1, "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", floor(v1));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

uint64_t REDateOccursToday(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v1 = (void *)MEMORY[0x24BDBCE60];
  v2 = a1;
  objc_msgSend(v1, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDD1508]);
  REStartOfDayForDate(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  REEndOfDayForDate(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithStartDate:endDate:", v5, v6);

  v8 = objc_msgSend(v7, "containsDate:", v2);
  return v8;
}

void sub_2133870C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLKDateTextProviderClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCLKDateTextProviderClass_softClass;
  v7 = getCLKDateTextProviderClass_softClass;
  if (!getCLKDateTextProviderClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCLKDateTextProviderClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __getCLKDateTextProviderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213387590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLKRelativeDateTextProviderClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCLKRelativeDateTextProviderClass_softClass;
  v7 = getCLKRelativeDateTextProviderClass_softClass;
  if (!getCLKRelativeDateTextProviderClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCLKRelativeDateTextProviderClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __getCLKRelativeDateTextProviderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213387648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLKSimpleTextProviderClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCLKSimpleTextProviderClass_softClass;
  v7 = getCLKSimpleTextProviderClass_softClass;
  if (!getCLKSimpleTextProviderClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCLKSimpleTextProviderClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __getCLKSimpleTextProviderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213387700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLKTimeIntervalTextProviderClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCLKTimeIntervalTextProviderClass_softClass;
  v7 = getCLKTimeIntervalTextProviderClass_softClass;
  if (!getCLKTimeIntervalTextProviderClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCLKTimeIntervalTextProviderClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __getCLKTimeIntervalTextProviderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2133877B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLKTimeTextProviderClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCLKTimeTextProviderClass_softClass;
  v7 = getCLKTimeTextProviderClass_softClass;
  if (!getCLKTimeTextProviderClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCLKTimeTextProviderClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __getCLKTimeTextProviderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213387870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCLKTextProviderClass_block_invoke(uint64_t a1)
{
  ClockKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CLKTextProvider");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLKTextProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCLKTextProviderClass_block_invoke_cold_1();
    ClockKitLibrary();
  }
}

void ClockKitLibrary()
{
  void *v0;

  if (!ClockKitLibraryCore_frameworkLibrary)
    ClockKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ClockKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getCLKDateTextProviderClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ClockKitLibrary();
  result = objc_getClass("CLKDateTextProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLKDateTextProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCLKDateTextProviderClass_block_invoke_cold_1();
    return (Class)__getCLKRelativeDateTextProviderClass_block_invoke(v3);
  }
  return result;
}

Class __getCLKRelativeDateTextProviderClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ClockKitLibrary();
  result = objc_getClass("CLKRelativeDateTextProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLKRelativeDateTextProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCLKRelativeDateTextProviderClass_block_invoke_cold_1();
    return (Class)__getCLKSimpleTextProviderClass_block_invoke(v3);
  }
  return result;
}

Class __getCLKSimpleTextProviderClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ClockKitLibrary();
  result = objc_getClass("CLKSimpleTextProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLKSimpleTextProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCLKSimpleTextProviderClass_block_invoke_cold_1();
    return (Class)__getCLKTimeIntervalTextProviderClass_block_invoke(v3);
  }
  return result;
}

Class __getCLKTimeIntervalTextProviderClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ClockKitLibrary();
  result = objc_getClass("CLKTimeIntervalTextProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLKTimeIntervalTextProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCLKTimeIntervalTextProviderClass_block_invoke_cold_1();
    return (Class)__getCLKTimeTextProviderClass_block_invoke(v3);
  }
  return result;
}

_REInterfaceKey *__getCLKTimeTextProviderClass_block_invoke(uint64_t a1)
{
  _REInterfaceKey *result;
  _REInterfaceValue *v3;
  SEL v4;

  ClockKitLibrary();
  result = (_REInterfaceKey *)objc_getClass("CLKTimeTextProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLKTimeTextProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (_REInterfaceValue *)__getCLKTimeTextProviderClass_block_invoke_cold_1();
    return -[_REInterfaceValue type](v3, v4);
  }
  return result;
}

const char *RELogNameForDomain(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x14)
    return "default";
  else
    return off_24CF8F190[a1 - 1];
}

id REElementsLoggableString(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "identifier", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  REElementsIdsLoggableString(v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id REElementsIdsLoggableString(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  void *v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", CFSTR("["));
  if (objc_msgSend(v1, "count"))
  {
    v3 = 0;
    do
    {
      objc_msgSend(v1, "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendString:", v4);

      if (++v3 < objc_msgSend(v1, "count"))
        objc_msgSend(v2, "appendString:", CFSTR(", "));
    }
    while (v3 < objc_msgSend(v1, "count"));
  }
  objc_msgSend(v2, "appendString:", CFSTR("]"));

  return v2;
}

void sub_21338BF84(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21338D294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __RE_Cached_Get__DisplayDebugProbabilities(void *a1)
{
  id v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  char v17;
  _QWORD block[4];
  id v19;
  uint8_t buf[16];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ____RE_Cached_Get__DisplayDebugProbabilities_block_invoke;
  block[3] = &unk_24CF8AAF0;
  v2 = v1;
  v19 = v2;
  if (__RE_Cached_Get__DisplayDebugProbabilities_onceToken != -1)
    dispatch_once(&__RE_Cached_Get__DisplayDebugProbabilities_onceToken, block);
  os_unfair_lock_lock((os_unfair_lock_t)&__RE_Cached_lock__DisplayDebugProbabilities);
  if ((__RE_Cached_hasValue__DisplayDebugProbabilities & 1) == 0)
  {
    v17 = 0;
    v3 = v2;
    if (!v3)
      goto LABEL_17;
    if (!RelevanceEngineLibraryCore_frameworkLibrary_1)
    {
      *(_OWORD *)buf = xmmword_24CF8F688;
      v21 = 0;
      RelevanceEngineLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    }
    if (RelevanceEngineLibraryCore_frameworkLibrary_1
      && (objc_msgSend(soft__REEngineDefaults_0(), "defaultsForEngine:", v3),
          (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v5 = v4;
      v6 = objc_msgSend(v4, "_BOOLValueForKey:set:", CFSTR("DisplayDebugProbabilities"), &v17);
      if (v17)
        v7 = v6;
      else
        v7 = 0;
      RELogForDomain(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_2132F7000, v8, OS_LOG_TYPE_DEFAULT, "Prefs reading value for key DisplayDebugProbabilities: %@", buf, 0xCu);

      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
    if (!v17)
    {
LABEL_17:
      if (!RelevanceEngineLibraryCore_frameworkLibrary_1)
      {
        *(_OWORD *)buf = xmmword_24CF8F688;
        v21 = 0;
        RelevanceEngineLibraryCore_frameworkLibrary_1 = _sl_dlopen();
      }
      if (RelevanceEngineLibraryCore_frameworkLibrary_1)
      {
        objc_msgSend(soft__REEngineDefaults_0(), "globalDefaults");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      v11 = objc_msgSend(v10, "_BOOLValueForKey:set:", CFSTR("DisplayDebugProbabilities"), &v17);
      if (v17)
        v12 = v11;
      else
        v12 = 0;
      RELogForDomain(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v14;
        _os_log_impl(&dword_2132F7000, v13, OS_LOG_TYPE_DEFAULT, "Prefs reading value for key DisplayDebugProbabilities: %@", buf, 0xCu);

      }
      if (v17)
        LOBYTE(v7) = v12;
      else
        LOBYTE(v7) = 0;
    }

    __RE_Cached__DisplayDebugProbabilities = v7;
    __RE_Cached_hasValue__DisplayDebugProbabilities = 1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__RE_Cached_lock__DisplayDebugProbabilities);
  v15 = __RE_Cached__DisplayDebugProbabilities;

  return v15;
}

id soft__REEngineDefaults_0()
{
  void *v0;
  id v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  Class (*v8)(uint64_t);
  void *v9;
  uint64_t *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!RelevanceEngineLibraryCore_frameworkLibrary_1)
  {
    v7 = xmmword_24CF8F688;
    v8 = 0;
    RelevanceEngineLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!RelevanceEngineLibraryCore_frameworkLibrary_1)
    return 0;
  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  v0 = (void *)get_REEngineDefaultsClass_softClass_0;
  v6 = get_REEngineDefaultsClass_softClass_0;
  if (!get_REEngineDefaultsClass_softClass_0)
  {
    *(_QWORD *)&v7 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v7 + 1) = 3221225472;
    v8 = __get_REEngineDefaultsClass_block_invoke_0;
    v9 = &unk_24CF8AC38;
    v10 = &v3;
    __get_REEngineDefaultsClass_block_invoke_0((uint64_t)&v7);
    v0 = (void *)v4[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_21338F360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void __RE_Cached_updateValue__DisplayDebugProbabilities()
{
  os_unfair_lock_lock((os_unfair_lock_t)&__RE_Cached_lock__DisplayDebugProbabilities);
  __RE_Cached_hasValue__DisplayDebugProbabilities = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&__RE_Cached_lock__DisplayDebugProbabilities);
  RERelevanceEngineDisplayDebugProbabilitiesDidUpdate();
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

id REParametersForIntent(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[18];

  v27[16] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "_parameterCombinations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      objc_msgSend(v2, "_validParameterCombinations");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allKeys");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __REParameterComplexitiyComparator_block_invoke;
      v27[3] = &__block_descriptor_40_e11_q24__0_8_16l;
      v27[4] = 1;
      v7 = (void *)MEMORY[0x2199B2434](v27);
      objc_msgSend(v6, "sortedArrayUsingComparator:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v2;
      v11 = v9;
      v12 = v11;
      if (v11)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v14 = v12;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v24 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_msgSend(v10, "valueForKey:", v19, (_QWORD)v23);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, v19);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v16);
        }

        v21 = (void *)objc_msgSend(v13, "copy");
      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = (void *)MEMORY[0x24BDBD1B8];
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

id RESimplifiedParametersForIntent(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  char isKindOfClass;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[5];
  _QWORD v50[18];

  v50[16] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "_parameterCombinations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      v5 = v2;
      v43 = 0;
      v44 = &v43;
      v45 = 0x3032000000;
      v46 = __Block_byref_object_copy__22;
      v47 = __Block_byref_object_dispose__22;
      v48 = 0;
      objc_msgSend(v5, "_parameterCombinations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x24BDAC760];
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __REPrimaryParameterCombinationFromIntent_block_invoke;
      v42[3] = &unk_24CF8F6C8;
      v42[4] = &v43;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v42);
      if (v44[5])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = (void *)objc_msgSend((id)v44[5], "mutableCopy");
          NSStringFromSelector(sel_resumePlayback);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeObject:", v9);

          v10 = objc_msgSend(v8, "copy");
          v11 = (void *)v44[5];
          v44[5] = v10;

        }
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v5, "_validParameterCombinations", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v39 != v15)
                objc_enumerationMutation(v13);
              v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              if (objc_msgSend(v17, "isSubsetOfSet:", v44[5]))
                objc_msgSend(v12, "addObject:", v17);
            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
          }
          while (v14);
        }

        if (objc_msgSend(v12, "count"))
        {
          v49[0] = v7;
          v49[1] = 3221225472;
          v49[2] = __REParameterComplexitiyComparator_block_invoke;
          v49[3] = &__block_descriptor_40_e11_q24__0_8_16l;
          v49[4] = 1;
          v18 = (void *)MEMORY[0x2199B2434](v49);
          objc_msgSend(v12, "sortUsingComparator:", v18);

          objc_msgSend(v12, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

      _Block_object_dispose(&v43, 8);
      if (v19)
      {
        v21 = v5;
        v22 = v19;
      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        objc_msgSend(v5, "_validParameterCombinations");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "allKeys");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v50[0] = v7;
        v50[1] = 3221225472;
        v50[2] = __REParameterComplexitiyComparator_block_invoke;
        v50[3] = &__block_descriptor_40_e11_q24__0_8_16l;
        v50[4] = (isKindOfClass & 1) == 0;
        v26 = (void *)MEMORY[0x2199B2434](v50);
        objc_msgSend(v25, "sortedArrayUsingComparator:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = v5;
        v22 = v28;
        if (!v22)
        {
          v20 = 0;
LABEL_33:

          goto LABEL_34;
        }
      }
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v31 = v22;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v39 != v33)
              objc_enumerationMutation(v31);
            v35 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
            objc_msgSend(v5, "valueForKey:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v36, v35);

          }
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
        }
        while (v32);
      }

      v20 = (void *)objc_msgSend(v30, "copy");
      goto LABEL_33;
    }
    v20 = (void *)MEMORY[0x24BDBD1B8];
  }
  else
  {
    v20 = 0;
  }
LABEL_34:

  return v20;
}

void sub_21338FBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id REIntentBySimplifyingParametersForIntent(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    RESimplifiedParametersForIntent(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v2, "_keyImage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_emptyCopy");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __REIntentBySimplifyingParametersForIntent_block_invoke;
      v8[3] = &unk_24CF8A8B8;
      v2 = v5;
      v9 = v2;
      objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);
      if (v4)
      {
        objc_msgSend(v2, "_keyImage");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v6)
          objc_msgSend(v2, "_setDefaultImage:", v4);
      }

    }
    v2 = v2;

  }
  return v2;
}

id RERelevanceProviderForRelevanceProviders(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  REDailyRoutineRelevanceProvider *v12;
  void *v13;
  void *v14;
  void *v15;
  REDateRelevanceProvider *v16;
  double v17;
  double v18;
  REDateRelevanceProvider *v19;
  void *v20;
  void *v21;
  REDateRelevanceProvider *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  REDateRelevanceProvider *v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  REDailyRoutineRelevanceProvider *v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  REGeofenceRelevanceProvider *v40;
  RELocationRelevanceProvider *v41;
  RELocationRelevanceProvider *v42;
  void *v43;
  RELocationRelevanceProvider *v44;
  uint64_t v45;
  REBluetoothDeviceRelevanceProvider *v46;
  uint64_t v47;
  REWorkoutRelevanceProvider *v48;
  uint64_t v49;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v52 = a2;
  if (!objc_msgSend(v3, "count"))
  {
    v53 = (id)MEMORY[0x24BDBD1A8];
    goto LABEL_63;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v51 = v3;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (!v5)
    goto LABEL_61;
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v55;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v55 != v9)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((v8 & 1) != 0)
        {
          v8 = 1;
          goto LABEL_35;
        }
        objc_msgSend(v11, "startDate");
        v12 = (REDailyRoutineRelevanceProvider *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "endDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = v13;
          REEndOfDayForDate(v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "earlierDate:", v15);
          v16 = (REDateRelevanceProvider *)objc_claimAutoreleasedReturnValue();

          -[REDateRelevanceProvider timeIntervalSinceDate:](v16, "timeIntervalSinceDate:", v12);
          if (v17 >= 0.0)
            v18 = v17;
          else
            v18 = 0.0;
          v19 = [REDateRelevanceProvider alloc];
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v12, v18);
          if (v18 <= 900.0)
          {
            v26 = -[REDateRelevanceProvider initWithEventInterval:](v19, "initWithEventInterval:", v20);
            objc_msgSend(v53, "addObject:", v26);

          }
          else
          {
            -[REDailyRoutineRelevanceProvider dateByAddingTimeInterval:](v12, "dateByAddingTimeInterval:", 900.0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[REDateRelevanceProvider initWithEventInterval:becomesIrrelevantDate:](v19, "initWithEventInterval:becomesIrrelevantDate:", v20, v21);
            objc_msgSend(v53, "addObject:", v22);

          }
        }
        else
        {
          v16 = -[REDateRelevanceProvider initWithEventDate:]([REDateRelevanceProvider alloc], "initWithEventDate:", v12);
          objc_msgSend(v53, "addObject:", v16);
        }

        v8 = 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((v7 & 1) != 0)
          {
            v7 = 1;
            goto LABEL_35;
          }
          objc_msgSend(v11, "region");
          v12 = (REDailyRoutineRelevanceProvider *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ((-[REDailyRoutineRelevanceProvider notifyOnExit](v12, "notifyOnExit") & 1) != 0
             || -[REDailyRoutineRelevanceProvider notifyOnEntry](v12, "notifyOnEntry"))
            && (-[REDailyRoutineRelevanceProvider radius](v12, "radius"), v25 >= 0.0))
          {
            if (v25 > 10000.0)
            {
              v27 = objc_alloc(MEMORY[0x24BDBFA50]);
              -[REDailyRoutineRelevanceProvider center](v12, "center");
              v29 = v28;
              v31 = v30;
              -[REDailyRoutineRelevanceProvider identifier](v12, "identifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = (REDailyRoutineRelevanceProvider *)objc_msgSend(v27, "initWithCenter:radius:identifier:", v32, v29, v31, 10000.0);

              -[REDailyRoutineRelevanceProvider setGeoReferenceFrame:](v33, "setGeoReferenceFrame:", -[REDailyRoutineRelevanceProvider geoReferenceFrame](v33, "geoReferenceFrame"));
              v12 = v33;
            }
            if (-[REDailyRoutineRelevanceProvider notifyOnEntry](v12, "notifyOnEntry")
              && -[REDailyRoutineRelevanceProvider notifyOnExit](v12, "notifyOnExit"))
            {
              v34 = objc_alloc(MEMORY[0x24BDBFA80]);
              -[REDailyRoutineRelevanceProvider center](v12, "center");
              v36 = v35;
              v38 = v37;
              objc_msgSend(MEMORY[0x24BDBCE60], "date");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = (REGeofenceRelevanceProvider *)objc_msgSend(v34, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v39, -[REDailyRoutineRelevanceProvider geoReferenceFrame](v12, "geoReferenceFrame"), v36, v38, 0.0, 0.0, -1.0);

              v41 = [RELocationRelevanceProvider alloc];
              -[REDailyRoutineRelevanceProvider radius](v12, "radius");
              v42 = -[RELocationRelevanceProvider initWithLocation:radius:](v41, "initWithLocation:radius:", v40);
              -[RELocationRelevanceProvider providerWithBundleIdentifier:](v42, "providerWithBundleIdentifier:", v52);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v53, "addObject:", v43);
            }
            else
            {
              v40 = -[REGeofenceRelevanceProvider initWithRegion:bundleIdentifier:]([REGeofenceRelevanceProvider alloc], "initWithRegion:bundleIdentifier:", v12, v52);
              objc_msgSend(v53, "addObject:", v40);
            }

            v7 = 1;
          }
          else
          {
            v7 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v23 = objc_msgSend(v11, "situation");
            v24 = 4;
            switch(v23)
            {
              case 0:
              case 1:
                v12 = -[REDailyRoutineRelevanceProvider initWithDailyRoutineType:]([REDailyRoutineRelevanceProvider alloc], "initWithDailyRoutineType:", v23);
                if ((v8 & 1) != 0)
                  goto LABEL_58;
                objc_msgSend(v53, "addObject:", v12);
                v8 = 1;
                break;
              case 2:
                v24 = 1;
                goto LABEL_50;
              case 3:
                v24 = 2;
                goto LABEL_50;
              case 4:
                v24 = 3;
                goto LABEL_50;
              case 5:
LABEL_50:
                v44 = -[RELocationRelevanceProvider initWithLocationType:]([RELocationRelevanceProvider alloc], "initWithLocationType:", v24);
                v12 = (REDailyRoutineRelevanceProvider *)v44;
                if ((v7 & 1) != 0)
                  goto LABEL_58;
                -[RELocationRelevanceProvider providerWithBundleIdentifier:](v44, "providerWithBundleIdentifier:", v52);
                v45 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v53, "addObject:", v45);
                v7 = 1;
                v12 = (REDailyRoutineRelevanceProvider *)v45;
                break;
              case 6:
                v46 = [REBluetoothDeviceRelevanceProvider alloc];
                v47 = 0;
                goto LABEL_54;
              case 7:
                v46 = [REBluetoothDeviceRelevanceProvider alloc];
                v47 = 1;
LABEL_54:
                v48 = -[REBluetoothDeviceRelevanceProvider initWithConnectionToCar:connectionToSpeaker:](v46, "initWithConnectionToCar:connectionToSpeaker:", 1, v47);
                goto LABEL_57;
              case 8:
                v48 = -[REWorkoutRelevanceProvider initWithState:]([REWorkoutRelevanceProvider alloc], "initWithState:", 1);
                goto LABEL_57;
              case 9:
                v48 = -[REActivityRelevanceProvider initWithActiveEnergyState:exerciseTimeState:standHourState:]([REActivityRelevanceProvider alloc], "initWithActiveEnergyState:exerciseTimeState:standHourState:", 0, 0, 0);
LABEL_57:
                v12 = (REDailyRoutineRelevanceProvider *)v48;
LABEL_58:
                if (!v12)
                  goto LABEL_35;
                objc_msgSend(v53, "addObject:", v12);
                break;
              default:
                RELogForDomain(0);
                v12 = (REDailyRoutineRelevanceProvider *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134217984;
                  v59 = v23;
                  _os_log_impl(&dword_2132F7000, &v12->super.super, OS_LOG_TYPE_DEFAULT, "Unknown INDailyRoutineSituation: %ld", buf, 0xCu);
                }
                break;
            }
          }
          else
          {
            RELogForDomain(0);
            v12 = (REDailyRoutineRelevanceProvider *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v59 = (uint64_t)v11;
              _os_log_impl(&dword_2132F7000, &v12->super.super, OS_LOG_TYPE_DEFAULT, "Unknown relevance provider type: %@", buf, 0xCu);
            }
          }
        }
      }

LABEL_35:
      ++v10;
    }
    while (v6 != v10);
    v49 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    v6 = v49;
  }
  while (v49);
LABEL_61:

  v3 = v51;
LABEL_63:

  return v53;
}

void _HTTPConnectionInvalidated(void *a1)
{
  id v1;

  objc_msgSend(a1, "weakObjectValue");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidated");

}

void _HTTPConnectionRecievedError(void *a1, uint64_t a2)
{
  id v3;

  objc_msgSend(a1, "weakObjectValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didRecieveError:", a2);

}

void _HTTPConnectionDidReceiveRequest(void *a1, uint64_t a2)
{
  id v3;

  objc_msgSend(a1, "weakObjectValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didRecieveRequest:", a2);

}

void _HTTPConnectionDidSendResponse(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(a1, "weakObjectValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didCompleteResponse:error:", a3, 0);

}

void _HTTPConnectionFailedToSendResponse(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;

  objc_msgSend(a1, "weakObjectValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDBCA98], 100, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didCompleteResponse:error:", a3, v4);

}

void sub_213390E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133911EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213391600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133917BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213391958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_213391B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_213391D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_213391F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_213392194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_213392410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t REHashDataUInt8(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2;
  uint64_t v3;

  v2 = 0;
  if (a2)
  {
    v3 = 8 * a2 - 8;
    do
    {
      v2 ^= HashingValuesTable[*(unsigned __int8 *)(a1 - 1 + a2)] >> (v3 & 0x38);
      v3 -= 8;
      --a2;
    }
    while (a2);
  }
  return v2;
}

uint64_t REHashDataUInt16(uint64_t a1, uint64_t a2)
{
  unsigned __int16 v2;
  uint64_t v3;

  v2 = 0;
  if (a2)
  {
    v3 = 16 * a2 - 16;
    do
    {
      v2 ^= HashingValuesTable[*(unsigned __int8 *)(a1 - 1 + a2)] >> (v3 & 0x30);
      v3 -= 16;
      --a2;
    }
    while (a2);
  }
  return v2;
}

uint64_t REHashDataUInt32(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!a2)
    return 0;
  v2 = result;
  LODWORD(result) = 0;
  v3 = 32 * a2 - 32;
  v4 = v2 - 1;
  do
  {
    result = result ^ (HashingValuesTable[*(unsigned __int8 *)(v4 + a2)] >> (v3 & 0x20));
    v3 -= 32;
    --a2;
  }
  while (a2);
  return result;
}

uint64_t REHashDataUInt64(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  if (!a2)
    return 0;
  result = 0;
  v4 = a1 - 1;
  do
    result ^= HashingValuesTable[*(unsigned __int8 *)(v4 + a2--)];
  while (a2);
  return result;
}

uint64_t REHashData(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  if (!a2)
    return 0;
  result = 0;
  v4 = a1 - 1;
  do
    result ^= HashingValuesTable[*(unsigned __int8 *)(v4 + a2--)];
  while (a2);
  return result;
}

uint64_t REHashString(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "UTF8String");
  v3 = objc_msgSend(v1, "length");
  v4 = 0;
  if (v3)
  {
    v5 = 32 * v3 - 32;
    do
    {
      v4 = v4 ^ (HashingValuesTable[*(unsigned __int8 *)(v2 - 1 + v3)] >> (v5 & 0x20));
      v5 -= 32;
      --v3;
    }
    while (v3);
  }

  return v4;
}

void sub_213392EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  uint64_t v42;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose((const void *)(v42 - 232), 8);
  _Unwind_Resume(a1);
}

void sub_213393198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2133933E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133934E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133935E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133936E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133937E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213393FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return NSRequestConcreteImplementation();
}

BOOL REConfigureTrainingSimulationExportedObjectClass(objc_class *a1)
{
  objc_class *v2;
  objc_method *InstanceMethod;
  void (*Implementation)(void);
  IMP MethodImplementation;
  const char *TypeEncoding;
  objc_class *v7;
  objc_method *v8;
  void (*v9)(void);
  IMP v10;
  const char *v11;
  objc_class *v12;
  objc_method *v13;
  void (*v14)(void);
  IMP v15;
  const char *v16;
  objc_class *v17;
  objc_method *v18;
  void (*v19)(void);
  IMP v20;
  const char *v21;
  objc_class *v22;
  objc_method *v23;
  void (*v24)(void);
  IMP v25;
  const char *v26;
  objc_class *v27;
  objc_method *v28;
  void (*v29)(void);
  IMP v30;
  const char *v31;
  objc_class *v32;
  objc_method *v33;
  void (*v34)(void);
  IMP v35;
  const char *v36;
  objc_class *v37;
  objc_method *v38;
  void (*v39)(void);
  IMP v40;
  const char *v41;
  objc_class *v42;
  objc_method *v43;
  void (*v44)(void);
  const char *v45;

  v2 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v2, sel__re_swizzled_relevanceEngine_createElementFromDescription_completion_);
  Implementation = method_getImplementation(InstanceMethod);
  MethodImplementation = class_getMethodImplementation(a1, sel_relevanceEngine_createElementFromDescription_completion_);
  TypeEncoding = method_getTypeEncoding(InstanceMethod);
  if (MethodImplementation)
    class_replaceMethod(a1, sel_relevanceEngine_createElementFromDescription_completion_, Implementation, TypeEncoding);
  else
    class_addMethod(a1, sel_relevanceEngine_createElementFromDescription_completion_, Implementation, TypeEncoding);
  v7 = (objc_class *)objc_opt_class();
  v8 = class_getInstanceMethod(v7, sel__re_swizzled_relevanceEngine_performCommand_withOptions_completion_);
  v9 = method_getImplementation(v8);
  v10 = class_getMethodImplementation(a1, sel_relevanceEngine_performCommand_withOptions_completion_);
  v11 = method_getTypeEncoding(v8);
  if (v10)
    class_replaceMethod(a1, sel_relevanceEngine_performCommand_withOptions_completion_, v9, v11);
  else
    class_addMethod(a1, sel_relevanceEngine_performCommand_withOptions_completion_, v9, v11);
  v12 = (objc_class *)objc_opt_class();
  v13 = class_getInstanceMethod(v12, sel__re_swizzled_availableRelevanceEngines_);
  v14 = method_getImplementation(v13);
  v15 = class_getMethodImplementation(a1, sel_availableRelevanceEngines_);
  v16 = method_getTypeEncoding(v13);
  if (v15)
    class_replaceMethod(a1, sel_availableRelevanceEngines_, v14, v16);
  else
    class_addMethod(a1, sel_availableRelevanceEngines_, v14, v16);
  v17 = (objc_class *)objc_opt_class();
  v18 = class_getInstanceMethod(v17, sel__re_swizzled_fetchAllElementIdentifiersInRelevanceEngine_completion_);
  v19 = method_getImplementation(v18);
  v20 = class_getMethodImplementation(a1, sel_fetchAllElementIdentifiersInRelevanceEngine_completion_);
  v21 = method_getTypeEncoding(v18);
  if (v20)
    class_replaceMethod(a1, sel_fetchAllElementIdentifiersInRelevanceEngine_completion_, v19, v21);
  else
    class_addMethod(a1, sel_fetchAllElementIdentifiersInRelevanceEngine_completion_, v19, v21);
  v22 = (objc_class *)objc_opt_class();
  v23 = class_getInstanceMethod(v22, sel__re_swizzled_fetchAllElementsInRelevanceEngine_completion_);
  v24 = method_getImplementation(v23);
  v25 = class_getMethodImplementation(a1, sel_fetchAllElementsInRelevanceEngine_completion_);
  v26 = method_getTypeEncoding(v23);
  if (v25)
    class_replaceMethod(a1, sel_fetchAllElementsInRelevanceEngine_completion_, v24, v26);
  else
    class_addMethod(a1, sel_fetchAllElementsInRelevanceEngine_completion_, v24, v26);
  v27 = (objc_class *)objc_opt_class();
  v28 = class_getInstanceMethod(v27, sel__re_swizzled_gatherDiagnosticLogsForRelevanceEngine_completion_);
  v29 = method_getImplementation(v28);
  v30 = class_getMethodImplementation(a1, sel_gatherDiagnosticLogsForRelevanceEngine_completion_);
  v31 = method_getTypeEncoding(v28);
  if (v30)
    class_replaceMethod(a1, sel_gatherDiagnosticLogsForRelevanceEngine_completion_, v29, v31);
  else
    class_addMethod(a1, sel_gatherDiagnosticLogsForRelevanceEngine_completion_, v29, v31);
  v32 = (objc_class *)objc_opt_class();
  v33 = class_getInstanceMethod(v32, sel__re_swizzled_relevanceEngine_runActionOfElementWithDescription1_completion_);
  v34 = method_getImplementation(v33);
  v35 = class_getMethodImplementation(a1, sel_relevanceEngine_runActionOfElementWithDescription1_completion_);
  v36 = method_getTypeEncoding(v33);
  if (v35)
    class_replaceMethod(a1, sel_relevanceEngine_runActionOfElementWithDescription1_completion_, v34, v36);
  else
    class_addMethod(a1, sel_relevanceEngine_runActionOfElementWithDescription1_completion_, v34, v36);
  v37 = (objc_class *)objc_opt_class();
  v38 = class_getInstanceMethod(v37, sel__re_swizzled_relevanceEngine_encodedObjectAtPath_completion_);
  v39 = method_getImplementation(v38);
  v40 = class_getMethodImplementation(a1, sel_relevanceEngine_encodedObjectAtPath_completion_);
  v41 = method_getTypeEncoding(v38);
  if (v40)
    class_replaceMethod(a1, sel_relevanceEngine_encodedObjectAtPath_completion_, v39, v41);
  else
    class_addMethod(a1, sel_relevanceEngine_encodedObjectAtPath_completion_, v39, v41);
  v42 = (objc_class *)objc_opt_class();
  v43 = class_getInstanceMethod(v42, sel__re_runAfterEngineIsLoaded_);
  v44 = method_getImplementation(v43);
  v45 = method_getTypeEncoding(v43);
  return class_addMethod(a1, sel__re_runAfterEngineIsLoaded_, v44, v45);
}

void REExportRelevanceEngineService(void *a1)
{
  void *v1;
  _RETrainingProxy *v2;
  id v3;

  v3 = a1;
  if (v3)
  {
    if (REExportRelevanceEngineService_onceToken != -1)
      dispatch_once(&REExportRelevanceEngineService_onceToken, &__block_literal_global_42);
    os_unfair_lock_lock((os_unfair_lock_t)&REExportRelevanceEngineService_SimulationProxiesLock);
    objc_msgSend((id)SimulationProxies, "objectForKeyedSubscript:", v3);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v1)
    {
      v2 = -[_RETrainingProxy initWithServiceName:]([_RETrainingProxy alloc], "initWithServiceName:", v3);
      objc_msgSend((id)SimulationProxies, "setObject:forKeyedSubscript:", v2, v3);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&REExportRelevanceEngineService_SimulationProxiesLock);
  }

}

void sub_21339C904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RERemoteTrainingMachServiceForProcessName(const __CFString *a1)
{
  const __CFString *v1;

  v1 = &stru_24CF92178;
  if (a1)
    v1 = a1;
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.%@.RelevanceEngine.RemoteTraining"), v1);
}

id RERemoteTrainingServerInterface()
{
  if (RERemoteTrainingServerInterface_onceToken != -1)
    dispatch_once(&RERemoteTrainingServerInterface_onceToken, &__block_literal_global_60);
  return (id)RERemoteTrainingServerInterface_ServerInterface;
}

id RERemoteTrainingClientInterface()
{
  if (RERemoteTrainingClientInterface_onceToken != -1)
    dispatch_once(&RERemoteTrainingClientInterface_onceToken, &__block_literal_global_58_0);
  return (id)RERemoteTrainingClientInterface_ClientInterface;
}

void sub_21339D334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21339D97C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21339DBF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getBluetoothManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getBluetoothManagerClass_softClass;
  v7 = getBluetoothManagerClass_softClass;
  if (!getBluetoothManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getBluetoothManagerClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __getBluetoothManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21339DF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21339EA9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getBluetoothManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  BluetoothManagerLibrary();
  result = objc_getClass("BluetoothManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBluetoothManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBluetoothManagerClass_block_invoke_cold_1();
    return (Class)BluetoothManagerLibrary();
  }
  return result;
}

uint64_t BluetoothManagerLibrary()
{
  uint64_t v0;
  void *v2;

  if (!BluetoothManagerLibraryCore_frameworkLibrary)
    BluetoothManagerLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = BluetoothManagerLibraryCore_frameworkLibrary;
  if (!BluetoothManagerLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id RECreateErrorWithCode(uint64_t a1)
{
  return RECreateErrorWithCodeMessageAndUseInfo(a1, 0, 0);
}

id RECreateErrorWithCodeMessageAndUseInfo(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  if (REInitializeDefaultErrorCodeMessages_onceToken != -1)
    dispatch_once(&REInitializeDefaultErrorCodeMessages_onceToken, &__block_literal_global_63);
  if (!v6)
    v6 = (id)MEMORY[0x24BDBD1B8];
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)REDefaultErrorCodeMessages;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_10;
  }
  v10 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, v10);
    v13 = objc_msgSend(v12, "copy");

    v6 = (id)v13;
  }
LABEL_10:
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.RelevanceEngine.error"), a1, v6);

  return v14;
}

id RECreateErrorWithCodeAndMessage(uint64_t a1, void *a2)
{
  return RECreateErrorWithCodeMessageAndUseInfo(a1, a2, 0);
}

id RECreateErrorWithCodeAndUseInfo(uint64_t a1, void *a2)
{
  return RECreateErrorWithCodeMessageAndUseInfo(a1, 0, a2);
}

void REEnsureCondition(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!a1)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Condition must be non-nil"), a3, a4, a5, a6, a7, a8, a9);
}

__CFString *REStringFromRankingOrder(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 2)
    return 0;
  else
    return off_24CF8FEE0[a1 + 1];
}

void sub_21339F50C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21339F734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void REHTMLElementAccessLock(void *a1)
{
  void (**v1)(_QWORD);

  if (a1)
  {
    v1 = a1;
    os_unfair_lock_lock((os_unfair_lock_t)&REHTMLElementLock);
    v1[2](v1);

    os_unfair_lock_unlock((os_unfair_lock_t)&REHTMLElementLock);
  }
}

void sub_2133A17DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2133A2300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133A260C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKEventQueryClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_DKEventQueryClass_softClass;
  v7 = get_DKEventQueryClass_softClass;
  if (!get_DKEventQueryClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_DKEventQueryClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __get_DKEventQueryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2133A26CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKQueryClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_DKQueryClass_softClass;
  v7 = get_DKQueryClass_softClass;
  if (!get_DKQueryClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_DKQueryClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __get_DKQueryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2133A2784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKPredictionQueryClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_DKPredictionQueryClass_softClass;
  v7 = get_DKPredictionQueryClass_softClass;
  if (!get_DKPredictionQueryClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_DKPredictionQueryClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __get_DKPredictionQueryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2133A283C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKSystemEventStreamsClass_0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_DKSystemEventStreamsClass_softClass_0;
  v7 = get_DKSystemEventStreamsClass_softClass_0;
  if (!get_DKSystemEventStreamsClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_DKSystemEventStreamsClass_block_invoke_0;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __get_DKSystemEventStreamsClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2133A28F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133A29FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133A2D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_2133A30BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_2133A39CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKTombstoneMetadataKeyClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_DKTombstoneMetadataKeyClass_softClass;
  v7 = get_DKTombstoneMetadataKeyClass_softClass;
  if (!get_DKTombstoneMetadataKeyClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_DKTombstoneMetadataKeyClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __get_DKTombstoneMetadataKeyClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2133A42F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133A4794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CoreDuetLibrary_0()
{
  void *v0;

  if (!CoreDuetLibraryCore_frameworkLibrary_0)
    CoreDuetLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!CoreDuetLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

BOOL RERelevanceEqualToRelevance(float a1, float a2)
{
  return vabds_f32(a1, a2) < 0.00000011921;
}

uint64_t RETrainingSimulationMachServiceForProcessName(const __CFString *a1)
{
  const __CFString *v1;

  v1 = &stru_24CF92178;
  if (a1)
    v1 = a1;
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.%@.RelevanceEngine.TrainingSimulation"), v1);
}

id RETrainingSimulationServerInterface()
{
  if (RETrainingSimulationServerInterface_onceToken != -1)
    dispatch_once(&RETrainingSimulationServerInterface_onceToken, &__block_literal_global_66);
  return (id)RETrainingSimulationServerInterface_ServerInterface;
}

id RETrainingSimulationClientInterface()
{
  if (RETrainingSimulationClientInterface_onceToken != -1)
    dispatch_once(&RETrainingSimulationClientInterface_onceToken, &__block_literal_global_64_0);
  return (id)RETrainingSimulationClientInterface_ClientInterface;
}

float REDeviceScreenScale()
{
  if (REDeviceScreenScale_onceToken != -1)
    dispatch_once(&REDeviceScreenScale_onceToken, &__block_literal_global_67);
  return *(float *)&REDeviceScreenScale_ScreenScale;
}

uint64_t REDonatedActionFilteredCacheReset(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reset");
}

void sub_2133A87E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void REContentFeatureExtractor::REContentFeatureExtractor(REContentFeatureExtractor *this)
{
  REFancyShrinkingDictionary::REFancyShrinkingDictionary(&this->m_trueTopTokens, 0x1F4uLL, 0x190uLL, 1, 1, 0);
  REFancyShrinkingDictionary::REFancyShrinkingDictionary(&this->m_falseTopTokens, 0x1F4uLL, 0x190uLL, 1, 1, 0);
  pthread_rwlock_init(&this->m_rwlock, 0);
}

void sub_2133A96A4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table(v2);
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void REContentFeatureExtractor::~REContentFeatureExtractor(REContentFeatureExtractor *this)
{
  pthread_rwlock_destroy(&this->m_rwlock);
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table((uint64_t)&this->m_falseTopTokens);
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table((uint64_t)&this->m_trueTopTokens);
}

uint64_t REContentFeatureExtractor::pushToTFIDF(uint64_t a1, __int128 **a2, int a3)
{
  uint64_t v3;

  v3 = 264;
  if (a3)
    v3 = 200;
  return REFancyShrinkingDictionary::pushToIDF(a1 + v3, a2);
}

uint64_t REContentFeatureExtractor::train(pthread_rwlock_t *a1, __int128 **a2, int a3)
{
  uint64_t v6;

  pthread_rwlock_wrlock(a1);
  v6 = 264;
  if (a3)
    v6 = 200;
  REFancyShrinkingDictionary::pushToIDF((uint64_t)a1 + v6, a2);
  pthread_rwlock_unlock(a1);
  return 1;
}

void sub_2133A977C(_Unwind_Exception *a1)
{
  pthread_rwlock_t *v1;

  pthread_rwlock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t REContentFeatureExtractor::predict@<X0>(uint64_t a1@<X0>, unsigned __int8 **a2@<X1>, uint64_t a3@<X8>)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unsigned __int8 *TokenCount;
  unsigned __int8 *v14;
  double v15;
  double v16;
  double v17;
  unsigned __int8 *v18;
  double v19;

  pthread_rwlock_rdlock((pthread_rwlock_t *)a1);
  *(_BYTE *)a3 = 0;
  *(_QWORD *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_DWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 40) = 0;
  v6 = *a2;
  v7 = a2[1];
  if (*a2 == v7)
  {
    v9 = 0.0;
    v12 = 0.0;
    v11 = 0.0;
    v18 = *a2;
    v10 = 0.0;
  }
  else
  {
    v8 = 0;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    do
    {
      TokenCount = REFancyShrinkingDictionary::getTokenCount((_QWORD *)(a1 + 200), v6);
      v14 = REFancyShrinkingDictionary::getTokenCount((_QWORD *)(a1 + 264), v6);
      v15 = (double)(unint64_t)TokenCount + (double)(unint64_t)v14;
      v16 = (double)(unint64_t)TokenCount / v15;
      v17 = (double)(unint64_t)v14 / v15;
      if (!((unint64_t)TokenCount | (unint64_t)v14))
      {
        v16 = 0.0;
        v17 = 0.0;
      }
      v10 = v16 + v10;
      v11 = v17 + v11;
      *(double *)(a3 + 8) = v11;
      *(double *)(a3 + 16) = v10;
      if ((unint64_t)TokenCount | (unint64_t)v14)
      {
        if (TokenCount)
        {
          v12 = v12 + 1.0;
          *(double *)(a3 + 32) = v12;
        }
        if (v14)
        {
          v9 = v9 + 1.0;
          *(double *)(a3 + 40) = v9;
        }
      }
      else
      {
        *(_DWORD *)(a3 + 24) = ++v8;
      }
      v6 += 24;
    }
    while (v6 != v7);
    v6 = *a2;
    v18 = a2[1];
  }
  v19 = (double)(0xAAAAAAAAAAAAAAABLL * ((v18 - v6) >> 3));
  *(double *)(a3 + 8) = v11 / v19;
  *(double *)(a3 + 16) = v10 / v19;
  *(double *)(a3 + 32) = v12 / v19;
  *(double *)(a3 + 40) = v9 / v19;
  *(_BYTE *)a3 = 1;
  return pthread_rwlock_unlock((pthread_rwlock_t *)a1);
}

void sub_2133A991C(_Unwind_Exception *a1)
{
  pthread_rwlock_t *v1;

  pthread_rwlock_unlock(v1);
  _Unwind_Resume(a1);
}

_QWORD *REContentFeatureExtractor::SavePositiveModel(uint64_t a1, _QWORD *a2)
{
  return REFancyShrinkingDictionary::SaveModel(a1 + 200, a2);
}

BOOL REContentFeatureExtractor::LoadPositiveModel(uint64_t a1, const std::string *a2)
{
  return REFancyShrinkingDictionary::LoadModel(a1 + 200, a2);
}

_QWORD *REContentFeatureExtractor::SaveNegativeModel(uint64_t a1, _QWORD *a2)
{
  return REFancyShrinkingDictionary::SaveModel(a1 + 264, a2);
}

BOOL REContentFeatureExtractor::LoadNegativeModel(uint64_t a1, const std::string *a2)
{
  return REFancyShrinkingDictionary::LoadModel(a1 + 264, a2);
}

id soft__REEngineDefaults_1()
{
  void *v0;
  id v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  Class (*v8)(uint64_t);
  void *v9;
  uint64_t *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!RelevanceEngineLibraryCore_frameworkLibrary_2)
  {
    v7 = xmmword_24CF902B8;
    v8 = 0;
    RelevanceEngineLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  if (!RelevanceEngineLibraryCore_frameworkLibrary_2)
    return 0;
  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  v0 = (void *)get_REEngineDefaultsClass_softClass_1;
  v6 = get_REEngineDefaultsClass_softClass_1;
  if (!get_REEngineDefaultsClass_softClass_1)
  {
    *(_QWORD *)&v7 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v7 + 1) = 3221225472;
    v8 = __get_REEngineDefaultsClass_block_invoke_1;
    v9 = &unk_24CF8AC38;
    v10 = &v3;
    __get_REEngineDefaultsClass_block_invoke_1((uint64_t)&v7);
    v0 = (void *)v4[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_2133AAB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void __RE_Cached_updateValue__ShowAllElements_0()
{
  os_unfair_lock_lock(&__RE_Cached_lock__ShowAllElements_0);
  __RE_Cached_hasValue__ShowAllElements_0 = 0;
  os_unfair_lock_unlock(&__RE_Cached_lock__ShowAllElements_0);
  RERelevanceEngineDisplayDebugProbabilitiesDidUpdate();
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id REPipedLocationReceiverInterface()
{
  if (REPipedLocationReceiverInterface_onceToken != -1)
    dispatch_once(&REPipedLocationReceiverInterface_onceToken, &__block_literal_global_70);
  return (id)REPipedLocationReceiverInterface_interface;
}

id REPipedLocationDonorInterface()
{
  if (REPipedLocationDonorInterface_onceToken != -1)
    dispatch_once(&REPipedLocationDonorInterface_onceToken, &__block_literal_global_47_2);
  return (id)REPipedLocationDonorInterface_interface;
}

__CFString *REDiffOperationTypeDescription(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_24CF904C0[a1];
}

id REValidatedFeatureOptionsDictionary(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  id v17;
  const __CFString *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v3;
  v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (!v21)
  {

LABEL_21:
    v17 = v4;
    v13 = 0;
    goto LABEL_22;
  }
  v20 = a2;
  v22 = *(_QWORD *)v24;
  v19 = CFSTR("REErrorTokenKey");
  while (2)
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v24 != v22)
        objc_enumerationMutation(v5);
      v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_msgSend(v7, "value", v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[؋ objectForKeyedSubscript:](&unk_24CFC1E78, "objectForKeyedSubscript:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v27 = v19;
        v28 = v7;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        RECreateErrorWithCodeAndUseInfo(204, v10);
        v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

        goto LABEL_18;
      }
      v10 = (void *)v9;
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqual:", v11) & 1) == 0)
      {
        v31 = v19;
        v32 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("Unexpect value for specified feature type");
        v16 = 204;
LABEL_16:
        RECreateErrorWithCodeMessageAndUseInfo(v16, v15, v14);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("REScriptSymbolFeatureTypeKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v29 = v19;
        v30 = v7;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("Redefintion of feature type");
        v16 = 206;
        goto LABEL_16;
      }
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("REScriptSymbolFeatureTypeKey"));

    }
    v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v21)
      continue;
    break;
  }
  v13 = 0;
LABEL_18:

  if (!v13)
    goto LABEL_21;
  if (v20)
  {
    v13 = objc_retainAutorelease(v13);
    v17 = 0;
    *v20 = v13;
  }
  else
  {
    v17 = 0;
  }
LABEL_22:

  return v17;
}

const __CFString *REStringFromDonationType(unint64_t a1)
{
  if (a1 > 2)
    return &stru_24CF92178;
  else
    return off_24CF905C0[a1];
}

id RERelevanceProvidersForDonatedAction(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[6];

  v27[5] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  +[REFeature isSiriActionFeature](REFeature, "isSiriActionFeature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RERelevanceProvider customRelevanceProviderForFeature:withValue:](RERelevanceProvider, "customRelevanceProviderForFeature:withValue:", v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a2)
  {
    v27[0] = v6;
    +[REFeature itemIdentifierFeature](REFeature, "itemIdentifierFeature");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", objc_msgSend(v3, "trainingActionIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[RERelevanceProvider customRelevanceProviderForFeature:withValue:](RERelevanceProvider, "customRelevanceProviderForFeature:withValue:", v23, v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v21;
    +[REFeature coreBehaviorShortcutTypeFeature](REFeature, "coreBehaviorShortcutTypeFeature");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", objc_msgSend(v3, "filteredShortcutType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[RERelevanceProvider customRelevanceProviderForFeature:withValue:](RERelevanceProvider, "customRelevanceProviderForFeature:withValue:", v20, v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v18;
    +[REFeature coreBehaviorEventIdentifierHashFeature](REFeature, "coreBehaviorEventIdentifierHashFeature");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v5;
    objc_msgSend(v3, "eventLevelIdentifier");
    v25 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[REFeatureValue featureValueWithString:](REFeatureValue, "featureValueWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[RERelevanceProvider customRelevanceProviderForFeature:withValue:](RERelevanceProvider, "customRelevanceProviderForFeature:withValue:", v17, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v10;
    +[REFeature coreBehaviorAppIdentifierHashFeature](REFeature, "coreBehaviorAppIdentifierHashFeature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appLevelIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[REFeatureValue featureValueWithString:](REFeatureValue, "featureValueWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[RERelevanceProvider customRelevanceProviderForFeature:withValue:](RERelevanceProvider, "customRelevanceProviderForFeature:withValue:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[4] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v24;
    v4 = v25;

  }
  else
  {
    v26 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

void REEnumerateTrainingStateForDate(void *a1, void *a2)
{
  void (**v3)(id, _QWORD, void *);
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t i;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a1;
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x2199B223C]();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", 124, v20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "rangeOfUnit:inUnit:forDate:", 32, 16, v20);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v7;
      v11 = v8;
      v12 = objc_msgSend(v6, "day");
      v13 = objc_alloc(MEMORY[0x24BDD1508]);
      REStartOfDayForDate(v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      REEndOfDayForDate(v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v13, "initWithStartDate:endDate:", v14, v15);

      for (i = v10 + arc4random_uniform(2u); i <= v11; i += 2)
      {
        if (v12 != i)
        {
          objc_msgSend(v6, "setHour:", i);
          objc_msgSend(v5, "dateFromComponents:", v6);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "containsDate:", v18))
            v3[2](v3, 0, v18);

        }
      }
      v19 = 4;
      do
      {
        v3[2](v3, 1, v20);
        --v19;
      }
      while (v19);

    }
    objc_autoreleasePoolPop(v4);
  }

}

id get_DKSystemEventStreamsClass_1()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_DKSystemEventStreamsClass_softClass_1;
  v7 = get_DKSystemEventStreamsClass_softClass_1;
  if (!get_DKSystemEventStreamsClass_softClass_1)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_DKSystemEventStreamsClass_block_invoke_1;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __get_DKSystemEventStreamsClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2133AEB88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133AF070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKApplicationActivityMetadataKeyClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_DKApplicationActivityMetadataKeyClass_softClass;
  v7 = get_DKApplicationActivityMetadataKeyClass_softClass;
  if (!get_DKApplicationActivityMetadataKeyClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_DKApplicationActivityMetadataKeyClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __get_DKApplicationActivityMetadataKeyClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2133AF42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CoreDuetLibrary_1()
{
  void *v0;

  if (!CoreDuetLibraryCore_frameworkLibrary_1)
    CoreDuetLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  if (!CoreDuetLibraryCore_frameworkLibrary_1)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

id REUpNextDemoDateFormatter()
{
  if (REUpNextDemoDateFormatter_onceToken != -1)
    dispatch_once(&REUpNextDemoDateFormatter_onceToken, &__block_literal_global_76);
  return (id)REUpNextDemoDateFormatter_dateFormatter;
}

uint64_t REUpNextDemoActivityAlwaysShow()
{
  return 0;
}

uint64_t REUpNextDemoActivityShowInEvening()
{
  return 0;
}

uint64_t REUpNextDemoActivityDate()
{
  return 0;
}

uint64_t REUpNextDemoCommuteDate()
{
  return 0;
}

uint64_t REUpNextDemoCommuteTitle()
{
  return 0;
}

uint64_t REUpNextDemoCommuteDescription1()
{
  return 0;
}

uint64_t REUpNextDemoCommuteDescription2()
{
  return 0;
}

uint64_t REUpNextDemoPhotosUseFavoritesAlbum()
{
  return 0;
}

uint64_t REUpNextDemoPhotosMemoryTitle()
{
  return 0;
}

uint64_t REUpNextDemoPhotosMemorySubtitle()
{
  return 0;
}

uint64_t REUpNextDemoIgnoreHomeChanges()
{
  return 0;
}

uint64_t REUpNextDemoSuppressThumbnails()
{
  return 0;
}

BOOL REUpNextDemoAlwaysShowRoutines()
{
  if (_fetchedInternalBuildOnceToken_10 != -1)
    dispatch_once(&_fetchedInternalBuildOnceToken_10, &__block_literal_global_2_0);
  if (!_isInternalDevice_10)
    return 0;
  if (REGetAlwaysShowRoutines_onceToken != -1)
    dispatch_once(&REGetAlwaysShowRoutines_onceToken, &__block_literal_global_3_2);
  return REGetAlwaysShowRoutines__REValueAlwaysShowRoutines != 0;
}

uint64_t REUpNextDemoShiftTopItems()
{
  return 0;
}

uint64_t REUpNextDemoPhotoPreloadCount()
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t REUpNextDemoWalletIgnoreDate()
{
  return 0;
}

uint64_t REUpNextDemoPreWarmIdentifiers()
{
  return 0;
}

uint64_t REUpNextDemoHomeAlwaysShow()
{
  return 0;
}

uint64_t REUpNextDemoWeatherShowInMorning()
{
  return 0;
}

uint64_t REUpNextDemoWeatherHideWeatherConditions()
{
  return 0;
}

double REUpNextDemoTimeoutDuration()
{
  return 0.0;
}

uint64_t REUpNextDemoShowAllSnippets()
{
  return 0;
}

uint64_t REUpNextDemoAlwaysShowSnippets()
{
  return 0;
}

uint64_t REUpNextDemoEnableCommuteDataSource()
{
  return 0;
}

void sub_2133B1720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id RESampleFeature()
{
  if (RESampleFeature_onceToken != -1)
    dispatch_once(&RESampleFeature_onceToken, &__block_literal_global_77);
  return (id)RESampleFeature_Feature;
}

id RESampleRelevanceProviderForPosition(float a1)
{
  void *v2;
  void *v3;
  void *v4;

  RESampleFeature();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RERelevanceProvider customRelevanceProviderForFeature:withValue:](RERelevanceProvider, "customRelevanceProviderForFeature:withValue:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void REPriorityQueueReleaseWithAllocator(int a1, CFTypeRef cf)
{
  CFRelease(cf);
}

uint64_t REPriorityQueueCopyDescription(void *a1)
{
  objc_msgSend(a1, "description");
  return objc_claimAutoreleasedReturnValue();
}

uint64_t REPriorityQueueCompare(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199B2434](a3);
  v6 = v5[2](v5, a1, a2);
  if (v6 == -1)
    v7 = -1;
  else
    v7 = 0;
  if (v6 == 1)
    v8 = 1;
  else
    v8 = v7;

  return v8;
}

void sub_2133B1AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void REPriorityQueueApply(uint64_t a1, uint64_t a2)
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B2434](a2);
  if (v3)
  {
    v4 = v3;
    v3[2](v3, a1);
    v3 = (void (**)(_QWORD, _QWORD))v4;
  }

}

void sub_2133B2064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id REPredictionServerInterface()
{
  if (REPredictionServerInterface_onceToken != -1)
    dispatch_once(&REPredictionServerInterface_onceToken, &__block_literal_global_79);
  return (id)REPredictionServerInterface_interface;
}

id REPredictionClientInterface()
{
  if (REPredictionClientInterface_onceToken != -1)
    dispatch_once(&REPredictionClientInterface_onceToken, &__block_literal_global_60);
  return (id)REPredictionClientInterface_interface;
}

void sub_2133B2A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133B2B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133B2FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133B5A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void dispatch_metrics(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  id v4;

  v1 = dispatch_metrics(void({block_pointer})(void),BOOL)::onceToken;
  v2 = a1;
  v4 = v2;
  if (v1 == -1)
  {
    v3 = v2;
  }
  else
  {
    dispatch_once(&dispatch_metrics(void({block_pointer})(void),BOOL)::onceToken, &__block_literal_global_81);
    v3 = v4;
  }
  dispatch_async((dispatch_queue_t)dispatch_metrics(void({block_pointer})(void),BOOL)::queue, v3);

}

void ___Z16dispatch_metricsU13block_pointerFvvEb_block_invoke()
{
  uint64_t v0;
  void *v1;

  RECreateSharedQueueWithQOS(CFSTR("com.apple.RelevanceEngine.Metrics"), QOS_CLASS_BACKGROUND);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dispatch_metrics(void({block_pointer})(void),BOOL)::queue;
  dispatch_metrics(void({block_pointer})(void),BOOL)::queue = v0;

}

void RESubmitRelevantShortcut(void *a1)
{
  id v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v1 = a1;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __RESubmitRelevantShortcut_block_invoke;
  v3[3] = &unk_24CF90A78;
  v4 = v1;
  v2 = v1;
  dispatch_metrics(v3);

}

void sub_2133B6770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void RESubmitShortcutExecution(void *a1)
{
  id v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v1 = a1;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __RESubmitShortcutExecution_block_invoke;
  v3[3] = &unk_24CF90A78;
  v4 = v1;
  v2 = v1;
  dispatch_metrics(v3);

}

void RESubmitError(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __RESubmitError_block_invoke;
    v6[3] = &unk_24CF90AA0;
    v7 = v4;
    v8 = v3;
    dispatch_metrics(v6);

  }
}

void sub_2133B6A2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

id REAnalyticsValue(double a1)
{
  uint64_t v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1, v1, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void RESubmitBayesianModelTrained(BayesianModel *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char v7;
  NSObject *v8;
  double AveragePrediction;
  void *v10;
  double AverageProbability;
  void *v12;
  double AverageNegativeEntropy;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[16];
  _QWORD v51[20];
  _QWORD v52[20];
  _QWORD v53[7];
  _QWORD v54[9];

  v54[7] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v44 = v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_msgSend(v5, "ignoreValidMetricCheck");
      if (a1->m_dNormalizedLogScore >= -20.0)
      {
        if ((v7 & 1) != 0)
        {
          RELogForDomain(18);
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2132F7000, v8, OS_LOG_TYPE_DEFAULT, "Normally, we would ignore RESubmitBayesianModelTrained because metrics aren't valid; however, the client h"
              "as indicated we should proceed.",
              buf,
              2u);
          }

          goto LABEL_9;
        }
LABEL_10:
        RELogForDomain(18);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2132F7000, v30, OS_LOG_TYPE_DEFAULT, "Ignore RESubmitBayesianModelTrained because metrics aren't valid.", buf, 2u);
        }
        goto LABEL_12;
      }
    }
    else if (a1->m_dNormalizedLogScore >= -20.0)
    {
      goto LABEL_10;
    }
LABEL_9:
    v53[0] = CFSTR("averagePrediction");
    AveragePrediction = BayesianModel::getAveragePrediction(a1);
    REAnalyticsValue(AveragePrediction);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v10;
    v53[1] = CFSTR("averageActionProbability");
    AverageProbability = BayesianModel::getAverageProbability(a1);
    REAnalyticsValue(AverageProbability);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v12;
    v53[2] = CFSTR("negativeEntropy");
    AverageNegativeEntropy = BayesianModel::getAverageNegativeEntropy(a1);
    REAnalyticsValue(AverageNegativeEntropy);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v54[2] = v14;
    v53[3] = CFSTR("normalizedEntropy");
    BayesianModel::getAverageNormalizedEntropy(a1);
    REAnalyticsValue(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v54[3] = v16;
    v53[4] = CFSTR("trueEvents");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1->m_nTotalTrue);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v54[4] = v17;
    v53[5] = CFSTR("falseEvents");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1->m_nTotalExamples - a1->m_nTotalTrue);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v54[5] = v18;
    v53[6] = CFSTR("totalEvents");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1->m_nTotalExamples);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v54[6] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 7);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v51[0] = CFSTR("calibrationCurve1");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibration(a1, 0));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v43;
    v51[1] = CFSTR("calibrationCurve2");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibration(a1, 1u));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v41;
    v51[2] = CFSTR("calibrationCurve3");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibration(a1, 2u));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v40;
    v51[3] = CFSTR("calibrationCurve4");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibration(a1, 3u));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3] = v39;
    v51[4] = CFSTR("calibrationCurve5");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibration(a1, 4u));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v52[4] = v38;
    v51[5] = CFSTR("calibrationCurve6");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibration(a1, 5u));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v52[5] = v37;
    v51[6] = CFSTR("calibrationCurve7");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibration(a1, 6u));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v52[6] = v36;
    v51[7] = CFSTR("calibrationCurve8");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibration(a1, 7u));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v52[7] = v35;
    v51[8] = CFSTR("calibrationCurve9");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibration(a1, 8u));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v52[8] = v34;
    v51[9] = CFSTR("calibrationCurve10");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibration(a1, 9u));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v52[9] = v33;
    v51[10] = CFSTR("calibrationCount1");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 0));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v52[10] = v32;
    v51[11] = CFSTR("calibrationCount2");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 1u));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v52[11] = v31;
    v51[12] = CFSTR("calibrationCount3");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 2u));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v52[12] = v20;
    v51[13] = CFSTR("calibrationCount4");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 3u));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v52[13] = v21;
    v51[14] = CFSTR("calibrationCount5");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 4u));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v52[14] = v22;
    v51[15] = CFSTR("calibrationCount6");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 5u));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v52[15] = v23;
    v51[16] = CFSTR("calibrationCount7");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 6u));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v52[16] = v24;
    v51[17] = CFSTR("calibrationCount8");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 7u));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v52[17] = v25;
    v51[18] = CFSTR("calibrationCount9");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 8u));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v52[18] = v26;
    v51[19] = CFSTR("calibrationCount10");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 9u));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v52[19] = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = ___Z28RESubmitBayesianModelTrainedR13BayesianModelPU43objcproto32RERelevanceEngineMetricsRecorder11objc_objectP8NSString_block_invoke;
    v45[3] = &unk_24CF90AC8;
    v46 = v5;
    v47 = v42;
    v48 = v44;
    v49 = v28;
    v29 = v28;
    v30 = v42;
    dispatch_metrics(v45);

LABEL_12:
    v6 = v44;
  }

}

void sub_2133B72A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24)
{

  _Unwind_Resume(a1);
}

void ___Z28RESubmitBayesianModelTrainedR13BayesianModelPU43objcproto32RERelevanceEngineMetricsRecorder11objc_objectP8NSString_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "recordTrainingMetrics:forInteraction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "recordCallibrationCurveMetrics:forInteraction:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  RELogForDomain(18);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2132F7000, v2, OS_LOG_TYPE_DEFAULT, "submitted bayesian model training", v3, 2u);
  }

}

void RESubmitBayesianModelPredicted(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v17[0] = CFSTR("probability");
    REAnalyticsValue(*(double *)(a1 + 16));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v17[1] = CFSTR("variance");
    REAnalyticsValue(*(double *)(a1 + 8));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v8;
    v17[2] = CFSTR("pessimisticEstimate");
    REAnalyticsValue(*(double *)(a1 + 24));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v9;
    v17[3] = CFSTR("success");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___Z30RESubmitBayesianModelPredictedR10PredictionPU43objcproto32RERelevanceEngineMetricsRecorder11objc_objectP8NSString_block_invoke;
    v13[3] = &unk_24CF90AF0;
    v14 = v5;
    v15 = v11;
    v16 = v6;
    v12 = v11;
    dispatch_metrics(v13);

  }
}

void sub_2133B76DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

uint64_t ___Z30RESubmitBayesianModelPredictedR10PredictionPU43objcproto32RERelevanceEngineMetricsRecorder11objc_objectP8NSString_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "recordPredictionMetrics:forInteraction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void REClearMetrics(void)
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend((id)REStoredMetrics, "objectForKeyedSubscript:", CFSTR("tappedSources"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeAllObjects");

  objc_msgSend((id)REStoredMetrics, "objectForKeyedSubscript:", CFSTR("addedSources"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

  objc_msgSend((id)REStoredMetrics, "objectForKeyedSubscript:", CFSTR("viewedSources"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  REMaxElementCount = 0;
}

void sub_2133B77CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void REBeginObservingMetrics()
{
  dispatch_metrics(&__block_literal_global_13_3);
}

void sub_2133B78AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void REEndObservingMetrics()
{
  dispatch_metrics(&__block_literal_global_18_0);
}

void REAddedElementFromDataSource(void *a1)
{
  id v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v1 = a1;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __REAddedElementFromDataSource_block_invoke;
  v3[3] = &unk_24CF90A78;
  v4 = v1;
  v2 = v1;
  dispatch_metrics(v3);

}

void sub_2133B7A5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void REViewedElementFromDataSource(void *a1)
{
  id v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v1 = a1;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __REViewedElementFromDataSource_block_invoke;
  v3[3] = &unk_24CF90A78;
  v4 = v1;
  v2 = v1;
  dispatch_metrics(v3);

}

void sub_2133B7BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void RETappedElementFromDataSource(void *a1)
{
  id v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v1 = a1;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __RETappedElementFromDataSource_block_invoke;
  v3[3] = &unk_24CF90A78;
  v4 = v1;
  v2 = v1;
  dispatch_metrics(v3);

}

void sub_2133B7D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void RESetNumberOfElements(uint64_t a1)
{
  _QWORD v1[5];

  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 3221225472;
  v1[2] = __RESetNumberOfElements_block_invoke;
  v1[3] = &__block_descriptor_40_e5_v8__0l;
  v1[4] = a1;
  dispatch_metrics(v1);
}

void sub_2133B7E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2133B7F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2133B7FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void ___ZL15RESubmitMetricsv_block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[8];
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  RELogForDomain(18);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2132F7000, v0, OS_LOG_TYPE_DEFAULT, "daily core analytics callback", v8, 2u);
  }

  if (REMetricsEnabled == 1)
  {
    ___ZL15RESubmitMetricsv_block_invoke_78(v1, CFSTR("com.apple.NanoTimeKit.UpNextTappedSources"), CFSTR("tappedSources"));
    ___ZL15RESubmitMetricsv_block_invoke_78(v2, CFSTR("com.apple.NanoTimeKit.UpNextAddedSources"), CFSTR("addedSources"));
    ___ZL15RESubmitMetricsv_block_invoke_78(v3, CFSTR("com.apple.NanoTimeKit.UpNextViewedSources"), CFSTR("viewedSources"));
    v9 = CFSTR("elementsCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", REMaxElementCount);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    REClearMetrics();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("REDidCollectMetrics"), 0);

    RELogForDomain(18);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2132F7000, v7, OS_LOG_TYPE_DEFAULT, "submitted daily core analytics metrics", v8, 2u);
    }

  }
}

void sub_2133B81E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL15RESubmitMetricsv_block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  objc_msgSend((id)REStoredMetrics, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x24BDBD1A8];
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14);
        v21 = v5;
        v22 = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1, (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEvent();

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v12);
  }

}

void sub_2133B839C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

__CFString *REStringFromDeviceMotion(unint64_t a1)
{
  if (a1 > 8)
    return 0;
  else
    return off_24CF90C18[a1];
}

id getCMMotionActivityManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCMMotionActivityManagerClass_softClass;
  v7 = getCMMotionActivityManagerClass_softClass;
  if (!getCMMotionActivityManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCMMotionActivityManagerClass_block_invoke;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __getCMMotionActivityManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2133B8760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133B89C0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

Class __getCMMotionActivityManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreMotionLibraryCore_frameworkLibrary)
  {
    CoreMotionLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreMotionLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CMMotionActivityManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCMMotionActivityManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getCMMotionActivityManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2133B9750(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2133B97BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::vector<unsigned long>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<unsigned long>::__append((char **)a1, a2 - v2);
  }
}

void sub_2133B985C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)RETransformerInvocation;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void std::vector<unsigned long>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 3);
    if (v10 >> 61)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 3;
    v12 = v5 - v8;
    if (v12 >> 2 > v10)
      v10 = v12 >> 2;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[8 * v11];
    v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      v18 = *((_QWORD *)v7 - 1);
      v7 -= 8;
      *((_QWORD *)v15 - 1) = v18;
      v15 -= 8;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

uint64_t REFancyShrinkingDictionary::pushToIDF(uint64_t a1, __int128 **a2)
{
  __int128 *v3;
  __int128 *v4;
  unsigned __int8 *v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t **v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;
  __int128 *v12;
  unsigned int v13;
  uint64_t *i;
  __int128 *v15;
  std::string *v16;
  __int128 v17;
  std::string *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  __int16 v28;
  char *v30;
  __int128 *v31;
  std::string *v32;
  unint64_t v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned __int8 *v37;
  void *__p;
  char *v39;
  char *v40;
  std::string *v41;
  std::string *v42;
  unint64_t v43;
  __int128 *v44;

  v3 = *a2;
  v4 = a2[1];
  if (*a2 != v4)
  {
    do
    {
      v41 = (std::string *)v3;
      v5 = std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, (unsigned __int8 *)v3, (uint64_t)&std::piecewise_construct, (__int128 **)&v41);
      ++*((_WORD *)v5 + 20);
      v3 = (__int128 *)((char *)v3 + 24);
    }
    while (v3 != v4);
  }
  if (!*(_BYTE *)(a1 + 61))
  {
    if (*(_QWORD *)(a1 + 24) > *(_QWORD *)(a1 + 40))
    {
      v41 = 0;
      v42 = 0;
      v43 = 0;
      __p = 0;
      v39 = 0;
      v40 = 0;
      for (i = *(uint64_t **)(a1 + 16); i; i = (uint64_t *)*i)
      {
        v15 = (__int128 *)(i + 2);
        v16 = v42;
        if ((unint64_t)v42 >= v43)
        {
          v18 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v41, v15);
        }
        else
        {
          if (*((char *)i + 39) < 0)
          {
            std::string::__init_copy_ctor_external(v42, (const std::string::value_type *)i[2], i[3]);
          }
          else
          {
            v17 = *v15;
            v42->__r_.__value_.__r.__words[2] = i[4];
            *(_OWORD *)&v16->__r_.__value_.__l.__data_ = v17;
          }
          v18 = v16 + 1;
        }
        v42 = v18;
        v19 = v39;
        if (v39 >= v40)
        {
          v21 = (char *)__p;
          v22 = v39 - (_BYTE *)__p;
          if (v39 - (_BYTE *)__p <= -3)
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          v23 = v22 >> 1;
          if (v40 - (_BYTE *)__p <= (unint64_t)((v22 >> 1) + 1))
            v24 = v23 + 1;
          else
            v24 = v40 - (_BYTE *)__p;
          if ((unint64_t)(v40 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFFELL)
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v25 = v24;
          if (v25)
          {
            v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&v40, v25);
            v21 = (char *)__p;
            v19 = v39;
          }
          else
          {
            v26 = 0;
          }
          v27 = &v26[2 * v23];
          *(_WORD *)v27 = *((_WORD *)i + 20);
          v20 = v27 + 2;
          while (v19 != v21)
          {
            v28 = *((_WORD *)v19 - 1);
            v19 -= 2;
            *((_WORD *)v27 - 1) = v28;
            v27 -= 2;
          }
          __p = v27;
          v39 = v20;
          v40 = &v26[2 * v25];
          if (v21)
            operator delete(v21);
        }
        else
        {
          *(_WORD *)v39 = *((_WORD *)i + 20);
          v20 = v19 + 2;
        }
        v39 = v20;
      }
      std::__sort<std::__less<unsigned short,unsigned short> &,unsigned short *>();
      v30 = (char *)__p;
      v31 = (__int128 *)v41;
      v32 = v42;
      if (v41 == v42)
        goto LABEL_60;
      v33 = *(_QWORD *)(a1 + 40);
      v34 = *((unsigned __int16 *)__p + v33 - *(_QWORD *)(a1 + 48));
      v35 = *((unsigned __int16 *)__p + (unint64_t)((double)v33 * 0.9));
      do
      {
        v44 = v31;
        v36 = *((unsigned __int16 *)std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, (unsigned __int8 *)v31, (uint64_t)&std::piecewise_construct, &v44)+ 20);
        if (v36 > v34 && (v36 < v35 || !*(_BYTE *)(a1 + 60) || v35 == v34))
        {
          v44 = v31;
          v37 = std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, (unsigned __int8 *)v31, (uint64_t)&std::piecewise_construct, &v44);
          *((_WORD *)v37 + 20) >>= 1;
        }
        else
        {
          std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__erase_unique<std::string>((_QWORD *)a1, (unsigned __int8 *)v31);
        }
        v31 = (__int128 *)((char *)v31 + 24);
      }
      while (v31 != (__int128 *)v32);
      v30 = (char *)__p;
      if (__p)
      {
LABEL_60:
        v39 = v30;
        operator delete(v30);
      }
      goto LABEL_61;
    }
    return 0;
  }
  v6 = *(uint64_t **)(a1 + 16);
  if (!v6)
    return 0;
  v7 = 0;
  v8 = *(uint64_t ***)(a1 + 16);
  do
  {
    v7 += *((unsigned __int16 *)v8 + 20);
    v8 = (uint64_t **)*v8;
  }
  while (v8);
  if (v7 <= *(_QWORD *)(a1 + 40))
    return 0;
  v9 = 0;
  v41 = 0;
  v42 = 0;
  v43 = 0;
  do
  {
    v10 = (__int128 *)(v6 + 2);
    if ((unint64_t)v9 >= v43)
    {
      v9 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v41, v10);
    }
    else
    {
      if (*((char *)v6 + 39) < 0)
      {
        std::string::__init_copy_ctor_external(v9, (const std::string::value_type *)v6[2], v6[3]);
      }
      else
      {
        v11 = *v10;
        v9->__r_.__value_.__r.__words[2] = v6[4];
        *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
      }
      ++v9;
    }
    v42 = v9;
    v6 = (uint64_t *)*v6;
  }
  while (v6);
  v12 = (__int128 *)v41;
  if (v41 != v9)
  {
    do
    {
      v44 = v12;
      v13 = *((unsigned __int16 *)std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, (unsigned __int8 *)v12, (uint64_t)&std::piecewise_construct, &v44)+ 20);
      if (v13 > 1)
      {
        v44 = v12;
        *((_WORD *)std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, (unsigned __int8 *)v12, (uint64_t)&std::piecewise_construct, &v44)+ 20) = v13 >> 1;
      }
      else
      {
        std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__erase_unique<std::string>((_QWORD *)a1, (unsigned __int8 *)v12);
      }
      v12 = (__int128 *)((char *)v12 + 24);
    }
    while (v12 != (__int128 *)v9);
  }
LABEL_61:
  __p = &v41;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  return 1;
}

void sub_2133B9E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, char *__p, char *a10, uint64_t a11, char a12, uint64_t a13)
{
  if (__p)
  {
    a10 = __p;
    operator delete(__p);
  }
  __p = &a12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

uint64_t REFancyShrinkingDictionary::totalTermCount(REFancyShrinkingDictionary *this)
{
  void **next;
  uint64_t result;

  next = (void **)this->m_mapDocumentFrequency.__table_.__p1_.__value_.__next_;
  if (!next)
    return 0;
  result = 0;
  do
  {
    result += *((unsigned __int16 *)next + 20);
    next = (void **)*next;
  }
  while (next);
  return result;
}

unsigned __int8 *REFancyShrinkingDictionary::getTokenCount(_QWORD *a1, unsigned __int8 *a2)
{
  unsigned __int8 *result;

  result = std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::find<std::string>(a1, a2);
  if (result)
    return (unsigned __int8 *)*((unsigned __int16 *)result + 20);
  return result;
}

_QWORD *REFancyShrinkingDictionary::SaveModel(uint64_t a1, _QWORD *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *result;
  uint64_t **i;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"FancyShrinkingDictionary\n", 25);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"ModelVersion\t", 13);
  v4 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"TokensCount\t", 12);
  v5 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"\n", 1);
  result = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"Tokens\n", 7);
  for (i = *(uint64_t ***)(a1 + 16); i; i = (uint64_t **)*i)
  {
    v8 = *((char *)i + 39);
    if (v8 >= 0)
      v9 = (uint64_t)(i + 2);
    else
      v9 = (uint64_t)i[2];
    if (v8 >= 0)
      v10 = *((unsigned __int8 *)i + 39);
    else
      v10 = (uint64_t)i[3];
    v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, v9, v10);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"\t", 1);
    v12 = (_QWORD *)std::ostream::operator<<();
    result = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"\n", 1);
  }
  return result;
}

BOOL std::operator!=[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  if (*((char *)a1 + 23) < 0)
  {
    if (v4 == a1[1])
    {
      if (v4 == -1)
        goto LABEL_10;
      a1 = (_QWORD *)*a1;
      return memcmp(a1, __s, v4) != 0;
    }
  }
  else if (v4 == *((unsigned __int8 *)a1 + 23))
  {
    if (v4 == -1)
LABEL_10:
      std::string::__throw_out_of_range[abi:ne180100]();
    return memcmp(a1, __s, v4) != 0;
  }
  return 1;
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t *std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__erase_unique<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  uint64_t *result;

  result = (uint64_t *)std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::find<std::string>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::find<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v13 == v6)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v6 == v13)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::erase(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  void **v3;
  void *__p;
  uint64_t v6;

  v2 = *a2;
  std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::remove(a1, a2, (uint64_t)&__p);
  v3 = (void **)__p;
  __p = 0;
  if (v3)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100]((uint64_t)&v6, v3);
  return v2;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(2 * a2);
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]("basic_string");
}

__CFString *REValueDescriptionStringFromFeatureValue(void *a1)
{
  id v1;
  void *v2;
  int v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    switch(objc_msgSend(v1, "type"))
    {
      case 0:
        v3 = objc_msgSend(v2, "BOOLValue");
        v4 = CFSTR("NO");
        if (v3)
          v4 = CFSTR("YES");
        v5 = v4;
        goto LABEL_12;
      case 1:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v2, "int64Value"));
        goto LABEL_10;
      case 2:
        v7 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v2, "doubleValue");
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%f"), v8);
LABEL_10:
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 3:
        objc_msgSend(v2, "stringValue");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:
        v6 = v5;
        break;
      case 4:
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v2, "setValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              REValueDescriptionStringFromFeatureValue(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v15);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v12);
        }

        v16 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("{%@}"), v17);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        v6 = 0;
        break;
    }
  }
  else
  {
    v6 = CFSTR("(Null)");
  }

  return v6;
}

uint64_t REValidFeatureValueTypeForFeatureType(unint64_t a1, uint64_t a2)
{
  unsigned int v2;
  BOOL v3;

  if (a1 >= 5)
    LOBYTE(v2) = 1;
  else
    v2 = (6u >> a1) & 1;
  v3 = a1 - 5 < 0xFFFFFFFFFFFFFFFDLL;
  if (a2)
    v3 = v2;
  if (a2 == 1)
    v3 = a1 != 2;
  if (a2 != 2)
    LOBYTE(v2) = v3;
  return v2 & 1;
}

uint64_t REBooleanValueForTaggedPointer(unint64_t a1)
{
  if ((a1 & 1) == 0)
    return objc_msgSend((id)a1, "BOOLValue");
  return (a1 & 6) == 0 && a1 > 7;
}

uint64_t REIntegerValueForTaggedPointer(unint64_t a1)
{
  if ((a1 & 1) == 0)
    return objc_msgSend((id)a1, "int64Value");
  if ((a1 & 6) == 2)
    return a1 >> 3;
  return 0;
}

double REDoubleValueForTaggedPointer(void *a1, const char *a2)
{
  double result;

  if ((a1 & 1) != 0)
  {
    result = 0.0;
    if ((a1 & 6) == 4)
      *(_QWORD *)&result = (unint64_t)a1 & 0xFFFFFFFFFFFFFFF8;
  }
  else
  {
    objc_msgSend(a1, "doubleValue");
  }
  return result;
}

__CFString *REStringValueForTaggedPointer(unint64_t a1)
{
  __CFString *v1;
  unint64_t v2;
  uint64_t i;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if ((a1 & 1) != 0)
  {
    if ((~(_BYTE)a1 & 6) != 0)
    {
      v1 = &stru_24CF92178;
    }
    else
    {
      v2 = a1 >> 3;
      v5[0] = 0;
      for (i = 6; i != -1; --i)
      {
        *((_BYTE *)v5 + i) = v2;
        v2 >>= 8;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend((id)a1, "stringValue");
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

id RESetValueForTaggedPointer(void *a1)
{
  if ((a1 & 1) != 0)
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
  else
    objc_msgSend(a1, "setValue");
  return (id)objc_claimAutoreleasedReturnValue();
}

id REDescriptionForTaggedPointer(void *a1)
{
  void *v1;
  void *v2;

  REFeatureValueForTaggedPointer(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  REValueDescriptionStringFromFeatureValue(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_2133BD288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2133BEA94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *REExtractUserActivity(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "activityType");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = &stru_24CF92178;
    if (v3)
      v5 = (__CFString *)v3;
    v6 = v5;

    objc_msgSend(v2, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v2, "requiredUserInfoKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        objc_msgSend(v7, "allKeys");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v14)
      {
        v15 = v14;
        v16 = 0;
        v17 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v27 != v17)
              objc_enumerationMutation(v13);
            v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            v20 = objc_msgSend(v19, "re_actionIdentifierHashValue");
            objc_msgSend(v7, "objectForKeyedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "re_actionIdentifierHashValue") + v20;

            v16 ^= v22;
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v15);
      }
      else
      {
        v16 = 0;
      }

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("&userInfoHash=%@"), v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v6 = (__CFString *)v24;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void _HTTPServerInvalidated(void *a1)
{
  id v1;

  objc_msgSend(a1, "weakObjectValue");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidated");

}

void _HTTPServerRecievedError(void *a1, uint64_t a2)
{
  id v3;

  objc_msgSend(a1, "weakObjectValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didRecievedError:", a2);

}

void _HTTPServerDidOpenConnection(void *a1, uint64_t a2)
{
  id v3;

  objc_msgSend(a1, "weakObjectValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didOpenConnection:", a2);

}

void _HTTPServerDidCloseConnection(void *a1, uint64_t a2)
{
  id v3;

  objc_msgSend(a1, "weakObjectValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didCloseConnection:", a2);

}

void sub_2133BFAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RELocationPredictorUserLocationFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("RELocationOfInterestHome")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("RELocationOfInterestWork")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("RELocationOfInterestGym")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("RELocationOfInterestSchool")))
  {
    v2 = 2;
  }
  else
  {
    v2 = -1;
  }

  return v2;
}

void sub_2133C006C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133C086C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;

  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

Class __getRTRoutineManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreRoutineLibraryCore_frameworkLibrary)
  {
    CoreRoutineLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreRoutineLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("RTRoutineManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getRTRoutineManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getRTRoutineManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id REDescriptionForExportedObject(void *a1)
{
  id v1;
  void *v2;
  int v3;
  RELogExportedValueEncoder *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;

  v1 = a1;
  +[RESingleton sharedInstance](REInterfaceCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "exportedInterfaceClass:", objc_opt_class());

  if (v3)
  {
    v4 = -[REExportedValueEncoder initWithOptions:]([RELogExportedValueEncoder alloc], "initWithOptions:", 2);
    +[REExportedValue exportedValueForObject:](REExportedValue, "exportedValueForObject:", v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[REExportedValueEncoder dataFromExportedValue:](v4, "dataFromExportedValue:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }
  if (v7)
    v8 = v7;
  else
    v8 = &stru_24CF92178;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p> %@"), objc_opt_class(), v1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id REVerboseDescriptionForExportedObject(void *a1)
{
  id v1;
  void *v2;
  int v3;
  RELogExportedValueEncoder *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;

  v1 = a1;
  +[RESingleton sharedInstance](REInterfaceCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "exportedInterfaceClass:", objc_opt_class());

  if (v3)
  {
    v4 = -[REExportedValueEncoder initWithOptions:]([RELogExportedValueEncoder alloc], "initWithOptions:", 5);
    +[REExportedValue exportedValueForObject:](REExportedValue, "exportedValueForObject:", v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[REExportedValueEncoder dataFromExportedValue:](v4, "dataFromExportedValue:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }
  if (v7)
    v8 = v7;
  else
    v8 = &stru_24CF92178;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p> %@"), objc_opt_class(), v1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id RELogHeader(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  v3 = v2 + 4;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 3 * v2 + 21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", CFSTR("*"));
  if (v3)
  {
    v5 = v3;
    do
    {
      objc_msgSend(v4, "appendString:", CFSTR("-"));
      --v5;
    }
    while (v5);
    objc_msgSend(v4, "appendString:", CFSTR("*\n"));
    objc_msgSend(v4, "appendString:", CFSTR("|  "));
    objc_msgSend(v4, "appendString:", v1);
    objc_msgSend(v4, "appendString:", CFSTR("  |\n"));
    objc_msgSend(v4, "appendString:", CFSTR("*"));
    do
    {
      objc_msgSend(v4, "appendString:", CFSTR("-"));
      --v3;
    }
    while (v3);
  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR("*\n"));
    objc_msgSend(v4, "appendString:", CFSTR("|  "));
    objc_msgSend(v4, "appendString:", v1);
    objc_msgSend(v4, "appendString:", CFSTR("  |\n"));
    objc_msgSend(v4, "appendString:", CFSTR("*"));
  }
  objc_msgSend(v4, "appendString:", CFSTR("*\n\n"));
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

void RelevanceEngineUILibrary()
{
  void *v0;

  if (!RelevanceEngineUILibraryCore_frameworkLibrary_0)
    RelevanceEngineUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!RelevanceEngineUILibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void sub_2133C3178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCLKImageProviderClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ClockKitLibraryCore_frameworkLibrary_0)
  {
    ClockKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!ClockKitLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CLKImageProvider");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCLKImageProviderClass_block_invoke_cold_1();
    free(v3);
  }
  getCLKImageProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *REStringForLocationType(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_24CF91458[a1];
}

uint64_t REMLExplanationsEnabled()
{
  void *v0;
  uint64_t v1;

  if (_fetchedInternalBuildOnceToken_11 != -1)
    dispatch_once(&_fetchedInternalBuildOnceToken_11, &__block_literal_global_85);
  if (!_isInternalDevice_11)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("REUserDefaultMLExplanationsEnabled"));

  return v1;
}

void sub_2133C78A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_2133C7A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose((const void *)(v10 - 80), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133C7C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPPNamedEntityStoreClass_block_invoke(uint64_t a1)
{
  PersonalizationPortraitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PPNamedEntityStore");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPPNamedEntityStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPPNamedEntityStoreClass_block_invoke_cold_1();
    PersonalizationPortraitLibrary();
  }
}

void PersonalizationPortraitLibrary()
{
  void *v0;

  if (!PersonalizationPortraitLibraryCore_frameworkLibrary)
    PersonalizationPortraitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PersonalizationPortraitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getPPNamedEntityQueryClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;
  id v5;
  id *v6;

  PersonalizationPortraitLibrary();
  result = objc_getClass("PPNamedEntityQuery");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPPNamedEntityQueryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getPPNamedEntityQueryClass_block_invoke_cold_1();
    return (Class)+[REScriptASTDeclarationNode parseBuffer:error:](v3, v4, v5, v6);
  }
  return result;
}

BOOL REExpectTokenType(void *a1, unint64_t a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = objc_msgSend(v5, "type");
  v7 = v6;
  if (a3 && v6 != a2)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    REDescriptionForTokenType(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Unexpected token \"%@\" found. Expecting '%@' token."), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = CFSTR("REErrorTokenKey");
    v15[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    RECreateErrorWithCodeMessageAndUseInfo(204, v11, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7 == a2;
}

BOOL REExpectTokenTypeInBuffer(void *a1, unint64_t a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v5 = a1;
  if (objc_msgSend(v5, "isEmpty"))
  {
    if (!a3)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v6 = (void *)MEMORY[0x24BDD17C8];
    REDescriptionForTokenType(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Expecting '%@' token but reached end of file"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    RECreateErrorWithCodeAndMessage(205, v8);
    v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "currentToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = REExpectTokenType(v8, a2, a3);
  }

LABEL_7:
  return v9;
}

unint64_t REEncodeFeatureValuePair(unsigned __int8 a1, uint64_t a2)
{
  return a2 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)a1 << 56);
}

id REStringArrayFromVector(uint64_t **a1)
{
  void *v2;
  uint64_t *i;
  uint64_t *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * (a1[1] - *a1));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = *a1; i != a1[1]; i += 3)
  {
    v4 = i;
    if (*((char *)i + 23) < 0)
      v4 = (uint64_t *)*i;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v5);

  }
  v6 = (void *)objc_msgSend(v2, "copy");

  return v6;
}

void sub_2133C8A8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2133C8BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;
  void *v12;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2133C8FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v43;

  if (__p)
    operator delete(__p);
  if (a21)
    operator delete(a21);
  if (a27)
    operator delete(a27);
  if (a30)
    operator delete(a30);

  v43 = *(void **)(v41 - 120);
  if (v43)
  {
    *(_QWORD *)(v41 - 112) = v43;
    operator delete(v43);
  }

  _Unwind_Resume(a1);
}

void sub_2133C91D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

_QWORD *__copy_helper_block_ea8_40c39_ZTSNSt3__16vectorIyNS_9allocatorIyEEEE(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  v2 = (_QWORD *)(a1 + 40);
  v2[2] = 0;
  return std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(v2, *(const void **)(a2 + 40), *(_QWORD *)(a2 + 48), (uint64_t)(*(_QWORD *)(a2 + 48) - *(_QWORD *)(a2 + 40)) >> 3);
}

void __destroy_helper_block_ea8_40c39_ZTSNSt3__16vectorIyNS_9allocatorIyEEEE(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(_QWORD *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

void sub_2133C92C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t BayesianModel::AccessGaussiansAndBias(pthread_rwlock_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  pthread_rwlock_rdlock(a1);
  BayesianModel::GetGaussiansAndBias2((uint64_t)a1, a2, a3, a4);
  return pthread_rwlock_unlock(a1);
}

void sub_2133C9334(_Unwind_Exception *a1)
{
  pthread_rwlock_t *v1;

  pthread_rwlock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2133C93DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

_QWORD *__copy_helper_block_ea8_48c39_ZTSNSt3__16vectorIdNS_9allocatorIdEEEE72c39_ZTSNSt3__16vectorIdNS_9allocatorIdEEEE(_QWORD *a1, uint64_t a2)
{
  a1[6] = 0;
  a1[7] = 0;
  a1[8] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a1 + 6, *(const void **)(a2 + 48), *(_QWORD *)(a2 + 56), (uint64_t)(*(_QWORD *)(a2 + 56) - *(_QWORD *)(a2 + 48)) >> 3);
  a1[9] = 0;
  a1[10] = 0;
  a1[11] = 0;
  return std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a1 + 9, *(const void **)(a2 + 72), *(_QWORD *)(a2 + 80), (uint64_t)(*(_QWORD *)(a2 + 80) - *(_QWORD *)(a2 + 72)) >> 3);
}

void sub_2133C9464(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 56) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_ea8_48c39_ZTSNSt3__16vectorIdNS_9allocatorIdEEEE72c39_ZTSNSt3__16vectorIdNS_9allocatorIdEEEE(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[9];
  if (v2)
  {
    a1[10] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[6];
  if (v3)
  {
    a1[7] = v3;
    operator delete(v3);
  }
}

void sub_2133C960C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2133C96BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

unint64_t BayesianModel::getNumberOfCoordinates(BayesianModel *this)
{
  unint64_t value;

  pthread_rwlock_rdlock(&this->m_rwlock);
  value = this->m_features.__table_.__p2_.__value_;
  pthread_rwlock_unlock(&this->m_rwlock);
  return value;
}

void sub_2133C9A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2133C9B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  a12 = (void **)&a9;
  std::vector<std::vector<std::string>>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<unsigned long long>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned long long>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_2133C9BDC(_Unwind_Exception *exception_object)
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

char *std::vector<unsigned long long>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

_QWORD *std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<unsigned long long>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2133C9C94(_Unwind_Exception *exception_object)
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

_QWORD *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<unsigned long long>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2133C9D0C(_Unwind_Exception *exception_object)
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

void std::vector<std::vector<std::string>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;
  void **v6;

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
        v4 -= 3;
        v6 = v4;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

id soft__REEngineDefaults_2()
{
  void *v0;
  id v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  Class (*v8)(uint64_t);
  void *v9;
  uint64_t *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!RelevanceEngineLibraryCore_frameworkLibrary_4)
  {
    v7 = xmmword_24CF91718;
    v8 = 0;
    RelevanceEngineLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  }
  if (!RelevanceEngineLibraryCore_frameworkLibrary_4)
    return 0;
  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  v0 = (void *)get_REEngineDefaultsClass_softClass_3;
  v6 = get_REEngineDefaultsClass_softClass_3;
  if (!get_REEngineDefaultsClass_softClass_3)
  {
    *(_QWORD *)&v7 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v7 + 1) = 3221225472;
    v8 = __get_REEngineDefaultsClass_block_invoke_3;
    v9 = &unk_24CF8AC38;
    v10 = &v3;
    __get_REEngineDefaultsClass_block_invoke_3((uint64_t)&v7);
    v0 = (void *)v4[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_2133CABE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_2133CB440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id get_DKApplicationActivityMetadataKeyClass_0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_DKApplicationActivityMetadataKeyClass_softClass_0;
  v7 = get_DKApplicationActivityMetadataKeyClass_softClass_0;
  if (!get_DKApplicationActivityMetadataKeyClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_DKApplicationActivityMetadataKeyClass_block_invoke_0;
    v3[3] = &unk_24CF8AC38;
    v3[4] = &v4;
    __get_DKApplicationActivityMetadataKeyClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2133CB7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2133CBBE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CoreDuetLibrary_2()
{
  void *v0;

  if (!CoreDuetLibraryCore_frameworkLibrary_2)
    CoreDuetLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  if (!CoreDuetLibraryCore_frameworkLibrary_2)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_5_4(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t RECompareFeatureValues(unint64_t a1, void *a2)
{
  unint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  char v10;
  uint64_t v11;
  const char *v12;
  double v13;
  double v14;
  uint64_t v15;
  unint64_t v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  const void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  const char *v32;
  double v33;
  void *v34;
  void *v35;
  const void *v36;
  unint64_t v37;
  BOOL v38;
  BOOL v39;
  double v40;
  void *v41;
  unint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  void *v46;
  double v47;
  unint64_t v48;
  uint64_t v49;
  double v50;
  void *v51;
  int v52;
  uint64_t v53;

  v3 = a1;
  v4 = REFeatureValueTypeForTaggedPointer(a1);
  v6 = REFeatureValueTypeForTaggedPointer((unint64_t)a2);
  switch(v4)
  {
    case 0:
      v7 = REBooleanValueForTaggedPointer(v3);
      v8 = v7;
      switch(v6)
      {
        case 0:
          v9 = REBooleanValueForTaggedPointer((unint64_t)a2);
          v10 = v8 & (v9 ^ 1);
          v11 = v9 & ~v8;
          goto LABEL_63;
        case 1:
          v48 = REIntegerValueForTaggedPointer((unint64_t)a2);
          if (v48 <= v8)
            v49 = 0;
          else
            v49 = -1;
          if (v48 >= v8)
            return v49;
          else
            return 1;
        case 2:
          v40 = (double)v7;
LABEL_58:
          v50 = REDoubleValueForTaggedPointer(a2, v5);
          if (v50 < v40)
            return 1;
          if (v50 > v40)
            return -1;
          return 0;
        case 3:
          REStringValueForTaggedPointer((unint64_t)a2);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "BOOLValue");

          v10 = v8 & (v52 ^ 1);
          v11 = v52 & ~v8;
LABEL_63:
          v53 = v11 << 63 >> 63;
          if ((v10 & 1) != 0)
            return 1;
          else
            return v53;
        case 4:
LABEL_17:
          RESetValueForTaggedPointer(a2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "anyObject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (const void *)RECreateFeatureValueTaggedPointer(v23);

          v25 = v3;
          goto LABEL_20;
        default:
          goto LABEL_4;
      }
    case 1:
LABEL_6:
      v15 = REIntegerValueForTaggedPointer(v3);
      v16 = v15;
      switch(v6)
      {
        case 0:
          v17 = REBooleanValueForTaggedPointer((unint64_t)a2);
          if (v16 >= v17)
            v18 = 0;
          else
            v18 = -1;
          if (v16 <= v17)
            return v18;
          else
            return 1;
        case 1:
          v37 = REIntegerValueForTaggedPointer((unint64_t)a2);
          v38 = v16 >= v37;
          v39 = v16 > v37;
          goto LABEL_34;
        case 2:
          v40 = (double)(unint64_t)v15;
          goto LABEL_58;
        case 3:
          REStringValueForTaggedPointer((unint64_t)a2);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "longLongValue");

          v38 = v16 >= v42;
          v39 = v16 > v42;
LABEL_34:
          if (v38)
            v43 = 0;
          else
            v43 = -1;
          if (v39)
            v3 = 1;
          else
            v3 = v43;
          break;
        case 4:
          goto LABEL_17;
        default:
          goto LABEL_13;
      }
      return v3;
    case 2:
LABEL_4:
      v13 = REDoubleValueForTaggedPointer((void *)v3, v5);
      switch(v6)
      {
        case 0:
          v14 = (double)REBooleanValueForTaggedPointer((unint64_t)a2);
          goto LABEL_48;
        case 1:
          v14 = (double)(unint64_t)REIntegerValueForTaggedPointer((unint64_t)a2);
          goto LABEL_48;
        case 2:
          v44 = REDoubleValueForTaggedPointer(a2, v12);
          v45 = -1;
          if (v13 >= v44)
            v45 = 0;
          if (v13 <= v44)
            return v45;
          else
            return 1;
        case 3:
          REStringValueForTaggedPointer((unint64_t)a2);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "doubleValue");
          v14 = v47;

LABEL_48:
          if (v13 > v14)
            return 1;
          if (v13 < v14)
            return -1;
          return 0;
        case 4:
          goto LABEL_17;
        default:
          goto LABEL_6;
      }
    case 3:
LABEL_13:
      REStringValueForTaggedPointer(v3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      switch(v6)
      {
        case 0:
          v21 = objc_msgSend(v19, "BOOLValue");
          v22 = REBooleanValueForTaggedPointer((unint64_t)a2);
          if (v21 && !v22)
            goto LABEL_28;
          v3 = (uint64_t)((unint64_t)(v22 & ~v21) << 63) >> 63;
          goto LABEL_67;
        case 1:
          v27 = objc_msgSend(v19, "longLongValue");
          v28 = REIntegerValueForTaggedPointer((unint64_t)a2);
          if (v27 >= v28)
            v29 = 0;
          else
            v29 = -1;
          if (v27 <= v28)
            v3 = v29;
          else
            v3 = 1;
          goto LABEL_67;
        case 2:
          objc_msgSend(v19, "doubleValue");
          v31 = v30;
          v33 = REDoubleValueForTaggedPointer(a2, v32);
          if (v31 <= v33)
          {
            if (v31 < v33)
              v3 = -1;
            else
              v3 = 0;
          }
          else
          {
LABEL_28:
            v3 = 1;
          }
          goto LABEL_67;
        case 3:
          REStringValueForTaggedPointer((unint64_t)a2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = objc_msgSend(v20, "localizedCompare:", v34);
          goto LABEL_66;
        case 4:
          RESetValueForTaggedPointer(a2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "anyObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (const void *)RECreateFeatureValueTaggedPointer(v35);

          v3 = RECompareFeatureValues(v3, v36);
          REReleaseFeatureValueTaggedPointer(v36);
LABEL_66:

          break;
        default:

          goto LABEL_19;
      }
      goto LABEL_67;
    case 4:
LABEL_19:
      RESetValueForTaggedPointer((void *)v3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "anyObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (const void *)RECreateFeatureValueTaggedPointer(v26);

      v25 = (unint64_t)a2;
LABEL_20:
      v3 = RECompareFeatureValues(v25, v24);
      REReleaseFeatureValueTaggedPointer(v24);
LABEL_67:

      break;
    default:
      return v3;
  }
  return v3;
}

void REEnsureFeature(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!a1)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Feature must be non-nil"), a3, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_2133CC948()
{
  uint64_t v0;

  v0 = sub_2133D4598();
  __swift_allocate_value_buffer(v0, qword_254B9B470);
  __swift_project_value_buffer(v0, (uint64_t)qword_254B9B470);
  return sub_2133D458C();
}

uint64_t sub_2133CC9C0()
{
  uint64_t v0;

  if (qword_254B9B458 != -1)
    swift_once();
  v0 = sub_2133D4598();
  return __swift_project_value_buffer(v0, (uint64_t)qword_254B9B470);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_2133CCA6C@<X0>(uint64_t a1@<X8>)
{
  return sub_2133CCD68(&OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime, a1);
}

uint64_t sub_2133CCA78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199B26F8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2133CCB0C(uint64_t a1)
{
  return sub_2133CCEC8(a1, &OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime);
}

uint64_t sub_2133CCB18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2133CCB60(_QWORD **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x60))();
}

uint64_t sub_2133CCB98(uint64_t a1, _QWORD **a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A980);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2133CCA78(a1, (uint64_t)v5);
  return (*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & **a2) + 0x68))(v5);
}

uint64_t (*sub_2133CCC2C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_2133CCC80(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A980);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1 + *a3;
  swift_beginAccess();
  sub_2133CCA78(v7, (uint64_t)v6);
  v8 = sub_2133D452C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_2133D4508();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return v10;
}

uint64_t sub_2133CCD5C@<X0>(uint64_t a1@<X8>)
{
  return sub_2133CCD68(&OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime, a1);
}

uint64_t sub_2133CCD68@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + *a1;
  swift_beginAccess();
  return sub_2133CCA78(v4, a2);
}

void sub_2133CCDC0(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A980);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_2133D4520();
    v9 = sub_2133D452C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = sub_2133D452C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = (uint64_t)a1 + *a4;
  swift_beginAccess();
  v12 = a1;
  sub_2133CCB18((uint64_t)v8, v11);
  swift_endAccess();

}

uint64_t sub_2133CCEBC(uint64_t a1)
{
  return sub_2133CCEC8(a1, &OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime);
}

uint64_t sub_2133CCEC8(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + *a2;
  swift_beginAccess();
  sub_2133CCB18(a1, v4);
  return swift_endAccess();
}

uint64_t sub_2133CCF1C(_QWORD **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x78))();
}

uint64_t sub_2133CCF54(uint64_t a1, _QWORD **a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A980);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2133CCA78(a1, (uint64_t)v5);
  return (*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & **a2) + 0x80))(v5);
}

uint64_t (*sub_2133CCFE8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_2133CD02C(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  objc_class *v3;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  char *v11;
  id v12;
  objc_super v14;

  v3 = v2;
  v6 = (char *)objc_allocWithZone(v3);
  v7 = (uint64_t)&v6[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime];
  v8 = sub_2133D452C();
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  v10 = (uint64_t)&v6[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime];
  v9((uint64_t)&v6[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime], 1, 1, v8);
  swift_beginAccess();
  v11 = v6;
  sub_2133CD158(a1, v7);
  swift_endAccess();
  swift_beginAccess();
  sub_2133CD158(a2, v10);
  swift_endAccess();

  v14.receiver = v11;
  v14.super_class = v3;
  v12 = objc_msgSendSuper2(&v14, sel_init);
  sub_2133CD1A0(a2);
  sub_2133CD1A0(a1);
  return v12;
}

uint64_t sub_2133CD158(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_2133CD1A0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A980);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for RESleepScheduleEntry()
{
  uint64_t result;

  result = qword_254B9B460;
  if (!qword_254B9B460)
    return swift_getSingletonMetadata();
  return result;
}

id RESleepScheduleEntry.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void RESleepScheduleEntry.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id RESleepScheduleEntry.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RESleepScheduleEntry();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2133CD614(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2133CD6E4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2133CF70C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_2133CF70C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2133CD6E4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_2133D45F8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2133CD89C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_2133D4628();
  if (!v8)
  {
    sub_2133D4634();
    __break(1u);
LABEL_17:
    result = sub_2133D464C();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_2133CD89C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2133CD930(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2133CDB08(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2133CDB08(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2133CD930(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_2133CDAA4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2133D4610();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2133D4634();
      __break(1u);
LABEL_10:
      v2 = sub_2133D45BC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2133D464C();
    __break(1u);
LABEL_14:
    result = sub_2133D4634();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2133CDAA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A9C0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2133CDB08(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A9C0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2133D464C();
  __break(1u);
  return result;
}

uint64_t sub_2133CDC54(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_2133D455C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A9E8);
    v10 = sub_2133D4604();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_2133CF7D0(&qword_254B9A9F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2A8]);
      v14 = sub_2133D45A4();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_2133CF7D0(&qword_254B9A9F8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2C0]);
          v20 = sub_2133D45B0();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

void sub_2133CDEBC(char *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void (*v41)(unint64_t, _QWORD, uint64_t);
  uint64_t v42;
  id v43;
  unint64_t v44;
  __int128 v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  char **v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  id v58;
  char *v59;
  void (*v60)(char *, unint64_t);
  id v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  char v67;
  char v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t, uint64_t);
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  void (*v79)(char *, uint64_t);
  char *v80;
  NSObject *v81;
  os_log_type_t v82;
  uint8_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  void (*v88)(char *, unint64_t);
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  objc_class *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  void (*v101)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v102;
  char *v103;
  void (*v104)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  objc_super *v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char *v114;
  char *v115;
  char *v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  char *v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  void (*v127)(char *, _QWORD, uint64_t, uint64_t);
  void (*v128)(char *, char *, uint64_t);
  void (*v129)(char *, char *, unint64_t);
  uint64_t v130;
  char *v131;
  char *v132;
  char *v133;
  id v134;
  uint64_t v135;
  objc_super v136;
  uint64_t v137[3];

  v134 = a2;
  v131 = a1;
  v130 = sub_2133D4598();
  v125 = *(_QWORD *)(v130 - 8);
  v2 = MEMORY[0x24BDAC7A8](v130);
  v123 = (char *)&v104 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v124 = (char *)&v104 - v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A9C8);
  MEMORY[0x24BDAC7A8](v5);
  v115 = (char *)&v104 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2133D455C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v104 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = sub_2133D44FC();
  v121 = *(_QWORD *)(v126 - 8);
  v11 = MEMORY[0x24BDAC7A8](v126);
  v133 = (char *)&v104 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v114 = (char *)&v104 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v122 = (char *)&v104 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v104 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A980);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v106 = (uint64_t)&v104 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v117 = (uint64_t)&v104 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v104 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v104 - v27;
  v29 = sub_2133D4538();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v104 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = sub_2133D4574();
  v119 = *(_QWORD *)(v120 - 8);
  MEMORY[0x24BDAC7A8](v120);
  v34 = (char *)&v104 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v32, *MEMORY[0x24BDCEF70], v29);
  sub_2133D4544();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v29);
  v35 = sub_2133D452C();
  v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56);
  v116 = v28;
  v36(v28, 1, 1, v35);
  v118 = v26;
  v105 = v35;
  v104 = v36;
  v36(v26, 1, 1, v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A9D0);
  v37 = *(_QWORD *)(v8 + 72);
  v38 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_2133E5080;
  v40 = v39 + v38;
  v41 = *(void (**)(unint64_t, _QWORD, uint64_t))(v8 + 104);
  v41(v40, *MEMORY[0x24BDCF240], v7);
  v41(v40 + v37, *MEMORY[0x24BDCF250], v7);
  v41(v40 + 2 * v37, *MEMORY[0x24BDCF220], v7);
  sub_2133CDC54(v39);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v132 = v18;
  sub_2133D4550();
  swift_bridgeObjectRelease();
  v41((unint64_t)v10, *MEMORY[0x24BDCF278], v7);
  v131 = v34;
  sub_2133D4568();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  HKSPDayForNSGregorianCalendarDay();
  v42 = HKSPWeekdaysFromDay();
  v43 = objc_msgSend(v134, sel_occurrences);
  sub_2133CF74C();
  v44 = sub_2133D45C8();

  if (v44 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    v46 = sub_2133D4640();
    swift_bridgeObjectRelease();
  }
  else
  {
    v46 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v47 = v126;
  v48 = v122;
  if (v46)
  {
    if (v46 >= 1)
    {
      v49 = 0;
      v50 = v44 & 0xC000000000000001;
      v109 = &v136;
      v51 = &selRef_calibrationCurveTotal;
      *(_QWORD *)&v45 = 136315138;
      v108 = v45;
      v107 = MEMORY[0x24BEE4AD8] + 8;
      v112 = v42;
      v111 = v44;
      v110 = v46;
      v113 = v44 & 0xC000000000000001;
      while (1)
      {
        if (v50)
          v52 = (id)MEMORY[0x2199B17BC](v49, v44);
        else
          v52 = *(id *)(v44 + 8 * v49 + 32);
        v53 = v52;
        if ((v42 & ~(unint64_t)objc_msgSend(v52, v51[125])) != 0)
        {

        }
        else
        {
          v54 = v121;
          v129 = *(void (**)(char *, char *, unint64_t))(v121 + 16);
          v129(v48, v132, v47);
          v55 = v119;
          v128 = *(void (**)(char *, char *, uint64_t))(v119 + 16);
          v56 = v115;
          v44 = v47;
          v57 = v120;
          v128(v115, v131, v120);
          v127 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v55 + 56);
          v127(v56, 0, 1, v57);
          swift_beginAccess();
          sub_2133D44F0();
          swift_endAccess();
          v134 = v53;
          v58 = objc_msgSend(v53, sel_wakeUpComponents);
          v59 = v114;
          sub_2133D4490();

          sub_2133D44C0();
          v60 = *(void (**)(char *, unint64_t))(v54 + 8);
          v60(v59, v44);
          swift_beginAccess();
          sub_2133D44CC();
          swift_endAccess();
          v61 = v134;
          v62 = objc_msgSend(v134, sel_wakeUpComponents);
          sub_2133D4490();

          sub_2133D44D8();
          v60(v59, v44);
          swift_beginAccess();
          v63 = v61;
          sub_2133D44E4();
          swift_endAccess();
          v129(v133, v132, v44);
          v128(v56, v131, v57);
          v127(v56, 0, 1, v57);
          swift_beginAccess();
          sub_2133D44F0();
          swift_endAccess();
          v64 = objc_msgSend(v61, sel_bedtimeComponents);
          sub_2133D4490();

          sub_2133D44C0();
          v60(v59, v44);
          swift_beginAccess();
          sub_2133D44CC();
          swift_endAccess();
          v65 = objc_msgSend(v61, sel_bedtimeComponents);
          sub_2133D4490();

          sub_2133D44D8();
          v129 = (void (*)(char *, char *, unint64_t))v60;
          v60(v59, v44);
          swift_beginAccess();
          sub_2133D44E4();
          swift_endAccess();
          swift_beginAccess();
          v66 = sub_2133D449C();
          v68 = v67;
          swift_endAccess();
          v69 = v130;
          v70 = v124;
          v42 = v125;
          if ((v68 & 1) == 0 && objc_msgSend(v63, sel_crossesDayBoundary))
          {
            if (__OFSUB__(v66, 1))
            {
              __break(1u);
              goto LABEL_25;
            }
            swift_beginAccess();
            sub_2133D44A8();
            swift_endAccess();
          }
          v71 = sub_2133CC9C0();
          v72 = *(void (**)(char *, uint64_t, uint64_t))(v42 + 16);
          v72(v70, v71, v69);
          v73 = sub_2133D4580();
          v74 = sub_2133D45D4();
          if (os_log_type_enabled(v73, v74))
          {
            v75 = (uint8_t *)swift_slowAlloc();
            v76 = swift_slowAlloc();
            v137[0] = v76;
            *(_DWORD *)v75 = v108;
            sub_2133CF7D0(&qword_254B9A9E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE28]);
            v77 = sub_2133D4658();
            v135 = sub_2133CD614(v77, v78, v137);
            v69 = v130;
            sub_2133D45EC();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2132F7000, v73, v74, "The bedtime(startDate) is %s", v75, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2199B2758](v76, -1, -1);
            MEMORY[0x2199B2758](v75, -1, -1);

            v79 = *(void (**)(char *, uint64_t))(v125 + 8);
            v79(v124, v69);
          }
          else
          {

            v79 = *(void (**)(char *, uint64_t))(v42 + 8);
            v79(v70, v69);
          }
          v80 = v123;
          v72(v123, v71, v69);
          v81 = sub_2133D4580();
          v82 = sub_2133D45D4();
          if (os_log_type_enabled(v81, v82))
          {
            v83 = (uint8_t *)swift_slowAlloc();
            v84 = swift_slowAlloc();
            v137[0] = v84;
            v128 = (void (*)(char *, char *, uint64_t))v79;
            *(_DWORD *)v83 = v108;
            sub_2133CF7D0(&qword_254B9A9E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE28]);
            v48 = v122;
            v85 = v126;
            v86 = sub_2133D4658();
            v135 = sub_2133CD614(v86, v87, v137);
            sub_2133D45EC();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2132F7000, v81, v82, "The wakeup(endDate) time is %s", v83, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2199B2758](v84, -1, -1);
            MEMORY[0x2199B2758](v83, -1, -1);

            v47 = v85;
            ((void (*)(char *, uint64_t))v128)(v123, v130);
          }
          else
          {

            v79(v80, v69);
            v47 = v126;
            v48 = v122;
          }
          v42 = v112;
          v44 = v111;
          v46 = v110;
          v88 = (void (*)(char *, unint64_t))v129;
          v89 = v117;
          sub_2133D44B4();
          v90 = (uint64_t)v116;
          sub_2133CD1A0((uint64_t)v116);
          sub_2133CF788(v89, v90);
          v91 = v133;
          sub_2133D44B4();

          v92 = (uint64_t)v118;
          sub_2133CD1A0((uint64_t)v118);
          sub_2133CF788(v89, v92);
          v88(v91, v47);
          v88(v48, v47);
          v50 = v113;
          v51 = &selRef_calibrationCurveTotal;
        }
        if (v46 == ++v49)
          goto LABEL_23;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_23:
    swift_bridgeObjectRelease();
    v93 = (uint64_t)v116;
    v94 = v117;
    sub_2133CCA78((uint64_t)v116, v117);
    v95 = (uint64_t)v118;
    v96 = v106;
    sub_2133CCA78((uint64_t)v118, v106);
    v97 = (objc_class *)type metadata accessor for RESleepScheduleEntry();
    v98 = (char *)objc_allocWithZone(v97);
    v99 = (uint64_t)&v98[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime];
    v100 = v105;
    v101 = v104;
    v104(&v98[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime], 1, 1, v105);
    v102 = (uint64_t)&v98[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime];
    v101(&v98[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime], 1, 1, v100);
    swift_beginAccess();
    v103 = v98;
    sub_2133CD158(v94, v99);
    swift_endAccess();
    swift_beginAccess();
    sub_2133CD158(v96, v102);
    swift_endAccess();

    v136.receiver = v103;
    v136.super_class = v97;
    objc_msgSendSuper2(&v136, sel_init);
    sub_2133CD1A0(v96);
    sub_2133CD1A0(v94);
    (*(void (**)(char *, uint64_t))(v121 + 8))(v132, v126);
    sub_2133CD1A0(v95);
    sub_2133CD1A0(v93);
    (*(void (**)(char *, uint64_t))(v119 + 8))(v131, v120);
  }
}

_QWORD *_s15RelevanceEngine20RESleepScheduleEntryC05sleepE8ForDates7current4next8scheduleAC10Foundation4DateV_AJSo09HKSPSleepD0CtFZ_0(char *a1, char *a2, void *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  void (*v39)(char *, uint64_t, uint64_t, uint64_t);
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t, uint64_t);
  uint64_t v44;
  _QWORD *v45;
  char *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  void *v50;
  uint8_t *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  objc_class *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  void (*v69)(char *, uint64_t);
  char *v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  int v74;
  uint64_t v75;
  void (*v76)(char *, uint64_t, uint64_t);
  char *v77;
  char *v78;
  NSObject *v79;
  os_log_type_t v80;
  uint64_t v81;
  uint8_t *v82;
  uint8_t *v83;
  void (*v84)(char *, uint64_t);
  char *v85;
  NSObject *v86;
  os_log_type_t v87;
  uint8_t *v88;
  uint8_t *v89;
  uint8_t *v90;
  _QWORD *v91;
  uint8_t *v93;
  uint64_t v94;
  void (*v95)(char *, uint64_t, uint64_t);
  char *v96;
  void (*v97)(char *, char *, uint64_t);
  char *v98;
  char *v99;
  char *v100;
  char *v101;
  char *v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  _QWORD *v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  char *v114;
  void *v115;
  uint64_t v116;
  objc_super v117;
  uint64_t v118[4];

  v115 = a3;
  v102 = a2;
  v107 = a1;
  v3 = sub_2133D452C();
  v4 = *(_QWORD **)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v101 = (char *)&v93 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v109 = (char *)&v93 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v113 = (char *)&v93 - v9;
  v10 = sub_2133D4598();
  v105 = *(_QWORD *)(v10 - 8);
  v106 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v100 = (char *)&v93 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v99 = (char *)&v93 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v114 = (char *)&v93 - v15;
  v16 = sub_2133D4538();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v93 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_2133D4574();
  v111 = *(_QWORD *)(v20 - 8);
  v112 = v20;
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v93 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A980);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v104 = (char *)&v93 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v103 = (char *)&v93 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v93 - v29;
  v31 = MEMORY[0x24BDAC7A8](v28);
  v33 = (char *)&v93 - v32;
  v34 = MEMORY[0x24BDAC7A8](v31);
  v36 = (char *)&v93 - v35;
  MEMORY[0x24BDAC7A8](v34);
  v38 = (char *)&v93 - v37;
  v108 = v4;
  v39 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v4[7];
  v39((char *)&v93 - v37, 1, 1, v3);
  v39(v36, 1, 1, v3);
  (*(void (**)(char *, _QWORD, uint64_t))(v17 + 104))(v19, *MEMORY[0x24BDCEF70], v16);
  v110 = v22;
  sub_2133D4544();
  v40 = v115;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  if (objc_msgSend(v40, sel_isEnabled))
  {
    v98 = v30;
    v103 = v38;
    v104 = v33;
    v96 = v36;
    v41 = sub_2133CC9C0();
    v42 = v105;
    v43 = *(void (**)(char *, uint64_t, uint64_t))(v105 + 16);
    v94 = v41;
    v44 = v106;
    v95 = v43;
    ((void (*)(char *))v43)(v114);
    v46 = v107;
    v45 = v108;
    v97 = (void (*)(char *, char *, uint64_t))v108[2];
    v97(v113, v107, v3);
    v47 = sub_2133D4580();
    v48 = sub_2133D45D4();
    v49 = v3;
    if (os_log_type_enabled(v47, v48))
    {
      v50 = v40;
      v51 = (uint8_t *)swift_slowAlloc();
      v52 = swift_slowAlloc();
      v118[0] = v52;
      *(_DWORD *)v51 = 136315138;
      v93 = v51 + 4;
      sub_2133CF7D0(&qword_254B9A9B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
      v53 = v113;
      v54 = sub_2133D4658();
      v116 = sub_2133CD614(v54, v55, v118);
      v45 = v108;
      sub_2133D45EC();
      swift_bridgeObjectRelease();
      v113 = (char *)v45[1];
      ((void (*)(char *, uint64_t))v113)(v53, v49);
      _os_log_impl(&dword_2132F7000, v47, v48, "Obtaining the schedule for %s", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B2758](v52, -1, -1);
      v40 = v50;
      v44 = v106;
      v56 = v107;
      MEMORY[0x2199B2758](v51, -1, -1);
    }
    else
    {
      v56 = v46;
      v68 = v113;
      v113 = (char *)v45[1];
      ((void (*)(char *, uint64_t))v113)(v68, v3);
    }

    v69 = *(void (**)(char *, uint64_t))(v42 + 8);
    v69(v114, v44);
    v70 = v109;
    v71 = (uint64_t)v104;
    v72 = (uint64_t)v98;
    v97(v109, v56, v49);
    sub_2133CDEBC(v56, v40);
    v64 = v73;
    (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v73) + 0x60))();
    sub_2133CCA78(v71, v72);
    v74 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v45[6])(v72, 1, v49);
    v114 = (char *)v69;
    if (v74 == 1)
    {
      v108 = v64;
      v75 = v44;
      sub_2133CD1A0(v72);
    }
    else
    {
      v76 = (void (*)(char *, uint64_t, uint64_t))v45[4];
      v77 = v101;
      v76(v101, v72, v49);
      if ((sub_2133D4514() & 1) != 0)
      {
        v78 = v99;
        v95(v99, v94, v44);
        v79 = sub_2133D4580();
        v80 = sub_2133D45D4();
        if (os_log_type_enabled(v79, v80))
        {
          v81 = v49;
          v82 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v82 = 0;
          _os_log_impl(&dword_2132F7000, v79, v80, "Gettng the bedtime for currentDate", v82, 2u);
          v83 = v82;
          v49 = v81;
          MEMORY[0x2199B2758](v83, -1, -1);
        }

        ((void (*)(char *, uint64_t))v114)(v78, v44);
        v84 = (void (*)(char *, uint64_t))v113;
        ((void (*)(char *, uint64_t))v113)(v101, v49);
        sub_2133CD1A0(v71);
        v84(v70, v49);
        v66 = v111;
        v65 = v112;
        v67 = v110;
        v36 = v96;
        goto LABEL_16;
      }
      v108 = v64;
      v75 = v44;
      ((void (*)(char *, uint64_t))v113)(v77, v49);
    }
    v66 = v111;
    v65 = v112;
    v67 = v110;
    v36 = v96;
    v85 = v100;
    v95(v100, v94, v75);
    v86 = sub_2133D4580();
    v87 = sub_2133D45D4();
    if (os_log_type_enabled(v86, v87))
    {
      v88 = (uint8_t *)swift_slowAlloc();
      v112 = v49;
      v89 = v88;
      *(_WORD *)v88 = 0;
      _os_log_impl(&dword_2132F7000, v86, v87, "Now is after currentDate's wakeupTime. gettng the bedtime for nextOccurrence", v88, 2u);
      v90 = v89;
      v49 = v112;
      v40 = v115;
      MEMORY[0x2199B2758](v90, -1, -1);
    }

    ((void (*)(char *, uint64_t))v114)(v85, v75);
    sub_2133CDEBC(v102, v40);
    v64 = v91;

    sub_2133CD1A0((uint64_t)v104);
    ((void (*)(char *, uint64_t))v113)(v109, v49);
LABEL_16:
    v38 = v103;
    goto LABEL_17;
  }
  v57 = (uint64_t)v103;
  sub_2133CCA78((uint64_t)v38, (uint64_t)v103);
  v58 = (uint64_t)v104;
  sub_2133CCA78((uint64_t)v36, (uint64_t)v104);
  v59 = (objc_class *)type metadata accessor for RESleepScheduleEntry();
  v60 = (char *)objc_allocWithZone(v59);
  v61 = (uint64_t)&v60[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime];
  v39(&v60[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime], 1, 1, v3);
  v62 = (uint64_t)&v60[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime];
  v39(&v60[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime], 1, 1, v3);
  swift_beginAccess();
  v63 = v60;
  sub_2133CD158(v57, v61);
  swift_endAccess();
  swift_beginAccess();
  sub_2133CD158(v58, v62);
  swift_endAccess();

  v117.receiver = v63;
  v117.super_class = v59;
  v64 = objc_msgSendSuper2(&v117, sel_init);
  sub_2133CD1A0(v58);
  sub_2133CD1A0(v57);
  v66 = v111;
  v65 = v112;
  v67 = v110;
LABEL_17:
  (*(void (**)(char *, uint64_t))(v66 + 8))(v67, v65);
  sub_2133CD1A0((uint64_t)v36);
  sub_2133CD1A0((uint64_t)v38);
  return v64;
}

uint64_t sub_2133CF570()
{
  return type metadata accessor for RESleepScheduleEntry();
}

void sub_2133CF578()
{
  unint64_t v0;

  sub_2133CF698();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for RESleepScheduleEntry()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RESleepScheduleEntry.wakeupTime.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of RESleepScheduleEntry.wakeupTime.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of RESleepScheduleEntry.wakeupTime.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of RESleepScheduleEntry.bedtime.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of RESleepScheduleEntry.bedtime.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of RESleepScheduleEntry.bedtime.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

void sub_2133CF698()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254B9A9B0)
  {
    sub_2133D452C();
    v0 = sub_2133D45E0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254B9A9B0);
  }
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2133CF70C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2133CF74C()
{
  unint64_t result;

  result = qword_254B9A9D8;
  if (!qword_254B9A9D8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254B9A9D8);
  }
  return result;
}

uint64_t sub_2133CF788(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2133CF7D0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199B2704](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __getNLTaggerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[REFeatureMap(REFeatureProvider) featureValueForName:].cold.1(v0);
}

uint64_t __getISImageDescriptorClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getNanoResourceGrabberClass_block_invoke_cold_1();
}

uint64_t __getNanoResourceGrabberClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getISIconClass_block_invoke_cold_1(v0);
}

uint64_t __getISIconClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __43__REUpNextSiriServer__accessRemoteClients___block_invoke_2_cold_1(v0);
}

uint64_t __getHKUnitClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke_cold_1(v0);
}

uint64_t __getHKObserverQueryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKSampleTypeClass_block_invoke_cold_1(v0);
}

uint64_t __getHKSampleTypeClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKQueryClass_block_invoke_cold_1(v0);
}

uint64_t __getHKQueryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKSourceClass_block_invoke_cold_1(v0);
}

uint64_t __getHKSourceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKSampleQueryClass_block_invoke_cold_1(v0);
}

uint64_t __getHKSampleQueryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKObjectTypeClass_block_invoke_cold_1(v0);
}

uint64_t __getHKObjectTypeClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKHealthStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getHKHealthStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[REDailyRoutinePredictor _queue_didBeginMorningRoutine].cold.1(v0);
}

uint64_t __getBMBehaviorRetrieverClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getBMItemTypeClass_block_invoke_cold_1(v0);
}

uint64_t __getBMItemTypeClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getBMItemClass_block_invoke_cold_1(v0);
}

uint64_t __getBMItemClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getBMRetrievalFilterClass_block_invoke_cold_1(v0);
}

uint64_t __getBMRetrievalFilterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getBMBehaviorStorageClass_block_invoke_cold_1(v0);
}

void __getBMBehaviorStorageClass_block_invoke_cold_1()
{
  abort_report_np();
  -[REMLModelManager _loadModelAtPath:mlFeatures:checkModelVersion:].cold.1();
}

void REStoreLogFileForTask_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2132F7000, log, OS_LOG_TYPE_ERROR, "Unable to store logs for task %@ %@", (uint8_t *)&v3, 0x16u);
}

id __getUIWindowClass_block_invoke_cold_1()
{
  REImage *v0;
  SEL v1;
  _NSZone *v2;

  v0 = (REImage *)abort_report_np();
  return -[REImage copyWithZone:](v0, v1, v2);
}

uint64_t __getCSLPRFDefaultAppDataProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getMPRequestResponseControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getMPRequestResponseControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getMPAVRoutingControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getMPAVRoutingControllerClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getMPCPlayerRequestClass_block_invoke_cold_1();
}

uint64_t __getMPCPlayerRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getMPCPlayerPathClass_block_invoke_cold_1(v0);
}

uint64_t __getMPCPlayerPathClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return __REProcessIsRelevanced_block_invoke_cold_1(v0);
}

void RERaiseInternalException_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 136315138;
  v5 = objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  OUTLINED_FUNCTION_0_3(&dword_2132F7000, a2, v3, "Internal exception: %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void _REGenerateSimulatedCrash_cold_2(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 136315138;
  v5 = objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  OUTLINED_FUNCTION_0_3(&dword_2132F7000, a2, v3, "Simulated exception: %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

uint64_t __getCLKTextProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCLKDateTextProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getCLKDateTextProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCLKRelativeDateTextProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getCLKRelativeDateTextProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCLKSimpleTextProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getCLKSimpleTextProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCLKTimeIntervalTextProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getCLKTimeIntervalTextProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCLKTimeTextProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getCLKTimeTextProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[RELiveElementCoordinator _queue_addElement:toSection:].cold.1(v0);
}

uint64_t __getBluetoothManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __59__REElement_initWithDictionary_relevanceProviderGenerator___block_invoke_cold_1(v0);
}

uint64_t __getCMMotionActivityManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[REHTTPServer invalidated].cold.1(v0);
}

uint64_t __getRTRoutineManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCLKImageProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getCLKImageProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[REPortraitPredictor update].cold.1(v0);
}

uint64_t __getPPNamedEntityStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPPNamedEntityQueryClass_block_invoke_cold_1(v0);
}

uint64_t __getPPNamedEntityQueryClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[REBayesianMLModel _trainWithFeatures:positiveEvent:].cold.1(v0);
}

uint64_t sub_2133D4490()
{
  return MEMORY[0x24BDCBCC0]();
}

uint64_t sub_2133D449C()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_2133D44A8()
{
  return MEMORY[0x24BDCBCE0]();
}

uint64_t sub_2133D44B4()
{
  return MEMORY[0x24BDCBD00]();
}

uint64_t sub_2133D44C0()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_2133D44CC()
{
  return MEMORY[0x24BDCBD10]();
}

uint64_t sub_2133D44D8()
{
  return MEMORY[0x24BDCBD60]();
}

uint64_t sub_2133D44E4()
{
  return MEMORY[0x24BDCBD68]();
}

uint64_t sub_2133D44F0()
{
  return MEMORY[0x24BDCBDB8]();
}

uint64_t sub_2133D44FC()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_2133D4508()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2133D4514()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_2133D4520()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2133D452C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2133D4538()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_2133D4544()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_2133D4550()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_2133D455C()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_2133D4568()
{
  return MEMORY[0x24BDCF2D0]();
}

uint64_t sub_2133D4574()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_2133D4580()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2133D458C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2133D4598()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2133D45A4()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2133D45B0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2133D45BC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2133D45C8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2133D45D4()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2133D45E0()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2133D45EC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2133D45F8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2133D4604()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2133D4610()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2133D461C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2133D4628()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2133D4634()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2133D4640()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2133D464C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2133D4658()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x24BDBB7D8](theArray, range.location, range.length, applier, context);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB870](theArray, idx, value);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x24BDBB878](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

void CFBagAddValue(CFMutableBagRef theBag, const void *value)
{
  MEMORY[0x24BDBB938](theBag, value);
}

void CFBagApplyFunction(CFBagRef theBag, CFBagApplierFunction applier, void *context)
{
  MEMORY[0x24BDBB940](theBag, applier, context);
}

Boolean CFBagContainsValue(CFBagRef theBag, const void *value)
{
  return MEMORY[0x24BDBB948](theBag, value);
}

CFMutableBagRef CFBagCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFBagCallBacks *callBacks)
{
  return (CFMutableBagRef)MEMORY[0x24BDBB958](allocator, capacity, callBacks);
}

CFMutableBagRef CFBagCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFBagRef theBag)
{
  return (CFMutableBagRef)MEMORY[0x24BDBB960](allocator, capacity, theBag);
}

CFIndex CFBagGetCount(CFBagRef theBag)
{
  return MEMORY[0x24BDBB968](theBag);
}

CFIndex CFBagGetCountOfValue(CFBagRef theBag, const void *value)
{
  return MEMORY[0x24BDBB970](theBag, value);
}

void CFBagRemoveValue(CFMutableBagRef theBag, const void *value)
{
  MEMORY[0x24BDBB988](theBag, value);
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
  MEMORY[0x24BDBB990](heap, value);
}

void CFBinaryHeapApplyFunction(CFBinaryHeapRef heap, CFBinaryHeapApplierFunction applier, void *context)
{
  MEMORY[0x24BDBB998](heap, applier, context);
}

Boolean CFBinaryHeapContainsValue(CFBinaryHeapRef heap, const void *value)
{
  return MEMORY[0x24BDBB9A0](heap, value);
}

CFBinaryHeapRef CFBinaryHeapCreate(CFAllocatorRef allocator, CFIndex capacity, const CFBinaryHeapCallBacks *callBacks, const CFBinaryHeapCompareContext *compareContext)
{
  return (CFBinaryHeapRef)MEMORY[0x24BDBB9A8](allocator, capacity, callBacks, compareContext);
}

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap)
{
  return MEMORY[0x24BDBB9B0](heap);
}

const void *__cdecl CFBinaryHeapGetMinimum(CFBinaryHeapRef heap)
{
  return (const void *)MEMORY[0x24BDBB9B8](heap);
}

void CFBinaryHeapRemoveAllValues(CFBinaryHeapRef heap)
{
  MEMORY[0x24BDBB9C8](heap);
}

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap)
{
  MEMORY[0x24BDBB9D0](heap);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x24BDBBC58](cf);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return (CFDictionaryRef)MEMORY[0x24BDB72A0](message);
}

CFDataRef CFHTTPMessageCopyBody(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x24BDB72A8](message);
}

CFStringRef CFHTTPMessageCopyHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField)
{
  return (CFStringRef)MEMORY[0x24BDB72B0](message, headerField);
}

void CFHTTPMessageSetBody(CFHTTPMessageRef message, CFDataRef bodyData)
{
  MEMORY[0x24BDB7308](message, bodyData);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
  MEMORY[0x24BDB7310](message, headerField, value);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x24BDBBF10](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE5E8](image);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE618](source, decode, shouldInterpolate, *(_QWORD *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

uint64_t HKSPDayForNSGregorianCalendarDay()
{
  return MEMORY[0x24BEA9398]();
}

uint64_t HKSPWeekdaysFromDay()
{
  return MEMORY[0x24BEA97C8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x24BDBCAA0](typePtr, sizep, alignp);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x24BDD11E8]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x24BDD1250](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFHTTPServerConnectionInvalidate()
{
  return MEMORY[0x24BDB74D8]();
}

uint64_t _CFHTTPServerConnectionIsValid()
{
  return MEMORY[0x24BDB74E0]();
}

uint64_t _CFHTTPServerConnectionSetClient()
{
  return MEMORY[0x24BDB74E8]();
}

uint64_t _CFHTTPServerConnectionSetDispatchQueue()
{
  return MEMORY[0x24BDB74F0]();
}

uint64_t _CFHTTPServerCopyProperty()
{
  return MEMORY[0x24BDB74F8]();
}

uint64_t _CFHTTPServerCreateService()
{
  return MEMORY[0x24BDB7508]();
}

uint64_t _CFHTTPServerInvalidate()
{
  return MEMORY[0x24BDB7510]();
}

uint64_t _CFHTTPServerIsValid()
{
  return MEMORY[0x24BDB7518]();
}

uint64_t _CFHTTPServerRequestCopyBodyStream()
{
  return MEMORY[0x24BDB7520]();
}

uint64_t _CFHTTPServerRequestCopyProperty()
{
  return MEMORY[0x24BDB7528]();
}

uint64_t _CFHTTPServerRequestCreateResponseMessage()
{
  return MEMORY[0x24BDB7530]();
}

uint64_t _CFHTTPServerResponseCreateWithData()
{
  return MEMORY[0x24BDB7540]();
}

uint64_t _CFHTTPServerResponseEnqueue()
{
  return MEMORY[0x24BDB7548]();
}

uint64_t _CFHTTPServerResponseSetClient()
{
  return MEMORY[0x24BDB7550]();
}

uint64_t _CFHTTPServerSetDispatchQueue()
{
  return MEMORY[0x24BDB7558]();
}

uint64_t _LSCopyAdvertisementStringForTeamIdentifierAndActivityType()
{
  return MEMORY[0x24BDC1600]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string::reference std::string::at(std::string *this, std::string::size_type __n)
{
  return (std::string::reference)MEMORY[0x24BEDAC10](this, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x24BEDADE0]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x24BEDAE18]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF08]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF30]();
}

{
  return MEMORY[0x24BEDAF40]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF60]();
}

{
  return MEMORY[0x24BEDAF70]();
}

{
  return MEMORY[0x24BEDAF80]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

uint64_t std::__sort<std::__less<unsigned short,unsigned short> &,unsigned short *>()
{
  return MEMORY[0x24BEDB3C8]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x24BEDB5F8](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24CF8A028(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CF8A030(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x24BDACB10](dso, description, *(_QWORD *)&flags, activity_block);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

double atof(const char *a1)
{
  double result;

  MEMORY[0x24BDAD250](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x24BEDCE40](cls, name, imp, types);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x24BEDCE60](cls, protocol);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x24BEDCE78](cls, outCount);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x24BEDCE80](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCE90](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCEA0](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x24BEDCEB8](cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x24BEDCEE8](cls, name, imp, types);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD20](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x24BDADDB0](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x24BDAE008](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x24BEDCF30](m);
}

unsigned int method_getNumberOfArguments(Method m)
{
  return MEMORY[0x24BEDCF40](m);
}

void method_getReturnType(Method m, char *dst, size_t dst_len)
{
  MEMORY[0x24BEDCF48](m, dst, dst_len);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x24BEDCF50](m);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x24BDAF150](*(_QWORD *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x24BEDD488](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x24BDAF490]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x24BDAF4A8]();
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x24BEDD4B8](property);
}

BOOL protocol_conformsToProtocol(Protocol *proto, Protocol *other)
{
  return MEMORY[0x24BEDD4C8](proto, other);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x24BEDD4D0](p, isRequiredMethod, isInstanceMethod, outCount);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x24BEDD4D8](proto, outCount);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x24BEDD4E0](proto, outCount);
}

BOOL protocol_isEqual(Protocol *proto, Protocol *other)
{
  return MEMORY[0x24BEDD4F8](proto, other);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF930](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x24BDAF938](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF940](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF958](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF960](a1);
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

uint64_t sandbox_check()
{
  return MEMORY[0x24BDAFBD8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0040](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

void vDSP_sveD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32D8](__A, __I, __C, __N);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x24BDB05E0](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x24BDB0610](activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x24BDB0620](identifier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

