void Romanizer::Romanizer(Romanizer *this, RomInstParam *a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)this = &off_25198C468;
  ConverterInterface::initBase(this, a2);
  initDllLink();
  v3 = dynaBufNew(1024);
  *((_QWORD *)this + 9) = v3;
  if (!v3)
    RomInstParam::setError(*((_QWORD *)this + 2), 1);
  OUTLINED_FUNCTION_2();
  v4 = operator new();
  korTextAnalysis::korTextAnalysis(v4, (uint64_t)this, *((_QWORD *)this + 9));
  *((_QWORD *)this + 8) = v4;
  v5 = (_QWORD *)operator new();
  *v5 = &unk_25198C540;
  v5[1] = 0;
  *((_QWORD *)this + 6) = v5;
  *((_BYTE *)this + 80) = 1;
}

void sub_2486A8E10(_Unwind_Exception *a1)
{
  OUTLINED_FUNCTION_2();
  MEMORY[0x2495994B4]();
  _Unwind_Resume(a1);
}

void Romanizer::~Romanizer(Romanizer *this)
{
  uint64_t v2;
  void **v3;
  uint64_t v4;

  *(_QWORD *)this = &off_25198C468;
  v2 = *((_QWORD *)this + 8);
  if (v2)
    OUTLINED_FUNCTION_3(v2);
  v3 = (void **)*((_QWORD *)this + 9);
  if (v3)
    dynaBufDelete(v3);
  v4 = *((_QWORD *)this + 6);
  if (v4)
    OUTLINED_FUNCTION_3(v4);
  ConverterInterface::closeBase(this);
}

{
  Romanizer::~Romanizer(this);
  OUTLINED_FUNCTION_1();
  JUMPOUT(0x2495994B4);
}

uint64_t Romanizer::processSentence(Romanizer *this, char **a2, int a3)
{
  uint64_t v6;
  char *v7;
  unsigned int v8;
  int v9;
  uint64_t result;
  Romanizer *v11;
  int v12;
  unsigned int v13;
  char *v14;

  if (*((_BYTE *)this + 32))
    return 3;
  v14 = 0;
  v13 = 0;
  *((_BYTE *)this + 56) = 1;
  dynaBufReset(*((_QWORD *)this + 9));
  if (*((unsigned __int8 *)this + 80) | a3)
  {
    v6 = *((_QWORD *)this + 8);
    v7 = *(char **)(v6 + 16);
    if (v7)
      v8 = (unsigned __int16)strlen(*(const char **)(v6 + 16));
    else
      v8 = 0;
    v9 = InputManager::getText(*((InputManager **)this + 3), &v14, &v13, v7, v8) + 1;
    result = 0;
    switch(v9)
    {
      case 0:
        goto LABEL_15;
      case 2:
        break;
      case 3:
        v11 = this;
        goto LABEL_14;
      default:
        if (*((_BYTE *)this + 80))
        {
          korTextAnalysis::setText(*((korTextAnalysis **)this + 8), v14);
          *((_BYTE *)this + 80) = 0;
          *(_WORD *)(*((_QWORD *)this + 8) + 40) = 0;
        }
        goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    v12 = korTextAnalysis::processSentence(*((korTextAnalysis **)this + 8));
    if (v12 == 1)
    {
      result = 3;
    }
    else if (v12)
    {
LABEL_15:
      result = 0xFFFFFFFFLL;
    }
    else
    {
      v11 = this;
LABEL_14:
      Romanizer::generateResult(v11);
      Romanizer::sendResult(this, a2);
      result = 2;
    }
  }
  *((_BYTE *)this + 56) = 0;
  if (*((_BYTE *)this + 32))
  {
    *((_BYTE *)this + 32) = 0;
    return 3;
  }
  return result;
}

void Romanizer::generateResult(Romanizer *this)
{
  ETIqueue ***v1;
  int v2;
  ETIqueue ***v3;
  char __s[4096];
  uint64_t v5;

  v1 = (ETIqueue ***)MEMORY[0x24BDAC7A8](this);
  v5 = *MEMORY[0x24BDAC8D0];
  if (v2)
  {
    v3 = v1;
    __s[0] = 0;
    ConverterInterface::outputIndexOrParam(v1, __s, 0);
    dynaBufAddString((uint64_t *)v3[9], __s, 1);
  }
}

void Romanizer::sendResult(Romanizer *this, char **a2)
{
  korTextAnalysis *v3;

  *a2 = (char *)dynaBufContents(*((_QWORD *)this + 9));
  v3 = (korTextAnalysis *)*((_QWORD *)this + 8);
  if (*((_BYTE *)v3 + 32))
  {
    *((_BYTE *)this + 80) = 1;
    OUTLINED_FUNCTION_0(v3, 0);
  }
}

void Romanizer::ResetBuffer(Romanizer *this)
{
  InputManager::remove(*((ETIqueue ***)this + 3));
  OUTLINED_FUNCTION_0(*((korTextAnalysis **)this + 8), 0);
}

uint64_t Romanizer::getOffset(Romanizer *this)
{
  return *(unsigned int *)(*((_QWORD *)this + 8) + 36);
}

BOOL Romanizer::isValidUserDictEntry(Romanizer *this, const char *a2, uint64_t a3, unint64_t a4)
{
  return a4 < 3;
}

uint64_t Romanizer::mbcs2Rom(Romanizer *this, han2Rom *a2, char **a3)
{
  char *v4;
  uint64_t result;

  v4 = (char *)this + 81;
  result = han2Rom::translate(a2, (Romanizer *)((char *)this + 81), (char *)a3);
  if ((_DWORD)result)
  {
    *a3 = v4;
    return 1;
  }
  return result;
}

uint64_t Romanizer::rom2Mbcs(Romanizer *this, korUtil *a2, char **a3)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t result;

  v4 = (char *)a2;
  if (korUtil::isValidSPR(a2, (const char *)a2)
    || (v7 = (char *)this + 337, result = rom2Han::translate((rom2Han *)v4, v7, v6), v4 = v7, (_DWORD)result))
  {
    *a3 = v4;
    return 1;
  }
  return result;
}

uint64_t korTextAnalysis::korTextAnalysis(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)result = &unk_25198C4E0;
  *(_QWORD *)(result + 8) = a2;
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a3;
  *(_BYTE *)(result + 32) = 0;
  *(_DWORD *)(result + 36) = 0;
  *(_WORD *)(result + 40) = 0;
  *(_QWORD *)(result + 48) = &unk_25198C510;
  *(_QWORD *)(result + 56) = 0;
  *(_WORD *)(result + 64) = 0;
  *(_BYTE *)(result + 66) = 0;
  *(_DWORD *)(result + 68) = 0;
  *(_QWORD *)(result + 72) = 0;
  *(_WORD *)(result + 80) = 0;
  return result;
}

void korTextAnalysis::~korTextAnalysis(korTextAnalysis *this)
{
  korTextAnalysis::~korTextAnalysis(this);
  JUMPOUT(0x2495994B4);
}

{
  uint64_t v2;

  *(_QWORD *)this = &unk_25198C4E0;
  v2 = *((_QWORD *)this + 2);
  if (v2)
    MEMORY[0x2495994A8](v2, 0x1000C8077774924);
  korToken::~korToken((korTextAnalysis *)((char *)this + 48));
}

void sub_2486A9240(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2495994B4](v1, 0x10B1C400A5122F2);
  _Unwind_Resume(a1);
}

void korToken::~korToken(korToken *this)
{
  korToken::~korToken(this);
  JUMPOUT(0x2495994B4);
}

{
  uint64_t v2;
  void *v3;

  *(_QWORD *)this = &unk_25198C510;
  v2 = *((_QWORD *)this + 3);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
    *((_QWORD *)this + 3) = 0;
  }
  v3 = (void *)*((_QWORD *)this + 1);
  if (v3)
  {
    free(v3);
    *((_QWORD *)this + 1) = 0;
  }
}

void sub_2486A929C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2495994B4](v1, 0x10B1C40FCC13911);
  _Unwind_Resume(a1);
}

void RomUserDict::~RomUserDict(RomUserDict *this)
{
  JUMPOUT(0x2495994B4);
}

void OUTLINED_FUNCTION_0(korTextAnalysis *this, const char *a2)
{
  korTextAnalysis::setText(this, a2);
}

uint64_t OUTLINED_FUNCTION_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
}

void han2Rom::getCharType(han2Rom *this, const char *a2)
{
  unsigned int v2;
  char v5;
  char v6;
  char v7;

  v2 = *(unsigned __int8 *)this;
  if ((*(char *)this & 0x80000000) == 0 || strlen((const char *)this) <= 1)
  {
    if (!isalpha(v2) && (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v2 + 60) & 0x400) == 0 && !isspace(v2))
      ispunct(v2);
    return;
  }
  if ((v2 + 127) < 0x20u || (v2 + 80) <= 0x15u)
  {
    OUTLINED_FUNCTION_1_0();
    if (!v6 || (v5 + 127) < 0x7Eu)
      return;
    goto LABEL_20;
  }
  if ((v2 + 95) <= 0xEu)
  {
    OUTLINED_FUNCTION_1_0();
    if (!v6 || (v7 + 127) < 0x20u)
      return;
    goto LABEL_20;
  }
  if (v2 == 198)
  {
    if (*((unsigned __int8 *)this + 1) - 65 >= 0x12)
LABEL_24:
      OUTLINED_FUNCTION_0_0();
    return;
  }
  if ((v2 + 57) <= 1u)
  {
    OUTLINED_FUNCTION_2_0();
    if (!v6)
      return;
    goto LABEL_20;
  }
  if ((v2 + 54) > 0x33u)
  {
    switch(v2)
    {
      case 0xA1u:
      case 0xA3u:
      case 0xAEu:
        return;
      case 0xA2u:
      case 0xA4u:
      case 0xA5u:
      case 0xA6u:
      case 0xA7u:
      case 0xA8u:
      case 0xA9u:
      case 0xAAu:
      case 0xABu:
      case 0xACu:
        goto LABEL_24;
      case 0xADu:
      case 0xAFu:
        goto LABEL_33;
      default:
        if (v2 != 201)
          return;
LABEL_33:
        OUTLINED_FUNCTION_2_0();
        if (!v6)
          return;
        goto LABEL_20;
    }
  }
  OUTLINED_FUNCTION_2_0();
  if (v6)
  {
LABEL_20:
    switch(v2)
    {
      case 0xA2u:
      case 0xA4u:
      case 0xA5u:
      case 0xA6u:
      case 0xA7u:
      case 0xA8u:
      case 0xA9u:
      case 0xAAu:
      case 0xABu:
      case 0xACu:
        goto LABEL_24;
      default:
        return;
    }
  }
}

int isalpha(int _c)
{
  return __istype(_c, 0x100uLL);
}

int isspace(int _c)
{
  return __istype(_c, 0x4000uLL);
}

{
  return MEMORY[0x24BDAE910](*(_QWORD *)&_c);
}

int ispunct(int _c)
{
  return __istype(_c, 0x2000uLL);
}

uint64_t han2Rom::hangulCode2Johab(han2Rom *this, _WORD *a2, unsigned __int16 *a3, unsigned __int16 *a4)
{
  return han2Rom::hangulCode2Johab(this >> 8, this, a2, a4);
}

uint64_t han2Rom::hangulCode2Johab(uint64_t this, unsigned int a2, _WORD *a3, unsigned __int16 *a4)
{
  __int16 v4;
  __int16 v5;
  __int16 v6;
  unsigned __int16 v7;
  unsigned __int16 v8;
  unsigned __int16 v9;
  __int16 v10;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned __int16 v13;

  if (this <= 0xA0)
  {
    v4 = 178;
    v5 = -22962;
LABEL_5:
    v6 = v5 + this * v4;
    v7 = a2 + v6 - 71;
    if (a2 > 0x7A)
      v7 = a2 + v6 - 77;
    v8 = a2 + v6 - 65;
    if (a2 > 0x5A)
      v8 = v7;
    goto LABEL_20;
  }
  if (this <= 0xAF)
  {
    v4 = 84;
    v5 = -7828;
    goto LABEL_5;
  }
  v8 = a2 + 94 * this - 7883;
  v9 = a2 + 10729;
  if (a2 <= 0xA1)
    v9 = a2 + 10807;
  if ((_DWORD)this == 198)
    v8 = v9;
  v10 = a2 + 178 * this - 24372;
  v11 = v10 - 77;
  v12 = v10 - 71;
  if (a2 > 0x7A)
    v12 = v11;
  v13 = a2 + 178 * this - 24372 - 65;
  if (a2 > 0x5A)
    v13 = v12;
  if (this <= 0xC5)
    v8 = v13;
LABEL_20:
  *a3 = korData::s_anHangul2Johab[v8];
  return this;
}

uint64_t han2Rom::johabCode2Roman(uint64_t this, char *__s1, char *a3)
{
  char v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;

  v4 = this;
  *__s1 = 0;
  v5 = (this >> 5) & 0x1F;
  v6 = &korData::s_FirstC[3 * ((this >> 10) & 0x1F)];
  if (*v6)
    this = (uint64_t)OUTLINED_FUNCTION_3_0(this, v6);
  v7 = v4 & 0x1F;
  v8 = (char *)&korData::s_SecondV + 3 * v5;
  if (*v8)
    this = (uint64_t)OUTLINED_FUNCTION_3_0(this, v8);
  v9 = (char *)&korData::s_ThirdC + 4 * v7;
  if (*v9)
    return (uint64_t)strcat(__s1, v9);
  return this;
}

uint64_t han2Rom::hangulLetterCode2Johab(uint64_t this, int a2, _WORD *a3, unsigned __int16 *a4)
{
  __int16 v4;
  unsigned int v5;
  __int16 v6;
  unsigned int v7;
  unsigned int v8;

  v4 = 0;
  v5 = a2 | ((_DWORD)this << 8);
  v6 = 39;
LABEL_2:
  v7 = (v4 + v6) >> 1;
  while (v4 <= v6)
  {
    v8 = korData::s_anHangulLetter2Johab[2 * (__int16)v7 + 1];
    if (v5 == v8)
    {
      *a3 = korData::s_anHangulLetter2Johab[2 * (__int16)v7];
      return this;
    }
    if (v5 < v8)
    {
      v6 = v7 - 1;
      goto LABEL_2;
    }
    if (v5 > v8)
    {
      v4 = v7 + 1;
      goto LABEL_2;
    }
  }
  return this;
}

char *han2Rom::handleHangulLetter(han2Rom *this, char *__dst, char *a3)
{
  return strcpy(__dst, korData::s_apszRow4[((_BYTE)this + 95)]);
}

uint64_t han2Rom::hanjaCode2Hangul(uint64_t this, int a2, _WORD *a3, unsigned __int16 *a4)
{
  *a3 = *(_WORD *)((char *)&korData::s_anHanja2Hangul
                 + ((uint64_t)(((unint64_t)(a2 + 94 * this + 46548) << 48) - 0xA1000000000000) >> 47));
  return this;
}

void han2Rom::full2Half(han2Rom *this, char a2, _BYTE *a3, char *a4)
{
  *a3 = a2 ^ 0x80;
  a3[1] = 0;
}

char *han2Rom::handleIdeograhicSymbol(char *this, char a2, char *__dst, char *a4)
{
  char v4;

  v4 = (_BYTE)this + 95;
  if (((_BYTE)this + 95) <= 8u && ((0x1F3u >> v4) & 1) != 0)
    return strcpy(__dst, (const char *)off_25198C560[v4][(a2 + 95)]);
  return this;
}

void han2Rom::kanaCode2Roman(han2Rom *this, unsigned __int8 a2, _BYTE *a3, char *a4)
{
  *a3 = 0;
}

void han2Rom::russianCode2Roman(han2Rom *this, unsigned __int8 a2, _BYTE *a3, char *a4)
{
  *a3 = 0;
}

uint64_t han2Rom::translate(han2Rom *this, korUtil *a2, char *a3)
{
  int v5;
  uint64_t v6;
  unsigned __int16 *v7;
  unsigned __int16 *v8;
  int v9;
  char *v10;
  unsigned __int16 v12;
  char v13[256];
  uint64_t v14;

  v5 = 0;
  v14 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13[0] = 0;
  *(_BYTE *)a2 = 0;
  while (2)
  {
    if (*(_BYTE *)this)
    {
      han2Rom::getCharType(this, (const char *)a2);
      v9 = v6;
      switch((int)v6)
      {
        case 1:
          han2Rom::hangulCode2Johab(*(unsigned __int8 *)this, *((unsigned __int8 *)this + 1), &v12, v8);
          goto LABEL_7;
        case 3:
          han2Rom::hangulCode2Johab((han2Rom *)*(unsigned __int16 *)((char *)&korData::s_anHanja2Hangul+ ((uint64_t)(((unint64_t)(*((unsigned __int8 *)this + 1)+ 94 * *(unsigned __int8 *)this+ 46548) << 48)- 0xA1000000000000) >> 47)), &v12, v7, v8);
LABEL_7:
          v6 = han2Rom::johabCode2Roman(v12, v13, v10);
          goto LABEL_8;
        case 11:
        case 13:
        case 14:
        case 15:
          *(_WORD *)v13 = *(unsigned __int8 *)this;
          v5 = 1;
LABEL_8:
          OUTLINED_FUNCTION_3_0(v6, v13);
          v13[0] = 0;
          this = (han2Rom *)((char *)this + korData::s_apszKorChar[2 * v9]);
          continue;
        default:
          return 0;
      }
    }
    break;
  }
  if (v5)
    return korUtil::isValidSPR(a2, (const char *)a2);
  else
    return 1;
}

int __istype(__darwin_ct_rune_t _c, unint64_t _f)
{
  BOOL v2;

  if (_c <= 0x7F)
    v2 = (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * _c + 60) & _f) == 0;
  else
    v2 = __maskrune(_c, _f) == 0;
  return !v2;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return 1;
}

char *OUTLINED_FUNCTION_3_0(uint64_t a1, const char *a2)
{
  char *v2;

  return strcat(v2, a2);
}

void korTextAnalysis::setText(korTextAnalysis *this, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;

  if (OUTLINED_FUNCTION_9((uint64_t)this))
    OUTLINED_FUNCTION_4();
  if (v3)
  {
    v4 = (char *)OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_8(v4);
  }
  else
  {
    *(_QWORD *)(v2 + 16) = 0;
  }
  *(_DWORD *)(v2 + 36) = 0;
  *(_BYTE *)(v2 + 32) = 0;
  OUTLINED_FUNCTION_7();
}

void korTextAnalysis::appendText(korTextAnalysis *this, const char *a2)
{
  uint64_t v2;
  char *v3;

  if (OUTLINED_FUNCTION_9((uint64_t)this))
    OUTLINED_FUNCTION_4();
  v3 = (char *)OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(v3);
  *(_DWORD *)(v2 + 36) = 0;
  *(_BYTE *)(v2 + 32) = 0;
  OUTLINED_FUNCTION_7();
}

uint64_t korTextAnalysis::processSentence(korTextAnalysis *this)
{
  char *v2;
  uint64_t v3;
  int v4;
  unsigned __int16 i;
  unsigned __int16 v7;
  char __dst[256];
  char __s[1024];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  *((_WORD *)this + 20) = 0;
  *((_WORD *)this + 40) = 0;
  while (2)
  {
    if (*(_BYTE *)(*((_QWORD *)this + 1) + 32))
      return 1;
    __dst[0] = 0;
    v7 = 0;
    v2 = __dst;
    korTextAnalysis::lookupUserDict(this, (const char *)(*((_QWORD *)this + 2) + *((unsigned int *)this + 9)), __dst, &v7);
    v3 = 0;
    for (i = 0; ; v3 = i)
    {
      v2 += v3;
      if (!*v2)
        break;
      __s[0] = 0;
      korTextAnalysis::hanWord2Rom(this, v2, v7, __s, &i);
      if (!v4)
        return 0xFFFFFFFFLL;
      if (__s[0])
      {
        *(_WORD *)&__s[strlen(__s)] = 32;
        dynaBufAddString(*((uint64_t **)this + 3), __s, 1);
      }
      v7 = 0;
    }
    if (!*((_BYTE *)this + 32))
      continue;
    break;
  }
  return 0;
}

