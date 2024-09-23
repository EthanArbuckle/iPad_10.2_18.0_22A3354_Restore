zhtok::WordBreaker *zhtok::WordBreaker::WordBreaker(zhtok::WordBreaker *this, const __CFLocale *a2)
{
  const __CFString *v3;
  uint64_t v4;
  char *v5;
  char *v7;
  int v8;

  *(_QWORD *)this = 0;
  *((_DWORD *)this + 2) = 0;
  *((_OWORD *)this + 1) = xmmword_20B7F2660;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  v8 = 0;
  v3 = (const __CFString *)MEMORY[0x20BD38598](a2);
  zhtok::UTF8StringFromCFString(v3, &v7);
  v4 = ubrk_open();
  *(_QWORD *)this = v4;
  if (v8 >= 1 && v4)
  {
    ubrk_close();
    *(_QWORD *)this = 0;
  }
  v5 = v7;
  v7 = 0;
  if (v5)
    MEMORY[0x20BD387E4](v5, 0x1000C8077774924);
  return this;
}

void sub_20B7ED1FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD387E4](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t zhtok::WordBreaker::close(zhtok::WordBreaker *this)
{
  uint64_t result;

  result = *(_QWORD *)this;
  if (result)
  {
    result = ubrk_close();
    *(_QWORD *)this = 0;
  }
  return result;
}

void zhtok::WordBreaker::~WordBreaker(zhtok::WordBreaker *this)
{
  if (*(_QWORD *)this)
  {
    ubrk_close();
    *(_QWORD *)this = 0;
  }
  utext_close((UText *)((char *)this + 16));
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t zhtok::WordBreaker::set(zhtok::WordBreaker *this, const unsigned __int16 *a2, int64_t a3)
{
  UText *v4;
  UErrorCode v5;
  UErrorCode status;

  if (*(_QWORD *)this)
  {
    *((_OWORD *)this + 1) = xmmword_20B7F2660;
    *((_OWORD *)this + 2) = 0u;
    v4 = (UText *)((char *)this + 16);
    *((_OWORD *)this + 3) = 0u;
    *((_OWORD *)this + 4) = 0u;
    *((_OWORD *)this + 5) = 0u;
    *((_OWORD *)this + 6) = 0u;
    *((_OWORD *)this + 7) = 0u;
    *((_OWORD *)this + 8) = 0u;
    *((_OWORD *)this + 9) = 0u;
    status = U_ZERO_ERROR;
    utext_openUChars((UText *)((char *)this + 16), a2, a3, &status);
    if (status < U_ILLEGAL_ARGUMENT_ERROR)
    {
      ubrk_setUText();
      v5 = status;
      utext_close(v4);
      if (v5 <= U_ZERO_ERROR)
      {
        *((_DWORD *)this + 2) = ubrk_first();
        return 1;
      }
    }
    else
    {
      utext_close(v4);
    }
  }
  return 0;
}

__CFString *createPathRelativeToPlatformRoot(const char *a1)
{
  __CFString *Mutable;
  const __CFString *v3;

  Mutable = CFStringCreateMutable(0, 1024);
  v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], "/", 0x8000100u);
  CFStringAppend(Mutable, v3);
  if (a1)
    CFStringAppendCString(Mutable, a1, 0x8000100u);
  CFRelease(v3);
  return Mutable;
}

CFComparisonResult languageForLocale(const __CFLocale *a1)
{
  const __CFString *Value;
  const __CFString *v3;
  CFComparisonResult result;

  if (!a1)
    return 0xFFFFFFFFLL;
  Value = (const __CFString *)CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x24BDBD418]);
  v3 = (const __CFString *)CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x24BDBD420]);
  if (CFStringCompare(Value, CFSTR("zh"), 0) || !v3)
    return 0xFFFFFFFFLL;
  result = CFStringCompare(v3, CFSTR("Hans"), 0);
  if (result)
  {
    if (CFStringCompare(v3, CFSTR("Hant"), 0) == kCFCompareEqualTo)
      return 1;
    return 0xFFFFFFFFLL;
  }
  return result;
}

const __CFString *languageModelBundleNameForLocale(const __CFLocale *a1)
{
  const __CFString *Value;

  if (a1
    && (Value = (const __CFString *)CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x24BDBD418]),
        CFStringCompare(Value, CFSTR("zh"), 0) == kCFCompareEqualTo))
  {
    return CFSTR("Chinese.lm");
  }
  else
  {
    return &stru_24C456370;
  }
}

CFLocaleRef createLocaleForLanguage(int a1)
{
  const char *v1;
  const char *v2;
  const __CFString *v3;
  CFLocaleRef v4;

  v1 = "";
  if (a1 == 1)
    v1 = "zh-Hant";
  if (a1)
    v2 = v1;
  else
    v2 = "zh-Hans";
  v3 = CFStringCreateWithCString(0, v2, 0x8000100u);
  v4 = CFLocaleCreate(0, v3);
  CFRelease(v3);
  return v4;
}

uint64_t zhtok::UTF8StringFromCFString@<X0>(const __CFString *this@<X0>, char **a2@<X8>)
{
  CFIndex Length;
  CFIndex v6;
  char *v7;

  Length = CFStringGetLength(this);
  v6 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v7 = (char *)operator new[]();
  *a2 = v7;
  return CFStringGetCString(this, v7, v6, 0x8000100u);
}

void sub_20B7ED5C8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;

  *v1 = 0;
  MEMORY[0x20BD387E4](v2, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void zhtok::charactersFromCFStringInRange(const __CFString *this@<X0>, const __CFString *a2@<X1>, CFRange a3@<0:X2, 8:X3>, UniChar **a4@<X8>)
{
  CFIndex location;
  UniChar *v8;
  CFRange v9;

  location = a3.location;
  v8 = (UniChar *)operator new[]();
  *a4 = v8;
  v9.location = (CFIndex)a2;
  v9.length = location;
  CFStringGetCharacters(this, v9, v8);
}

void sub_20B7ED664(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;

  *v1 = 0;
  MEMORY[0x20BD387E4](v2, 0x1000C80BDFB0063);
  _Unwind_Resume(a1);
}

uint64_t zhtok::LatticeWord::clearHypotheses(zhtok::LatticeWord *this)
{
  uint64_t result;

  result = *((_QWORD *)this + 1);
  if (result)
    return zhtok::HypothesisSet::clear(result);
  return result;
}

CFStringRef zhtok::LatticeWord::createDescription(zhtok::Word **this)
{
  return zhtok::Word::createDescription(*this);
}

uint64_t zhtok::LatticeWord::initializeBeginSentinelHypothesis(uint64_t a1, uint64_t a2)
{
  return zhtok::HypothesisSet::initializeBeginSentinelHypothesis(*(_QWORD *)(a1 + 8), a2);
}

void zhtok::LatticeWord::connectPreviousWord(zhtok::LatticeWord *this, const zhtok::HypothesisSet **a2, void **a3)
{
  *((_BYTE *)this + 16) = 1;
  zhtok::HypothesisSet::connectPreviousHypotheses(*((zhtok::HypothesisSet **)this + 1), *(const zhtok::Word **)this, a2[1], *a2, a3);
}

zhtok::ChineseLMTokenizer *ChineseTokenizerCreate(const __CFLocale *a1, unint64_t a2)
{
  const __CFString *Value;
  zhtok::ChineseLMTokenizer *v5;

  Value = (const __CFString *)CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x24BDBD418]);
  v5 = 0;
  if (CFStringCompare(Value, CFSTR("zh"), 0) == kCFCompareEqualTo)
  {
    v5 = (zhtok::ChineseLMTokenizer *)operator new();
    zhtok::ChineseLMTokenizer::ChineseLMTokenizer(v5, a1, a2);
    if (!zhtok::ChineseLMTokenizer::isAvailable(v5))
    {
      (*(void (**)(zhtok::ChineseLMTokenizer *))(*(_QWORD *)v5 + 8))(v5);
      return 0;
    }
  }
  return v5;
}

void sub_20B7ED768(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD387FC](v1, 0x10E1C40EADB54B6);
  _Unwind_Resume(a1);
}

uint64_t ChineseTokenizerRelease(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void ChineseTokenizerSetString(zhtok::ChineseLMTokenizer *this, const __CFString *a2, CFRange a3)
{
  if (this)
    zhtok::ChineseLMTokenizer::setString(this, a2, a3);
}

zhtok::ChineseLMTokenizer *ChineseTokenizerAdvanceToNextToken(zhtok::ChineseLMTokenizer *this)
{
  if (this)
    return (zhtok::ChineseLMTokenizer *)zhtok::ChineseLMTokenizer::advanceToNextToken(this);
  return this;
}

zhtok::ChineseLMTokenizer *ChineseTokenizerGetCurrentTokenRange(zhtok::ChineseLMTokenizer *result)
{
  if (result)
    return (zhtok::ChineseLMTokenizer *)zhtok::ChineseLMTokenizer::getCurrentTokenRange(result);
  return result;
}

zhtok::ChineseLMTokenizer *ChineseTokenizerGoToTokenAtIndex(zhtok::ChineseLMTokenizer *this, uint64_t a2)
{
  if (this)
    return (zhtok::ChineseLMTokenizer *)zhtok::ChineseLMTokenizer::goToTokenAtIndex(this, a2);
  return this;
}

uint64_t ChineseTokenizerSetDynamicLexicon(zhtok::ChineseLMTokenizer *a1, CFArrayRef theArray)
{
  uint64_t v2;
  uint64_t v5;
  zhtok::TokenizerLexicon *v7;
  _QWORD v8[2];

  v2 = 0;
  if (a1 && theArray)
  {
    if (CFArrayGetCount(theArray))
    {
      v5 = zhtok::ChineseLMTokenizer::mutableWordLatticeController(a1);
      zhtok::DynamicLexiconBuilder::DynamicLexiconBuilder(v8);
      v7 = 0;
      v2 = zhtok::DynamicLexiconBuilder::build((uint64_t)v8, *(_DWORD *)(v5 + 8), theArray, &v7);
      if ((v2 & 1) != 0)
        zhtok::WordLatticeController::setDynamicLexicon(v5, (uint64_t)v7);
      zhtok::DynamicLexiconBuilder::~DynamicLexiconBuilder((zhtok::DynamicLexiconBuilder *)v8);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void sub_20B7ED870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  zhtok::DynamicLexiconBuilder::~DynamicLexiconBuilder((zhtok::DynamicLexiconBuilder *)va);
  _Unwind_Resume(a1);
}

uint64_t ChineseTokenizerSetCustomWordCheckBlock(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1)
    return zhtok::ChineseLMTokenizer::setCustomWordCheckBlock(a1, a2, a3);
  return a1;
}

uint64_t reportAssertionFailure(const char *a1, int a2, const char *a3, const char *a4)
{
  FILE **v7;

  v7 = (FILE **)MEMORY[0x24BDAC8D8];
  if (a4)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "ASSERTION FAILED: %s\n", a4);
  else
    fwrite("SHOULD NEVER BE REACHED\n", 0x18uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  return fprintf(*v7, "%s(%d) : %s\n", a1, a2, a3);
}

void reportBacktrace()
{
  int v0;
  uint64_t v1;
  char **v2;
  char **v3;
  uint64_t v4;
  FILE **v5;
  uint64_t v6;
  FILE *v7;
  void *v8[2];
  _OWORD v9[15];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  *(_OWORD *)v8 = 0u;
  memset(v9, 0, sizeof(v9));
  v0 = backtrace(v8, 33);
  v1 = (v0 - 2);
  v2 = backtrace_symbols((void *const *)v9, v1);
  if (v2)
  {
    v3 = v2;
    if (v0 >= 3)
    {
      v4 = 0;
      v5 = (FILE **)MEMORY[0x24BDAC8D8];
      do
      {
        v6 = v4 + 1;
        v7 = *v5;
        if (v3[v4])
          fprintf(v7, "%-3d %p %s\n");
        else
          fprintf(v7, "%-3d %p\n");
        v4 = v6;
      }
      while (v1 != v6);
    }
    free(v3);
  }
}

zhtok::ChineseLMTokenizer *zhtok::ChineseLMTokenizer::ChineseLMTokenizer(zhtok::ChineseLMTokenizer *this, const __CFLocale *a2, uint64_t a3)
{
  uint64_t v6;

  *(_QWORD *)this = &off_24C456260;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = -1;
  v6 = operator new();
  zhtok::WordLatticeController::WordLatticeController(v6, a2, a3);
  *((_QWORD *)this + 5) = v6;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = 0;
  return this;
}

void sub_20B7EDAB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD387FC](v1, 0x10E1C40A58F4CECLL);
  _Unwind_Resume(a1);
}

