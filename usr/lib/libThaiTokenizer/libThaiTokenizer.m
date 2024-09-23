CFIndex ThaiTokenizerSetStringWithRange(CFIndex result, CFStringRef str, CFRange range)
{
  _QWORD *v3;
  CFIndex v4;
  CFIndex location;
  const void *v7;
  const __CFAllocator *v8;
  const __CFString *v9;
  CFIndex Length;
  const void *v11;
  const void *v12;
  const __CFArray *Mutable;
  CFIndex v14;
  const __CFString *v15;
  unsigned int CharacterAtIndex;
  int v17;
  BOOL v18;
  CFIndex v19;
  unsigned int v20;
  int v21;
  BOOL v22;
  CFNumberRef v23;
  CFIndex v24;
  const void *v25;
  const __CFString *v26;
  int64_t v27;
  uint64_t v28;
  void *v29;
  CFIndex v30;
  unsigned __int16 v31;
  int v32;
  unsigned __int16 v33;
  unint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void **v42;
  void *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  float v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v75;
  uint64_t v76;
  float UnkProb;
  uint64_t v78;
  _QWORD *v79;
  __CFArray *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  BOOL v86;
  BOOL v87;
  CFNumberRef v88;
  __CFArray *v89;
  int v90;
  CFIndex valuePtr;
  uint64_t v93;
  CFRange v94;
  CFRange v95;
  CFRange v96;

  v3 = (_QWORD *)result;
  if (str && (v4 = range.length) != 0)
  {
    location = range.location;
    v7 = *(const void **)(result + 8);
    if (v7)
      CFRelease(v7);
    v3[2] = location;
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v94.location = location;
    v94.length = v4;
    v9 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x24BDBD240], str, v94);
    v3[1] = v9;
    Length = CFStringGetLength(v9);
    v3[7] = Length;
    valuePtr = 0;
    v11 = (const void *)v3[3];
    if (v11)
      CFRelease(v11);
    v12 = (const void *)v3[4];
    if (v12)
      CFRelease(v12);
    Mutable = CFArrayCreateMutable(v8, 0, MEMORY[0x24BDBD690]);
    v3[4] = Mutable;
    if (Length >= 1)
    {
      v14 = 0;
      while (1)
      {
        v15 = (const __CFString *)v3[1];
        CharacterAtIndex = CFStringGetCharacterAtIndex(v15, v14);
        v17 = 1;
        if (CharacterAtIndex - 3648 < 0xE)
          goto LABEL_24;
        v18 = (unsigned __int16)(CharacterAtIndex - 3585) >= 0x2Eu
           && (unsigned __int16)(CharacterAtIndex - 3632) >= 0xBu;
        if (!v18)
          goto LABEL_24;
        if (CharacterAtIndex > 0x20 || ((1 << CharacterAtIndex) & 0x100003E00) == 0)
        {
          if (CharacterAtIndex == 3631)
          {
            v19 = v14 + 1;
            if (v14 + 2 < Length)
            {
              v90 = CFStringGetCharacterAtIndex(v15, v14 + 1);
              if (CFStringGetCharacterAtIndex(v15, v14 + 2) == 3631 && v90 == 3621)
                v19 = v14 + 3;
            }
            goto LABEL_31;
          }
          if (CharacterAtIndex != 160 && !isPunct(CharacterAtIndex))
          {
            v17 = 16;
LABEL_24:
            v19 = v14 + 1;
            if (v14 + 1 < Length)
            {
              while (1)
              {
                v20 = CFStringGetCharacterAtIndex(v15, v19);
                if (v20 != 46 && v17 != getChunkType(v20))
                  break;
                if (Length == ++v19)
                {
                  v19 = Length;
                  break;
                }
              }
            }
            if (v19 >= Length)
              v19 = Length;
            goto LABEL_31;
          }
        }
        v19 = v14 + 1;
LABEL_31:
        valuePtr = v19;
        v21 = CFStringGetCharacterAtIndex((CFStringRef)v3[1], v14);
        if ((v21 - 3648) >= 0xE
          && ((v21 - 3585) >= 0x2E ? (v22 = (v21 - 3632) > 0xA) : (v22 = 0), v22))
        {
          v23 = CFNumberCreate(v8, kCFNumberCFIndexType, &valuePtr);
          CFArrayAppendValue((CFMutableArrayRef)v3[4], v23);
          CFRelease(v23);
        }
        else
        {
          v24 = valuePtr;
          v25 = (const void *)v3[11];
          if (v25)
            CFRelease(v25);
          v95.length = v24 - v14;
          v95.location = v14;
          v26 = CFStringCreateWithSubstring(v8, (CFStringRef)v3[1], v95);
          v3[11] = v26;
          v27 = CFStringGetLength(v26);
          v3[12] = v27;
          v3[14] = v14;
          v28 = (unint64_t)v27 >> 1;
          if (v27 < 100)
            v28 = 50;
          v3[9] = v28;
          v29 = malloc_type_calloc(v27, 8uLL, 0x2004093837F09uLL);
          v3[8] = v29;
          if (v29 && (uint64_t)v3[12] > 1)
          {
            v30 = 0;
            v31 = 3585;
            do
            {
              v32 = CFStringGetCharacterAtIndex((CFStringRef)v3[11], v30);
              v33 = v32;
              if ((v32 == 46
                 || v32 == 3654
                 || (unsigned __int16)(v32 - 3631) > 0xFFD1u
                 || (unsigned __int16)(v32 - 3653) >= 0xFFFBu)
                && isThaiEndingChar(v31))
              {
                if (v30 + 1 < v3[12])
                {
                  v34 = 2;
                  do
                  {
                    v35 = CFStringGetCharacterAtIndex((CFStringRef)v3[11], v34 - 1 + v30);
                    if (isThaiEndingChar(v35))
                    {
                      if ((uint64_t)(v34 - 1 + v30) >= v3[12] - 1
                        || (v36 = CFStringGetCharacterAtIndex((CFStringRef)v3[11], v30 + v34), v36 == 46)
                        || v36 == 3654
                        || (v36 - 3631) > 0xFFFFFFD1
                        || (v36 - 3653) >= 0xFFFFFFFB)
                      {
                        LODWORD(v93) = 0;
                        if ((int64_t)(v34 - 1) >= v3[12])
                          break;
                        if ((*(unsigned int (**)(_QWORD, _QWORD, CFIndex, unint64_t, uint64_t *))(*(_QWORD *)*v3 + 24))(*v3, v3[11], v30, v34, &v93))
                        {
                          v37 = *(_QWORD *)(v3[8] + 8 * v30);
                          if (v37)
                          {
                            v38 = *(_QWORD *)(v37 + 184);
                          }
                          else
                          {
                            v39 = malloc_type_malloc(0xC0uLL, 0x1000040DEF5506FuLL);
                            v38 = 0;
                            *(_QWORD *)(v3[8] + 8 * v30) = v39;
                            v37 = *(_QWORD *)(v3[8] + 8 * v30);
                            *(_QWORD *)(v37 + 160) = 0;
                            *(_QWORD *)(v37 + 176) = 0;
                            *(_QWORD *)(v37 + 184) = 0;
                            *(_DWORD *)(v37 + 168) = -915135488;
                            *(_BYTE *)(v37 + 172) = 0;
                            ++v3[9];
                          }
                          v40 = v37 + 16 * v38;
                          *(_DWORD *)(v40 + 8) = v93;
                          *(_QWORD *)v40 = v30 + v34;
                          *(_QWORD *)(v37 + 184) = v38 + 1;
                          if (v38 >= 9)
                            break;
                        }
                      }
                    }
                    if ((int64_t)(v30 + v34) >= v3[12])
                      break;
                    v18 = v34++ >= 0x65;
                  }
                  while (!v18);
                }
              }
              else
              {
                v41 = *(void **)(v3[8] + 8 * v30);
                if (v41)
                {
                  free(v41);
                  *(_QWORD *)(v3[8] + 8 * v30) = 0;
                }
              }
              ++v30;
              v31 = v33;
            }
            while (v30 < v3[12] - 1);
          }
          v43 = (void *)v3[9];
          v42 = (void **)v3[10];
          *v42 = malloc_type_malloc(8 * (_QWORD)v43, 0x100004000313F17uLL);
          v42[1] = v43;
          v42[2] = 0;
          if ((uint64_t)v3[12] >= 1)
          {
            v44 = 0;
            do
            {
              v45 = (uint64_t *)v3[10];
              v46 = v45[2];
              if (v46 < v45[1])
              {
                v47 = *v45;
                v45[2] = v46 + 1;
                *(_QWORD *)(v47 + 8 * v46) = v44;
              }
              v48 = v3[8];
              v49 = *(_QWORD *)(v48 + 8 * v44);
              if (v49)
              {
                v50 = *(_QWORD *)(v49 + 184);
                v51 = v50 - 1;
                if (v50 <= 1)
                  v51 = *(_QWORD *)(v49 + 176);
                else
                  *(_QWORD *)(v49 + 176) = v51;
                v53 = *(_QWORD *)(v49 + 16 * v51);
                v55 = v3[12];
                if (v53 == v55)
                {
                  *(_QWORD *)(v49 + 160) = v53;
                  *(_DWORD *)(v49 + 168) = *(_DWORD *)(v49 + 16 * v51 + 8);
                  if (v50 == 1)
                    *(_BYTE *)(v49 + 172) = 1;
                  else
                    *(_QWORD *)(v49 + 176) = v51 - 1;
                  break;
                }
              }
              else
              {
                v52 = v3[12];
                v53 = v44;
                if (v44 < v52)
                {
                  v53 = v44;
                  while (!*(_QWORD *)(v48 + 8 * v53))
                  {
                    if (v52 == ++v53)
                    {
                      v53 = v3[12];
                      break;
                    }
                  }
                }
                *(_QWORD *)(v3[8] + 8 * v44) = malloc_type_malloc(0xC0uLL, 0x1000040DEF5506FuLL);
                v54 = *(_QWORD *)(v3[8] + 8 * v44);
                *(_OWORD *)(v54 + 176) = xmmword_23094FB70;
                *(_QWORD *)(v54 + 160) = 0;
                *(_DWORD *)(v54 + 168) = -915135488;
                *(_BYTE *)(v54 + 172) = 0;
                *(_QWORD *)v54 = v53;
                *(float *)(*(_QWORD *)(v3[8] + 8 * v44) + 8) = getUnkProb((const __CFString *)v3[1], v3[7], v3[14] + v44, v53 - v44);
                v55 = v3[12];
              }
              v44 = v53;
            }
            while (v53 < v55);
          }
          v56 = v3[10];
          v58 = (_QWORD *)(v56 + 16);
          v57 = *(_QWORD *)(v56 + 16);
          if (v57 >= 1)
          {
            v59 = v3[8];
            do
            {
              v60 = *(_QWORD **)v56;
              v61 = *(_QWORD *)(v59 + 8 * *(_QWORD *)(*(_QWORD *)v56 + 8 * (v57 - 1)));
              if (*(_BYTE *)(v61 + 172))
              {
                *v58 = v57 - 1;
              }
              else
              {
                v62 = *(_QWORD *)(v61 + 176);
                v63 = *(_QWORD *)(v61 + 16 * v62);
                v64 = v3[12];
                if (v63 < v64 && !*(_QWORD *)(v59 + 8 * v63))
                {
                  *(_QWORD *)(v3[8] + 8 * v63) = malloc_type_malloc(0xC0uLL, 0x1000040DEF5506FuLL);
                  v67 = v3[8];
                  v68 = *(_QWORD *)(v67 + 8 * v63);
                  *(_OWORD *)(v68 + 176) = xmmword_23094FB70;
                  *(_QWORD *)(v68 + 160) = 0;
                  *(_DWORD *)(v68 + 168) = -915135488;
                  *(_BYTE *)(v68 + 172) = 0;
                  v69 = v3[12];
                  if (v69 <= v63 + 1)
                    v70 = v63 + 1;
                  else
                    v70 = v3[12];
                  v71 = v67 + 8;
                  v72 = v63;
                  while (1)
                  {
                    v73 = v72 + 1;
                    if (v72 + 1 >= v69)
                      break;
                    if (*(_QWORD *)(v71 + 8 * v72++))
                      goto LABEL_120;
                  }
                  v73 = v70;
LABEL_120:
                  *(_QWORD *)v68 = v73;
                  UnkProb = getUnkProb((const __CFString *)v3[1], v3[7], v3[14] + v63, v73 - v63);
                  v59 = v3[8];
                  *(float *)(*(_QWORD *)(v59 + 8 * v63) + 8) = UnkProb;
                  v56 = v3[10];
                  v78 = *(_QWORD *)(v56 + 16);
                  if (v78 < *(_QWORD *)(v56 + 8))
                  {
                    v79 = *(_QWORD **)v56;
                    *(_QWORD *)(v56 + 16) = v78 + 1;
                    v79[v78] = v63;
                  }
                  goto LABEL_95;
                }
                if (v63 == v64)
                {
                  v65 = *(float *)(v61 + 16 * v62 + 8);
                }
                else
                {
                  v66 = *(_QWORD *)(v59 + 8 * v63);
                  if (!*(_BYTE *)(v66 + 172))
                  {
                    if (v57 < *(_QWORD *)(v56 + 8))
                    {
                      *v58 = v57 + 1;
                      v60[v57] = v63;
                    }
                    v75 = *(_QWORD *)(v66 + 184);
                    v22 = v75 <= 1;
                    v76 = v75 - 1;
                    if (!v22)
                      *(_QWORD *)(v66 + 176) = v76;
                    goto LABEL_95;
                  }
                  v65 = *(float *)(v61 + 16 * v62 + 8) + *(float *)(v66 + 168);
                }
                if (v65 > *(float *)(v61 + 168))
                {
                  *(float *)(v61 + 168) = v65;
                  *(_QWORD *)(v61 + 160) = v63;
                }
                if (v62 < 1)
                  *(_BYTE *)(v61 + 172) = 1;
                else
                  *(_QWORD *)(v61 + 176) = v62 - 1;
              }
LABEL_95:
              v58 = (_QWORD *)(v56 + 16);
              v57 = *(_QWORD *)(v56 + 16);
            }
            while (v57 >= 1);
          }
          if (*(_QWORD *)v56)
            free(*(void **)v56);
          *v58 = 0;
          v80 = CFArrayCreateMutable(v8, 0, MEMORY[0x24BDBD690]);
          v81 = v3[12];
          if (v81 >= 1)
          {
            v82 = 0;
            v93 = 0;
            while (1)
            {
              v83 = v3[8];
              v84 = *(_QWORD *)(*(_QWORD *)(v83 + 8 * v82) + 160);
              if (v84 - v82 == 1)
                break;
              v86 = v84 < 1 || v81 <= v84;
              if (!v86 && CFStringGetCharacterAtIndex((CFStringRef)v3[11], v84 - 1) == 46)
              {
                v83 = v3[8];
                v85 = *(_QWORD *)(*(_QWORD *)(v83 + 8 * v82) + 160);
                v81 = v3[12];
                goto LABEL_134;
              }
LABEL_141:
              v93 = v3[14] + v84;
              v88 = CFNumberCreate(v8, kCFNumberCFIndexType, &v93);
              CFArrayAppendValue(v80, v88);
              CFRelease(v88);
              v81 = v3[12];
              v82 = v84;
              if (v84 >= v81)
                goto LABEL_142;
            }
            v85 = *(_QWORD *)(*(_QWORD *)(v83 + 8 * v82) + 160);
LABEL_134:
            if (v85 >= v81
              || ((v84 = *(_QWORD *)(*(_QWORD *)(v83 + 8 * v85) + 160), v84 >= 1) ? (v87 = v81 <= v84) : (v87 = 1),
                  v87 || CFStringGetCharacterAtIndex((CFStringRef)v3[11], v84 - 1) != 46))
            {
              v84 = v85;
            }
            goto LABEL_141;
          }
LABEL_142:
          v89 = (__CFArray *)v3[4];
          v96.length = CFArrayGetCount(v80);
          v96.location = 0;
          CFArrayAppendArray(v89, v80, v96);
          CFRelease(v80);
          ReleaseTransitionTable((uint64_t)v3);
        }
        v14 = valuePtr;
        if (valuePtr >= Length)
        {
          Mutable = (const __CFArray *)v3[4];
          break;
        }
      }
    }
    result = CFArrayGetCount(Mutable);
    v3[5] = -1;
    v3[6] = result;
  }
  else
  {
    *(_QWORD *)(result + 56) = 0;
  }
  return result;
}