void korTextAnalysis::lookupUserDict(korTextAnalysis *this, const char *__src, char *__dst, unsigned __int16 *a4)
{
  char v7;
  unsigned __int16 v8;
  uint64_t v9;
  const char *v10;
  char v11;
  unsigned int v12;
  __int16 v13;
  unsigned __int16 v14;
  char *v15;
  __int16 v16;
  uint64_t v17;
  korUtil *v18;
  const char *v19;
  char v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  char *__s2;

  v7 = 0;
  v8 = 0;
  __s2 = 0;
  v9 = *(_QWORD *)(*((_QWORD *)this + 1) + 48);
  *__dst = 0;
  *a4 = 0;
  v10 = __src;
LABEL_2:
  v11 = 0;
  while (1)
  {
    v12 = ++*a4;
    v13 = (_WORD)v10 - (_WORD)__src;
    if (v12 < 0x51)
    {
      v14 = v13 + 1;
    }
    else
    {
      v11 = 1;
      v14 = (_WORD)v10 - (_WORD)__src;
    }
    if (*v10
      && !v11
      && !korUtil::isSingleSpace((korUtil *)*(unsigned __int8 *)v10)
      && !korUtil::isDoubleSpace((korUtil *)*(unsigned __int8 *)v10, *((unsigned __int8 *)v10 + 1)))
    {
      v19 = v10 + 2;
      v18 = (korUtil *)*(unsigned __int8 *)v10;
      v20 = *++v10;
      if (korUtil::isMBCS(v18, v20))
        v10 = v19;
      v7 = 1;
      goto LABEL_2;
    }
    if (*(_QWORD *)(v9 + 8)
      && !RomUserDict::lookup((SkipList **)v9, (char *)&__src[v8], (unsigned __int16)(v13 - v8), &__s2))
    {
      strncpy(__dst, __src, v14);
      __dst[v14] = 0;
      OUTLINED_FUNCTION_6();
      *(_DWORD *)(v24 + 36) = v23;
      return;
    }
    if (__s2)
    {
      v15 = strcat(__dst, __s2);
      *(_WORD *)&__dst[strlen(v15)] = 32;
    }
    else
    {
      strncpy(__dst, __src, v14);
      __dst[v14] = 0;
    }
    if (!*v10)
    {
      *((_BYTE *)this + 32) = 1;
      return;
    }
    if (!korUtil::isSingleSpace((korUtil *)*(unsigned __int8 *)v10))
      break;
    if ((v7 & 1) != 0)
      goto LABEL_27;
    v16 = 1;
    v17 = 1;
LABEL_22:
    v8 += v16;
    v10 += v17;
  }
  if (v11)
  {
LABEL_27:
    OUTLINED_FUNCTION_6();
    goto LABEL_30;
  }
  if ((v7 & 1) == 0)
  {
    v11 = 0;
    v17 = 2;
    v16 = 2;
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_6();
  v21 = v25 + 1;
LABEL_30:
  *(_DWORD *)(v22 + 36) = v21;
}

void korTextAnalysis::hanWord2Rom(korTextAnalysis *this, char *a2, unsigned __int16 a3, char *a4, unsigned __int16 *a5)
{
  int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t i;
  int v13;

  korTextAnalysis::parseText(this, a2, a3, a5);
  if (v7)
  {
    v8 = korTextAnalysis::setLocInfo((uint64_t)this);
    v9 = 0;
    v10 = 0;
    v11 = *((_QWORD *)this + 9);
    for (i = v11; v11; v11 = *(_QWORD *)(v11 + 24))
    {
      v9 = *(_DWORD *)(v11 + 20);
      v8 = korTextAnalysis::needAnnotation(v8, v9, *(_BYTE **)(v11 + 8));
      if ((_DWORD)v8)
      {
        if (!v10 || v10 == v9)
        {
          v10 = v9;
        }
        else
        {
          korTextAnalysis::printTokens((char *)this, i, v11, v10, a4, 1);
          v10 = v9;
          i = v11;
        }
      }
    }
    if (i)
    {
      if (v10)
        v9 = v10;
      v13 = korTextAnalysis::needAnnotation(v8, v9, *(_BYTE **)(i + 8));
      korTextAnalysis::printTokens((char *)this, i, 0, v9, a4, v13);
    }
  }
}

void korTextAnalysis::parseText(korTextAnalysis *this, char *a2, unsigned __int16 a3, unsigned __int16 *a4)
{
  char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  char v15;
  unsigned __int8 *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unsigned __int16 *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  han2Rom *v26;
  char v27;
  _BYTE *v28;
  char *v29;
  char *v30;
  unsigned __int16 *v31;
  unsigned __int16 *v32;
  char *v33;
  char v34;
  char *v35;
  char *v36;
  han2Rom *v37;
  unsigned __int8 v38;
  _BYTE *v39;
  char *v40;
  han2Rom *v41;
  unsigned __int8 v42;
  _BYTE *v43;
  char *v44;
  unsigned __int16 v45;
  unsigned __int16 *v46;
  uint64_t v47;
  han2Rom *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
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
  char __dst[256];
  uint64_t v81;

  v46 = a4;
  v81 = *MEMORY[0x24BDAC8D0];
  HIWORD(v47) = 0;
  __dst[0] = 0;
  LOBYTE(v48) = 0;
  v6 = (char *)korToken::removeall((korTextAnalysis *)((char *)this + 48));
  v14 = 0;
  v15 = 0;
  v16 = (unsigned __int8 *)a2;
  while (*v16)
  {
    han2Rom::getCharType((han2Rom *)v16, v7);
    v25 = v17;
    switch((int)v17)
    {
      case 1:
        han2Rom::hangulCode2Johab(*v16, v16[1], (_WORD *)&v47 + 3, v20);
        goto LABEL_17;
      case 2:
        v17 = (uint64_t)han2Rom::handleHangulLetter((han2Rom *)v16[1], (char *)&v48, v19);
        if (!v14)
          goto LABEL_28;
        goto LABEL_23;
      case 3:
        WORD2(v47) = 0;
        han2Rom::hanjaCode2Hangul(*v16, v16[1], (_WORD *)&v47 + 2, v20);
        han2Rom::hangulCode2Johab((han2Rom *)WORD2(v47), (_WORD *)&v47 + 3, v31, v32);
LABEL_17:
        v17 = han2Rom::johabCode2Roman(HIWORD(v47), (char *)&v48, v30);
        if (!v14)
          goto LABEL_28;
        goto LABEL_23;
      case 4:
      case 15:
        if (__dst[0])
          v15 = 1;
        if (!v14)
          goto LABEL_28;
        goto LABEL_23;
      case 5:
        v33 = (char *)OUTLINED_FUNCTION_0_1();
        v17 = (uint64_t)han2Rom::handleIdeograhicSymbol(v33, v34, v35, v36);
        if (!v14)
          goto LABEL_28;
        goto LABEL_23;
      case 6:
      case 7:
      case 8:
        v26 = (han2Rom *)OUTLINED_FUNCTION_0_1();
        han2Rom::full2Half(v26, v27, v28, v29);
        if (!v14)
          goto LABEL_28;
        goto LABEL_23;
      case 9:
        v37 = (han2Rom *)OUTLINED_FUNCTION_0_1();
        han2Rom::kanaCode2Roman(v37, v38, v39, v40);
        goto LABEL_22;
      case 10:
        v41 = (han2Rom *)OUTLINED_FUNCTION_0_1();
        han2Rom::russianCode2Roman(v41, v42, v43, v44);
        if (!v14)
          goto LABEL_28;
        goto LABEL_23;
      case 11:
      case 13:
      case 14:
        LOWORD(v48) = *v16;
        if (v48 != 92)
          goto LABEL_22;
        v17 = strlen((const char *)&v48);
        *(_DWORD *)((char *)&v48 + v17) = 6052956;
        if (!v14)
          goto LABEL_28;
        goto LABEL_23;
      default:
LABEL_22:
        if (!v14)
          goto LABEL_28;
LABEL_23:
        if (v14 == v25 || !__dst[0])
        {
LABEL_28:
          v6 = strcat(__dst, (const char *)&v48);
        }
        else
        {
          if (!OUTLINED_FUNCTION_2_1(v17, v18, (uint64_t)v19, (uint64_t)v20, v21, v22, v23, v24, (uint64_t)v46, v47, (uint64_t)v48, v49, v50, v51, v52, v53, v54, v55, v56,
                                v57,
                                v58,
                                v59,
                                v60,
                                v61,
                                v62,
                                v63,
                                v64,
                                v65,
                                v66,
                                v67,
                                v68,
                                v69,
                                v70,
                                v71,
                                v72,
                                v73,
                                v74,
                                v75,
                                v76,
                                v77,
                                v78,
                                v79,
                                __dst[0]))
            goto LABEL_37;
          v6 = strcpy(__dst, (const char *)&v48);
        }
        v16 += korData::s_apszKorChar[2 * v25];
        if (v15 && *((_QWORD *)this + 9))
        {
          v45 = (_WORD)v16 - (_WORD)a2;
LABEL_36:
          *v46 = v45;
          goto LABEL_37;
        }
        LOBYTE(v48) = 0;
        v14 = v25;
        break;
    }
  }
  if (!__dst[0]
    || OUTLINED_FUNCTION_2_1((uint64_t)v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13, (uint64_t)v46, v47, (uint64_t)v48, v49, v50, v51, v52, v53, v54, v55, v56,
                       v57,
                       v58,
                       v59,
                       v60,
                       v61,
                       v62,
                       v63,
                       v64,
                       v65,
                       v66,
                       v67,
                       v68,
                       v69,
                       v70,
                       v71,
                       v72,
                       v73,
                       v74,
                       v75,
                       v76,
                       v77,
                       v78,
                       v79,
                       __dst[0]))
  {
    v45 = OUTLINED_FUNCTION_5();
    goto LABEL_36;
  }
LABEL_37:
  OUTLINED_FUNCTION_1_1();
}

uint64_t korTextAnalysis::setLocInfo(uint64_t this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v4;

  v1 = *(_QWORD *)(this + 72);
  v2 = 1;
  if (v1)
  {
    do
    {
      v3 = *(_QWORD *)(v1 + 24);
      if (v3)
        v4 = v2 & 1;
      else
        v4 = v2 & 1 | 2;
      *(_BYTE *)(v1 + 18) = v4;
      v1 = v3;
      v2 = 0;
    }
    while (v3);
  }
  return this;
}

uint64_t korTextAnalysis::needAnnotation(uint64_t a1, int a2, _BYTE *a3)
{
  char *v3;
  uint64_t result;

  v3 = &korData::s_apszKorChar[2 * a2];
  result = v3[1];
  if (v3[1])
  {
    if ((_DWORD)result != 83)
      return 1;
    result = (char)*a3;
    if (*a3)
    {
      result = isalpha(result);
      if ((_DWORD)result)
        return 1;
    }
  }
  return result;
}

void korTextAnalysis::printTokens(char *a1, uint64_t a2, uint64_t a3, unsigned int a4, char *a5, int a6)
{
  char *v11;
  int v12;
  __int16 v13;
  unsigned __int16 v14;
  __int16 v15;
  BOOL v16;
  char *v17;
  char __s1[2];
  char __s2[64];
  uint64_t v20;

  v11 = a1;
  v12 = 0;
  v13 = 0;
  v20 = *MEMORY[0x24BDAC8D0];
  __s1[0] = 0;
  while (a2 != a3)
  {
    v13 += *(_WORD *)(a2 + 16);
    v12 |= *(unsigned __int8 *)(a2 + 18);
    a1 = strcat(__s1, *(const char **)(a2 + 8));
    a2 = *(_QWORD *)(a2 + 24);
  }
  korTextAnalysis::convertSpecial((korTextAnalysis *)a1, __s1);
  strcpy(__s1, korTextAnalysis::convertSpecial(char const*)::szOut);
  v14 = *((_WORD *)v11 + 20) + v13;
  *((_WORD *)v11 + 20) = v14;
  v15 = *((_WORD *)v11 + 40) + v13;
  ConverterInterface::outputIndexOrParam(*((ETIqueue ****)v11 + 1), a5, v14);
  *(_WORD *)&a5[OUTLINED_FUNCTION_5()] = 32;
  v16 = __s1[0] != 96 || a4 > 0xE;
  if (v16 || ((1 << a4) & 0x6800) == 0)
  {
    if (a6 != 1)
    {
LABEL_19:
      v17 = __s1;
      goto LABEL_26;
    }
    if (*a5)
      *(_WORD *)&a5[OUTLINED_FUNCTION_5()] = 32;
    if (Romanizer::wantWordIndex(*((RomInstParam ***)v11 + 1)))
    else
    strcat(a5, __s2);
    v17 = __s1;
    if (__s1[0] == 96)
    {
      v15 = 0;
      if (!isspace(__s1[1]))
        v17 = &__s1[1];
    }
    else
    {
      v15 = 0;
    }
  }
  else if (!Romanizer::isAnnotationsInText(*((RomInstParam ***)v11 + 1))
         || *(unsigned __int16 *)__s1 == 26464
  {
    strcpy(&a5[OUTLINED_FUNCTION_5()], "\\\\");
    goto LABEL_19;
  }
LABEL_26:
  strcat(a5, v17);
  *((_WORD *)v11 + 40) = v15;
  OUTLINED_FUNCTION_1_1();
}

char *korTextAnalysis::convertSpecial(korTextAnalysis *this, const char *a2)
{
  int v2;
  char *result;
  int v4;
  int v5;

  v2 = 0;
  korTextAnalysis::convertSpecial(char const*)::szOut[0] = 0;
  result = korTextAnalysis::convertSpecial(char const*)::szOut;
  while (1)
  {
    v4 = *(unsigned __int8 *)a2;
    if (v4 != 94)
      break;
    v4 = v2 + 1;
    korTextAnalysis::convertSpecial(char const*)::szOut[v2] = 92;
    v5 = 2;
LABEL_8:
    v2 += v5;
    korTextAnalysis::convertSpecial(char const*)::szOut[v4] = 92;
    LOBYTE(v4) = *a2;
LABEL_9:
    korTextAnalysis::convertSpecial(char const*)::szOut[v2++] = v4;
    ++a2;
  }
  if (v4 == 124)
  {
    v5 = 1;
    v4 = v2;
    goto LABEL_8;
  }
  if (*a2)
    goto LABEL_9;
  korTextAnalysis::convertSpecial(char const*)::szOut[v2] = 0;
  return result;
}

uint64_t korTextAnalysis::isECIAnnotation(uint64_t a1, _BYTE *a2, int a3)
{
  unsigned int v3;

  v3 = 0x1010001u >> (8 * (a3 - 11));
  if ((a3 - 11) > 3)
    LOBYTE(v3) = 0;
  if (*a2 == 96)
    return v3;
  else
    return 0;
}

uint64_t Romanizer::isAnnotationsInText(RomInstParam **this)
{
  return RomInstParam::isAnnotationsInText(this[2]);
}

uint64_t Romanizer::wantWordIndex(RomInstParam **this)
{
  return RomInstParam::isSetWantWordIndex(this[2]);
}

uint64_t korToken::removeall(korToken *this)
{
  uint64_t result;

  result = *((_QWORD *)this + 3);
  if (result)
  {
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
    *((_QWORD *)this + 3) = 0;
  }
  return result;
}

uint64_t korToken::add(uint64_t a1, const char *a2, int a3, __int16 a4)
{
  uint64_t v8;
  uint64_t v9;

  v8 = operator new();
  *(_QWORD *)v8 = &unk_25198C510;
  *(_BYTE *)(v8 + 18) = 0;
  *(_QWORD *)(v8 + 24) = 0;
  *(_QWORD *)(v8 + 8) = strdup(a2);
  *(_DWORD *)(v8 + 20) = a3;
  *(_WORD *)(v8 + 16) = a4;
  do
  {
    v9 = a1;
    a1 = *(_QWORD *)(a1 + 24);
  }
  while (a1);
  *(_QWORD *)(v9 + 24) = v8;
  return 1;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  uint64_t v43;
  __int16 v44;
  int v45;

  return korToken::add(v43, &a43, v45, v44);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return operator new[]();
}

void OUTLINED_FUNCTION_4()
{
  JUMPOUT(0x2495994A8);
}

size_t OUTLINED_FUNCTION_5()
{
  const char *v0;

  return strlen(v0);
}

char *OUTLINED_FUNCTION_8(char *a1)
{
  uint64_t v1;
  const char *v2;

  *(_QWORD *)(v1 + 16) = a1;
  return strcpy(a1, v2);
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t rom2Han::translate(rom2Han *this, char *a2, char *a3)
{
  char v5;
  uint64_t v6;
  int Syll;
  char v8;
  unsigned __int16 v10;
  _BYTE v11[12];

  v5 = 0;
  while (1)
  {
    v6 = v5;
    if (!*((_BYTE *)this + v5))
      break;
    Syll = rom2Han::getSyll((uint64_t)this, v5, v11);
    if (Syll)
    {
      v8 = Syll;
      v10 = 0;
      rom2Han::romanCode2JohabTableIdx((uint64_t)v11, &v10);
      *(_WORD *)a2 = bswap32(korData::s_anJohab2Hangul[v10]) >> 16;
      a2 += 2;
      v5 = v8 + v6;
    }
    else
    {
      v5 = v6 + 1;
      *a2++ = *((_BYTE *)this + v6);
    }
  }
  *a2 = 0;
  return 1;
}

uint64_t rom2Han::getSyll(uint64_t a1, char a2, _BYTE *a3)
{
  char v6;
  char i;
  uint64_t v8;
  char v9;
  _BYTE *v10;
  char v11;

  v6 = 0;
  a3[8] = 0;
  a3[4] = 0;
  *a3 = 0;
  for (i = a2; ; ++i)
  {
    v8 = i;
    if (!*(_BYTE *)(a1 + i) || !rom2Han::isOnset((rom2Han *)*(char *)(a1 + i)))
      break;
    a3[v6++] = *(_BYTE *)(a1 + i);
  }
  a3[v6] = 0;
  if (rom2Han::isGlide((rom2Han *)*(char *)(a1 + i))
    && rom2Han::isNucleus((rom2Han *)*(char *)(i + a1 + 1)))
  {
    v9 = i + 1;
    a3[4] = *(_BYTE *)(a1 + i);
    i += 2;
    a3[5] = *(_BYTE *)(a1 + v9);
    v10 = a3 + 6;
LABEL_10:
    *v10 = 0;
    goto LABEL_11;
  }
  if (rom2Han::isNucleus((rom2Han *)*(char *)(a1 + i)))
  {
    ++i;
    a3[4] = *(_BYTE *)(a1 + v8);
    v10 = a3 + 5;
    goto LABEL_10;
  }
LABEL_11:
  v11 = 0;
  while (*(_BYTE *)(a1 + i) && rom2Han::isCoda((rom2Han *)*(char *)(a1 + i)))
    a3[v11++ + 8] = *(_BYTE *)(a1 + i++);
  a3[v11 + 8] = 0;
  return (char)(i - a2);
}

void rom2Han::romanCode2JohabTableIdx(uint64_t a1, _WORD *a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char __s2[4];

  v4 = 0;
  v5 = (char *)&korData::s_FirstC2;
  while (v4 != 19)
  {
    if (!OUTLINED_FUNCTION_2_2())
      goto LABEL_6;
    ++v4;
    v5 += 3;
  }
  LOBYTE(v4) = -1;
LABEL_6:
  v6 = 0;
  v7 = (char *)&korData::s_SecondV2;
  while (v6 != 21)
  {
    if (!OUTLINED_FUNCTION_0_2())
      goto LABEL_11;
    ++v6;
    v7 += 3;
  }
  LODWORD(v6) = -1;
LABEL_11:
  v8 = 0;
  v9 = (char *)&korData::s_ThirdC2;
  while (v8 != 28)
  {
    if (!OUTLINED_FUNCTION_0_2())
      goto LABEL_16;
    ++v8;
    v9 += 4;
  }
  LOWORD(v8) = 0;
LABEL_16:
  if ((v4 & 0x80) != 0)
  {
    if ((v6 & 0x80000000) != 0)
    {
      v10 = 0;
      v11 = a1 + 8;
      while (*(_BYTE *)(v11 + v10))
      {
        __s2[v10] = __tolower(*(char *)(v11 + v10));
        ++v10;
      }
      v12 = 0;
      v13 = 0;
      __s2[v10] = 0;
      while (v12 != 96)
      {
        if (!strcmp(&korData::s_FirstC[v12], __s2))
        {
          LOBYTE(v4) = v13;
          break;
        }
        if (korData::s_FirstC[v12])
          ++v13;
        v12 += 3;
      }
    }
    else
    {
      LOBYTE(v4) = 11;
    }
  }
  *a2 = v8 + 28 * v6 + 588 * (char)v4;
  OUTLINED_FUNCTION_1_2();
}

BOOL rom2Han::isOnset(rom2Han *this)
{
  return memchr("kntrmpsch", (int)this, 0xAuLL) != 0;
}

BOOL rom2Han::isGlide(rom2Han *this)
{
  return memchr("wy", (int)this, 3uLL) != 0;
}

BOOL rom2Han::isNucleus(rom2Han *this)
{
  return memchr("aAeEiIoOuU", (int)this, 0xBuLL) != 0;
}

BOOL rom2Han::isCoda(rom2Han *this)
{
  return memchr("KNTLMPSCHG", (int)this, 0xBuLL) != 0;
}

void rom2Han::romanCode2Johab(uint64_t a1, _WORD *a2)
{
  uint64_t v4;
  char *i;
  int v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *j;
  __int16 v15;
  char __s2[4];

  v4 = 0;
  for (i = korData::s_FirstC; ; i += 3)
  {
    if (v4 == 32)
    {
      v6 = 0;
      goto LABEL_7;
    }
    if (!OUTLINED_FUNCTION_2_2())
      break;
    ++v4;
  }
  v6 = v4;
LABEL_7:
  v7 = 0;
  v8 = (char *)&korData::s_SecondV;
  while (v7 != 32)
  {
    if (!OUTLINED_FUNCTION_0_2())
      goto LABEL_12;
    ++v7;
    v8 += 3;
  }
  LOBYTE(v7) = 0;
LABEL_12:
  v9 = 0;
  v10 = (char *)&korData::s_ThirdC;
  while (v9 != 32)
  {
    if (!OUTLINED_FUNCTION_0_2())
      goto LABEL_17;
    ++v9;
    v10 += 4;
  }
  LOBYTE(v9) = 0;
LABEL_17:
  if (!v6)
  {
    if ((char)v7 <= 0)
    {
      v11 = 0;
      v12 = a1 + 8;
      while (*(_BYTE *)(v12 + v11))
      {
        __s2[v11] = __tolower(*(char *)(v12 + v11));
        ++v11;
      }
      v13 = 0;
      __s2[v11] = 0;
      for (j = korData::s_FirstC; ; j += 3)
      {
        if (v13 == 32)
        {
          LOWORD(v6) = 0;
          goto LABEL_29;
        }
        if (!strcmp(j, __s2))
          break;
        ++v13;
      }
      LOWORD(v6) = v13;
LABEL_29:
      LOBYTE(v7) = 1;
      LOBYTE(v9) = 1;
    }
    else
    {
      LOWORD(v6) = 13;
    }
  }
  v15 = v9;
  if ((v9 & 0xFE) == 0)
    v15 = 1;
  *a2 = (32 * (char)v7 + ((_WORD)v6 << 10) + v15) | 0x8000;
  OUTLINED_FUNCTION_1_2();
}

uint64_t rom2Han::johabCode2Hangul(rom2Han *this, _WORD *a2, unsigned __int16 *a3)
{
  __int16 v3;
  __int16 v4;
  unsigned int v5;
  unsigned int v6;
  __int16 v7;
  __int16 v8;
  unsigned int v9;
  unsigned int v10;
  int v11;

  v3 = 0;
  v4 = 2349;
LABEL_2:
  v5 = (v3 + v4) >> 1;
  while (v3 <= v4)
  {
    v6 = (unsigned __int16)korData::s_anHangul2Johab[(__int16)v5];
    if (v6 == (_DWORD)this)
    {
      v11 = (__int16)((v3 + v4) >> 1) % 94 + (((__int16)((v3 + v4) >> 1) / 94) << 8) - 20319;
      goto LABEL_20;
    }
    if (v6 > this)
    {
      v4 = v5 - 1;
      goto LABEL_2;
    }
    if (v6 < this)
    {
      v3 = v5 + 1;
      goto LABEL_2;
    }
  }
  v7 = 0;
  v8 = 39;
LABEL_10:
  v9 = (v7 + v8) >> 1;
  while (1)
  {
    if (v7 > v8)
      return 0;
    v10 = korData::s_anJohab2HangulLetter[2 * (__int16)v9];
    if (v10 == (_DWORD)this)
      break;
    if (v10 > this)
    {
      v8 = v9 - 1;
      goto LABEL_10;
    }
    if (v10 < this)
    {
      v7 = v9 + 1;
      goto LABEL_10;
    }
  }
  LOWORD(v11) = korData::s_anJohab2HangulLetter[2 * (__int16)v9 + 1];
LABEL_20:
  *a2 = v11;
  return 1;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  const char *v0;
  const char *v1;

  return strcmp(v1, v0);
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  const char *v0;
  const char *v1;

  return strcmp(v1, v0);
}

uint64_t RomUserDict::updateDictExt(RomUserDict *a1, SkipList *a2, int a3, unsigned __int8 *a4, uint64_t a5, const char *a6, uint64_t a7, int a8)
{
  uint64_t v8;
  int v12;
  BOOL v13;
  char v15[63];
  char v16;
  _BYTE v17[8];
  uint64_t v18;
  uint64_t v19;
  char v20[256];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  if (a5 <= 127)
  {
    if (!RomUserDict::makeKey(a1, a4, a5, v20, &v19))
      return -15;
    Key::Key((Key *)v17, v20, v19);
    if (v18)
    {
      if (!a6)
      {
        SkipList::remove(a2, (Key *)v17);
        v8 = 0;
LABEL_15:
        Key::~Key((Key *)v17);
        return v8;
      }
      v16 = 0;
      Translation::Translation((Translation *)v15, &v16, 1, v20, a6, a8);
      if (v15[48])
      {
        SkipList::insert(a2, (Key *)v17, (Translation *)v15);
        v13 = v12 >= 0;
        if (v12 < 0)
          v8 = -2;
        else
          v8 = 0;
      }
      else
      {
        v13 = 0;
        v8 = -2;
      }
      Translation::~Translation((Translation *)v15);
      if (v13)
        goto LABEL_15;
    }
    v8 = -2;
    goto LABEL_15;
  }
  return -2;
}

void sub_2486AADB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  Key::~Key((Key *)va);
  OUTLINED_FUNCTION_2_3();
}

uint64_t RomUserDict::makeKey(RomUserDict *this, unsigned __int8 *a2, uint64_t a3, char *a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  korUtil *v12;
  int isMBCS;
  korUtil *v14;
  char *v15;
  uint64_t result;
  char *v17;

  v9 = 0;
  LODWORD(v10) = 0;
  while (1)
  {
    v11 = (int)v10;
    if ((int)v10 >= a3)
      break;
    v12 = (korUtil *)a2[(int)v10];
    v10 = (int)v10 + 1;
    isMBCS = korUtil::isMBCS(v12, a2[v11 + 1]);
    v14 = (korUtil *)a2[v11];
    if (isMBCS)
    {
      if (korUtil::isDoubleSpace(v14, a2[v10]))
        return 0;
      v15 = &a4[v9];
      *v15 = a2[v11];
      v15[1] = a2[v10];
      LODWORD(v10) = v11 + 2;
    }
    else
    {
      if ((v14 & 0x80) != 0 || isspace((int)v14) || iscntrl(a2[v11]))
        return 0;
      result = isgraph(a2[v11]);
      if (!(_DWORD)result)
        return result;
      v17 = &a4[v9];
      *v17 = -93;
      v17[1] = a2[v11] ^ 0x80;
    }
    v9 += 2;
  }
  a4[v9 & 0xFFFFFFFE] = 0;
  *a5 = v9 & 0xFFFFFFFE;
  return 1;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t RomUserDict::lookupDictExt(RomUserDict *a1, SkipList *a2, int a3, unsigned __int8 *a4, uint64_t a5, _QWORD *a6, _QWORD *a7, _DWORD *a8)
{
  uint64_t Key;
  uint64_t v13;
  uint64_t v14;
  Key *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  _BYTE v21[8];
  uint64_t v22;
  uint64_t v23;
  char v24[256];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  Key = RomUserDict::makeKey(a1, a4, a5, v24, &v23);
  if (!(_DWORD)Key)
    return -15;
  v15 = OUTLINED_FUNCTION_3_2(Key, v13, v23, v14);
  if (v22)
  {
    v15 = (Key *)SkipList::search(a2, (Key *)v21);
    if (v15)
    {
      v16 = 0;
      v17 = *((_QWORD *)v15 + 4);
      v18 = *((_DWORD *)v15 + 11);
      v19 = *((int *)v15 + 10);
    }
    else
    {
      v17 = 0;
      v19 = 0;
      v18 = 0;
      v16 = 5;
    }
    *a6 = v17;
    *a7 = v19;
    *a8 = v18;
  }
  else
  {
    v16 = -2;
  }
  OUTLINED_FUNCTION_0_3((uint64_t)v15);
  return v16;
}

void sub_2486AAFE4(uint64_t a1)
{
  OUTLINED_FUNCTION_0_3(a1);
  OUTLINED_FUNCTION_2_3();
}

int isgraph(int _c)
{
  return __istype(_c, 0x800uLL);
}

int iscntrl(int _c)
{
  return __istype(_c, 0x200uLL);
}

uint64_t RomUserDict::lookup(SkipList **this, char *a2, unsigned int a3, char **a4)
{
  uint64_t Key;
  uint64_t v7;
  uint64_t v8;
  Key *v9;
  char *v10;
  uint64_t v11;
  _BYTE v13[8];
  uint64_t v14;
  uint64_t v15;
  char v16[256];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  if (a3)
  {
    if (a3 <= 0x7F
      && (Key = RomUserDict::makeKey((RomUserDict *)this, (unsigned __int8 *)a2, a3, v16, &v15), (_DWORD)Key))
    {
      v9 = OUTLINED_FUNCTION_3_2(Key, v7, v15, v8);
      if (v14)
      {
        v9 = (Key *)SkipList::search(this[1], (Key *)v13);
        if (v9)
          v10 = (char *)*((_QWORD *)v9 + 4);
        else
          v10 = 0;
        *a4 = v10;
        v11 = 1;
      }
      else
      {
        v11 = 0;
      }
      OUTLINED_FUNCTION_0_3((uint64_t)v9);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    *a4 = 0;
    return 1;
  }
  return v11;
}

void sub_2486AB0EC(uint64_t a1)
{
  OUTLINED_FUNCTION_0_3(a1);
  OUTLINED_FUNCTION_2_3();
}

void OUTLINED_FUNCTION_0_3(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  Key::~Key((Key *)va);
}

void OUTLINED_FUNCTION_1_3()
{
  void *v0;

  __clang_call_terminate(v0);
}

void OUTLINED_FUNCTION_2_3()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

Key *OUTLINED_FUNCTION_3_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4, ...)
{
  uint64_t v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  va_list va1;

  va_start(va1, a4);
  va_start(va, a4);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  return Key::Key((Key *)va, va1, a3);
}

uint64_t korUtil::isMBCS(korUtil *this, char a2)
{
  BOOL v3;
  BOOL v4;

  if ((((_BYTE)this + 95) > 0x5Du || (a2 + 95) >= 0x5Eu)
    && (((_BYTE)this + 127) > 0x1Fu
     || ((a2 + 127) >= 0x7Eu ? (v3 = ((a2 & 0xDF) - 65) >= 0x1Au) : (v3 = 0), v3))
    && (((_BYTE)this + 95) > 0x25u
     || ((a2 + 127) >= 0x20u ? (v4 = ((a2 & 0xDF) - 65) >= 0x1Au) : (v4 = 0), v4)))
  {
    return OUTLINED_FUNCTION_0_4();
  }
  else
  {
    return 1;
  }
}

BOOL korUtil::isDoubleSpace(korUtil *this, int a2)
{
  return (_DWORD)this == 161 && a2 == 161;
}

uint64_t korUtil::isSingleSpace(korUtil *this)
{
  if ((this & 0x80) != 0)
    return OUTLINED_FUNCTION_0_4();
  else
    return isspace(this) != 0;
}

uint64_t korUtil::isValidSPR(korUtil *this, const char *a2)
{
  if (*(_BYTE *)this == 96 && *((_BYTE *)this + 1) == 91)
    return 1;
  else
    return OUTLINED_FUNCTION_0_4();
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return 0;
}

BOOL getRomObject(uint64_t a1, _QWORD *a2, uint64_t a3, const char *a4)
{
  unsigned __int8 v7;
  RomInstance *v8;

  v7 = atomic_load((unsigned __int8 *)&_MergedGlobals);
  if ((v7 & 1) == 0 && __cxa_guard_acquire(&_MergedGlobals))
  {
    RequestLicense::RequestLicense((RequestLicense *)&qword_25777B328);
    __cxa_guard_release(&_MergedGlobals);
  }
  *a2 = 0;
  if ((unint64_t)(a1 - 1) > 1)
  {
    if (a1 != 3)
      return *a2 != 0;
    v8 = (RomInstance *)&qword_25777B328;
  }
  else
  {
    if (!RequestLicense::licenseGranted((RequestLicense *)&qword_25777B328))
      return *a2 != 0;
    OUTLINED_FUNCTION_0_5();
    v8 = (RomInstance *)operator new();
    RomInstance::RomInstance(v8, a4);
  }
  (**(void (***)(RomInstance *, uint64_t, _QWORD *))v8)(v8, a1, a2);
  if (!*a2)
    MEMORY[0x2495994B4](v8, 0x81C40B8603338);
  return *a2 != 0;
}

void sub_2486AB318(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&_MergedGlobals);
  _Unwind_Resume(a1);
}

uint64_t UnixReg(char *__src, char *a2)
{
  strncpy(libpath, __src, 0x1000uLL);
  if (!a2)
    a2 = getcwd(0, 0x1000uLL);
  if (regrom((uint64_t)a2))
    return 0;
  else
    return 0xFFFFFFFFLL;
}

void *getFullRomPathName()
{
  return &libpath;
}

void RomInstance::RomInstance(RomInstance *this, const char *a2)
{
  RomInstParam *v4;
  Romanizer *v5;

  *(_QWORD *)this = &off_25198C5B8;
  *((_QWORD *)this + 1) = 0;
  *((_BYTE *)this + 24) = 0;
  OUTLINED_FUNCTION_5_0();
  v4 = (RomInstParam *)operator new();
  RomInstParam::RomInstParam(v4, a2);
  *((_QWORD *)this + 2) = v4;
  if ((RomInstParam::getErrors(v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_3_3();
    v5 = (Romanizer *)operator new();
    Romanizer::Romanizer(v5, *((RomInstParam **)this + 2));
  }
  *((_QWORD *)this + 4) = v5;
}

void sub_2486AB444()
{
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x2495994B4]();
  OUTLINED_FUNCTION_2_4();
}

void RomInstance::~RomInstance(RomInstance *this)
{
  uint64_t v2;

  *(_QWORD *)this = &off_25198C5B8;
  v2 = *((_QWORD *)this + 4);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  if (*((_QWORD *)this + 2))
  {
    RomInstParam::~RomInstParam(*((RomInstParam **)this + 2));
    OUTLINED_FUNCTION_1_4();
  }
}

void sub_2486AB4C0()
{
  OUTLINED_FUNCTION_1_4();
}

BOOL RomInstance::queryInterface(RomInstance *this, uint64_t a2, void **a3)
{
  RomInstParam *v5;

  *a3 = 0;
  if ((unint64_t)(a2 - 1) <= 1)
  {
    v5 = (RomInstParam *)*((_QWORD *)this + 2);
    if (v5)
    {
      if (*((_QWORD *)this + 4) && (RomInstParam::getErrors(v5) & 1) == 0)
      {
        *a3 = this;
        (*(void (**)(RomInstance *))(*(_QWORD *)this + 8))(this);
      }
    }
  }
  return *a3 != 0;
}

uint64_t RomInstance::addRef(RomInstance *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 1) + 1;
  *((_QWORD *)this + 1) = v1;
  return v1;
}

uint64_t RomInstance::release(RomInstance *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v1 - 1;
  if (v1 == 1)
  {
    RomInstance::~RomInstance(this);
    OUTLINED_FUNCTION_0_6();
  }
  return v1 - 1;
}

void sub_2486AB584()
{
  OUTLINED_FUNCTION_0_6();
}

void RomInstance::addText(ConverterInterface **this, char *a2, int a3, char a4)
{
  ConverterInterface::addText(this[4], a2, a3, a4);
}

void RomInstance::insertIndex(InputManager ***this)
{
  ConverterInterface::insertIndex(this[4]);
}

void RomInstance::addParam(InputManager ***this, const char *a2, int a3)
{
  ConverterInterface::addParam(this[4], a2, a3);
}

uint64_t RomInstance::UCS2ToMBCS(ConverterInterface **this, const unsigned __int16 *a2, char **a3, int a4)
{
  return ConverterInterface::UCS2ToMBCS(this[4], a2, a3, a4);
}

uint64_t RomInstance::WCharToMBCS(uint64_t a1, __int32 *a2, _QWORD *a3)
{
  return ConverterInterface::WCharToMBCS(*(_QWORD *)(a1 + 32), a2, a3);
}

uint64_t RomInstance::MBCSToUCS2(ConverterInterface **this, const char *a2, unsigned __int16 **a3)
{
  return ConverterInterface::MBCSToUCS2(this[4], a2, a3);
}

uint64_t RomInstance::processSentence(RomInstance *this, char **a2)
{
  return (*(uint64_t (**)(_QWORD, char **))(**((_QWORD **)this + 4) + 16))(*((_QWORD *)this + 4), a2);
}

uint64_t RomInstance::setParam(RomInstParam **this, uint64_t a2, unsigned int a3)
{
  return RomInstParam::setParam(this[2], a2, a3);
}

uint64_t RomInstance::getParam(RomInstParam **this, uint64_t a2)
{
  return RomInstParam::getParam(this[2], a2);
}

uint64_t RomInstance::resume(ConverterInterface **this)
{
  return ConverterInterface::resume(this[4]);
}

BOOL RomInstance::stop(ConverterInterface **this)
{
  return ConverterInterface::stop(this[4]) != 0;
}

uint64_t RomInstance::clearErrors(RomInstance *this)
{
  return RomInstParam::clearErrors(*((_QWORD *)this + 2));
}

uint64_t RomInstance::progStatus(RomInstParam **this)
{
  return RomInstParam::getErrors(this[2]);
}

double RomInstance::errorMessage(RomInstance *this, char *a2)
{
  double result;

  *(_QWORD *)&result = RomInstParam::getErrorMessage((RomInstParam *)*((_QWORD *)this + 2), a2).n128_u64[0];
  return result;
}

SkipList *RomInstance::newDict(ConverterInterface **this)
{
  return ConverterInterface::newDict(this[4]);
}

void RomInstance::deleteDict(ConverterInterface **this, void *a2)
{
  ConverterInterface::deleteDict(this[4], a2);
}

uint64_t RomInstance::setDict(RomInstance *this, void *a2)
{
  return ConverterInterface::setDict(*((_QWORD *)this + 4), a2);
}

uint64_t RomInstance::loadDict(ConverterInterface **this, void *a2, uint64_t a3, const char *a4)
{
  return ConverterInterface::loadDict(this[4], a2, a3, a4);
}

uint64_t RomInstance::saveDict(ConverterInterface **this, SkipList *a2, uint64_t a3, const char *a4)
{
  return ConverterInterface::saveDict(this[4], a2, a3, a4);
}

uint64_t RomInstance::lookupDictExt(uint64_t a1, SkipList *a2, int a3, char *a4, unsigned __int8 a5, _QWORD *a6, _QWORD *a7, _DWORD *a8, int a9)
{
  return ConverterInterface::lookupDictExt(*(_QWORD *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8, a9);
}

void RomInstance::findFirstDictEntryExt(uint64_t a1, uint64_t a2)
{
  ConverterInterface::findFirstDictEntryExt(*(_QWORD *)(a1 + 32), a2);
}

void RomInstance::findNextDictEntryExt(uint64_t a1, uint64_t a2)
{
  ConverterInterface::findNextDictEntryExt(*(_QWORD *)(a1 + 32), a2);
}

uint64_t RomInstance::updateDictExt(uint64_t a1, SkipList *a2, int a3, char *a4, uint64_t a5, const char *a6, unsigned int a7, int a8, int a9)
{
  return ConverterInterface::updateDictExt(*(_QWORD *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t RomInstance::isValidUserDictEntry(RomInstance *this, const char *a2)
{
  return (*(uint64_t (**)(_QWORD, const char *))(**((_QWORD **)this + 4) + 40))(*((_QWORD *)this + 4), a2);
}

uint64_t RomInstance::mbcs2Rom(RomInstance *this, const char *a2, char **a3)
{
  return (*(uint64_t (**)(_QWORD, const char *, char **))(**((_QWORD **)this + 4) + 48))(*((_QWORD *)this + 4), a2, a3);
}

uint64_t RomInstance::rom2Mbcs(RomInstance *this, const char *a2, char **a3)
{
  return (*(uint64_t (**)(_QWORD, const char *, char **))(**((_QWORD **)this + 4) + 56))(*((_QWORD *)this + 4), a2, a3);
}

void OUTLINED_FUNCTION_0_6()
{
  JUMPOUT(0x2495994B4);
}

void OUTLINED_FUNCTION_1_4()
{
  JUMPOUT(0x2495994B4);
}

void OUTLINED_FUNCTION_2_4()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return 1;
}

void RomInstParam::RomInstParam(RomInstParam *this, const char *__s)
{
  int v4;
  char *v5;

  *((_DWORD *)this + 9) = 0;
  *((_DWORD *)this + 10) = 0;
  *(_QWORD *)this = 0;
  if (__s)
    v4 = strlen(__s);
  else
    v4 = 0;
  OUTLINED_FUNCTION_3_4();
  v5 = (char *)operator new[]();
  *((_QWORD *)this + 1) = v5;
  if (__s)
    v5 = strcpy(v5, __s);
  v5[v4] = 0;
  *((_DWORD *)this + 4) = 655360;
  *((_WORD *)this + 10) = 0;
  *((_BYTE *)this + 22) = 1;
  *((_BYTE *)this + 32) = 0;
}

uint64_t RomInstParam::setError(uint64_t result, int a2)
{
  int v2;

  v2 = *(_DWORD *)(result + 40) | a2;
  *(_DWORD *)(result + 36) = a2;
  *(_DWORD *)(result + 40) = v2;
  return result;
}

void RomInstParam::~RomInstParam(RomInstParam *this)
{
  if (*((_QWORD *)this + 1))
  {
    OUTLINED_FUNCTION_3_4();
    MEMORY[0x2495994A8]();
  }
}

uint64_t RomInstParam::setCodeSet(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
    v2 = a2;
  else
    v2 = 655360;
  v3 = *(unsigned int *)(a1 + 16);
  *(_DWORD *)(a1 + 16) = v2;
  return OUTLINED_FUNCTION_0_7(v3);
}

BOOL RomInstParam::checkCodeSet(RomInstParam *this, int a2)
{
  return !a2 || a2 == 657408 || a2 == 655360;
}

uint64_t RomInstParam::getLastError(RomInstParam *this)
{
  return *((unsigned int *)this + 9);
}

uint64_t RomInstParam::isSetWantWordIndex(RomInstParam *this)
{
  return *((unsigned __int8 *)this + 20);
}

uint64_t RomInstParam::isDictOn(RomInstParam *this)
{
  return *((unsigned __int8 *)this + 22);
}

uint64_t RomInstParam::getCodeSet(RomInstParam *this)
{
  return *((unsigned int *)this + 4);
}

uint64_t RomInstParam::getErrors(RomInstParam *this)
{
  return *((unsigned int *)this + 10);
}

uint64_t RomInstParam::clearErrors(uint64_t this)
{
  *(_DWORD *)(this + 36) = 0;
  *(_DWORD *)(this + 40) = 0;
  return this;
}

uint64_t RomInstParam::clearOneError(uint64_t result, int a2)
{
  int v2;

  v2 = *(_DWORD *)(result + 36);
  *(_DWORD *)(result + 40) &= ~a2;
  if (v2 == a2)
    *(_DWORD *)(result + 36) = 0;
  return result;
}

__n128 RomInstParam::getErrorMessage(RomInstParam *this, char *a2)
{
  int v3;
  __n128 result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  size_t v9;
  uint64_t v10;
  uint64_t v11;
  __n128 *v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *((_DWORD *)this + 9);
  switch(v3)
  {
    case 0:
      strcpy(&a2[OUTLINED_FUNCTION_1_5()], "No Error");
      break;
    case 1:
      v8 = OUTLINED_FUNCTION_1_5();
      result.n128_u64[0] = *(_QWORD *)"Dynamic memory allocation failed.";
      strcpy(&a2[v8], "Dynamic memory allocation failed.");
      break;
    case 2:
      v9 = OUTLINED_FUNCTION_1_5();
      OUTLINED_FUNCTION_2_5((__n128 *)&a2[v9]);
      result = *(__n128 *)(v10 + 11);
      *(__n128 *)(v11 + 11) = result;
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      return result;
    case 4:
    case 8:
      v12 = (__n128 *)&a2[OUTLINED_FUNCTION_1_5()];
      OUTLINED_FUNCTION_2_5(v12);
      result = *(__n128 *)(v13 + 15);
      *(__n128 *)(v14 + 15) = result;
      break;
    default:
      if (v3 == 32)
      {
        v15 = OUTLINED_FUNCTION_1_5();
        OUTLINED_FUNCTION_2_5((__n128 *)&a2[v15]);
        result = *(__n128 *)(v16 + 10);
        *(__n128 *)(v17 + 10) = result;
      }
      else if (v3 == 64)
      {
        v5 = OUTLINED_FUNCTION_1_5();
        OUTLINED_FUNCTION_2_5((__n128 *)&a2[v5]);
        result = *(__n128 *)(v6 + 9);
        *(__n128 *)(v7 + 9) = result;
      }
      break;
  }
  return result;
}

uint64_t RomInstParam::isAnnotationsInText(RomInstParam *this)
{
  return *((unsigned __int8 *)this + 21);
}

uint64_t RomInstParam::setWantWordIndex(RomInstParam *this, char a2)
{
  uint64_t v2;

  v2 = *((unsigned __int8 *)this + 20);
  *((_BYTE *)this + 20) = a2;
  return OUTLINED_FUNCTION_0_7(v2);
}

uint64_t RomInstParam::setTextMode(RomInstParam *this, int a2)
{
  uint64_t v2;

  v2 = *((unsigned int *)this + 6);
  *((_DWORD *)this + 6) = a2;
  return OUTLINED_FUNCTION_0_7(v2);
}

uint64_t RomInstParam::setNumberMode(RomInstParam *this, int a2)
{
  uint64_t v2;

  v2 = *((unsigned int *)this + 7);
  *((_DWORD *)this + 7) = a2;
  return OUTLINED_FUNCTION_0_7(v2);
}

uint64_t RomInstParam::setInputType(RomInstParam *this, char a2)
{
  uint64_t v2;

  v2 = *((unsigned __int8 *)this + 21);
  *((_BYTE *)this + 21) = a2;
  return OUTLINED_FUNCTION_0_7(v2);
}

uint64_t RomInstParam::setRetroflexEnding(RomInstParam *this, char a2)
{
  uint64_t v2;

  v2 = *((unsigned __int8 *)this + 32);
  *((_BYTE *)this + 32) = a2;
  return OUTLINED_FUNCTION_0_7(v2);
}

uint64_t RomInstParam::getParam(RomInstParam *this, uint64_t a2)
{
  switch(a2)
  {
    case 19:
      return *((unsigned __int8 *)this + 22);
    case 2:
      return *((unsigned int *)this + 4);
    case 14:
      return *((unsigned __int8 *)this + 20);
    case 15:
      return *((unsigned __int8 *)this + 32);
  }
  if (a2)
    return 0xFFFFFFFFLL;
  return *((unsigned __int8 *)this + 21);
}

uint64_t RomInstParam::setParam(RomInstParam *this, uint64_t a2, unsigned int a3)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2 == 19)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        *((_BYTE *)this + 22) = 1;
        return OUTLINED_FUNCTION_0_7(0);
      }
      else
      {
        return OUTLINED_FUNCTION_0_7(4294967290);
      }
    }
    else
    {
      *((_BYTE *)this + 22) = 0;
      return OUTLINED_FUNCTION_0_7(0);
    }
  }
  if (a2 == 1)
  {
    v6 = *((unsigned int *)this + 7);
    *((_DWORD *)this + 7) = a3 != 0;
    return OUTLINED_FUNCTION_0_7(v6);
  }
  if (a2 != 2)
  {
    switch(a2)
    {
      case 14:
        v9 = *((unsigned __int8 *)this + 20);
        *((_BYTE *)this + 20) = a3;
        return OUTLINED_FUNCTION_0_7(v9);
      case 15:
        v10 = *((unsigned __int8 *)this + 32);
        *((_BYTE *)this + 32) = a3;
        return OUTLINED_FUNCTION_0_7(v10);
      case 0:
        if (a3 >= 4)
          v3 = 0;
        else
          v3 = a3;
        v4 = *((unsigned int *)this + 6);
        *((_DWORD *)this + 6) = v3;
        return OUTLINED_FUNCTION_0_7(v4);
    }
    return OUTLINED_FUNCTION_0_7(0);
  }
  if (a3 && a3 != 657408 && a3 != 655360)
    return OUTLINED_FUNCTION_0_7(0);
  if (a3)
    v7 = a3;
  else
    v7 = 655360;
  v8 = *((unsigned int *)this + 4);
  *((_DWORD *)this + 4) = v7;
  return OUTLINED_FUNCTION_0_7(v8);
}

