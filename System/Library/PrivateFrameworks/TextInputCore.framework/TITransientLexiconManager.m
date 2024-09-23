@implementation TITransientLexiconManager

- (_LXLexicon)filteredLexicon:(_LXLexicon *)a3 fromLexiconCache:(void *)a4 forLocale:(const char *)a5
{
  _LXLexicon *v6;
  _QWORD *v8;
  NSObject *v9;
  const char *v10;
  _LXLexicon *v12;
  unint64_t v13;
  KB::String *v14;
  unsigned int v15;
  unint64_t v16;
  unint64_t v17;
  uint8x8_t v18;
  unint64_t v19;
  uint64_t **v20;
  uint64_t **v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  float v25;
  float v26;
  _BOOL8 v27;
  unint64_t v28;
  unint64_t v29;
  int8x8_t prime;
  void *v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  uint8x8_t v36;
  unint64_t v37;
  uint8x8_t v38;
  uint64_t v39;
  _QWORD *v40;
  unint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  unint64_t v44;
  BOOL v45;
  _QWORD *v46;
  int v47;
  _BYTE v48[12];
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      return 0;
    v47 = 136315138;
    *(_QWORD *)v48 = "-[TITransientLexiconManager filteredLexicon:fromLexiconCache:forLocale:]";
    v9 = MEMORY[0x1E0C81028];
    v10 = "%s  Lexicon being asked to filter is null - will return a null reference in return";
LABEL_65:
    _os_log_debug_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v47, 0xCu);
    return 0;
  }
  if (!a5)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      return 0;
    v47 = 136315138;
    *(_QWORD *)v48 = "-[TITransientLexiconManager filteredLexicon:fromLexiconCache:forLocale:]";
    v9 = MEMORY[0x1E0C81028];
    v10 = "%s  localeId being asked to filter with is null - will return a null reference in return";
    goto LABEL_65;
  }
  v6 = a3;
  KB::String::String((KB::String *)&v51, a5);
  if (!std::__hash_table<std::__hash_value_type<KB::String,unsigned long>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,unsigned long>>>::find<KB::String>(a4, &v51))
  {
    v12 = -[TITransientLexiconManager filterLexicon:againstLocale:](self, "filterLexicon:againstLocale:", v6, &v51);
    if (!v12)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v47 = 136315138;
        *(_QWORD *)v48 = "-[TITransientLexiconManager filteredLexicon:fromLexiconCache:forLocale:]";
        _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Failed to filter the named entity lexicon; returning an unfiltered one",
          (uint8_t *)&v47,
          0xCu);
      }
      goto LABEL_6;
    }
    v13 = (unint64_t)v12;
    KB::String::String((KB::String *)&v47, (const KB::String *)&v51);
    v50 = v13;
    if (*(_QWORD *)&v48[4])
      v14 = *(KB::String **)&v48[4];
    else
      v14 = (KB::String *)&v49;
    v15 = KB::String::hash(v14, (const char *)(unsigned __int16)v47);
    v16 = v15;
    v17 = *((_QWORD *)a4 + 1);
    if (v17)
    {
      v18 = (uint8x8_t)vcnt_s8((int8x8_t)v17);
      v18.i16[0] = vaddlv_u8(v18);
      v19 = v18.u32[0];
      if (v18.u32[0] > 1uLL)
      {
        v13 = v15;
        if (v17 <= v15)
          v13 = v15 % v17;
      }
      else
      {
        v13 = ((_DWORD)v17 - 1) & v15;
      }
      v20 = *(uint64_t ***)(*(_QWORD *)a4 + 8 * v13);
      if (v20)
      {
        v21 = (uint64_t **)*v20;
        if (*v20)
        {
          do
          {
            v22 = (unint64_t)v21[1];
            if (v22 == v16)
            {
              if (v21 + 2 == (uint64_t **)&v47
                || KB::String::equal((KB::String *)(v21 + 2), (const KB::String *)&v47, 1))
              {
                goto LABEL_96;
              }
            }
            else
            {
              if (v19 > 1)
              {
                if (v22 >= v17)
                  v22 %= v17;
              }
              else
              {
                v22 &= v17 - 1;
              }
              if (v22 != v13)
                break;
            }
            v21 = (uint64_t **)*v21;
          }
          while (v21);
        }
      }
    }
    v23 = (char *)a4 + 16;
    v24 = operator new(0x38uLL);
    *v24 = 0;
    v24[1] = v16;
    KB::String::String((KB::String *)(v24 + 2), (const KB::String *)&v47);
    v24[6] = v50;
    v25 = (float)(unint64_t)(*((_QWORD *)a4 + 3) + 1);
    v26 = *((float *)a4 + 8);
    if (v17 && (float)(v26 * (float)v17) >= v25)
    {
LABEL_86:
      v42 = *(_QWORD **)a4;
      v43 = *(_QWORD **)(*(_QWORD *)a4 + 8 * v13);
      if (v43)
      {
        *v24 = *v43;
      }
      else
      {
        *v24 = *v23;
        *v23 = v24;
        v42[v13] = v23;
        if (!*v24)
          goto LABEL_95;
        v44 = *(_QWORD *)(*v24 + 8);
        if ((v17 & (v17 - 1)) != 0)
        {
          if (v44 >= v17)
            v44 %= v17;
        }
        else
        {
          v44 &= v17 - 1;
        }
        v43 = (_QWORD *)(*(_QWORD *)a4 + 8 * v44);
      }
      *v43 = v24;
LABEL_95:
      ++*((_QWORD *)a4 + 3);
LABEL_96:
      if (*(_QWORD *)&v48[4])
        v45 = v48[2] == 1;
      else
        v45 = 0;
      if (v45)
        free(*(void **)&v48[4]);
      goto LABEL_4;
    }
    v27 = 1;
    if (v17 >= 3)
      v27 = (v17 & (v17 - 1)) != 0;
    v28 = v27 | (2 * v17);
    v29 = vcvtps_u32_f32(v25 / v26);
    if (v28 <= v29)
      prime = (int8x8_t)v29;
    else
      prime = (int8x8_t)v28;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v17 = *((_QWORD *)a4 + 1);
    if (*(_QWORD *)&prime > v17)
      goto LABEL_50;
    if (*(_QWORD *)&prime < v17)
    {
      v37 = vcvtps_u32_f32((float)*((unint64_t *)a4 + 3) / *((float *)a4 + 8));
      if (v17 < 3 || (v38 = (uint8x8_t)vcnt_s8((int8x8_t)v17), v38.i16[0] = vaddlv_u8(v38), v38.u32[0] > 1uLL))
      {
        v37 = std::__next_prime(v37);
      }
      else
      {
        v39 = 1 << -(char)__clz(v37 - 1);
        if (v37 >= 2)
          v37 = v39;
      }
      if (*(_QWORD *)&prime <= v37)
        prime = (int8x8_t)v37;
      if (*(_QWORD *)&prime >= v17)
      {
        v17 = *((_QWORD *)a4 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_50:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v31 = operator new(8 * *(_QWORD *)&prime);
          v32 = *(_QWORD **)a4;
          *(_QWORD *)a4 = v31;
          if (v32)
            operator delete(v32);
          v33 = 0;
          *((int8x8_t *)a4 + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a4 + 8 * v33++) = 0;
          while (*(_QWORD *)&prime != v33);
          v34 = (_QWORD *)*v23;
          if (*v23)
          {
            v35 = v34[1];
            v36 = (uint8x8_t)vcnt_s8(prime);
            v36.i16[0] = vaddlv_u8(v36);
            if (v36.u32[0] > 1uLL)
            {
              if (v35 >= *(_QWORD *)&prime)
                v35 %= *(_QWORD *)&prime;
            }
            else
            {
              v35 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a4 + 8 * v35) = v23;
            v40 = (_QWORD *)*v34;
            if (*v34)
            {
              do
              {
                v41 = v40[1];
                if (v36.u32[0] > 1uLL)
                {
                  if (v41 >= *(_QWORD *)&prime)
                    v41 %= *(_QWORD *)&prime;
                }
                else
                {
                  v41 &= *(_QWORD *)&prime - 1;
                }
                if (v41 != v35)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a4 + 8 * v41))
                  {
                    *(_QWORD *)(*(_QWORD *)a4 + 8 * v41) = v34;
                    goto LABEL_77;
                  }
                  *v34 = *v40;
                  *v40 = **(_QWORD **)(*(_QWORD *)a4 + 8 * v41);
                  **(_QWORD **)(*(_QWORD *)a4 + 8 * v41) = v40;
                  v40 = v34;
                }
                v41 = v35;
LABEL_77:
                v34 = v40;
                v40 = (_QWORD *)*v40;
                v35 = v41;
              }
              while (v40);
            }
          }
          v17 = (unint64_t)prime;
          goto LABEL_81;
        }
        v46 = *(_QWORD **)a4;
        *(_QWORD *)a4 = 0;
        if (v46)
          operator delete(v46);
        v17 = 0;
        *((_QWORD *)a4 + 1) = 0;
      }
    }