Utils::MarisaTrieWrapper **ThaiTokenizerCreate(const __CFAllocator *a1, unsigned int a2)
{
  Utils::MarisaTrieWrapper **v4;
  Utils::MarisaTrieWrapper **v5;
  uint64_t v6;
  char *v7;
  const __CFAllocator *v8;
  const char *v9;
  Utils::MarisaTrieWrapper *v10;
  const __CFString *v11;
  const __CFString *v12;
  Utils::MarisaTrieWrapper *v13;
  Utils::MarisaTrieWrapper *v14;
  const __CFString *v15;
  Utils::MarisaTrieWrapper *v17[2];

  v4 = (Utils::MarisaTrieWrapper **)CFAllocatorAllocate(a1, 128, 0);
  v5 = v4;
  if (!v4)
    return v5;
  *((_OWORD *)v4 + 5) = 0u;
  *((_OWORD *)v4 + 6) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *(_OWORD *)v4 = 0u;
  v4[14] = 0;
  v4[15] = a1;
  if (a2 <= 0x7D0)
    v6 = 2000;
  else
    v6 = a2;
  v4[13] = (Utils::MarisaTrieWrapper *)v6;
  v7 = getenv("THAI_TOK_ROOT");
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (v7)
    v9 = v7;
  else
    v9 = "/";
  v10 = (Utils::MarisaTrieWrapper *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v9, 0x8000100u);
  v17[1] = v10;
  v11 = CFStringCreateWithFormat(v8, 0, CFSTR("%@/System/Library/LinguisticData/th/tokenizer.dat"), v10);
  v12 = v11;
  if (!v11)
  {
    v15 = CFSTR("Problem in setting triePath\n");
    goto LABEL_18;
  }
  Utils::TrieWrapper::loadTrie(v11, v17);
  v13 = *v5;
  *v5 = v17[0];
  if (v13)
    (*(void (**)(Utils::MarisaTrieWrapper *))(*(_QWORD *)v13 + 8))(v13);
  CFRelease(v12);
  if (!*v5 || ((*(uint64_t (**)(Utils::MarisaTrieWrapper *))(*(_QWORD *)*v5 + 16))(*v5) & 1) == 0)
  {
    v15 = CFSTR("Loading trie fail\n");
LABEL_18:
    CFShow(v15);
    goto LABEL_19;
  }
  v14 = (Utils::MarisaTrieWrapper *)malloc_type_malloc(0x18uLL, 0x1010040113C0ABBuLL);
  v5[10] = v14;
  if (v14)
  {
    if (v10)
      CFRelease(v10);
    return v5;
  }
LABEL_19:
  ThaiTokenizerDestroy((uint64_t)v5);
  if (v10)
    CFRelease(v10);
  return 0;
}

void sub_23094AE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t ThaiTokenizerDestroy(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  void *v7;

  v2 = *(_QWORD *)a1;
  if (v2)
  {
    *(_QWORD *)a1 = 0;
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  }
  ReleaseTransitionTable(a1);
  v3 = *(const void **)(a1 + 8);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 24);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 32);
  if (v5)
    CFRelease(v5);
  v6 = *(const void **)(a1 + 88);
  if (v6)
    CFRelease(v6);
  v7 = *(void **)(a1 + 80);
  if (v7)
    free(v7);
  CFAllocatorDeallocate(*(CFAllocatorRef *)(a1 + 120), (void *)a1);
  return 1;
}

double marisa::Agent::Agent(marisa::Agent *this)
{
  double result;

  result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  return result;
}

void marisa::Agent::~Agent(marisa::Agent *this)
{
  marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((_QWORD *)this + 5);
}

_QWORD *marisa::Agent::set_query(_QWORD *this, const char *a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *exception;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc";
    exception[2] = 0x200000015;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc:21: MARISA_NULL_ERROR: (ptr == NULL)"
                   " && (length != 0)";
  }
  v3 = this[5];
  if (v3)
    *(_DWORD *)(v3 + 108) = 0;
  *this = a2;
  this[1] = a3;
  return this;
}

_QWORD *marisa::Agent::init_state(marisa::Agent *this)
{
  uint64_t *v1;
  _OWORD *v2;
  _QWORD *result;
  _QWORD *exception;
  const char *v5;

  v1 = (uint64_t *)((char *)this + 40);
  if (*((_QWORD *)this + 5))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc";
    exception[2] = 0x100000024;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc:36: MARISA_STATE_ERROR: state_.get() != NULL";
    goto LABEL_8;
  }
  v2 = operator new(0x70uLL, MEMORY[0x24BEDB6B8]);
  if (v2)
  {
    *(_OWORD *)((char *)v2 + 25) = 0u;
    *v2 = 0u;
    v2[1] = 0u;
    v2[3] = 0u;
    v2[4] = 0u;
    *(_OWORD *)((char *)v2 + 73) = 0u;
    *((_QWORD *)v2 + 12) = 0;
    *((_QWORD *)v2 + 13) = 0;
  }
  result = marisa::scoped_ptr<marisa::grimoire::trie::State>::reset(v1, (uint64_t)v2);
  if (!*v1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc";
    exception[2] = 0x800000026;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc:38: MARISA_MEMORY_ERROR: state_.get() == NULL";
LABEL_8:
    exception[3] = v5;
  }
  return result;
}

_QWORD *marisa::scoped_ptr<marisa::grimoire::trie::State>::reset(uint64_t *a1, uint64_t a2)
{
  _QWORD *exception;
  uint64_t v4;

  if (a2 && *a1 == a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/include/marisa/scoped-ptr.h";
    exception[2] = 0x600000013;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/include/marisa/scoped-ptr.h:19: MARISA_RESET_ERROR: (ptr"
                   " != NULL) && (ptr == ptr_)";
  }
  v4 = *a1;
  *a1 = a2;
  return marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr(&v4);
}

void marisa::Exception::~Exception(std::exception *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x2348BCE64);
}

uint64_t marisa::Exception::what(marisa::Exception *this)
{
  return *((_QWORD *)this + 3);
}

_QWORD *marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)*a1;
  if (*a1)
  {
    v3 = v2[6];
    if (v3)
      MEMORY[0x2348BCE40](v3, 0x1000C8077774924);
    if (*v2)
      MEMORY[0x2348BCE40](*v2, 0x1000C8077774924);
    MEMORY[0x2348BCE64](v2, 0x1070C406A3FAA47);
  }
  return a1;
}

uint64_t marisa::grimoire::io::Mapper::Mapper(uint64_t this)
{
  *(_QWORD *)this = 0;
  *(_QWORD *)(this + 8) = -1;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_DWORD *)(this + 32) = -1;
  return this;
}

void marisa::grimoire::io::Mapper::~Mapper(marisa::grimoire::io::Mapper *this)
{
  void *v2;
  int v3;

  v2 = (void *)*((_QWORD *)this + 1);
  if (v2 != (void *)-1)
    munmap(v2, *((_QWORD *)this + 3));
  v3 = *((_DWORD *)this + 8);
  if (v3 != -1)
    close(v3);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t *marisa::grimoire::io::Mapper::swap(uint64_t *this, marisa::grimoire::io::Mapper *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *this;
  *this = *(_QWORD *)a2;
  *(_QWORD *)a2 = v2;
  v4 = this[1];
  v3 = this[2];
  v5 = *((_QWORD *)a2 + 2);
  this[1] = *((_QWORD *)a2 + 1);
  this[2] = v5;
  *((_QWORD *)a2 + 1) = v4;
  *((_QWORD *)a2 + 2) = v3;
  v6 = this[3];
  this[3] = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v6;
  LODWORD(v6) = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v6;
  return this;
}

__n128 marisa::grimoire::io::Mapper::open(marisa::grimoire::io::Mapper *this, const void *a2, uint64_t a3)
{
  __int128 v3;
  __int128 v4;
  int v5;
  __n128 result;
  _QWORD *exception;
  _OWORD v8[2];
  int v9;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x20000003FLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:63: MARISA_NULL_ERROR: "
                   "(ptr == NULL) && (size != 0)";
  }
  v3 = *(_OWORD *)this;
  v4 = *((_OWORD *)this + 1);
  *(_QWORD *)this = a2;
  *((_QWORD *)this + 1) = -1;
  *((_QWORD *)this + 2) = a3;
  *((_QWORD *)this + 3) = 0;
  v8[0] = v3;
  v8[1] = v4;
  v5 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = -1;
  v9 = v5;
  marisa::grimoire::io::Mapper::~Mapper((marisa::grimoire::io::Mapper *)v8);
  return result;
}

uint64_t marisa::grimoire::io::Mapper::seek(marisa::grimoire::io::Mapper *this, unint64_t a2)
{
  _QWORD *exception;
  const char *v4;

  if (!*(_QWORD *)this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x100000047;
    v4 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:71: MARISA_STATE_ERROR: !is_open()";
    goto LABEL_6;
  }
  if (*((_QWORD *)this + 2) < a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x900000048;
    v4 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:72: MARISA_IO_ERROR: size > avail_";
LABEL_6:
    exception[3] = v4;
  }
  return marisa::grimoire::io::Mapper::map_data(this, a2);
}

uint64_t marisa::grimoire::io::Mapper::map_data(marisa::grimoire::io::Mapper *this, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  unint64_t v5;
  _QWORD *exception;
  const char *v8;

  v2 = *(_QWORD *)this;
  if (!*(_QWORD *)this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x100000063;
    v8 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:99: MARISA_STATE_ERROR: !is_open()";
LABEL_6:
    exception[3] = v8;
  }
  v3 = *((_QWORD *)this + 2);
  v4 = v3 >= a2;
  v5 = v3 - a2;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x900000064;
    v8 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:100: MARISA_IO_ERROR: size > avail_";
    goto LABEL_6;
  }
  *(_QWORD *)this = v2 + a2;
  *((_QWORD *)this + 2) = v5;
  return v2;
}

