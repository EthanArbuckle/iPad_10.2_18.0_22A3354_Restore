@implementation ZNK2KB22StaticDictionaryCursor8childrenEv

const void **___ZNK2KB22StaticDictionaryCursor8childrenEv_block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v3;
  unsigned int *v4;
  unsigned int TraversedCharacter;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t k;
  const void *v22;
  __int128 v23;
  uint64_t v24;
  unint64_t v25;
  __int128 v26;
  uint64_t m;
  unint64_t v28;
  uint64_t v29;
  const void *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t i;
  const void *v54;
  __int128 v55;
  unint64_t v56;
  uint64_t j;
  const void *v58;
  __int128 v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unsigned int v63;
  unint64_t v66;
  const void *v67;
  const void *v68;
  unint64_t v69;
  unsigned int v70;
  uint64_t v71;
  unint64_t *v72;
  _QWORD v73[2];
  BOOL (*v74)(uint64_t, uint64_t);
  void *v75;
  unsigned int v76;
  __int128 v77;
  __int128 v78;
  _QWORD *v79;
  _BYTE v80[52];
  _QWORD *v81;

  v3 = a1;
  v4 = *(unsigned int **)(a1 + 40);
  TraversedCharacter = LXCursorLastTraversedCharacter();
  v6 = *(_QWORD *)(*(_QWORD *)(v3 + 32) + 8);
  v9 = *(_QWORD *)(v6 + 40);
  v8 = *(_QWORD *)(v6 + 48);
  v7 = (unint64_t *)(v6 + 40);
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 0x40000000;
  v74 = ___ZNK2KB22StaticDictionaryCursor8childrenEv_block_invoke_2;
  v75 = &__block_descriptor_tmp_17523;
  v76 = TraversedCharacter;
  if (v9 == v8)
    goto LABEL_7;
  while ((((uint64_t (*)(_QWORD *, unint64_t))v74)(v73, v9) & 1) == 0)
  {
    v9 += 56;
    if (v9 == v8)
    {
      v9 = v8;
      break;
    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(v3 + 32) + 8);
  v7 = (unint64_t *)(v10 + 40);
  if (v9 == *(_QWORD *)(v10 + 48) || TraversedCharacter < *(_DWORD *)(v9 + 48))
  {
LABEL_7:
    v12 = *v7;
    v11 = v7[1];
    v13 = v9 - *v7;
    v14 = 0x6DB6DB6DB6DB6DB7 * (v13 >> 3);
    v71 = v3;
    v72 = v7;
    v16 = v7 + 2;
    v15 = v7[2];
    v70 = TraversedCharacter;
    if (v11 >= v15)
    {
      v31 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v11 - v12) >> 3) + 1;
      if (v31 > 0x492492492492492)
        abort();
      v32 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v15 - v12) >> 3);
      if (2 * v32 > v31)
        v31 = 2 * v32;
      if (v32 >= 0x249249249249249)
        v33 = 0x492492492492492;
      else
        v33 = v31;
      v79 = v7 + 2;
      if (v33)
        v33 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::LanguageModelLexiconGroup>>(v33);
      else
        v34 = 0;
      v37 = v33 + 8 * (v13 >> 3);
      *(_QWORD *)&v77 = v33;
      *((_QWORD *)&v77 + 1) = v37;
      *(_QWORD *)&v78 = v37;
      *((_QWORD *)&v78 + 1) = v33 + 56 * v34;
      v38 = v37;
      if (v14 == v34)
      {
        if (v13 < 1)
        {
          if (v9 == v12)
            v40 = 1;
          else
            v40 = 0xDB6DB6DB6DB6DB6ELL * (v13 >> 3);
          v41 = v40 >> 2;
          *(_QWORD *)&v80[32] = v16;
          *(_QWORD *)v80 = std::__allocate_at_least[abi:nn180100]<std::allocator<KB::LanguageModelLexiconGroup>>(v40);
          *(_QWORD *)&v80[8] = *(_QWORD *)v80 + 56 * v41;
          *(_QWORD *)&v80[16] = *(_QWORD *)&v80[8];
          *(_QWORD *)&v80[24] = *(_QWORD *)v80 + 56 * v42;
          v43 = v77;
          v44 = v78;
          v66 = *(_QWORD *)&v80[8];
          v69 = *(_QWORD *)&v80[8];
          v77 = *(_OWORD *)v80;
          v78 = *(_OWORD *)&v80[16];
          *(_OWORD *)v80 = v43;
          *(_OWORD *)&v80[16] = v44;
          std::__split_buffer<KB::StaticDictionaryCursor>::~__split_buffer((uint64_t)v80);
          v38 = v66;
          v37 = v69;
        }
        else
        {
          v39 = v14 + 2;
          if (v14 >= -1)
            v39 = v14 + 1;
          v37 -= 56 * (v39 >> 1);
          v38 = v37;
        }
      }
      v45 = v4[10];
      *(_DWORD *)(v38 + 32) = 0;
      *(_OWORD *)v38 = 0u;
      *(_OWORD *)(v38 + 16) = 0u;
      *(_QWORD *)(v38 + 40) = v45;
      *(_DWORD *)(v38 + 48) = 0;
      v46 = v38 + 56;
      *(_QWORD *)&v78 = v38 + 56;
      v47 = v72;
      v48 = *v72;
      if (v9 == *v72)
      {
        v51 = v37;
      }
      else
      {
        v68 = a2;
        v49 = v9;
        v50 = v37;
        do
        {
          v51 = v50 - 56;
          v52 = v49 - 56;
          for (i = -56; i != -32; i += 8)
          {
            v54 = *(const void **)(v49 + i);
            *(_QWORD *)(v50 + i) = v54;
            if (v54)
            {
              CFRetain(v54);
              *(_QWORD *)(v50 + i) = v54;
            }
          }
          v55 = *(_OWORD *)(v49 - 32);
          *(_OWORD *)(v50 - 20) = *(_OWORD *)(v49 - 20);
          *(_OWORD *)(v50 - 32) = v55;
          v49 -= 56;
          v50 -= 56;
        }
        while (v52 != v48);
        v46 = v78;
        a2 = v68;
        v47 = v72;
      }
      *((_QWORD *)&v77 + 1) = v51;
      v56 = v47[1];
      if (v9 != v56)
      {
        do
        {
          for (j = 0; j != 24; j += 8)
          {
            v58 = *(const void **)(v9 + j);
            *(_QWORD *)(v46 + j) = v58;
            if (v58)
            {
              CFRetain(v58);
              *(_QWORD *)(v46 + j) = v58;
            }
          }
          v59 = *(_OWORD *)(v9 + 24);
          *(_OWORD *)(v46 + 36) = *(_OWORD *)(v9 + 36);
          *(_OWORD *)(v46 + 24) = v59;
          v9 += 56;
          v46 += 56;
        }
        while (v9 != v56);
        v51 = *((_QWORD *)&v77 + 1);
        v9 = v47[1];
      }
      v60 = *v47;
      *v47 = v51;
      v47[1] = v46;
      v61 = v47[2];
      v47[2] = *((_QWORD *)&v78 + 1);
      *(_QWORD *)&v78 = v9;
      *((_QWORD *)&v78 + 1) = v61;
      *(_QWORD *)&v77 = v60;
      *((_QWORD *)&v77 + 1) = v60;
      std::__split_buffer<KB::StaticDictionaryCursor>::~__split_buffer((uint64_t)&v77);
    }
    else
    {
      if (v9 == v11)
      {
        v35 = v4[10];
        v36 = v12 + 8 * (v13 >> 3);
        *(_DWORD *)(v9 + 32) = 0;
        *(_OWORD *)v9 = 0u;
        *(_OWORD *)(v9 + 16) = 0u;
        *(_QWORD *)(v36 + 40) = v35;
        *(_DWORD *)(v36 + 48) = 0;
        v7[1] = v9 + 56;
      }
      else
      {
        v67 = a2;
        v81 = v7 + 2;
        v17 = v4[10];
        memset(v80, 0, 36);
        *(_QWORD *)&v80[40] = v17;
        *(_DWORD *)&v80[48] = 0;
        v18 = v11 - 56;
        v19 = v11;
        if (v11 >= 0x38)
        {
          v20 = v11 - 56;
          v19 = v11;
          do
          {
            for (k = 0; k != 24; k += 8)
            {
              v22 = *(const void **)(v20 + k);
              *(_QWORD *)(v19 + k) = v22;
              if (v22)
              {
                CFRetain(v22);
                *(_QWORD *)(v19 + k) = v22;
              }
            }
            v23 = *(_OWORD *)(v20 + 24);
            *(_OWORD *)(v19 + 36) = *(_OWORD *)(v20 + 36);
            *(_OWORD *)(v19 + 24) = v23;
            v20 += 56;
            v19 += 56;
          }
          while (v20 < v11);
        }
        v72[1] = v19;
        if (v11 != v9 + 56)
        {
          do
          {
            v24 = 0;
            v25 = v18 - 56;
            do
            {
              KB::retain_ptr<__CFDictionary const*>::operator=((const void **)(v11 + v24 - 56), *(CFTypeRef *)(v18 + v24 - 56));
              v24 += 8;
            }
            while (v24 != 24);
            v26 = *(_OWORD *)(v18 - 32);
            *(_OWORD *)(v11 - 20) = *(_OWORD *)(v18 - 20);
            *(_OWORD *)(v11 - 32) = v26;
            v11 -= 56;
            v18 -= 56;
          }
          while (v25 != v9);
        }
        for (m = 0; m != 24; m += 8)
          KB::retain_ptr<__CFDictionary const*>::operator=((const void **)(v9 + m), *(CFTypeRef *)&v80[m]);
        v28 = v12 + 56 * v14;
        *(_OWORD *)(v28 + 24) = *(_OWORD *)&v80[24];
        *(_OWORD *)(v28 + 36) = *(_OWORD *)&v80[36];
        v29 = 16;
        a2 = v67;
        do
        {
          v30 = *(const void **)&v80[v29];
          if (v30)
            CFRelease(v30);
          *(_QWORD *)&v80[v29] = 0;
          v29 -= 8;
        }
        while (v29 != -8);
      }
      v37 = v9;
    }
    *(_DWORD *)(v37 + 48) = v70;
    if (*((_QWORD *)v4 + 5))
    {
      v62 = 0;
      v63 = 1;
      do
      {
        *(float *)(v37 + 4 * v62 + 24) = KB::StaticDictionaryCursor::probability_of_lexicon((KB::StaticDictionaryCursor *)v4, v62);
        v62 = v63;
      }
      while (*((_QWORD *)v4 + 5) > (unint64_t)v63++);
    }
    v9 = v37;
    v3 = v71;
  }
  return KB::retain_ptr<__CFDictionary const*>::operator=((const void **)(v9 + 8 * *(unsigned int *)(v3 + 48)), a2);
}

@end
