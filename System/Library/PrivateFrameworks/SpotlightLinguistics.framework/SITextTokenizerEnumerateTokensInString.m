@implementation SITextTokenizerEnumerateTokensInString

void __SITextTokenizerEnumerateTokensInString_block_invoke(uint64_t a1)
{
  _QWORD v2[3];
  char v3;
  _QWORD v4[3];
  char v5;
  _QWORD v6[3];
  char v7;
  _QWORD v8[7];
  _QWORD v9[7];
  _QWORD v10[5];
  __int128 v11;
  _QWORD v12[4];
  _QWORD v13[4];

  if (getTagger(void)::onceTaggerQueueToken != -1)
    dispatch_once(&getTagger(void)::onceTaggerQueueToken, &__block_literal_global_8);
  NLTaggerSetString();
  if (*(_QWORD *)(a1 + 64))
    NLTaggerSetLocaleForRange();
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2000000000;
  v13[3] = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2000000000;
  v12[3] = *(_QWORD *)(a1 + 72);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3802000000;
  v10[3] = __Block_byref_object_copy_;
  v10[4] = __Block_byref_object_dispose_;
  v11 = xmmword_1B86BF2D0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3802000000;
  v9[3] = __Block_byref_object_copy_;
  v9[4] = __Block_byref_object_dispose_;
  v9[5] = 0;
  v9[6] = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3802000000;
  v8[3] = __Block_byref_object_copy_;
  v8[4] = __Block_byref_object_dispose_;
  v8[5] = 0;
  v8[6] = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2000000000;
  v7 = 0;
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2000000000;
  v5 = 0;
  v2[0] = 0;
  v2[1] = v2;
  v2[2] = 0x2000000000;
  v3 = 0;
  NLTaggerEnumerateTokens();
  _Block_object_dispose(v2, 8);
  _Block_object_dispose(v4, 8);
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v13, 8);
}