LABEL_81:
    if ((v17 & (v17 - 1)) != 0)
    {
      if (v17 <= v16)
        v13 = v16 % v17;
      else
        v13 = v16;
    }
    else
    {
      v13 = ((_DWORD)v17 - 1) & v16;
    }
    goto LABEL_86;
  }
LABEL_4:
  v8 = std::__hash_table<std::__hash_value_type<KB::String,unsigned long>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,unsigned long>>>::find<KB::String>(a4, &v51);
  if (!v8)
    abort();
  v6 = (_LXLexicon *)v8[6];
LABEL_6:
  if (v52 && BYTE6(v51) == 1)
    free(v52);
  return v6;
}

- (_LXLexicon)addressBookLexiconForLocale:(const char *)a3
{
  const char *v4;
  const char *v5;
  void *v6;
  KB *v7;
  void *v8;
  unint64_t v9;
  char *addressBookLexicons;
  unint64_t *v11;
  unint64_t v12;
  KB::String *v13;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;
  uint8x8_t v17;
  unint64_t v18;
  uint64_t **v19;
  uint64_t **v20;
  unint64_t v21;
  __n128 **v22;
  __n128 *v23;
  float v24;
  float v25;
  _BOOL8 v26;
  unint64_t v27;
  unint64_t v28;
  int8x8_t prime;
  void *v30;
  void *v31;
  uint64_t v32;
  __n128 *v33;
  unint64_t v34;
  uint8x8_t v35;
  unint64_t v36;
  uint8x8_t v37;
  uint64_t v38;
  __n128 *v39;
  unint64_t v40;
  int8x8_t v41;
  __n128 **v42;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  BOOL v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  BOOL v51;
  _QWORD *v52;
  std::__shared_weak_count *v53;
  _LXLexicon *v54;
  unint64_t *v55;
  unint64_t v56;
  BOOL v57;
  void *v59;
  __n128 v60;
  char *v61;
  void *v62;
  uint64_t v63;
  __n128 v64;
  _BYTE v65[8];
  void *v66;
  _BYTE v67[8];
  void *v68;
  _BYTE v69[8];
  void *v70;
  _BYTE v71[8];
  void *v72;
  _BYTE v73[8];
  void *v74;
  uint64_t v75;
  char *v76;
  _QWORD v77[4];

  v77[2] = *MEMORY[0x1E0C80C00];
  KB::String::String((KB::String *)&v75, a3);
  if (std::__hash_table<std::__hash_value_type<KB::String,unsigned long>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,unsigned long>>>::find<KB::String>((_QWORD *)self->_addressBookLexicons, &v75))
  {
    goto LABEL_122;
  }
  v4 = v76;
  if (!v76)
    v4 = (const char *)v77;
  if ((_WORD)v75)
    v5 = v4;
  else
    v5 = "";
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardStaticUnigramsFile(v6);
  v7 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v7, (uint64_t)v73);

  +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardDeltaLexiconPathForInputMode(v8);
  v9 = objc_claimAutoreleasedReturnValue();
  KB::utf8_string((KB *)v9, (uint64_t)v71);

  KB::String::String((KB::String *)v69, (const KB::String *)&v75);
  KB::String::String((KB::String *)v67, (const KB::String *)v73);
  KB::String::String((KB::String *)v65, (const KB::String *)v71);
  KB::AddressBookTrieLoader::create((const KB::String *)v69, (const KB::String *)v67, (const KB::String *)v65, &v60);
  if (v66 && v65[6] == 1)
    free(v66);
  if (v68 && v67[6] == 1)
    free(v68);
  if (v70 && v69[6] == 1)
    free(v70);
  addressBookLexicons = (char *)self->_addressBookLexicons;
  KB::String::String((KB::String *)&v61, (const KB::String *)&v75);
  v64 = v60;
  if (v60.n128_u64[1])
  {
    v11 = (unint64_t *)(v60.n128_u64[1] + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  if (v62)
    v13 = (KB::String *)v62;
  else
    v13 = (KB::String *)&v63;
  v14 = KB::String::hash(v13, (const char *)(unsigned __int16)v61);
  v15 = v14;
  v16 = *((_QWORD *)addressBookLexicons + 1);
  if (v16)
  {
    v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
    v17.i16[0] = vaddlv_u8(v17);
    v18 = v17.u32[0];
    if (v17.u32[0] > 1uLL)
    {
      v9 = v14;
      if (v16 <= v14)
        v9 = v14 % v16;
    }
    else
    {
      v9 = ((_DWORD)v16 - 1) & v14;
    }
    v19 = *(uint64_t ***)(*(_QWORD *)addressBookLexicons + 8 * v9);
    if (v19)
    {
      v20 = (uint64_t **)*v19;
      if (*v19)
      {
        do
        {
          v21 = (unint64_t)v20[1];
          if (v21 == v15)
          {
            if (v20 + 2 == (uint64_t **)&v61 || KB::String::equal((KB::String *)(v20 + 2), (const KB::String *)&v61, 1))
              goto LABEL_96;
          }
          else
          {
            if (v18 > 1)
            {
              if (v21 >= v16)
                v21 %= v16;
            }
            else
            {
              v21 &= v16 - 1;
            }
            if (v21 != v9)
              break;
          }
          v20 = (uint64_t **)*v20;
        }
        while (v20);
      }
    }
  }
  v22 = (__n128 **)(addressBookLexicons + 16);
  v23 = (__n128 *)operator new(0x40uLL);
  v23->n128_u64[0] = 0;
  v23->n128_u64[1] = v15;
  KB::String::String((KB::String *)&v23[1], (const KB::String *)&v61);
  v23[3] = v64;
  v64 = 0uLL;
  v24 = (float)(unint64_t)(*((_QWORD *)addressBookLexicons + 3) + 1);
  v25 = *((float *)addressBookLexicons + 8);
  if (!v16 || (float)(v25 * (float)v16) < v24)
  {
    v26 = 1;
    if (v16 >= 3)
      v26 = (v16 & (v16 - 1)) != 0;
    v27 = v26 | (2 * v16);
    v28 = vcvtps_u32_f32(v24 / v25);
    if (v27 <= v28)
      prime = (int8x8_t)v28;
    else
      prime = (int8x8_t)v27;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v16 = *((_QWORD *)addressBookLexicons + 1);
    if (*(_QWORD *)&prime > v16)
      goto LABEL_52;
    if (*(_QWORD *)&prime < v16)
    {
      v36 = vcvtps_u32_f32((float)*((unint64_t *)addressBookLexicons + 3) / *((float *)addressBookLexicons + 8));
      if (v16 < 3 || (v37 = (uint8x8_t)vcnt_s8((int8x8_t)v16), v37.i16[0] = vaddlv_u8(v37), v37.u32[0] > 1uLL))
      {
        v36 = std::__next_prime(v36);
      }
      else
      {
        v38 = 1 << -(char)__clz(v36 - 1);
        if (v36 >= 2)
          v36 = v38;
      }
      if (*(_QWORD *)&prime <= v36)
        prime = (int8x8_t)v36;
      if (*(_QWORD *)&prime >= v16)
      {
        v16 = *((_QWORD *)addressBookLexicons + 1);
      }
      else
      {
        if (prime)
        {
LABEL_52:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v30 = operator new(8 * *(_QWORD *)&prime);
          v31 = *(void **)addressBookLexicons;
          *(_QWORD *)addressBookLexicons = v30;
          if (v31)
            operator delete(v31);
          v32 = 0;
          *((int8x8_t *)addressBookLexicons + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)addressBookLexicons + 8 * v32++) = 0;
          while (*(_QWORD *)&prime != v32);
          v33 = *v22;
          if (*v22)
          {
            v34 = v33->n128_u64[1];
            v35 = (uint8x8_t)vcnt_s8(prime);
            v35.i16[0] = vaddlv_u8(v35);
            if (v35.u32[0] > 1uLL)
            {
              if (v34 >= *(_QWORD *)&prime)
                v34 %= *(_QWORD *)&prime;
            }
            else
            {
              v34 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)addressBookLexicons + 8 * v34) = v22;
            v39 = (__n128 *)v33->n128_u64[0];
            if (v33->n128_u64[0])
            {
              do
              {
                v40 = v39->n128_u64[1];
                if (v35.u32[0] > 1uLL)
                {
                  if (v40 >= *(_QWORD *)&prime)
                    v40 %= *(_QWORD *)&prime;
                }
                else
                {
                  v40 &= *(_QWORD *)&prime - 1;
                }
                if (v40 != v34)
                {
                  if (!*(_QWORD *)(*(_QWORD *)addressBookLexicons + 8 * v40))
                  {
                    *(_QWORD *)(*(_QWORD *)addressBookLexicons + 8 * v40) = v33;
                    goto LABEL_77;
                  }
                  v33->n128_u64[0] = v39->n128_u64[0];
                  v39->n128_u64[0] = **(_QWORD **)(*(_QWORD *)addressBookLexicons + 8 * v40);
                  **(_QWORD **)(*(_QWORD *)addressBookLexicons + 8 * v40) = v39;
                  v39 = v33;
                }
                v40 = v34;
LABEL_77:
                v33 = v39;
                v39 = (__n128 *)v39->n128_u64[0];
                v34 = v40;
              }
              while (v39);
            }
          }
          v16 = (unint64_t)prime;
          goto LABEL_81;
        }
        v59 = *(void **)addressBookLexicons;
        *(_QWORD *)addressBookLexicons = 0;
        if (v59)
          operator delete(v59);
        v16 = 0;
        *((_QWORD *)addressBookLexicons + 1) = 0;
      }
    }
LABEL_81:
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v16 <= v15)
        v9 = v15 % v16;
      else
        v9 = v15;
    }
    else
    {
      v9 = ((_DWORD)v16 - 1) & v15;
    }
  }
  v41 = *(int8x8_t *)addressBookLexicons;
  v42 = *(__n128 ***)(*(_QWORD *)addressBookLexicons + 8 * v9);
  if (v42)
  {
    v23->n128_u64[0] = (unint64_t)*v42;
  }
  else
  {
    v23->n128_u64[0] = (unint64_t)*v22;
    *v22 = v23;
    *(_QWORD *)(*(_QWORD *)&v41 + 8 * v9) = v22;
    if (!v23->n128_u64[0])
      goto LABEL_95;
    v43 = *(_QWORD *)(v23->n128_u64[0] + 8);
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v43 >= v16)
        v43 %= v16;
    }
    else
    {
      v43 &= v16 - 1;
    }
    v42 = (__n128 **)(*(_QWORD *)addressBookLexicons + 8 * v43);
  }
  *v42 = v23;