void zhtok::ChineseLMTokenizer::~ChineseLMTokenizer(zhtok::ChineseLMTokenizer *this)
{
  const void *v2;
  void *v3;
  uint64_t v4;

  *(_QWORD *)this = &off_24C456260;
  v2 = (const void *)*((_QWORD *)this + 1);
  if (v2)
    CFRelease(v2);
  v3 = (void *)*((_QWORD *)this + 6);
  if (v3)
  {
    *((_QWORD *)this + 7) = v3;
    operator delete(v3);
  }
  v4 = *((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
}

{
  zhtok::ChineseLMTokenizer::~ChineseLMTokenizer(this);
  JUMPOUT(0x20BD387FCLL);
}

BOOL zhtok::ChineseLMTokenizer::isAvailable(zhtok::ChineseLMTokenizer *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 5);
  return *(_QWORD *)(v1 + 16) && *(_QWORD *)(*(_QWORD *)(v1 + 24) + 8) != 0;
}

void zhtok::ChineseLMTokenizer::reset(zhtok::WordLatticeController **this)
{
  zhtok::WordLatticeController *v2;

  zhtok::WordLatticeController::reset(this[5]);
  this[4] = (zhtok::WordLatticeController *)-1;
  v2 = this[1];
  if (v2)
  {
    CFRelease(v2);
    this[1] = 0;
  }
  this[2] = 0;
  this[3] = 0;
  this[7] = this[6];
}

BOOL zhtok::ChineseLMTokenizer::isValid(zhtok::ChineseLMTokenizer *this, CFStringRef theString, CFRange a3)
{
  _BOOL8 result;
  CFIndex length;
  CFIndex location;
  CFIndex v6;

  result = 0;
  if (theString)
  {
    length = a3.length;
    if (a3.length)
    {
      location = a3.location;
      v6 = CFStringGetLength(theString);
      return location >= 0 && location + length <= v6;
    }
  }
  return result;
}

void zhtok::ChineseLMTokenizer::setString(zhtok::ChineseLMTokenizer *this, const __CFString *a2, CFRange a3)
{
  CFIndex length;
  CFIndex location;
  CFIndex v7;
  uint64_t v8;
  CFIndex i;
  CFIndex v11;
  uint64_t v12;
  double v13;
  unsigned __int16 *v14;
  unsigned __int16 *v15;
  CFRange v16;
  CFRange v17;

  length = a3.length;
  location = a3.location;
  zhtok::ChineseLMTokenizer::reset((zhtok::WordLatticeController **)this);
  if (a2)
  {
    if (length)
    {
      v7 = CFStringGetLength(a2);
      if ((location & 0x8000000000000000) == 0 && location + length <= v7)
      {
        *((_QWORD *)this + 1) = CFStringCreateCopy(0, a2);
        *((_QWORD *)this + 2) = location;
        *((_QWORD *)this + 3) = length;
        v8 = *((_QWORD *)this + 5);
        *(_QWORD *)(v8 + 112) = length;
        std::vector<zhtok::internal::FixedSizedArray<void *>>::reserve((void **)(v8 + 64), length);
        std::vector<zhtok::internal::FixedSizedArray<void *>>::reserve(*(void ***)(v8 + 48), length);
        v16.location = length;
        zhtok::charactersFromCFStringInRange(a2, (const __CFString *)location, v16, &v15);
        if (length >= 1)
        {
          for (i = 0; i < length; i += v11)
          {
            if ((v15[i] & 0xFC00) == 0xD800 && i < length - 1)
            {
              if ((v15[i + 1] & 0xFC00) == 0xDC00)
                v11 = 2;
              else
                v11 = 1;
            }
            else
            {
              v11 = 1;
            }
            v17.location = i;
            v17.length = v11;
            zhtok::WordLatticeController::addComposedCharacteracterInRange(*((zhtok::WordLatticeController **)this + 5), v15, v17);
          }
        }
        v12 = *((_QWORD *)this + 5);
        if (*(_QWORD *)(v12 + 32))
        {
          zhtok::WordLatticeController::rewriteLatticeWithDynamicWords((zhtok::WordLatticeController *)v12, v15);
          v12 = *((_QWORD *)this + 5);
        }
        if (*(_BYTE *)(v12 + 152))
        {
          zhtok::WordLatticeController::finalize((zhtok::WordLatticeController *)v12);
          v12 = *((_QWORD *)this + 5);
        }
        zhtok::WordLatticeController::getBestSegmentation(v12, (uint64_t)this + 48, *((_QWORD *)this + 1), *((_QWORD *)this + 2));
        v13 = zhtok::WordLatticeController::reset(*((zhtok::WordLatticeController **)this + 5));
        v14 = v15;
        v15 = 0;
        if (v14)
          MEMORY[0x20BD387E4](v14, 0x1000C80BDFB0063, v13);
      }
    }
  }
}

void sub_20B7EDD98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    MEMORY[0x20BD387E4](a10, 0x1000C80BDFB0063);
  _Unwind_Resume(exception_object);
}

BOOL zhtok::ChineseLMTokenizer::advanceToNextToken(zhtok::ChineseLMTokenizer *this)
{
  unint64_t v1;
  unint64_t v2;

  v1 = (uint64_t)(*((_QWORD *)this + 7) - *((_QWORD *)this + 6)) >> 4;
  v2 = *((_QWORD *)this + 4) + 1;
  if (v2 < v1)
    *((_QWORD *)this + 4) = v2;
  return v2 < v1;
}

uint64_t zhtok::ChineseLMTokenizer::getCurrentTokenRange(zhtok::ChineseLMTokenizer *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 4);
  if (v1 == -1)
    return -1;
  else
    return *(_QWORD *)(*((_QWORD *)this + 6) + 16 * v1);
}

BOOL zhtok::ChineseLMTokenizer::goToTokenAtIndex(zhtok::ChineseLMTokenizer *this, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  BOOL v9;
  uint64_t v10;

  if (a2 < 0)
    return 0;
  if (*((_QWORD *)this + 3) <= a2)
    return 0;
  v3 = *((_QWORD *)this + 6);
  v2 = *((_QWORD *)this + 7);
  v4 = v2 - v3;
  if (v2 == v3)
  {
    return 0;
  }
  else
  {
    v5 = 0;
    v6 = v4 >> 4;
    if (v6 <= 1)
      v7 = 1;
    else
      v7 = v6;
    v8 = (_QWORD *)(v3 + 8);
    v9 = 1;
    while (1)
    {
      v10 = *(v8 - 1) - *((_QWORD *)this + 2);
      if (v10 <= a2 && *v8 + v10 > a2)
        break;
      v8 += 2;
      v9 = ++v5 < v6;
      if (v7 == v5)
        return 0;
    }
    *((_QWORD *)this + 4) = v5;
  }
  return v9;
}

uint64_t zhtok::ChineseLMTokenizer::mutableWordLatticeController(zhtok::ChineseLMTokenizer *this)
{
  return *((_QWORD *)this + 5);
}

uint64_t zhtok::ChineseLMTokenizer::setCustomWordCheckBlock(uint64_t a1, uint64_t a2, void *a3)
{
  return zhtok::WordLatticeController::setCustomWordCheckBlock(*(_QWORD *)(a1 + 40), a2, a3);
}

void std::vector<zhtok::internal::FixedSizedArray<void *>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0x2E8BA2E8BA2E8BA3 * ((v4 - (_BYTE *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x2E8BA2E8BA2E8BBLL)
      std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 88;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::internal::FixedSizedArray<void *>>>(v3, a2);
    v7 = &v6[88 * v5];
    v9 = &v6[88 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *(_OWORD *)(v10 - 88);
        *(_OWORD *)(v12 - 72) = *(_OWORD *)(v10 - 72);
        *(_OWORD *)(v12 - 88) = v13;
        v14 = *(_OWORD *)(v10 - 56);
        v15 = *(_OWORD *)(v10 - 40);
        v16 = *(_OWORD *)(v10 - 24);
        *((_QWORD *)v12 - 1) = *((_QWORD *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v16;
        *(_OWORD *)(v12 - 40) = v15;
        *(_OWORD *)(v12 - 56) = v14;
        v12 -= 88;
        v10 -= 88;
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

void std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24C456018, MEMORY[0x24BEDAAF0]);
}

void sub_20B7EE00C(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::internal::FixedSizedArray<void *>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2E8BA2E8BA2E8BBLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(88 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

CFStringRef zhtok::Word::createDescription(zhtok::Word *this)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("[%ld, %ld](%d)"), *((_QWORD *)this + 1), *((_QWORD *)this + 2), *((unsigned int *)this + 1));
}

uint64_t zhtok::Word::summary(zhtok::Word *this, const __CFString *a2)
{
  const __CFString *v4;
  size_t v5;
  const __CFString *v6;
  size_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v12;
  char *__s;
  _QWORD v14[2];
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v14);
  v4 = CFStringCreateWithSubstring(0, a2, *(CFRange *)((char *)this + 8));
  zhtok::UTF8StringFromCFString(v4, &__s);
  v5 = strlen(__s);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)__s, v5);
  CFRelease(v4);
  v6 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("[%ld, %ld](%d)"), *((_QWORD *)this + 1), *((_QWORD *)this + 2), *((unsigned int *)this + 1));
  zhtok::UTF8StringFromCFString(v6, &v12);
  v7 = strlen(v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v12, v7);
  CFRelease(v6);
  std::stringbuf::str();
  v8 = v12;
  v12 = 0;
  if (v8)
    MEMORY[0x20BD387E4](v8, 0x1000C8077774924);
  v9 = __s;
  __s = 0;
  if (v9)
    MEMORY[0x20BD387E4](v9, 0x1000C8077774924);
  v14[0] = *MEMORY[0x24BEDB7F0];
  v10 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v14 + *(_QWORD *)(v14[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v15[0] = v10;
  v15[1] = MEMORY[0x24BEDB848] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x20BD387CC](&v17);
}

void sub_20B7EE294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  if (a6)
    MEMORY[0x20BD387E4](a6, 0x1000C8077774924);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x24BEDB858];
  v3 = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 128) = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  v4 = a1 + 16;
  v5 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v7 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + *(_QWORD *)(v6 - 24)) = v7;
  *(_QWORD *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v9 = v5[4];
  v10 = v5[5];
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(v4 + *(_QWORD *)(v9 - 24)) = v10;
  v11 = v5[1];
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + *(_QWORD *)(v11 - 24)) = v5[6];
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 128) = v3;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_20B7EE408(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x20BD387CC](v1);
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
  MEMORY[0x20BD387CC](a1 + 128);
  return a1;
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

  MEMORY[0x20BD38754](v13, a1);
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
  MEMORY[0x20BD38760](v13);
  return a1;
}

void sub_20B7EE5C0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x20BD38760](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x20B7EE5A0);
}

void sub_20B7EE608(_Unwind_Exception *a1)
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

void sub_20B7EE73C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

uint64_t zhtok::HypothesisSet::initializeBeginSentinelHypothesis(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  if (*(_QWORD *)(a1 + 80))
  {
    *(_QWORD *)(a1 + 80) = 0;
    *(_QWORD *)(a1 + 88) = 0;
  }
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  v4 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 80) = v4 + 1;
  *(_QWORD *)(a1 + 8 * v4) = result;
  return result;
}

uint64_t zhtok::HypothesisSet::clear(uint64_t this)
{
  *(_QWORD *)(this + 80) = 0;
  *(_QWORD *)(this + 88) = 0;
  return this;
}

double zhtok::HypothesisSet::bestBacktraceCost(zhtok::HypothesisSet *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 11);
  if (v1)
    return *(double *)(v1 + 16);
  else
    return 1.79769313e308;
}

double zhtok::HypothesisSet::costOfNewHypothesis(zhtok::HypothesisSet *this, const zhtok::Hypothesis *a2, const zhtok::Word *a3, void **a4)
{
  double v5;
  double v6;

  if (((_BYTE)a4[1] & 1) != 0 && *((_DWORD *)a3 + 1) == 2)
    return *((double *)a2 + 2);
  if (*(_DWORD *)a3 == 3)
  {
    v5 = *((double *)a2 + 2);
    v6 = 0.5;
  }
  else
  {
    if (*(_DWORD *)a3 == 4)
      v5 = *((double *)a2 + 2) + (double)*((uint64_t *)a3 + 2) * -7.0;
    else
      v5 = zhtok::Hypothesis::costOfExtendingToWord(a2, *((_DWORD *)a3 + 1), *a4) + *((double *)a2 + 2);
    v6 = 0.0;
  }
  return v5 + v6;
}