void __SITextTokenizerEnumerateTokensInString_block_invoke_1(uint64_t a1, _OWORD *a2, _BYTE *a3)
{
  _OWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFIndex v8;
  CFIndex v9;
  uint64_t v10;
  uint64_t v11;
  CFIndex v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  size_t v19;
  uint64_t v20;
  size_t v21;
  char *v22;
  CFIndex MaximumSizeForEncoding;
  char *v24;
  size_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  size_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  uint64_t *v39;
  _OWORD *v40;
  _BYTE **v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __n128 (*v45)(uint64_t, CFIndex *, _BYTE *);
  void *v46;
  uint64_t v47;
  uint64_t *v48;
  __int128 v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD *v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  CFIndex v62;
  uint64_t v63;
  CFIndex v64;
  uint64_t v65;
  _QWORD v66[4];
  _QWORD v67[4];
  _QWORD v68[4];
  _QWORD v69[4];
  _QWORD v70[4];
  _QWORD v71[4];
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  CFRange v77;

  v38 = a3;
  v3 = a2;
  v76 = *MEMORY[0x1E0C80C00];
  v72 = 0;
  v73 = &v72;
  v74 = 0x2000000000;
  v75 = 0;
  v39 = &v65;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(_QWORD *)(v5 + 40);
  v40 = a2;
  while (1)
  {
    if (v6 == -1 || (v7 = *(_QWORD *)(v5 + 48) + v6, v7 < *(_QWORD *)v3))
    {
      *(_OWORD *)(v5 + 40) = *v3;
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48)
         + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    v41 = &v38;
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v9 = v7 - v8;
    v10 = v9 >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
        ? *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
        : v9;
    v11 = *(_QWORD *)(a1 + 112) - v8 + *(_QWORD *)(a1 + 120);
    v42 = v10;
    v12 = 2 * v10 >= v11 ? v11 : 2 * v10;
    MEMORY[0x1E0C80A78](a1);
    v14 = &(&v38)[-2 * v13];
    bzero(v14, v15);
    MEMORY[0x1E0C80A78](v16);
    v18 = &(&v38)[-2 * v17];
    bzero(v18, v19);
    MEMORY[0x1E0C80A78](v20);
    v22 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v22, v21);
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v12, 0x8000100u);
    v24 = (char *)&v38 - ((MEMORY[0x1E0C80A78](MaximumSizeForEncoding) + 16) & 0xFFFFFFFFFFFFFFF0);
    bzero(v24, v25);
    MEMORY[0x1E0C80A78](v26);
    v28 = (char *)&v38 - ((v27 + 17) & 0xFFFFFFFFFFFFFFF0);
    bzero(v28, v29);
    v77.location = v8;
    v77.length = v12;
    CFStringGetCharacters(*(CFStringRef *)(a1 + 128), v77, (UniChar *)v28);
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x2000000000;
    v71[3] = 0;
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2000000000;
    v70[3] = v14;
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x2000000000;
    v69[3] = v18;
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2000000000;
    v68[3] = v22;
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x2000000000;
    v67[3] = v24;
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x2000000000;
    v66[3] = v28;
    *((_BYTE *)v73 + 24) = 0;
    v43 = MEMORY[0x1E0C809B0];
    v44 = 0x40000000;
    v45 = __SITextTokenizerEnumerateTokensInString_block_invoke_2;
    v46 = &unk_1E6E3E998;
    v30 = *(_QWORD *)(a1 + 128);
    v49 = *(_OWORD *)(a1 + 64);
    v61 = v30;
    v62 = v8;
    v31 = *(_QWORD *)(a1 + 32);
    v50 = *(_QWORD *)(a1 + 40);
    v51 = v69;
    v52 = v71;
    v53 = v68;
    v54 = *(_QWORD *)(a1 + 80);
    v55 = v67;
    v56 = v70;
    v57 = v66;
    v63 = v42;
    v64 = MaximumSizeForEncoding;
    v47 = v31;
    v48 = &v72;
    v58 = *(_OWORD *)(a1 + 88);
    v32 = v39;
    v3 = v40;
    v33 = *v40;
    v39[2] = *((_QWORD *)v40 + 2);
    *(_OWORD *)v32 = v33;
    v34 = *(_QWORD *)(a1 + 48);
    v59 = *(_QWORD *)(a1 + 104);
    v60 = v34;
    NLTaggerEnumerateTokens();
    _Block_object_dispose(v66, 8);
    _Block_object_dispose(v67, 8);
    _Block_object_dispose(v68, 8);
    _Block_object_dispose(v69, 8);
    _Block_object_dispose(v70, 8);
    _Block_object_dispose(v71, 8);
    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v36 = *(_QWORD *)(v35 + 24);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(_QWORD *)(v5 + 40);
    v37 = *(_QWORD *)(v5 + 48) + v6;
    if (v36 >= v37)
      break;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
      goto LABEL_18;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) || !*((_BYTE *)v73 + 24))
      goto LABEL_17;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    goto LABEL_18;
LABEL_17:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    goto LABEL_19;
LABEL_18:
  *v38 = 0;
  v35 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v36 = *(_QWORD *)(v35 + 24);
  v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48)
      + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
LABEL_19:
  if (v36 < v37
    && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24)
    && !*((_BYTE *)v73 + 24))
  {
    *(_QWORD *)(v35 + 24) = v37;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = xmmword_1B86BF2D0;
  _Block_object_dispose(&v72, 8);
}