uint64_t OUTLINED_FUNCTION_0_7@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

size_t OUTLINED_FUNCTION_1_5()
{
  const char *v0;

  return strlen(v0);
}

__n128 OUTLINED_FUNCTION_2_5@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  __n128 result;

  result = *v1;
  *a1 = *v1;
  return result;
}

BOOL regrom(uint64_t a1)
{
  qword_25777B340 = a1;
  regRomanizer(a1);
  return (_MergedGlobals_0 & 1) == 0;
}

uint64_t regRomanizer(uint64_t a1)
{
  const char *FullRomPathName;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11[518];

  MEMORY[0x24BDAC7A8](a1);
  v11[517] = *MEMORY[0x24BDAC8D0];
  if ((_MergedGlobals_0 & 1) == 0)
  {
    IniFileWriter::IniFileWriter((IniFileWriter *)v11, (const char *)qword_25777B340);
    FullRomPathName = (const char *)getFullRomPathName();
    v2 = IniFileWriter::writeString((IniFileWriter *)v11, "10.0", "Path_Rom", FullRomPathName);
    if (!(_DWORD)v2)
    {
      _MergedGlobals_0 = 1;
      OUTLINED_FUNCTION_0_8(v2, v3, v4, v5, v6, v7, v8, v9, v11[0]);
      return 0xFFFFFFFFLL;
    }
    OUTLINED_FUNCTION_0_8(v2, v3, v4, v5, v6, v7, v8, v9, v11[0]);
  }
  return 0;
}