void zhtok::HypothesisSet::connectPreviousHypotheses(zhtok::HypothesisSet *this, const zhtok::Word *a2, const zhtok::HypothesisSet *a3, const zhtok::Word *a4, void **a5)
{
  uint64_t v5;
  zhtok::HypothesisSet *v9;
  double *v10;
  uint64_t v11;
  double v12;
  double v13;
  double *v14;
  double v15;
  double v17;
  unint64_t v18;
  double *v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  _QWORD *v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  int64_t v31;
  unint64_t v32;
  zhtok::LatticeSessionData *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v5 = *((_QWORD *)a3 + 10);
  if (!v5)
    return;
  v9 = this;
  v10 = 0;
  v11 = 0;
  v12 = 1.79769313e308;
  v13 = 1.79769313e308;
  while (1)
  {
    v14 = (double *)*((_QWORD *)a3 + v11);
    v15 = v14[2];
    if (!v11)
    {
      v12 = v15 + 2.0;
      goto LABEL_10;
    }
    if (v15 > v13 || v15 > v12)
      break;
LABEL_10:
    v17 = zhtok::HypothesisSet::costOfNewHypothesis(this, *((const zhtok::Hypothesis **)a3 + v11), a2, a5);
    if (v10 && v13 <= v17)
    {
      this = (zhtok::HypothesisSet *)zhtok::LatticeSessionData::logStatistics((zhtok::LatticeSessionData *)v14);
    }
    else
    {
      v13 = v17;
      v10 = v14;
    }
    if (v5 == ++v11)
      goto LABEL_17;
  }
  if (!v10)
    return;
LABEL_17:
  v18 = *((_QWORD *)v9 + 10);
  if (!v18)
  {
    v33 = (zhtok::LatticeSessionData *)(*((uint64_t (**)(double))a5[2] + 2))(v13);
    v34 = *((_QWORD *)v9 + 10);
    *((_QWORD *)v9 + v34) = v33;
    *((_QWORD *)v9 + 10) = v34 + 1;
    *((_QWORD *)v9 + 11) = v10;
    goto LABEL_43;
  }
  if (*(double *)(*(_QWORD *)v9 + 16) + 1.0 < v13
    || v18 >= 0xA && v13 >= *(double *)(*((_QWORD *)v9 + v18 - 1) + 16))
  {
    v33 = (zhtok::LatticeSessionData *)v10;
LABEL_43:
    zhtok::LatticeSessionData::logStatistics(v33);
    return;
  }
  v19 = (double *)(*((uint64_t (**)(double))a5[2] + 2))(v13);
  v20 = *((_QWORD *)v9 + 10);
  if (!v20)
  {
    v23 = 0;
    goto LABEL_54;
  }
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = (_QWORD *)((char *)v9 + 8);
  v25 = -1;
  while (2)
  {
    v26 = (double *)*((_QWORD *)v9 + v21);
    v27 = *(_QWORD *)v26;
    v28 = *(_QWORD *)v19;
    if ((v22 & 1) == 0)
    {
      v29 = v26[2];
      v30 = v19[2];
      if (v27 == v28)
      {
        if (v29 <= v30)
        {
          v23 = 1;
          goto LABEL_53;
        }
        zhtok::LatticeSessionData::logStatistics((zhtok::LatticeSessionData *)v26);
        *((_QWORD *)v9 + v21) = v19;
        v23 = 1;
      }
      else
      {
        if (v29 <= v30)
        {
          v22 = 0;
          goto LABEL_40;
        }
        if (v20 == 10)
        {
          zhtok::LatticeSessionData::logStatistics(*((zhtok::LatticeSessionData **)v9 + 9));
          v20 = *((_QWORD *)v9 + 10) - 1;
        }
        v31 = v20 - 1;
        v32 = v20;
        while (v31 >= (uint64_t)v21)
        {
          *((_QWORD *)v9 + v32) = *((_QWORD *)v9 + v32 - 1);
          v31 = v32 - 2;
          --v32;
        }
        *((_QWORD *)v9 + v21) = v19;
        *((_QWORD *)v9 + 10) = v20 + 1;
      }
      zhtok::LatticeSessionData::logStatistics((zhtok::LatticeSessionData *)v19);
      if (!v21)
        *((_QWORD *)v9 + 11) = v10;
      goto LABEL_39;
    }
    if (!(v23 & 1 | (v27 != v28)))
    {
      zhtok::LatticeSessionData::logStatistics((zhtok::LatticeSessionData *)v26);
      v35 = *((_QWORD *)v9 + 10);
      v36 = v35 - 1;
      if (v21 < v35 - 1)
      {
        v37 = v35 + v25;
        do
        {
          *(v24 - 1) = *v24;
          ++v24;
          --v37;
        }
        while (v37);
      }
      *((_QWORD *)v9 + 10) = v36;
      return;
    }
LABEL_39:
    v22 = 1;
LABEL_40:
    ++v21;
    v20 = *((_QWORD *)v9 + 10);
    ++v24;
    --v25;
    if (v21 < v20)
      continue;
    break;
  }
  if ((v22 & 1) != 0)
    return;
LABEL_53:
  if (v20 > 0xA)
    return;
LABEL_54:
  if (v20 == 10 || (v23 & 1) != 0)
  {
    zhtok::LatticeSessionData::logStatistics((zhtok::LatticeSessionData *)v19);
  }
  else
  {
    zhtok::LatticeSessionData::logStatistics((zhtok::LatticeSessionData *)v19);
    v38 = *((_QWORD *)v9 + 10);
    *((_QWORD *)v9 + 10) = v38 + 1;
    *((_QWORD *)v9 + v38) = v19;
  }
}

uint64_t zhtok::ConnectionContext::ConnectionContext(uint64_t a1, uint64_t a2, int a3, void *aBlock)
{
  *(_QWORD *)a1 = a2;
  *(_DWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = _Block_copy(aBlock);
  return a1;
}

void zhtok::ConnectionContext::~ConnectionContext(const void **this)
{
  _Block_release(this[2]);
}

{
  _Block_release(this[2]);
}

_QWORD *zhtok::DynamicLexiconBuilder::DynamicLexiconBuilder(_QWORD *this)
{
  *this = &off_24C456280;
  this[1] = 0;
  return this;
}

void zhtok::DynamicLexiconBuilder::~DynamicLexiconBuilder(zhtok::DynamicLexiconBuilder *this)
{
  const void *v1;

  *(_QWORD *)this = &off_24C456280;
  v1 = (const void *)*((_QWORD *)this + 1);
  if (v1)
    CFRelease(v1);
}

{
  zhtok::DynamicLexiconBuilder::~DynamicLexiconBuilder(this);
  JUMPOUT(0x20BD387FCLL);
}

uint64_t zhtok::DynamicLexiconBuilder::build(uint64_t a1, int a2, CFArrayRef theArray, zhtok::TokenizerLexicon **a4)
{
  CFIndex Count;
  uint64_t result;
  zhtok::TokenizerLexicon *v10;
  void *v11;

  if (!theArray)
    return 0;
  Count = CFArrayGetCount(theArray);
  result = 0;
  if (a4)
  {
    if (Count)
    {
      result = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      *(_QWORD *)(a1 + 8) = result;
      if (result)
      {
        result = zhtok::DynamicLexiconBuilder::registerLanguage(a1, a2);
        if ((_DWORD)result)
        {
          result = zhtok::DynamicLexiconBuilder::filterAndRegisterWords((CFMutableDictionaryRef *)a1, theArray);
          if ((_DWORD)result)
          {
            v10 = (zhtok::TokenizerLexicon *)operator new();
            zhtok::TokenizerLexicon::TokenizerLexicon(v10);
            v11 = (void *)LMLexiconCreate();
            if (v11)
            {
              zhtok::TokenizerLexicon::setLexicon(v10, v11);
              *a4 = v10;
              return 1;
            }
            (*(void (**)(zhtok::TokenizerLexicon *))(*(_QWORD *)v10 + 8))(v10);
            return 0;
          }
        }
      }
    }
  }
  return result;
}

void sub_20B7EEE5C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD387FC](v1, 0x81C40D6874129);
  _Unwind_Resume(a1);
}

uint64_t zhtok::DynamicLexiconBuilder::registerLanguage(uint64_t a1, int a2)
{
  BOOL v2;
  uint64_t v3;
  CFLocaleRef LocaleForLanguage;

  v2 = a2 == -1 || *(_QWORD *)(a1 + 8) == 0;
  v3 = !v2;
  if (!v2)
  {
    LocaleForLanguage = createLocaleForLanguage(a2);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), (const void *)*MEMORY[0x24BE5EEB8], LocaleForLanguage);
    CFRelease(LocaleForLanguage);
  }
  return v3;
}

BOOL zhtok::DynamicLexiconBuilder::filterAndRegisterWords(CFMutableDictionaryRef *this, CFArrayRef theArray)
{
  _BOOL8 result;
  CFIndex Count;
  zhtok::DynamicLexiconBuilder *Mutable;

  result = 0;
  if (theArray && this[1])
  {
    Count = CFArrayGetCount(theArray);
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], Count, MEMORY[0x24BDBD690]);
    result = zhtok::DynamicLexiconBuilder::filter(Mutable, Mutable, theArray);
    if (result)
    {
      CFDictionarySetValue(this[1], (const void *)*MEMORY[0x24BE5EE88], theArray);
      CFRelease(Mutable);
      return 1;
    }
  }
  return result;
}

BOOL zhtok::DynamicLexiconBuilder::filter(zhtok::DynamicLexiconBuilder *this, __CFArray *a2, CFArrayRef theArray)
{
  _BOOL8 v3;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  const __CFString *ValueAtIndex;
  CFTypeID v10;
  BOOL v11;

  v3 = 0;
  if (a2 && theArray)
  {
    Count = CFArrayGetCount(theArray);
    if (Count < 1)
    {
      return 1;
    }
    else
    {
      v7 = Count;
      for (i = 0; i != v7; ++i)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, i);
        v10 = CFGetTypeID(ValueAtIndex);
        v11 = v10 == CFStringGetTypeID();
        v3 = v11;
        if (!v11)
          break;
        if (CFStringGetLength(ValueAtIndex) >= 3)
          CFArrayAppendValue(a2, ValueAtIndex);
      }
    }
  }
  return v3;
}

uint64_t zhtok::WordLatticeController::WordLatticeController(uint64_t a1, const __CFLocale *a2, int a3)
{
  const __CFString *v6;
  __CFDictionary *Mutable;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  CFComparisonResult v11;
  zhtok::LatticeSessionData *v12;
  _QWORD *v13;
  uint64_t v14;
  zhtok::WordBreaker *v15;
  const void **v16;
  uint64_t v17;
  _QWORD aBlock[5];

  *(_QWORD *)a1 = &off_24C4562A0;
  *(_DWORD *)(a1 + 8) = languageForLocale(a2);
  v6 = languageModelBundleNameForLocale(a2);
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE5EEB8], a2);
  v8 = (const void *)*MEMORY[0x24BDBD268];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE5EE60], (const void *)*MEMORY[0x24BDBD268]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE5EEE0], v8);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE5EE70], v6);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE5EEC8], (const void *)*MEMORY[0x24BDBD270]);
  v9 = LMLanguageModelCreate();
  CFRelease(Mutable);
  *(_QWORD *)(a1 + 16) = v9;
  v10 = operator new();
  v11 = languageForLocale(a2);
  zhtok::TokenizerLexicon::TokenizerLexicon(v10, v11);
  *(_QWORD *)(a1 + 24) = v10;
  *(_QWORD *)(a1 + 32) = 0;
  v12 = (zhtok::LatticeSessionData *)operator new();
  zhtok::LatticeSessionData::LatticeSessionData(v12);
  *(_QWORD *)(a1 + 40) = v12;
  v13 = (_QWORD *)operator new();
  v14 = *(_QWORD *)(**(_QWORD **)(a1 + 40) + 16);
  *v13 = 0;
  v13[1] = 0;
  v13[2] = 0;
  v13[3] = v14;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_QWORD *)(a1 + 48) = v13;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = xmmword_20B7F26B0;
  *(_OWORD *)(a1 + 136) = xmmword_20B7F26B0;
  *(_BYTE *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 160) = CFCharacterSetGetPredefined(kCFCharacterSetNewline);
  *(_QWORD *)(a1 + 168) = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  v15 = (zhtok::WordBreaker *)operator new();
  zhtok::WordBreaker::WordBreaker(v15, a2);
  *(_QWORD *)(a1 + 184) = 0;
  *(_QWORD *)(a1 + 192) = 0;
  *(_QWORD *)(a1 + 176) = v15;
  v16 = (const void **)operator new();
  v17 = *(_QWORD *)(a1 + 16);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN5zhtok21WordLatticeControllerC2EPK10__CFLocale23ChineseTokenizerOptions_block_invoke;
  aBlock[3] = &__block_descriptor_tmp;
  aBlock[4] = a1;
  zhtok::ConnectionContext::ConnectionContext((uint64_t)v16, v17, a3, aBlock);
  std::unique_ptr<zhtok::ConnectionContext>::reset[abi:ne180100]((const void ***)(a1 + 56), v16);
  return a1;
}

void sub_20B7EF2A8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  const void ***v3;
  void *v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  MEMORY[0x20BD387FC](v2, 0x1080C40BEC857D6);
  std::unique_ptr<zhtok::WordBreaker>::reset[abi:ne180100]((zhtok::WordBreaker **)(v1 + 176), 0);
  v5 = *(void **)(v1 + 88);
  if (v5)
  {
    *(_QWORD *)(v1 + 96) = v5;
    operator delete(v5);
  }
  v6 = (uint64_t *)(v1 + 48);
  v7 = *(void **)(v1 + 64);
  if (v7)
  {
    *(_QWORD *)(v1 + 72) = v7;
    operator delete(v7);
  }
  std::unique_ptr<zhtok::ConnectionContext>::reset[abi:ne180100](v3, 0);
  v8 = *v6;
  *v6 = 0;
  if (v8)
    std::default_delete<zhtok::Lattice>::operator()[abi:ne180100](v1 + 48, v8);
  std::unique_ptr<zhtok::LatticeSessionData>::reset[abi:ne180100]((zhtok::LatticeSessionData **)(v1 + 40), 0);
  v9 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  v10 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  _Unwind_Resume(a1);
}

const void **std::unique_ptr<zhtok::ConnectionContext>::reset[abi:ne180100](const void ***a1, const void **a2)
{
  const void **result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    zhtok::ConnectionContext::~ConnectionContext(result);
    JUMPOUT(0x20BD387FCLL);
  }
  return result;
}

void zhtok::WordLatticeController::~WordLatticeController(zhtok::WordLatticeController *this)
{
  const void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)this = &off_24C4562A0;
  if (*((_QWORD *)this + 2))
    LMLanguageModelRelease();
  v2 = (const void *)*((_QWORD *)this + 23);
  if (v2)
    _Block_release(v2);
  std::unique_ptr<zhtok::WordBreaker>::reset[abi:ne180100]((zhtok::WordBreaker **)this + 22, 0);
  v3 = (void *)*((_QWORD *)this + 11);
  if (v3)
  {
    *((_QWORD *)this + 12) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 8);
  if (v4)
  {
    *((_QWORD *)this + 9) = v4;
    operator delete(v4);
  }
  std::unique_ptr<zhtok::ConnectionContext>::reset[abi:ne180100]((const void ***)this + 7, 0);
  v5 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = 0;
  if (v5)
    std::default_delete<zhtok::Lattice>::operator()[abi:ne180100]((uint64_t)this + 48, v5);
  std::unique_ptr<zhtok::LatticeSessionData>::reset[abi:ne180100]((zhtok::LatticeSessionData **)this + 5, 0);
  v6 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
}