LABEL_95:
  ++*((_QWORD *)addressBookLexicons + 3);
LABEL_96:
  v44 = (std::__shared_weak_count *)v64.n128_u64[1];
  if (v64.n128_u64[1])
  {
    v45 = (unint64_t *)(v64.n128_u64[1] + 8);
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  if (v62)
    v47 = BYTE6(v61) == 1;
  else
    v47 = 0;
  if (v47)
    free(v62);
  v48 = (std::__shared_weak_count *)v60.n128_u64[1];
  if (v60.n128_u64[1])
  {
    v49 = (unint64_t *)(v60.n128_u64[1] + 8);
    do
      v50 = __ldaxr(v49);
    while (__stlxr(v50 - 1, v49));
    if (!v50)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }
  if (v72)
    v51 = v71[6] == 1;
  else
    v51 = 0;
  if (v51)
    free(v72);
  if (v74 && v73[6] == 1)
    free(v74);

LABEL_122:
  v52 = std::__hash_table<std::__hash_value_type<KB::String,unsigned long>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,unsigned long>>>::find<KB::String>((_QWORD *)self->_addressBookLexicons, &v75);
  if (!v52)
    abort();
  (*(void (**)(char **__return_ptr))(*(_QWORD *)v52[6] + 16))(&v61);
  v53 = (std::__shared_weak_count *)v62;
  v54 = *(_LXLexicon **)v61;
  if (v62)
  {
    v55 = (unint64_t *)((char *)v62 + 8);
    do
      v56 = __ldaxr(v55);
    while (__stlxr(v56 - 1, v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }
  if (v76)
    v57 = BYTE6(v75) == 1;
  else
    v57 = 0;
  if (v57)
    free(v76);
  return v54;
}

- (_LXLexicon)namedEntityPhraseLexiconForLocale:(const char *)a3
{
  return -[TITransientLexiconManager filteredLexicon:fromLexiconCache:forLocale:](self, "filteredLexicon:fromLexiconCache:forLocale:", self->_namedEntityPhraseLexiconRef, self->_namedEntityPhraseLexicons, a3);
}

- (_LXLexicon)namedEntityLexiconForLocale:(const char *)a3
{
  return -[TITransientLexiconManager filteredLexicon:fromLexiconCache:forLocale:](self, "filteredLexicon:fromLexiconCache:forLocale:", self->_namedEntityLexiconRef, self->_namedEntityLexicons, a3);
}

- (TISupplementalLexiconController)supplementalLexicons
{
  return self->_supplementalLexicons;
}

+ (TITransientLexiconManager)sharedInstance
{
  if (__testingInstance)
    return (TITransientLexiconManager *)(id)__testingInstance;
  +[TITransientLexiconManager singletonInstance](TITransientLexiconManager, "singletonInstance");
  return (TITransientLexiconManager *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)singletonInstance
{
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    if (+[TITransientLexiconManager singletonInstance]::onceToken != -1)
      dispatch_once(&+[TITransientLexiconManager singletonInstance]::onceToken, &__block_literal_global_3895);
  }
  else if (+[TITransientLexiconManager singletonInstance]::onceToken != -1)
  {
    TIDispatchSync();

  }
  return (id)+[TITransientLexiconManager singletonInstance]::singletonInstance;
}

- (BOOL)isSupplementalLexiconSearchEnabled
{
  return self->_supplementalLexiconSearchEnabled;
}

- (void)setSupplementalLexiconSearchEnabled:(BOOL)a3
{
  self->_supplementalLexiconSearchEnabled = a3;
}

- (TITransientLexiconManager)init
{
  TITransientLexiconManager *v2;
  uint64_t v3;
  _ICLexiconManaging *inputContextLexiconManager;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  TITransientLexiconManager *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TITransientLexiconManager;
  v2 = -[TITransientLexiconManager init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D3AB78], "lexiconManager");
    v3 = objc_claimAutoreleasedReturnValue();
    inputContextLexiconManager = v2->_inputContextLexiconManager;
    v2->_inputContextLexiconManager = (_ICLexiconManaging *)v3;

    -[TITransientLexiconManager registerNamedEntitiesUpdateCallback](v2, "registerNamedEntitiesUpdateCallback");
    v2->_supplementalLexiconSearchEnabled = 1;
    -[TITransientLexiconManager loadLexicons](v2, "loadLexicons");
    v5 = operator new();
    *(_OWORD *)v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    *(_DWORD *)(v5 + 32) = 1065353216;
    v2->_namedEntityLexicons = (void *)v5;
    v6 = operator new();
    *(_OWORD *)v6 = 0u;
    *(_OWORD *)(v6 + 16) = 0u;
    *(_DWORD *)(v6 + 32) = 1065353216;
    v2->_namedEntityPhraseLexicons = (void *)v6;
    v7 = operator new();
    *(_OWORD *)v7 = 0u;
    *(_OWORD *)(v7 + 16) = 0u;
    *(_DWORD *)(v7 + 32) = 1065353216;
    v2->_addressBookLexicons = (void *)v7;
    v8 = operator new();
    *(_OWORD *)v8 = 0u;
    *(_OWORD *)(v8 + 16) = 0u;
    *(_DWORD *)(v8 + 32) = 1065353216;
    v2->_appNameLexicons = (void *)v8;
    v9 = v2;
  }

  return v2;
}