void sub_2486ABC54(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

BOOL unregrom()
{
  return (_MergedGlobals_0 & 1) == 0;
}

void OUTLINED_FUNCTION_0_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  IniFileWriter::~IniFileWriter((IniFileWriter *)&a9);
}

void UnicodeConverter::UnicodeConverter(UnicodeConverter *this, RomInstParam *a2)
{
  *(_QWORD *)this = 0;
  *((_DWORD *)this + 2) = 0;
  *((_DWORD *)this + 6) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 4) = a2;
  *((_DWORD *)this + 10) = RomInstParam::getCodeSet(a2);
}

void UnicodeConverter::~UnicodeConverter(UnicodeConverter *this)
{
  if (*(_QWORD *)this)
    OUTLINED_FUNCTION_0_9();
  if (*((_QWORD *)this + 2))
    OUTLINED_FUNCTION_0_9();
}

uint64_t UnicodeConverter::initTable()
{
  return 1;
}

uint64_t UnicodeConverter::MBCSToUCS2(UnicodeConverter *this, const char *__s, unsigned __int16 **a3)
{
  const char *v4;
  int v6;
  void *v7;
  unsigned __int16 *v8;
  unsigned __int16 *v10;
  unsigned int v11;
  _BOOL4 v13;
  uint64_t v14;

  if (__s)
  {
    v4 = __s;
    v6 = strlen(__s);
    v7 = (void *)*((_QWORD *)this + 2);
    if (v7)
    {
      if (*((_DWORD *)this + 6) < (v6 + 1))
        OUTLINED_FUNCTION_0_9();
    }
    else
    {
      *((_DWORD *)this + 6) = v6 + 1;
      v7 = (void *)OUTLINED_FUNCTION_1_6();
      *((_QWORD *)this + 2) = v7;
    }
    bzero(v7, (2 * v6 + 2));
    v8 = (unsigned __int16 *)*((_QWORD *)this + 2);
    v10 = v8;
LABEL_9:
    v11 = *(unsigned __int8 *)v4;
    v13 = v11 != 128 && v11 < 0xC9;
    while (1)
    {
      if (!*v4)
        goto LABEL_6;
      if ((v11 & 0x80) == 0)
        break;
      if (v13)
      {
        LOWORD(v11) = m_pLeadByteTable1[190 * v11 - 24575 + *((unsigned __int8 *)v4 + 1)];
LABEL_22:
        v14 = 2;
LABEL_23:
        *v10++ = v11;
        v4 += v14;
        goto LABEL_9;
      }
      if ((v11 + 1) >= 0xCBu)
      {
        LOWORD(v11) = m_pLeadByteTable2[94 * v11 - 19149 + *((unsigned __int8 *)v4 + 1)];
        goto LABEL_22;
      }
    }
    v14 = 1;
    goto LABEL_23;
  }
  v8 = 0;
LABEL_6:
  *a3 = v8;
  return 0;
}

uint64_t UnicodeConverter::getMBCS2UCSTableIdx(UnicodeConverter *this, unsigned int a2, int a3)
{
  int v3;
  int v4;

  if (a2 >= 0xC9)
    v3 = 94;
  else
    v3 = 190;
  if (a2 >= 0xC9)
    v4 = -19149;
  else
    v4 = -24575;
  return v4 + a3 + v3 * a2;
}

uint64_t ucs2len(const unsigned __int16 *a1)
{
  uint64_t i;

  for (i = 0; a1[i]; ++i)
    ;
  return i;
}

uint64_t UnicodeConverter::WCharToMBCS(uint64_t a1, __int32 *a2, _QWORD *a3)
{
  __int32 *v4;
  unsigned int v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  unsigned __int16 *v10;
  __int16 v11;
  unsigned int v12;
  _BYTE *v13;

  if (a2 && a3)
  {
    v4 = a2;
    v6 = (2 * wcslen(a2)) | 1;
    v7 = *(_BYTE **)a1;
    if (*(_QWORD *)a1)
    {
      if (*(_DWORD *)(a1 + 8) < v6)
        OUTLINED_FUNCTION_0_9();
    }
    else
    {
      *(_DWORD *)(a1 + 8) = v6;
      v7 = (_BYTE *)OUTLINED_FUNCTION_1_6();
      *(_QWORD *)a1 = v7;
    }
    bzero(v7, *(unsigned int *)(a1 + 8));
    v8 = *(_BYTE **)a1;
    while (1)
    {
      v9 = *v4;
      if (!(_DWORD)v9)
      {
        v13 = *(_BYTE **)a1;
LABEL_26:
        *a3 = v13;
        return 0;
      }
      if ((int)v9 >= 40960)
      {
        if ((v9 - 44032) >> 2 > 0xAE8)
        {
          if (v9 < 0xE000)
          {
            v11 = 32;
            goto LABEL_18;
          }
          v10 = &m_pRTable[(v9 - 57344)];
        }
        else
        {
          v10 = &m_pHTable[(v9 - 44032)];
        }
      }
      else
      {
        v10 = &m_pAITable[v9];
      }
      v12 = *v10;
      if (!v12)
      {
        *v8++ = 32;
        goto LABEL_22;
      }
      v11 = __rev16(v12);
LABEL_18:
      *v8 = HIBYTE(v11);
      if ((_BYTE)v11)
      {
        v8[1] = v11;
        v8 += 2;
      }
      else
      {
        ++v8;
      }
LABEL_22:
      ++v4;
    }
  }
  if (a3)
  {
    v13 = 0;
    goto LABEL_26;
  }
  return 0;
}

uint64_t UnicodeConverter::UCS2ToMBCS(UnicodeConverter *this, const unsigned __int16 *a2, char **a3, int a4)
{
  const unsigned __int16 *v5;
  unsigned int v7;
  void *v8;
  char *v9;
  uint64_t v10;
  int v11;
  char __s2[2];

  if (!a2)
  {
    *a3 = 0;
    return 0;
  }
  v5 = a2;
  v7 = (2 * ucs2len(a2)) | 1;
  v8 = *(void **)this;
  if (*(_QWORD *)this)
  {
    if (*((_DWORD *)this + 2) < v7)
      OUTLINED_FUNCTION_0_9();
  }
  else
  {
    *((_DWORD *)this + 2) = v7;
    v8 = (void *)OUTLINED_FUNCTION_1_6();
    *(_QWORD *)this = v8;
  }
  bzero(v8, *((unsigned int *)this + 2));
  v9 = *(char **)this;
  while (1)
  {
    v10 = *v5;
    if (!*v5)
      break;
    if (v10 >> 13 > 4)
    {
      if ((unsigned __int16)((unsigned __int16)(v10 + 21504) >> 2) > 0xAE8u)
      {
        if (v10 >> 13 <= 6)
        {
          strcpy(__s2, " ");
LABEL_18:
          strncat(v9, __s2, 2uLL);
          goto LABEL_20;
        }
        v11 = m_pRTable[(v10 - 57344)];
      }
      else
      {
        v11 = m_pHTable[(v10 - 44032)];
      }
    }
    else
    {
      if ((_DWORD)v10 == 92 && !a4)
      {
        strcpy(__s2, "\\");
        goto LABEL_18;
      }
      v11 = m_pAITable[v10];
    }
    *(_WORD *)__s2 = v11;
    if (v11)
      goto LABEL_18;
    *(_WORD *)&v9[strlen(v9)] = 32;
LABEL_20:
    v9 += strlen(v9);
    ++v5;
  }
  *a3 = *(char **)this;
  return 0;
}

uint64_t UnicodeConverter::GetMbcs2UCSTbIndex(UnicodeConverter *this, void *a2)
{
  return 0xFFFFFFFFLL;
}

void OUTLINED_FUNCTION_0_9()
{
  JUMPOUT(0x2495994A8);
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return operator new[]();
}

void ConverterInterface::closeBase(ConverterInterface *this)
{
  if (*((_QWORD *)this + 5))
    OUTLINED_FUNCTION_2_6();
  *((_QWORD *)this + 5) = 0;
  if (*((_QWORD *)this + 1))
  {
    UnicodeConverter::~UnicodeConverter(*((UnicodeConverter **)this + 1));
    OUTLINED_FUNCTION_0_10();
  }
  *((_QWORD *)this + 1) = 0;
  if (*((_QWORD *)this + 3))
  {
    InputManager::~InputManager(*((InputManager **)this + 3));
    OUTLINED_FUNCTION_5_1();
  }
  *((_QWORD *)this + 3) = 0;
  OUTLINED_FUNCTION_12();
}

void sub_2486AC1F8()
{
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x2495994B4]();
  OUTLINED_FUNCTION_7_0();
}

void ConverterInterface::initBase(ConverterInterface *this, RomInstParam *a2)
{
  InputManager *v3;

  *((_QWORD *)this + 2) = a2;
  *(_QWORD *)a2 = this;
  OUTLINED_FUNCTION_9_0();
  v3 = (InputManager *)operator new();
  InputManager::InputManager(v3, *((RomInstParam **)this + 2));
  *((_QWORD *)this + 3) = v3;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 1) = 0;
  *((_BYTE *)this + 32) = 0;
  *((_BYTE *)this + 56) = 0;
  OUTLINED_FUNCTION_12();
}

void sub_2486AC274()
{
  OUTLINED_FUNCTION_5_1();
}

uint64_t ConverterInterface::UCS2ToMBCS(ConverterInterface *this, const unsigned __int16 *a2, char **a3, int a4)
{
  UnicodeConverter *v7;

  v7 = (UnicodeConverter *)*((_QWORD *)this + 1);
  if (!v7)
  {
    v7 = (UnicodeConverter *)OUTLINED_FUNCTION_1_7();
    UnicodeConverter::UnicodeConverter(v7, *((RomInstParam **)this + 2));
    *((_QWORD *)this + 1) = v7;
  }
  return UnicodeConverter::UCS2ToMBCS(v7, a2, a3, a4);
}

void sub_2486AC2E4()
{
  OUTLINED_FUNCTION_0_10();
}

uint64_t ConverterInterface::WCharToMBCS(uint64_t a1, __int32 *a2, _QWORD *a3)
{
  UnicodeConverter *v5;

  v5 = *(UnicodeConverter **)(a1 + 8);
  if (!v5)
  {
    v5 = (UnicodeConverter *)OUTLINED_FUNCTION_1_7();
    UnicodeConverter::UnicodeConverter(v5, *(RomInstParam **)(a1 + 16));
    *(_QWORD *)(a1 + 8) = v5;
  }
  return UnicodeConverter::WCharToMBCS((uint64_t)v5, a2, a3);
}

void sub_2486AC348()
{
  OUTLINED_FUNCTION_0_10();
}

uint64_t ConverterInterface::MBCSToUCS2(ConverterInterface *this, const char *__s, unsigned __int16 **a3)
{
  UnicodeConverter *v5;

  v5 = (UnicodeConverter *)*((_QWORD *)this + 1);
  if (!v5)
  {
    v5 = (UnicodeConverter *)OUTLINED_FUNCTION_1_7();
    UnicodeConverter::UnicodeConverter(v5, *((RomInstParam **)this + 2));
    *((_QWORD *)this + 1) = v5;
  }
  return UnicodeConverter::MBCSToUCS2(v5, __s, a3);
}

void sub_2486AC3AC()
{
  OUTLINED_FUNCTION_0_10();
}

void ConverterInterface::insertIndex(InputManager **this)
{
  InputManager::insertIndex(this[3]);
}

void ConverterInterface::addParam(InputManager **this, const char *a2, int a3)
{
  InputManager::addParam(this[3], a2, a3);
}

BOOL ConverterInterface::outputIndexOrParam(ETIqueue ***this, char *a2, int a3)
{
  _BOOL8 result;
  int v7;
  int v8;
  char *__s2;

  result = InputManager::hasMoreElement(this[3]);
  if (result)
  {
    __s2 = 0;
    InputManager::getNextOffset(this[3]);
    while (v7 <= a3)
    {
      *(_WORD *)&a2[strlen(a2)] = 32;
      InputManager::getNextData(this[3], (const char **)&__s2);
      strncat(a2, __s2, v8);
      InputManager::removeElement((InputManager *)this[3]);
      result = InputManager::hasMoreElement(this[3]);
      if (!result)
        return result;
      InputManager::getNextOffset(this[3]);
    }
    return 1;
  }
  return result;
}

void ConverterInterface::addText(ConverterInterface *this, char *a2, int a3, char a4)
{
  int CodeSet;
  BOOL v8;

  if (a2 && a3)
  {
    RomInstParam::setInputType(*((RomInstParam **)this + 2), a4);
    CodeSet = RomInstParam::getCodeSet(*((RomInstParam **)this + 2));
    if (CodeSet)
      v8 = CodeSet == 657408;
    else
      v8 = 1;
    if (v8 || CodeSet == 655360)
      InputManager::addText(*((_QWORD *)this + 3), a2, a3, CodeSet);
  }
}

uint64_t ConverterInterface::trans2defaultCodeset(uint64_t a1, uint64_t a2, uint64_t a3, int a4, _QWORD *a5)
{
  uint64_t result;

  result = a3;
  if (a4 && a4 != 657408 && a4 != 655360)
    return 0;
  *a5 = a2;
  return result;
}

SkipList *ConverterInterface::newDict(ConverterInterface *this)
{
  SkipList *v1;

  OUTLINED_FUNCTION_11();
  v1 = (SkipList *)operator new();
  SkipList::SkipList(v1);
  if (!*((_QWORD *)v1 + 2))
  {
    (*(void (**)(SkipList *))(*(_QWORD *)v1 + 8))(v1);
    return 0;
  }
  return v1;
}

void sub_2486AC578(_Unwind_Exception *a1)
{
  OUTLINED_FUNCTION_11();
  MEMORY[0x2495994B4]();
  _Unwind_Resume(a1);
}

void ConverterInterface::deleteDict(ConverterInterface *this, void *a2)
{
  if (a2)
    (*(void (**)(void *))(*(_QWORD *)a2 + 8))(a2);
  *(_QWORD *)(*((_QWORD *)this + 6) + 8) = 0;
  OUTLINED_FUNCTION_12();
}

off_t ConverterInterface::findDictFile(ConverterInterface *this, const char *a2, char *a3)
{
  stat v5;

  if (fileFindInPath((uint64_t)a2) && !stat(a3, &v5))
    return v5.st_size;
  else
    return -1;
}

uint64_t ConverterInterface::loadDict(ConverterInterface *this, void *a2, uint64_t a3, const char *a4)
{
  ConverterInterface *v4;
  const char *v5;
  const char *v6;
  SkipList *v7;
  SkipList *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  char v13[4096];
  uint64_t v14;

  v4 = (ConverterInterface *)MEMORY[0x24BDAC7A8](this);
  v6 = v5;
  v8 = v7;
  v14 = *MEMORY[0x24BDAC8D0];
  v9 = -3;
  if (ConverterInterface::findDictFile(v4, v5, v13) >= 1)
  {
    v10 = SkipList::load(v8, v6);
    if (v10 == -2)
      v11 = -1;
    else
      v11 = -3;
    if (v10 == -1)
      v11 = -2;
    if (v10 < 0)
      return v11;
    else
      return 0;
  }
  return v9;
}

uint64_t ConverterInterface::saveDict(ConverterInterface *this, SkipList *a2, uint64_t a3, const char *__filename)
{
  int v4;
  uint64_t v5;

  v4 = SkipList::save(a2, __filename);
  v5 = -3;
  if (v4 == -2)
    v5 = -1;
  if (v4 == -1)
    v5 = -2;
  if (v4 >= 0)
    return 0;
  else
    return v5;
}

uint64_t ConverterInterface::lookupDictExt(uint64_t a1, SkipList *a2, int a3, char *a4, unsigned __int8 a5, _QWORD *a6, _QWORD *a7, _DWORD *a8, int a9)
{
  char *v12;
  char v16;
  uint64_t result;

  v12 = a4;
  v16 = 1;
  if (a9)
  {
    if (a9 != 655360 && a9 != 657408)
    {
      if (a4)
      {
        strlen(0);
        v12 = (char *)OUTLINED_FUNCTION_6_0();
        strcpy(v12, 0);
        v16 = 0;
      }
      a5 = 0;
    }
  }
  result = RomUserDict::lookupDictExt(*(RomUserDict **)(a1 + 48), a2, a3, (unsigned __int8 *)v12, a5, a6, a7, a8);
  if ((v16 & 1) == 0)
  {
    if (v12)
      OUTLINED_FUNCTION_2_6();
  }
  return result;
}

void ConverterInterface::findNextDictEntryExt(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t Next;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;

  v5 = OUTLINED_FUNCTION_4_1(a1, a2);
  Next = SkipList::getNext(v5, v6, v7);
  if ((_DWORD)Next)
    OUTLINED_FUNCTION_3_5(Next, v9, v10, v11, v12, v13, v14, v15, v19);
  else
    OUTLINED_FUNCTION_10();
  *v4 = v16;
  *v3 = v17;
  *v2 = v18;
  OUTLINED_FUNCTION_8_0();
}

void ConverterInterface::findFirstDictEntryExt(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t First;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;

  v5 = OUTLINED_FUNCTION_4_1(a1, a2);
  First = SkipList::getFirst(v5, v6, v7);
  if ((_DWORD)First)
    OUTLINED_FUNCTION_3_5(First, v9, v10, v11, v12, v13, v14, v15, v19);
  else
    OUTLINED_FUNCTION_10();
  *v4 = v16;
  *v3 = v17;
  *v2 = v18;
  OUTLINED_FUNCTION_8_0();
}

uint64_t ConverterInterface::updateDictExt(uint64_t a1, SkipList *a2, int a3, char *a4, uint64_t a5, const char *a6, unsigned int a7, int a8, int a9)
{
  char *v12;
  BOOL v16;
  char v17;
  BOOL v18;
  uint64_t v19;
  uint64_t result;
  char v21;

  v12 = a4;
  if (a9)
    v16 = a9 == 657408;
  else
    v16 = 1;
  if (v16 || a9 == 655360)
  {
    a5 = a5;
LABEL_7:
    v17 = 1;
    goto LABEL_8;
  }
  if (!a4)
  {
    a5 = 0;
    goto LABEL_7;
  }
  strlen(0);
  v12 = (char *)OUTLINED_FUNCTION_6_0();
  strcpy(v12, 0);
  v17 = 0;
  a5 = 0;
LABEL_8:
  if (a9)
    v18 = a9 == 657408;
  else
    v18 = 1;
  if (v18 || a9 == 655360)
  {
    v19 = a7;
  }
  else
  {
    a6 = 0;
    v19 = 0;
  }
  result = RomUserDict::updateDictExt(*(RomUserDict **)(a1 + 48), a2, a3, (unsigned __int8 *)v12, a5, a6, v19, a8);
  if (v12)
    v21 = v17;
  else
    v21 = 1;
  if ((v21 & 1) == 0)
    OUTLINED_FUNCTION_2_6();
  return result;
}