{
  zhtok::WordLatticeController::~WordLatticeController(this);
  JUMPOUT(0x20BD387FCLL);
}

double zhtok::WordLatticeController::reset(zhtok::WordLatticeController *this)
{
  zhtok::Lattice *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  double result;

  v2 = (zhtok::Lattice *)*((_QWORD *)this + 6);
  v4 = *(_QWORD *)v2;
  v3 = *((_QWORD *)v2 + 1);
  zhtok::Lattice::clear(v2);
  if (v3 != v4)
  {
    zhtok::LatticeSessionData::reset(*((zhtok::LatticeSessionData **)this + 5));
    *((_QWORD *)this + 9) = *((_QWORD *)this + 8);
    zhtok::TokenizerLexicon::reset(*((zhtok::TokenizerLexicon **)this + 3));
    *((_BYTE *)this + 152) = 0;
  }
  v5 = (char *)*((_QWORD *)this + 8);
  v6 = (char *)*((_QWORD *)this + 9);
  if (v6 == v5)
  {
    v7 = *((_QWORD *)this + 10);
    if ((unint64_t)v6 >= v7)
    {
      v9 = (v6 - v5) / 88;
      v10 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v7 - (_QWORD)v5) >> 3);
      if (2 * v10 <= v9 + 1)
        v11 = v9 + 1;
      else
        v11 = 2 * v10;
      if (v10 >= 0x1745D1745D1745DLL)
        v12 = 0x2E8BA2E8BA2E8BALL;
      else
        v12 = v11;
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::internal::FixedSizedArray<void *>>>((uint64_t)this + 80, v12);
      v14 = &v13[88 * v9];
      v16 = &v13[88 * v15];
      *(_QWORD *)v14 = 0;
      v8 = v14 + 88;
      v18 = (char *)*((_QWORD *)this + 8);
      v17 = (char *)*((_QWORD *)this + 9);
      if (v17 != v18)
      {
        do
        {
          v19 = *(_OWORD *)(v17 - 88);
          *(_OWORD *)(v14 - 72) = *(_OWORD *)(v17 - 72);
          *(_OWORD *)(v14 - 88) = v19;
          v20 = *(_OWORD *)(v17 - 56);
          v21 = *(_OWORD *)(v17 - 40);
          v22 = *(_OWORD *)(v17 - 24);
          *((_QWORD *)v14 - 1) = *((_QWORD *)v17 - 1);
          *(_OWORD *)(v14 - 24) = v22;
          *(_OWORD *)(v14 - 40) = v21;
          *(_OWORD *)(v14 - 56) = v20;
          v14 -= 88;
          v17 -= 88;
        }
        while (v17 != v18);
        v17 = (char *)*((_QWORD *)this + 8);
      }
      *((_QWORD *)this + 8) = v14;
      *((_QWORD *)this + 9) = v8;
      *((_QWORD *)this + 10) = v16;
      if (v17)
        operator delete(v17);
    }
    else
    {
      *(_QWORD *)v6 = 0;
      v8 = v6 + 88;
    }
    *((_QWORD *)this + 9) = v8;
    v23 = (uint64_t *)*((_QWORD *)this + 8);
    v24 = *v23;
    if ((unint64_t)*v23 <= 9)
    {
      v25 = *(_QWORD *)(*((_QWORD *)this + 3) + 16);
      *v23 = v24 + 1;
      v23[v24 + 1] = v25;
    }
  }
  result = NAN;
  *(_OWORD *)((char *)this + 120) = xmmword_20B7F26B0;
  *(_OWORD *)((char *)this + 136) = xmmword_20B7F26B0;
  return result;
}

void zhtok::Lattice::clear(zhtok::Lattice *this)
{
  _QWORD *v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  char *v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _QWORD *v20;

  v2 = *(_QWORD **)this;
  *((_QWORD *)this + 1) = *(_QWORD *)this;
  v5 = *((_QWORD *)this + 2);
  v3 = (char *)this + 16;
  v4 = v5;
  if ((unint64_t)v2 >= v5)
  {
    v7 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v4 - (_QWORD)v2) >> 3);
    v8 = 2 * v7;
    if (2 * v7 <= 1)
      v8 = 1;
    if (v7 >= 0x1745D1745D1745DLL)
      v9 = 0x2E8BA2E8BA2E8BALL;
    else
      v9 = v8;
    v10 = std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::internal::FixedSizedArray<void *>>>((uint64_t)v3, v9);
    v12 = &v10[11 * v11];
    *v10 = 0;
    v6 = v10 + 11;
    v14 = *(char **)this;
    v13 = (char *)*((_QWORD *)this + 1);
    if (v13 != *(char **)this)
    {
      do
      {
        v15 = *(_OWORD *)(v13 - 88);
        *(_OWORD *)(v10 - 9) = *(_OWORD *)(v13 - 72);
        *(_OWORD *)(v10 - 11) = v15;
        v16 = *(_OWORD *)(v13 - 56);
        v17 = *(_OWORD *)(v13 - 40);
        v18 = *(_OWORD *)(v13 - 24);
        *(v10 - 1) = *((_QWORD *)v13 - 1);
        *(_OWORD *)(v10 - 3) = v18;
        *(_OWORD *)(v10 - 5) = v17;
        *(_OWORD *)(v10 - 7) = v16;
        v10 -= 11;
        v13 -= 88;
      }
      while (v13 != v14);
      v13 = *(char **)this;
    }
    *(_QWORD *)this = v10;
    *((_QWORD *)this + 1) = v6;
    *((_QWORD *)this + 2) = v12;
    if (v13)
      operator delete(v13);
  }
  else
  {
    *v2 = 0;
    v6 = v2 + 11;
  }
  *((_QWORD *)this + 1) = v6;
  v19 = *((_QWORD *)this + 3);
  if (v19)
  {
    v20 = *(_QWORD **)this;
    if (!**(_QWORD **)this)
    {
      *v20 = 1;
      v20[1] = v19;
    }
  }
}

__n128 zhtok::WordLatticeController::getBestSegmentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 *v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  __n128 *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  __n128 result;
  __n128 *v21;
  __n128 *v22;
  __n128 *v23;
  __n128 *v24;
  unint64_t n128_u64;
  BOOL v27;

  v4 = *(__n128 **)a2;
  *(_QWORD *)(a2 + 8) = *(_QWORD *)a2;
  v5 = *(uint64_t **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16) + 8);
  if (v5[10])
  {
    v6 = *v5;
    if (v6)
    {
      v9 = (_QWORD *)(v6 + 24);
      v10 = (_QWORD *)(a2 + 16);
      do
      {
        v11 = *v9;
        v12 = *(_QWORD *)(*v9 + 16);
        if (v12 && *(_DWORD *)v11 != 0x10000 && *(_DWORD *)v11 != 0x20000)
        {
          v13 = *(_QWORD *)(v11 + 8) + a4;
          if ((unint64_t)v4 >= *v10)
          {
            v14 = *(__n128 **)a2;
            v15 = ((uint64_t)v4 - *(_QWORD *)a2) >> 4;
            v16 = v15 + 1;
            if ((unint64_t)(v15 + 1) >> 60)
              std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]();
            v17 = *v10 - (_QWORD)v14;
            if (v17 >> 3 > v16)
              v16 = v17 >> 3;
            if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0)
              v18 = 0xFFFFFFFFFFFFFFFLL;
            else
              v18 = v16;
            if (v18)
            {
              v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CFRange>>((uint64_t)v10, v18);
              v14 = *(__n128 **)a2;
              v4 = *(__n128 **)(a2 + 8);
            }
            else
            {
              v19 = 0;
            }
            v21 = (__n128 *)&v19[16 * v15];
            v21->n128_u64[0] = v13;
            v21->n128_u64[1] = v12;
            v22 = v21;
            if (v4 != v14)
            {
              do
              {
                result = v4[-1];
                v22[-1] = result;
                --v22;
                --v4;
              }
              while (v4 != v14);
              v14 = *(__n128 **)a2;
            }
            v4 = v21 + 1;
            *(_QWORD *)a2 = v22;
            *(_QWORD *)(a2 + 8) = v21 + 1;
            *(_QWORD *)(a2 + 16) = &v19[16 * v18];
            if (v14)
              operator delete(v14);
          }
          else
          {
            v4->n128_u64[0] = v13;
            v4->n128_u64[1] = v12;
            ++v4;
          }
          *(_QWORD *)(a2 + 8) = v4;
        }
        v9 = (_QWORD *)v9[1];
      }
      while (v9);
      v23 = *(__n128 **)a2;
      v24 = v4 - 1;
      if (*(__n128 **)a2 != v4 && v24 > v23)
      {
        n128_u64 = (unint64_t)v23[1].n128_u64;
        do
        {
          result = *(__n128 *)(n128_u64 - 16);
          *(__n128 *)(n128_u64 - 16) = *v24;
          *v24-- = result;
          v27 = n128_u64 >= (unint64_t)v24;
          n128_u64 += 16;
        }
        while (!v27);
      }
    }
  }
  return result;
}

void zhtok::WordLatticeController::connectEOS(zhtok::WordLatticeController *this)
{
  const zhtok::ConnectionContext *v2;
  uint64_t v3;

  zhtok::LatticeWord::clearHypotheses(*(zhtok::LatticeWord **)(*(_QWORD *)(*((_QWORD *)this + 5) + 8) + 16));
  v3 = *(_QWORD *)(*((_QWORD *)this + 6) + 8) - **((_QWORD **)this + 6);
  if (v3)
    zhtok::WordLatticeController::connectToWordsEndingAtIndex(this, *(zhtok::LatticeWord **)(*(_QWORD *)(*((_QWORD *)this + 5) + 8) + 16), 0x2E8BA2E8BA2E8BA3 * (v3 >> 3) - 1, v2);
}

uint64_t zhtok::WordLatticeController::setDynamicLexicon(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (result != a2)
    {
      *(_QWORD *)(a1 + 32) = 0;
      (*(void (**)(uint64_t))(*(_QWORD *)result + 8))(result);
      result = *(_QWORD *)(a1 + 32);
      *(_QWORD *)(a1 + 32) = a2;
      if (result)
        return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 32) = a2;
  }
  return result;
}

void zhtok::WordLatticeController::updateLattice(zhtok::Lattice **this, zhtok::LatticeWord *a2)
{
  unint64_t v4;
  const zhtok::ConnectionContext *v5;

  v4 = *(_QWORD *)(*(_QWORD *)a2 + 8);
  zhtok::Lattice::insert(this[6], *(_QWORD *)(*(_QWORD *)a2 + 16) + v4, a2);
  zhtok::WordLatticeController::connectToWordsEndingAtIndex((zhtok::WordLatticeController *)this, a2, v4, v5);
}

void zhtok::Lattice::insert(zhtok::Lattice *this, unint64_t a2, zhtok::LatticeWord *a3)
{
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v5 = *(_QWORD *)this;
  v6 = (_QWORD *)*((_QWORD *)this + 1);
  v7 = 0x2E8BA2E8BA2E8BA3 * (((uint64_t)v6 - *(_QWORD *)this) >> 3);
  if (v7 <= a2)
  {
    v9 = (_QWORD *)((char *)this + 16);
    do
    {
      if ((unint64_t)v6 >= *v9)
      {
        if (v7 + 1 > 0x2E8BA2E8BA2E8BALL)
          std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]();
        v10 = 0x2E8BA2E8BA2E8BA3 * ((*v9 - v5) >> 3);
        v11 = 2 * v10;
        if (2 * v10 <= v7 + 1)
          v11 = v7 + 1;
        if (v10 >= 0x1745D1745D1745DLL)
          v12 = 0x2E8BA2E8BA2E8BALL;
        else
          v12 = v11;
        if (v12)
          v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::internal::FixedSizedArray<void *>>>((uint64_t)v9, v12);
        else
          v13 = 0;
        v14 = &v13[88 * v7];
        *(_QWORD *)v14 = 0;
        v6 = v14 + 88;
        v16 = *(char **)this;
        v15 = (char *)*((_QWORD *)this + 1);
        if (v15 != *(char **)this)
        {
          do
          {
            v17 = *(_OWORD *)(v15 - 88);
            *(_OWORD *)(v14 - 72) = *(_OWORD *)(v15 - 72);
            *(_OWORD *)(v14 - 88) = v17;
            v18 = *(_OWORD *)(v15 - 56);
            v19 = *(_OWORD *)(v15 - 40);
            v20 = *(_OWORD *)(v15 - 24);
            *((_QWORD *)v14 - 1) = *((_QWORD *)v15 - 1);
            *(_OWORD *)(v14 - 24) = v20;
            *(_OWORD *)(v14 - 40) = v19;
            *(_OWORD *)(v14 - 56) = v18;
            v14 -= 88;
            v15 -= 88;
          }
          while (v15 != v16);
          v15 = *(char **)this;
        }
        *(_QWORD *)this = v14;
        *((_QWORD *)this + 1) = v6;
        *((_QWORD *)this + 2) = &v13[88 * v12];
        if (v15)
          operator delete(v15);
      }
      else
      {
        *v6 = 0;
        *(_OWORD *)(v6 + 1) = v23;
        *(_OWORD *)(v6 + 9) = v27;
        *(_OWORD *)(v6 + 7) = v26;
        *(_OWORD *)(v6 + 5) = v25;
        *(_OWORD *)(v6 + 3) = v24;
        v6 += 11;
      }
      *((_QWORD *)this + 1) = v6;
      v5 = *(_QWORD *)this;
      v7 = 0x2E8BA2E8BA2E8BA3 * (((uint64_t)v6 - *(_QWORD *)this) >> 3);
    }
    while (v7 <= a2);
  }
  v21 = (uint64_t *)(v5 + 88 * a2);
  v22 = *v21;
  if ((unint64_t)*v21 <= 9)
  {
    *v21 = v22 + 1;
    *(_QWORD *)(v5 + 88 * a2 + 8 * v22 + 8) = a3;
  }
}