- (void)releaseCachedNamedEntityLexicons
{
  _QWORD *namedEntityLexicons;
  _QWORD *v4;
  const void *v5;
  uint64_t v6;
  _QWORD *namedEntityPhraseLexicons;
  _QWORD *v8;
  const void *v9;

  namedEntityLexicons = self->_namedEntityLexicons;
  if (namedEntityLexicons)
  {
    v4 = (_QWORD *)namedEntityLexicons[2];
    if (!v4)
      goto LABEL_7;
    do
    {
      v5 = (const void *)v4[6];
      if (v5)
        CFRelease(v5);
      v4 = (_QWORD *)*v4;
    }
    while (v4);
    namedEntityLexicons = self->_namedEntityLexicons;
    if (namedEntityLexicons)
    {
LABEL_7:
      v6 = std::__hash_table<std::__hash_value_type<KB::String,_LXLexicon const*>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,_LXLexicon const*>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,_LXLexicon const*>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,_LXLexicon const*>>>::~__hash_table((uint64_t)namedEntityLexicons);
      MEMORY[0x1DF0A2144](v6, 0x10A0C408EF24B1CLL);
    }
  }
  namedEntityPhraseLexicons = self->_namedEntityPhraseLexicons;
  if (namedEntityPhraseLexicons)
  {
    v8 = (_QWORD *)namedEntityPhraseLexicons[2];
    if (!v8)
      goto LABEL_14;
    do
    {
      v9 = (const void *)v8[6];
      if (v9)
        CFRelease(v9);
      v8 = (_QWORD *)*v8;
    }
    while (v8);
    namedEntityPhraseLexicons = self->_namedEntityPhraseLexicons;
    if (namedEntityPhraseLexicons)
    {
LABEL_14:
      std::__hash_table<std::__hash_value_type<KB::String,_LXLexicon const*>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,_LXLexicon const*>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,_LXLexicon const*>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,_LXLexicon const*>>>::~__hash_table((uint64_t)namedEntityPhraseLexicons);
      JUMPOUT(0x1DF0A2144);
    }
  }
}

- (void)dealloc
{
  void *v3;
  _LXLexicon *namedEntityPhraseLexiconRef;
  _LXLexicon *namedEntityLexiconRef;
  void **addressBookLexicons;
  _QWORD *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  void *v12;
  void *v13;
  void **appNameLexicons;
  _QWORD *v15;
  _QWORD *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  objc_super v22;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  namedEntityPhraseLexiconRef = self->_namedEntityPhraseLexiconRef;
  if (namedEntityPhraseLexiconRef)
    CFRelease(namedEntityPhraseLexiconRef);
  namedEntityLexiconRef = self->_namedEntityLexiconRef;
  if (namedEntityLexiconRef)
    CFRelease(namedEntityLexiconRef);
  -[TITransientLexiconManager releaseCachedNamedEntityLexicons](self, "releaseCachedNamedEntityLexicons");
  addressBookLexicons = (void **)self->_addressBookLexicons;
  if (addressBookLexicons)
  {
    v7 = addressBookLexicons[2];
    while (v7)
    {
      v8 = v7;
      v7 = (_QWORD *)*v7;
      v9 = (std::__shared_weak_count *)v8[7];
      if (v9)
      {
        p_shared_owners = (unint64_t *)&v9->__shared_owners_;
        do
          v11 = __ldaxr(p_shared_owners);
        while (__stlxr(v11 - 1, p_shared_owners));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
      v12 = (void *)v8[3];
      if (v12 && *((_BYTE *)v8 + 22) == 1)
        free(v12);
      operator delete(v8);
    }
    v13 = *addressBookLexicons;
    *addressBookLexicons = 0;
    if (v13)
      operator delete(v13);
    MEMORY[0x1DF0A2144](addressBookLexicons, 0x10A0C408EF24B1CLL);
  }
  appNameLexicons = (void **)self->_appNameLexicons;
  if (appNameLexicons)
  {
    v15 = appNameLexicons[2];
    while (v15)
    {
      v16 = v15;
      v15 = (_QWORD *)*v15;
      v17 = (std::__shared_weak_count *)v16[7];
      if (v17)
      {
        v18 = (unint64_t *)&v17->__shared_owners_;
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
      v20 = (void *)v16[3];
      if (v20 && *((_BYTE *)v16 + 22) == 1)
        free(v20);
      operator delete(v16);
    }
    v21 = *appNameLexicons;
    *appNameLexicons = 0;
    if (v21)
      operator delete(v21);
    MEMORY[0x1DF0A2144](appNameLexicons, 0x10A0C408EF24B1CLL);
  }
  v22.receiver = self;
  v22.super_class = (Class)TITransientLexiconManager;
  -[TITransientLexiconManager dealloc](&v22, sel_dealloc);
}

- (id)_currentConnection
{
  if (__overridingCurrentConnectionForTesting)
    return (id)__overridingCurrentConnectionForTesting;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (TISupplementalLexiconController)ensureSupplementalLexicons
{
  TISupplementalLexiconController *v3;
  TISupplementalLexiconController *v4;
  void *v5;
  TISupplementalLexiconController *v6;

  -[TITransientLexiconManager supplementalLexicons](self, "supplementalLexicons");
  v3 = (TISupplementalLexiconController *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [TISupplementalLexiconController alloc];
    -[TITransientLexiconManager _currentConnection](self, "_currentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[TISupplementalLexiconController initWithConnection:](v4, "initWithConnection:", v5);

    -[TISupplementalLexiconController setDelegate:](v3, "setDelegate:", self);
    objc_storeStrong((id *)&self->_supplementalLexicons, v3);
  }
  v6 = v3;

  return v6;
}

- (void)registerNamedEntitiesUpdateCallback
{
  _ICLexiconManaging *inputContextLexiconManager;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    inputContextLexiconManager = self->_inputContextLexiconManager;
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __64__TITransientLexiconManager_registerNamedEntitiesUpdateCallback__block_invoke;
    v8 = &unk_1EA100A68;
    objc_copyWeak(&v9, &location);
    v4 = _Block_copy(&v5);
    -[_ICLexiconManaging performSelector:withObject:](inputContextLexiconManager, "performSelector:withObject:", sel_addNamedEntitiesUpdateObserver_, v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
  }
  objc_destroyWeak(&location);
}

- (void)namedEntitiesUpdateCallback
{
  _OWORD *v3;
  _OWORD *v4;
  uint64_t *i;
  const char *v6;
  uint64_t *j;
  const char *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[TITransientLexiconManager namedEntitiesUpdateCallback]";
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Received a named entities update callback, rebuilding the cached lexicons", (uint8_t *)&v9, 0xCu);
  }
  v3 = (_OWORD *)operator new();
  *v3 = 0u;
  v3[1] = 0u;
  *((_DWORD *)v3 + 8) = 1065353216;
  v4 = (_OWORD *)operator new();
  *v4 = 0u;
  v4[1] = 0u;
  *((_DWORD *)v4 + 8) = 1065353216;
  for (i = (uint64_t *)*((_QWORD *)self->_namedEntityLexicons + 2); i; i = (uint64_t *)*i)
  {
    if (*((_WORD *)i + 8))
    {
      if (i[3])
        v6 = (const char *)i[3];
      else
        v6 = (const char *)(i + 4);
    }
    else
    {
      v6 = "";
    }
    -[TITransientLexiconManager filteredLexicon:fromLexiconCache:forLocale:](self, "filteredLexicon:fromLexiconCache:forLocale:", self->_namedEntityLexiconRef, v3, v6);
  }
  for (j = (uint64_t *)*((_QWORD *)self->_namedEntityPhraseLexicons + 2); j; j = (uint64_t *)*j)
  {
    if (*((_WORD *)j + 8))
    {
      if (j[3])
        v8 = (const char *)j[3];
      else
        v8 = (const char *)(j + 4);
    }
    else
    {
      v8 = "";
    }
    -[TITransientLexiconManager filteredLexicon:fromLexiconCache:forLocale:](self, "filteredLexicon:fromLexiconCache:forLocale:", self->_namedEntityPhraseLexiconRef, v4, v8);
  }
  -[TITransientLexiconManager releaseCachedNamedEntityLexicons](self, "releaseCachedNamedEntityLexicons");
  self->_namedEntityLexicons = v3;
  self->_namedEntityPhraseLexicons = v4;
}

- (void)loadLexicons
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  objc_class *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_lexiconsLoaded)
  {
    -[_ICLexiconManaging loadLexicons](self->_inputContextLexiconManager, "loadLexicons");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_msgSend(v8, "typeFlags") & 1) != 0)
          {
            v9 = objc_msgSend(v8, "typeFlags");
            v10 = (objc_class *)CFRetain((CFTypeRef)objc_msgSend(v8, "getLexiconImplementation"));
            if ((v9 & 4) != 0)
              v11 = 16;
            else
              v11 = 8;
            *(Class *)((char *)&self->super.isa + v11) = v10;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }
    self->_lexiconsLoaded = 1;

  }
}