uint64_t ConverterInterface::setDict(uint64_t this, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(this + 48) + 8) = a2;
  return this;
}

uint64_t ConverterInterface::stop(ConverterInterface *this)
{
  *((_BYTE *)this + 32) = 1;
  return 1;
}

uint64_t ConverterInterface::resume(ConverterInterface *this)
{
  while (*((_BYTE *)this + 56))
    ETIThread::sleep(100);
  (*(void (**)(ConverterInterface *))(*(_QWORD *)this + 32))(this);
  *((_BYTE *)this + 32) = 0;
  return 1;
}

void OUTLINED_FUNCTION_0_10()
{
  JUMPOUT(0x2495994B4);
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return operator new();
}

void OUTLINED_FUNCTION_2_6()
{
  JUMPOUT(0x2495994A8);
}

uint64_t OUTLINED_FUNCTION_3_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  _QWORD *v10;
  uint64_t result;

  result = 0;
  *v10 = *(_QWORD *)(a9 + 16);
  *v9 = *(int *)(a9 + 24);
  return result;
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_5_1()
{
  JUMPOUT(0x2495994B4);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return operator new[]();
}

void OUTLINED_FUNCTION_7_0()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return 5;
}

void InputManager::InputManager(InputManager *this, RomInstParam *a2)
{
  ETIqueue *v3;

  *((_QWORD *)this + 1) = a2;
  v3 = (ETIqueue *)OUTLINED_FUNCTION_3_6();
  ETIqueue::ETIqueue(v3, 0x80u);
  *(_QWORD *)this = v3;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_DWORD *)this + 10) = 0;
  OUTLINED_FUNCTION_5_2();
}

void sub_2486ACB40()
{
  OUTLINED_FUNCTION_4_2();
}

void InputManager::~InputManager(InputManager *this)
{
  if (*((_QWORD *)this + 6))
    OUTLINED_FUNCTION_0_11();
  if (*(_QWORD *)this)
    (*(void (**)(_QWORD))(**(_QWORD **)this + 8))(*(_QWORD *)this);
  OUTLINED_FUNCTION_5_2();
}

uint64_t InputManager::remove(ETIqueue **this)
{
  uint64_t result;

  result = ETIqueue::reset(*this);
  this[4] = 0;
  *((_DWORD *)this + 10) = 0;
  return result;
}

void InputManager::addText(uint64_t a1, char *__s, int a3, int a4)
{
  size_t v8;
  int v9;

  v8 = strlen(__s);
  if (v8 >= a3)
    v9 = a3;
  else
    v9 = v8;
  if (v9)
  {
    *(_QWORD *)(a1 + 32) = __s;
    *(_DWORD *)(a1 + 40) = v9;
    *(_DWORD *)(a1 + 24) = a4;
  }
  OUTLINED_FUNCTION_8_1();
}

uint64_t InputManager::getText(InputManager *this, char **a2, unsigned int *a3, char *a4, unsigned int a5)
{
  char *v7;
  const char *v8;
  int CodeSet;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t result;
  uint64_t i;
  char v19;

  if (a5)
    v7 = a4;
  else
    v7 = 0;
  *a2 = v7;
  *a3 = a5;
  if (*((_DWORD *)this + 10))
  {
    v8 = a4;
    CodeSet = RomInstParam::getCodeSet(*((RomInstParam **)this + 1));
    v12 = *((_DWORD *)this + 6);
    if (CodeSet == v12)
    {
      if (a5)
      {
        v13 = *((_DWORD *)this + 10) + a5;
        *a3 = v13;
        v14 = *((_QWORD *)this + 6);
        if (v14 && strlen(*((const char **)this + 6)) >= v13 + 1)
        {
          v15 = 0;
          v16 = *((_QWORD *)this + 6);
        }
        else
        {
          v16 = operator new[]();
          *((_QWORD *)this + 6) = v16;
          v15 = 1;
        }
        if ((const char *)v16 != v8)
        {
          for (i = 0; a5 != i; ++i)
            *(_BYTE *)(*((_QWORD *)this + 6) + i) = v8[i];
          v8 = (const char *)*((_QWORD *)this + 6);
        }
        memcpy((void *)&v8[a5], *((const void **)this + 4), *((int *)this + 10));
        *(_BYTE *)(*((_QWORD *)this + 6) + *a3) = 0;
        v19 = v15 ^ 1;
        if (!v14)
          v19 = 1;
        if ((v19 & 1) == 0)
          OUTLINED_FUNCTION_0_11();
        *a2 = (char *)*((_QWORD *)this + 6);
        goto LABEL_30;
      }
    }
    else
    {
      if (a5)
        return 4;
      RomInstParam::setParam(*((RomInstParam **)this + 1), 2, v12);
    }
    *a2 = (char *)*((_QWORD *)this + 4);
    *a3 = *((_DWORD *)this + 10);
LABEL_30:
    result = 0;
    *((_QWORD *)this + 4) = 0;
    *((_DWORD *)this + 10) = 0;
    return result;
  }
  if (a5)
    return 0;
  if (ETIqueue::isEmpty(*(ETIqueue **)this))
    return 1;
  return 2;
}

void InputManager::insertIndex(InputManager *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  int v5;

  v2 = OUTLINED_FUNCTION_3_6();
  v3 = OUTLINED_FUNCTION_2_7();
  v5 = v4(v3);
  *(_QWORD *)v2 = &unk_25198C6F0;
  *(_DWORD *)(v2 + 8) = v5;
  *(_DWORD *)(v2 + 12) = 0;
  *((_QWORD *)this + 2) = v2;
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)this + 16))(*(_QWORD *)this, v2);
  OUTLINED_FUNCTION_6_1();
}

void sub_2486ACE0C()
{
  OUTLINED_FUNCTION_4_2();
}

BOOL InputManager::hasMoreElement(ETIqueue **this)
{
  return !ETIqueue::isEmpty(*this);
}

void InputManager::getNextElement(ETIqueue **this)
{
  if (!ETIqueue::isEmpty(*this))
    (*(void (**)(ETIqueue *, char *))(*(_QWORD *)*this + 32))(*this, (char *)this + 16);
  OUTLINED_FUNCTION_5_2();
}

void InputManager::getNextOffset(ETIqueue **this)
{
  ETIqueue *v2;

  InputManager::getNextElement(this);
  this[2] = v2;
  OUTLINED_FUNCTION_6_1();
}

void InputManager::getNextData(ETIqueue **this, const char **a2)
{
  ETIqueue *v4;

  InputManager::getNextElement(this);
  this[2] = v4;
  if (v4)
  {
    (*(void (**)(ETIqueue *, const char **))(*(_QWORD *)v4 + 16))(v4, a2);
  }
  else
  {
    *a2 = 0;
    OUTLINED_FUNCTION_6_1();
  }
}

uint64_t InputManager::removeElement(InputManager *this)
{
  uint64_t result;

  (*(void (**)(_QWORD, char *))(**(_QWORD **)this + 24))(*(_QWORD *)this, (char *)this + 16);
  result = *((_QWORD *)this + 2);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void InputManager::addParam(InputManager *this, const char *a2, int a3)
{
  QElementParam *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  int v9;

  if (a2 && a3)
  {
    OUTLINED_FUNCTION_1_8();
    v6 = (QElementParam *)operator new();
    v7 = OUTLINED_FUNCTION_2_7();
    v9 = v8(v7);
    QElementParam::QElementParam(v6, a2, a3, v9);
    *((_QWORD *)this + 2) = v6;
    (*(void (**)(_QWORD, QElementParam *))(**(_QWORD **)this + 16))(*(_QWORD *)this, v6);
  }
  OUTLINED_FUNCTION_8_1();
}

void sub_2486ACFBC()
{
  OUTLINED_FUNCTION_1_8();
  MEMORY[0x2495994B4]();
  OUTLINED_FUNCTION_7_1();
}

void QElementIndex::~QElementIndex(QElementIndex *this)
{
  JUMPOUT(0x2495994B4);
}

uint64_t QElementIndex::getData(QElementIndex *this, const char **a2)
{
  return 3;
}

void QElementParam::QElementParam(QElementParam *this, const char *a2, int a3, int a4)
{
  char *v8;

  *(_QWORD *)this = &unk_25198C740;
  if (a2)
  {
    v8 = (char *)operator new[]();
    *((_QWORD *)this + 2) = v8;
    strcpy(v8, a2)[a3] = 0;
  }
  else
  {
    a3 = 0;
    *((_QWORD *)this + 2) = 0;
  }
  *((_DWORD *)this + 6) = a3;
  *((_DWORD *)this + 2) = a4;
  *((_DWORD *)this + 3) = 1;
}

void QElementParam::~QElementParam(QElementParam *this)
{
  QElementParam::~QElementParam(this);
  JUMPOUT(0x2495994B4);
}

{
  uint64_t v1;

  *(_QWORD *)this = &unk_25198C740;
  v1 = *((_QWORD *)this + 2);
  if (v1)
    MEMORY[0x2495994A8](v1, 0x1000C8077774924);
}

uint64_t QElementParam::getData(QElementParam *this, const char **a2)
{
  *a2 = (const char *)*((_QWORD *)this + 2);
  return *((unsigned int *)this + 6);
}

void OUTLINED_FUNCTION_0_11()
{
  JUMPOUT(0x2495994A8);
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  uint64_t v0;

  return **(_QWORD **)(v0 + 8);
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return operator new();
}

void OUTLINED_FUNCTION_4_2()
{
  JUMPOUT(0x2495994B4);
}

void OUTLINED_FUNCTION_7_1()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

_QWORD *dynaBufNew(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  size_t v5;

  v2 = malloc_type_malloc(0x20uLL, 0x1CE13EC1uLL);
  v3 = v2;
  if (v2)
  {
    *v2 = 0;
    if (a1)
      v4 = a1 + 1;
    else
      v4 = 16;
    if (v4)
      v5 = ((v4 - 1) & 0xFFFFFFFFFFFFFFF0) + 16;
    else
      v5 = 16;
    if (resize((uint64_t)v2, v5))
    {
      *(_BYTE *)*v3 = 0;
      v3[2] = 0;
      v3[3] = 0;
    }
    else
    {
      free(v3);
      return 0;
    }
  }
  return v3;
}

uint64_t resize(uint64_t a1, size_t size)
{
  void *v4;
  uint64_t result;

  if (!size)
    return 0;
  v4 = *(void **)a1;
  if (v4)
  {
    result = (uint64_t)malloc_type_realloc(v4, size, 0xC70FC592uLL);
    if (!result)
      return result;
    *(_QWORD *)a1 = result;
  }
  else
  {
    result = (uint64_t)malloc_type_malloc(size, 0x82F6DFB8uLL);
    *(_QWORD *)a1 = result;
    if (!result)
      return result;
  }
  *(_QWORD *)(a1 + 8) = size;
  return 1;
}

uint64_t dynaBufDelete(void **a1)
{
  if (a1)
  {
    free(*a1);
    free(a1);
  }
  return 0;
}

uint64_t dynaBufReset(uint64_t result)
{
  *(_QWORD *)(result + 16) = 0;
  **(_BYTE **)result = 0;
  *(_QWORD *)(result + 24) = 0;
  return result;
}

void dynaBufAddChar(uint64_t *a1, char a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t i;
  _BYTE *v9;
  uint64_t v10;

  if (a3)
  {
    v6 = a1[2];
  }
  else
  {
    v7 = a1[2];
    v6 = a1[3];
    if (v6 != v7)
      goto LABEL_10;
  }
  if (setUsed((uint64_t)a1, v6 + 1))
  {
    if (a3)
    {
      for (i = a1[2]; ; --i)
      {
        v6 = a1[3];
        if (i < v6 + 1)
          break;
        v9 = (_BYTE *)(*a1 + i);
        *v9 = *(v9 - 1);
      }
LABEL_12:
      v10 = *a1;
      a1[3] = v6 + 1;
      *(_BYTE *)(v10 + v6) = a2;
      goto LABEL_13;
    }
    v7 = a1[2];
    v6 = a1[3];
LABEL_10:
    if (v6 == v7 - 1)
    {
      *(_BYTE *)(*a1 + v7) = 0;
      v6 = a1[3];
    }
    goto LABEL_12;
  }
LABEL_13:
  OUTLINED_FUNCTION_0_12();
}

uint64_t setUsed(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_QWORD *)(a1 + 8) >= (unint64_t)(a2 + 1)
    || (result = resize(a1, (a2 & 0xFFFFFFFFFFFFFFF0) + 16), (_DWORD)result))
  {
    *(_QWORD *)(a1 + 16) = a2;
    return 1;
  }
  return result;
}

void dynaBufAddString(uint64_t *a1, char *__s, int a3)
{
  char *v4;
  size_t v6;
  size_t v7;
  unint64_t v8;
  unint64_t i;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v4 = __s;
  v6 = strlen(__s);
  v7 = v6;
  if (a3 || (v8 = a1[2] - a1[3], v7 = v6 - v8, v6 > v8))
  {
    if (v7)
    {
      if (!setUsed((uint64_t)a1, a1[2] + v7))
        goto LABEL_11;
      *(_BYTE *)(*a1 + a1[2]) = 0;
      if (a3)
      {
        for (i = a1[2] - 1; i >= a1[3] + v7; OUTLINED_FUNCTION_1_9(i))
          ;
      }
    }
  }
  while (1)
  {
    v12 = *v4;
    if (!*v4)
      break;
    v10 = *a1;
    v11 = a1[3];
    a1[3] = v11 + 1;
    *(_BYTE *)(v10 + v11) = v12;
    ++v4;
  }
LABEL_11:
  OUTLINED_FUNCTION_0_12();
}

void dynaBufAddInt(uint64_t *a1, int a2, int a3)
{
  char __s[20];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  __sprintf_chk(__s, 0, 0x14uLL, "%d", a2);
  dynaBufAddString(a1, __s, a3);
}

void dynaBufAddDynaBuf(uint64_t *a1, _QWORD *a2, int a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t i;
  unint64_t j;
  char v11;
  uint64_t v12;
  uint64_t v13;

  if (a3)
  {
    v6 = a2[2];
  }
  else
  {
    v7 = a1[2] - a1[3];
    v8 = a2[2];
    v6 = v8 - v7;
    if (v8 <= v7)
      goto LABEL_10;
  }
  if (v6)
  {
    if (!setUsed((uint64_t)a1, a1[2] + v6))
      goto LABEL_14;
    if (a3)
    {
      for (i = a1[2]; i >= a1[3] + v6; OUTLINED_FUNCTION_1_9(i))
        ;
    }
  }
LABEL_10:
  for (j = 0; j < a2[2]; ++j)
  {
    v11 = *(_BYTE *)(*a2 + j);
    v12 = *a1;
    v13 = a1[3];
    a1[3] = v13 + 1;
    *(_BYTE *)(v12 + v13) = v11;
  }
  *(_BYTE *)(*a1 + a1[2]) = 0;
LABEL_14:
  OUTLINED_FUNCTION_0_12();
}

uint64_t *dynaBufDeleteChars(uint64_t *result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = result[2];
  v2 = result[3];
  if (v3 - v2 <= a2)
  {
    v5 = *result;
    result[2] = v2;
    *(_BYTE *)(v5 + v2) = 0;
  }
  else if (a2)
  {
    v4 = v3 - a2;
    result[2] = v4;
    while (v2 <= v4)
    {
      *(_BYTE *)(*result + v2) = *(_BYTE *)(*result + v2 + a2);
      ++v2;
      v4 = result[2];
    }
  }
  return result;
}

uint64_t dynaBufLength(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t dynaBufMoveRel(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;

  if ((a2 & 0x80000000) != 0)
  {
    v3 = -a2;
    v4 = *(_QWORD *)(a1 + 24);
    v5 = v4 >= v3;
    v2 = v4 - v3;
    if (!v5)
      v2 = 0;
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 24) + a2;
    if (v2 >= *(_QWORD *)(a1 + 16))
      v2 = *(_QWORD *)(a1 + 16);
  }
  return OUTLINED_FUNCTION_2_8(a1, v2);
}

uint64_t dynaBufMoveAbs(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  if ((a2 & 0x80000000) != 0)
    v2 = *(_QWORD *)(a1 + 16);
  else
    v2 = a2;
  return OUTLINED_FUNCTION_2_8(a1, v2);
}

BOOL dynaBufAtEnd(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24) == *(_QWORD *)(a1 + 16);
}

uint64_t dynaBufChar(_QWORD *a1, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0 || a1[2] < (unint64_t)a2)
    return 0;
  else
    return *(char *)(*a1 + a2);
}

uint64_t dynaBufCurrentChar(uint64_t *a1, int a2)
{
  unint64_t v2;
  uint64_t v3;

  v2 = a1[3];
  if (a2 && v2 < a1[2])
  {
    v3 = *a1;
    a1[3] = v2 + 1;
  }
  else
  {
    v3 = *a1;
  }
  return *(char *)(v3 + v2);
}

uint64_t dynaBufContents(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t dynaBufExtract(_QWORD *a1, unsigned int a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;

  if ((a2 & 0x80000000) != 0 || a1[2] < (unint64_t)a2)
    return 0;
  v4 = 0;
  v5 = a4;
  while (a4 != v4)
  {
    if (a1[2] <= (unint64_t)a2 + v4)
    {
      v5 = v4;
      break;
    }
    *(_BYTE *)(a3 + v4) = *(_BYTE *)(*a1 + a2 + v4);
    ++v4;
  }
  *(_BYTE *)(a3 + v5) = 0;
  return a3;
}

void OUTLINED_FUNCTION_1_9(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v2 + a1) = *(_BYTE *)(v2 + a1 + v1);
}

uint64_t OUTLINED_FUNCTION_2_8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a1 + 24) = a2;
  return a2;
}

int strcasecmp(const char *a1, const char *a2)
{
  __darwin_ct_rune_t v4;
  int v5;
  __darwin_ct_rune_t v6;
  __darwin_ct_rune_t v7;
  __darwin_ct_rune_t v8;

  while (1)
  {
    v4 = *a2;
    v5 = *(unsigned __int8 *)a2;
    if (!*a1)
      goto LABEL_10;
    if (!*a2)
      return 1;
    v6 = __tolower(*a1);
    if (v6 != __tolower(v4))
      break;
    ++a1;
    ++a2;
  }
  v7 = *a2;
  v5 = v7;
  if (!*a1)
  {
LABEL_10:
    if (v5)
      return -1;
    else
      return 0;
  }
  if (!(_BYTE)v7)
    return 1;
  v8 = __tolower(*a1);
  if (v8 < __tolower(v7))
    return -1;
  else
    return 1;
}

char *__cdecl strdup(const char *__s1)
{
  size_t v2;
  char *result;

  v2 = strlen(__s1);
  result = (char *)malloc_type_malloc(v2 + 1, 0xEF87DF6uLL);
  if (result)
    return strcpy(result, __s1);
  return result;
}

uint64_t atoiOK(char *a1, _DWORD *a2)
{
  int v3;
  char *v4;
  char v5;
  int v6;
  char i;
  int v8;
  unsigned int v9;
  int v10;
  char v11;
  uint64_t result;
  uint64_t v13;

  v3 = *a1;
  *a2 = 0;
  if (v3 == 45)
    v4 = a1 + 1;
  else
    v4 = a1;
  while (1)
  {
    v5 = *v4;
    if (!*v4)
      return 0;
    if (!isspace(*v4))
      break;
    ++v4;
  }
  v6 = 0;
  for (i = v5; ; i = v11)
  {
    v8 = i;
    v9 = i - 48;
    if (v9 >= 0xA)
      break;
    if (v6 > 214748364)
      return 0;
    v10 = 10 * v6;
    *a2 = 10 * v6;
    if (10 * v6 > -2147483601 - v8)
      return 0;
    v6 = v10 + v9;
    *a2 = v10 + v9;
    v11 = *++v4;
  }
  v13 = 1;
  while (i)
  {
    result = isspace(i);
    if (!(_DWORD)result)
      return result;
    i = v4[v13++];
  }
  if (v3 == 45)
    *a2 = -v6;
  return 1;
}

uint64_t cleanLiteral(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  unsigned __int8 *i;
  int v6;
  int v7;
  int v9;
  uint64_t v10;
  unsigned __int8 *v11;
  int v12;
  char v14;

  v3 = a1;
  if (a2)
  {
    if (*a1 != a2)
      return 0xFFFFFFFFLL;
    v3 = a1 + 1;
  }
  v4 = 0;
  for (i = v3; ; v3 = i)
  {
    v7 = *i++;
    v6 = v7;
    if (v7 == a3 || v6 == 0)
      break;
    if (v6 == 92)
    {
      i = v3 + 2;
      v9 = (char)v3[1];
      if ((v9 - 48) >= 8)
      {
        if (v9 == 98)
        {
          LOBYTE(v6) = 8;
        }
        else if (v9 == 102)
        {
          LOBYTE(v6) = 12;
        }
        else
        {
          if (v9 == 116)
            v14 = 9;
          else
            v14 = v3[1];
          if (v9 == 114)
            v14 = 13;
          if (v9 == 110)
            LOBYTE(v6) = 10;
          else
            LOBYTE(v6) = v14;
        }
      }
      else
      {
        v10 = 0;
        LOBYTE(v6) = v3[1] - 48;
        v11 = v3 + 4;
        while (1)
        {
          if ((_DWORD)v10 == 2)
          {
            i = v11;
            goto LABEL_32;
          }
          v12 = (char)i[v10];
          if (v12 > 55 || (v12 - 48) > 9)
            break;
          LOBYTE(v6) = v12 + 8 * v6 - 48;
          ++v10;
        }
        i += v10;
      }
    }
LABEL_32:
    *a1++ = v6;
    v4 = (v4 + 1);
  }
  *a1 = 0;
  return v4;
}

uint64_t strncpyWithEllipsis(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t i;
  uint64_t v4;
  int v5;

  for (i = 0; a3 != i; ++i)
  {
    if (!*(_BYTE *)(a2 + i))
    {
      a3 = i;
      break;
    }
    *(_BYTE *)(result + i) = *(_BYTE *)(a2 + i);
  }
  *(_BYTE *)(result + a3) = 0;
  if (*(_BYTE *)(a2 + a3))
  {
    v4 = 0;
    v5 = a3 - 1;
    while (v4 != -3)
    {
      if (((v5 + (_DWORD)v4) & 0x80000000) == 0)
        *(_BYTE *)(result + (v5 + v4)) = 46;
      --v4;
    }
  }
  return result;
}