marisa::grimoire::trie::LoudsTrie *marisa::grimoire::trie::LoudsTrie::LoudsTrie(marisa::grimoire::trie::LoudsTrie *this)
{
  *(_OWORD *)((char *)this + 25) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 137) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *(_OWORD *)((char *)this + 185) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *(_OWORD *)((char *)this + 89) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *(_OWORD *)((char *)this + 233) = 0u;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *(_OWORD *)((char *)this + 345) = 0u;
  *(_OWORD *)((char *)this + 393) = 0u;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 297) = 0u;
  *((_OWORD *)this + 17) = 0u;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *(_OWORD *)((char *)this + 441) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 27) = 0u;
  *(_OWORD *)((char *)this + 553) = 0u;
  *((_OWORD *)this + 33) = 0u;
  *((_OWORD *)this + 34) = 0u;
  *(_OWORD *)((char *)this + 601) = 0u;
  *((_OWORD *)this + 36) = 0u;
  *((_OWORD *)this + 37) = 0u;
  *(_OWORD *)((char *)this + 505) = 0u;
  *((_OWORD *)this + 30) = 0u;
  *((_OWORD *)this + 31) = 0u;
  *((_OWORD *)this + 29) = 0u;
  *(_OWORD *)((char *)this + 649) = 0u;
  *((_OWORD *)this + 39) = 0u;
  *((_OWORD *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 697) = 0u;
  *((_OWORD *)this + 42) = 0u;
  *((_OWORD *)this + 43) = 0u;
  *((_QWORD *)this + 90) = 0;
  *((_DWORD *)this + 182) = 0;
  *((_QWORD *)this + 92) = 0;
  marisa::grimoire::trie::Tail::Tail((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744));
  *((_BYTE *)this + 1048) = 0;
  *(_OWORD *)((char *)this + 1016) = 0u;
  *(_OWORD *)((char *)this + 1032) = 0u;
  *(_OWORD *)((char *)this + 1000) = 0u;
  *((_OWORD *)this + 66) = 0u;
  *((_QWORD *)this + 134) = 3;
  *((_QWORD *)this + 135) = 0x100000000200;
  *((_DWORD *)this + 272) = 0x20000;
  marisa::grimoire::io::Mapper::Mapper((uint64_t)this + 1096);
  return this;
}

void sub_23094B570(_Unwind_Exception *a1)
{
  marisa::grimoire::vector::BitVector *v1;
  marisa::grimoire::vector::BitVector *v2;
  marisa::grimoire::vector::BitVector *v3;
  marisa::grimoire::trie::Tail *v4;
  marisa::grimoire::trie::LoudsTrie **v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v9;

  v9 = *((_QWORD *)v1 + 126);
  if (v9)
    MEMORY[0x2348BCE40](v9, 0x1000C8077774924);
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(v5);
  marisa::grimoire::trie::Tail::~Tail(v4);
  if (*v7)
    MEMORY[0x2348BCE40](*v7, 0x1000C8077774924);
  if (*v6)
    MEMORY[0x2348BCE40](*v6, 0x1000C8077774924);
  marisa::grimoire::vector::BitVector::~BitVector(v3);
  marisa::grimoire::vector::BitVector::~BitVector(v2);
  marisa::grimoire::vector::BitVector::~BitVector(v1);
  _Unwind_Resume(a1);
}

void marisa::grimoire::trie::Tail::~Tail(marisa::grimoire::trie::Tail *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *((_QWORD *)this + 26);
  if (v2)
    MEMORY[0x2348BCE40](v2, 0x1000C8077774924);
  v3 = *((_QWORD *)this + 20);
  if (v3)
    MEMORY[0x2348BCE40](v3, 0x1000C8077774924);
  v4 = *((_QWORD *)this + 14);
  if (v4)
    MEMORY[0x2348BCE40](v4, 0x1000C8077774924);
  v5 = *((_QWORD *)this + 6);
  if (v5)
    MEMORY[0x2348BCE40](v5, 0x1000C8077774924);
  if (*(_QWORD *)this)
    MEMORY[0x2348BCE40](*(_QWORD *)this, 0x1000C8077774924);
}

void marisa::grimoire::vector::BitVector::~BitVector(marisa::grimoire::vector::BitVector *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *((_QWORD *)this + 20);
  if (v2)
    MEMORY[0x2348BCE40](v2, 0x1000C8077774924);
  v3 = *((_QWORD *)this + 14);
  if (v3)
    MEMORY[0x2348BCE40](v3, 0x1000C8077774924);
  v4 = *((_QWORD *)this + 8);
  if (v4)
    MEMORY[0x2348BCE40](v4, 0x1000C8077774924);
  if (*(_QWORD *)this)
    MEMORY[0x2348BCE40](*(_QWORD *)this, 0x1000C8077774924);
}

void marisa::grimoire::trie::LoudsTrie::~LoudsTrie(marisa::grimoire::trie::LoudsTrie *this)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  marisa::grimoire::io::Mapper::~Mapper((marisa::grimoire::trie::LoudsTrie *)((char *)this + 1096));
  v2 = *((_QWORD *)this + 126);
  if (v2)
    MEMORY[0x2348BCE40](v2, 0x1000C8077774924);
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((marisa::grimoire::trie::LoudsTrie **)this + 125);
  v3 = *((_QWORD *)this + 119);
  if (v3)
    MEMORY[0x2348BCE40](v3, 0x1000C8077774924);
  v4 = *((_QWORD *)this + 113);
  if (v4)
    MEMORY[0x2348BCE40](v4, 0x1000C8077774924);
  v5 = *((_QWORD *)this + 107);
  if (v5)
    MEMORY[0x2348BCE40](v5, 0x1000C8077774924);
  v6 = *((_QWORD *)this + 99);
  if (v6)
    MEMORY[0x2348BCE40](v6, 0x1000C8077774924);
  v7 = *((_QWORD *)this + 93);
  if (v7)
    MEMORY[0x2348BCE40](v7, 0x1000C8077774924);
  v8 = *((_QWORD *)this + 84);
  if (v8)
    MEMORY[0x2348BCE40](v8, 0x1000C8077774924);
  v9 = *((_QWORD *)this + 78);
  if (v9)
    MEMORY[0x2348BCE40](v9, 0x1000C8077774924);
  v10 = *((_QWORD *)this + 72);
  if (v10)
    MEMORY[0x2348BCE40](v10, 0x1000C8077774924);
  v11 = *((_QWORD *)this + 66);
  if (v11)
    MEMORY[0x2348BCE40](v11, 0x1000C8077774924);
  v12 = *((_QWORD *)this + 60);
  if (v12)
    MEMORY[0x2348BCE40](v12, 0x1000C8077774924);
  v13 = *((_QWORD *)this + 52);
  if (v13)
    MEMORY[0x2348BCE40](v13, 0x1000C8077774924);
  v14 = *((_QWORD *)this + 46);
  if (v14)
    MEMORY[0x2348BCE40](v14, 0x1000C8077774924);
  v15 = *((_QWORD *)this + 40);
  if (v15)
    MEMORY[0x2348BCE40](v15, 0x1000C8077774924);
  v16 = *((_QWORD *)this + 34);
  if (v16)
    MEMORY[0x2348BCE40](v16, 0x1000C8077774924);
  v17 = *((_QWORD *)this + 26);
  if (v17)
    MEMORY[0x2348BCE40](v17, 0x1000C8077774924);
  v18 = *((_QWORD *)this + 20);
  if (v18)
    MEMORY[0x2348BCE40](v18, 0x1000C8077774924);
  v19 = *((_QWORD *)this + 14);
  if (v19)
    MEMORY[0x2348BCE40](v19, 0x1000C8077774924);
  v20 = *((_QWORD *)this + 8);
  if (v20)
    MEMORY[0x2348BCE40](v20, 0x1000C8077774924);
  if (*(_QWORD *)this)
    MEMORY[0x2348BCE40](*(_QWORD *)this, 0x1000C8077774924);
}

uint64_t *marisa::grimoire::trie::LoudsTrie::swap(marisa::grimoire::trie::LoudsTrie *this, marisa::grimoire::trie::LoudsTrie *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  marisa::grimoire::vector::BitVector::swap(this, a2);
  marisa::grimoire::vector::BitVector::swap((marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), (marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 208));
  marisa::grimoire::vector::BitVector::swap((marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), (marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 416));
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 78, (uint64_t *)a2 + 78);
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 84, (uint64_t *)a2 + 84);
  v4 = *((_QWORD *)this + 90);
  *((_QWORD *)this + 90) = *((_QWORD *)a2 + 90);
  *((_QWORD *)a2 + 90) = v4;
  LODWORD(v4) = *((_DWORD *)this + 182);
  *((_DWORD *)this + 182) = *((_DWORD *)a2 + 182);
  *((_DWORD *)a2 + 182) = v4;
  v5 = *((_QWORD *)this + 92);
  *((_QWORD *)this + 92) = *((_QWORD *)a2 + 92);
  *((_QWORD *)a2 + 92) = v5;
  marisa::grimoire::trie::Tail::swap((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), (marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 744));
  v6 = *((_QWORD *)this + 125);
  *((_QWORD *)this + 125) = *((_QWORD *)a2 + 125);
  *((_QWORD *)a2 + 125) = v6;
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 126, (uint64_t *)a2 + 126);
  v7 = *((_QWORD *)this + 132);
  *((_QWORD *)this + 132) = *((_QWORD *)a2 + 132);
  *((_QWORD *)a2 + 132) = v7;
  v8 = *((_QWORD *)this + 133);
  *((_QWORD *)this + 133) = *((_QWORD *)a2 + 133);
  *((_QWORD *)a2 + 133) = v8;
  v9 = *((_QWORD *)this + 134);
  *((_QWORD *)this + 134) = *((_QWORD *)a2 + 134);
  *((_QWORD *)a2 + 134) = v9;
  v10 = *((_QWORD *)this + 135);
  *((_QWORD *)this + 135) = *((_QWORD *)a2 + 135);
  *((_QWORD *)a2 + 135) = v10;
  LODWORD(v9) = *((_DWORD *)this + 272);
  *((_DWORD *)this + 272) = *((_DWORD *)a2 + 272);
  *((_DWORD *)a2 + 272) = v9;
  return marisa::grimoire::io::Mapper::swap((uint64_t *)this + 137, (marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 1096));
}

void marisa::grimoire::trie::LoudsTrie::map(marisa::grimoire::trie::LoudsTrie *this, marisa::grimoire::io::Mapper *a2)
{
  _BYTE v4[1096];
  uint64_t v5[5];

  marisa::grimoire::trie::Header::map((marisa::grimoire::trie::Header *)v4, a2);
  marisa::grimoire::trie::LoudsTrie::LoudsTrie((marisa::grimoire::trie::LoudsTrie *)v4);
  marisa::grimoire::trie::LoudsTrie::map_((marisa::grimoire::trie::LoudsTrie *)v4, a2);
  marisa::grimoire::io::Mapper::swap(v5, a2);
  marisa::grimoire::trie::LoudsTrie::swap(this, (marisa::grimoire::trie::LoudsTrie *)v4);
  marisa::grimoire::trie::LoudsTrie::~LoudsTrie((marisa::grimoire::trie::LoudsTrie *)v4);
}

void sub_23094BB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  marisa::grimoire::trie::LoudsTrie::~LoudsTrie((marisa::grimoire::trie::LoudsTrie *)&a9);
  _Unwind_Resume(a1);
}

_BYTE *marisa::grimoire::trie::Header::map(marisa::grimoire::trie::Header *this, marisa::grimoire::io::Mapper *a2)
{
  _BYTE *result;
  uint64_t v3;
  int v4;
  int v5;
  _QWORD *exception;

  result = (_BYTE *)marisa::grimoire::io::Mapper::map_data(a2, 0x10uLL);
  if (*result != 87)
    goto LABEL_7;
  v3 = 1u;
  do
  {
    if (v3 == 16)
      return result;
    v4 = result[v3];
    v5 = marisa::grimoire::trie::Header::get_header(void)::buf[v3++];
  }
  while (v4 == v5);
  if ((unint64_t)(v3 - 2) <= 0xE)
  {
LABEL_7:
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/header.h";
    exception[2] = 0xA00000015;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/header.h:21: MARISA_FORMAT_ERRO"
                   "R: !test_header(ptr)";
  }
  return result;
}

double marisa::grimoire::trie::LoudsTrie::map_(marisa::grimoire::trie::LoudsTrie *this, marisa::grimoire::io::Mapper *a2)
{
  marisa::grimoire::trie::LoudsTrie *v4;
  marisa::grimoire::trie::LoudsTrie *v5;
  marisa::grimoire::trie::LoudsTrie *v6;
  unsigned int v7;
  double result;
  _QWORD *exception;
  uint64_t v10;
  double v11;
  int v12;

  marisa::grimoire::vector::BitVector::map(this, a2);
  marisa::grimoire::vector::BitVector::map((marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), a2);
  marisa::grimoire::vector::BitVector::map((marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), a2);
  marisa::grimoire::vector::Vector<unsigned char>::map((__int128 *)this + 39, a2);
  marisa::grimoire::vector::FlatVector::map((marisa::grimoire::trie::LoudsTrie *)((char *)this + 672), a2);
  marisa::grimoire::trie::Tail::map((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), a2);
  if (*((_QWORD *)this + 59) && !*((_QWORD *)this + 96))
  {
    v4 = (marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x24BEDB6B8]);
    v5 = v4;
    if (v4)
      marisa::grimoire::trie::LoudsTrie::LoudsTrie(v4);
    marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::reset((marisa::grimoire::trie::LoudsTrie **)this + 125, v5);
    v6 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
    if (!v6)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &off_24FECE6A0;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc";
      exception[2] = 0x80000021ELL;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc:542: MARISA_MEM"
                     "ORY_ERROR: next_trie_.get() == NULL";
    }
    marisa::grimoire::trie::LoudsTrie::map_(v6, a2);
  }
  marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::map((__int128 *)this + 63, a2);
  *((_QWORD *)this + 132) = *((_QWORD *)this + 129) - 1;
  *((_QWORD *)this + 133) = *(unsigned int *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  v7 = *(_DWORD *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  v10 = 3;
  *(_QWORD *)&v11 = 0x100000000200;
  v12 = 0x20000;
  marisa::grimoire::trie::Config::parse_((marisa::grimoire::trie::Config *)&v10, v7);
  *((_QWORD *)this + 134) = v10;
  result = v11;
  *((double *)this + 135) = v11;
  *((_DWORD *)this + 272) = v12;
  return result;
}

void sub_23094BD4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2348BCE58](v1, MEMORY[0x24BEDB6B8]);
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::trie::LoudsTrie::lookup(marisa::grimoire::trie::LoudsTrie *this, marisa::Agent *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *((_QWORD *)a2 + 5);
  *(_QWORD *)(v4 + 96) = 0;
  *(_DWORD *)(v4 + 108) = 0;
  while (1)
  {
    v5 = *((_QWORD *)a2 + 1);
    if (v5 <= *(unsigned int *)(v4 + 100))
      break;
    if ((marisa::grimoire::trie::LoudsTrie::find_child(this, a2) & 1) == 0)
      return 0;
  }
  v6 = *(unsigned int *)(v4 + 96);
  if (((*(_QWORD *)(*((_QWORD *)this + 28) + ((v6 >> 3) & 0x1FFFFFF8)) >> v6) & 1) != 0)
  {
    *((_QWORD *)a2 + 3) = *(_QWORD *)a2;
    *((_DWORD *)a2 + 8) = v5;
    *((_DWORD *)a2 + 9) = marisa::grimoire::vector::BitVector::rank1((marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), v6);
    return 1;
  }
  return 0;
}