- (void)performMaintenance
{
  _ICLexiconManaging *v3;
  _ICLexiconManaging *inputContextLexiconManager;
  _LXLexicon *namedEntityLexiconRef;
  _LXLexicon *namedEntityPhraseLexiconRef;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[TITransientLexiconManager performMaintenance]";
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Performing maintenance in Transient Lexicon Manager", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0D3AB78], "lexiconManager");
  v3 = (_ICLexiconManaging *)objc_claimAutoreleasedReturnValue();
  inputContextLexiconManager = self->_inputContextLexiconManager;
  self->_inputContextLexiconManager = v3;

  -[TITransientLexiconManager registerNamedEntitiesUpdateCallback](self, "registerNamedEntitiesUpdateCallback");
  namedEntityLexiconRef = self->_namedEntityLexiconRef;
  if (namedEntityLexiconRef)
  {
    CFRelease(namedEntityLexiconRef);
    self->_namedEntityLexiconRef = 0;
  }
  namedEntityPhraseLexiconRef = self->_namedEntityPhraseLexiconRef;
  if (namedEntityPhraseLexiconRef)
  {
    CFRelease(namedEntityPhraseLexiconRef);
    self->_namedEntityPhraseLexiconRef = 0;
  }
  self->_lexiconsLoaded = 0;
  -[TITransientLexiconManager loadLexicons](self, "loadLexicons");
  -[TITransientLexiconManager namedEntitiesUpdateCallback](self, "namedEntitiesUpdateCallback");
}

- (void)supplementalLexiconControllerProcessDidTerminate:(id)a3
{
  NSObject *v4;
  TISupplementalLexiconController *supplementalLexicons;
  uint8_t v6[16];

  TISupplementalLexiconOSLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_INFO, "Process terminated -- removing supplemental lexicon controller", v6, 2u);
  }

  supplementalLexicons = self->_supplementalLexicons;
  self->_supplementalLexicons = 0;

}