void zhtok::WordLatticeController::connectToWordsEndingAtIndex(zhtok::WordLatticeController *this, zhtok::LatticeWord *a2, unint64_t a3, const zhtok::ConnectionContext *a4)
{
  uint64_t v4;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  _QWORD *v14;
  double v15;
  _QWORD *v16;
  uint64_t v17;
  double v18;

  v4 = **((_QWORD **)this + 6);
  if (0x2E8BA2E8BA2E8BA3 * ((*(_QWORD *)(*((_QWORD *)this + 6) + 8) - v4) >> 3) > a3)
  {
    v6 = (unint64_t *)(v4 + 88 * a3);
    v7 = *v6;
    if (*v6)
    {
      v10 = 0;
      v11 = v4 + 88 * a3 + 8;
      v12 = 1.79769313e308;
      do
      {
        if (*v6 <= v10)
        {
          v13 = 0;
          if (!v10)
            goto LABEL_12;
        }
        else
        {
          v13 = *(_QWORD *)(v11 + 8 * v10);
          if (!v10)
            goto LABEL_12;
        }
        v14 = *(_QWORD **)(v13 + 8);
        if (v14[10])
          v15 = *(double *)(*v14 + 16);
        else
          v15 = 1.79769313e308;
        if (v15 <= v12)
        {
LABEL_12:
          if (!*(_BYTE *)(v13 + 16))
            zhtok::WordLatticeController::connectToWordsEndingAtIndex(this, (zhtok::LatticeWord *)v13, a3 - *(_QWORD *)(*(_QWORD *)v13 + 16));
          zhtok::WordLatticeController::connectToPreviousWord((void ***)this, (const zhtok::LatticeWord *)v13, a2, a4);
          v16 = (_QWORD *)*((_QWORD *)a2 + 1);
          v17 = v16[10];
          if (!v10 || (!v17 ? (v18 = 1.79769313e308) : (v18 = *(double *)(*v16 + 16)), v12 > v18))
          {
            if (v17)
              v12 = *(double *)(*v16 + 16);
            else
              v12 = 1.79769313e308;
          }
        }
        ++v10;
      }
      while (v7 != v10);
    }
  }
}

void zhtok::WordLatticeController::connectToPreviousWord(void ***this, const zhtok::LatticeWord *a2, zhtok::LatticeWord *a3, const zhtok::ConnectionContext *a4)
{
  _QWORD *v4;

  v4 = (_QWORD *)*((_QWORD *)a2 + 1);
  if (v4[10])
  {
    if (*v4)
    {
      zhtok::LatticeSessionData::logStatistics(*(zhtok::LatticeSessionData **)a2);
      zhtok::LatticeWord::connectPreviousWord(a3, (const zhtok::HypothesisSet **)a2, this[7]);
    }
  }
}

void zhtok::WordLatticeController::addWord(zhtok::WordLatticeController *this, void *a2, uint64_t a3)
{
  int WordID;
  int v7;
  uint64_t TraversedLength;
  char *LatticeWord;

  WordID = zhtok::TokenizerLexicon::getWordID(*((zhtok::TokenizerLexicon **)this + 3), a2);
  if (WordID)
  {
    v7 = WordID;
    TraversedLength = zhtok::TokenizerLexicon::getTraversedLength(*((zhtok::TokenizerLexicon **)this + 3), a2);
    LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(*((char ***)this + 5), 2, v7, a3 - TraversedLength, TraversedLength);
    zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
  }
}

void zhtok::WordLatticeController::addUNKWord(char ***this, CFRange a2)
{
  char *LatticeWord;

  LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(this[5], 2, 0, a2.location, a2.length);
  zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
}

void zhtok::WordLatticeController::addSpace(char ***this, CFRange a2)
{
  char *LatticeWord;

  LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(this[5], 0x10000, 0, a2.location, a2.length);
  zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
}

void zhtok::WordLatticeController::addNewline(char ***this, CFRange a2)
{
  char *LatticeWord;

  LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(this[5], 0x20000, 0, a2.location, a2.length);
  zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
}

void zhtok::WordLatticeController::addNonChineseWord(zhtok::WordLatticeController *this, const unsigned __int16 *a2, CFRange a3)
{
  CFIndex length;
  CFIndex location;
  int WordID;
  const unsigned __int16 *v8;
  uint64_t v9;
  CFIndex i;
  uint64_t v11;
  unsigned int v12;
  int v13;
  void *v14;
  char *LatticeWord;

  length = a3.length;
  location = a3.location;
  if (*((_QWORD *)this + 18))
  {
LABEL_2:
    WordID = 0;
  }
  else
  {
    if (a3.location < (unint64_t)(a3.location + a3.length))
    {
      v8 = &a2[a3.location];
      v9 = MEMORY[0x24BDAC740];
      for (i = a3.length; i; --i)
      {
        v12 = *v8++;
        v11 = v12;
        if (v12 > 0xFF)
          goto LABEL_8;
        if ((*(_DWORD *)(v9 + 4 * v11 + 60) & 0x400) != 0)
        {
          WordID = 501;
          goto LABEL_15;
        }
        if (v11 <= 0x7F)
          v13 = *(_DWORD *)(v9 + 4 * v11 + 60) & 0x100;
        else
LABEL_8:
          v13 = __maskrune(v11, 0x100uLL);
        if (!v13)
          goto LABEL_2;
      }
    }
    v14 = (void *)zhtok::TokenizerLexicon::cursorByAdvancingWithCharacters(*((zhtok::TokenizerLexicon **)this + 3), *(void **)(*((_QWORD *)this + 3) + 16), &a2[location]);
    if (!zhtok::TokenizerLexicon::cursorHasEntry(*((zhtok::TokenizerLexicon **)this + 3), v14)
      || (WordID = zhtok::TokenizerLexicon::getWordID(*((zhtok::TokenizerLexicon **)this + 3), v14)) == 0)
    {
      WordID = 502;
    }
  }
LABEL_15:
  LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(*((char ***)this + 5), 2, WordID, location, length);
  zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
}

uint64_t zhtok::WordLatticeController::addDynamicWord(zhtok::WordLatticeController *this, void *a2, const unsigned __int16 *a3, const CFRange *a4)
{
  uint64_t HasEntry;
  int WordID;
  char *LatticeWord;

  HasEntry = zhtok::TokenizerLexicon::cursorHasEntry(*((zhtok::TokenizerLexicon **)this + 4), a2);
  if ((_DWORD)HasEntry)
  {
    WordID = zhtok::TokenizerLexicon::getWordID(*((zhtok::TokenizerLexicon **)this + 4), a2);
    LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(*((char ***)this + 5), 3, WordID, a4->location, a4->length);
    zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
  }
  return HasEntry;
}

uint64_t zhtok::WordLatticeController::updateNonChineseTokenRange(zhtok::WordLatticeController *this, const unsigned __int16 *a2, CFRange a3, int a4, int a5)
{
  CFIndex length;
  CFIndex location;
  uint64_t result;
  CFIndex v9;
  uint64_t v11;
  CFIndex v12;
  CFIndex v13;
  uint64_t v14;

  length = a3.length;
  location = a3.location;
  result = a2[a3.location];
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 18) = 0;
  v9 = *((_QWORD *)this + 15);
  if (a4)
  {
    if (v9 == -1)
    {
      *((_QWORD *)this + 15) = a3.location;
      v9 = a3.location;
    }
    if (v9 != -1 && a5 != 0)
    {
      v11 = a3.location - v9;
      if (a3.location == v9)
        v11 = 1;
      *((_QWORD *)this + 16) = v11;
    }
    if (*((_BYTE *)this + 152))
    {
      if ((a5 & 1) == 0)
        *((_QWORD *)this + 16) = a3.location + a3.length - v9;
    }
LABEL_24:
    v14 = *((_QWORD *)this + 17);
    if (v14 == -1)
      return result;
    v13 = location - v14;
    goto LABEL_26;
  }
  if (v9 != -1)
    *((_QWORD *)this + 16) = a3.location - v9;
  if (a3.length == 2)
    result = a2[a3.location + 1] + ((_DWORD)result << 10) - 56613888;
  if (result >> 1 != 4102)
  {
    result = LMLanguageModelIsAppleColorEmojiCharacter();
    if (!(_DWORD)result)
      goto LABEL_24;
  }
  v12 = *((_QWORD *)this + 17);
  if (v12 == -1)
  {
    *((_QWORD *)this + 17) = location;
    v12 = location;
  }
  if (*((_BYTE *)this + 152))
  {
    v13 = location + length - v12;
LABEL_26:
    *((_QWORD *)this + 18) = v13;
  }
  return result;
}

uint64_t zhtok::WordLatticeController::addLatinWords(zhtok::WordLatticeController *this, const unsigned __int16 *a2, CFRange a3, int a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char *LatticeWord;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;

  v4 = *((_QWORD *)this + 16);
  if (v4 < 1)
    return 0;
  v6 = *((_QWORD *)this + 8);
  if (*((_QWORD *)this + 9) == v6)
    return 0;
  v7 = *((_QWORD *)this + 15);
  if (v7 == -1)
  {
    result = 0;
    *((_QWORD *)this + 16) = 0;
  }
  else
  {
    v9 = v7 + v4;
    v10 = (uint64_t *)(v6 + 88 * (v7 + v4));
    v11 = *v10;
    if ((unint64_t)*v10 <= 9)
    {
      v12 = *(_QWORD *)(*((_QWORD *)this + 3) + 16);
      *v10 = v11 + 1;
      *(_QWORD *)(v6 + 88 * v9 + 8 * v11 + 8) = v12;
    }
    if (a4 && v7 == a3.location)
    {
      LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(*((char ***)this + 5), 0x10000, 0, a3.location, a3.length);
      zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
    }
    else
    {
      zhtok::WordLatticeController::addNonChineseWord(this, a2, *(CFRange *)((char *)this + 120));
    }
    v15 = zhtok::TokenizerLexicon::cursorByAdvancingWithCharacters(*((zhtok::TokenizerLexicon **)this + 3), *(void **)(*((_QWORD *)this + 3) + 16), &a2[*((_QWORD *)this + 15)]);
    if (v15)
    {
      v16 = *((_QWORD *)this + 8);
      v17 = (uint64_t *)(v16 + 88 * v9);
      v18 = *v17;
      if ((unint64_t)*v17 <= 9)
      {
        *v17 = v18 + 1;
        *(_QWORD *)(v16 + 88 * v9 + 8 * v18 + 8) = v15;
      }
    }
    *((_QWORD *)this + 15) = -1;
    return 1;
  }
  return result;
}

uint64_t zhtok::WordLatticeController::addEmojiWords(zhtok::WordLatticeController *this, const unsigned __int16 *a2)
{
  uint64_t result;

  if (*((uint64_t *)this + 18) < 1 || *((_QWORD *)this + 9) == *((_QWORD *)this + 8))
    return 0;
  if (*((_QWORD *)this + 17) == -1)
  {
    result = 0;
    *((_QWORD *)this + 18) = 0;
  }
  else
  {
    if ((zhtok::WordLatticeController::breakEmojiWords(this, a2) & 1) == 0)
      zhtok::WordLatticeController::addNonChineseWord(this, a2, *(CFRange *)((char *)this + 136));
    *((_QWORD *)this + 17) = -1;
    return 1;
  }
  return result;
}

uint64_t zhtok::WordLatticeController::breakEmojiWords(zhtok::WordLatticeController *this, const unsigned __int16 *a2)
{
  int64_t v2;
  uint64_t result;
  uint64_t v6;
  int v7;
  int v8;
  CFRange v9;

  v2 = *((_QWORD *)this + 18);
  if (v2 < 2)
    return 0;
  result = *((_QWORD *)this + 22);
  if (result)
  {
    result = zhtok::WordBreaker::set((zhtok::WordBreaker *)result, &a2[*((_QWORD *)this + 17)], v2);
    if ((_DWORD)result)
    {
      v6 = *((_QWORD *)this + 22);
      v7 = *(_DWORD *)(v6 + 8);
      if (v7 != -1)
      {
        v8 = *(_DWORD *)(v6 + 8);
        do
        {
          if (v7 > v8)
          {
            v9.location = *((_QWORD *)this + 17) + v8;
            v9.length = v7 - v8;
            zhtok::WordLatticeController::addNonChineseWord(this, a2, v9);
            v6 = *((_QWORD *)this + 22);
            v8 = v7;
          }
          v7 = ubrk_next();
          *(_DWORD *)(v6 + 8) = v7;
          v6 = *((_QWORD *)this + 22);
        }
        while (*(_DWORD *)(v6 + 8) != -1);
      }
      return 1;
    }
  }
  return result;
}