uint64_t changeExtension(uint64_t result, uint64_t a2, int a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v4 = 0;
  v5 = a3 & ~(a3 >> 31);
  while (v5 != v4)
  {
    v6 = *(unsigned __int8 *)(result + v4);
    if (!*(_BYTE *)(result + v4) || v6 == 46)
    {
      if (a4 && *a4)
      {
        v7 = 0;
        LODWORD(v5) = v4 + 1;
        *(_BYTE *)(a2 + v4) = 46;
        if (a3 > (int)v4 + 1)
          LODWORD(v5) = a3;
        while ((int)v4 + (int)v7 + 1 < a3)
        {
          if (!a4[v7])
          {
            LODWORD(v5) = v4 + v7 + 1;
            goto LABEL_15;
          }
          *(_BYTE *)(a2 + v7 + v4 + 1) = a4[v7];
          ++v7;
        }
      }
      else
      {
        LODWORD(v5) = v4;
      }
      break;
    }
    *(_BYTE *)(a2 + v4++) = v6;
  }
LABEL_15:
  *(_BYTE *)(a2 + (int)v5) = 0;
  return result;
}

uint64_t changeMatchingExt(uint64_t a1, _BYTE *a2, uint64_t a3, int a4, _BYTE *a5)
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;

  result = hasExtension(a1, a2);
  if ((_DWORD)result)
    return changeExtension(a1, a3, a4, a5);
  v10 = 0;
  v11 = a4 & ~(a4 >> 31);
  while (1)
  {
    if (v11 == v10)
    {
      v10 = a4 & ~(a4 >> 31);
      goto LABEL_9;
    }
    if (!*(_BYTE *)(a1 + v10))
      break;
    *(_BYTE *)(a3 + v10) = *(_BYTE *)(a1 + v10);
    ++v10;
  }
  LODWORD(v11) = v10;
LABEL_9:
  *(_BYTE *)(a3 + v10) = 46;
  if (a4 <= (int)v11 + 1)
    v12 = v11 + 1;
  else
    v12 = a4;
  while (++v10 < a4)
  {
    if (!*a5)
    {
      v12 = v10;
      break;
    }
    *(_BYTE *)(a3 + v10) = *a5++;
  }
  *(_BYTE *)(a3 + v12) = 0;
  return result;
}

BOOL hasExtension(_BOOL8 result, _BYTE *a2)
{
  unsigned __int8 *i;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;

  if (result)
  {
    for (i = (unsigned __int8 *)(result + 1); ; ++i)
    {
      v3 = *(i - 1);
      if (!*(i - 1) || v3 == 46)
        break;
    }
    if (a2 && *(i - 1))
    {
      if (!*a2)
        return 0;
      do
      {
        v5 = *i++;
        v4 = v5;
        v7 = *a2++;
        v6 = v7;
      }
      while (v4 == v7 && v6 != 0);
      return v4 == v6;
    }
    result = v3 == 0;
    if (a2 && !*(i - 1))
      return *a2 == 0;
  }
  return result;
}

uint64_t stripPath(uint64_t result)
{
  uint64_t v1;
  uint64_t i;

  if (result)
  {
    v1 = 0;
LABEL_3:
    for (i = v1; *(_BYTE *)(result + i); ++i)
    {
      if (*(_BYTE *)(result + i) == 47)
      {
        v1 = i + 1;
        goto LABEL_3;
      }
    }
    result += (int)v1;
  }
  return result;
}

_BYTE *stripFileName(_BYTE *result, _BYTE *a2)
{
  _BYTE *v2;
  int v3;

  v2 = a2;
  while (1)
  {
    v3 = *result;
    if (!*result)
      break;
    if (v3 == 47)
      v2 = a2;
    *a2++ = v3;
    ++result;
  }
  *v2 = 0;
  return result;
}

uint64_t bareFilename(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;

  v5 = stripPath(a1);
  return changeExtension(v5, a2, a3, 0);
}

_BYTE *fileExists(_BYTE *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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

  if (result)
  {
    if (*result)
    {
      OUTLINED_FUNCTION_0_13((uint64_t)result, a2, a3, a4, a5, a6, a7, a8, v16);
      return (_BYTE *)(OUTLINED_FUNCTION_1_10(v8, v9, v10, v11, v12, v13, v14, v15, v17) == 0);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

_BYTE *filenameModTime(_BYTE *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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

  if (result)
  {
    if (!*result)
      return 0;
    OUTLINED_FUNCTION_0_13((uint64_t)result, a2, a3, a4, a5, a6, a7, a8, v16);
    if ((OUTLINED_FUNCTION_1_10(v8, v9, v10, v11, v12, v13, v14, v15, v17) & 0x80000000) != 0)
      return 0;
    else
      return (_BYTE *)v18;
  }
  return result;
}

__darwin_time_t fileModTime(__darwin_time_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FILE *v8;
  int v9;
  stat v10;

  if (result)
  {
    v8 = (FILE *)result;
    OUTLINED_FUNCTION_0_13(result, a2, a3, a4, a5, a6, a7, a8, *(uint64_t *)&v10.st_dev);
    v9 = fileno(v8);
    if (fstat(v9, &v10) < 0)
      return 0;
    else
      return v10.st_mtimespec.tv_sec;
  }
  return result;
}

uint64_t fileFindProgDir(uint64_t __s, char *a2)
{
  char *v2;
  size_t v4;

  if (__s)
  {
    v2 = (char *)__s;
    if (!*(_BYTE *)__s)
      return 0;
    if (strchr((char *)__s, 47))
    {
      stripFileName(v2, a2);
    }
    else
    {
      __s = fileFindInPath((uint64_t)v2);
      if (!(_DWORD)__s)
        return __s;
      v4 = strlen(a2);
      a2[v4 - strlen(v2)] = 0;
    }
    return 1;
  }
  return __s;
}

uint64_t fileFindInPath(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  const char *v13;
  size_t v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char __s[4097];
  uint64_t v27;

  v1 = (char *)MEMORY[0x24BDAC7A8](a1);
  v27 = *MEMORY[0x24BDAC8D0];
  if (!v1)
    return 0;
  v9 = v1;
  if (!*v1)
    return 0;
  v10 = (char *)v2;
  if (fileExists(v1, v2, v3, v4, v5, v6, v7, v8))
  {
    if (v10)
      strcpy(v10, v9);
    return 1;
  }
  v12 = getenv("PATH");
  if (!v12)
    return 0;
  v13 = v12;
  v14 = strlen(v12);
  v15 = (char *)malloc_type_malloc(v14 + 1, 0xE885C551uLL);
  v16 = strcpy(v15, v13);
  if (strtok(v16, ":"))
  {
    while (1)
    {
      __strcpy_chk();
      v17 = &__s[strlen(__s)];
      *v17 = 47;
      strcpy(v17 + 1, v9);
      if (fileExists(__s, v18, v19, v20, v21, v22, v23, v24))
        break;
      if (!strtok(0, ":"))
        goto LABEL_11;
    }
    if (v10)
      strcpy(v10, __s);
    v11 = 1;
  }
  else
  {
LABEL_11:
    v11 = 0;
  }
  free(v15);
  return v11;
}

void OUTLINED_FUNCTION_0_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  bzero(&a9, 0x90uLL);
}

uint64_t OUTLINED_FUNCTION_1_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  const char *v9;

  return stat(v9, (stat *)&a9);
}

void ArrayListNode::~ArrayListNode(ArrayListNode *this)
{
  *(_QWORD *)this = &off_25198C780;
  if (*((_QWORD *)this + 12))
  {
    OUTLINED_FUNCTION_1_11();
    MEMORY[0x2495994A8]();
    *((_QWORD *)this + 12) = 0;
  }
  ListNode::~ListNode(this);
}

{
  ArrayListNode::~ArrayListNode(this);
  OUTLINED_FUNCTION_0_14();
  JUMPOUT(0x2495994B4);
}

void ListNode::~ListNode(ListNode *this)
{
  *(_QWORD *)this = &unk_25198C7C8;
  Translation::~Translation((ListNode *)((char *)this + 32));
  Key::~Key((ListNode *)((char *)this + 8));
}

{
  ListNode::~ListNode(this);
  JUMPOUT(0x2495994B4);
}

void sub_2486AE064(_Unwind_Exception *a1)
{
  uint64_t v1;

  Key::~Key((Key *)(v1 + 8));
  _Unwind_Resume(a1);
}

size_t ArrayListNode::save(const void **this, __sFILE *a2)
{
  ListNode::save(this, a2);
  fwrite(this + 11, 4uLL, 1uLL, a2);
  return fwrite(this[12], 4uLL, *((int *)this + 22), a2);
}

uint64_t ArrayListNode::load(ArrayListNode *this, __sFILE *a2)
{
  uint64_t v4;
  void *v5;

  if (!ListNode::load(this, a2))
    return 0;
  v4 = 1;
  fread((char *)this + 88, 4uLL, 1uLL, a2);
  OUTLINED_FUNCTION_1_11();
  v5 = (void *)operator new[]();
  *((_QWORD *)this + 12) = v5;
  fread(v5, 4uLL, *((int *)this + 22), a2);
  return v4;
}

uint64_t ArrayListNode::dump(ArrayListNode *this)
{
  uint64_t i;

  ListNode::dump(this);
  printf("Number of pointers: %d\n", *((_DWORD *)this + 22));
  for (i = 0; i < *((int *)this + 22); ++i)
    printf("%d ", *(_DWORD *)(*((_QWORD *)this + 12) + 4 * i));
  return putchar(10);
}

void sub_2486AE234(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2495994B4](v1, 0x1091C40D751F76BLL);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_14()
{
  uint64_t v0;

  return v0;
}

void Key::Key(Key *this, char *a2, int a3)
{
  *(_QWORD *)this = &off_25198C7E8;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 4) = 0;
  Key::set((char *)this, a2, a3);
  OUTLINED_FUNCTION_2_9();
}

char *Key::set(char *this, char *a2, int a3)
{
  char *v3;
  char *v6;

  v3 = this;
  *((_DWORD *)this + 4) = a3;
  if (a3 < 1)
  {
    *((_QWORD *)this + 1) = 0;
  }
  else
  {
    if (*((_QWORD *)this + 1))
      OUTLINED_FUNCTION_0_15();
    v6 = (char *)OUTLINED_FUNCTION_1_12();
    *((_QWORD *)v3 + 1) = v6;
    this = strncpy(v6, a2, a3);
    this[a3] = 0;
  }
  return this;
}

void Key::operator=(Key *this, uint64_t a2)
{
  if (this != (Key *)a2)
  {
    if (*((_QWORD *)this + 1))
      OUTLINED_FUNCTION_0_15();
    Key::set((char *)this, *(char **)(a2 + 8), *(_DWORD *)(a2 + 16));
  }
  OUTLINED_FUNCTION_2_9();
}

void Key::~Key(Key *this)
{
  *(_QWORD *)this = &off_25198C7E8;
  if (*((_QWORD *)this + 1))
    OUTLINED_FUNCTION_0_15();
  *((_DWORD *)this + 4) = 0;
  OUTLINED_FUNCTION_2_9();
}

{
  Key::~Key(this);
  JUMPOUT(0x2495994B4);
}

void Key::lessthan(Key *this, Key *a2, int a3)
{
  int v3;
  int v4;

  v3 = a3;
  if (!a3)
    v3 = *((_DWORD *)a2 + 4);
  if (v3 >= *((_DWORD *)this + 4))
    v4 = *((_DWORD *)this + 4);
  else
    v4 = v3;
  strncmp(*((const char **)this + 1), *((const char **)a2 + 1), v4);
  OUTLINED_FUNCTION_3_7();
}

BOOL Key::match(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3)
    a3 = *(_DWORD *)(a2 + 16);
  return a3 == *(_DWORD *)(a1 + 16) && strncmp(*(const char **)(a1 + 8), *(const char **)(a2 + 8), a3) == 0;
}

uint64_t Key::save(const void **this, __sFILE *__stream)
{
  uint64_t result;
  size_t v5;

  result = fwrite(this + 2, 4uLL, 1uLL, __stream);
  v5 = *((unsigned int *)this + 4);
  if ((int)v5 >= 1)
    return fwrite(this[1], 1uLL, v5, __stream);
  return result;
}

void Key::load(Key *this, __sFILE *__stream)
{
  int *v4;
  void *v5;

  v4 = (int *)((char *)this + 16);
  if (*((int *)this + 4) >= 1 && *((_QWORD *)this + 1))
    OUTLINED_FUNCTION_0_15();
  fread(v4, 4uLL, 1uLL, __stream);
  if (*v4 < 1)
  {
    *((_QWORD *)this + 1) = 0;
  }
  else
  {
    v5 = (void *)OUTLINED_FUNCTION_1_12();
    *((_QWORD *)this + 1) = v5;
    fread(v5, 1uLL, *((int *)this + 4), __stream);
    *(_BYTE *)(*((_QWORD *)this + 1) + *((int *)this + 4)) = 0;
  }
  OUTLINED_FUNCTION_3_7();
}

uint64_t Key::dump(Key *this)
{
  uint64_t i;

  printf("Key: ");
  for (i = 0; i < *((int *)this + 4); ++i)
    putchar(*(char *)(*((_QWORD *)this + 1) + i));
  return putchar(10);
}

void OUTLINED_FUNCTION_0_15()
{
  JUMPOUT(0x2495994A8);
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  return operator new[]();
}

void ListNode::ListNode(ListNode *this)
{
  *(_QWORD *)this = &unk_25198C7C8;
  *((_QWORD *)this + 1) = &off_25198C7E8;
  *((_QWORD *)this + 2) = 0;
  *((_DWORD *)this + 6) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_DWORD *)this + 10) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_DWORD *)this + 14) = 0;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
}

double ListNode::ListNode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;

  *(_QWORD *)&result = OUTLINED_FUNCTION_0_16(a1, a2, a3, (uint64_t)&unk_25198C7C8).n128_u64[0];
  return result;
}

{
  double result;

  *(_QWORD *)&result = OUTLINED_FUNCTION_0_16(a1, a2, a3, (uint64_t)&unk_25198C7C8).n128_u64[0];
  return result;
}

size_t ListNode::save(const void **this, __sFILE *a2)
{
  Key::save(this + 1, a2);
  return Translation::save(this + 4, a2);
}

BOOL ListNode::load(ListNode *this, __sFILE *a2)
{
  int v4;

  Key::load((ListNode *)((char *)this + 8), a2);
  return v4 && Translation::load((ListNode *)((char *)this + 32), a2);
}

uint64_t ListNode::dump(ListNode *this)
{
  Key::dump((ListNode *)((char *)this + 8));
  return Translation::dump((ListNode *)((char *)this + 32));
}

__n128 OUTLINED_FUNCTION_0_16@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  *(_QWORD *)a1 = a4;
  *(_QWORD *)(a1 + 8) = v4 + 16;
  v5 = *(_QWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  result = *(__n128 *)a3;
  v7 = *(_OWORD *)(a3 + 16);
  v8 = *(_OWORD *)(a3 + 32);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a3 + 48);
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 64) = v8;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

void SkipListNode::SkipListNode(SkipListNode *this, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  ListNode::ListNode(this);
  *(_QWORD *)v4 = &off_25198C818;
  *(_DWORD *)(v4 + 88) = a2 + 1;
  OUTLINED_FUNCTION_1_13();
  v5 = operator new[]();
  v6 = 0;
  *((_QWORD *)this + 12) = v5;
  v7 = 8 * (*((_DWORD *)this + 22) & ~(*((int *)this + 22) >> 31));
  while (v7 != v6)
  {
    *(_QWORD *)(*((_QWORD *)this + 12) + v6) = 0;
    v6 += 8;
  }
}

void sub_2486AE7A4(_Unwind_Exception *a1)
{
  ListNode *v1;

  ListNode::~ListNode(v1);
  _Unwind_Resume(a1);
}

void SkipListNode::SkipListNode(SkipListNode *this)
{
  _QWORD *v1;

  ListNode::ListNode(this);
  *v1 = &off_25198C818;
}

void SkipListNode::~SkipListNode(SkipListNode *this)
{
  *(_QWORD *)this = &off_25198C818;
  if (*((_QWORD *)this + 12))
  {
    OUTLINED_FUNCTION_1_13();
    MEMORY[0x2495994A8]();
    *((_QWORD *)this + 12) = 0;
  }
  ListNode::~ListNode(this);
}

{
  SkipListNode::~SkipListNode(this);
  OUTLINED_FUNCTION_0_17();
  JUMPOUT(0x2495994B4);
}

uint64_t OUTLINED_FUNCTION_0_17()
{
  uint64_t v0;

  return v0;
}

void SkipList::SkipList(SkipList *this)
{
  unsigned int v2;
  int v3;
  SkipListNode *v4;

  *(_QWORD *)this = &off_25198C850;
  *((_DWORD *)this + 2) = 1;
  *((_DWORD *)this + 10) = 0;
  v2 = time(0);
  srand(v2);
  v3 = rand();
  *((_DWORD *)this + 11) = 15;
  *((_DWORD *)this + 12) = v3;
  v4 = (SkipListNode *)OUTLINED_FUNCTION_1_14();
  SkipListNode::SkipListNode(v4, 16);
  *((_QWORD *)this + 2) = v4;
  if (!*((_QWORD *)v4 + 12))
  {
    (*(void (**)(SkipListNode *))(*(_QWORD *)v4 + 8))(v4);
    *((_QWORD *)this + 2) = 0;
  }
}

void sub_2486AE90C()
{
  OUTLINED_FUNCTION_2_10();
}

void sub_2486AE918()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void SkipList::~SkipList(SkipListNode **this)
{
  *this = (SkipListNode *)&off_25198C850;
  SkipList::deleteSkipList((SkipList *)this, this[2]);
}

{
  SkipList::~SkipList(this);
  OUTLINED_FUNCTION_9_1();
  JUMPOUT(0x2495994B4);
}

void SkipList::deleteSkipList(SkipList *this, SkipListNode *a2)
{
  SkipListNode *v2;
  SkipListNode *v3;

  if (a2)
  {
    v2 = a2;
    if (*((_QWORD *)a2 + 12))
    {
      do
      {
        v3 = (SkipListNode *)**((_QWORD **)v2 + 12);
        (*(void (**)(SkipListNode *))(*(_QWORD *)v2 + 8))(v2);
        v2 = v3;
      }
      while (v3);
    }
    else
    {
      (*(void (**)(SkipListNode *))(*(_QWORD *)a2 + 8))(a2);
    }
  }
}

uint64_t SkipList::getFirst(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a1 + 16);
  return SkipList::getNext(a1, a2, a3);
}

uint64_t SkipList::getNext(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
    return 0;
  v4 = **(_QWORD **)(v3 + 96);
  *(_QWORD *)(a1 + 32) = v4;
  if (!v4)
    return 0;
  *a2 = v4 + 8;
  *a3 = *(_QWORD *)(a1 + 32) + 32;
  return 0xFFFFFFFFLL;
}

uint64_t SkipList::save(SkipList *this, const char *__filename)
{
  __sFILE *v2;
  int *v3;
  const void *v5;
  size_t v6;
  size_t v7;
  FILE *v8;
  const void *v9;
  size_t v10;
  size_t v11;
  FILE *v12;
  uint64_t v13;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  int v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v28;

  if (!fopen(__filename, "w+b"))
    return 4294967294;
  v5 = (const void *)OUTLINED_FUNCTION_6_2();
  fwrite(v5, v6, v7, v8);
  v9 = (const void *)OUTLINED_FUNCTION_10_0();
  fwrite(v9, v10, v11, v12);
  v13 = *((unsigned int *)this + 2);
  if ((int)v13 > 1)
  {
    v15 = (_QWORD *)OUTLINED_FUNCTION_5_3();
    v16 = 0;
    *v15 = 104;
    v15[1] = v13;
    v28 = v15;
    v17 = v15 + 2;
    do
    {
      ArrayListNode::ArrayListNode((ArrayListNode *)&v28[v16 + 2]);
      v16 += 13;
    }
    while (13 * v13 != v16);
    v18 = 0;
    v19 = (char *)this + 16;
    while (v18 < *v3)
    {
      v20 = *(_QWORD *)v19;
      v21 = *(_DWORD *)(*(_QWORD *)v19 + 88);
      v22 = &v17[13 * v18];
      *((_DWORD *)v22 + 22) = v21;
      v22[12] = operator new[]();
      Key::operator=((Key *)(v22 + 1), v20 + 8);
      Translation::operator=((uint64_t)(v22 + 4), v20 + 32);
      v23 = 0;
      v24 = v21 & ~(v21 >> 31);
      while (v24 != v23)
      {
        *(_DWORD *)(v22[12] + 4 * v23) = SkipList::calcIndex(this, *(SkipListNode **)(*(_QWORD *)(v20 + 96) + 8 * v23));
        ++v23;
      }
      ArrayListNode::save((const void **)&v17[13 * v18], v2);
      v19 = *(char **)(v20 + 96);
      ++v18;
    }
    OUTLINED_FUNCTION_8_2();
    v25 = v28[1];
    if (v25)
    {
      v26 = 13 * v25;
      do
      {
        ArrayListNode::~ArrayListNode((ArrayListNode *)&v28[v26 - 11]);
        v26 -= 13;
      }
      while (v26 * 8);
    }
    OUTLINED_FUNCTION_0_18();
  }
  OUTLINED_FUNCTION_8_2();
  return 0;
}

uint64_t SkipList::calcIndex(SkipList *this, SkipListNode *a2)
{
  uint64_t result;
  SkipListNode **i;
  SkipListNode *v5;

  if (!a2)
    return 0;
  result = 0;
  for (i = (SkipListNode **)((char *)this + 16); ; i = (SkipListNode **)*((_QWORD *)v5 + 12))
  {
    v5 = *i;
    if (v5 == a2 || (int)result >= *((_DWORD *)this + 2))
      break;
    result = (result + 1);
  }
  return result;
}