- (id)addContactObserver:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TITransientLexiconManager loadLexicons](self, "loadLexicons");
  -[_ICLexiconManaging addContactObserver:](self->_inputContextLexiconManager, "addContactObserver:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)removeContactObserver:(id)a3
{
  -[_ICLexiconManaging removeContactObserver:](self->_inputContextLexiconManager, "removeContactObserver:", a3);
}

- (BOOL)searchHelper:(_LXLexicon *)a3 forWord:(__CFString *)a4 caseSensitive:(BOOL)a5
{
  BOOL v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (!a3)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  LXLexiconEnumerateEntriesForString();
  v5 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v5;
}

- (BOOL)searchForWord:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  v4 = a3;
  if (!self->_supplementalLexiconSearchEnabled)
    goto LABEL_4;
  -[TITransientLexiconManager supplementalLexicons](self, "supplementalLexicons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "activeWordLexicon");

  if (!v6
    || (-[TITransientLexiconManager supplementalLexicons](self, "supplementalLexicons"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = 1,
        v9 = -[TITransientLexiconManager searchHelper:forWord:caseSensitive:](self, "searchHelper:forWord:caseSensitive:", objc_msgSend(v7, "activeWordLexicon"), v4, 1), v7, !v9))
  {
LABEL_4:
    v8 = -[TITransientLexiconManager searchHelper:forWord:caseSensitive:](self, "searchHelper:forWord:caseSensitive:", -[TITransientLexiconManager namedEntityLexicon](self, "namedEntityLexicon"), v4, 1);
  }

  return v8;
}

- (BOOL)searchForWordCaseInsensitive:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  v4 = a3;
  if (!self->_supplementalLexiconSearchEnabled)
    goto LABEL_5;
  -[TITransientLexiconManager supplementalLexicons](self, "supplementalLexicons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "activeWordLexicon");

  if (!v6)
    goto LABEL_5;
  -[TITransientLexiconManager supplementalLexicons](self, "supplementalLexicons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TITransientLexiconManager searchHelper:forWord:caseSensitive:](self, "searchHelper:forWord:caseSensitive:", objc_msgSend(v7, "activeWordLexicon"), v4, 0);

  if (v8)
    v9 = 1;
  else
LABEL_5:
    v9 = -[TITransientLexiconManager searchHelper:forWord:caseSensitive:](self, "searchHelper:forWord:caseSensitive:", -[TITransientLexiconManager namedEntityLexicon](self, "namedEntityLexicon"), v4, 0);

  return v9;
}

- (void)getOnce:(id)a3
{
  void (**v4)(id, _QWORD);
  dispatch_semaphore_t v5;
  NSObject *v6;
  void *v7;
  dispatch_time_t v8;
  uint8_t v9[16];
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = dispatch_semaphore_create(0);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3874;
  v17 = __Block_byref_object_dispose__3875;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__TITransientLexiconManager_getOnce___block_invoke;
  v10[3] = &unk_1EA0FC6D0;
  v12 = &v13;
  v6 = v5;
  v11 = v6;
  -[TITransientLexiconManager addContactObserver:](self, "addContactObserver:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v6, v8))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_ICPredictionManager quickTypePredictionWithTrigger timeout", v9, 2u);
    }
    -[TITransientLexiconManager removeContactObserver:](self, "removeContactObserver:", v7);
  }
  else
  {
    -[TITransientLexiconManager removeContactObserver:](self, "removeContactObserver:", v7);
    v4[2](v4, v14[5]);
  }

  _Block_object_dispose(&v13, 8);
}

- (_LXLexicon)namedEntityLexicon
{
  -[TITransientLexiconManager loadLexicons](self, "loadLexicons");
  return self->_namedEntityLexiconRef;
}

- (_LXLexicon)namedEntityPhraseLexicon
{
  -[TITransientLexiconManager loadLexicons](self, "loadLexicons");
  return self->_namedEntityPhraseLexiconRef;
}

- (_LXLexicon)filterLexicon:(_LXLexicon *)a3 againstLocale:(String *)a4
{
  __CFDictionary *Mutable;
  const void *v6;
  void *v7;
  uint64_t Transient;
  _LXLexicon *v9;
  char *var4;
  char *v12;
  int v13;
  char *var5;
  const char *v15;
  void *v16;
  KB *v17;
  const void ***v18;
  const void *RootCursor;
  const void *v20;
  const void ***v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  const void ***(*v28)(uint64_t);
  uint64_t v29;
  KB::StaticDictionary *v30[2];
  uint8_t v31[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  _BYTE v35[8];
  void *v36;
  _BYTE v37[8];
  void *v38;
  _BYTE v39[8];
  void *v40;
  _BYTE v41[8];
  void *v42;
  _BYTE v43[8];
  void *v44;
  uint64_t v45;
  int v46;
  uint8_t buf[4];
  _BYTE v48[12];
  _BYTE v49[8];
  void *v50;
  int v51;
  __int16 v52;
  char v53;
  void *v54;
  char v55;
  int v56;
  __int16 v57;
  char v58;
  void *v59;
  char v60;
  int v61;
  __int16 v62;
  char v63;
  void *v64;
  char v65;
  uint64_t v66;
  int v67;
  _WORD v68[3];
  char v69;
  char *v70;
  _QWORD v71[5];

  v71[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v6 = (const void *)LXLexiconCopyName();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%u"), v6, arc4random());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D437C8], v7);
    v30[1] = 0;
    Transient = LXLexiconCreateTransient();
    LXLexiconRepositoryAddOrUpdate();
    v24 = 0;
    v25 = &v24;
    v26 = 0x3812000000;
    v27 = __Block_byref_object_copy__38;
    v28 = __Block_byref_object_dispose__39;
    v29 = 0;
    KB::StaticDictionary::create((uint64_t *)v30);
    var4 = a4->var4;
    if (!var4)
      var4 = a4->var5;
    if (a4->var0)
      v12 = var4;
    else
      v12 = "";
    v13 = TILexiconIDForLocaleIdentifier(v12);
    var5 = a4->var4;
    if (!var5)
      var5 = a4->var5;
    if (a4->var0)
      v15 = var5;
    else
      v15 = "";
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardStaticUnigramsFile(v16);
    v17 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v17, (uint64_t)v68);

    KB::String::String((KB::String *)buf, (const KB::String *)a4);
    KB::String::String((KB::String *)v49, (const KB::String *)v68);
    v51 = 0x100000;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0x100000;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0x100000;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    LODWORD(v66) = v13;
    BYTE4(v66) = 0;
    v67 = 1065353216;
    v18 = (const void ***)v25[6];
    KB::String::String((KB::String *)v35, (const KB::String *)buf);
    KB::String::String((KB::String *)v37, (const KB::String *)v49);
    KB::String::String((KB::String *)v39, (const KB::String *)&v51);
    KB::String::String((KB::String *)v41, (const KB::String *)&v56);
    KB::String::String((KB::String *)v43, (const KB::String *)&v61);
    v45 = v66;
    v46 = v67;
    KB::StaticDictionary::load(v18, (uint64_t)v35);
    if (v44 && v43[6] == 1)
      free(v44);
    if (v42 && v41[6] == 1)
      free(v42);
    if (v40 && v39[6] == 1)
      free(v40);
    if (v38 && v37[6] == 1)
      free(v38);
    if (v36 && v35[6] == 1)
      free(v36);
    if (*(_QWORD *)v25[6] == *(_QWORD *)(v25[6] + 8))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v22 = v70;
        if (!v70)
          v22 = (const char *)v71;
        v23 = "";
        if (v68[0])
          v23 = v22;
        *(_DWORD *)v31 = 136315394;
        v32 = "-[TITransientLexiconManager filterLexicon:againstLocale:]";
        v33 = 2080;
        v34 = v23;
        _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Failed to open named entity filtering dictionary at %s", v31, 0x16u);
      }
      v9 = 0;
      v20 = (const void *)Transient;
    }
    else
    {
      RootCursor = (const void *)LXLexiconCreateRootCursor();
      LXCursorEnumerateEntriesRecursively();
      if (RootCursor)
        CFRelease(RootCursor);
      v20 = 0;
      v9 = (_LXLexicon *)Transient;
    }
    if (v64 && v63 == 1)
      free(v64);
    if (v59 && v58 == 1)
      free(v59);
    if (v54 && v53 == 1)
      free(v54);
    if (v50 && v49[6] == 1)
      free(v50);
    if (*(_QWORD *)&v48[4] && v48[2] == 1)
      free(*(void **)&v48[4]);
    if (v70 && v69 == 1)
      free(v70);
    _Block_object_dispose(&v24, 8);
    v21 = (const void ***)v30[0];
    v30[0] = 0;
    if (v21)
    {
      KB::StaticDictionary::~StaticDictionary(v21);
      MEMORY[0x1DF0A2144]();
    }
    if (v20)
      CFRelease(v20);

    if (v6)
      CFRelease(v6);
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v48 = "-[TITransientLexiconManager filterLexicon:againstLocale:]";
      _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Lexicon being asked to filter is null - will return a null reference in return", buf, 0xCu);
    }
    return 0;
  }
  return v9;
}