BOOL zhtok::WordLatticeController::addCustomWordIfFound(zhtok::WordLatticeController *this, const unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const unsigned __int16 *v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  const unsigned __int16 *v12;
  char *LatticeWord;

  v3 = *((_QWORD *)this + 24);
  v4 = (a3 - v3) & ~((a3 - v3) >> 63);
  if (v4 >= a3)
    return 0;
  v7 = *((_QWORD *)this + 23);
  v8 = &a2[v4];
  if (a3 >= v3)
    v9 = v3;
  else
    v9 = a3;
  if (((*(uint64_t (**)(uint64_t, const unsigned __int16 *, uint64_t))(v7 + 16))(v7, &a2[v4], v9) & 1) == 0)
  {
    v11 = -v4;
    v12 = v8 + 1;
    while (a3 + v11 != 1)
    {
      --v11;
      ++v12;
      if ((*(unsigned int (**)(void))(*((_QWORD *)this + 23) + 16))())
      {
        v4 = -v11;
        v10 = -v11 < a3;
        v9 = a3 + v11;
        goto LABEL_11;
      }
    }
    return 0;
  }
  v10 = 1;
LABEL_11:
  LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(*((char ***)this + 5), 4, 0, v4, v9);
  zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
  return v10;
}

void zhtok::WordLatticeController::addComposedCharacteracterInRange(zhtok::WordLatticeController *this, const unsigned __int16 *a2, CFRange a3)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void **v7;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  const __CFCharacterSet *v22;
  int v23;
  _BOOL4 v25;
  const __CFCharacterSet *v26;
  _BOOL4 v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  BOOL v31;
  const unsigned __int16 *v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  char v38;
  char *v39;
  char *LatticeWord;
  unsigned __int16 *v41;
  UniChar theChar[2];
  CFIndex length;
  uint64_t location;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CFRange v51;
  CFRange v52;

  length = a3.length;
  v4 = a3.location + a3.length;
  if (*((_QWORD *)this + 14) == a3.location + a3.length)
    *((_BYTE *)this + 152) = 1;
  location = a3.location;
  v41 = (unsigned __int16 *)&a2[a3.location];
  *(_DWORD *)theChar = *v41;
  v5 = *((_QWORD *)this + 8);
  v6 = (_QWORD *)*((_QWORD *)this + 9);
  v7 = (void **)((char *)this + 64);
  v8 = 0x2E8BA2E8BA2E8BA3 * (((uint64_t)v6 - v5) >> 3);
  if (v8 <= v4)
  {
    v9 = (_QWORD *)((char *)this + 80);
    do
    {
      if ((unint64_t)v6 >= *v9)
      {
        if (v8 + 1 > 0x2E8BA2E8BA2E8BALL)
          std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]();
        v10 = 0x2E8BA2E8BA2E8BA3 * ((*v9 - v5) >> 3);
        v11 = 2 * v10;
        if (2 * v10 <= v8 + 1)
          v11 = v8 + 1;
        if (v10 >= 0x1745D1745D1745DLL)
          v12 = 0x2E8BA2E8BA2E8BALL;
        else
          v12 = v11;
        if (v12)
          v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::internal::FixedSizedArray<void *>>>((uint64_t)this + 80, v12);
        else
          v13 = 0;
        v14 = &v13[88 * v8];
        *(_QWORD *)v14 = 0;
        v6 = v14 + 88;
        v16 = (char *)*((_QWORD *)this + 8);
        v15 = (char *)*((_QWORD *)this + 9);
        if (v15 != v16)
        {
          do
          {
            v17 = *(_OWORD *)(v15 - 88);
            *(_OWORD *)(v14 - 72) = *(_OWORD *)(v15 - 72);
            *(_OWORD *)(v14 - 88) = v17;
            v18 = *(_OWORD *)(v15 - 56);
            v19 = *(_OWORD *)(v15 - 40);
            v20 = *(_OWORD *)(v15 - 24);
            *((_QWORD *)v14 - 1) = *((_QWORD *)v15 - 1);
            *(_OWORD *)(v14 - 24) = v20;
            *(_OWORD *)(v14 - 40) = v19;
            *(_OWORD *)(v14 - 56) = v18;
            v14 -= 88;
            v15 -= 88;
          }
          while (v15 != v16);
          v15 = (char *)*v7;
        }
        *((_QWORD *)this + 8) = v14;
        *((_QWORD *)this + 9) = v6;
        *((_QWORD *)this + 10) = &v13[88 * v12];
        if (v15)
          operator delete(v15);
      }
      else
      {
        *v6 = 0;
        *(_OWORD *)(v6 + 1) = v46;
        *(_OWORD *)(v6 + 9) = v50;
        *(_OWORD *)(v6 + 7) = v49;
        *(_OWORD *)(v6 + 5) = v48;
        *(_OWORD *)(v6 + 3) = v47;
        v6 += 11;
      }
      *((_QWORD *)this + 9) = v6;
      v5 = *((_QWORD *)this + 8);
      v8 = 0x2E8BA2E8BA2E8BA3 * (((uint64_t)v6 - v5) >> 3);
    }
    while (v8 <= v4);
  }
  v21 = location;
  if (*((_QWORD *)this + 23) && zhtok::WordLatticeController::addCustomWordIfFound(this, a2, v4))
    return;
  v22 = (const __CFCharacterSet *)*((_QWORD *)this + 20);
  if (v22 && CFCharacterSetIsCharacterMember(v22, theChar[0]))
  {
    v23 = 0x20000;
LABEL_60:
    LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(*((char ***)this + 5), v23, 0, v21, length);
    zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
    return;
  }
  v25 = length == 1 && (*(_DWORD *)theChar - 1) < 0xFF;
  v26 = (const __CFCharacterSet *)*((_QWORD *)this + 21);
  if (v26)
    v27 = CFCharacterSetIsCharacterMember(v26, theChar[0]) != 0;
  else
    v27 = 0;
  v51.location = location;
  v51.length = length;
  zhtok::WordLatticeController::updateNonChineseTokenRange(this, a2, v51, v25, v27);
  v52.location = location;
  v52.length = length;
  v28 = zhtok::WordLatticeController::addLatinWords(this, a2, v52, v27);
  v29 = *((_QWORD *)this + 8);
  v30 = 0x2E8BA2E8BA2E8BA3 * ((*((_QWORD *)this + 9) - v29) >> 3) - 1;
  if (v25)
  {
    v31 = v30 < 2 || *(_QWORD *)(v29 + 8 * ((*((_QWORD *)this + 9) - v29) >> 3) - 176) == 0;
    v32 = v41;
    if ((zhtok::WordLatticeController::addEmojiWords(this, a2) & 1) != 0)
      goto LABEL_44;
    goto LABEL_43;
  }
  v32 = v41;
  if ((zhtok::WordLatticeController::addEmojiWords(this, a2) & 1) == 0)
  {
    v31 = 0;
LABEL_43:
    if (*((_QWORD *)this + 17) != -1)
      return;
LABEL_44:
    if (v31)
      return;
  }
  v33 = (unint64_t *)((char *)*v7 + 88 * location);
  v34 = *v33;
  if (*v33)
  {
    v35 = 0;
    v36 = (uint64_t)*v7 + 88 * location + 8;
    do
    {
      if (*v33 <= v35)
        v37 = 0;
      else
        v37 = *(void **)(v36 + 8 * v35);
      zhtok::WordLatticeController::addWord((zhtok::TokenizerLexicon **)this, v37, v32, length, v30);
      ++v35;
    }
    while (v34 != v35);
  }
  v21 = location;
  if (location < 1)
    v38 = 1;
  else
    v38 = v28;
  if ((v38 & 1) == 0)
    zhtok::WordLatticeController::addWord((zhtok::TokenizerLexicon **)this, *(void **)(*((_QWORD *)this + 3) + 16), v32, length, v30);
  if (v27)
  {
    v39 = zhtok::LatticeSessionData::makeLatticeWord(*((char ***)this + 5), 0x10000, 0, location, length);
    zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)v39);
  }
  if (0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*(_QWORD *)(*((_QWORD *)this + 6) + 8) - **((_QWORD **)this + 6)) >> 3) < (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((_QWORD *)this + 9) - *((_QWORD *)this + 8)) >> 3)))
  {
    v23 = 2;
    goto LABEL_60;
  }
}

void zhtok::WordLatticeController::addWord(zhtok::TokenizerLexicon **this, void *a2, const unsigned __int16 *a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  zhtok::TokenizerLexicon *v8;
  uint64_t *v9;
  uint64_t v10;

  v7 = (void *)zhtok::TokenizerLexicon::cursorByAdvancingWithCharacters(this[3], a2, a3);
  if (v7)
  {
    v8 = this[8];
    v9 = (uint64_t *)((char *)v8 + 88 * a5);
    v10 = *v9;
    if ((unint64_t)*v9 <= 9)
    {
      *v9 = v10 + 1;
      *((_QWORD *)v8 + 11 * a5 + v10 + 1) = v7;
      zhtok::WordLatticeController::addWord((zhtok::WordLatticeController *)this, v7, a5);
    }
  }
}

uint64_t zhtok::WordLatticeController::rewriteLatticeWithDynamicWords(zhtok::WordLatticeController *this, const unsigned __int16 *a2)
{
  unint64_t v4;
  void *v5;
  CFIndex i;
  void *v7;
  const unsigned __int16 *v8;
  CFRange v10;

  if (!a2)
    return 0;
  if (!*((_QWORD *)this + 14) || !*((_QWORD *)this + 4))
    return 0;
  v4 = 0;
  do
  {
    v5 = *(void **)(*((_QWORD *)this + 4) + 16);
    for (i = 3; i != 8; ++i)
    {
      if (v4 + i - 1 >= *((_QWORD *)this + 14))
        break;
      v10.location = v4;
      v10.length = i;
      v7 = (void *)zhtok::TokenizerLexicon::cursorByAdvancingWithCharacters(*((zhtok::TokenizerLexicon **)this + 4), v5, &a2[v4]);
      if (!v7)
        break;
      zhtok::WordLatticeController::addDynamicWord(this, v7, v8, &v10);
    }
    ++v4;
  }
  while (v4 < *((_QWORD *)this + 14));
  return 1;
}

uint64_t zhtok::WordLatticeController::setCustomWordCheckBlock(uint64_t a1, uint64_t a2, void *aBlock)
{
  const void *v5;

  *(_QWORD *)(a1 + 192) = a2;
  v5 = *(const void **)(a1 + 184);
  if (v5)
  {
    _Block_release(v5);
    *(_QWORD *)(a1 + 184) = 0;
  }
  if (aBlock)
    *(_QWORD *)(a1 + 184) = _Block_copy(aBlock);
  return 1;
}

zhtok::LatticeSessionData *std::unique_ptr<zhtok::LatticeSessionData>::reset[abi:ne180100](zhtok::LatticeSessionData **a1, zhtok::LatticeSessionData *a2)
{
  zhtok::LatticeSessionData *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    zhtok::LatticeSessionData::~LatticeSessionData(result);
    JUMPOUT(0x20BD387FCLL);
  }
  return result;
}

void std::default_delete<zhtok::Lattice>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  if (a2)
  {
    v2 = *(void **)a2;
    if (*(_QWORD *)a2)
    {
      *(_QWORD *)(a2 + 8) = v2;
      operator delete(v2);
    }
    JUMPOUT(0x20BD387FCLL);
  }
}

zhtok::WordBreaker *std::unique_ptr<zhtok::WordBreaker>::reset[abi:ne180100](zhtok::WordBreaker **a1, zhtok::WordBreaker *a2)
{
  zhtok::WordBreaker *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    zhtok::WordBreaker::~WordBreaker(result);
    JUMPOUT(0x20BD387FCLL);
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CFRange>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

_QWORD *zhtok::TokenizerLexicon::TokenizerLexicon(_QWORD *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = &off_24C456240;
  return this;
}

_QWORD *zhtok::TokenizerLexicon::TokenizerLexicon(_QWORD *a1, int a2)
{
  __CFDictionary *Mutable;
  CFLocaleRef LocaleForLanguage;
  uint64_t v6;

  *a1 = &off_24C456240;
  if (a2 == -1)
  {
    a1[1] = 0;
    a1[2] = 0;
  }
  else
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    LocaleForLanguage = createLocaleForLanguage(a2);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE5EEB8], LocaleForLanguage);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE5EEC8], (const void *)*MEMORY[0x24BDBD270]);
    v6 = LMLexiconCreate();
    CFRelease(LocaleForLanguage);
    CFRelease(Mutable);
    a1[1] = v6;
    a1[2] = 0;
    if (v6)
      a1[2] = LMLexiconGetRootCursor();
  }
  return a1;
}

void zhtok::TokenizerLexicon::~TokenizerLexicon(zhtok::TokenizerLexicon *this)
{
  *(_QWORD *)this = &off_24C456240;
  if (*((_QWORD *)this + 1))
    LMLexiconRelease();
}

{
  zhtok::TokenizerLexicon::~TokenizerLexicon(this);
  JUMPOUT(0x20BD387FCLL);
}

uint64_t zhtok::TokenizerLexicon::reset(zhtok::TokenizerLexicon *this)
{
  uint64_t result;

  result = *((_QWORD *)this + 1);
  if (result)
  {
    LMLexiconResetCursors();
    result = LMLexiconGetRootCursor();
    *((_QWORD *)this + 2) = result;
  }
  return result;
}

uint64_t zhtok::TokenizerLexicon::getTraversedLength(zhtok::TokenizerLexicon *this, void *a2)
{
  return LMLexiconCursorTraversedLength();
}

uint64_t zhtok::TokenizerLexicon::cursorHasEntry(zhtok::TokenizerLexicon *this, void *a2)
{
  return LMLexiconCursorHasEntries();
}

uint64_t zhtok::TokenizerLexicon::getWordID(zhtok::TokenizerLexicon *this, void *a2)
{
  return LMLexiconCursorFirstTokenID();
}

uint64_t zhtok::TokenizerLexicon::cursorByAdvancingWithCharacters(zhtok::TokenizerLexicon *this, void *a2, const unsigned __int16 *a3)
{
  return LMLexiconGetCursorByAdvancingWithCharacters();
}