uint64_t marisa::grimoire::trie::LoudsTrie::find_child(marisa::grimoire::trie::LoudsTrie *this, marisa::Agent *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  marisa::grimoire::trie::LoudsTrie *v25;
  uint64_t v26;
  marisa::grimoire::trie::LoudsTrie *v27;

  v4 = *((_QWORD *)a2 + 5);
  v5 = *(unsigned int *)(v4 + 96);
  v6 = *(unsigned int *)(v4 + 100);
  v7 = (*(unsigned __int8 *)(*(_QWORD *)a2 + v6) ^ (32 * v5) ^ v5) & *((_QWORD *)this + 132);
  v8 = *((_QWORD *)this + 128);
  if ((_DWORD)v5 != *(_DWORD *)(v8 + 12 * v7))
  {
    v10 = marisa::grimoire::vector::BitVector::select0(this, v5);
    v11 = *((_QWORD *)this + 2);
    if (((*(_QWORD *)(v11 + (((v10 + 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v10 + 1)) & 1) != 0)
    {
      v12 = v10 - *(_DWORD *)(v4 + 96);
      *(_DWORD *)(v4 + 96) = v12;
      v13 = v10 + 2;
      v14 = 0xFFFFFFFFLL;
      while (1)
      {
        v15 = v12;
        if (((*(_QWORD *)(*((_QWORD *)this + 54) + (((unint64_t)v12 >> 3) & 0x1FFFFFF8)) >> v12) & 1) != 0)
        {
          if (v14 == 0xFFFFFFFFLL)
          {
            v14 = marisa::grimoire::vector::BitVector::rank1((marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), v12);
            v15 = *(unsigned int *)(v4 + 96);
          }
          else
          {
            ++v14;
          }
          v17 = *(_DWORD *)(v4 + 100);
          v18 = *((_QWORD *)this + 90);
          v19 = (unint64_t)(v18 * v14) >> 6;
          v20 = (v18 * v14) & 0x3F;
          v21 = v20 + v18;
          v22 = *((_QWORD *)this + 86);
          v23 = *(_QWORD *)(v22 + 8 * v19) >> v20;
          if (v21 > 0x40)
            v23 |= (2 * *(_QWORD *)(v22 + 8 * v19 + 8)) << (v20 ^ 0x3Fu);
          v24 = *(unsigned __int8 *)(*((_QWORD *)this + 80) + v15) | ((*((_DWORD *)this + 182) & v23) << 8);
          v25 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
          if (v25)
          {
            if ((marisa::grimoire::trie::LoudsTrie::match_(v25, a2, v24) & 1) != 0)
              return 1;
          }
          else if ((marisa::grimoire::trie::Tail::match((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), a2, v24) & 1) != 0)
          {
            return 1;
          }
          if (*(_DWORD *)(v4 + 100) != v17)
            return 0;
          v12 = *(_DWORD *)(v4 + 96);
          v11 = *((_QWORD *)this + 2);
        }
        else
        {
          v16 = *(unsigned int *)(v4 + 100);
          if (*(unsigned __int8 *)(*((_QWORD *)this + 80) + v12) == *(unsigned __int8 *)(*(_QWORD *)a2 + v16))
          {
            *(_DWORD *)(v4 + 100) = v16 + 1;
            return 1;
          }
        }
        *(_DWORD *)(v4 + 96) = ++v12;
        v26 = *(_QWORD *)(v11 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v13;
        ++v13;
        if ((v26 & 1) == 0)
          return 0;
      }
    }
    return 0;
  }
  v9 = *(unsigned int *)(v8 + 12 * v7 + 8);
  if (v9 > 0xFFFFFEFF)
  {
    *(_DWORD *)(v4 + 100) = v6 + 1;
    goto LABEL_24;
  }
  v27 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
  if (v27)
  {
    if ((marisa::grimoire::trie::LoudsTrie::match_(v27, a2, v9) & 1) != 0)
      goto LABEL_24;
    return 0;
  }
  if ((marisa::grimoire::trie::Tail::match((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), a2, v9) & 1) == 0)
    return 0;
LABEL_24:
  *(_DWORD *)(v4 + 96) = *(_DWORD *)(*((_QWORD *)this + 128) + 12 * v7 + 4);
  return 1;
}

uint64_t *marisa::grimoire::vector::BitVector::swap(marisa::grimoire::vector::BitVector *this, marisa::grimoire::vector::BitVector *a2)
{
  uint64_t v4;
  uint64_t v5;

  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this, (uint64_t *)a2);
  v4 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = *((_QWORD *)a2 + 6);
  *((_QWORD *)a2 + 6) = v4;
  v5 = *((_QWORD *)this + 7);
  *((_QWORD *)this + 7) = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = v5;
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 8, (uint64_t *)a2 + 8);
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 14, (uint64_t *)a2 + 14);
  return marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 20, (uint64_t *)a2 + 20);
}

uint64_t *marisa::grimoire::vector::Vector<unsigned char>::swap(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *result;
  *result = *a2;
  *a2 = v2;
  v3 = result[1];
  result[1] = a2[1];
  a2[1] = v3;
  v4 = result[2];
  v5 = result[3];
  v6 = a2[3];
  result[2] = a2[2];
  result[3] = v6;
  a2[2] = v4;
  a2[3] = v5;
  v7 = result[4];
  result[4] = a2[4];
  a2[4] = v7;
  LOBYTE(v7) = *((_BYTE *)result + 40);
  *((_BYTE *)result + 40) = *((_BYTE *)a2 + 40);
  *((_BYTE *)a2 + 40) = v7;
  return result;
}

marisa::grimoire::trie::LoudsTrie **marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::reset(marisa::grimoire::trie::LoudsTrie **a1, marisa::grimoire::trie::LoudsTrie *a2)
{
  _QWORD *exception;
  marisa::grimoire::trie::LoudsTrie *v4;

  if (a2 && *a1 == a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/include/marisa/scoped-ptr.h";
    exception[2] = 0x600000013;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/include/marisa/scoped-ptr.h:19: MARISA_RESET_ERROR: (ptr"
                   " != NULL) && (ptr == ptr_)";
  }
  v4 = *a1;
  *a1 = a2;
  return marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v4);
}

uint64_t marisa::grimoire::vector::BitVector::map(marisa::grimoire::vector::BitVector *this, marisa::grimoire::io::Mapper *a2)
{
  uint64_t result;
  _OWORD v4[4];
  __int128 v5;
  _BYTE v6[25];
  __int128 v7;
  _BYTE v8[25];
  __int128 v9;
  _BYTE v10[25];

  memset(v4, 0, 41);
  v7 = 0u;
  memset(v8, 0, sizeof(v8));
  v9 = 0u;
  memset(v10, 0, sizeof(v10));
  v4[3] = 0u;
  v5 = 0u;
  memset(v6, 0, sizeof(v6));
  marisa::grimoire::vector::BitVector::map_((marisa::grimoire::vector::BitVector *)v4, a2);
  marisa::grimoire::vector::BitVector::swap(this, (marisa::grimoire::vector::BitVector *)v4);
  if ((_QWORD)v9)
    MEMORY[0x2348BCE40](v9, 0x1000C8077774924);
  if ((_QWORD)v7)
    MEMORY[0x2348BCE40](v7, 0x1000C8077774924);
  if ((_QWORD)v5)
    MEMORY[0x2348BCE40](v5, 0x1000C8077774924);
  result = *(_QWORD *)&v4[0];
  if (*(_QWORD *)&v4[0])
    return MEMORY[0x2348BCE40](*(_QWORD *)&v4[0], 0x1000C8077774924);
  return result;
}

void sub_23094C24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  marisa::grimoire::vector::BitVector::~BitVector((marisa::grimoire::vector::BitVector *)&a9);
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::vector::Vector<unsigned char>::map(__int128 *a1, marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<unsigned char>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x2348BCE40](v3, 0x1000C8077774924);
  return result;
}

void sub_23094C2F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x2348BCE40](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::FlatVector::map(marisa::grimoire::vector::FlatVector *this, marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _OWORD v9[3];
  uint64_t v10;
  int v11;
  uint64_t v12;

  memset(v9, 0, 41);
  v10 = 0;
  v11 = 0;
  v12 = 0;
  marisa::grimoire::vector::FlatVector::map_((marisa::grimoire::vector::FlatVector *)v9, a2);
  v3 = *(_OWORD *)this;
  *(_OWORD *)this = v9[0];
  v9[0] = v3;
  v4 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *(_QWORD *)&v9[1];
  *(_QWORD *)&v9[1] = v4;
  v5 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)&v9[1] + 8);
  *(_OWORD *)((char *)&v9[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)this + 40);
  *((_BYTE *)this + 40) = BYTE8(v9[2]);
  BYTE8(v9[2]) = v4;
  v6 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = v10;
  v10 = v6;
  LODWORD(v6) = *((_DWORD *)this + 14);
  *((_DWORD *)this + 14) = v11;
  v11 = v6;
  v7 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = v12;
  result = v3;
  v12 = v7;
  if ((_QWORD)v3)
    return MEMORY[0x2348BCE40](v3, 0x1000C8077774924);
  return result;
}

void sub_23094C3EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x2348BCE40](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::map(__int128 *a1, marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x2348BCE40](v3, 0x1000C8077774924);
  return result;
}