__n128 __SITextTokenizerEnumerateTokensInString_block_invoke_2(uint64_t a1, CFIndex *a2, _BYTE *a3)
{
  unint64_t v6;
  uint64_t v7;
  int CharacterAtIndex;
  UniChar v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  int v13;
  _BOOL4 v14;
  const __CFCharacterSet *Predefined;
  int IsCharacterMember;
  BOOL v17;
  CFIndex v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  CFIndex v28;
  CFIndex v29;
  _QWORD *v30;
  int v31;
  uint64_t v32;
  CFIndex v33;
  _BYTE *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  __n128 result;
  uint64_t v43;
  int v44;
  _BYTE *v45;
  CFIndex v46;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v6 = a2[2];
  v7 = (v6 >> 10) & 1;
  CharacterAtIndex = CFStringGetCharacterAtIndex(*(CFStringRef *)(a1 + 160), *a2);
  v9 = CharacterAtIndex;
  v10 = a2[1];
  if (v10 == 1 && (CharacterAtIndex == 45 || CharacterAtIndex == 38))
    LODWORD(v7) = 0;
  v11 = v6 & 0x800;
  v12 = CharacterAtIndex == 9 || CharacterAtIndex == 8200;
  if (v12 || CharacterAtIndex == 12288)
  {
    v13 = 1;
    v14 = 1;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      goto LABEL_22;
  }
  else
  {
    v13 = 0;
  }
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetNewline);
  IsCharacterMember = CFCharacterSetIsCharacterMember(Predefined, v9);
  v14 = IsCharacterMember != 0;
  if (IsCharacterMember || (v6 & 0x800) == 0)
  {
    v10 = a2[1];
  }
  else
  {
    v10 = a2[1];
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      v17 = 0;
    else
      v17 = v10 <= 1;
    v14 = !v17;
  }
LABEL_22:
  v18 = *a2;
  v19 = v10 + *a2;
  v20 = *(_QWORD *)(a1 + 168);
  v21 = *(_QWORD *)(a1 + 176);
  v22 = (v13 | v14) ^ 1;
  if ((v6 & 0x800) != 0)
    v22 = 0;
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v24 = *(_QWORD *)(v23 + 40);
  if (v14 || v19 >= *(_QWORD *)(v23 + 48) + v24)
  {
    *(_QWORD *)(v23 + 48) = v19 - v24;
    v25 = 1;
  }
  else
  {
    v25 = 0;
  }
  v26 = v14 | v7;
  v27 = v21 + v20;
  if (v22)
  {
    v28 = v18 - v20;
    v29 = a2[1];
    v30 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
                   + 16 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
    *v30 = v28;
    v30[1] = v29;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24)
              + 8 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))++) = a2[2];
  }
  if (v19 >= v27)
    v31 = 1;
  else
    v31 = v26;
  if ((v31 | v25) == 1)
  {
    v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 48)
        + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    v33 = a2[1] + *a2;
    v34 = *(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
    v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v46 = v33 - v32;
    if (v33 == v32)
    {
      v36 = 0;
    }
    else
    {
      v43 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 48)
          + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
      v44 = v25;
      v45 = a3;
      if (v35 < 1)
      {
LABEL_44:
        *v34 = 0;
        v36 = 1;
      }
      else
      {
        v37 = 0;
        v38 = *(_QWORD *)(a1 + 184);
        v39 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) + 8);
        v40 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) + 8);
        while (v38 > *v40 && !CFStringEncodingUnicodeToBytes())
        {
          *(v39 - 1) = 0;
          *v39 = 0;
          ++v37;
          v39 += 2;
          v40 += 2;
          if (v37 >= v35)
            goto LABEL_44;
        }
        v36 = 0;
      }
      v11 = v6 & 0x800;
      a3 = v45;
      v25 = v44;
      v32 = v43;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = v36;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = 0;
        *a3 = 1;
      }
      if (v25)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                 + 48);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48) = *(_QWORD *)(a1 + 200)
                                                                    + *(_QWORD *)(a1 + 192)
                                                                    - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                + 40);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        *a3 = 1;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v11 >> 11;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v13;
      }
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24)
      || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24))
    {
      *a3 = 1;
    }
    v41 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    *(_QWORD *)(v41 + 40) = v32;
    *(_QWORD *)(v41 + 48) = v46;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v11 >> 11;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v13;
  }
  result = *(__n128 *)a2;
  *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40) = *(_OWORD *)a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8)
                                                                           + 48)
                                                               + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8)
                                                                           + 40);
  return result;
}

@end