uint64_t zhtok::TokenizerLexicon::setLexicon(zhtok::TokenizerLexicon *this, void *a2)
{
  uint64_t result;

  if (*((_QWORD *)this + 1))
  {
    LMLexiconResetCursors();
    LMLexiconRelease();
  }
  *((_QWORD *)this + 1) = a2;
  result = LMLexiconGetRootCursor();
  *((_QWORD *)this + 2) = result;
  return result;
}

_QWORD *zhtok::LatticeSessionData::Sentinel::createBOS(zhtok::LatticeSessionData::Sentinel *this)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (_QWORD *)operator new();
  v2 = (_QWORD *)operator new();
  *v1 = v2;
  *v2 = 0x100000000;
  v2[1] = 0;
  v2[2] = 0;
  v3 = operator new();
  v1[1] = v3;
  v4 = operator new();
  v1[2] = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = v3;
  *(_BYTE *)(v4 + 16) = 1;
  return v1;
}

_QWORD *zhtok::LatticeSessionData::Sentinel::createEOS(zhtok::LatticeSessionData::Sentinel *this)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (_QWORD *)operator new();
  v2 = (_QWORD *)operator new();
  *v1 = v2;
  *v2 = 0x200000001;
  v2[1] = 0;
  v2[2] = 0;
  v3 = operator new();
  v1[1] = v3;
  v4 = operator new();
  v1[2] = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = v3;
  *(_BYTE *)(v4 + 16) = 1;
  return v1;
}

zhtok::LatticeSessionData *zhtok::LatticeSessionData::LatticeSessionData(zhtok::LatticeSessionData *this)
{
  zhtok::LatticeSessionData::Sentinel *BOS;

  BOS = (zhtok::LatticeSessionData::Sentinel *)zhtok::LatticeSessionData::Sentinel::createBOS(this);
  *(_QWORD *)this = BOS;
  *((_QWORD *)this + 1) = zhtok::LatticeSessionData::Sentinel::createEOS(BOS);
  zhtok::ObjectPool<zhtok::Hypothesis>::ObjectPool((_QWORD *)this + 2, 256);
  zhtok::ObjectPool<zhtok::Word>::ObjectPool((_QWORD *)this + 9, 256);
  zhtok::ObjectPool<zhtok::LatticeWord>::ObjectPool((_QWORD *)this + 16, 256);
  zhtok::ObjectPool<zhtok::HypothesisSet>::ObjectPool((_QWORD *)this + 23, 256);
  zhtok::LatticeSessionData::resetSentinels(this);
  return this;
}

void sub_20B7F1094(_Unwind_Exception *a1)
{
  uint64_t **v1;
  uint64_t **v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v9;
  uint64_t *v10;

  v7 = v4;
  zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool(v7);
  zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool(v6);
  zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool(v5);
  zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool(v3);
  v9 = *v2;
  *v2 = 0;
  if (v9)
    std::default_delete<zhtok::LatticeSessionData::Sentinel>::operator()[abi:ne180100]((uint64_t)v2, v9);
  v10 = *v1;
  *v1 = 0;
  if (v10)
    std::default_delete<zhtok::LatticeSessionData::Sentinel>::operator()[abi:ne180100]((uint64_t)v1, v10);
  _Unwind_Resume(a1);
}

uint64_t zhtok::LatticeSessionData::resetSentinels(zhtok::LatticeSessionData *this)
{
  uint64_t v2;
  _QWORD v4[5];

  zhtok::LatticeWord::clearHypotheses(*(zhtok::LatticeWord **)(*(_QWORD *)this + 16));
  zhtok::LatticeWord::clearHypotheses(*(zhtok::LatticeWord **)(*((_QWORD *)this + 1) + 16));
  v2 = *(_QWORD *)(*(_QWORD *)this + 16);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = ___ZN5zhtok18LatticeSessionData14resetSentinelsEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_0;
  v4[4] = this;
  return zhtok::LatticeWord::initializeBeginSentinelHypothesis(v2, (uint64_t)v4);
}

void zhtok::LatticeSessionData::~LatticeSessionData(uint64_t **this)
{
  uint64_t *v2;
  uint64_t *v3;

  zhtok::LatticeSessionData::reset((zhtok::LatticeSessionData *)this);
  zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool((uint64_t)(this + 23));
  zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool((uint64_t)(this + 16));
  zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool((uint64_t)(this + 9));
  zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool((uint64_t)(this + 2));
  v2 = this[1];
  this[1] = 0;
  if (v2)
    std::default_delete<zhtok::LatticeSessionData::Sentinel>::operator()[abi:ne180100]((uint64_t)(this + 1), v2);
  v3 = *this;
  *this = 0;
  if (v3)
    std::default_delete<zhtok::LatticeSessionData::Sentinel>::operator()[abi:ne180100]((uint64_t)this, v3);
}

uint64_t zhtok::LatticeSessionData::reset(zhtok::LatticeSessionData *this)
{
  uint64_t Logger;

  Logger = zhtok::Logger::getLogger(this);
  zhtok::Logger::log(Logger, 8u, "===RESET===\n");
  zhtok::ObjectPool<zhtok::Hypothesis>::reset((uint64_t)this + 16);
  zhtok::ObjectPool<zhtok::Hypothesis>::reset((uint64_t)this + 72);
  zhtok::ObjectPool<zhtok::Hypothesis>::reset((uint64_t)this + 128);
  zhtok::ObjectPool<zhtok::Hypothesis>::reset((uint64_t)this + 184);
  return zhtok::LatticeSessionData::resetSentinels(this);
}

void zhtok::ObjectPool<zhtok::Hypothesis>::reset(uint64_t a1)
{
  unint64_t v2;
  void **v3;

  v3 = *(void ***)a1;
  v2 = *(_QWORD *)(a1 + 8);
  if (*(_QWORD *)a1 < v2)
  {
    do
    {
      if (*v3)
      {
        free(*v3);
        v2 = *(_QWORD *)(a1 + 8);
      }
      ++v3;
    }
    while ((unint64_t)v3 < v2);
    v3 = *(void ***)a1;
  }
  *(_QWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
}

char *zhtok::LatticeSessionData::makeHypothesis(char **this, const zhtok::Word *a2, double a3, const zhtok::Hypothesis *a4)
{
  char *v7;

  v7 = zhtok::ObjectPool<zhtok::Hypothesis>::alloc(this + 2);
  zhtok::Hypothesis::init(v7, (uint64_t)a2, (uint64_t)a4, a3);
  return v7;
}

double zhtok::LatticeSessionData::makeHypothesisSet(char **this)
{
  char *v1;
  double result;

  v1 = zhtok::ObjectPool<zhtok::HypothesisSet>::alloc(this + 23);
  result = 0.0;
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 3) = 0u;
  *((_OWORD *)v1 + 4) = 0u;
  *((_OWORD *)v1 + 5) = 0u;
  return result;
}