void sub_23094C4A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x2348BCE40](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::trie::LoudsTrie::match_(marisa::grimoire::trie::LoudsTrie *this, marisa::Agent *a2, unint64_t a3)
{
  uint64_t v6;
  marisa::grimoire::vector::BitVector *v7;
  marisa::grimoire::trie::Tail *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  marisa::grimoire::trie::LoudsTrie *v24;
  marisa::grimoire::trie::LoudsTrie *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = *((_QWORD *)a2 + 5);
  v7 = (marisa::grimoire::trie::LoudsTrie *)((char *)this + 416);
  v8 = (marisa::grimoire::trie::LoudsTrie *)((char *)this + 744);
  while (1)
  {
    while (1)
    {
      v9 = *((_QWORD *)this + 132) & a3;
      v10 = *((_QWORD *)this + 128);
      if (a3 == *(_DWORD *)(v10 + 12 * v9 + 4))
        break;
      if (((*(_QWORD *)(*((_QWORD *)this + 54) + ((a3 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
      {
        v13 = *((_QWORD *)this + 125);
        v14 = *(unsigned __int8 *)(*((_QWORD *)this + 80) + a3);
        v15 = marisa::grimoire::vector::BitVector::rank1(v7, a3);
        v16 = *((_QWORD *)this + 90);
        v17 = (unint64_t)(v16 * v15) >> 6;
        v18 = (v16 * v15) & 0x3F;
        v19 = v18 + v16;
        v20 = *((_QWORD *)this + 86);
        v21 = *(_QWORD *)(v20 + 8 * v17);
        if (v13)
        {
          v22 = v21 >> v18;
          if (v19 > 0x40)
            v22 |= (2 * *(_QWORD *)(v20 + 8 * v17 + 8)) << (v18 ^ 0x3Fu);
          v23 = v14 | ((*((_DWORD *)this + 182) & v22) << 8);
          v24 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
          if (v24)
          {
            if ((marisa::grimoire::trie::LoudsTrie::match_(v24, a2, v23) & 1) == 0)
              return 0;
            goto LABEL_27;
          }
        }
        else
        {
          if (v19 > 0x40)
            v27 = ((2 * *(_QWORD *)(v20 + 8 * v17 + 8)) << (v18 ^ 0x3Fu)) | (v21 >> v18);
          else
            v27 = v21 >> v18;
          v23 = v14 | ((*((_DWORD *)this + 182) & v27) << 8);
        }
        if ((marisa::grimoire::trie::Tail::match(v8, a2, v23) & 1) == 0)
          return 0;
      }
      else
      {
        v26 = *(unsigned int *)(v6 + 100);
        if (*(unsigned __int8 *)(*((_QWORD *)this + 80) + a3) != *(unsigned __int8 *)(*(_QWORD *)a2 + v26))
          return 0;
        *(_DWORD *)(v6 + 100) = v26 + 1;
      }
LABEL_27:
      if (a3 <= *((_QWORD *)this + 133))
        return 1;
      if (*((_QWORD *)a2 + 1) <= (unint64_t)*(unsigned int *)(v6 + 100))
        return 0;
      a3 = marisa::grimoire::vector::BitVector::select1(this, a3) + ~a3;
    }
    v11 = *(unsigned int *)(v10 + 12 * v9 + 8);
    if (v11 <= 0xFFFFFEFF)
    {
      v25 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
      if (v25)
      {
        if ((marisa::grimoire::trie::LoudsTrie::match_(v25, a2, v11) & 1) == 0)
          return 0;
      }
      else if ((marisa::grimoire::trie::Tail::match(v8, a2, v11) & 1) == 0)
      {
        return 0;
      }
    }
    else
    {
      v12 = *(unsigned int *)(v6 + 100);
      if (*(unsigned __int8 *)(*(_QWORD *)a2 + v12) != v11)
        return 0;
      *(_DWORD *)(v6 + 100) = v12 + 1;
    }
    a3 = *(unsigned int *)(*((_QWORD *)this + 128) + 12 * v9);
    if (!(_DWORD)a3)
      return 1;
    if (*((_QWORD *)a2 + 1) <= (unint64_t)*(unsigned int *)(v6 + 100))
      return 0;
  }
}

uint64_t marisa::grimoire::trie::Config::parse_(marisa::grimoire::trie::Config *this, unsigned int a2)
{
  _QWORD *exception;

  if (a2 >= 0x100000)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h";
    exception[2] = 0x50000003BLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h:59: MARISA_CODE_ERROR:"
                   " (config_flags & ~MARISA_CONFIG_MASK) != 0";
  }
  if ((a2 & 0x7F) != 0)
    *(_QWORD *)this = a2 & 0x7F;
  marisa::grimoire::trie::Config::parse_cache_level((uint64_t)this, a2);
  marisa::grimoire::trie::Config::parse_tail_mode((uint64_t)this, a2);
  return marisa::grimoire::trie::Config::parse_node_order((uint64_t)this, a2);
}

uint64_t marisa::grimoire::trie::Config::parse_cache_level(uint64_t this, __int16 a2)
{
  unsigned int v2;
  int v3;
  _QWORD *exception;

  v2 = a2 & 0xF80;
  v3 = 512;
  if (v2 > 0x1FF)
  {
    if (v2 == 512)
      goto LABEL_11;
    if (v2 != 1024)
    {
      v3 = a2 & 0xF80;
      if (v2 != 2048)
        goto LABEL_9;
      goto LABEL_11;
    }
LABEL_10:
    v3 = a2 & 0xF80;
    goto LABEL_11;
  }
  if ((a2 & 0xF80) == 0)
    goto LABEL_11;
  if (v2 == 128)
    goto LABEL_10;
  v3 = a2 & 0xF80;
  if (v2 != 256)
  {
LABEL_9:
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h";
    exception[2] = 0x500000065;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h:101: MARISA_CODE_ERROR"
                   ": undefined cache level";
  }
LABEL_11:
  *(_DWORD *)(this + 8) = v3;
  return this;
}

uint64_t marisa::grimoire::trie::Config::parse_tail_mode(uint64_t this, __int16 a2)
{
  int v2;
  int v3;
  _QWORD *exception;

  v2 = 4096;
  v3 = a2 & 0xF000;
  if ((a2 & 0xF000) != 0 && v3 != 4096)
  {
    if (v3 != 0x2000)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &off_24FECE6A0;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h";
      exception[2] = 0x500000079;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h:121: MARISA_CODE_ERR"
                     "OR: undefined tail mode";
    }
    v2 = 0x2000;
  }
  *(_DWORD *)(this + 12) = v2;
  return this;
}

uint64_t marisa::grimoire::trie::Config::parse_node_order(uint64_t this, int a2)
{
  int v2;
  int v3;
  _QWORD *exception;

  v2 = 0x20000;
  v3 = a2 & 0xF0000;
  if ((a2 & 0xF0000) != 0 && v3 != 0x20000)
  {
    if (v3 != 0x10000)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &off_24FECE6A0;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h";
      exception[2] = 0x50000008DLL;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h:141: MARISA_CODE_ERR"
                     "OR: undefined node order";
    }
    v2 = 0x10000;
  }
  *(_DWORD *)(this + 16) = v2;
  return this;
}

uint64_t marisa::grimoire::vector::BitVector::map_(marisa::grimoire::vector::BitVector *this, marisa::grimoire::io::Mapper *a2)
{
  unint64_t v4;
  _QWORD *exception;

  marisa::grimoire::vector::Vector<unsigned long long>::map((__int128 *)this, a2);
  *((_QWORD *)this + 6) = *(unsigned int *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  v4 = *(unsigned int *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  if (*((_QWORD *)this + 6) < v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/bit-vector.h";
    exception[2] = 0xA00000087;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/bit-vector.h:135: MAR"
                   "ISA_FORMAT_ERROR: temp_num_1s > size_";
  }
  *((_QWORD *)this + 7) = v4;
  marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::map((__int128 *)this + 4, a2);
  marisa::grimoire::vector::Vector<unsigned int>::map((__int128 *)this + 7, a2);
  return marisa::grimoire::vector::Vector<unsigned int>::map((__int128 *)this + 10, a2);
}

uint64_t marisa::grimoire::vector::Vector<unsigned long long>::map(__int128 *a1, marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<unsigned long long>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x2348BCE40](v3, 0x1000C8077774924);
  return result;
}

void sub_23094CA94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x2348BCE40](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::map(__int128 *a1, marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x2348BCE40](v3, 0x1000C8077774924);
  return result;
}

void sub_23094CB50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x2348BCE40](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<unsigned int>::map(__int128 *a1, marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<unsigned int>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x2348BCE40](v3, 0x1000C8077774924);
  return result;
}

void sub_23094CC0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x2348BCE40](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<unsigned long long>::map_(uint64_t a1, marisa::grimoire::io::Mapper *this)
{
  unint64_t v4;
  _QWORD *exception;

  v4 = *(_QWORD *)marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  if ((v4 & 7) != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0xA000000CALL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:202: MARISA_"
                   "FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  marisa::grimoire::io::Mapper::map<unsigned long long>(this, (uint64_t *)(a1 + 16), v4 >> 3);
  marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(_QWORD *)(a1 + 24) = v4 >> 3;
  return marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t marisa::grimoire::io::Mapper::map<unsigned long long>(marisa::grimoire::io::Mapper *a1, uint64_t *a2, unint64_t a3)
{
  uint64_t result;
  _QWORD *exception;
  const char *v6;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x20000001CLL;
    v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:28: MARISA_NULL_ERROR: (ob"
         "js == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >> 61)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x70000001ELL;
    v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:30: MARISA_SIZE_ERROR: num"
         "_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v6;
  }
  result = marisa::grimoire::io::Mapper::map_data(a1, 8 * a3);
  *a2 = result;
  return result;
}

uint64_t marisa::grimoire::vector::Vector<unsigned long long>::fix(uint64_t result)
{
  _QWORD *exception;

  if (*(_BYTE *)(result + 40))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0x10000006BLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:107: MARISA_"
                   "STATE_ERROR: fixed_";
  }
  *(_BYTE *)(result + 40) = 1;
  return result;
}

uint64_t marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::map_(uint64_t a1, marisa::grimoire::io::Mapper *this)
{
  unint64_t v4;
  unint64_t v5;
  _QWORD *exception;

  v4 = *(_QWORD *)marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  v5 = v4 / 0xC;
  if (v4 % 0xC)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0xA000000CALL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:202: MARISA_"
                   "FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  marisa::grimoire::io::Mapper::map<marisa::grimoire::vector::RankIndex>(this, (uint64_t *)(a1 + 16), v5);
  marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(_QWORD *)(a1 + 24) = v5;
  return marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t marisa::grimoire::io::Mapper::map<marisa::grimoire::vector::RankIndex>(marisa::grimoire::io::Mapper *a1, uint64_t *a2, unint64_t a3)
{
  uint64_t result;
  _QWORD *exception;
  const char *v6;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x20000001CLL;
    v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:28: MARISA_NULL_ERROR: (ob"
         "js == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >= 0x1555555555555556)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x70000001ELL;
    v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:30: MARISA_SIZE_ERROR: num"
         "_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v6;
  }
  result = marisa::grimoire::io::Mapper::map_data(a1, 12 * a3);
  *a2 = result;
  return result;
}

uint64_t marisa::grimoire::vector::Vector<unsigned int>::map_(uint64_t a1, marisa::grimoire::io::Mapper *this)
{
  unint64_t v4;
  _QWORD *exception;

  v4 = *(_QWORD *)marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  if ((v4 & 3) != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0xA000000CALL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:202: MARISA_"
                   "FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  marisa::grimoire::io::Mapper::map<unsigned int>(this, (uint64_t *)(a1 + 16), v4 >> 2);
  marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(_QWORD *)(a1 + 24) = v4 >> 2;
  return marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t marisa::grimoire::io::Mapper::map<unsigned int>(marisa::grimoire::io::Mapper *a1, uint64_t *a2, unint64_t a3)
{
  uint64_t result;
  _QWORD *exception;
  const char *v6;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x20000001CLL;
    v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:28: MARISA_NULL_ERROR: (ob"
         "js == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >> 62)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x70000001ELL;
    v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:30: MARISA_SIZE_ERROR: num"
         "_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v6;
  }
  result = marisa::grimoire::io::Mapper::map_data(a1, 4 * a3);
  *a2 = result;
  return result;
}

_QWORD *marisa::grimoire::vector::FlatVector::map_(marisa::grimoire::vector::FlatVector *this, marisa::grimoire::io::Mapper *a2)
{
  uint64_t v4;
  _QWORD *result;
  _QWORD *exception;

  marisa::grimoire::vector::Vector<unsigned long long>::map((__int128 *)this, a2);
  v4 = *(unsigned int *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  if (v4 >= 0x21)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/flat-vector.h";
    exception[2] = 0xA00000086;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/flat-vector.h:134: MA"
                   "RISA_FORMAT_ERROR: temp_value_size > 32";
  }
  *((_QWORD *)this + 6) = v4;
  *((_DWORD *)this + 14) = *(_DWORD *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  result = (_QWORD *)marisa::grimoire::io::Mapper::map_data(a2, 8uLL);
  *((_QWORD *)this + 8) = *result;
  return result;
}

marisa::grimoire::trie::LoudsTrie **marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(marisa::grimoire::trie::LoudsTrie **a1)
{
  marisa::grimoire::trie::LoudsTrie *v2;

  v2 = *a1;
  if (v2)
  {
    marisa::grimoire::trie::LoudsTrie::~LoudsTrie(v2);
    MEMORY[0x2348BCE64]();
  }
  return a1;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

uint64_t marisa::grimoire::vector::Vector<unsigned char>::map_(uint64_t a1, marisa::grimoire::io::Mapper *this)
{
  unint64_t v4;

  v4 = *(_QWORD *)marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  *(_QWORD *)(a1 + 16) = marisa::grimoire::io::Mapper::map_data(this, v4);
  marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(_QWORD *)(a1 + 24) = v4;
  return marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

double marisa::grimoire::trie::Tail::Tail(marisa::grimoire::trie::Tail *this)
{
  double result;

  result = 0.0;
  *(_OWORD *)((char *)this + 25) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *(_OWORD *)((char *)this + 73) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *(_OWORD *)((char *)this + 185) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *(_OWORD *)((char *)this + 233) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 137) = 0u;
  return result;
}

uint64_t *marisa::grimoire::trie::Tail::swap(marisa::grimoire::trie::Tail *this, marisa::grimoire::trie::Tail *a2)
{
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this, (uint64_t *)a2);
  return marisa::grimoire::vector::BitVector::swap((marisa::grimoire::trie::Tail *)((char *)this + 48), (marisa::grimoire::trie::Tail *)((char *)a2 + 48));
}

uint64_t marisa::grimoire::trie::Tail::map(marisa::grimoire::trie::Tail *this, marisa::grimoire::io::Mapper *a2)
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t result;
  __int128 v8[3];
  _OWORD v9[4];
  __int128 v10;
  _BYTE v11[25];
  __int128 v12;
  _BYTE v13[25];
  __int128 v14;
  _BYTE v15[25];

  memset(v8, 0, 41);
  memset(v9, 0, 41);
  v12 = 0u;
  memset(v13, 0, sizeof(v13));
  v14 = 0u;
  memset(v15, 0, sizeof(v15));
  v9[3] = 0u;
  v10 = 0u;
  memset(v11, 0, sizeof(v11));
  marisa::grimoire::vector::Vector<char>::map(v8, a2);
  marisa::grimoire::vector::BitVector::map((marisa::grimoire::vector::BitVector *)v9, a2);
  v4 = *(_OWORD *)this;
  *(_OWORD *)this = v8[0];
  v8[0] = v4;
  v5 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *(_QWORD *)&v8[1];
  *(_QWORD *)&v8[1] = v5;
  v6 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = *(__int128 *)((char *)&v8[1] + 8);
  *(__int128 *)((char *)&v8[1] + 8) = v6;
  LOBYTE(v5) = *((_BYTE *)this + 40);
  *((_BYTE *)this + 40) = BYTE8(v8[2]);
  BYTE8(v8[2]) = v5;
  marisa::grimoire::vector::BitVector::swap((marisa::grimoire::trie::Tail *)((char *)this + 48), (marisa::grimoire::vector::BitVector *)v9);
  if ((_QWORD)v14)
    MEMORY[0x2348BCE40](v14, 0x1000C8077774924);
  if ((_QWORD)v12)
    MEMORY[0x2348BCE40](v12, 0x1000C8077774924);
  if ((_QWORD)v10)
    MEMORY[0x2348BCE40](v10, 0x1000C8077774924);
  if (*(_QWORD *)&v9[0])
    MEMORY[0x2348BCE40](*(_QWORD *)&v9[0], 0x1000C8077774924);
  result = *(_QWORD *)&v8[0];
  if (*(_QWORD *)&v8[0])
    return MEMORY[0x2348BCE40](*(_QWORD *)&v8[0], 0x1000C8077774924);
  return result;
}

void sub_23094D420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  marisa::grimoire::trie::Tail::~Tail((marisa::grimoire::trie::Tail *)&a9);
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::trie::Tail::match(marisa::grimoire::trie::Tail *this, marisa::Agent *a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;

  v3 = *((_QWORD *)a2 + 5);
  v4 = *((_QWORD *)this + 2);
  if (*((_QWORD *)this + 12))
  {
    v5 = *(_DWORD *)(v3 + 100);
    v6 = *(_QWORD *)a2;
    v7 = *((_QWORD *)a2 + 1);
    do
    {
      if (*(unsigned __int8 *)(v4 + a3) != *(unsigned __int8 *)(v6 + v5))
        break;
      *(_DWORD *)(v3 + 100) = ++v5;
      if (((*(_QWORD *)(*((_QWORD *)this + 8) + ((a3 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
        return 1;
      ++a3;
    }
    while (v7 > v5);
  }
  else
  {
    v12 = v4 + a3;
    v8 = v4 + a3 - *(unsigned int *)(v3 + 100);
    v9 = *(_QWORD *)a2;
    v10 = *((_QWORD *)a2 + 1);
    v11 = *(unsigned __int8 *)v12;
    LODWORD(v12) = *(_DWORD *)(v3 + 100);
    while (v11 == *(unsigned __int8 *)(v9 + v12))
    {
      v12 = (v12 + 1);
      *(_DWORD *)(v3 + 100) = v12;
      v11 = *(unsigned __int8 *)(v8 + v12);
      if (!*(_BYTE *)(v8 + v12))
        return 1;
      if (v10 <= v12)
        return 0;
    }
  }
  return 0;
}

uint64_t marisa::grimoire::vector::Vector<char>::map(__int128 *a1, marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<unsigned char>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x2348BCE40](v3, 0x1000C8077774924);
  return result;
}

void sub_23094D56C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x2348BCE40](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::BitVector::rank1(marisa::grimoire::vector::BitVector *this, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v2 = a2 >> 9;
  v3 = *((_QWORD *)this + 10);
  v4 = *(unsigned int *)(v3 + 12 * (a2 >> 9));
  switch((a2 >> 6) & 7)
  {
    case 1uLL:
      v5 = *(_DWORD *)(v3 + 12 * v2 + 4) & 0x7F;
      goto LABEL_10;
    case 2uLL:
      v6 = (unint64_t)*(unsigned int *)(v3 + 12 * v2 + 4) >> 7;
      goto LABEL_5;
    case 3uLL:
      v6 = (unint64_t)*(unsigned int *)(v3 + 12 * v2 + 4) >> 15;
LABEL_5:
      v4 += v6;
      break;
    case 4uLL:
      v4 += (unint64_t)*(unsigned int *)(v3 + 12 * v2 + 4) >> 23;
      break;
    case 5uLL:
      v5 = *(_DWORD *)(v3 + 12 * v2 + 8) & 0x1FF;
      goto LABEL_10;
    case 6uLL:
      v5 = ((unint64_t)*(unsigned int *)(v3 + 12 * v2 + 8) >> 9) & 0x1FF;
      goto LABEL_10;
    case 7uLL:
      v5 = ((unint64_t)*(unsigned int *)(v3 + 12 * v2 + 8) >> 18) & 0x1FF;
LABEL_10:
      v4 += v5;
      break;
    default:
      break;
  }
  v7 = *(_QWORD *)(*((_QWORD *)this + 2) + 8 * (a2 >> 6)) & ~(-1 << a2);
  v8 = (((((v7 >> 1) & 0x5555555555555555) + (v7 & 0x5555555555555555)) >> 2) & 0x3333333333333333)
     + ((((v7 >> 1) & 0x5555555555555555) + (v7 & 0x5555555555555555)) & 0x3333333333333333);
  return v4 + ((0x101010101010101 * (((v8 >> 4) & 0x707070707070707) + (v8 & 0x707070707070707))) >> 56);
}

unint64_t marisa::grimoire::vector::BitVector::select0(marisa::grimoire::vector::BitVector *this, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int *v11;
  unint64_t v12;
  marisa::grimoire::vector::_anonymous_namespace_ *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = *((_QWORD *)this + 16);
  if ((a2 & 0x1FF) == 0)
    return *(unsigned int *)(v2 + 4 * (a2 >> 9));
  v3 = *(_DWORD *)(v2 + 4 * (a2 >> 9)) >> 9;
  v4 = (*(_DWORD *)(v2 + 4 * (a2 >> 9) + 4) + 511) >> 9;
  v5 = *((_QWORD *)this + 10);
  if (v3 + 10 >= v4)
  {
    v7 = v5 + 12 * v3;
    v8 = v3-- << 9;
    v9 = (unsigned int *)(v7 + 12);
    do
    {
      v10 = *v9;
      v9 += 3;
      ++v3;
      v8 += 512;
    }
    while (v8 - v10 <= a2);
  }
  else
  {
    do
    {
      if (((v4 + v3) >> 1 << 9) - *(unsigned int *)(v5 + 12 * ((v4 + v3) >> 1)) > a2)
        v4 = (v4 + v3) >> 1;
      else
        v3 = (v4 + v3) >> 1;
    }
    while (v3 + 1 < v4);
  }
  v11 = (unsigned int *)(v5 + 12 * v3);
  v12 = v11[1];
  v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)(a2 - (v3 << 9) + *v11);
  v14 = 8 * v3;
  if ((unint64_t)v13 >= 256 - (v12 >> 23))
  {
    v15 = *(unsigned int *)(v5 + 12 * v3 + 8);
    v16 = (v15 >> 9) & 0x1FF;
    if ((unint64_t)v13 >= 384 - v16)
    {
      v18 = (v15 >> 18) & 0x1FF;
      if ((unint64_t)v13 >= 448 - v18)
      {
        v14 |= 7uLL;
        v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + v18 - 448);
      }
      else
      {
        v14 |= 6uLL;
        v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + v16 - 384);
      }
    }
    else if ((unint64_t)v13 >= 320 - (v15 & 0x1FF))
    {
      v14 |= 5uLL;
      v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v15 & 0x1FF) - 320);
    }
    else
    {
      v14 |= 4uLL;
      v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v12 >> 23) - 256);
    }
  }
  else if ((unint64_t)v13 >= 128 - (unint64_t)(v12 >> 7))
  {
    v17 = (v12 >> 15);
    if ((unint64_t)v13 >= 192 - v17)
    {
      v14 |= 3uLL;
      v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + v17 - 192);
    }
    else
    {
      v14 |= 2uLL;
      v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v12 >> 7) - 128);
    }
  }
  else if ((unint64_t)v13 >= 64 - (v12 & 0x7F))
  {
    v14 |= 1uLL;
    v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v12 & 0x7F) - 64);
  }
}