- (_LXLexicon)appNameLexiconForLocale:(const char *)a3
{
  const char *v4;
  const char *v5;
  void *v6;
  KB *v7;
  void *v8;
  unint64_t v9;
  char *appNameLexicons;
  unint64_t *v11;
  unint64_t v12;
  KB::String *v13;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;
  uint8x8_t v17;
  unint64_t v18;
  uint64_t **v19;
  uint64_t **v20;
  unint64_t v21;
  __n128 **v22;
  __n128 *v23;
  float v24;
  float v25;
  _BOOL8 v26;
  unint64_t v27;
  unint64_t v28;
  int8x8_t prime;
  void *v30;
  void *v31;
  uint64_t v32;
  __n128 *v33;
  unint64_t v34;
  uint8x8_t v35;
  unint64_t v36;
  uint8x8_t v37;
  uint64_t v38;
  __n128 *v39;
  unint64_t v40;
  int8x8_t v41;
  __n128 **v42;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  BOOL v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  BOOL v51;
  _QWORD *v52;
  std::__shared_weak_count *v53;
  _LXLexicon *v54;
  unint64_t *v55;
  unint64_t v56;
  BOOL v57;
  void *v59;
  __n128 v60;
  char *v61;
  void *v62;
  uint64_t v63;
  __n128 v64;
  _BYTE v65[8];
  void *v66;
  _BYTE v67[8];
  void *v68;
  _BYTE v69[8];
  void *v70;
  _BYTE v71[8];
  void *v72;
  _BYTE v73[8];
  void *v74;
  uint64_t v75;
  char *v76;
  _QWORD v77[4];

  v77[2] = *MEMORY[0x1E0C80C00];
  KB::String::String((KB::String *)&v75, a3);
  if (std::__hash_table<std::__hash_value_type<KB::String,unsigned long>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,unsigned long>>>::find<KB::String>((_QWORD *)self->_appNameLexicons, &v75))
  {
    goto LABEL_122;
  }
  v4 = v76;
  if (!v76)
    v4 = (const char *)v77;
  if ((_WORD)v75)
    v5 = v4;
  else
    v5 = "";
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardStaticUnigramsFile(v6);
  v7 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v7, (uint64_t)v73);

  +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardDeltaLexiconPathForInputMode(v8);
  v9 = objc_claimAutoreleasedReturnValue();
  KB::utf8_string((KB *)v9, (uint64_t)v71);

  KB::String::String((KB::String *)v69, (const KB::String *)&v75);
  KB::String::String((KB::String *)v67, (const KB::String *)v73);
  KB::String::String((KB::String *)v65, (const KB::String *)v71);
  KB::AppTrieLoader::create((const KB::String *)v69, (const KB::String *)v67, (const KB::String *)v65, &v60);
  if (v66 && v65[6] == 1)
    free(v66);
  if (v68 && v67[6] == 1)
    free(v68);
  if (v70 && v69[6] == 1)
    free(v70);
  appNameLexicons = (char *)self->_appNameLexicons;
  KB::String::String((KB::String *)&v61, (const KB::String *)&v75);
  v64 = v60;
  if (v60.n128_u64[1])
  {
    v11 = (unint64_t *)(v60.n128_u64[1] + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  if (v62)
    v13 = (KB::String *)v62;
  else
    v13 = (KB::String *)&v63;
  v14 = KB::String::hash(v13, (const char *)(unsigned __int16)v61);
  v15 = v14;
  v16 = *((_QWORD *)appNameLexicons + 1);
  if (v16)
  {
    v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
    v17.i16[0] = vaddlv_u8(v17);
    v18 = v17.u32[0];
    if (v17.u32[0] > 1uLL)
    {
      v9 = v14;
      if (v16 <= v14)
        v9 = v14 % v16;
    }
    else
    {
      v9 = ((_DWORD)v16 - 1) & v14;
    }
    v19 = *(uint64_t ***)(*(_QWORD *)appNameLexicons + 8 * v9);
    if (v19)
    {
      v20 = (uint64_t **)*v19;
      if (*v19)
      {
        do
        {
          v21 = (unint64_t)v20[1];
          if (v21 == v15)
          {
            if (v20 + 2 == (uint64_t **)&v61 || KB::String::equal((KB::String *)(v20 + 2), (const KB::String *)&v61, 1))
              goto LABEL_96;
          }
          else
          {
            if (v18 > 1)
            {
              if (v21 >= v16)
                v21 %= v16;
            }
            else
            {
              v21 &= v16 - 1;
            }
            if (v21 != v9)
              break;
          }
          v20 = (uint64_t **)*v20;
        }
        while (v20);
      }
    }
  }
  v22 = (__n128 **)(appNameLexicons + 16);
  v23 = (__n128 *)operator new(0x40uLL);
  v23->n128_u64[0] = 0;
  v23->n128_u64[1] = v15;
  KB::String::String((KB::String *)&v23[1], (const KB::String *)&v61);
  v23[3] = v64;
  v64 = 0uLL;
  v24 = (float)(unint64_t)(*((_QWORD *)appNameLexicons + 3) + 1);
  v25 = *((float *)appNameLexicons + 8);
  if (!v16 || (float)(v25 * (float)v16) < v24)
  {
    v26 = 1;
    if (v16 >= 3)
      v26 = (v16 & (v16 - 1)) != 0;
    v27 = v26 | (2 * v16);
    v28 = vcvtps_u32_f32(v24 / v25);
    if (v27 <= v28)
      prime = (int8x8_t)v28;
    else
      prime = (int8x8_t)v27;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v16 = *((_QWORD *)appNameLexicons + 1);
    if (*(_QWORD *)&prime > v16)
      goto LABEL_52;
    if (*(_QWORD *)&prime < v16)
    {
      v36 = vcvtps_u32_f32((float)*((unint64_t *)appNameLexicons + 3) / *((float *)appNameLexicons + 8));
      if (v16 < 3 || (v37 = (uint8x8_t)vcnt_s8((int8x8_t)v16), v37.i16[0] = vaddlv_u8(v37), v37.u32[0] > 1uLL))
      {
        v36 = std::__next_prime(v36);
      }
      else
      {
        v38 = 1 << -(char)__clz(v36 - 1);
        if (v36 >= 2)
          v36 = v38;
      }
      if (*(_QWORD *)&prime <= v36)
        prime = (int8x8_t)v36;
      if (*(_QWORD *)&prime >= v16)
      {
        v16 = *((_QWORD *)appNameLexicons + 1);
      }
      else
      {
        if (prime)
        {
LABEL_52:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v30 = operator new(8 * *(_QWORD *)&prime);
          v31 = *(void **)appNameLexicons;
          *(_QWORD *)appNameLexicons = v30;
          if (v31)
            operator delete(v31);
          v32 = 0;
          *((int8x8_t *)appNameLexicons + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)appNameLexicons + 8 * v32++) = 0;
          while (*(_QWORD *)&prime != v32);
          v33 = *v22;
          if (*v22)
          {
            v34 = v33->n128_u64[1];
            v35 = (uint8x8_t)vcnt_s8(prime);
            v35.i16[0] = vaddlv_u8(v35);
            if (v35.u32[0] > 1uLL)
            {
              if (v34 >= *(_QWORD *)&prime)
                v34 %= *(_QWORD *)&prime;
            }
            else
            {
              v34 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)appNameLexicons + 8 * v34) = v22;
            v39 = (__n128 *)v33->n128_u64[0];
            if (v33->n128_u64[0])
            {
              do
              {
                v40 = v39->n128_u64[1];
                if (v35.u32[0] > 1uLL)
                {
                  if (v40 >= *(_QWORD *)&prime)
                    v40 %= *(_QWORD *)&prime;
                }
                else
                {
                  v40 &= *(_QWORD *)&prime - 1;
                }
                if (v40 != v34)
                {
                  if (!*(_QWORD *)(*(_QWORD *)appNameLexicons + 8 * v40))
                  {
                    *(_QWORD *)(*(_QWORD *)appNameLexicons + 8 * v40) = v33;
                    goto LABEL_77;
                  }
                  v33->n128_u64[0] = v39->n128_u64[0];
                  v39->n128_u64[0] = **(_QWORD **)(*(_QWORD *)appNameLexicons + 8 * v40);
                  **(_QWORD **)(*(_QWORD *)appNameLexicons + 8 * v40) = v39;
                  v39 = v33;
                }
                v40 = v34;
LABEL_77:
                v33 = v39;
                v39 = (__n128 *)v39->n128_u64[0];
                v34 = v40;
              }
              while (v39);
            }
          }
          v16 = (unint64_t)prime;
          goto LABEL_81;
        }
        v59 = *(void **)appNameLexicons;
        *(_QWORD *)appNameLexicons = 0;
        if (v59)
          operator delete(v59);
        v16 = 0;
        *((_QWORD *)appNameLexicons + 1) = 0;
      }
    }
LABEL_81:
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v16 <= v15)
        v9 = v15 % v16;
      else
        v9 = v15;
    }
    else
    {
      v9 = ((_DWORD)v16 - 1) & v15;
    }
  }
  v41 = *(int8x8_t *)appNameLexicons;
  v42 = *(__n128 ***)(*(_QWORD *)appNameLexicons + 8 * v9);
  if (v42)
  {
    v23->n128_u64[0] = (unint64_t)*v42;
  }
  else
  {
    v23->n128_u64[0] = (unint64_t)*v22;
    *v22 = v23;
    *(_QWORD *)(*(_QWORD *)&v41 + 8 * v9) = v22;
    if (!v23->n128_u64[0])
      goto LABEL_95;
    v43 = *(_QWORD *)(v23->n128_u64[0] + 8);
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v43 >= v16)
        v43 %= v16;
    }
    else
    {
      v43 &= v16 - 1;
    }
    v42 = (__n128 **)(*(_QWORD *)appNameLexicons + 8 * v43);
  }
  *v42 = v23;