char *zhtok::ObjectPool<zhtok::HypothesisSet>::alloc(char **a1)
{
  char *v2;
  char *v3;
  char *v4;
  size_t v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v2 = a1[3];
  if (v2)
  {
    v4 = a1[4];
    v3 = a1[5];
    v5 = v4 - v2;
    if ((char *)(0xAAAAAAAAAAAAAAABLL * ((v4 - v2) >> 5)) != v3)
      goto LABEL_22;
  }
  else
  {
    v5 = 96 * (_QWORD)a1[5];
  }
  v4 = (char *)malloc_type_malloc(v5, 0x1060040C2C571E4uLL);
  v6 = (unint64_t)a1[2];
  v7 = a1[1];
  if ((unint64_t)v7 >= v6)
  {
    v9 = (v7 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]();
    v10 = v6 - (_QWORD)*a1;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::HypothesisSet *>>((uint64_t)(a1 + 2), v12);
    else
      v13 = 0;
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(_QWORD *)v14 = v4;
    v8 = v14 + 8;
    v17 = *a1;
    v16 = a1[1];
    if (v16 != *a1)
    {
      do
      {
        v18 = *((_QWORD *)v16 - 1);
        v16 -= 8;
        *((_QWORD *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      v16 = *a1;
    }
    *a1 = v14;
    a1[1] = v8;
    a1[2] = v15;
    if (v16)
      operator delete(v16);
  }
  else
  {
    *(_QWORD *)v7 = v4;
    v8 = v7 + 8;
  }
  a1[1] = v8;
  a1[3] = v4;
LABEL_22:
  ++*((_DWORD *)a1 + 12);
  a1[4] = v4 + 96;
  return v4;
}

char *zhtok::ObjectPool<zhtok::Hypothesis>::alloc(char **a1)
{
  char *v2;
  char *v3;
  char *v4;
  size_t v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v2 = a1[3];
  if (v2)
  {
    v4 = a1[4];
    v3 = a1[5];
    v5 = v4 - v2;
    if ((char *)(0xCCCCCCCCCCCCCCCDLL * ((v4 - v2) >> 3)) != v3)
      goto LABEL_22;
  }
  else
  {
    v5 = 40 * (_QWORD)a1[5];
  }
  v4 = (char *)malloc_type_malloc(v5, 0x10600404FD43036uLL);
  v6 = (unint64_t)a1[2];
  v7 = a1[1];
  if ((unint64_t)v7 >= v6)
  {
    v9 = (v7 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]();
    v10 = v6 - (_QWORD)*a1;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::HypothesisSet *>>((uint64_t)(a1 + 2), v12);
    else
      v13 = 0;
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(_QWORD *)v14 = v4;
    v8 = v14 + 8;
    v17 = *a1;
    v16 = a1[1];
    if (v16 != *a1)
    {
      do
      {
        v18 = *((_QWORD *)v16 - 1);
        v16 -= 8;
        *((_QWORD *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      v16 = *a1;
    }
    *a1 = v14;
    a1[1] = v8;
    a1[2] = v15;
    if (v16)
      operator delete(v16);
  }
  else
  {
    *(_QWORD *)v7 = v4;
    v8 = v7 + 8;
  }
  a1[1] = v8;
  a1[3] = v4;
LABEL_22:
  ++*((_DWORD *)a1 + 12);
  a1[4] = v4 + 40;
  return v4;
}

char *zhtok::LatticeSessionData::makeWord(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5)
{
  char *result;

  result = zhtok::ObjectPool<zhtok::Word>::alloc((char **)(a1 + 72));
  *(_DWORD *)result = a2;
  *((_DWORD *)result + 1) = a3;
  *((_QWORD *)result + 1) = a4;
  *((_QWORD *)result + 2) = a5;
  return result;
}

char *zhtok::ObjectPool<zhtok::Word>::alloc(char **a1)
{
  char *v2;
  char *v3;
  char *v4;
  size_t v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v2 = a1[3];
  if (v2)
  {
    v4 = a1[4];
    v3 = a1[5];
    v5 = v4 - v2;
    if ((char *)(0xAAAAAAAAAAAAAAABLL * ((v4 - v2) >> 3)) != v3)
      goto LABEL_22;
  }
  else
  {
    v5 = 24 * (_QWORD)a1[5];
  }
  v4 = (char *)malloc_type_malloc(v5, 0x1000040504FFAC1uLL);
  v6 = (unint64_t)a1[2];
  v7 = a1[1];
  if ((unint64_t)v7 >= v6)
  {
    v9 = (v7 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]();
    v10 = v6 - (_QWORD)*a1;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::HypothesisSet *>>((uint64_t)(a1 + 2), v12);
    else
      v13 = 0;
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(_QWORD *)v14 = v4;
    v8 = v14 + 8;
    v17 = *a1;
    v16 = a1[1];
    if (v16 != *a1)
    {
      do
      {
        v18 = *((_QWORD *)v16 - 1);
        v16 -= 8;
        *((_QWORD *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      v16 = *a1;
    }
    *a1 = v14;
    a1[1] = v8;
    a1[2] = v15;
    if (v16)
      operator delete(v16);
  }
  else
  {
    *(_QWORD *)v7 = v4;
    v8 = v7 + 8;
  }
  a1[1] = v8;
  a1[3] = v4;
LABEL_22:
  ++*((_DWORD *)a1 + 12);
  a1[4] = v4 + 24;
  return v4;
}

char *zhtok::LatticeSessionData::makeLatticeWord(char **a1, int a2, int a3, uint64_t a4, uint64_t a5)
{
  char *v10;
  char *v11;
  char *v12;

  v10 = zhtok::ObjectPool<zhtok::LatticeWord>::alloc(a1 + 16);
  v11 = zhtok::ObjectPool<zhtok::Word>::alloc(a1 + 9);
  *(_DWORD *)v11 = a2;
  *((_DWORD *)v11 + 1) = a3;
  *((_QWORD *)v11 + 1) = a4;
  *((_QWORD *)v11 + 2) = a5;
  v12 = zhtok::ObjectPool<zhtok::HypothesisSet>::alloc(a1 + 23);
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((_OWORD *)v12 + 2) = 0u;
  *((_OWORD *)v12 + 3) = 0u;
  *((_OWORD *)v12 + 4) = 0u;
  *((_OWORD *)v12 + 5) = 0u;
  *(_QWORD *)v10 = v11;
  *((_QWORD *)v10 + 1) = v12;
  v10[16] = 0;
  return v10;
}

char *zhtok::ObjectPool<zhtok::LatticeWord>::alloc(char **a1)
{
  char *v2;
  char *v3;
  char *v4;
  size_t v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v2 = a1[3];
  if (v2)
  {
    v4 = a1[4];
    v3 = a1[5];
    v5 = v4 - v2;
    if ((char *)(0xAAAAAAAAAAAAAAABLL * ((v4 - v2) >> 3)) != v3)
      goto LABEL_22;
  }
  else
  {
    v5 = 24 * (_QWORD)a1[5];
  }
  v4 = (char *)malloc_type_malloc(v5, 0x1020040A95220FAuLL);
  v6 = (unint64_t)a1[2];
  v7 = a1[1];
  if ((unint64_t)v7 >= v6)
  {
    v9 = (v7 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]();
    v10 = v6 - (_QWORD)*a1;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::HypothesisSet *>>((uint64_t)(a1 + 2), v12);
    else
      v13 = 0;
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(_QWORD *)v14 = v4;
    v8 = v14 + 8;
    v17 = *a1;
    v16 = a1[1];
    if (v16 != *a1)
    {
      do
      {
        v18 = *((_QWORD *)v16 - 1);
        v16 -= 8;
        *((_QWORD *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      v16 = *a1;
    }
    *a1 = v14;
    a1[1] = v8;
    a1[2] = v15;
    if (v16)
      operator delete(v16);
  }
  else
  {
    *(_QWORD *)v7 = v4;
    v8 = v7 + 8;
  }
  a1[1] = v8;
  a1[3] = v4;
LABEL_22:
  ++*((_DWORD *)a1 + 12);
  a1[4] = v4 + 24;
  return v4;
}

_QWORD *zhtok::ObjectPool<zhtok::Hypothesis>::ObjectPool(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  a1[5] = a2;
  zhtok::ObjectPool<zhtok::Hypothesis>::reset((uint64_t)a1);
  return a1;
}

void sub_20B7F196C(_Unwind_Exception *exception_object)
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

_QWORD *zhtok::ObjectPool<zhtok::Word>::ObjectPool(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  a1[5] = a2;
  zhtok::ObjectPool<zhtok::Hypothesis>::reset((uint64_t)a1);
  return a1;
}

void sub_20B7F19B8(_Unwind_Exception *exception_object)
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

_QWORD *zhtok::ObjectPool<zhtok::LatticeWord>::ObjectPool(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  a1[5] = a2;
  zhtok::ObjectPool<zhtok::Hypothesis>::reset((uint64_t)a1);
  return a1;
}

void sub_20B7F1A04(_Unwind_Exception *exception_object)
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

_QWORD *zhtok::ObjectPool<zhtok::HypothesisSet>::ObjectPool(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  a1[5] = a2;
  zhtok::ObjectPool<zhtok::Hypothesis>::reset((uint64_t)a1);
  return a1;
}

void sub_20B7F1A50(_Unwind_Exception *exception_object)
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

void std::default_delete<zhtok::LatticeSessionData::Sentinel>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a2)
  {
    v3 = a2[2];
    a2[2] = 0;
    if (v3)
      MEMORY[0x20BD387FC](v3, 0x1020C40A95220FALL);
    v4 = a2[1];
    a2[1] = 0;
    if (v4)
      MEMORY[0x20BD387FC](v4, 0x1060C40C2C571E4);
    v5 = *a2;
    *a2 = 0;
    if (v5)
      MEMORY[0x20BD387FC](v5, 0x1000C40504FFAC1);
    JUMPOUT(0x20BD387FCLL);
  }
}

uint64_t zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool(uint64_t a1)
{
  void **v2;
  void *v3;

  v2 = *(void ***)a1;
  if (*(_QWORD *)a1 < *(_QWORD *)(a1 + 8))
  {
    do
    {
      v3 = *v2++;
      free(v3);
    }
    while ((unint64_t)v2 < *(_QWORD *)(a1 + 8));
    v2 = *(void ***)a1;
  }
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::HypothesisSet *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

char *zhtok::HypothesisLogger::printString(const __CFString *this, const __CFString *a2)
{
  zhtok::Logger *v2;
  uint64_t Logger;
  char *result;
  char *v5;

  v2 = (zhtok::Logger *)zhtok::UTF8StringFromCFString(this, &v5);
  Logger = zhtok::Logger::getLogger(v2);
  zhtok::Logger::log(Logger, 4u, "%s\n", v5);
  result = v5;
  v5 = 0;
  if (result)
    return (char *)MEMORY[0x20BD387E4](result, 0x1000C8077774924);
  return result;
}

void sub_20B7F1BF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    MEMORY[0x20BD387E4](a10, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

_BYTE *zhtok::Hypothesis::init(_BYTE *__dst, uint64_t a2, uint64_t a3, double a4)
{
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  char v9;

  v5 = __dst;
  *((double *)__dst + 2) = a4;
  if (a3)
  {
    v8 = *(unsigned __int8 *)(a3 + 8);
    v6 = a3 + 8;
    v7 = v8;
    *((_QWORD *)__dst + 3) = a2;
    *((_QWORD *)__dst + 4) = v6 + 16;
    if (v8 > 1uLL)
    {
      __dst = memcpy(__dst, (const void *)(v6 - 4 * (v7 - 1)), 4 * (v7 - 1));
      v9 = 2;
    }
    else
    {
      __dst = memcpy(__dst, (const void *)(v6 - 4 * v7), 4 * v7);
      v9 = v7 + 1;
    }
    v5[8] = v9;
    *((_DWORD *)v5 + 1) = *(_DWORD *)(a2 + 4);
  }
  else
  {
    *((_QWORD *)__dst + 3) = a2;
    *((_QWORD *)__dst + 4) = 0;
    *((_DWORD *)__dst + 1) = 1;
    __dst[8] = 1;
  }
  return __dst;
}

double zhtok::Hypothesis::costOfExtendingToWord(zhtok::Hypothesis *this, unsigned int a2, void *a3)
{
  double v3;

  LMLanguageModelConditionalProbability();
  return -v3;
}

CFStringRef zhtok::Hypothesis::createDescription(zhtok::Hypothesis *this)
{
  uint64_t v2;
  void *p_p;
  CFStringRef v4;
  uint64_t v5;
  void *__p;
  char v8;
  _QWORD v9[2];
  _QWORD v10[11];
  char v11;
  uint64_t v12;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v9);
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)",", 1);
  std::ostream::operator<<();
  v2 = *((_QWORD *)this + 2);
  std::stringbuf::str();
  if (v8 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%p, cost = %f, history = %s"), this, v2, p_p);
  if (v8 < 0)
    operator delete(__p);
  v9[0] = *MEMORY[0x24BEDB7F0];
  v5 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v9 + *(_QWORD *)(v9[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v10[0] = v5;
  v10[1] = MEMORY[0x24BEDB848] + 16;
  if (v11 < 0)
    operator delete((void *)v10[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x20BD387CC](&v12);
  return v4;
}

void sub_20B7F1E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  if (a18 < 0)
    operator delete(__p);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a19);
  _Unwind_Resume(a1);
}

_QWORD *zhtok::InstantLogPrinter::InstantLogPrinter(_QWORD *this, __sFILE *a2)
{
  *this = a2;
  return this;
}

uint64_t zhtok::InstantLogPrinter::print(FILE **this, const char *a2, va_list a3)
{
  return vfprintf(*this, a2, a3);
}

uint64_t zhtok::Logger::getLogger(zhtok::Logger *this)
{
  unsigned __int8 v1;
  zhtok::Logger *v3;

  {
    v3 = (zhtok::Logger *)operator new();
    zhtok::Logger::Logger(v3);
    zhtok::Logger::getLogger(void)::singleton = (uint64_t)v3;
  }
  return zhtok::Logger::getLogger(void)::singleton;
}

void sub_20B7F1ED4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD387FC](v1, 0x1020C40A15A3301);
  _Unwind_Resume(a1);
}

zhtok::Logger *zhtok::Logger::Logger(zhtok::Logger *this)
{
  uint64_t *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;

  *((_QWORD *)this + 1) = 0;
  v2 = (uint64_t *)((char *)this + 8);
  *(_BYTE *)this = 0;
  v3 = *MEMORY[0x24BDAC8D8];
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = v3;
  v4 = getenv("DEBUG_PRINT_WORD");
  if (v4 && *v4 == 49)
  {
    v5 = 2;
    *v2 = 2;
  }
  else
  {
    v5 = 0;
  }
  v6 = getenv("DEBUG_PRINT_HYPOTHESES");
  if (v6 && *v6 == 49)
  {
    v5 |= 4uLL;
    *v2 = v5;
  }
  v7 = getenv("DEBUG_PRINT_BEST_BACKTRACE");
  if (v7 && *v7 == 49)
  {
    *v2 = v5 | 0x10;
  }
  else if (!v5)
  {
    return this;
  }
  *(_BYTE *)this = 1;
  v8 = (_QWORD *)operator new();
  v9 = *((_QWORD *)this + 2);
  *v8 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 2) = v8;
  if (v9)
    MEMORY[0x20BD387FC](v9, 0x20C4093837F09);
  return this;
}

void sub_20B7F2018(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;
  if (v3)
    MEMORY[0x20BD387FC](v3, 0x20C4093837F09);
  _Unwind_Resume(exception_object);
}

BOOL zhtok::Logger::isLoggingTypeEnabled(uint64_t a1, unsigned int a2)
{
  return *(_BYTE *)a1 && (*(_QWORD *)(a1 + 8) & a2) != 0;
}

uint64_t zhtok::Logger::isLoggingTypeEnabledForDebug()
{
  return 0;
}

BOOL zhtok::Logger::areLoggingTypesEnabled(zhtok::Logger *this, uint64_t a2, int a3)
{
  if (a3)
  {
    if (*(_BYTE *)this)
      return (*((_QWORD *)this + 1) & a2) != 0;
  }
  else if (*(_BYTE *)this)
  {
    return (a2 & ~*((_QWORD *)this + 1)) == 0;
  }
  return 0;
}

uint64_t zhtok::Logger::log(uint64_t result, unsigned int a2, char *a3, ...)
{
  va_list va;

  va_start(va, a3);
  if (*(_BYTE *)result)
  {
    if ((*(_QWORD *)(result + 8) & a2) != 0)
      return vfprintf(**(FILE ***)(result + 16), a3, va);
  }
  return result;
}

uint64_t zhtok::Logger::log(uint64_t this, uint64_t a2, const char *a3, ...)
{
  va_list va;

  va_start(va, a3);
  if (*(_BYTE *)this)
  {
    if ((*(_QWORD *)(this + 8) & a2) != 0)
      return vfprintf(**(FILE ***)(this + 16), a3, va);
  }
  return this;
}

uint64_t zhtok::Logger::flush(uint64_t this)
{
  FILE **v1;

  v1 = *(FILE ***)(this + 16);
  if (v1)
    return fflush(*v1);
  return this;
}

void zhtok::Logger::logErrorMessage(zhtok::Logger *this, const char *a2, ...)
{
  CFStringRef v2;
  char cStr[1024];
  uint64_t v4;
  va_list va;

  va_start(va, a2);
  v4 = *MEMORY[0x24BDAC8D0];
  vsprintf(cStr, a2, va);
  v2 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  CFLog();
  CFRelease(v2);
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

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x24BDBBC20](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x24BDBBC30](theSet, theChar);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF48](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x24BDBBF78](locale);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x24BDBBF98](locale, key);
}

uint64_t CFLog()
{
  return MEMORY[0x24BDBBFA0]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x24BDBC4B0](theString, cStr, *(_QWORD *)&encoding);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
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

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t LMLanguageModelConditionalProbability()
{
  return MEMORY[0x24BE5EB38]();
}

uint64_t LMLanguageModelCreate()
{
  return MEMORY[0x24BE5EB50]();
}

uint64_t LMLanguageModelIsAppleColorEmojiCharacter()
{
  return MEMORY[0x24BE5EBD0]();
}

uint64_t LMLanguageModelRelease()
{
  return MEMORY[0x24BE5EBE8]();
}

uint64_t LMLexiconCreate()
{
  return MEMORY[0x24BE5EC30]();
}

uint64_t LMLexiconCursorFirstTokenID()
{
  return MEMORY[0x24BE5EC38]();
}

uint64_t LMLexiconCursorHasEntries()
{
  return MEMORY[0x24BE5EC50]();
}

uint64_t LMLexiconCursorTraversedLength()
{
  return MEMORY[0x24BE5EC58]();
}

uint64_t LMLexiconGetCursorByAdvancingWithCharacters()
{
  return MEMORY[0x24BE5EC60]();
}

uint64_t LMLexiconGetRootCursor()
{
  return MEMORY[0x24BE5EC68]();
}

uint64_t LMLexiconRelease()
{
  return MEMORY[0x24BE5EC70]();
}

uint64_t LMLexiconResetCursors()
{
  return MEMORY[0x24BE5EC78]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
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

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF50]();
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

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24C456048();
}

void operator delete(void *__p)
{
  off_24C456050(__p);
}

uint64_t operator delete()
{
  return off_24C456058();
}

uint64_t operator new[]()
{
  return off_24C456060();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C456068(__sz);
}

uint64_t operator new()
{
  return off_24C456070();
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x24BDAD288](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x24BDAD2A0](a1, *(_QWORD *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t ubrk_close()
{
  return MEMORY[0x24BEDC070]();
}

uint64_t ubrk_first()
{
  return MEMORY[0x24BEDC078]();
}

uint64_t ubrk_next()
{
  return MEMORY[0x24BEDC0A0]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x24BEDC0A8]();
}

uint64_t ubrk_setUText()
{
  return MEMORY[0x24BEDC0C8]();
}

UText *__cdecl utext_close(UText *ut)
{
  return (UText *)MEMORY[0x24BEDC328](ut);
}

UText *__cdecl utext_openUChars(UText *ut, const UChar *s, int64_t length, UErrorCode *status)
{
  return (UText *)MEMORY[0x24BEDC340](ut, s, length, status);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0370](a1, a2, a3);
}