uint64_t SkipList::load(SkipList *this, const char *__filename)
{
  __sFILE *v2;
  int *v3;
  void *v5;
  size_t v6;
  size_t v7;
  FILE *v8;
  void *v9;
  size_t v10;
  size_t v11;
  FILE *v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  SkipListNode **v19;
  _DWORD *i;
  _QWORD *v21;
  SkipList *v22;
  _QWORD *v23;
  int v24;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  SkipListNode *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  if (!fopen(__filename, "rb"))
    return 4294967294;
  v5 = (void *)OUTLINED_FUNCTION_6_2();
  fread(v5, v6, v7, v8);
  if (*((int *)this + 2) > 1)
  {
    v9 = (void *)OUTLINED_FUNCTION_10_0();
    fread(v9, v10, v11, v12);
    v13 = *((int *)this + 2);
    is_mul_ok(v13, 0x68uLL);
    v14 = (_QWORD *)OUTLINED_FUNCTION_5_3();
    *v14 = 104;
    v14[1] = v13;
    if ((_DWORD)v13)
    {
      v15 = 0;
      v16 = 104 * (int)v13;
      do
      {
        ArrayListNode::ArrayListNode((ArrayListNode *)&v14[v15 / 8 + 2]);
        v15 += 104;
      }
      while (v16 != v15);
    }
    v17 = 0;
    v18 = 0;
    v19 = (SkipListNode **)((char *)this + 16);
    for (i = v14 + 13; ; i += 26)
    {
      if (v17 >= *v3 || !ArrayListNode::load((ArrayListNode *)(i - 22), v2))
        goto LABEL_18;
      v21 = (_QWORD *)OUTLINED_FUNCTION_1_14();
      SkipListNode::SkipListNode((SkipListNode *)v21, *i - 1);
      if (!v21[12])
        break;
      Key::operator=((Key *)(v21 + 1), (uint64_t)(i - 20));
      v22 = (SkipList *)Translation::operator=((uint64_t)(v21 + 4), (uint64_t)(i - 14));
      if (v18)
      {
        v23 = (_QWORD *)*((_QWORD *)v18 + 12);
      }
      else
      {
        v23 = (_QWORD *)((char *)this + 16);
        if (*v19)
        {
          SkipList::deleteSkipList(v22, *v19);
          v23 = (_QWORD *)((char *)this + 16);
        }
      }
      *v23 = v21;
      ++v17;
      v18 = (int *)v21;
    }
    (*(void (**)(_QWORD *))(*v21 + 8))(v21);
LABEL_18:
    OUTLINED_FUNCTION_8_2();
    v24 = *v3;
    if (*v3 > (int)v17)
    {
      if (v18)
      {
        do
        {
          v25 = (int *)**((_QWORD **)v18 + 12);
          (*(void (**)(int *))(*(_QWORD *)v18 + 8))(v18);
          v18 = v25;
        }
        while (v25);
      }
      v26 = v14[1];
      if (v26)
      {
        v27 = 13 * v26;
        do
        {
          ArrayListNode::~ArrayListNode((ArrayListNode *)&v14[v27 - 11]);
          v27 -= 13;
        }
        while (v27 * 8);
      }
      OUTLINED_FUNCTION_0_18();
    }
    v28 = 0;
    v29 = 8 * (v18[22] & ~(v18[22] >> 31));
    while (v29 != v28)
    {
      *(_QWORD *)(*((_QWORD *)v18 + 12) + v28) = 0;
      v28 += 8;
    }
    v30 = 0;
    v31 = v24 & ~(v24 >> 31);
    while (v30 != v31)
    {
      v32 = 0;
      v33 = *v19;
      v34 = *((_DWORD *)*v19 + 22) & ~(*((int *)*v19 + 22) >> 31);
      while (v34 != v32)
      {
        *(_QWORD *)(*((_QWORD *)v33 + 12) + 8 * v32) = SkipList::calcPointer(this, *(_DWORD *)(v14[13 * v30 + 14] + 4 * v32));
        ++v32;
      }
      v19 = (SkipListNode **)*((_QWORD *)v33 + 12);
      ++v30;
    }
    v35 = v14[1];
    if (v35)
    {
      v36 = 13 * v35;
      do
      {
        ArrayListNode::~ArrayListNode((ArrayListNode *)&v14[v36 - 11]);
        v36 -= 13;
      }
      while (v36 * 8);
    }
    OUTLINED_FUNCTION_0_18();
  }
  OUTLINED_FUNCTION_8_2();
  return 0;
}

uint64_t SkipList::calcPointer(SkipList *this, int a2)
{
  uint64_t *i;
  uint64_t result;
  BOOL v4;

  if (!a2)
    return 0;
  for (i = (uint64_t *)((char *)this + 16); ; i = *(uint64_t **)(result + 96))
  {
    result = *i;
    v4 = __OFSUB__(a2--, 1);
    if (a2 < 0 != v4)
      break;
  }
  return result;
}

SkipListNode *SkipList::findClosest(SkipList *this, int a2, Key *a3, SkipListNode *a4, int a5)
{
  uint64_t v8;
  uint64_t v9;
  char v10;

  if (a4)
    *((_QWORD *)this + 3) = a4;
  else
    a4 = (SkipListNode *)*((_QWORD *)this + 3);
  v8 = a2;
  while (1)
  {
    v9 = *(_QWORD *)(*((_QWORD *)a4 + 12) + 8 * v8);
    if (!v9)
      break;
    Key::lessthan((Key *)(v9 + 8), a3, a5);
    if ((v10 & 1) == 0)
      return (SkipListNode *)*((_QWORD *)this + 3);
    *((_QWORD *)this + 3) = v9;
    a4 = (SkipListNode *)v9;
  }
  return a4;
}

void SkipList::insert(SkipList *this, Key *a2, Translation *a3)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v8;
  uint64_t v9;
  int v10;
  int v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[17];

  OUTLINED_FUNCTION_3_8((uint64_t)this, *MEMORY[0x24BDAC8D0]);
  do
  {
    *(_QWORD *)(v4 + 8 * v3) = OUTLINED_FUNCTION_4_3(this, v3, a2);
    v8 = v3-- <= 0;
  }
  while (!v8);
  v9 = **(_QWORD **)(v15[0] + 96);
  if (v9 && OUTLINED_FUNCTION_12_0(v9 + 8, (uint64_t)a2))
  {
    Translation::operator=(v9 + 32, (uint64_t)a3);
  }
  else
  {
    v10 = SkipList::randomLevel(this);
    v11 = *((_DWORD *)this + 10);
    if (v10 > v11)
    {
      v10 = v11 + 1;
      *((_DWORD *)this + 10) = v11 + 1;
      v15[v11 + 1] = *((_QWORD *)this + 2);
    }
    v12 = (_QWORD *)OUTLINED_FUNCTION_1_14();
    SkipListNode::SkipListNode((SkipListNode *)v12, v10);
    Key::operator=((Key *)(v12 + 1), (uint64_t)a2);
    Translation::operator=((uint64_t)(v12 + 4), (uint64_t)a3);
    v13 = v10;
    do
    {
      v14 = v15[v13];
      *(_QWORD *)(v12[12] + 8 * v13) = *(_QWORD *)(*(_QWORD *)(v14 + 96) + 8 * v13);
      *(_QWORD *)(*(_QWORD *)(v14 + 96) + 8 * v13) = v12;
      v8 = v13-- <= 0;
    }
    while (!v8);
    ++*((_DWORD *)this + 2);
  }
  OUTLINED_FUNCTION_7_2();
}

void sub_2486AF19C()
{
  OUTLINED_FUNCTION_2_10();
}

void sub_2486AF1A8()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t SkipList::randomLevel(SkipList *this)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;

  v2 = *((_DWORD *)this + 11);
  v3 = *((_DWORD *)this + 12);
  v4 = -1;
  do
  {
    v5 = v3 >> 2;
    *((_DWORD *)this + 11) = --v2;
    *((_DWORD *)this + 12) = v3 >> 2;
    if (!v2)
    {
      v5 = rand();
      v2 = 15;
      *((_DWORD *)this + 11) = 15;
      *((_DWORD *)this + 12) = v5;
    }
    ++v4;
    v6 = v3 & 3;
    v3 = v5;
  }
  while (!v6);
  if (v4 >= 15)
    return 15;
  else
    return v4;
}

_QWORD *SkipList::multiSearch(SkipList *this, Key *a2)
{
  int v4;
  int64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t i;
  unsigned int v10;
  SkipListNode *Closest;
  uint64_t v12;
  _OWORD v14[8];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a2 + 4);
  v5 = v4 / 2;
  is_mul_ok(v5, 0x38uLL);
  memset(v14, 0, sizeof(v14));
  v6 = (_QWORD *)operator new[]();
  *v6 = 56;
  v6[1] = v5;
  v7 = v6 + 2;
  if ((v4 + 1) >= 3)
  {
    v8 = v6 + 2;
    do
    {
      *v8 = 0;
      *((_DWORD *)v8 + 2) = 0;
      v8[2] = 0;
      *((_DWORD *)v8 + 6) = 0;
      v8[4] = 0;
      v8[5] = 0;
      v8 += 7;
    }
    while (v8 != &v7[7 * (int)v5]);
  }
  *((_QWORD *)this + 3) = *((_QWORD *)this + 2);
  for (i = 1; i <= v5; ++i)
  {
    v10 = *((_DWORD *)this + 10);
    if ((v10 & 0x80000000) == 0)
    {
      while (1)
      {
        Closest = SkipList::findClosest(this, v10, a2, *((SkipListNode **)v14 + v10), 2 * (int)i);
        *((_QWORD *)v14 + v10) = Closest;
        v12 = *(_QWORD *)(*((_QWORD *)Closest + 12) + 8 * v10);
        if (v12)
        {
          if (Key::match(v12 + 8, (uint64_t)a2, 2 * i))
            break;
        }
        if ((--v10 & 0x80000000) != 0)
          goto LABEL_12;
      }
      Translation::operator=((uint64_t)&v7[7 * i - 7], v12 + 32);
    }
LABEL_12:
    ;
  }
  return v7;
}

uint64_t SkipList::search(SkipList *this, Key *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *((int *)this + 10);
  *((_QWORD *)this + 3) = *((_QWORD *)this + 2);
  while (1)
  {
    v5 = *(_QWORD *)(*((_QWORD *)OUTLINED_FUNCTION_4_3(this, v4, a2) + 12) + 8 * v4);
    if (v5)
    {
      if (OUTLINED_FUNCTION_12_0(v5 + 8, (uint64_t)a2))
        break;
    }
    if (v4-- <= 0)
      return 0;
  }
  return v5 + 32;
}

void SkipList::remove(SkipList *this, Key *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v8;
  uint64_t i;
  uint64_t v10;
  int v11;
  _QWORD v13[17];

  OUTLINED_FUNCTION_3_8((uint64_t)this, *MEMORY[0x24BDAC8D0]);
  v6 = v2;
  do
    *(_QWORD *)(v3 + 8 * v6) = OUTLINED_FUNCTION_4_3(this, v6, a2);
  while (v6-- > 0);
  v8 = **(_QWORD ***)(v13[0] + 96);
  if (v8 && OUTLINED_FUNCTION_12_0((uint64_t)(v8 + 1), (uint64_t)a2))
  {
    for (i = 0; i <= v2; ++i)
    {
      v10 = *(_QWORD *)(v13[i] + 96);
      if (*(_QWORD **)(v10 + 8 * i) != v8)
        break;
      *(_QWORD *)(v10 + 8 * i) = *(_QWORD *)(v8[12] + 8 * i);
    }
    (*(void (**)(_QWORD *))(*v8 + 8))(v8);
    --*((_DWORD *)this + 2);
    v11 = v2 + 1;
    do
    {
      --v11;
      if (v2 < 1)
        break;
    }
    while (!*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 2) + 96) + 8 * v2--));
    *((_DWORD *)this + 10) = v11;
  }
  OUTLINED_FUNCTION_7_2();
}

void ArrayListNode::ArrayListNode(ArrayListNode *this)
{
  uint64_t v1;

  ListNode::ListNode(this);
  *(_QWORD *)v1 = &off_25198C780;
  *(_DWORD *)(v1 + 88) = 0;
  *(_QWORD *)(v1 + 96) = 0;
}

void OUTLINED_FUNCTION_0_18()
{
  JUMPOUT(0x2495994A8);
}

uint64_t OUTLINED_FUNCTION_1_14()
{
  return operator new();
}

void OUTLINED_FUNCTION_2_10()
{
  JUMPOUT(0x2495994B4);
}

double OUTLINED_FUNCTION_3_8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;

  *(_QWORD *)(v2 - 56) = a2;
  result = 0.0;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a1 + 16);
  return result;
}

SkipListNode *OUTLINED_FUNCTION_4_3(SkipList *a1, int a2, Key *a3)
{
  return SkipList::findClosest(a1, a2, a3, 0, 0);
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return operator new[]();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  uint64_t v0;

  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  FILE *v0;

  return fclose(v0);
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  uint64_t v0;

  return v0 + 40;
}

void OUTLINED_FUNCTION_11_0()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

BOOL OUTLINED_FUNCTION_12_0(uint64_t a1, uint64_t a2)
{
  return Key::match(a1, a2, 0);
}

void Translation::Translation(Translation *this, const char *a2, int a3, const char *a4, const char *a5, int a6)
{
  void *v11;
  Translation *v12;
  void *v13;
  Translation *v14;
  void *v15;

  *((_DWORD *)this + 10) = 0;
  *((_DWORD *)this + 6) = 0;
  *((_DWORD *)this + 2) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = 0;
  *((_BYTE *)this + 48) = 0;
  v11 = Translation::set(this, a2, a3);
  *(_QWORD *)this = v11;
  if (v11)
  {
    *((_DWORD *)this + 2) = a3;
    v12 = (Translation *)strlen(a4);
    v13 = Translation::set(v12, a4, (int)v12);
    *((_QWORD *)this + 2) = v13;
    if (v13)
    {
      *((_DWORD *)this + 6) = strlen(a4);
      v14 = (Translation *)strlen(a5);
      v15 = Translation::set(v14, a5, (int)v14);
      *((_QWORD *)this + 4) = v15;
      if (v15)
      {
        *((_DWORD *)this + 10) = strlen(a5);
        *((_DWORD *)this + 11) = a6;
        *((_BYTE *)this + 48) = 1;
      }
    }
  }
}

void *Translation::set(Translation *this, const char *a2, int a3)
{
  void *v5;

  if (a3 < 1)
    return 0;
  v5 = (void *)OUTLINED_FUNCTION_1_15();
  memcpy(v5, a2, a3);
  *((_BYTE *)v5 + a3) = 0;
  return v5;
}

uint64_t Translation::operator=(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  if (a1 != a2)
  {
    *(_DWORD *)(a1 + 40) = 0;
    *(_DWORD *)(a1 + 24) = 0;
    *(_DWORD *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 48) = 0;
    if (*(_QWORD *)a1)
      OUTLINED_FUNCTION_0_19();
    v4 = Translation::set(0, *(const char **)a2, *(_DWORD *)(a2 + 8));
    *(_QWORD *)a1 = v4;
    if (v4)
    {
      *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
      if (*(_QWORD *)(a1 + 16))
        OUTLINED_FUNCTION_0_19();
      v5 = Translation::set(0, *(const char **)(a2 + 16), *(_DWORD *)(a2 + 24));
      *(_QWORD *)(a1 + 16) = v5;
      if (v5)
      {
        *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
        if (*(_QWORD *)(a1 + 32))
          OUTLINED_FUNCTION_0_19();
        v6 = Translation::set(0, *(const char **)(a2 + 32), *(_DWORD *)(a2 + 40));
        *(_QWORD *)(a1 + 32) = v6;
        if (v6)
        {
          *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
          *(_BYTE *)(a1 + 48) = 1;
        }
      }
    }
  }
  return a1;
}

void Translation::~Translation(Translation *this)
{
  if (*(_QWORD *)this)
    OUTLINED_FUNCTION_0_19();
  if (*((_QWORD *)this + 2))
    OUTLINED_FUNCTION_0_19();
  if (*((_QWORD *)this + 4))
    OUTLINED_FUNCTION_0_19();
  *((_DWORD *)this + 10) = 0;
  *((_DWORD *)this + 6) = 0;
  *((_DWORD *)this + 2) = 0;
}

size_t Translation::save(const void **this, __sFILE *a2)
{
  size_t v4;
  size_t v5;
  size_t v6;

  OUTLINED_FUNCTION_4_4(this + 1);
  v4 = *((unsigned int *)this + 2);
  if ((int)v4 >= 1)
    OUTLINED_FUNCTION_5_4(*this, 1uLL, v4);
  OUTLINED_FUNCTION_4_4(this + 3);
  v5 = *((unsigned int *)this + 6);
  if ((int)v5 >= 1)
    OUTLINED_FUNCTION_5_4(this[2], 1uLL, v5);
  OUTLINED_FUNCTION_4_4(this + 5);
  v6 = *((unsigned int *)this + 10);
  if ((int)v6 >= 1)
    OUTLINED_FUNCTION_5_4(this[4], 1uLL, v6);
  return fwrite((char *)this + 44, 4uLL, 1uLL, a2);
}

uint64_t Translation::load(Translation *this, __sFILE *a2)
{
  void *v3;
  void *v4;
  void *v5;

  if (*((int *)this + 2) >= 1 && *(_QWORD *)this)
    OUTLINED_FUNCTION_0_19();
  if (*((int *)this + 6) >= 1 && *((_QWORD *)this + 2))
    OUTLINED_FUNCTION_0_19();
  if (*((int *)this + 10) >= 1 && *((_QWORD *)this + 4))
    OUTLINED_FUNCTION_0_19();
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = 0;
  *((_DWORD *)this + 10) = 0;
  *((_DWORD *)this + 6) = 0;
  *((_DWORD *)this + 2) = 0;
  OUTLINED_FUNCTION_2_11((char *)this + 8);
  if (*((int *)this + 2) >= 1)
  {
    v3 = (void *)OUTLINED_FUNCTION_1_15();
    *(_QWORD *)this = v3;
    OUTLINED_FUNCTION_3_9(v3, 1uLL, *((int *)this + 2));
    *(_BYTE *)(*(_QWORD *)this + *((int *)this + 2)) = 0;
  }
  OUTLINED_FUNCTION_2_11((char *)this + 24);
  if (*((int *)this + 6) >= 1)
  {
    v4 = (void *)OUTLINED_FUNCTION_1_15();
    *((_QWORD *)this + 2) = v4;
    OUTLINED_FUNCTION_3_9(v4, 1uLL, *((int *)this + 6));
    *(_BYTE *)(*((_QWORD *)this + 2) + *((int *)this + 6)) = 0;
  }
  OUTLINED_FUNCTION_2_11((char *)this + 40);
  if (*((int *)this + 10) >= 1)
  {
    v5 = (void *)OUTLINED_FUNCTION_1_15();
    *((_QWORD *)this + 4) = v5;
    OUTLINED_FUNCTION_3_9(v5, 1uLL, *((int *)this + 10));
    *(_BYTE *)(*((_QWORD *)this + 4) + *((int *)this + 10)) = 0;
  }
  OUTLINED_FUNCTION_2_11((char *)this + 44);
  return 1;
}

uint64_t Translation::dump(Translation *this)
{
  uint64_t i;
  uint64_t j;
  uint64_t k;

  printf("Translation: ");
  for (i = 0; i < *((int *)this + 2); ++i)
    OUTLINED_FUNCTION_6_3(*(_QWORD *)this);
  for (j = 0; j < *((int *)this + 6); ++j)
    OUTLINED_FUNCTION_6_3(*((_QWORD *)this + 2));
  for (k = 0; k < *((int *)this + 10); ++k)
    OUTLINED_FUNCTION_6_3(*((_QWORD *)this + 4));
  return printf("\nPart of speech: %d\n", *((_DWORD *)this + 11));
}

void OUTLINED_FUNCTION_0_19()
{
  JUMPOUT(0x2495994A8);
}

uint64_t OUTLINED_FUNCTION_1_15()
{
  return operator new[]();
}

size_t OUTLINED_FUNCTION_2_11(void *a1)
{
  FILE *v1;

  return fread(a1, 4uLL, 1uLL, v1);
}

size_t OUTLINED_FUNCTION_3_9(void *a1, size_t a2, size_t a3)
{
  FILE *v3;

  return fread(a1, a2, a3, v3);
}

size_t OUTLINED_FUNCTION_4_4(const void *a1)
{
  FILE *v1;

  return fwrite(a1, 4uLL, 1uLL, v1);
}

size_t OUTLINED_FUNCTION_5_4(const void *a1, size_t a2, size_t a3)
{
  FILE *v3;

  return fwrite(a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_6_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return putchar(*(char *)(a1 + v1));
}

void ETIqueue::ETIqueue(ETIqueue *this, int a2)
{
  *(_QWORD *)this = &off_25198C880;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 5) = 0;
  *((_DWORD *)this + 6) = 0;
  *((_DWORD *)this + 4) = a2;
  *((_QWORD *)this + 1) = OUTLINED_FUNCTION_1_16();
}

void ETIqueue::~ETIqueue(ETIqueue *this)
{
  *(_QWORD *)this = &off_25198C880;
  ETIqueue::reset(this);
  if (*((_QWORD *)this + 1))
    OUTLINED_FUNCTION_0_20();
}

{
  ETIqueue::~ETIqueue(this);
  OUTLINED_FUNCTION_2_12();
  JUMPOUT(0x2495994B4);
}

uint64_t ETIqueue::reset(ETIqueue *this)
{
  uint64_t result;
  uint64_t v3;

  result = 1;
  do
  {
    if (!*((_QWORD *)this + 1))
      break;
    if (*((_DWORD *)this + 5) == *((_DWORD *)this + 6))
      break;
    v3 = 0;
    result = (*(uint64_t (**)(ETIqueue *, uint64_t *))(*(_QWORD *)this + 24))(this, &v3);
  }
  while ((_DWORD)result);
  return result;
}

BOOL ETIqueue::isEmpty(ETIqueue *this)
{
  return !*((_QWORD *)this + 1) || *((_DWORD *)this + 5) == *((_DWORD *)this + 6);
}

uint64_t ETIqueue::push(ETIqueue *this, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  int v5;
  uint64_t result;
  int v7;

  v2 = *((_QWORD *)this + 1);
  if (!v2)
    return 0;
  v4 = *((unsigned int *)this + 6);
  v5 = v4 + 1;
  *((_DWORD *)this + 6) = v4 + 1;
  *(_QWORD *)(v2 + 8 * v4) = a2;
  if ((_DWORD)v4 + 1 == *((_DWORD *)this + 4))
  {
    v5 = 0;
    *((_DWORD *)this + 6) = 0;
  }
  if (v5 != *((_DWORD *)this + 5) || ETIqueue::doubleArraySize(this))
    return 1;
  v7 = *((_DWORD *)this + 6);
  if (!v7)
    v7 = *((_DWORD *)this + 4);
  result = 0;
  *((_DWORD *)this + 6) = v7 - 1;
  return result;
}