LABEL_95:
  ++*((_QWORD *)appNameLexicons + 3);
LABEL_96:
  v44 = (std::__shared_weak_count *)v64.n128_u64[1];
  if (v64.n128_u64[1])
  {
    v45 = (unint64_t *)(v64.n128_u64[1] + 8);
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  if (v62)
    v47 = BYTE6(v61) == 1;
  else
    v47 = 0;
  if (v47)
    free(v62);
  v48 = (std::__shared_weak_count *)v60.n128_u64[1];
  if (v60.n128_u64[1])
  {
    v49 = (unint64_t *)(v60.n128_u64[1] + 8);
    do
      v50 = __ldaxr(v49);
    while (__stlxr(v50 - 1, v49));
    if (!v50)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }
  if (v72)
    v51 = v71[6] == 1;
  else
    v51 = 0;
  if (v51)
    free(v72);
  if (v74 && v73[6] == 1)
    free(v74);

LABEL_122:
  v52 = std::__hash_table<std::__hash_value_type<KB::String,unsigned long>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,unsigned long>>>::find<KB::String>((_QWORD *)self->_appNameLexicons, &v75);
  if (!v52)
    abort();
  (*(void (**)(char **__return_ptr))(*(_QWORD *)v52[6] + 16))(&v61);
  v53 = (std::__shared_weak_count *)v62;
  v54 = *(_LXLexicon **)v61;
  if (v62)
  {
    v55 = (unint64_t *)((char *)v62 + 8);
    do
      v56 = __ldaxr(v55);
    while (__stlxr(v56 - 1, v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }
  if (v76)
    v57 = BYTE6(v75) == 1;
  else
    v57 = 0;
  if (v57)
    free(v76);
  return v54;
}

- (void)debugLogEntities
{
  __45__TITransientLexiconManager_debugLogEntities__block_invoke((uint64_t)self->_namedEntityLexiconRef);
  __45__TITransientLexiconManager_debugLogEntities__block_invoke((uint64_t)self->_namedEntityPhraseLexiconRef);
}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  -[_ICLexiconManaging provideFeedbackForString:type:style:](self->_inputContextLexiconManager, "provideFeedbackForString:type:style:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalLexicons, 0);
  objc_storeStrong((id *)&self->_inputContextLexiconManager, 0);
}

void __45__TITransientLexiconManager_debugLogEntities__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v3 = (void *)MEMORY[0x1E0CB3940];
        v4 = (void *)LXLexiconCopyName();
        +[TITransientLexiconManager getEntries:](TITransientLexiconManager, "getEntries:", a1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "stringWithFormat:", CFSTR("%s %@ contains [ %@ ]"), "-[TITransientLexiconManager debugLogEntities]_block_invoke", v4, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v9 = v7;
        _os_log_debug_impl(&dword_1DA6F2000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }
}

void __57__TITransientLexiconManager_filterLexicon_againstLocale___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  KB::StaticDictionary *v3;
  BOOL v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (const __CFString *)LXEntryCopyString();
  v3 = *(KB::StaticDictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  KB::utf8_string(v2, (uint64_t)&v6);
  v4 = KB::StaticDictionary::contains(v3, (const KB::String *)&v6, 0, 0.0);
  if (v7)
    v5 = BYTE6(v6) == 1;
  else
    v5 = 0;
  if (v5)
  {
    free(v7);
    if (v4)
    {
LABEL_6:
      if (!v2)
        return;
      goto LABEL_7;
    }
  }
  else if (v4)
  {
    goto LABEL_6;
  }
  v6 = 0;
  LXEntryGetTimestamp();
  LXLexiconAddWithCreationTime();
  LXLexiconIncrementUsageCount();
  if (!v2)
    return;
LABEL_7:
  CFRelease(v2);
}

intptr_t __37__TITransientLexiconManager_getOnce___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64__TITransientLexiconManager_searchHelper_forWord_caseSensitive___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  const __CFString *v5;

  v5 = (const __CFString *)LXEntryCopyString();
  if (CFStringCompare(v5, *(CFStringRef *)(a1 + 40), *(_BYTE *)(a1 + 48) == 0) == kCFCompareEqualTo)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  CFRelease(v5);
}

void __64__TITransientLexiconManager_registerNamedEntitiesUpdateCallback__block_invoke(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 32));
  TIDispatchAsync();
  objc_destroyWeak(&v1);
}

void __64__TITransientLexiconManager_registerNamedEntitiesUpdateCallback__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "namedEntitiesUpdateCallback");
    WeakRetained = v2;
  }

}

+ (id)getEntries:(_LXLexicon *)a3
{
  void *v3;
  const void *RootCursor;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  RootCursor = (const void *)LXLexiconCreateRootCursor();
  v6 = v3;
  LXCursorEnumerateEntriesRecursively();
  CFRelease(RootCursor);

  return v6;
}

void __40__TITransientLexiconManager_getEntries___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)LXEntryCopyString();
  objc_msgSend(v1, "addObject:", v2);

}

void __46__TITransientLexiconManager_singletonInstance__block_invoke_2(uint64_t a1)
{
  if (+[TITransientLexiconManager singletonInstance]::onceToken != -1)
    dispatch_once(&+[TITransientLexiconManager singletonInstance]::onceToken, *(dispatch_block_t *)(a1 + 32));
}

void __46__TITransientLexiconManager_singletonInstance__block_invoke()
{
  TITransientLexiconManager *v0;
  void *v1;

  v0 = objc_alloc_init(TITransientLexiconManager);
  v1 = (void *)+[TITransientLexiconManager singletonInstance]::singletonInstance;
  +[TITransientLexiconManager singletonInstance]::singletonInstance = (uint64_t)v0;

}

- (NSXPCConnection)_overridingCurrentConnectionForTesting
{
  return (NSXPCConnection *)(id)__overridingCurrentConnectionForTesting;
}

- (void)_setOverridingCurrentConnectionForTesting:(id)a3
{
  objc_storeStrong((id *)&__overridingCurrentConnectionForTesting, a3);
}

+ (void)setSharedTITransientLexiconManager:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)__testingInstance != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&__testingInstance, a3);
    v4 = v5;
  }

}

@end