unint64_t marisa::grimoire::vector::`anonymous namespace'::select_bit(marisa::grimoire::vector::_anonymous_namespace_ *this, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = (((a3 - ((a3 >> 1) & 0x5555555555555555)) >> 2) & 0x3333333333333333)
     + ((a3 - ((a3 >> 1) & 0x5555555555555555)) & 0x3333333333333333);
  v4 = (v3 + (v3 >> 4)) & 0xF0F0F0F0F0F0F0FLL;
  v5 = __clz(__rbit64(((((0x101010101010101 * v4) | 0x8080808080808080)
                      - 0x101010101010101 * (_QWORD)this
                      - 0x101010101010101) >> 7) & 0x101010101010101));
  return v5
       + a2
                                                                     * ((_QWORD)this
                                                                      - ((unint64_t)(0x101010101010100 * v4) >> v5))
                                                                     + (a3 >> v5)];
}

unint64_t marisa::grimoire::vector::BitVector::select1(marisa::grimoire::vector::BitVector *this, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  marisa::grimoire::vector::_anonymous_namespace_ *v16;
  uint64_t v17;
  unint64_t v18;
  marisa::grimoire::vector::_anonymous_namespace_ *v19;
  BOOL v20;
  marisa::grimoire::vector::_anonymous_namespace_ *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  BOOL v28;
  marisa::grimoire::vector::_anonymous_namespace_ *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  marisa::grimoire::vector::_anonymous_namespace_ *v33;
  BOOL v34;

  v2 = *((_QWORD *)this + 22);
  if ((a2 & 0x1FF) == 0)
    return *(unsigned int *)(v2 + 4 * (a2 >> 9));
  v3 = *(_DWORD *)(v2 + 4 * (a2 >> 9)) >> 9;
  v4 = (*(_DWORD *)(v2 + 4 * (a2 >> 9) + 4) + 511) >> 9;
  v5 = *((_QWORD *)this + 10);
  if (v3 + 10 >= v4)
  {
    v7 = v5 + 12 * v3--;
    v8 = (unsigned int *)(v7 + 12);
    do
    {
      v9 = *v8;
      v8 += 3;
      ++v3;
    }
    while (v9 <= a2);
  }
  else
  {
    do
    {
      if (*(unsigned int *)(v5 + 12 * ((v4 + v3) >> 1)) > a2)
        v4 = (v4 + v3) >> 1;
      else
        v3 = (v4 + v3) >> 1;
    }
    while (v3 + 1 < v4);
  }
  v10 = (unsigned int *)(v5 + 12 * v3);
  v11 = v10[1];
  v12 = a2 - *v10;
  v13 = 8 * v3;
  if (v12 >= v11 >> 23)
  {
    v23 = v11 >> 23;
    v24 = *(unsigned int *)(v5 + 12 * v3 + 8);
    v25 = (v24 >> 9) & 0x1FF;
    v26 = (v24 >> 18) & 0x1FF;
    v27 = v13 | 7;
    v28 = v12 >= v26;
    if (v12 < v26)
      v29 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v25);
    else
      v29 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v26);
    if (!v28)
      v27 = v13 | 6;
    v30 = v24 & 0x1FF;
    v31 = v13 | 5;
    v32 = v13 | 4;
    v33 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v23);
    v34 = v12 >= v30;
    if (v12 < v30)
      v21 = v33;
    else
      v21 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v30);
    if (v34)
      v32 = v31;
    if (v12 < v25)
    {
      v22 = v32;
    }
    else
    {
      v21 = v29;
      v22 = v27;
    }
  }
  else
  {
    v14 = v11 >> 7;
    v15 = (v11 >> 15);
    v16 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - (v11 >> 7));
    if (v12 < v15)
    {
      v17 = v13 | 2;
    }
    else
    {
      v16 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v15);
      v17 = v13 | 3;
    }
    v18 = v11 & 0x7F;
    v20 = v12 >= v18;
    v19 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v18);
    if (v20)
      v13 |= 1uLL;
    else
      v19 = (marisa::grimoire::vector::_anonymous_namespace_ *)v12;
    v20 = v12 >= v14;
    if (v12 < v14)
      v21 = v19;
    else
      v21 = v16;
    if (v20)
      v22 = v17;
    else
      v22 = v13;
  }
}

_QWORD *marisa::Trie::Trie(_QWORD *this)
{
  *this = 0;
  return this;
}

marisa::grimoire::trie::LoudsTrie **marisa::Trie::map(marisa::grimoire::trie::LoudsTrie **this, const void *a2, uint64_t a3)
{
  marisa::grimoire::trie::LoudsTrie *v6;
  marisa::grimoire::trie::LoudsTrie *v7;
  marisa::grimoire::trie::LoudsTrie *v8;
  _QWORD *exception;
  _QWORD *v11;
  _BYTE v12[40];
  marisa::grimoire::trie::LoudsTrie *v13;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_24FECE6A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x200000021;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:33: MARISA_NULL_ERROR: (ptr == NULL) && (size != 0)";
  }
  v6 = (marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x24BEDB6B8]);
  if (!v6)
  {
    v13 = 0;
    v11 = __cxa_allocate_exception(0x20uLL);
    *v11 = &off_24FECE6A0;
    v11[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    v11[2] = 0x800000024;
    v11[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:36: MARISA_MEMORY_ERROR: temp.get() == NULL";
  }
  v7 = v6;
  marisa::grimoire::trie::LoudsTrie::LoudsTrie(v6);
  v13 = v7;
  marisa::grimoire::io::Mapper::Mapper((uint64_t)v12);
  marisa::grimoire::io::Mapper::open((marisa::grimoire::io::Mapper *)v12, a2, a3);
  marisa::grimoire::trie::LoudsTrie::map(v13, (marisa::grimoire::io::Mapper *)v12);
  v8 = *this;
  *this = v13;
  v13 = v8;
  marisa::grimoire::io::Mapper::~Mapper((marisa::grimoire::io::Mapper *)v12);
  return marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v13);
}

void sub_23094DBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((marisa::grimoire::trie::LoudsTrie **)va);
  _Unwind_Resume(a1);
}

marisa::grimoire::trie::LoudsTrie *marisa::Trie::lookup(marisa::grimoire::trie::LoudsTrie **this, marisa::Agent *a2)
{
  marisa::grimoire::trie::LoudsTrie *result;

  result = *this;
  if (result)
  {
    if (!*((_QWORD *)a2 + 5))
    {
      marisa::Agent::init_state(a2);
      result = *this;
    }
    return (marisa::grimoire::trie::LoudsTrie *)marisa::grimoire::trie::LoudsTrie::lookup(result, a2);
  }
  return result;
}

uint64_t Utils::TrieWrapper::loadTrie@<X0>(const __CFString *this@<X0>, Utils::MarisaTrieWrapper **a2@<X8>)
{
  Utils::MarisaTrieWrapper *v5;
  uint64_t result;
  Utils::MarisaTrieWrapper *v7;

  v5 = (Utils::MarisaTrieWrapper *)operator new();
  Utils::MarisaTrieWrapper::MarisaTrieWrapper(v5, this);
  result = (*(uint64_t (**)(Utils::MarisaTrieWrapper *))(*(_QWORD *)v5 + 16))(v5);
  if ((_DWORD)result)
  {
    *a2 = v5;
  }
  else
  {
    v7 = (Utils::MarisaTrieWrapper *)operator new();
    *(_QWORD *)v7 = &off_24FECE670;
    *((_QWORD *)v7 + 1) = CFBurstTrieCreateFromFile();
    *a2 = v7;
    return (*(uint64_t (**)(Utils::MarisaTrieWrapper *))(*(_QWORD *)v5 + 8))(v5);
  }
  return result;
}

void sub_23094DD20(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  MEMORY[0x2348BCE64](v2, 0xA1C40BD48D6D6);
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void Utils::CFBurstTrieWrapper::~CFBurstTrieWrapper(Utils::CFBurstTrieWrapper *this)
{
  *(_QWORD *)this = &off_24FECE670;
  if (*((_QWORD *)this + 1))
    CFBurstTrieRelease();
}

{
  Utils::CFBurstTrieWrapper::~CFBurstTrieWrapper(this);
  JUMPOUT(0x2348BCE64);
}

BOOL Utils::CFBurstTrieWrapper::isValid(Utils::CFBurstTrieWrapper *this)
{
  return *((_QWORD *)this + 1) != 0;
}

BOOL Utils::CFBurstTrieWrapper::lookup(Utils::CFBurstTrieWrapper *this, const __CFString *a2, CFRange a3, float *a4)
{
  _BOOL8 result;

  result = CFBurstTrieContains() != 0;
  *a4 = 0.0;
  return result;
}

Utils::MarisaTrieWrapper *Utils::MarisaTrieWrapper::MarisaTrieWrapper(Utils::MarisaTrieWrapper *this, const __CFString *a2)
{
  Utils::MarisaTrieWrapper *v3;
  marisa::Trie **v4;
  marisa::Trie *v5;
  uint64_t v6;
  unint64_t v8;
  __int128 *p_dst;
  std::string *v10;
  char *v11;
  uint64_t v12;
  std::string::value_type v13;
  uint64_t v14;
  uint64_t v15;
  const std::string::value_type *v16;
  std::string::size_type v17;
  std::string *v19;
  int v20;
  uintmax_t v21;
  unsigned int *v22;
  unint64_t v23;
  uint64_t v24;
  unsigned int *v25;
  uint64_t v26;
  unint64_t v27;
  void **v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  int v43;
  char *v44;
  char *v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  size_t v50;
  _BYTE *v51;
  unint64_t v52;
  char *v53;
  char *v54;
  _QWORD *exception;
  void *v57;
  void *v58;
  void *v59;
  std::string *v60;
  __int128 v61;
  std::string *v62;
  __int128 v63;
  Utils::MarisaTrieWrapper *v64;
  unsigned int **v65;
  uint64_t v66;
  std::string v67;
  std::string v68;
  __int128 __dst;
  int64_t v70;

  v3 = this;
  *(_QWORD *)this = &off_24FECE640;
  *((_QWORD *)this + 1) = 0;
  v4 = (marisa::Trie **)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  v65 = (unsigned int **)((char *)this + 16);
  *((_QWORD *)this + 3) = 0;
  *((_DWORD *)this + 8) = -1;
  v5 = (marisa::Trie *)operator new();
  marisa::Trie::Trie(v5);
  *((_QWORD *)v5 + 1) = 0;
  *((_QWORD *)v5 + 2) = 0;
  *((_QWORD *)v5 + 3) = 0;
  std::unique_ptr<trie::MarisaTrie<float,char>>::reset[abi:ne180100](v4, v5);
  CFStringGetCString(a2, (char *)&Utils::MarisaTrieWrapper::MarisaTrieWrapper(__CFString const*)::buffer, 1024, 0x8000100u);
  v6 = 0;
  memset(&v68, 0, sizeof(v68));
  while (Utils::MarisaTrieWrapper::MarisaTrieWrapper(__CFString const*)::buffer.__r_.__value_.__s.__data_[v6++])
    ;
  v8 = v6 - 1;
  if (v6 != 1)
  {
    if (&v68 > &Utils::MarisaTrieWrapper::MarisaTrieWrapper(__CFString const*)::buffer
      || (std::string *)((char *)&v68.__r_.__value_.__l.__data_ + 1) <= &Utils::MarisaTrieWrapper::MarisaTrieWrapper(__CFString const*)::buffer)
    {
      if (v8 < 0x17)
      {
        v10 = &v68;
      }
      else
      {
        std::string::__grow_by(&v68, 0x16uLL, v6 - 23, 0, 0, 0, 0);
        v68.__r_.__value_.__l.__size_ = 0;
        if ((v68.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v10 = &v68;
        else
          v10 = (std::string *)v68.__r_.__value_.__r.__words[0];
      }
      v11 = (char *)&Utils::MarisaTrieWrapper::MarisaTrieWrapper(__CFString const*)::buffer;
      v12 = v6 - 1;
      do
      {
        v13 = *v11++;
        v10->__r_.__value_.__s.__data_[0] = v13;
        v10 = (std::string *)((char *)v10 + 1);
        --v12;
      }
      while (v12);
      v10->__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
        v68.__r_.__value_.__l.__size_ = v6 - 1;
      else
        *((_BYTE *)&v68.__r_.__value_.__s + 23) = v8 & 0x7F;
    }
    else
    {
      if (v8 >= 0x7FFFFFFFFFFFFFF8)
        std::string::__throw_length_error[abi:ne180100]();
      if (v8 > 0x16)
      {
        v14 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v8 | 7) != 0x17)
          v14 = v8 | 7;
        v15 = v14 + 1;
        p_dst = (__int128 *)operator new(v14 + 1);
        *((_QWORD *)&__dst + 1) = v6 - 1;
        v70 = v15 | 0x8000000000000000;
        *(_QWORD *)&__dst = p_dst;
      }
      else
      {
        HIBYTE(v70) = v6 - 1;
        p_dst = &__dst;
      }
      memcpy(p_dst, &Utils::MarisaTrieWrapper::MarisaTrieWrapper(__CFString const*)::buffer, v6 - 1);
      *((_BYTE *)p_dst + v6 - 1) = 0;
      if (v70 >= 0)
        v16 = (const std::string::value_type *)&__dst;
      else
        v16 = (const std::string::value_type *)__dst;
      if (v70 >= 0)
        v17 = HIBYTE(v70);
      else
        v17 = *((_QWORD *)&__dst + 1);
      std::string::append(&v68, v16, v17);
      if (SHIBYTE(v70) < 0)
        operator delete((void *)__dst);
    }
  }
  std::__fs::filesystem::__status((const std::__fs::filesystem::path *)&v68, 0);
  if (__dst == 255 || __dst == 0)
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = MEMORY[0x24BEDB8F0] + 16;
    __cxa_throw(exception, MEMORY[0x24BEDB760], MEMORY[0x24BEDB680]);
  }
  if ((v68.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v19 = &v68;
  else
    v19 = (std::string *)v68.__r_.__value_.__r.__words[0];
  v20 = open((const char *)v19, 0);
  *((_DWORD *)v3 + 8) = v20;
  if (v20 < 0)
  {
    v57 = __cxa_allocate_exception(0x10uLL);
    if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v67, v68.__r_.__value_.__l.__data_, v68.__r_.__value_.__l.__size_);
    else
      v67 = v68;
    v60 = std::string::insert(&v67, 0, "Cannot open a file: ");
    v61 = *(_OWORD *)&v60->__r_.__value_.__l.__data_;
    v70 = v60->__r_.__value_.__r.__words[2];
    __dst = v61;
    v60->__r_.__value_.__l.__size_ = 0;
    v60->__r_.__value_.__r.__words[2] = 0;
    v60->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x2348BCDD4](v57, &__dst);
    __cxa_throw(v57, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v21 = std::__fs::filesystem::__file_size((const std::__fs::filesystem::path *)&v68, 0);
  *((_QWORD *)v3 + 3) = v21;
  v22 = (unsigned int *)mmap(0, v21, 1, 2, *((_DWORD *)v3 + 8), 0);
  *v65 = v22;
  if (v22 == (unsigned int *)-1)
  {
    v58 = __cxa_allocate_exception(0x10uLL);
    if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v67, v68.__r_.__value_.__l.__data_, v68.__r_.__value_.__l.__size_);
    else
      v67 = v68;
    v62 = std::string::insert(&v67, 0, "Cannot mmap: ");
    v63 = *(_OWORD *)&v62->__r_.__value_.__l.__data_;
    v70 = v62->__r_.__value_.__r.__words[2];
    __dst = v63;
    v62->__r_.__value_.__l.__size_ = 0;
    v62->__r_.__value_.__r.__words[2] = 0;
    v62->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x2348BCDD4](v58, &__dst);
    __cxa_throw(v58, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v23 = *((_QWORD *)v3 + 3);
  if (v23 < 4)
  {
    v59 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x2348BCDC8](v59, "Cannot load the trie");
    __cxa_throw(v59, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v24 = *((_QWORD *)v3 + 1);
  v25 = v22 + 1;
  v26 = *v22;
  marisa::Trie::map((marisa::grimoire::trie::LoudsTrie **)v24, v22 + 1, v26);
  v66 = v23 - v26 - 4;
  v27 = (unint64_t)v66 >> 2;
  v29 = *(char **)(v24 + 8);
  v30 = *(_QWORD *)(v24 + 16);
  v28 = (void **)(v24 + 8);
  v31 = (v30 - (uint64_t)v29) >> 2;
  if ((unint64_t)v66 >> 2 <= v31)
  {
    if (v27 >= v31)
    {
LABEL_56:
      v41 = *(_QWORD *)(v24 + 24);
      goto LABEL_57;
    }
    v44 = &v29[4 * v27];
LABEL_53:
    *(_QWORD *)(v24 + 16) = v44;
    goto LABEL_56;
  }
  v32 = v27 - v31;
  v33 = *(_QWORD *)(v24 + 24);
  if (v27 - v31 <= (v33 - v30) >> 2)
  {
    bzero(*(void **)(v24 + 16), 4 * v32);
    v44 = (char *)(v30 + 4 * v32);
    goto LABEL_53;
  }
  v34 = v33 - (_QWORD)v29;
  v35 = v34 >> 1;
  if (v34 >> 1 <= v27)
    v35 = (unint64_t)v66 >> 2;
  if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFFCLL)
    v36 = 0x3FFFFFFFFFFFFFFFLL;
  else
    v36 = v35;
  v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v36);
  v64 = v3;
  v38 = *(char **)(v24 + 8);
  v39 = *(char **)(v24 + 16);
  v29 = &v37[4 * v31];
  v41 = (uint64_t)&v37[4 * v40];
  bzero(v29, 4 * v32);
  v42 = &v29[4 * v32];
  while (v39 != v38)
  {
    v43 = *((_DWORD *)v39 - 1);
    v39 -= 4;
    *((_DWORD *)v29 - 1) = v43;
    v29 -= 4;
  }
  *(_QWORD *)(v24 + 8) = v29;
  *(_QWORD *)(v24 + 16) = v42;
  *(_QWORD *)(v24 + 24) = v41;
  v3 = v64;
  if (v38)
  {
    operator delete(v38);
    v29 = (char *)*v28;
    goto LABEL_56;
  }
LABEL_57:
  v45 = (char *)v25 + v26;
  v46 = v66 >> 2;
  if (v66 >> 2 > (unint64_t)((v41 - (uint64_t)v29) >> 2))
  {
    if (v29)
    {
      *(_QWORD *)(v24 + 16) = v29;
      operator delete(v29);
      v41 = 0;
      *v28 = 0;
      *(_QWORD *)(v24 + 16) = 0;
      *(_QWORD *)(v24 + 24) = 0;
    }
    if (v66 < 0)
      goto LABEL_86;
    v47 = v41 >> 1;
    if (v41 >> 1 <= v46)
      v47 = v66 >> 2;
    v48 = (unint64_t)v41 >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v47;
    if (v48 >> 62)
LABEL_86:
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v48);
    *(_QWORD *)(v24 + 8) = v29;
    *(_QWORD *)(v24 + 16) = v29;
    *(_QWORD *)(v24 + 24) = &v29[4 * v49];
    v50 = v66 & 0xFFFFFFFFFFFFFFFCLL;
    if ((unint64_t)v66 < 4)
      goto LABEL_77;
    goto LABEL_75;
  }
  v51 = *(_BYTE **)(v24 + 16);
  v52 = (v51 - v29) >> 2;
  if (v52 >= v46)
  {
    v50 = v66 & 0xFFFFFFFFFFFFFFFCLL;
    if ((unint64_t)v66 < 4)
      goto LABEL_77;
LABEL_75:
    v53 = v29;
    v54 = v45;
    goto LABEL_76;
  }
  if (v51 != v29)
  {
    memmove(v29, v45, v51 - v29);
    v29 = *(char **)(v24 + 16);
  }
  v50 = 4 * v27 - 4 * v52;
  if (v52 != v27)
  {
    v53 = v29;
    v54 = &v45[4 * v52];
LABEL_76:
    memmove(v53, v54, v50);
  }
LABEL_77:
  *(_QWORD *)(v24 + 16) = &v29[v50];
  if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v68.__r_.__value_.__l.__data_);
  return v3;
}

void sub_23094E480(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, marisa::Trie **a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  void *v30;
  uint64_t v31;
  int v33;

  __cxa_free_exception(v30);
  if (a24 < 0)
    operator delete(__p);
  __cxa_begin_catch(a1);
  std::unique_ptr<trie::MarisaTrie<float,char>>::reset[abi:ne180100](a10, 0);
  if (*(_QWORD *)a11)
    munmap(*(void **)a11, *(_QWORD *)(v31 + 24));
  v33 = *(_DWORD *)(v31 + 32);
  if (v33)
    close(v33);
  *(_QWORD *)a11 = 0;
  *(_QWORD *)(a11 + 8) = 0;
  *(_DWORD *)(v31 + 32) = -1;
  __cxa_end_catch();
  JUMPOUT(0x23094E2C8);
}

void sub_23094E594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, marisa::Trie **a10)
{
  std::unique_ptr<trie::MarisaTrie<float,char>>::reset[abi:ne180100](a10, 0);
  _Unwind_Resume(a1);
}

marisa::Trie **std::unique_ptr<trie::MarisaTrie<float,char>>::reset[abi:ne180100](marisa::Trie **result, marisa::Trie *a2)
{
  marisa::Trie *v2;
  void *v3;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    v3 = (void *)*((_QWORD *)v2 + 1);
    if (v3)
    {
      *((_QWORD *)v2 + 2) = v3;
      operator delete(v3);
    }
    marisa::Trie::~Trie(v2);
    JUMPOUT(0x2348BCE64);
  }
  return result;
}

void Utils::MarisaTrieWrapper::~MarisaTrieWrapper(Utils::MarisaTrieWrapper *this)
{
  void *v2;
  int v3;

  *(_QWORD *)this = &off_24FECE640;
  v2 = (void *)*((_QWORD *)this + 2);
  if (v2)
    munmap(v2, *((_QWORD *)this + 3));
  v3 = *((_DWORD *)this + 8);
  if ((v3 & 0x80000000) == 0)
    close(v3);
  std::unique_ptr<trie::MarisaTrie<float,char>>::reset[abi:ne180100]((marisa::Trie **)this + 1, 0);
  std::unique_ptr<trie::MarisaTrie<float,char>>::reset[abi:ne180100]((marisa::Trie **)this + 1, 0);
}

{
  Utils::MarisaTrieWrapper::~MarisaTrieWrapper(this);
  JUMPOUT(0x2348BCE64);
}

BOOL Utils::MarisaTrieWrapper::isValid(Utils::MarisaTrieWrapper *this)
{
  return *((_QWORD *)this + 1) != 0;
}

marisa::grimoire::trie::LoudsTrie *Utils::MarisaTrieWrapper::lookup(Utils::MarisaTrieWrapper *this, const __CFString *a2, CFRange a3, float *a4)
{
  CFIndex length;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  size_t v10;
  uint64_t v11;
  marisa::grimoire::trie::LoudsTrie *v12;
  _QWORD v14[4];
  unsigned int v15;

  if (!a3.length)
    return 0;
  length = a3.length;
  v7 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, a3);
  v8 = 3 * length + 1;
  v9 = (void *)operator new[]();
  bzero(v9, v8);
  if (CFStringGetCString(v7, (char *)v9, v8, 0x8000100u))
  {
    v10 = strlen((const char *)v9);
    v11 = *((_QWORD *)this + 1);
    marisa::Agent::Agent((marisa::Agent *)v14);
    marisa::Agent::set_query(v14, (const char *)v9, v10);
    v12 = marisa::Trie::lookup((marisa::grimoire::trie::LoudsTrie **)v11, (marisa::Agent *)v14);
    if ((v12 & 1) != 0)
      *a4 = *(float *)(*(_QWORD *)(v11 + 8) + 4 * v15);
    marisa::Agent::~Agent((marisa::Agent *)v14);
  }
  else
  {
    v12 = 0;
  }
  MEMORY[0x2348BCE40](v9, 0x1000C8077774924);
  if (v7)
    CFRelease(v7);
  return v12;
}

void sub_23094E7E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  MEMORY[0x2348BCE40](v2, 0x1000C8077774924);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24FECE4C8, MEMORY[0x24BEDAAF0]);
}

void sub_23094E908(_Unwind_Exception *a1)
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

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(unint64_t a1)
{
  if (a1 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a1);
}

void nlp::CFScopedPtr<__CFString const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void ReleaseTransitionTable(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t i;
  void *v5;

  v2 = *(void **)(a1 + 64);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 96);
    if (v3 < 1)
      goto LABEL_8;
    for (i = 0; i < v3; ++i)
    {
      v5 = *(void **)(*(_QWORD *)(a1 + 64) + 8 * i);
      if (v5)
      {
        free(v5);
        v3 = *(_QWORD *)(a1 + 96);
      }
    }
    v2 = *(void **)(a1 + 64);
    if (v2)
LABEL_8:
      free(v2);
    *(_QWORD *)(a1 + 64) = 0;
  }
}

CFIndex ThaiTokenizerSetString(CFIndex result, CFStringRef theString)
{
  CFIndex v2;
  CFRange v4;

  v2 = result;
  if (theString)
  {
    v4.length = CFStringGetLength(theString);
    v4.location = 0;
    return ThaiTokenizerSetStringWithRange(v2, theString, v4);
  }
  else
  {
    *(_QWORD *)(result + 56) = 0;
  }
  return result;
}

uint64_t ThaiTokenizerAdvanceToNextToken(uint64_t a1)
{
  CFIndex v2;
  CFIndex v3;
  const __CFNumber *ValueAtIndex;
  unsigned int v5;
  unsigned int CharacterAtIndex;
  CFIndex valuePtr;

  if (*(_QWORD *)(a1 + 56))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2 == -1)
    {
      *(_QWORD *)(a1 + 40) = 0;
      CharacterAtIndex = CFStringGetCharacterAtIndex(*(CFStringRef *)(a1 + 8), 0);
      return getTokenType(CharacterAtIndex);
    }
    v3 = *(_QWORD *)(a1 + 48);
    if (v2 < v3)
    {
      *(_QWORD *)(a1 + 40) = v2 + 1;
      if (v2 + 1 < v3)
      {
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), v2);
        valuePtr = 0;
        CFNumberGetValue(ValueAtIndex, kCFNumberCFIndexType, &valuePtr);
        v5 = CFStringGetCharacterAtIndex(*(CFStringRef *)(a1 + 8), valuePtr);
        return getTokenType(v5);
      }
    }
  }
  return 0;
}

uint64_t getTokenType(unsigned int a1)
{
  _BOOL4 v2;
  uint64_t result;

  v2 = isPunct(a1);
  result = 3;
  if (a1 != 3631 && !v2)
  {
    if (a1 > 0x3A)
      goto LABEL_7;
    if (((1 << a1) & 0x100003E00) != 0)
      return 5;
    if (((1 << a1) & 0x400500000000000) == 0)
    {
LABEL_7:
      if (a1 == 160)
        return 5;
      if (getChunkType(a1) == 16)
        return 9;
      else
        return 1;
    }
  }
  return result;
}

uint64_t ThaiTokenizerGoToTokenAtIndex(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  CFIndex v6;
  const __CFNumber *ValueAtIndex;
  const __CFNumber *v8;
  CFIndex v9;
  unsigned int CharacterAtIndex;
  CFIndex v11;
  uint64_t valuePtr;

  v2 = *(_QWORD *)(a1 + 56);
  if (!v2)
    return 0;
  result = 0;
  v5 = a2 - *(_QWORD *)(a1 + 16);
  if (v5 >= v2 || v5 < 0)
    return result;
  if (*(uint64_t *)(a1 + 48) < 1)
    return 0;
  v6 = 0;
  valuePtr = 0;
  while (1)
  {
    ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), v6);
    CFNumberGetValue(ValueAtIndex, kCFNumberCFIndexType, &valuePtr);
    if (v5 < valuePtr)
      break;
    if (++v6 >= *(_QWORD *)(a1 + 48))
      return 0;
  }
  *(_QWORD *)(a1 + 40) = v6;
  v11 = 0;
  if (v6)
  {
    v8 = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), v6 - 1);
    CFNumberGetValue(v8, kCFNumberCFIndexType, &v11);
    v9 = v11;
  }
  else
  {
    v9 = 0;
  }
  CharacterAtIndex = CFStringGetCharacterAtIndex(*(CFStringRef *)(a1 + 8), v9);
  return getTokenType(CharacterAtIndex);
}

uint64_t ThaiTokenizerGetCurrentTokenRange(uint64_t a1)
{
  uint64_t v2;
  const __CFNumber *ValueAtIndex;
  const __CFNumber *v4;
  const __CFNumber *v6;
  uint64_t v7;
  uint64_t valuePtr;

  v7 = 0;
  valuePtr = 0;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    if (v2 >= *(_QWORD *)(a1 + 48))
    {
      return -1;
    }
    else
    {
      ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), v2 - 1);
      CFNumberGetValue(ValueAtIndex, kCFNumberCFIndexType, &valuePtr);
      v4 = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), *(_QWORD *)(a1 + 40));
      CFNumberGetValue(v4, kCFNumberCFIndexType, &v7);
      return *(_QWORD *)(a1 + 16) + valuePtr;
    }
  }
  else
  {
    v6 = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), 0);
    CFNumberGetValue(v6, kCFNumberCFIndexType, &v7);
    return *(_QWORD *)(a1 + 16);
  }
}

BOOL isPunct(int a1)
{
  _BOOL8 result;

  if ((a1 - 33) < 0xB)
    return 1;
  result = 1;
  if ((a1 - 45) > 0x33 || ((1 << (a1 - 45)) & 0x8400000084005) == 0)
    return a1 == 123 || a1 == 126;
  return result;
}

uint64_t getChunkType(unsigned int a1)
{
  uint64_t v1;

  v1 = 1;
  if (a1 - 3648 >= 0xE && (unsigned __int16)(a1 - 3585) >= 0x2Eu && (unsigned __int16)(a1 - 3632) >= 0xBu)
  {
    if (a1 <= 0x20 && ((1 << a1) & 0x100003E00) != 0 || a1 == 160)
    {
      return 4;
    }
    else if (a1 == 3631)
    {
      return 2;
    }
    else if (isPunct(a1))
    {
      return 8;
    }
    else
    {
      return 16;
    }
  }
  return v1;
}

BOOL isThaiEndingChar(int a1)
{
  uint64_t v1;
  _BOOL4 v3;

  if ((a1 - 3597) < 0xF)
    return 1;
  if ((a1 - 3585) >= 0xB)
  {
    if ((a1 - 3614) < 0xD)
      return 1;
  }
  else
  {
    v1 = 1;
    if (((0x6FFu >> (a1 - 1)) & 1) != 0 || (unsigned __int16)(a1 - 3614) <= 0xCu)
      return v1;
  }
  v1 = 1;
  if ((a1 - 3628) > 0x1A || ((1 << (a1 - 44)) & 0x4000013) == 0)
  {
    v3 = (a1 - 3634) < 9 || (a1 - 3653) < 0xA;
    return a1 == 46 || v3;
  }
  return v1;
}

float getUnkProb(const __CFString *a1, uint64_t a2, CFIndex idx, uint64_t a4)
{
  int CharacterAtIndex;
  BOOL v9;
  char v10;
  float result;
  float v12;

  CharacterAtIndex = CFStringGetCharacterAtIndex(a1, idx);
  v9 = (CharacterAtIndex - 3585) < 0x2E || (CharacterAtIndex - 3648) < 5;
  if (CharacterAtIndex == 3654)
    v9 = 1;
  v10 = CharacterAtIndex == 46 || v9;
  result = -12.0;
  v12 = -9.0;
  if (a4 != 2)
    v12 = -12.0;
  if (a4 == 1)
    v12 = -2.0;
  if ((v10 & (a4 + idx == a2)) != 0)
    return v12;
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x24BDBB7A0](allocator, ptr);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x24BDBB7C0](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
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

uint64_t CFBurstTrieContains()
{
  return MEMORY[0x24BDBBB08]();
}

uint64_t CFBurstTrieCreateFromFile()
{
  return MEMORY[0x24BDBBB28]();
}

uint64_t CFBurstTrieRelease()
{
  return MEMORY[0x24BDBBB60]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFShow(CFTypeRef obj)
{
  MEMORY[0x24BDBC438](obj);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB38](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

uintmax_t std::__fs::filesystem::__file_size(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return MEMORY[0x24BEDB1F8](a1, __ec);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x24BEDB308](a1, __ec);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24FECE4F8();
}

void operator delete(void *__p)
{
  off_24FECE500(__p);
}

void operator delete(void *__p, const std::nothrow_t *a2)
{
  off_24FECE508(__p, a2);
}

uint64_t operator delete()
{
  return off_24FECE510();
}

uint64_t operator new[]()
{
  return off_24FECE518();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24FECE520(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_24FECE528(__sz, a2);
}

uint64_t operator new()
{
  return off_24FECE530();
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