uint64_t ETIqueue::doubleArraySize(ETIqueue *this)
{
  int v2;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  if (!*((_QWORD *)this + 1))
    return 0;
  v2 = 2 * *((_DWORD *)this + 4);
  v3 = (char *)OUTLINED_FUNCTION_1_16();
  v4 = (char *)*((_QWORD *)this + 1);
  v5 = *((unsigned int *)this + 4);
  v6 = *((unsigned int *)this + 5);
  memcpy(v3, &v4[8 * v6], 8 * (v5 - v6));
  memcpy(&v3[8 * v5 + -8 * v6], v4, 8 * v6);
  if (v4)
    OUTLINED_FUNCTION_0_20();
  *((_QWORD *)this + 1) = v3;
  *((_DWORD *)this + 5) = 0;
  *((_DWORD *)this + 6) = v5;
  result = 1;
  *((_DWORD *)this + 4) = v2;
  return result;
}

uint64_t ETIqueue::pop(ETIqueue *this, void **a2)
{
  uint64_t result;
  int v4;
  int v5;

  result = (*(uint64_t (**)(ETIqueue *, void **))(*(_QWORD *)this + 32))(this, a2);
  if ((_DWORD)result)
  {
    v4 = *((_DWORD *)this + 5);
    if (v4 + 1 == *((_DWORD *)this + 4))
      v5 = 0;
    else
      v5 = v4 + 1;
    *((_DWORD *)this + 5) = v5;
  }
  return result;
}

uint64_t ETIqueue::peekHead(ETIqueue *this, void **a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;

  v2 = (_QWORD *)*((_QWORD *)this + 1);
  if (v2)
  {
    v3 = *((unsigned int *)this + 5);
    if ((_DWORD)v3 == *((_DWORD *)this + 6))
    {
      result = 0;
      v2 = 0;
    }
    else
    {
      v2 = (_QWORD *)v2[v3];
      result = 1;
    }
  }
  else
  {
    result = 0;
  }
  *a2 = v2;
  return result;
}

void OUTLINED_FUNCTION_0_20()
{
  JUMPOUT(0x2495994A8);
}

uint64_t OUTLINED_FUNCTION_1_16()
{
  return operator new[]();
}

uint64_t OUTLINED_FUNCTION_2_12()
{
  uint64_t v0;

  return v0;
}

uint64_t ETIThread::sleep(uint64_t this)
{
  int v3;
  timespec v4;
  pthread_cond_t v5;
  pthread_mutex_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  memset(v6.__opaque, 0, sizeof(v6.__opaque));
  v6.__sig = 850045863;
  memset(v5.__opaque, 0, sizeof(v5.__opaque));
  v5.__sig = 1018212795;
  if (pthread_mutex_lock(&v6))
    return 1;
  v4.tv_sec = time(0) + this / 1000;
  v4.tv_nsec = 1000000 * (this % 1000);
  v3 = pthread_cond_timedwait(&v5, &v6, &v4);
  if (v3 != 60 && (v3 != -1 || *__error() != 35))
    perror("error in sleep:");
  pthread_mutex_unlock(&v6);
  pthread_cond_destroy(&v5);
  return 0;
}

uint64_t ETIThread::getStatus(ETIThread *this)
{
  uint64_t result;

  result = *((unsigned int *)this + 4);
  if ((_DWORD)result == 1)
    *((_DWORD *)this + 4) = 1;
  return result;
}

uint64_t ETIThread::checkStatus(ETIThread *this)
{
  return 1;
}

uint64_t ETIThread::shouldTerminate(ETIThread *this)
{
  return *((unsigned __int8 *)this + 20);
}

void ETIThread::ETIThread(ETIThread *this)
{
  OUTLINED_FUNCTION_0_21((uint64_t)this, (uint64_t)&off_25198C8C8);
}

{
  OUTLINED_FUNCTION_0_21((uint64_t)this, (uint64_t)&off_25198C8C8);
}

void ETIThread::~ETIThread(ETIThread *this)
{
  JUMPOUT(0x2495994B4);
}

BOOL ETIThread::start(ETIThread *this)
{
  int v2;
  int v3;
  _BOOL8 result;
  pthread_attr_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *((_BYTE *)this + 20) = 0;
  pthread_attr_init(&v5);
  pthread_attr_setdetachstate(&v5, 1);
  v2 = pthread_create((pthread_t *)this + 1, &v5, (void *(__cdecl *)(void *))ETIThread::execute, this);
  v3 = 3;
  if (!v2)
    v3 = 1;
  result = v2 == 0;
  *((_DWORD *)this + 4) = v3;
  return result;
}

uint64_t ETIThread::execute(ETIThread *this, void *a2)
{
  (*(void (**)(ETIThread *, void *))(*(_QWORD *)this + 32))(this, a2);
  *((_DWORD *)this + 4) = 2;
  return 0;
}

uint64_t ETIThread::terminate(uint64_t this)
{
  *(_BYTE *)(this + 20) = 1;
  return this;
}

uint64_t ETIThread::waitForExit(ETIThread *this)
{
  uint64_t result;
  unsigned int v3;
  BOOL v4;
  int v5;

  result = *((_QWORD *)this + 1);
  if (result)
  {
    v3 = pthread_join((pthread_t)result, 0);
    result = 1;
    v4 = v3 > 0x16;
    v5 = (1 << v3) & 0x400808;
    if (v4 || v5 == 0)
      *((_QWORD *)this + 1) = 0;
  }
  return result;
}

uint64_t ETIThread::terminateAndWait(ETIThread *this)
{
  (*(void (**)(ETIThread *))(*(_QWORD *)this + 16))(this);
  return (*(uint64_t (**)(ETIThread *))(*(_QWORD *)this + 24))(this);
}

void ETIThread::exit(ETIThread *this)
{
  *((_DWORD *)this + 4) = 2;
  pthread_exit(0);
}

uint64_t OUTLINED_FUNCTION_0_21@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)result = a2;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = 0;
  *(_BYTE *)(result + 20) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_17()
{
  return 0;
}

void IniFileWriter::IniFileWriter(IniFileWriter *this, const char *a2)
{
  char *v2;
  char *v3;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 514) = 0;
  *((_QWORD *)this + 516) = 0;
  *((_QWORD *)this + 515) = 0;
  if (a2)
  {
    v2 = (char *)this + 8;
    v3 = strcpy((char *)this + 8, a2);
    *(_WORD *)&v2[strlen(v3)] = 47;
    *(_QWORD *)&v2[OUTLINED_FUNCTION_10_1()] = 0x696E692E696365;
  }
}

void IniFileWriter::~IniFileWriter(IniFileWriter *this)
{
  if (*((_QWORD *)this + 514))
    OUTLINED_FUNCTION_0_22();
}

uint64_t IniFileWriter::writeString(IniFileWriter *this, const char *a2, char *a3, const char *a4)
{
  uint64_t v7;
  const char *v8;
  size_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  const char *v14;
  int v15;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  char *v25;
  int v26;
  int v28;
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  int v33;
  int v34;
  int v35;
  int v36;
  uint64_t v38;

  if (IniFileWriter::readFileIntoMemory(this, "r+")
    || IniFileWriter::readFileIntoMemory(this, "a+"))
  {
    strlen(a2);
    v7 = OUTLINED_FUNCTION_1_18();
    *(_WORD *)v7 = 23306;
    strcpy((char *)(v7 + 2), a2);
    *(_WORD *)(v7 + OUTLINED_FUNCTION_10_1()) = 93;
    v8 = (const char *)*((_QWORD *)this + 514);
    v9 = strlen(v8);
    v10 = IniFileWriter::stringSearch(this, (const char *)(v7 + 1), 0, v9);
    v11 = v10;
    *((_QWORD *)this + 515) = v10;
    if (v8[v10])
    {
      v12 = strlen(a2);
      if (IniFileWriter::goEndSection(this))
      {
        v13 = IniFileWriter::stringSearch(this, a3, v11 + v12 + 2, *((_QWORD *)this + 515));
        *((_QWORD *)this + 515) = v13;
        v14 = (const char *)(*((_QWORD *)this + 514) + v13);
        v15 = *(unsigned __int8 *)v14;
        if (v15 == 10 || v15 == 0)
        {
          strlen(v14);
          v17 = (char *)OUTLINED_FUNCTION_1_18();
          OUTLINED_FUNCTION_8_3();
          strcpy(v20, (const char *)(v18 + v19));
          OUTLINED_FUNCTION_7_3(this, 0, a3);
          if (v21)
          {
            while (1)
            {
              v22 = *v17;
              v23 = OUTLINED_FUNCTION_2_13();
              v24 = v23;
              if (!v22)
                break;
              if (v23)
                OUTLINED_FUNCTION_4_5(*v17);
              OUTLINED_FUNCTION_11_1();
              if (!v24)
                goto LABEL_38;
            }
            if (v23)
              OUTLINED_FUNCTION_5_5();
          }
LABEL_38:
          OUTLINED_FUNCTION_0_22();
        }
        if (IniFileWriter::goEndKey(this))
        {
          v38 = *((_QWORD *)this + 515);
          v28 = IniFileWriter::goEndData(this, &v38);
          v29 = v38;
          strlen((const char *)(*((_QWORD *)this + 514) + v38));
          v30 = (char *)OUTLINED_FUNCTION_1_18();
          v31 = v30;
          if (v28)
          {
            strcpy(v30, (const char *)(*((_QWORD *)this + 514) + v29));
            OUTLINED_FUNCTION_7_3(this, 0, 0);
            v32 = v31;
            if (v33)
            {
              while (1)
              {
                v34 = *v32;
                v35 = OUTLINED_FUNCTION_2_13();
                v36 = v35;
                if (!v34)
                  break;
                if (v35)
                  OUTLINED_FUNCTION_4_5(*v32);
                OUTLINED_FUNCTION_3_10();
                ++v32;
                if (!v36)
                  goto LABEL_38;
              }
              if (v35)
                OUTLINED_FUNCTION_5_5();
            }
          }
          goto LABEL_38;
        }
      }
    }
    else
    {
      if (v10)
        v25 = (char *)v7;
      else
        v25 = (char *)(v7 + 1);
      OUTLINED_FUNCTION_7_3(this, v25, a3);
      if (v26 && OUTLINED_FUNCTION_2_13())
      {
        OUTLINED_FUNCTION_5_5();
        IniFileWriter::writeFileFromMemory(this);
      }
    }
    OUTLINED_FUNCTION_0_22();
  }
  return 0;
}

uint64_t IniFileWriter::readFileIntoMemory(IniFileWriter *this, const char *a2)
{
  FILE *v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)((char *)this + 4120) = xmmword_2486E5590;
  if (*((_QWORD *)this + 514))
    OUTLINED_FUNCTION_0_22();
  *((_QWORD *)this + 514) = OUTLINED_FUNCTION_1_18();
  v4 = fopen((const char *)this + 8, a2);
  *(_QWORD *)this = v4;
  if (!v4)
    return 0;
LABEL_4:
  v5 = fgetc(v4);
  v6 = 1;
  while (v6 && v5 != -1)
  {
    v6 = OUTLINED_FUNCTION_2_13();
    if (v6)
    {
      OUTLINED_FUNCTION_8_3();
      *(_BYTE *)(v7 + v8) = v5;
      OUTLINED_FUNCTION_3_10();
      v4 = *(FILE **)this;
      goto LABEL_4;
    }
  }
  if (v6)
  {
    v9 = OUTLINED_FUNCTION_2_13();
    if ((_DWORD)v9)
      OUTLINED_FUNCTION_5_5();
  }
  else
  {
    v9 = 0;
  }
  fclose(*(FILE **)this);
  return v9;
}

uint64_t IniFileWriter::stringSearch(IniFileWriter *this, const char *__s, uint64_t a3, uint64_t a4)
{
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  BOOL v20;
  uint64_t v22;

  v8 = strlen(__s);
  while (1)
  {
    v9 = a3;
    if (a3 >= a4)
      break;
    v10 = *((_QWORD *)this + 514);
    v11 = *(unsigned __int8 *)(v10 + a3);
    if (v11 == *(unsigned __int8 *)__s)
    {
      v12 = 0;
      v13 = v10 + a3 + 1;
      v14 = a3;
      do
      {
        ++v14;
        v15 = v12 + 1;
        v16 = v12 + 1 + a3;
        v17 = *(unsigned __int8 *)(v13 + v12);
        v18 = __s[v12 + 1];
        v20 = v16 < a4 && v17 == v18 && v15 < v8;
        v12 = v15;
      }
      while (v20);
      a3 += v15;
      if (v8 == v15)
      {
        if (v17 <= 0x3D && ((1 << v17) & 0x2000000000000401) != 0)
        {
          v9 = v14;
          return v9 - v8;
        }
        if (!strcmp(__s, "["))
        {
          v9 += v15;
          return v9 - v8;
        }
      }
    }
    else
    {
      if (a3 <= a4)
        v22 = a4;
      else
        v22 = a3;
      if (*(_BYTE *)(v10 + a3))
      {
        while (v11 != 10)
        {
          if (v9 >= a4)
          {
            v9 = v22;
            break;
          }
          v11 = *(unsigned __int8 *)(v10 + 1 + v9++);
          if (!v11)
            break;
        }
      }
      if (v9 >= a4)
        a3 = v9;
      else
        a3 = v9 + 1;
    }
  }
  v8 = 0;
  return v9 - v8;
}

void IniFileWriter::writeToMemory(IniFileWriter *this, char *a2, char *a3, char *a4)
{
  char *v5;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;

  v5 = a3;
  if (!a2)
  {
    if (a3)
      goto LABEL_12;
    goto LABEL_8;
  }
  while (1)
  {
    v8 = *a2;
    v9 = OUTLINED_FUNCTION_2_13();
    if (!v8)
      break;
    if (v9)
      OUTLINED_FUNCTION_4_5(*a2);
    OUTLINED_FUNCTION_11_1();
    if (!v10)
      return;
  }
  if (v9)
  {
    OUTLINED_FUNCTION_6_4();
    if (v5)
    {
LABEL_12:
      while (1)
      {
        v11 = *v5;
        v12 = OUTLINED_FUNCTION_2_13();
        if (!v11)
          break;
        if (v12)
          OUTLINED_FUNCTION_4_5(*v5);
        OUTLINED_FUNCTION_3_10();
        ++v5;
        if (!v13)
          return;
      }
      if (v12)
      {
        v14 = *((_QWORD *)this + 514);
        v15 = *((_QWORD *)this + 515);
        *((_QWORD *)this + 515) = v15 + 1;
        *(_BYTE *)(v14 + v15) = 61;
        if (a4)
        {
LABEL_19:
          while (1)
          {
            v16 = *a4;
            v17 = OUTLINED_FUNCTION_2_13();
            if (!v16)
              break;
            if (v17)
              OUTLINED_FUNCTION_4_5(*a4);
            OUTLINED_FUNCTION_3_10();
            ++a4;
            if (!v18)
              return;
          }
          if (v17)
            OUTLINED_FUNCTION_6_4();
        }
      }
      return;
    }
LABEL_8:
    if (a4)
      goto LABEL_19;
  }
}

uint64_t IniFileWriter::ensureBufferSpace(IniFileWriter *this)
{
  if (*((_QWORD *)this + 516) <= *((_QWORD *)this + 515))
    IniFileWriter::doubleBuffer(this);
  return 1;
}

uint64_t IniFileWriter::goEndSection(IniFileWriter *this)
{
  uint64_t v1;
  uint64_t i;
  uint64_t v3;
  int v4;

  v1 = *((_QWORD *)this + 514);
  for (i = *((_QWORD *)this + 515); ; *((_QWORD *)this + 515) = i)
  {
    v3 = *(unsigned __int8 *)(v1 + i);
    if ((_DWORD)v3 == 10)
      break;
    if (!*(_BYTE *)(v1 + i))
      return v3;
    ++i;
LABEL_9:
    ;
  }
  ++i;
  v4 = *(unsigned __int8 *)(v1 + i);
  if (v4 != 10 && v4 != 0)
    goto LABEL_9;
  *((_QWORD *)this + 515) = i;
  return 1;
}

uint64_t IniFileWriter::goEndKey(IniFileWriter *this)
{
  uint64_t v1;
  uint64_t i;
  uint64_t v3;

  v1 = *((_QWORD *)this + 514);
  for (i = *((_QWORD *)this + 515); ; *((_QWORD *)this + 515) = i)
  {
    v3 = *(unsigned __int8 *)(v1 + i);
    if (!*(_BYTE *)(v1 + i))
      break;
    if ((_DWORD)v3 == 61)
    {
      *((_QWORD *)this + 515) = i + 1;
      return 1;
    }
    ++i;
  }
  return v3;
}

uint64_t IniFileWriter::goEndData(IniFileWriter *this, uint64_t *a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t result;

  v2 = *((_QWORD *)this + 514);
  for (i = *a2; ; *a2 = i)
  {
    result = *(unsigned __int8 *)(v2 + i);
    if (!*(_BYTE *)(v2 + i))
      break;
    if ((_DWORD)result == 10)
    {
      *a2 = i + 1;
      return 1;
    }
    ++i;
  }
  return result;
}

uint64_t IniFileWriter::writeFileFromMemory(IniFileWriter *this)
{
  FILE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *((_QWORD *)this + 515) = 0;
  v2 = fopen((const char *)this + 8, "w");
  *(_QWORD *)this = v2;
  if (!v2)
    return 0;
  v3 = *((_QWORD *)this + 515);
  while (1)
  {
    v4 = *((_QWORD *)this + 514);
    if (!*(_BYTE *)(v4 + v3))
    {
      v5 = 1;
      goto LABEL_9;
    }
    if (fputc(*(char *)(v4 + v3), *(FILE **)this) == -1)
      break;
    OUTLINED_FUNCTION_3_10();
  }
  v5 = 0;
LABEL_9:
  fclose(*(FILE **)this);
  return v5;
}

uint64_t IniFileWriter::deleteKeyFromSection(IniFileWriter *this, const char *a2, const char *a3)
{
  return 0;
}

void IniFileWriter::deleteSection(const char **this, const char *a2)
{
  uint64_t v4;
  size_t v5;

  if (IniFileWriter::readFileIntoMemory((IniFileWriter *)this, "r"))
  {
    OUTLINED_FUNCTION_10_1();
    v4 = OUTLINED_FUNCTION_1_18();
    *(_BYTE *)v4 = 91;
    strcpy((char *)(v4 + 1), a2);
    *(_WORD *)(v4 + strlen((const char *)v4)) = 93;
    v5 = strlen(this[514]);
    this[515] = (const char *)IniFileWriter::stringSearch((IniFileWriter *)this, (const char *)v4, 0, v5);
    OUTLINED_FUNCTION_0_22();
  }
  OUTLINED_FUNCTION_9_2();
}

void IniFileWriter::doubleBuffer(IniFileWriter *this)
{
  uint64_t v2;
  void *v3;
  const void *v4;

  v2 = 2 * *((_QWORD *)this + 516);
  v3 = (void *)OUTLINED_FUNCTION_1_18();
  v4 = (const void *)*((_QWORD *)this + 514);
  memcpy(v3, v4, *((_QWORD *)this + 516));
  if (v4)
    OUTLINED_FUNCTION_0_22();
  *((_QWORD *)this + 514) = v3;
  *((_QWORD *)this + 516) = v2;
  OUTLINED_FUNCTION_9_2();
}

void OUTLINED_FUNCTION_0_22()
{
  JUMPOUT(0x2495994A8);
}

uint64_t OUTLINED_FUNCTION_1_18()
{
  return operator new[]();
}

uint64_t OUTLINED_FUNCTION_2_13()
{
  IniFileWriter *v0;

  return IniFileWriter::ensureBufferSpace(v0);
}

void OUTLINED_FUNCTION_3_10()
{
  uint64_t v0;

  ++*(_QWORD *)(v0 + 4120);
}

void OUTLINED_FUNCTION_4_5(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)(v1 + 4112) + *(_QWORD *)(v1 + 4120)) = a1;
}

void OUTLINED_FUNCTION_5_5()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 4112) + *(_QWORD *)(v0 + 4120)) = 0;
}

void OUTLINED_FUNCTION_6_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 4112);
  v2 = *(_QWORD *)(v0 + 4120);
  *(_QWORD *)(v0 + 4120) = v2 + 1;
  *(_BYTE *)(v1 + v2) = 10;
}

void OUTLINED_FUNCTION_7_3(IniFileWriter *a1, char *a2, char *a3)
{
  char *v3;

  IniFileWriter::writeToMemory(a1, a2, a3, v3);
}

size_t OUTLINED_FUNCTION_10_1()
{
  const char *v0;

  return strlen(v0);
}

void OUTLINED_FUNCTION_11_1()
{
  uint64_t v0;

  ++*(_QWORD *)(v0 + 4120);
}

void RequestLicense::RequestLicense(RequestLicense *this)
{
  OUTLINED_FUNCTION_0_23((uint64_t)this, (uint64_t)&off_25198C910);
}

{
  OUTLINED_FUNCTION_0_23((uint64_t)this, (uint64_t)&off_25198C910);
}

uint64_t RequestLicense::licenseGranted(RequestLicense *this)
{
  return *((unsigned __int8 *)this + 8);
}

BOOL RequestLicense::queryInterface(RequestLicense *this, uint64_t a2, void **a3)
{
  *a3 = 0;
  if ((a2 & 0xFFFFFFFFFFFFFFFDLL) != 1)
    return 0;
  *a3 = this;
  (*(void (**)(RequestLicense *))(*(_QWORD *)this + 8))(this);
  return *a3 != 0;
}

uint64_t RequestLicense::addRef(RequestLicense *this)
{
  return 0;
}

uint64_t RequestLicense::release(RequestLicense *this)
{
  return 0;
}

uint64_t RequestLicense::licenseNeeded(RequestLicense *this)
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_0_23@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)result = a2;
  *(_BYTE *)(result + 8) = 1;
  return result;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_25198C260();
}

uint64_t operator delete()
{
  return off_25198C268();
}

uint64_t operator new[]()
{
  return off_25198C270();
}

uint64_t operator new()
{
  return off_25198C278();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x24BDAC8B8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x24BDAC900]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fgetc(FILE *a1)
{
  return MEMORY[0x24BDAE368](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return (char *)MEMORY[0x24BDAE5D8](a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void perror(const char *a1)
{
  MEMORY[0x24BDAF5A8](a1);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x24BDAF7A0](a1, *(_QWORD *)&a2);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F0](a1, a2, a3);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
  MEMORY[0x24BDAF830](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

void srand(unsigned int a1)
{
  MEMORY[0x24BDAFE80](*(_QWORD *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFEE0](__s1, __s2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x24BDAFF00](__dst, __src);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF60](__s1, __s2, __n);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return (char *)MEMORY[0x24BDAFFF0](__str, __sep);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

