uint64_t registerPhonemeCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 208) + 32);
  *(_QWORD *)(v3 + 152) = a2;
  *(_QWORD *)(v3 + 160) = a3;
  return result;
}

void insertPhoneme(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, _QWORD);

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 208) + 32);
  v4 = *(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 152);
  if (v4)
    v4(a2, a3, *(_QWORD *)(v3 + 160));
  else
    insertDelayedSynthIndex(a1, a2);
}

void insertDelayedSynthIndex(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;

  v3 = *(_QWORD *)(a1 + 208);
  v5 = *(_DWORD *)(v3 + 136);
  v4 = *(_DWORD *)(v3 + 140);
  if (v4 <= v5)
    v6 = *(_DWORD *)(v3 + 136);
  else
    v6 = *(_DWORD *)(v3 + 140);
  v7 = *(_DWORD *)(v3 + 144);
  if (v6 <= v7)
    v8 = *(_DWORD *)(v3 + 144);
  else
    v8 = v6;
  *(_DWORD *)(v3 + 140) = v6;
  *(_DWORD *)(v3 + 144) = v8;
  if (v5 < v4 || v6 < v7)
  {
    IndexQueue::addOffsetFromLast((IndexQueue *)(*(_QWORD *)(v3 + 32) + 72), a2, *(_DWORD *)(v3 + 148) * (v8 - v6) / 1000);
    *(_DWORD *)(*(_QWORD *)(a1 + 208) + 140) = *(_DWORD *)(*(_QWORD *)(a1 + 208) + 144);
    OUTLINED_FUNCTION_0_62();
  }
  else
  {
    insertSynthIndex(a1, a2);
  }
}

uint64_t insertSynthIndex(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  void (*v3)(uint64_t, _QWORD);

  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 208) + 32);
  if (!*v2)
    return 0;
  v3 = (void (*)(uint64_t, _QWORD))v2[17];
  if (v3)
    v3(a2, v2[18]);
  return 1;
}

void flushDelayedSynthQueue()
{
  uint64_t v0;

  OUTLINED_FUNCTION_2_56();
  if (*(_QWORD *)(v0 + 80))
    IndexQueue::remove((IndexQueue *)(v0 + 72));
  OUTLINED_FUNCTION_0_62();
}

BOOL IndexQueue::isEmpty(IndexQueue *this)
{
  return *((_QWORD *)this + 1) == 0;
}

uint64_t resetDelayedSynthQueue(uint64_t a1)
{
  return IndexQueue::reset((IndexQueue *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 32) + 72));
}

uint64_t IndexQueue::reset(IndexQueue *this)
{
  *((_QWORD *)this + 3) = 0;
  return EList::reset(this);
}

void deltaCleanup(uint64_t a1)
{
  deltaHeapCleanup();
  dlangCleanup(a1);
  vnstackCleanup(a1);
  vdelCleanup(a1);
  logicalIOCleanup(a1);
}

void dlang_new(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;

  v2 = malloc_type_malloc(0x98uLL, 0x1090040BA41C4AEuLL);
  *(_QWORD *)(a1 + 208) = v2;
  bzero(v2, 0x98uLL);
  v3 = malloc_type_malloc(0x100uLL, 0x10000400763368AuLL);
  *(_QWORD *)(*(_QWORD *)(a1 + 208) + 40) = v3;
  bzero(v3, 0x100uLL);
  v4 = operator new();
  *(_QWORD *)(v4 + 80) = 0;
  *(_QWORD *)(v4 + 88) = 0;
  *(_OWORD *)v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  *(_QWORD *)(v4 + 64) = 0;
  *(_QWORD *)(v4 + 72) = &unk_24E46A618;
  *(_OWORD *)(v4 + 96) = 0u;
  *(_OWORD *)(v4 + 112) = 0u;
  *(_BYTE *)(v4 + 128) = 0;
  *(_OWORD *)(v4 + 136) = 0u;
  *(_OWORD *)(v4 + 152) = 0u;
  v5 = *(_QWORD *)(a1 + 208);
  *(_QWORD *)(v5 + 16) = "au";
  *(_QWORD *)(v5 + 24) = "audio.dev";
  *(_QWORD *)(v5 + 32) = v4;
  *(_BYTE *)(v5 + 48) = 1;
  v6 = malloc_type_malloc(0x158uLL, 0x10B2040B50B0513uLL);
  *(_QWORD *)(*(_QWORD *)(a1 + 208) + 56) = v6;
  memcpy(v6, &last_glob, 0x158uLL);
  v7 = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  *(_QWORD *)(*(_QWORD *)(a1 + 208) + 96) = v7;
  *v7 = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 208) + 120) = -1;
  stmarray_new(a1);
  klatt_new(a1);
  *(_QWORD *)(*(_QWORD *)(a1 + 208) + 64) = v8;
}

void dlang_delete(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 208);
    if (v2)
    {
      klatt_delete(*(const char ***)(v2 + 64));
      stmarray_delete(a1);
      v3 = *(_QWORD *)(a1 + 208);
      if (*(_QWORD *)(v3 + 32))
      {
        MEMORY[0x2207CC9B0](*(_QWORD *)(v3 + 32), 0);
        v3 = *(_QWORD *)(a1 + 208);
        *(_QWORD *)(v3 + 32) = 0;
      }
      if (*(_QWORD *)(v3 + 56))
      {
        bzero(*(void **)(v3 + 56), 0x158uLL);
        free(*(void **)(*(_QWORD *)(a1 + 208) + 56));
        v3 = *(_QWORD *)(a1 + 208);
        *(_QWORD *)(v3 + 56) = 0;
      }
      if (*(_QWORD *)(v3 + 40))
      {
        bzero(*(void **)(v3 + 40), 0x100uLL);
        free(*(void **)(*(_QWORD *)(a1 + 208) + 40));
        v3 = *(_QWORD *)(a1 + 208);
        *(_QWORD *)(v3 + 40) = 0;
      }
      v4 = *(_QWORD **)(v3 + 96);
      if (v4)
      {
        *v4 = 0;
        free(*(void **)(*(_QWORD *)(a1 + 208) + 96));
        v3 = *(_QWORD *)(a1 + 208);
        *(_QWORD *)(v3 + 96) = 0;
      }
      bzero((void *)v3, 0x98uLL);
      free(*(void **)(a1 + 208));
      *(_QWORD *)(a1 + 208) = 0;
    }
  }
}

BOOL EListQueue::isEmpty(EListQueue *this)
{
  return *((_QWORD *)this + 1) == 0;
}

BOOL IndexQueue::indexDue(IndexQueue *this)
{
  return !(**(unsigned int (***)(IndexQueue *))this)(this)
      && *(_QWORD *)((*(uint64_t (**)(IndexQueue *))(*(_QWORD *)this + 24))(this) + 8) == 0;
}

uint64_t ESList::head(ESList *this)
{
  return *((_QWORD *)this + 1);
}

uint64_t ESList::tail(ESList *this)
{
  return *((_QWORD *)this + 2);
}

void IndexQueue::~IndexQueue(IndexQueue *this)
{
  EListQueue::~EListQueue(this);
  JUMPOUT(0x2207CC9B0);
}

void sub_21F878EDC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2207CC9B0](v1, 0x10A1C40A4A8B666);
  _Unwind_Resume(a1);
}

void EListQueue::~EListQueue(EListQueue *this)
{
  EListQueue::~EListQueue(this);
  JUMPOUT(0x2207CC9B0);
}

{
  *(_QWORD *)this = &unk_24E46A6D8;
  EList::reset(this);
  ESList::~ESList(this);
}

void sub_21F878F38(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2207CC9B0](v1, 0xA1C409BE6959DLL);
  _Unwind_Resume(a1);
}

void sub_21F878F90(_Unwind_Exception *a1)
{
  ESList *v1;

  ESList::~ESList(v1);
  _Unwind_Resume(a1);
}

void ESList::~ESList(ESList *this)
{
  *(_QWORD *)this = off_24E46A748;
  EList::reset(this);
}

{
  ESList::~ESList(this);
  JUMPOUT(0x2207CC9B0);
}

uint64_t OUTLINED_FUNCTION_1_57()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_4_53()
{
  return 1;
}

uint64_t OUTLINED_FUNCTION_5_50(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  return sendArrayParameters(a1, a2, a3, a4, a5, a6, 0, a14, a9, a10);
}

void *OUTLINED_FUNCTION_6_50(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t createStreamArrays(uint64_t a1, int a2)
{
  _QWORD *v2;
  uint64_t v3;
  int v4;

  if (a2 < 1)
    return OUTLINED_FUNCTION_1_58();
  v2 = (_QWORD *)OUTLINED_FUNCTION_3_56(a1);
  return !*v2 && StreamArrayList::build((uint64_t)v2, v3, v4) != 0;
}

uint64_t StreamArrayList::build(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;

  v5 = a3;
  v6 = (_QWORD *)operator new[]();
  *v6 = 32;
  v6[1] = v5;
  if (a3)
  {
    v7 = 0;
    v8 = 32 * v5;
    do
    {
      StreamArray::StreamArray((StreamArray *)&v6[v7 / 8 + 2]);
      v7 += 32;
    }
    while (v8 != v7);
  }
  *(_QWORD *)a1 = v6 + 2;
  *(_WORD *)(a1 + 8) = a3;
  return 1;
}

void sub_21F879110(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  for (; v2; v2 -= 32)
    StreamArray::~StreamArray((StreamArray *)(v1 - 16 + v2));
  MEMORY[0x2207CC9A4](v1, 0x1030C803AA113E6);
  _Unwind_Resume(a1);
}

BOOL initStreamArray(uint64_t a1, int a2)
{
  StreamArrayList *v3;
  const char *v4;

  v3 = (StreamArrayList *)OUTLINED_FUNCTION_3_56(a1);
  return StreamArrayList::addName(v3, v4) == a2;
}

uint64_t StreamArrayList::addName(StreamArrayList *this, const char *a2)
{
  int v2;
  uint64_t v4;

  v2 = *((__int16 *)this + 5);
  if (v2 >= *((__int16 *)this + 4))
    return 0xFFFFFFFFLL;
  v4 = *(_QWORD *)this;
  *((_WORD *)this + 5) = v2 + 1;
  StreamArray::setName((StreamArray *)(v4 + 32 * v2), a2);
  return (*((__int16 *)this + 5) - 1);
}

BOOL addStreamArrayPtValC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;

  StreamArrayList::appendValueToStream(*(StreamArrayList **)(*(_QWORD *)(a1 + 208) + 72), *(__int16 *)(a2 + 2), *(double *)(a4 + 8), *(__int16 *)(a3 + 2));
  return v4 == 0;
}

void StreamArrayList::appendValueToStream(StreamArrayList *this, int a2, unsigned int a3, int a4)
{
  StreamArray::appendValue((StreamArray *)(*(_QWORD *)this + 32 * a2), a3, a4);
}

BOOL addStreamArraySsValC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double v6;
  __int16 v7;
  int v8;
  int v9;
  int v10;

  v6 = *(double *)(a5 + 8);
  v7 = *(_WORD *)(a2 + 2);
  v8 = *(__int16 *)(a3 + 2);
  StreamArrayList::appendValueToStream(*(StreamArrayList **)(*(_QWORD *)(a1 + 208) + 72), v7, *(double *)(a4 + 8), v8);
  if (!v9)
    return 1;
  StreamArrayList::appendValueToStream(*(StreamArrayList **)(*(_QWORD *)(a1 + 208) + 72), v7, v6, (__int16)v8);
  return v10 == 0;
}

uint64_t resetStreamArrayStreamC(uint64_t a1, uint64_t a2)
{
  StreamArrayList::clear(*(_QWORD **)(*(_QWORD *)(a1 + 208) + 72), a1, *(__int16 *)(a2 + 2));
  return 0;
}

void StreamArrayList::clear(_QWORD *a1, uint64_t a2, int a3)
{
  StreamArray::clear((TimeValueQueue *)(*a1 + 32 * a3), a2);
}

uint64_t resetStreamArrayC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_3_56(a1);
  StreamArrayList::clearAll(v1, v2);
  return 0;
}

void StreamArrayList::clearAll(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t i;

  v4 = 0;
  for (i = 0; i < *(__int16 *)(a1 + 8); ++i)
  {
    StreamArray::clear((TimeValueQueue *)(*(_QWORD *)a1 + v4), a2);
    v4 += 32;
  }
}

uint64_t arrayStreamFind(uint64_t a1)
{
  StreamArrayList *v1;
  const char *v2;

  v1 = (StreamArrayList *)OUTLINED_FUNCTION_3_56(a1);
  return StreamArrayList::findStream(v1, v2);
}

uint64_t StreamArrayList::findStream(StreamArrayList *this, const char *a2)
{
  uint64_t v4;
  uint64_t i;

  v4 = 0;
  for (i = 0; i < *((__int16 *)this + 4); ++i)
  {
    if (!StreamArray::nameMatch((const char **)(*(_QWORD *)this + v4), a2))
      return (__int16)i;
    v4 += 32;
  }
  LOWORD(i) = -1;
  return (__int16)i;
}

uint64_t arrayStreamFirstVal(uint64_t a1, __int16 a2, unsigned int *a3, int *a4)
{
  return StreamArrayList::fetchFirstValue(*(StreamArrayList **)(*(_QWORD *)(a1 + 208) + 72), a2, a3, a4);
}

uint64_t StreamArrayList::fetchFirstValue(StreamArrayList *this, int a2, unsigned int *a3, int *a4)
{
  return StreamArray::fetchNext((StreamArray *)(*(_QWORD *)this + 32 * a2), a3, a4);
}

uint64_t arrayStreamNextVal(uint64_t a1, __int16 a2, unsigned int *a3, int *a4)
{
  return StreamArrayList::fetchNextValue(*(StreamArrayList **)(*(_QWORD *)(a1 + 208) + 72), a2, a3, a4);
}

uint64_t StreamArrayList::fetchNextValue(StreamArrayList *this, int a2, unsigned int *a3, int *a4)
{
  return StreamArray::fetchNext((StreamArray *)(*(_QWORD *)this + 32 * a2), a3, a4);
}

uint64_t arrayStreamLastOffset(uint64_t a1, __int16 a2)
{
  return *(unsigned int *)(**(_QWORD **)(*(_QWORD *)(a1 + 208) + 72) + 32 * a2 + 24);
}

uint64_t streamArrayCount(uint64_t a1)
{
  return *(__int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 72) + 8);
}

uint64_t stmarray_new(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_QWORD *)(result + 208))
    {
      result = operator new();
      *(_QWORD *)result = 0;
      *(_DWORD *)(result + 8) = 0;
      *(_QWORD *)(*(_QWORD *)(v1 + 208) + 72) = result;
    }
  }
  return result;
}

uint64_t stmarray_delete(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 208);
    if (v1)
    {
      if (*(_QWORD *)(v1 + 72))
        StreamArrayList::~StreamArrayList(*(StreamArrayList **)(v1 + 72));
      OUTLINED_FUNCTION_0_63();
    }
  }
  return result;
}

void sub_21F879508()
{
  OUTLINED_FUNCTION_0_63();
}

void sub_21F879510()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

char *StreamArray::setName(StreamArray *this, const char *__s)
{
  char *v4;

  if (*((_QWORD *)this + 2))
  {
    OUTLINED_FUNCTION_2_57();
    MEMORY[0x2207CC9A4]();
  }
  strlen(__s);
  OUTLINED_FUNCTION_2_57();
  v4 = (char *)operator new[]();
  *((_QWORD *)this + 2) = v4;
  return strcpy(v4, __s);
}

uint64_t StreamArray::nameMatch(const char **this, const char *a2)
{
  return strcasecmp(a2, this[2]);
}

void StreamArray::clear(TimeValueQueue *a1, uint64_t a2)
{
  TimeValueQueue::reset(a1);
  *((_QWORD *)a1 + 3) = *(unsigned int *)(*(_QWORD *)(a2 + 208) + 80);
}

void StreamArray::StreamArray(StreamArray *this)
{
  TimeValueQueue *v1;

  v1 = TimeValueQueue::TimeValueQueue(this, 0x12Cu);
  *((_QWORD *)v1 + 2) = 0;
  *((_DWORD *)v1 + 6) = 0;
}

void StreamArray::~StreamArray(StreamArray *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 2);
  if (v2)
  {
    MEMORY[0x2207CC9A4](v2, 0x1000C8077774924);
    *((_QWORD *)this + 2) = 0;
  }
  TimeValueQueue::~TimeValueQueue(this);
}

void StreamArray::appendValue(StreamArray *this, unsigned int a2, int a3)
{
  unsigned int v3;
  BOOL v4;
  unsigned int v5;
  int v8;
  int v9;
  unint64_t v10;

  v3 = *((_DWORD *)this + 6);
  v4 = a2 >= v3;
  v5 = a2 - v3;
  if (v4)
  {
    if (v5 > 0xFFFE)
    {
      TimeValueQueue::push(this, ((unsigned __int16)a3 << 16) | 0xFFFF);
      if (!v9)
      {
LABEL_8:
        *((_DWORD *)this + 6) = a2;
        return;
      }
      HIDWORD(v10) = a2;
      LODWORD(v10) = a2;
      v8 = v10 >> 16;
    }
    else
    {
      v8 = v5 | (a3 << 16);
    }
    TimeValueQueue::push(this, v8);
    goto LABEL_8;
  }
}

uint64_t StreamArray::fetchNext(StreamArray *this, unsigned int *a2, int *a3)
{
  int v7;
  int v8;

  if (TimeValueQueue::isEmpty(this))
    return 0;
  TimeValueQueue::pop((uint64_t)this, &v8);
  *a3 = SHIWORD(v8);
  if ((unsigned __int16)v8 == 0xFFFF)
  {
    if (TimeValueQueue::isEmpty(this))
      return 0;
    TimeValueQueue::pop((uint64_t)this, &v8);
    v7 = HIWORD(v8) | ((unsigned __int16)v8 << 16);
  }
  else
  {
    v7 = *((_DWORD *)this + 7) + (unsigned __int16)v8;
  }
  *a2 = v7;
  *((_DWORD *)this + 7) = v7;
  return 1;
}

void StreamArrayList::~StreamArrayList(StreamArrayList *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)this;
  if (*(_QWORD *)this)
  {
    v3 = *(_QWORD *)(v2 - 8);
    if (v3)
    {
      v4 = 32 * v3;
      do
      {
        StreamArray::~StreamArray((StreamArray *)(v2 - 32 + v4));
        v4 -= 32;
      }
      while (v4);
    }
    MEMORY[0x2207CC9A4](v2 - 16, 0x1030C803AA113E6);
    *(_QWORD *)this = 0;
  }
}

void OUTLINED_FUNCTION_0_63()
{
  JUMPOUT(0x2207CC9B0);
}

uint64_t OUTLINED_FUNCTION_1_58()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_3_56(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 208) + 72);
}

void TimeValueQueue::TimeValueQueue(TimeValueQueue *this, unsigned int a2)
{
  void *v3;

  *(_QWORD *)this = 0;
  *((_WORD *)this + 4) = a2;
  *(_DWORD *)((char *)this + 10) = 0;
  *((_WORD *)this + 7) = a2;
  v3 = OUTLINED_FUNCTION_0_64(4 * a2);
  *(_QWORD *)this = v3;
  if (!v3)
    *((_WORD *)this + 4) = 0;
}

uint64_t TimeValueQueue::size(TimeValueQueue *this)
{
  unsigned int v1;
  unsigned int v2;
  BOOL v3;
  unsigned __int16 v4;

  v1 = *((unsigned __int16 *)this + 5);
  v2 = *((unsigned __int16 *)this + 6);
  v3 = v2 >= v1;
  v4 = v2 - v1;
  if (!v3)
    v4 += *((_WORD *)this + 4);
  return v4;
}

uint64_t TimeValueQueue::totalSize(TimeValueQueue *this)
{
  return *((unsigned __int16 *)this + 4);
}

void TimeValueQueue::~TimeValueQueue(TimeValueQueue *this)
{
  void *v2;

  v2 = *(void **)this;
  if (v2)
  {
    free(v2);
    *(_QWORD *)((char *)this + 6) = 0;
    *(_QWORD *)this = 0;
  }
}

void TimeValueQueue::reset(TimeValueQueue *this)
{
  void *v2;

  free(*(void **)this);
  v2 = OUTLINED_FUNCTION_0_64(4 * *((unsigned __int16 *)this + 7));
  *(_QWORD *)this = v2;
  if (v2)
  {
    *((_WORD *)this + 4) = *((_WORD *)this + 7);
    *(_DWORD *)((char *)this + 10) = 0;
  }
  OUTLINED_FUNCTION_2_58();
}

BOOL TimeValueQueue::isEmpty(TimeValueQueue *this)
{
  return !*(_QWORD *)this || *((unsigned __int16 *)this + 5) == *((unsigned __int16 *)this + 6);
}

void TimeValueQueue::push(TimeValueQueue *this, int a2)
{
  uint64_t v2;
  uint64_t v4;
  int v5;
  int v6;
  __int16 v7;

  v2 = *(_QWORD *)this;
  if (*(_QWORD *)this)
  {
    v4 = *((unsigned __int16 *)this + 6);
    *((_WORD *)this + 6) = v4 + 1;
    *(_DWORD *)(v2 + 4 * v4) = a2;
    v5 = *((unsigned __int16 *)this + 6);
    if (v5 == *((unsigned __int16 *)this + 4))
    {
      v5 = 0;
      *((_WORD *)this + 6) = 0;
    }
    if (v5 == *((unsigned __int16 *)this + 5))
    {
      TimeValueQueue::expand(this);
      if (!v6)
      {
        v7 = *((_WORD *)this + 6);
        if (!v7)
          v7 = *((_WORD *)this + 4);
        *((_WORD *)this + 6) = v7 - 1;
      }
    }
  }
  OUTLINED_FUNCTION_2_58();
}

void TimeValueQueue::expand(TimeValueQueue *this)
{
  void *v2;
  __int16 v3;
  char *v4;

  v2 = *(void **)this;
  if (v2)
  {
    v3 = *((_WORD *)this + 4);
    v4 = (char *)OUTLINED_FUNCTION_1_59(v2, 8 * (v3 & 0x7FFF));
    memmove(&v4[4 * *((unsigned __int16 *)this + 4)], v4, 4 * *((unsigned __int16 *)this + 6));
    memmove(v4, &v4[4 * *((unsigned __int16 *)this + 5)], 4 * *((unsigned __int16 *)this + 4));
    if (v4)
    {
      *(_QWORD *)this = v4;
      *((_WORD *)this + 5) = 0;
      *((_WORD *)this + 6) = *((_WORD *)this + 4);
      *((_WORD *)this + 4) = 2 * v3;
    }
  }
  OUTLINED_FUNCTION_3_57();
}

void TimeValueQueue::pop(uint64_t a1, _DWORD *a2)
{
  __int16 v3;
  __int16 v4;

  if (TimeValueQueue::peekHead(a1, a2))
  {
    v3 = *(_WORD *)(a1 + 10);
    if (*(unsigned __int16 *)(a1 + 8) == (unsigned __int16)(v3 + 1))
      v4 = 0;
    else
      v4 = v3 + 1;
    *(_WORD *)(a1 + 10) = v4;
    TimeValueQueue::shrinkIfNeeded((const void **)a1);
  }
  else
  {
    OUTLINED_FUNCTION_2_58();
  }
}

uint64_t TimeValueQueue::peekHead(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;

  if (!*(_QWORD *)a1)
    return 0;
  v2 = *(unsigned __int16 *)(a1 + 10);
  if ((_DWORD)v2 == *(unsigned __int16 *)(a1 + 12))
    return 0;
  *a2 = *(_DWORD *)(*(_QWORD *)a1 + 4 * v2);
  return 1;
}

void TimeValueQueue::shrinkIfNeeded(const void **this)
{
  unsigned int v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  void *v6;
  char *v7;
  size_t v8;
  uint64_t v9;
  uint64_t v11;
  unint64_t v12;
  void *v13;

  v2 = *((unsigned __int16 *)this + 6);
  v3 = *((unsigned __int16 *)this + 5);
  v4 = v2 - v3;
  if (v2 > v3)
  {
    v5 = *((unsigned __int16 *)this + 4);
    if (v5 <= *((unsigned __int16 *)this + 7) || v4 >= (int)(v5 >> 1))
      goto LABEL_13;
    v6 = (void *)*this;
    v7 = (char *)*this + 4 * v3;
    v8 = 4 * v4;
    goto LABEL_11;
  }
  v9 = *((unsigned __int16 *)this + 4);
  v4 = v9 - v3 + v2;
  if (v9 > *((unsigned __int16 *)this + 7) && v4 < (int)(v9 >> 1))
  {
    memmove((char *)*this + 4 * v9 + -4 * v3, *this, 4 * *((unsigned __int16 *)this + 6));
    v6 = (void *)*this;
    v11 = *((unsigned __int16 *)this + 5);
    v7 = (char *)*this + 4 * v11;
    v8 = 4 * (*((unsigned __int16 *)this + 4) - v11);
LABEL_11:
    memmove(v6, v7, v8);
    v12 = *((unsigned __int16 *)this + 4);
    v13 = OUTLINED_FUNCTION_1_59((void *)*this, (2 * (_DWORD)v12) & 0x1FFFC);
    if (v13)
    {
      *this = v13;
      *((_WORD *)this + 5) = 0;
      *((_WORD *)this + 6) = v4;
      *((_WORD *)this + 4) = v12 >> 1;
    }
  }
LABEL_13:
  OUTLINED_FUNCTION_3_57();
}

_DWORD *TimeValueQueue::getElements(TimeValueQueue *this, unsigned int *a2)
{
  unsigned int v4;
  _DWORD *result;
  uint64_t i;

  v4 = TimeValueQueue::size(this);
  result = OUTLINED_FUNCTION_0_64(4 * v4);
  if (result)
  {
    for (i = 0; v4 != i; ++i)
      result[i] = *(_DWORD *)(*(_QWORD *)this
                            + 4
                            * ((i + *((unsigned __int16 *)this + 5)) % *((unsigned __int16 *)this + 4)));
    *a2 = v4;
  }
  return result;
}

void *OUTLINED_FUNCTION_0_64(size_t a1)
{
  return malloc_type_malloc(a1, 0x100004052888210uLL);
}

void *OUTLINED_FUNCTION_1_59(void *a1, size_t a2)
{
  return malloc_type_realloc(a1, a2, 0x100004052888210uLL);
}

void setUserDictInputStream(uint64_t a1, const char *a2)
{
  int i;
  char *v5;

  if (a2 && *a2)
  {
    for (i = 0; i < (int)num_streams(a1); ++i)
    {
      v5 = stream_name((char)i);
      if (!strcmp(v5, a2))
        break;
    }
    if (num_streams(a1) != i)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 208) + 120) = i;
      single_letter_stream((char)i);
    }
  }
  OUTLINED_FUNCTION_2_59();
}

BOOL callUserDictLookup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 208) + 112);
  return !v4
      || DictionarySet::lookupAndTranslate(v4, *(__int16 *)(a2 + 2), *(_QWORD *)(a3 + 8), *(_QWORD *)(a4 + 8)) != 0;
}

uint64_t DictionarySet::lookupAndTranslate(uint64_t a1, int a2, uint64_t a3, unint64_t a4)
{
  return UserDict::lookupAndTranslate(*(_QWORD *)(a1 + 8 * a2), *(uint64_t **)(a1 + 32), a3, a4);
}

BOOL callInsertLastDictString(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 208) + 112);
  return !v4
      || DictionarySet::lookupUndo(v4, *(__int16 *)(a2 + 2), *(_QWORD *)(a3 + 8), *(_QWORD *)(a4 + 8)) != 0;
}

uint64_t DictionarySet::lookupUndo(uint64_t a1, int a2, uint64_t a3, unint64_t a4)
{
  return UserDict::lookupUndo(*(_QWORD *)(a1 + 8 * a2), *(uint64_t **)(a1 + 32), a3, a4);
}

uint64_t getCurrentUserDict(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 208) + 112);
}

uint64_t setCurrentUserDict(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 208) + 112) = a2;
  return 0;
}

void UserDict::UserDict(UserDict *this)
{
  UserDict *v1;
  uint64_t v2;

  v1 = (UserDict *)OUTLINED_FUNCTION_5_51((uint64_t)this);
  UserDict::buildHashTable(v1, v2);
  OUTLINED_FUNCTION_7_51();
}

uint64_t UserDict::buildHashTable(UserDict *this, uint64_t a2)
{
  int v3;
  uint64_t v4;
  _BYTE *v5;

  if (a2)
    v3 = a2;
  else
    v3 = 256;
  v4 = 1;
  v5 = hashNew(v3, 1, 1);
  *((_QWORD *)this + 513) = v5;
  if (!v5)
    return 0;
  *((_DWORD *)this + 1028) = 1;
  return v4;
}

void UserDict::UserDict(uint64_t a1)
{
  OUTLINED_FUNCTION_5_51(a1);
  UserDict::loadDictionary();
  OUTLINED_FUNCTION_7_51();
}

void UserDict::loadDictionary()
{
  UserDict *v0;
  const char *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  UserDict *v5;
  off_t DictFile;
  char v7[4096];
  uint64_t v8;

  v0 = (UserDict *)MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v8 = *MEMORY[0x24BDAC8D0];
  DictFile = UserDict::findDictFile(v0, v1, v7);
  if (DictFile != -1
    && DictFile
    && (*((_QWORD *)v5 + 513) || UserDict::buildHashTable(v5, (int)(DictFile / 15))))
  {
    UserDict::loadHashTable((int **)v5, v4);
    strcpy((char *)v5, v2);
  }
  OUTLINED_FUNCTION_2_59();
}

void UserDict::~UserDict(int **this)
{
  hashDelete(this[513], 1, 1);
  OUTLINED_FUNCTION_7_51();
}

off_t UserDict::findDictFile(UserDict *this, const char *a2, char *a3)
{
  stat v5;

  if (fileFindInPath() && !stat(a3, &v5))
    return v5.st_size;
  else
    return -1;
}

void UserDict::loadHashTable(int **a1, uint64_t a2)
{
  uint64_t Line;
  char v5[513];
  char __s[129];
  _BYTE v7[705];
  uint64_t v8[73];

  v8[72] = *MEMORY[0x24BDAC8D0];
  std::ifstream::basic_ifstream(v8);
  Line = std::ifstream::open();
  while (UserDict::readNextLine(Line, v8, v7))
  {
    Line = UserDict::parseNextLine((uint64_t)a1, a2, v7, (unint64_t)__s, (uint64_t)v5);
    if ((_DWORD)Line)
      UserDict::addOneEntry(a1, __s, v5);
  }
  std::ifstream::close(v8);
  std::ifstream::~ifstream(v8);
  OUTLINED_FUNCTION_2_59();
}

void sub_21F87A04C()
{
  std::ifstream::~ifstream((uint64_t *)&STACK[0x548]);
  OUTLINED_FUNCTION_4_54();
}

uint64_t *std::ifstream::basic_ifstream(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;

  v2 = MEMORY[0x24BEDB838];
  v3 = MEMORY[0x24BEDB838] + 24;
  *a1 = MEMORY[0x24BEDB838] + 24;
  v4 = v2 + 64;
  a1[53] = v2 + 64;
  v5 = a1 + 2;
  std::istream::basic_istream[abi:ne180100](a1, (uint64_t *)(MEMORY[0x24BEDB7E0] + 8), a1 + 2);
  *a1 = v3;
  a1[53] = v4;
  MEMORY[0x2207CC8D8](v5);
  return a1;
}

void sub_21F87A0F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::istream::~istream();
  MEMORY[0x2207CC98C](v1 + 424);
  _Unwind_Resume(a1);
}

BOOL UserDict::readNextLine(uint64_t a1, _QWORD *a2, _BYTE *a3)
{
  if ((*((_BYTE *)a2 + *(_QWORD *)(*a2 - 24) + 32) & 2) != 0)
    return 0;
  std::istream::getline[abi:ne180100](a2);
  return *a3 != 0;
}

uint64_t UserDict::parseNextLine(uint64_t a1, uint64_t a2, _BYTE *a3, unint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v9;
  int v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;

  while (1)
  {
    result = *a3;
    if (!*a3)
      break;
    result = isspace(result);
    if (!(_DWORD)result)
    {
      v10 = *a3;
      if (!*a3)
        return 0;
      v11 = 0;
      do
      {
        if (v10 == 9 || (_DWORD)v11 == 704)
          break;
        result = OUTLINED_FUNCTION_9_49(result, v9, v10);
        if (!(_DWORD)result)
          return result;
        *(_BYTE *)(a4 + v11) = a3[v11];
        v10 = a3[++v11];
      }
      while (v10);
      v12 = (_BYTE *)(a4 + v11);
      *(_BYTE *)(a4 + v11) = 0;
      v13 = &a3[v11];
      do
      {
        v14 = v12;
        if ((unint64_t)v12 <= a4)
          break;
        --v12;
      }
      while (isspace(*(v14 - 1)));
      *v14 = 0;
      while (1)
      {
        result = *v13;
        if ((_DWORD)result != 9 && (_DWORD)result != 32)
          break;
        ++v13;
      }
      if (*v13)
      {
        v15 = 0;
        do
        {
          if ((_DWORD)v15 == 704)
            break;
          v16 = isspace(result);
          if ((_DWORD)v16)
          {
            v18 = 32;
          }
          else
          {
            result = OUTLINED_FUNCTION_9_49(v16, v17, v13[v15]);
            if (!(_DWORD)result)
              return result;
            v18 = v13[v15];
          }
          *(_BYTE *)(a5 + v15) = v18;
          LODWORD(result) = v13[++v15];
        }
        while ((_DWORD)result);
        do
        {
          v19 = v15 - 1;
          v20 = *(_BYTE *)(a5 + v15 - 1) != 32 || v15 == 1;
          --v15;
        }
        while (!v20);
        *(_BYTE *)(a5 + v19 + 1) = 0;
        return 1;
      }
      return result;
    }
    ++a3;
  }
  return result;
}

void UserDict::addOneEntry(int **this, const char *__s, const char *a3)
{
  size_t v6;
  size_t v7;
  malloc_type_id_t v8;
  char *v9;
  size_t v10;
  size_t v11;
  malloc_type_id_t v12;
  char *v13;
  int v14;

  v6 = strlen(__s);
  if (v6 < 0x81)
  {
    v7 = v6 + 1;
    v8 = 3220888891;
  }
  else
  {
    OUTLINED_FUNCTION_8_50();
  }
  v9 = (char *)malloc_type_malloc(v7, v8);
  if (v9)
  {
    if (strlen(__s) < 0x81)
    {
      strcpy(v9, __s);
    }
    else
    {
      strncpy(v9, __s, 0x80uLL);
      if (strlen(__s) >= 0x80)
        v9[128] = 0;
    }
    v10 = OUTLINED_FUNCTION_13_42();
    if (v10 < 0x201)
    {
      v11 = v10 + 1;
      v12 = 3766453158;
    }
    else
    {
      OUTLINED_FUNCTION_8_50();
    }
    v13 = (char *)malloc_type_malloc(v11, v12);
    if (v13)
    {
      if (OUTLINED_FUNCTION_13_42() < 0x201)
      {
        strcpy(v13, a3);
      }
      else
      {
        strncpy(v13, a3, 0x200uLL);
        if (OUTLINED_FUNCTION_13_42() >= 0x200)
          v13[512] = 0;
      }
      hashInsertString(this[513], v9);
      if (v14)
        *((_DWORD *)this + 1028) = 2;
    }
  }
  OUTLINED_FUNCTION_2_59();
}

void std::ifstream::close(_QWORD *a1)
{
  if (!std::filebuf::close())
    std::ios_base::setstate[abi:ne180100]((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), 4);
}

uint64_t *std::ifstream::~ifstream(uint64_t *a1)
{
  std::ifstream::~ifstream(a1, MEMORY[0x24BEDB7E0]);
  MEMORY[0x2207CC98C](a1 + 53);
  return a1;
}

uint64_t std::istream::getline[abi:ne180100](_QWORD *a1)
{
  std::ios::widen[abi:ne180100]((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), 10);
  return std::istream::getline();
}

int isspace(int _c)
{
  return __istype(_c, 0x4000uLL);
}

{
  return MEMORY[0x24BDAE910](*(_QWORD *)&_c);
}

uint64_t UserDict::proofCharacter(uint64_t a1, uint64_t a2, char a3)
{
  _BYTE v4[2];

  v4[1] = 0;
  v4[0] = a3;
  return non_unique_value(a2, *(char *)(*(_QWORD *)(a2 + 208) + 120), 0, v4);
}

void UserDict::saveDictionary(UserDict *this, const char *a2)
{
  uint64_t v3;
  char *v4;
  _QWORD *v5;
  _QWORD *v6;
  char *v7;
  _QWORD *v8;
  _BYTE v9[24];
  uint64_t v10[72];

  v10[71] = *MEMORY[0x24BDAC8D0];
  std::ofstream::basic_ofstream(v10);
  std::ofstream::open();
  if ((*((_BYTE *)&v10[4] + *(_QWORD *)(v10[0] - 24)) & 1) == 0)
  {
    v3 = *((_QWORD *)this + 513);
    if (v3)
    {
      if (hashIterConstruct((uint64_t)v9, v3))
      {
        do
        {
          v4 = (char *)hashIterString((uint64_t)v9);
          v5 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v10, v4);
          v6 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v5, "\t");
          v7 = (char *)hashIterRef((uint64_t)v9);
          v8 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v6, v7);
          std::endl[abi:ne180100]<char,std::char_traits<char>>(v8);
        }
        while (hashIterNext((uint64_t)v9));
      }
      std::ofstream::close(v10);
      OUTLINED_FUNCTION_10_48();
    }
    else
    {
      std::ofstream::close(v10);
      OUTLINED_FUNCTION_10_48();
    }
  }
  std::ofstream::~ofstream(v10);
  OUTLINED_FUNCTION_2_59();
}

void sub_21F87A688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::ofstream::~ofstream((uint64_t *)va);
  OUTLINED_FUNCTION_4_54();
}

uint64_t *std::ofstream::basic_ofstream(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;

  v2 = MEMORY[0x24BEDB840];
  v3 = MEMORY[0x24BEDB840] + 24;
  *a1 = MEMORY[0x24BEDB840] + 24;
  v4 = v2 + 64;
  a1[52] = v2 + 64;
  v5 = a1 + 1;
  std::ostream::basic_ostream[abi:ne180100](a1, (uint64_t *)(MEMORY[0x24BEDB7E8] + 8), a1 + 1);
  *a1 = v3;
  a1[52] = v4;
  MEMORY[0x2207CC8D8](v5);
  return a1;
}

void sub_21F87A72C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x2207CC98C](v1 + 416);
  _Unwind_Resume(a1);
}

void std::ofstream::close(_QWORD *a1)
{
  if (!std::filebuf::close())
    std::ios_base::setstate[abi:ne180100]((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), 4);
}

_QWORD *std::operator<<[abi:ne180100]<std::char_traits<char>>(_QWORD *a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)__s, v4);
}

_QWORD *std::endl[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1)
{
  std::ios::widen[abi:ne180100]((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), 10);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

uint64_t *std::ofstream::~ofstream(uint64_t *a1)
{
  std::ofstream::~ofstream(a1, MEMORY[0x24BEDB7E8]);
  MEMORY[0x2207CC98C](a1 + 52);
  return a1;
}

void UserDict::update(UserDict *this, char *a2, const char *a3)
{
  uint64_t v6;

  v6 = *((_QWORD *)this + 513);
  if (v6)
  {
LABEL_4:
    if (hashLookupString(v6, a2))
    {
      hashDeleteString(*((_QWORD *)this + 513), a2, 1, 1);
      if (!a3)
      {
        *((_DWORD *)this + 1028) = 2;
        goto LABEL_9;
      }
    }
    else if (!a3)
    {
      goto LABEL_9;
    }
    UserDict::addOneEntry((int **)this, a2, a3);
    return;
  }
  if (UserDict::buildHashTable(this, 256))
  {
    v6 = *((_QWORD *)this + 513);
    goto LABEL_4;
  }
LABEL_9:
  OUTLINED_FUNCTION_2_59();
}

void UserDict::findFirst(UserDict *this, const char **a2, const char **a3)
{
  uint64_t v3;
  char *v5;
  uint64_t v6;

  v3 = *((_QWORD *)this + 513);
  if (v3)
  {
    v5 = (char *)this + 4120;
    if (hashIterConstruct((uint64_t)this + 4120, v3))
    {
      v6 = hashIterString((uint64_t)v5);
      *a3 = (const char *)OUTLINED_FUNCTION_12_44(v6);
    }
  }
  OUTLINED_FUNCTION_2_59();
}

void UserDict::findNext(UserDict *this, const char **a2, const char **a3)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)this + 4120;
  if (hashIterNext((uint64_t)this + 4120))
  {
    v5 = hashIterString((uint64_t)v4);
    *a3 = (const char *)OUTLINED_FUNCTION_12_44(v5);
  }
  OUTLINED_FUNCTION_2_59();
}

uint64_t UserDict::lookup(UserDict *this, char *a2)
{
  uint64_t v2;

  if (a2 && *a2 && (v2 = *((_QWORD *)this + 513)) != 0)
    return hashLookupString(v2, a2);
  else
    return 0;
}

uint64_t *DictionarySet::DictionarySet(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  a1[4] = a2;
  v4 = OUTLINED_FUNCTION_0_65();
  *(_QWORD *)(v4 + 4104) = 0;
  *(_DWORD *)(v4 + 4112) = 0;
  *(_BYTE *)v4 = 0;
  *(_BYTE *)(v4 + 4144) = 0;
  *a1 = v4;
  v5 = OUTLINED_FUNCTION_0_65();
  *(_QWORD *)(v5 + 4104) = 0;
  *(_DWORD *)(v5 + 4112) = 0;
  *(_BYTE *)v5 = 0;
  *(_BYTE *)(v5 + 4144) = 0;
  a1[1] = v5;
  v6 = OUTLINED_FUNCTION_0_65();
  *(_QWORD *)(v6 + 4104) = 0;
  *(_DWORD *)(v6 + 4112) = 0;
  *(_BYTE *)(v6 + 4144) = 0;
  *(_BYTE *)v6 = 0;
  a1[2] = v6;
  a1[3] = *(_QWORD *)(a2 + 208) + 112;
  return a1;
}

void DictionarySet::DictionarySet(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  a1[4] = a2;
  v3 = OUTLINED_FUNCTION_0_65();
  UserDict::UserDict(v3);
  *a1 = v3;
  v4 = OUTLINED_FUNCTION_0_65();
  UserDict::UserDict(v4);
  a1[1] = v4;
  v5 = OUTLINED_FUNCTION_0_65();
  UserDict::UserDict(v5);
  a1[2] = v5;
  OUTLINED_FUNCTION_11_46();
  OUTLINED_FUNCTION_6_51();
}

void sub_21F87AAE0()
{
  OUTLINED_FUNCTION_1_60();
}

void DictionarySet::DictionarySet(UserDict **a1, UserDict *a2)
{
  UserDict *v3;
  UserDict *v4;
  UserDict *v5;

  a1[4] = a2;
  v3 = (UserDict *)OUTLINED_FUNCTION_0_65();
  UserDict::UserDict(v3);
  *a1 = v3;
  v4 = (UserDict *)OUTLINED_FUNCTION_0_65();
  UserDict::UserDict(v4);
  a1[1] = v4;
  v5 = (UserDict *)OUTLINED_FUNCTION_0_65();
  UserDict::UserDict(v5);
  a1[2] = v5;
  OUTLINED_FUNCTION_11_46();
  OUTLINED_FUNCTION_6_51();
}

void sub_21F87AB70()
{
  OUTLINED_FUNCTION_1_60();
}

void DictionarySet::~DictionarySet(DictionarySet *this)
{
  if (*(_QWORD *)this)
    OUTLINED_FUNCTION_14_42();
  OUTLINED_FUNCTION_1_60();
}

void sub_21F87ABB0()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8))
    OUTLINED_FUNCTION_14_42();
  OUTLINED_FUNCTION_1_60();
}

void sub_21F87ABC4()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    OUTLINED_FUNCTION_14_42();
  OUTLINED_FUNCTION_1_60();
}

void sub_21F87ABD8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 32) + 208);
  if (**(_QWORD **)(v0 + 24) == *(_QWORD *)(v1 + 112))
    *(_QWORD *)(v1 + 112) = 0;
  OUTLINED_FUNCTION_7_51();
}

void sub_21F87AC00()
{
  OUTLINED_FUNCTION_1_60();
}

void DictionarySet::load()
{
  UserDict::loadDictionary();
}

void DictionarySet::save(uint64_t a1, int a2, char *a3)
{
  UserDict::saveDictionary(*(UserDict **)(a1 + 8 * a2), a3);
}

void DictionarySet::updateEntry(uint64_t a1, int a2, char *a3, char *a4)
{
  UserDict::update(*(UserDict **)(a1 + 8 * a2), a3, a4);
}

void DictionarySet::findFirst(uint64_t a1, int a2, const char **a3, const char **a4)
{
  UserDict::findFirst(*(UserDict **)(a1 + 8 * a2), a3, a4);
}

void DictionarySet::findNext(uint64_t a1, int a2, const char **a3, const char **a4)
{
  UserDict::findNext(*(UserDict **)(a1 + 8 * a2), a3, a4);
}

uint64_t DictionarySet::lookup(uint64_t a1, int a2, char *a3)
{
  return UserDict::lookup(*(UserDict **)(a1 + 8 * a2), a3);
}

uint64_t UserDict::lookupAndTranslate(uint64_t a1, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  char *v9;

  if (!*(_QWORD *)(a1 + 4104))
    return 2;
  if (!sync_in_stm()
    || !sync_in_stm()
    || !extract_string((uint64_t)a2, *(char *)(a2[26] + 120), a3, a4, (char *)(a1 + 4144), 80))
  {
    return 3;
  }
  v8 = hashLookupString(*(_QWORD *)(a1 + 4104), (char *)(a1 + 4144));
  if (!v8)
    return 5;
  v9 = (char *)v8;
  del_two_point(a2, *(_BYTE *)(a2[26] + 120), a3, a4);
  *(_DWORD *)(a2[23] + 452) = 1;
  if (insert_string(a2, *(char *)(a2[26] + 120), a4, v9))
    return 0;
  else
    return 3;
}

uint64_t UserDict::lookupUndo(uint64_t a1, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  char *v4;

  v4 = (char *)(a1 + 4144);
  if (!*(_BYTE *)(a1 + 4144))
    return 5;
  del_two_point(a2, *(_BYTE *)(a2[26] + 120), a3, a4);
  *(_DWORD *)(a2[23] + 452) = 1;
  if (insert_string(a2, *(char *)(a2[26] + 120), a4, v4))
    return 0;
  else
    return 3;
}

uint64_t std::ifstream::~ifstream(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *a1 = *a2;
  *(uint64_t *)((char *)a1 + *(_QWORD *)(v2 - 24)) = a2[3];
  MEMORY[0x2207CC8E4](a1 + 2);
  return std::istream::~istream();
}

void sub_21F87AE4C(_Unwind_Exception *a1)
{
  std::istream::~istream();
  _Unwind_Resume(a1);
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

uint64_t std::ofstream::~ofstream(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *a1 = *a2;
  *(uint64_t *)((char *)a1 + *(_QWORD *)(v2 - 24)) = a2[3];
  MEMORY[0x2207CC8E4](a1 + 1);
  return std::ostream::~ostream();
}

void sub_21F87AEF0(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  _Unwind_Resume(a1);
}

uint64_t *std::istream::basic_istream[abi:ne180100](uint64_t *a1, uint64_t *a2, void *a3)
{
  uint64_t v4;

  v4 = *a2;
  *a1 = *a2;
  *(uint64_t *)((char *)a1 + *(_QWORD *)(v4 - 24)) = a2[1];
  a1[1] = 0;
  std::ios::init[abi:ne180100]((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), a3);
  return a1;
}

void std::ios::init[abi:ne180100](std::ios_base *a1, void *a2)
{
  std::ios_base::init(a1, a2);
  a1[1].__vftable = 0;
  a1[1].__fmtflags_ = -1;
}

void std::ios_base::setstate[abi:ne180100](std::ios_base *a1, int a2)
{
  std::ios_base::clear(a1, a1->__rdstate_ | a2);
}

uint64_t std::ios::widen[abi:ne180100](const std::ios_base *a1, uint64_t a2)
{
  const std::locale::facet *v3;
  uint64_t v4;
  std::locale v6;

  std::ios_base::getloc(a1);
  v3 = std::use_facet[abi:ne180100]<std::ctype<char>>(&v6);
  v4 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, a2);
  std::locale::~locale(&v6);
  return v4;
}

void sub_21F87AFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

const std::locale::facet *std::use_facet[abi:ne180100]<std::ctype<char>>(const std::locale *a1)
{
  return std::locale::use_facet(a1, MEMORY[0x24BEDB350]);
}

uint64_t *std::ostream::basic_ostream[abi:ne180100](uint64_t *a1, uint64_t *a2, void *a3)
{
  uint64_t v4;

  v4 = *a2;
  *a1 = *a2;
  *(uint64_t *)((char *)a1 + *(_QWORD *)(v4 - 24)) = a2[1];
  std::ios::init[abi:ne180100]((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), a3);
  return a1;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  const std::ios_base *v6;
  uint64_t rdbuf;
  std::ios_base::fmtflags fmtflags;
  std::string::value_type v9;
  uint64_t v10;
  _BYTE v12[16];

  MEMORY[0x2207CC920](v12, a1);
  if (v12[0])
  {
    v6 = (const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
    rdbuf = (uint64_t)v6->__rdbuf_;
    fmtflags = v6->__fmtflags_;
    v9 = std::ios::fill[abi:ne180100](v6);
    if ((fmtflags & 0xB0) == 0x20)
      v10 = a2 + a3;
    else
      v10 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(rdbuf, a2, v10, a2 + a3, (uint64_t)v6, v9))
      std::ios_base::setstate[abi:ne180100]((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), 5);
  }
  MEMORY[0x2207CC92C](v12);
  return a1;
}

void sub_21F87B108(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;

  MEMORY[0x2207CC92C](&a9);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21F87B0ECLL);
}

void sub_21F87B140(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, std::string::value_type __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  std::string *v13;
  uint64_t v14;
  uint64_t v15;
  std::string v17;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if ((a3 - a2 < 1 || (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) == a3 - a2)
      && (v12 < 1
       || ((std::string::__init(&v17, v12, __c), (v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
         ? (v13 = &v17)
         : (v13 = (std::string *)v17.__r_.__value_.__r.__words[0]),
           v14 = (*(uint64_t (**)(uint64_t, std::string *, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12), std::string::~string(&v17), v14 == v12))&& ((v15 = a4 - a3, v15 < 1)|| (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15))
    {
      *(_QWORD *)(a5 + 24) = 0;
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

void sub_21F87B26C(_Unwind_Exception *a1, std::string *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::string::~string((std::string *)&a10);
  _Unwind_Resume(a1);
}

uint64_t std::ios::fill[abi:ne180100](const std::ios_base *a1)
{
  std::ios_base::fmtflags fmtflags;

  fmtflags = a1[1].__fmtflags_;
  if (fmtflags == -1)
  {
    fmtflags = std::ios::widen[abi:ne180100](a1, 32);
    a1[1].__fmtflags_ = fmtflags;
  }
  return (char)fmtflags;
}

uint64_t OUTLINED_FUNCTION_0_65()
{
  return operator new();
}

void OUTLINED_FUNCTION_1_60()
{
  JUMPOUT(0x2207CC9B0);
}

uint64_t OUTLINED_FUNCTION_3_58(uint64_t result)
{
  *(_QWORD *)(result + 4104) = 0;
  *(_DWORD *)(result + 4112) = 0;
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 4144) = 0;
  return result;
}

void OUTLINED_FUNCTION_4_54()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t OUTLINED_FUNCTION_5_51(uint64_t result)
{
  *(_QWORD *)(result + 4104) = 0;
  *(_DWORD *)(result + 4112) = 0;
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 4144) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_9_49(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  return UserDict::proofCharacter(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_10_48()
{
  const char *v0;

  return chmod(v0, 0x180u);
}

uint64_t OUTLINED_FUNCTION_11_46()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(v1 + 208) + 112;
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_44(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  *v1 = a1;
  return hashIterRef(v2);
}

size_t OUTLINED_FUNCTION_13_42()
{
  const char *v0;

  return strlen(v0);
}

void OUTLINED_FUNCTION_14_42()
{
  int **v0;

  UserDict::~UserDict(v0);
}

void settvar_s(uint64_t a1, unsigned __int8 *a2, unsigned __int8 a3)
{
  void *v4;
  uint64_t v5;
  int v6;
  unsigned __int8 v7;

  v7 = a3;
  OUTLINED_FUNCTION_1_61();
  if (v6)
    v4 = OUTLINED_FUNCTION_8_51();
  OUTLINED_FUNCTION_7_52((uint64_t)v4, *a2, v5, &v7);
  OUTLINED_FUNCTION_6_52();
}

void settvar_l(uint64_t a1, unsigned __int8 *a2, __int16 a3)
{
  void *v4;
  uint64_t v5;
  int v6;
  __int16 v7;

  v7 = a3;
  OUTLINED_FUNCTION_1_61();
  if (v6)
    v4 = OUTLINED_FUNCTION_8_51();
  OUTLINED_FUNCTION_7_52((uint64_t)v4, *a2, v5, (unsigned __int8 *)&v7);
  OUTLINED_FUNCTION_6_52();
}

void settvar_lng(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v7 = a3;
  OUTLINED_FUNCTION_1_61();
  if (v6)
    v4 = OUTLINED_FUNCTION_8_51();
  OUTLINED_FUNCTION_7_52((uint64_t)v4, *a2, v5, (unsigned __int8 *)&v7);
  OUTLINED_FUNCTION_6_52();
}

void settvar_i(uint64_t a1, unsigned __int8 *a2, __int16 a3)
{
  void *v4;
  uint64_t v5;
  int v6;
  __int16 v7;

  v7 = a3;
  OUTLINED_FUNCTION_1_61();
  if (v6)
    v4 = OUTLINED_FUNCTION_8_51();
  OUTLINED_FUNCTION_7_52((uint64_t)v4, *a2, v5, (unsigned __int8 *)&v7);
  OUTLINED_FUNCTION_6_52();
}

void settvar_f(double a1, uint64_t a2, unsigned __int8 *a3)
{
  void *v4;
  uint64_t v5;
  int v6;
  double v7;

  v7 = a1;
  OUTLINED_FUNCTION_1_61();
  if (v6)
    v4 = OUTLINED_FUNCTION_8_51();
  OUTLINED_FUNCTION_7_52((uint64_t)v4, *a3, v5, (unsigned __int8 *)&v7);
  OUTLINED_FUNCTION_6_52();
}

void settvar_v(int a1, unsigned __int8 *a2, __int16 *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  unsigned __int8 *v15;

  OUTLINED_FUNCTION_1_61();
  if (v14)
    v6 = OUTLINED_FUNCTION_9_50();
  OUTLINED_FUNCTION_12_45((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13, 0);
  vinitflds(a1, *a2, a2 + 16, v15);
  if ((*a3 & 0x80000000) == 0)
    OUTLINED_FUNCTION_16_41();
}

void copyvar(uint64_t a1, unsigned __int16 *a2, __int16 *a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15[2];
  void *v16[2];

  OUTLINED_FUNCTION_1_61();
  if (v6)
    OUTLINED_FUNCTION_9_50();
  v16[0] = 0;
  v16[1] = 0;
  v15[1] = 0;
  vinitloc_new(a1, (uint64_t)v16, a2);
  OUTLINED_FUNCTION_12_45(v7, v8, v9, v10, v11, v12, v13, v14, 0);
  vassign(a1, v16, v15);
  if (((__int16)*a2 & 0x80000000) == 0)
    a2[1] = -1;
  if ((*a3 & 0x80000000) == 0)
    OUTLINED_FUNCTION_16_41();
}

void c_assvar(uint64_t a1, unsigned __int16 *a2)
{
  uint64_t v3;
  int v4;

  OUTLINED_FUNCTION_1_61();
  if (v4)
    save_var(v3, a2);
  if (((__int16)*a2 & 0x80000000) == 0)
    OUTLINED_FUNCTION_16_41();
}

void assok(uint64_t a1, __int16 *a2)
{
  if ((*a2 & 0x80000000) == 0)
    a2[1] = -1;
}

void noass(uint64_t a1, __int16 *a2)
{
  if ((*a2 & 0x80000000) == 0)
    a2[1] = -1;
}

__n128 savescptr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  __n128 result;

  v6 = *(_QWORD *)(a1 + 192);
  if (*(_BYTE *)(v6 + 8096))
  {
    OUTLINED_FUNCTION_9_50();
    v6 = *(_QWORD *)(a1 + 192);
  }
  *(_QWORD *)(a3 + 8) = *(_QWORD *)(v6 + 8080);
  v7 = *(_QWORD *)(a1 + 200);
  v8 = *(int *)(v7 + 288);
  v9 = *(_QWORD *)(v7 + 1720) - v8;
  v10 = *(_DWORD *)(v7 + 1728);
  *(_BYTE *)v9 = 3;
  *(_QWORD *)(v9 + 8) = a2;
  v11 = *(int *)(v7 + 284);
  v12 = v9 - v11;
  *(_QWORD *)(v7 + 1720) = v12;
  *(_DWORD *)(v7 + 1728) = v10 - (v8 + v11);
  *(_BYTE *)v12 = 1;
  result = *(__n128 *)(v6 + 8080);
  *(__n128 *)(v12 + 8) = result;
  return result;
}

uint64_t savetok(uint64_t a1, __int16 *a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v6;
  uint64_t result;
  unsigned __int8 *v8;
  const void *v9;
  uint64_t v10;
  void *v11[2];

  v11[0] = 0;
  v11[1] = 0;
  v10 = 0;
  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 192) + 8088) + 3;
  v4 = (_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 8080) + 8 * v3) & 0xFFFFFFFFFFFFFFFCLL);
  if (!v4)
  {
LABEL_4:
    v6 = 1;
    result = 1;
    if (*a2 < 0)
      return result;
    goto LABEL_5;
  }
  while ((*v4 & 2) != 0)
  {
    v4 = (_BYTE *)(*(_QWORD *)&v4[8 * v3] & 0xFFFFFFFFFFFFFFFCLL);
    if (!v4)
      goto LABEL_4;
  }
  OUTLINED_FUNCTION_14_43(a1, (uint64_t)a2);
  v8 = (unsigned __int8 *)(*(_QWORD *)(a1 + 192) + 8088);
  LOWORD(v10) = *v8;
  v9 = v4 + 16;
  BYTE2(v10) = 0;
  if (v8[8])
    vpush_var(a1, (uint64_t)v11);
  vassign(a1, v11, &v9);
  v6 = 0;
  result = 0;
  if ((*a2 & 0x80000000) == 0)
  {
LABEL_5:
    a2[1] = -1;
    return v6;
  }
  return result;
}

void dur_ass(uint64_t a1, char a2, __int16 *a3, int a4)
{
  unint64_t *v6;
  unint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12[2];
  void *v13[2];

  v6 = (unint64_t *)(a1 + 112);
  v7 = (unint64_t *)(a1 + 144);
  v8 = a2;
  v9 = vrange_2pt(a1, (unint64_t *)(a1 + 112), a1 + 144, v8, a4);
  if ((_DWORD)v9)
  {
    if (*a3 < 0)
      return;
  }
  else
  {
    v12[0] = 0;
    v12[1] = 0;
    v11 = 0;
    v13[0] = &v11;
    v13[1] = (void *)65533;
    OUTLINED_FUNCTION_14_43(v9, v10);
    vassign(a1, v13, v12);
    vdur_ass(a1, v6, v7, v8, v11);
    if (*a3 < 0)
      return;
  }
  OUTLINED_FUNCTION_16_41();
}

void setscan_l(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char v3;

  if (!OUTLINED_FUNCTION_2_60(a1))
  {
    if (*v1)
    {
      OUTLINED_FUNCTION_4_55();
      if ((v3 & 1) != 0)
        OUTLINED_FUNCTION_11_47(v2);
    }
  }
  OUTLINED_FUNCTION_0_66();
}

uint64_t vtstsnc_tv(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  uint64_t result;

  if ((*(_BYTE *)(a2 + 24) & 1) == 0)
  {
    v3 = vnormalize(a1, a2);
    result = 1;
    if (v3 < 3)
      return result;
    *(_BYTE *)(a2 + 24) = 1;
  }
  return 0;
}

void setscan_r(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char v3;

  if (!OUTLINED_FUNCTION_2_60(a1))
  {
    if (*v1)
    {
      OUTLINED_FUNCTION_4_55();
      if ((v3 & 1) != 0)
        OUTLINED_FUNCTION_10_49(v2);
    }
  }
  OUTLINED_FUNCTION_0_66();
}

void lpta_loadp_setscan_l(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  char v4;

  if (!OUTLINED_FUNCTION_3_59(a1, a2))
  {
    if (*v2)
    {
      OUTLINED_FUNCTION_4_55();
      if ((v4 & 1) != 0)
        OUTLINED_FUNCTION_11_47(v3);
    }
  }
  OUTLINED_FUNCTION_0_66();
}

void lpta_loadp_setscan_r(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  char v4;

  if (!OUTLINED_FUNCTION_3_59(a1, a2))
  {
    if (*v2)
    {
      OUTLINED_FUNCTION_4_55();
      if ((v4 & 1) != 0)
        OUTLINED_FUNCTION_10_49(v3);
    }
  }
  OUTLINED_FUNCTION_0_66();
}

void rpta_loadp_setscan_l(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  if (!OUTLINED_FUNCTION_5_52(a1, a2))
  {
    if (*v2)
    {
      OUTLINED_FUNCTION_17_41();
      if ((v4 & 1) != 0)
      {
        OUTLINED_FUNCTION_13_43(v3);
        *(_WORD *)(v5 + 1) = 256;
      }
    }
  }
  OUTLINED_FUNCTION_0_66();
}

void rpta_loadp_setscan_r(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  if (!OUTLINED_FUNCTION_5_52(a1, a2))
  {
    if (*v2)
    {
      OUTLINED_FUNCTION_17_41();
      if ((v4 & 1) != 0)
      {
        OUTLINED_FUNCTION_13_43(v3);
        *(_WORD *)(v5 + 1) = 257;
      }
    }
  }
  OUTLINED_FUNCTION_0_66();
}

void setscan_nof_l(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;

  if (!OUTLINED_FUNCTION_2_60(a1))
  {
    if (*v1)
    {
      OUTLINED_FUNCTION_4_55();
      if ((v3 & 1) != 0)
      {
        OUTLINED_FUNCTION_15_42(v2);
        *(_WORD *)(v4 + 1) = 0;
      }
    }
  }
  OUTLINED_FUNCTION_0_66();
}

void setscan_nof_r(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char v3;
  __int16 v4;
  uint64_t v5;

  if (!OUTLINED_FUNCTION_2_60(a1))
  {
    if (*v1)
    {
      OUTLINED_FUNCTION_4_55();
      if ((v3 & 1) != 0)
      {
        OUTLINED_FUNCTION_15_42(v2);
        *(_WORD *)(v5 + 1) = v4;
      }
    }
  }
  OUTLINED_FUNCTION_0_66();
}

uint64_t OUTLINED_FUNCTION_2_60(uint64_t a1)
{
  return vtstsnc_tv(a1, a1 + 112);
}

uint64_t OUTLINED_FUNCTION_3_59(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 136) = 1;
  *(_QWORD *)(a1 + 128) = 0;
  return vtstsnc_tv(a1, a1 + 112);
}

uint64_t OUTLINED_FUNCTION_5_52(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a1 + 168) = 1;
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 128) = 0;
  return vtstsnc_tv(a1, a1 + 112);
}

void *OUTLINED_FUNCTION_7_52(uint64_t a1, unsigned int a2, uint64_t a3, unsigned __int8 *a4)
{
  void *v4;
  int v5;

  return vinitflds(v5, a2, v4, a4);
}

void *OUTLINED_FUNCTION_8_51()
{
  unsigned __int16 *v0;
  uint64_t v1;

  return save_var(v1, v0);
}

void *OUTLINED_FUNCTION_9_50()
{
  unsigned __int16 *v0;
  uint64_t v1;

  return save_var(v1, v0);
}

void OUTLINED_FUNCTION_10_49(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  *(_QWORD *)(v1 + 8080) = a1;
  *(_BYTE *)(v1 + 8088) = v2;
  *(_WORD *)(v1 + 8089) = 257;
}

void OUTLINED_FUNCTION_11_47(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  *(_QWORD *)(v1 + 8080) = a1;
  *(_BYTE *)(v1 + 8088) = v2;
  *(_WORD *)(v1 + 8089) = 256;
}

void OUTLINED_FUNCTION_12_45(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned __int16 *v9;
  uint64_t v10;

  vinitloc_new(v10, (uint64_t)&a9, v9);
}

void OUTLINED_FUNCTION_13_43(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  *(_QWORD *)(v1 + 8080) = a1;
  *(_BYTE *)(v1 + 8088) = v2;
}

void OUTLINED_FUNCTION_14_43(uint64_t a1, uint64_t a2, ...)
{
  unsigned __int16 *v2;
  uint64_t v3;
  va_list va;

  va_start(va, a2);
  vinitloc_new(v3, (uint64_t)va, v2);
}

void OUTLINED_FUNCTION_15_42(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  *(_QWORD *)(v1 + 8080) = a1;
  *(_BYTE *)(v1 + 8088) = v2;
}

void OUTLINED_FUNCTION_16_41()
{
  uint64_t v0;

  *(_WORD *)(v0 + 2) = -1;
}

void chstream(_QWORD *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  while (1)
  {
    v6 = a1[24];
    if ((*(_QWORD *)(*(_QWORD *)(v6 + 8080) + 8 * (int)(*(_DWORD *)(v6 + 9084) + a3)) & 1) != 0)
      break;
    if (!OUTLINED_FUNCTION_33_36(a1))
      goto LABEL_5;
  }
  v7 = a1[25];
  v8 = *(int *)(v7 + 288);
  v9 = *(_QWORD *)(v7 + 1720) - v8;
  *(_BYTE *)v9 = 3;
  v10 = *(_DWORD *)(v7 + 1728);
  *(_QWORD *)(v9 + 8) = a2;
  v11 = *(int *)(v7 + 284);
  v12 = v9 - v11;
  *(_QWORD *)(v7 + 1720) = v12;
  *(_DWORD *)(v7 + 1728) = v10 - (v8 + v11);
  *(_BYTE *)v12 = 1;
  *(_OWORD *)(v12 + 8) = *(_OWORD *)(v6 + 8080);
  *(_BYTE *)(a1[35] + *(unsigned __int8 *)(a1[33] + a3)) = 1;
  *(_BYTE *)(a1[24] + 8088) = a3;
LABEL_5:
  OUTLINED_FUNCTION_19_41();
}

BOOL advanc(_QWORD *a1)
{
  return OUTLINED_FUNCTION_33_36(a1) == 0;
}

BOOL advance_tok()
{
  return vscanadvOverToken() == 0;
}

void conj_merge(uint64_t a1, uint64_t a2)
{
  _BYTE *v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  unsigned __int8 *v8;
  uint64_t v9;
  int v10;

  v4 = *(_BYTE **)(a2 + 8);
  visleft(a1, *(_QWORD *)(*(_QWORD *)(a1 + 192) + 8080), (unint64_t)v4);
  v5 = *(_QWORD *)(a1 + 192);
  v6 = *(_QWORD *)(v5 + 8080);
  if (v7)
  {
    v8 = (unsigned __int8 *)(v5 + 8088);
    while (v4 != (_BYTE *)v6)
    {
      if (!v4 || (*v4 & 2) == 0)
        goto LABEL_17;
      v4 = (_BYTE *)(*(_QWORD *)&v4[8 * *v8 + 24] & 0xFFFFFFFFFFFFFFFCLL);
    }
    if (!v8[1])
LABEL_16:
      *(_QWORD *)(a2 + 8) = v6;
  }
  else
  {
    visright(a1, v6, (uint64_t)v4);
    v9 = *(_QWORD *)(a1 + 192);
    v6 = *(_QWORD *)(v9 + 8080);
    if (v10)
    {
      while (v4 != (_BYTE *)v6)
      {
        if (!v4 || (*v4 & 2) == 0)
          goto LABEL_17;
        v4 = (_BYTE *)(*(_QWORD *)&v4[8 * *(_DWORD *)(v9 + 9084) + 8 * *(unsigned __int8 *)(v9 + 8088)] & 0xFFFFFFFFFFFFFFFCLL);
      }
      if (*(_BYTE *)(v9 + 8089) == 1)
        goto LABEL_16;
    }
  }
LABEL_17:
  OUTLINED_FUNCTION_19_41();
}

uint64_t addfence(uint64_t a1, char a2)
{
  return SETFENCE(a1, *(_QWORD *)(a1 + 112), a2);
}

uint64_t remfence(uint64_t a1, char a2)
{
  return UNSETFENCE(a1, *(_QWORD *)(a1 + 112), a2);
}

void proj_def_mult(uint64_t a1, unsigned int a2, unsigned __int8 *a3, uint64_t a4)
{
  uint64_t v7;
  unsigned int v8;

  v7 = a2;
  if (a2)
  {
    do
    {
      *(_BYTE *)(a1 + 136) = 1;
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a4 + 8);
      *(_QWORD *)(a1 + 128) = 0;
      v8 = *a3++;
      proj_def(a1, v8);
      --v7;
    }
    while (v7);
  }
}

void proj_def(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  int v4;
  int v5;

  OUTLINED_FUNCTION_13_44(a1);
  if (!v4 || (vdef_proj(v2, *(_QWORD *)(v2 + 112), a2), !v5))
    OUTLINED_FUNCTION_5_53(v2);
  OUTLINED_FUNCTION_29_36();
}

void proj_l(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;

  vsync_tv(a1, a1 + 144);
  if (!v2 || (v3 = OUTLINED_FUNCTION_34_35(), vproj_l(v3, v4, v5, v6), !v7))
    OUTLINED_FUNCTION_5_53(a1);
  OUTLINED_FUNCTION_29_36();
}

void proj_r(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  int v7;

  OUTLINED_FUNCTION_13_44(a1);
  if (!v2 || (v3 = OUTLINED_FUNCTION_34_35(), vproj_r(v3, v4, v5, v6), !v7))
    OUTLINED_FUNCTION_5_53(v1);
  OUTLINED_FUNCTION_29_36();
}

void merge(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_13_44(a1);
  if (!v2 || (vsync_tv(v1, v1 + 144), !v3))
    OUTLINED_FUNCTION_31_36();
  if (!vmergable(v1, *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 144)))
    OUTLINED_FUNCTION_31_36();
  vmerge(v1, *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 144));
}

uint64_t initdelta(uint64_t a1, unsigned int a2, char *a3)
{
  unsigned int i;
  int v6;
  uint64_t v8;
  int v9;

  if (a2)
  {
    if (*(unsigned __int8 *)(a1 + 288) == a2)
    {
      freeDeltaHeapTo(a1, *(_QWORD *)(*(_QWORD *)(a1 + 200) + 8), 0);
      deltaReinit(a1, 1);
    }
    else
    {
      v8 = a2;
      do
      {
        vinit_stm(a1, *a3);
        if (!v9)
          OUTLINED_FUNCTION_31_36();
        --v8;
        ++a3;
      }
      while (v8);
    }
  }
  else
  {
    for (i = 0; i < *(unsigned __int8 *)(a1 + 288); ++i)
    {
      vinit_stm(a1, (char)i);
      if (!v6)
        OUTLINED_FUNCTION_31_36();
    }
  }
  return vscaninit(a1);
}

void delete_1pt(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  int v4;

  OUTLINED_FUNCTION_13_44(a1);
  if (!v4 || !vdel_1pt(v2, a2, *(_QWORD *)(v2 + 112)))
    OUTLINED_FUNCTION_5_53(v2);
  OUTLINED_FUNCTION_29_36();
}

uint64_t delete_2pt(uint64_t a1, char a2, int a3)
{
  if (vrange_2pt(a1, (unint64_t *)(a1 + 112), a1 + 144, a2, a3))
    return 1;
  vdel_2pt((uint64_t *)a1, a2, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 144));
  return 0;
}

void mark_v(uint64_t a1, char a2, uint64_t a3, __int16 *a4, int a5)
{
  unsigned int v5;
  uint64_t v6;
  int v8;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v8 = a3;
  if (OUTLINED_FUNCTION_14_44(a1, a2, a3, (uint64_t)a4, a5))
  {
    if ((*a4 & 0x80000000) == 0)
LABEL_3:
      a4[1] = -1;
  }
  else
  {
    v25 = 0;
    v26 = 0;
    OUTLINED_FUNCTION_9_51(v6, (uint64_t)&v25);
    if ((unsigned __int16)v26 == *(unsigned __int16 *)&vstmtbl[12 * v5 + 1][40 * v8 + 30])
    {
      v17 = OUTLINED_FUNCTION_10_50(v9, v10, v11, v12, v13, v14, v15, v16, v25);
      if ((unsigned __int16)v26 >= 0xFFFAu)
        OUTLINED_FUNCTION_10_50(v17, v18, v19, v20, v21, v22, v23, v24, v25);
    }
    if ((*a4 & 0x80000000) == 0)
      goto LABEL_3;
  }
  OUTLINED_FUNCTION_2_61();
}

void mark_s()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char v10;

  OUTLINED_FUNCTION_28_36();
  v10 = v1;
  if (!OUTLINED_FUNCTION_6_53(v2, v3, v4, v1, v5))
  {
    OUTLINED_FUNCTION_0_67();
    if (v9 == -1)
      OUTLINED_FUNCTION_4_56(v6, v7, v8, *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 144), (uint64_t)&v10);
  }
  OUTLINED_FUNCTION_2_61();
}

void mark_l(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  __int16 v10;

  v10 = a4;
  if (!OUTLINED_FUNCTION_6_53(a1, a2, a3, a4, a5))
  {
    OUTLINED_FUNCTION_0_67();
    if (v9 == -2)
      OUTLINED_FUNCTION_4_56(v6, v7, v8, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 144), (uint64_t)&v10);
  }
  OUTLINED_FUNCTION_2_61();
}

void mark_lng()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  OUTLINED_FUNCTION_28_36();
  v10 = v1;
  if (!OUTLINED_FUNCTION_6_53(v2, v3, v4, v1, v5))
  {
    OUTLINED_FUNCTION_0_67();
    if (v9 == -3)
      OUTLINED_FUNCTION_4_56(v6, v7, v8, *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 144), (uint64_t)&v10);
  }
  OUTLINED_FUNCTION_2_61();
}

void mark_i(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  __int16 v10;

  v10 = a4;
  if (!OUTLINED_FUNCTION_6_53(a1, a2, a3, a4, a5))
  {
    OUTLINED_FUNCTION_0_67();
    if (v9 == -4)
      OUTLINED_FUNCTION_4_56(v6, v7, v8, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 144), (uint64_t)&v10);
  }
  OUTLINED_FUNCTION_2_61();
}

void mark_f()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  OUTLINED_FUNCTION_28_36();
  v11 = v1;
  if (!OUTLINED_FUNCTION_6_53(v2, v3, v4, v5, v6))
  {
    OUTLINED_FUNCTION_0_67();
    if (v10 == -5)
      OUTLINED_FUNCTION_4_56(v7, v8, v9, *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 144), (uint64_t)&v11);
  }
  OUTLINED_FUNCTION_2_61();
}

void insert_2pt(uint64_t a1, char a2, uint64_t a3, _BYTE *a4, int a5)
{
  unsigned int v5;
  uint64_t *v6;
  int v8;

  v8 = a3;
  if (!OUTLINED_FUNCTION_14_44(a1, a2, a3, (uint64_t)a4, a5))
  {
    visnonseq((uint64_t)v6, v5, v6[14], v6[18]);
    ins_tokens(v6, v5, a4, v8);
  }
  OUTLINED_FUNCTION_19_41();
}

void insert_2ptv()
{
  __int16 *v0;
  int v1;
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
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
  int v20;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _BYTE v38[3];

  OUTLINED_FUNCTION_11_48();
  if (vrange_2pt(v2, v3, v4, v5, v6))
  {
    if ((*v0 & 0x80000000) == 0)
LABEL_3:
      OUTLINED_FUNCTION_22_40();
  }
  else
  {
    OUTLINED_FUNCTION_27_36();
    if (v1 < 0 && (v7 = OUTLINED_FUNCTION_16_42(), v1 != (_DWORD)v7))
    {
      OUTLINED_FUNCTION_16_42();
      OUTLINED_FUNCTION_23_39();
      if (!(!v23 & v22))
        __asm { BR              X10 }
      OUTLINED_FUNCTION_1_62((uint64_t)vstmtbl, v32, v34, v36, *(__int16 *)v38, v38[2]);
      OUTLINED_FUNCTION_12_46(v24, v25, v26, v27, v28, v29, v30, v31, v33, v35, v37);
      OUTLINED_FUNCTION_25_39();
    }
    else
    {
      OUTLINED_FUNCTION_3_60(v7, v8, v9, v10, v11, v12, v13, v14, v32);
      OUTLINED_FUNCTION_24_39();
    }
    OUTLINED_FUNCTION_20_41(v15, v16, v17, v18, v19);
    if (!v20)
      OUTLINED_FUNCTION_15_43();
    if ((*v0 & 0x80000000) == 0)
      goto LABEL_3;
  }
}

void insert_l()
{
  uint64_t v0;
  int v1;
  int v2;

  OUTLINED_FUNCTION_32_36();
  vrange_l();
  if (!v1 || (OUTLINED_FUNCTION_18_41(), !v2))
    OUTLINED_FUNCTION_7_53(v0);
  OUTLINED_FUNCTION_8_52();
}

void insert_r()
{
  uint64_t v0;
  int v1;
  int v2;

  OUTLINED_FUNCTION_32_36();
  vrange_r();
  if (!v1 || (OUTLINED_FUNCTION_18_41(), !v2))
    OUTLINED_FUNCTION_7_53(v0);
  OUTLINED_FUNCTION_8_52();
}

void insert_lv(uint64_t a1, uint64_t a2, __int16 *a3)
{
  int v3;
  int v5;
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
  int v19;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _BYTE v37[3];

  vrange_l();
  if (!v5)
    OUTLINED_FUNCTION_15_43();
  OUTLINED_FUNCTION_27_36();
  if (v3 < 0 && (v6 = OUTLINED_FUNCTION_16_42(), v3 != (_DWORD)v6))
  {
    OUTLINED_FUNCTION_16_42();
    OUTLINED_FUNCTION_23_39();
    if (!(!v22 & v21))
      __asm { BR              X10 }
    OUTLINED_FUNCTION_1_62((uint64_t)vstmtbl, v31, v33, v35, *(__int16 *)v37, v37[2]);
    OUTLINED_FUNCTION_12_46(v23, v24, v25, v26, v27, v28, v29, v30, v32, v34, v36);
    OUTLINED_FUNCTION_25_39();
  }
  else
  {
    OUTLINED_FUNCTION_3_60(v6, v7, v8, v9, v10, v11, v12, v13, v31);
    OUTLINED_FUNCTION_24_39();
  }
  OUTLINED_FUNCTION_20_41(v14, v15, v16, v17, v18);
  if (!v19)
    OUTLINED_FUNCTION_15_43();
  if ((*a3 & 0x80000000) == 0)
    OUTLINED_FUNCTION_22_40();
  OUTLINED_FUNCTION_21_40();
}

void insert_rv()
{
  __int16 *v0;
  int v1;
  int v2;
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
  int v16;
  char v18;
  char v19;
  uint64_t v20;

  OUTLINED_FUNCTION_11_48();
  vrange_r();
  if (!v2)
    OUTLINED_FUNCTION_15_43();
  OUTLINED_FUNCTION_27_36();
  if (v1 < 0)
  {
    v3 = OUTLINED_FUNCTION_16_42();
    if (v1 != (_DWORD)v3)
    {
      OUTLINED_FUNCTION_16_42();
      OUTLINED_FUNCTION_23_39();
      if (!(!v19 & v18))
        __asm { BR              X10 }
      OUTLINED_FUNCTION_15_43();
    }
  }
  OUTLINED_FUNCTION_3_60(v3, v4, v5, v6, v7, v8, v9, v10, v20);
  OUTLINED_FUNCTION_24_39();
  OUTLINED_FUNCTION_20_41(v11, v12, v13, v14, v15);
  if (!v16)
    OUTLINED_FUNCTION_15_43();
  if ((*v0 & 0x80000000) == 0)
    OUTLINED_FUNCTION_22_40();
  OUTLINED_FUNCTION_21_40();
}

void generate(uint64_t a1, int a2)
{
  uint64_t v4;
  unint64_t *v5;
  int v6;

  v4 = a1 + 112;
  v5 = (unint64_t *)(a1 + 144);
  vprt_range(a1, a1 + 112, a1 + 144);
  if (!v6 || !vgen(a1, v4, v5, *(_QWORD *)(a1 + 192) + 8160, a2))
    OUTLINED_FUNCTION_7_53(a1);
  OUTLINED_FUNCTION_8_52();
}

void gendef_framedur()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  const void *v12;

  OUTLINED_FUNCTION_37_34();
  v11 = (void *)(v0 + 8128);
  OUTLINED_FUNCTION_9_51(v1, (uint64_t)&v12);
  OUTLINED_FUNCTION_30_36(v2, v3, v4, v5, v6, v7, v8, v9, v11, 65533, v12);
  OUTLINED_FUNCTION_35_35();
  if ((v10 & 0x80000000) == 0)
    OUTLINED_FUNCTION_22_40();
  OUTLINED_FUNCTION_26_38();
}

void gendef_timestm(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_17_42(a2, *(_QWORD *)(a1 + 192));
}

void gendef_params(uint64_t a1, char a2, unsigned int a3)
{
  unsigned int v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = a3;
  v4 = *(_QWORD *)(a1 + 192);
  *(_BYTE *)(v4 + 8137) = a2;
  if ((*(_BYTE *)(v4 + 8152) & 4) != 0)
  {
    v5 = *(_QWORD **)(v4 + 8144);
  }
  else
  {
    v5 = dynaBufNew(a3);
    *(_QWORD *)(v4 + 8144) = v5;
  }
  dynaBufReset((uint64_t)v5);
  for (; v3; --v3)
    OUTLINED_FUNCTION_36_35(*(uint64_t **)(v4 + 8144));
  *(_BYTE *)(v4 + 8152) |= 4u;
  OUTLINED_FUNCTION_8_52();
}

void gencur_framedur()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  const void *v12;

  OUTLINED_FUNCTION_37_34();
  v11 = (void *)(v0 + 8160);
  OUTLINED_FUNCTION_9_51(v1, (uint64_t)&v12);
  OUTLINED_FUNCTION_30_36(v2, v3, v4, v5, v6, v7, v8, v9, v11, 65533, v12);
  OUTLINED_FUNCTION_35_35();
  if ((v10 & 0x80000000) == 0)
    OUTLINED_FUNCTION_22_40();
  OUTLINED_FUNCTION_26_38();
}

void gencur_timestm(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_17_42(a2, *(_QWORD *)(a1 + 192));
}

void gencur_params(uint64_t a1, char a2, unsigned int a3)
{
  unsigned int v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = a3;
  v4 = *(_QWORD *)(a1 + 192);
  *(_BYTE *)(v4 + 8169) = a2;
  if ((*(_BYTE *)(v4 + 8184) & 4) != 0)
  {
    v5 = *(_QWORD **)(v4 + 8176);
  }
  else
  {
    v5 = dynaBufNew(a3);
    *(_QWORD *)(v4 + 8176) = v5;
  }
  dynaBufReset((uint64_t)v5);
  for (; v3; --v3)
    OUTLINED_FUNCTION_36_35(*(uint64_t **)(v4 + 8176));
  *(_BYTE *)(v4 + 8184) |= 4u;
  OUTLINED_FUNCTION_8_52();
}

void OUTLINED_FUNCTION_1_62(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5, char a6)
{
  unsigned __int16 *v6;
  uint64_t v7;
  unsigned int v8;

  a6 = *(_BYTE *)(*(_QWORD *)(a1 + 96 * v8 + 8) + 32);
  vinitloc_new(v7, (uint64_t)&a2, v6);
}

void OUTLINED_FUNCTION_3_60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned __int16 *v9;
  uint64_t v10;

  vinitloc_new(v10, (uint64_t)&a9, v9);
}

uint64_t OUTLINED_FUNCTION_4_56(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned __int8 v6;
  unsigned int v7;
  uint64_t *v8;

  return vmark(v8, v7, v6, a4, a5, a6);
}

void OUTLINED_FUNCTION_5_53(uint64_t a1)
{
  forceErrorBacktrack(a1);
}

uint64_t OUTLINED_FUNCTION_6_53(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  char v5;

  return vrange_2pt(a1, (unint64_t *)(a1 + 112), a1 + 144, v5, a5);
}

void OUTLINED_FUNCTION_7_53(uint64_t a1)
{
  forceErrorBacktrack(a1);
}

void OUTLINED_FUNCTION_9_51(uint64_t a1, uint64_t a2)
{
  unsigned __int16 *v2;

  vinitloc_new(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_10_50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned __int8 v9;
  unsigned int v10;
  uint64_t v11;

  return vmark((uint64_t *)v11, v10, v9, *(_QWORD *)(v11 + 112), *(_QWORD *)(v11 + 144), a9);
}

void OUTLINED_FUNCTION_12_46(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, uint64_t a10, void *a11)
{
  uint64_t v11;

  vassign(v11, &a11, &a9);
}

void OUTLINED_FUNCTION_13_44(uint64_t a1)
{
  vsync_tv(a1, a1 + 112);
}

uint64_t OUTLINED_FUNCTION_14_44(uint64_t a1, char a2, uint64_t a3, uint64_t a4, int a5)
{
  return vrange_2pt(a1, (unint64_t *)(a1 + 112), a1 + 144, a2, a5);
}

void OUTLINED_FUNCTION_15_43()
{
  uint64_t v0;

  forceErrorBacktrack(v0);
}

uint64_t OUTLINED_FUNCTION_16_42()
{
  int v0;

  return STMTYP(v0);
}

void OUTLINED_FUNCTION_17_42(char a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  _BYTE *v3;

  v3 = (_BYTE *)(a2 + v2);
  *v3 = a1;
  v3[16] |= 2u;
}

void OUTLINED_FUNCTION_18_41()
{
  uint64_t *v0;
  _BYTE *v1;
  int v2;
  unsigned int v3;

  ins_tokens(v0, v3, v1, v2);
}

void OUTLINED_FUNCTION_20_41(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  unsigned int v6;

  vins_tok(v5, v6, a3, a4, a5);
}

void OUTLINED_FUNCTION_22_40()
{
  uint64_t v0;

  *(_WORD *)(v0 + 2) = -1;
}

void OUTLINED_FUNCTION_30_36(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, const void *a11)
{
  uint64_t v11;

  vassign(v11, &a9, &a11);
}

void OUTLINED_FUNCTION_31_36()
{
  uint64_t v0;

  forceErrorBacktrack(v0);
}

uint64_t OUTLINED_FUNCTION_33_36(_QWORD *a1)
{
  return vscanadv(a1, 0, 1);
}

uint64_t OUTLINED_FUNCTION_34_35()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_35_35()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 24) |= 1u;
}

void OUTLINED_FUNCTION_36_35(uint64_t *a1)
{
  char *v1;

  dynaBufAddChar(a1, *v1, 0);
}

uint64_t ccode_new(uint64_t a1)
{
  void *v2;

  v2 = malloc_type_malloc(0x2460uLL, 0x10F004041F5ADEFuLL);
  *(_QWORD *)(a1 + 192) = v2;
  bzero(v2, 0x2460uLL);
  return ccode_misc_new(a1);
}

void ccode_delete(uint64_t a1)
{
  void *v2;

  if (a1)
  {
    v2 = *(void **)(a1 + 192);
    if (v2)
    {
      bzero(v2, 0x2460uLL);
      free(*(void **)(a1 + 192));
      *(_QWORD *)(a1 + 192) = 0;
    }
  }
}

uint64_t throwDeltaErrorNow(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 192) + 8012) = 1;
  return result;
}

uint64_t catchDeltaError(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 192) + 8012) = 0;
  return result;
}

uint64_t deltaErrorThrown(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 192) + 8012);
}

void forceErrorBacktrack(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 192);
  *(_BYTE *)(v1 + 8012) = 1;
  longjmp(*(int **)(v1 + 8016), 1);
}

void get_parm(uint64_t a1, uint64_t a2, __int16 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int *v10;
  uint64_t v11;
  int v12;
  double v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  __int16 *v18;
  _WORD *v19;
  __int16 *v20;

  *(_WORD *)a2 = a4;
  switch((__int16)a4)
  {
    case -6:
      *(_QWORD *)(a2 + 8) = *((_QWORD *)a3 + 1);
      v10 = *(int **)(a1 + 192);
      v11 = *v10;
      if ((int)v11 <= 998)
      {
        *v10 = v11 + 1;
        *(_QWORD *)&v10[2 * v11 + 2] = a2;
      }
      return;
    case -5:
      v12 = *a3;
      switch(v12)
      {
        case -5:
          v13 = OUTLINED_FUNCTION_4_57();
          goto LABEL_18;
        case -4:
          v13 = (double)a3[1];
          goto LABEL_18;
        case -3:
          v13 = (double)COERCE__INT64(OUTLINED_FUNCTION_4_57());
LABEL_18:
          *(double *)(a2 + 8) = v13;
          return;
      }
      if ((v12 & 0x80000000) == 0)
      {
        OUTLINED_FUNCTION_2_62(a1, a2, (uint64_t)a3, a4, a5, a6, a7, a8, 0);
        *(double *)(a2 + 8) = (double)*v18;
        goto LABEL_31;
      }
      return;
    case -4:
      v14 = *a3;
      if (v14 == -5)
      {
        v17 = (int)OUTLINED_FUNCTION_4_57();
      }
      else
      {
        if (v14 != -4)
        {
          if (v14 == -3)
          {
            *(_WORD *)(a2 + 2) = *((_QWORD *)a3 + 1);
          }
          else if ((v14 & 0x80000000) == 0)
          {
            OUTLINED_FUNCTION_2_62(a1, a2, (uint64_t)a3, a4, a5, a6, a7, a8, 0);
            *(_WORD *)(a2 + 2) = *v19;
            goto LABEL_31;
          }
          return;
        }
        LOWORD(v17) = a3[1];
      }
      *(_WORD *)(a2 + 2) = v17;
      return;
    case -3:
      v15 = *a3;
      switch(v15)
      {
        case -5:
          v16 = (uint64_t)OUTLINED_FUNCTION_4_57();
          goto LABEL_28;
        case -4:
          v16 = a3[1];
          goto LABEL_28;
        case -3:
          v16 = *((_QWORD *)a3 + 1);
LABEL_28:
          *(_QWORD *)(a2 + 8) = v16;
          return;
      }
      if ((v15 & 0x80000000) == 0)
      {
        OUTLINED_FUNCTION_2_62(a1, a2, (uint64_t)a3, a4, a5, a6, a7, a8, 0);
        *(_QWORD *)(a2 + 8) = *v20;
LABEL_31:
        if ((*a3 & 0x80000000) == 0)
          a3[1] = -1;
      }
      return;
    default:
      return;
  }
}

void vinitloc_new(uint64_t a1, uint64_t a2, unsigned __int16 *a3)
{
  int v5;
  uint64_t v6;
  char *v7;
  char v8;
  __int16 *v9;

  v5 = (__int16)*a3;
  if (v5 < 0)
  {
    *(_WORD *)(a2 + 8) = v5;
    switch(v5)
    {
      case -6:
      case -5:
      case -3:
        v9 = (__int16 *)(a3 + 4);
        goto LABEL_9;
      case -4:
        v9 = (__int16 *)(a3 + 1);
LABEL_9:
        v8 = 0;
        goto LABEL_10;
      default:
        v8 = 0;
        goto LABEL_11;
    }
  }
  v6 = (__int16)a3[1];
  if (v6 == -1)
  {
    v8 = 0;
    *(_WORD *)(a2 + 8) = v5;
    v9 = (__int16 *)(a3 + 8);
LABEL_10:
    *(_QWORD *)a2 = v9;
  }
  else
  {
    *(_QWORD *)a2 = (*(uint64_t (**)(__int16 *))&vstmtbl[12 * *a3 + 2][8 * v6])((__int16 *)a3 + 8);
    v7 = &vstmtbl[12 * (__int16)*a3 + 1][40 * (int)v6];
    *(_WORD *)(a2 + 8) = *((_WORD *)v7 + 15);
    v8 = v7[32];
  }
LABEL_11:
  *(_BYTE *)(a2 + 10) = v8;
}

uint64_t push_ptr_init(uint64_t a1, uint64_t a2)
{
  int *v2;
  uint64_t v3;

  *(_QWORD *)(a2 + 8) = 0;
  *(_WORD *)a2 = -6;
  v2 = *(int **)(a1 + 192);
  v3 = *v2;
  if ((int)v3 > 998)
    return 0;
  *v2 = v3 + 1;
  *(_QWORD *)&v2[2 * v3 + 2] = a2;
  return 1;
}

uint64_t set_saved_ptrs(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  int *v6;
  int v7;
  int v8;
  uint64_t i;
  uint64_t v10;

  v3 = 0;
  v4 = 8 * (*(_DWORD *)(result + 16) & ~(*(int *)(result + 16) >> 31));
  while (v4 != v3)
  {
    v5 = *(_QWORD **)(*(_QWORD *)(result + 24) + v3);
    if (*v5 == a2)
      *v5 = a3;
    v3 += 8;
  }
  v6 = *(int **)(result + 192);
  v7 = v6[2002];
  v8 = *v6;
  while (v8 >= 1)
  {
    for (i = v7; i < v8; ++i)
    {
      v10 = *(_QWORD *)&v6[2 * i + 2];
      if (*(_QWORD *)(v10 + 8) == a2)
        *(_QWORD *)(v10 + 8) = a3;
    }
    v8 = v7 - 2;
    v7 = v6[2 * v7];
  }
  return result;
}

uint64_t for_loop_preamble(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 192);
  v6 = (_BYTE *)(v5 + 8088);
  *(_QWORD *)(v5 + 8056) = a3;
  *(_QWORD *)(v5 + 8064) = a2;
  *(_BYTE *)(v5 + 8096) = 0;
  *(_BYTE *)(a1 + 136) = 1;
  v7 = *(_QWORD *)(a5 + 8);
  *(_QWORD *)(a1 + 112) = v7;
  if (!v7 || (*(_QWORD *)(v7 + 8 * (*(_DWORD *)(v5 + 9084) + a4)) & 1) == 0)
    return 0;
  *(_QWORD *)(v5 + 8080) = v7;
  *v6 = a4;
  v8 = 1;
  v6[2] = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 280) + *(unsigned __int8 *)(*(_QWORD *)(a1 + 264) + a4)) = 1;
  return v8;
}

uint64_t vback(_QWORD *a1, int a2)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  int v9;
  uint64_t v10;

  if (*(_BYTE *)(a1[24] + 8012))
    return -1;
  while (2)
  {
    v5 = a1[25];
    v6 = *(_QWORD *)(v5 + 1720);
    switch(*(_BYTE *)v6)
    {
      case 0:
        OUTLINED_FUNCTION_0_68(v5);
        if (a2)
          continue;
        break;
      case 1:
        OUTLINED_FUNCTION_0_68(v5);
        *(_OWORD *)(a1[24] + 8080) = *(_OWORD *)(v6 + 8);
        continue;
      case 2:
        v7 = *(int *)(v5 + 280);
        v8 = *(int *)(v6 + 16);
        v9 = v7 + ((v8 - 1) | 3) + 1;
        *(_DWORD *)(v5 + 1728) += v9;
        *(_QWORD *)(v5 + 1720) = v6 + v9;
        memcpy(*(void **)(v6 + 8), (const void *)(v6 + v7), v8);
        continue;
      case 3:
        OUTLINED_FUNCTION_0_68(v5);
        if (a2 || !vscanadv(a1, 0, 1))
          continue;
        break;
      case 4:
        OUTLINED_FUNCTION_0_68(v5);
        a2 -= a2 > 0;
        continue;
      case 5:
        OUTLINED_FUNCTION_0_68(v5);
        *(_QWORD *)(v10 + 1760) = *(_QWORD *)(v6 + 8);
        continue;
      case 6:
        OUTLINED_FUNCTION_0_68(v5);
        ++a2;
        continue;
      default:
        return -1;
    }
    break;
  }
  return *(_QWORD *)(v6 + 8);
}

void vinitrun(int *a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = 0;
  *(_BYTE *)(*((_QWORD *)a1 + 24) + 8121) = 0;
  while (1)
  {
    v3 = *((unsigned __int8 *)a1 + 288);
    if (v2 >= v3)
      break;
    *(_BYTE *)(*((_QWORD *)a1 + 31) + v2) = 0;
    *(_BYTE *)(*((_QWORD *)a1 + 33) + v2) = *((_BYTE *)a1 + 288);
    *(_BYTE *)(*((_QWORD *)a1 + 35) + v2++) = 0;
  }
  *(_BYTE *)(*((_QWORD *)a1 + 35) + v3) = 0;
  v5 = *((_QWORD *)a1 + 24);
  v4 = (uint64_t *)*((_QWORD *)a1 + 25);
  v7 = *v4;
  v6 = v4[1];
  v8 = *((_QWORD *)a1 + 12);
  *(_QWORD *)(*((_QWORD *)a1 + 11) + 8) = v7;
  *(_QWORD *)(v8 + 8) = v6;
  *(_BYTE *)(v5 + 8152) = 0;
  *(_BYTE *)(v5 + 8184) = 0;
  *(_DWORD *)(v5 + 9296) = 0;
  v9 = *(unsigned __int8 *)(v5 + 8024);
  if (v9 == 255 || v9 == 249)
  {
    vdltinit((uint64_t)a1, 1);
    if (!v10)
      goto LABEL_11;
    v11 = (uint64_t *)*((_QWORD *)a1 + 25);
    v13 = *v11;
    v12 = v11[1];
    v14 = *((_QWORD *)a1 + 12);
    *(_QWORD *)(*((_QWORD *)a1 + 11) + 8) = v13;
    *(_QWORD *)(v14 + 8) = v12;
  }
  v15 = 0;
  v16 = 0;
  *(_DWORD *)(*((_QWORD *)a1 + 23) + 452) = 0;
  while (v16 < *a1)
  {
    OUTLINED_FUNCTION_1_63();
    ++v16;
    v15 += 16;
  }
LABEL_11:
  OUTLINED_FUNCTION_5_54();
}

void *save_var(uint64_t a1, unsigned __int16 *a2)
{
  _QWORD v4[2];

  v4[0] = 0;
  v4[1] = 0;
  vinitloc_new(a1, (uint64_t)v4, a2);
  return vpush_var(a1, (uint64_t)v4);
}

uint64_t ventproc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  *(_QWORD *)(a1 + 104) = 0;
  if (!a2)
    return 1;
  v7 = *(int **)(a1 + 192);
  v8 = *v7;
  if ((int)v8 > 998)
    return 1;
  result = 0;
  v10 = v7[2002];
  *v7 = v8 + 1;
  *(_QWORD *)&v7[2 * v8 + 2] = v10;
  v11 = *(_QWORD *)(a1 + 192);
  *(_DWORD *)(v11 + 8008) = *(_DWORD *)v11;
  *(_QWORD *)a2 = *(_QWORD *)(v11 + 8104);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v11 + 8056);
  v12 = *(_QWORD *)(a1 + 192);
  v13 = *(_QWORD *)(a1 + 200);
  *(_BYTE *)(a2 + 48) = *(_BYTE *)(v12 + 8096);
  v14 = *(_QWORD *)(v13 + 1720);
  *(_QWORD *)(a2 + 56) = *(_QWORD *)(v12 + 8112);
  *(_QWORD *)(a2 + 64) = v14;
  *(_QWORD *)(a2 + 72) = *(_QWORD *)(v13 + 1760);
  *(_BYTE *)(a2 + 80) = *(_BYTE *)(v12 + 8121);
  *(_QWORD *)(a2 + 88) = *(_QWORD *)(v12 + 8016);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(v12 + 8080);
  v15 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(a2 + 112) = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 128) = v15;
  v16 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(a2 + 144) = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 160) = v16;
  v17 = *(_QWORD *)(a1 + 192);
  v18 = *(_QWORD *)(a1 + 200);
  *(_BYTE *)(a2 + 176) = *(_BYTE *)(v17 + 8120);
  *(_BYTE *)(a2 + 177) = *(_BYTE *)(v18 + 272);
  v19 = *(int *)(v18 + 276);
  v20 = *(_QWORD *)(v18 + 1720) - v19;
  LODWORD(v14) = *(_DWORD *)(v18 + 1728);
  *(_QWORD *)(v18 + 1720) = v20;
  *(_DWORD *)(v18 + 1728) = v14 - v19;
  *(_BYTE *)v20 = 7;
  v21 = *(_QWORD *)(a1 + 248);
  *(_QWORD *)(a1 + 248) = a4;
  v22 = *(_QWORD *)(a1 + 264);
  *(_QWORD *)(v20 + 8) = a2;
  *(_QWORD *)(v20 + 16) = v22;
  *(_QWORD *)(a1 + 264) = a3;
  v23 = *(_QWORD *)(a1 + 280);
  *(_QWORD *)(v20 + 24) = v21;
  *(_QWORD *)(v20 + 32) = v23;
  *(_QWORD *)(a1 + 280) = a5;
  *(_QWORD *)(v17 + 8112) = v20;
  *(_QWORD *)(v17 + 8016) = a6;
  return result;
}

void vretproc(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 192);
  if (*(int *)v2 >= 1)
  {
    v3 = *(int *)(v2 + 8008) - 1;
    *(_DWORD *)v2 = v3;
    *(_DWORD *)(v2 + 8008) = *(_QWORD *)(v2 + 8 * v3 + 8);
  }
  v4 = *(_QWORD *)(v2 + 8112);
  v5 = *(unsigned __int8 *)(v4 + *(int *)(*(_QWORD *)(a1 + 200) + 276));
  freeDeltaStackTo(a1, v4);
  v6 = *(_QWORD *)(a1 + 192);
  v7 = *(_QWORD **)(*(_QWORD *)(a1 + 200) + 1720);
  v8 = v7[2];
  *(_QWORD *)(a1 + 248) = v7[3];
  v9 = *(_QWORD *)(v4 + 8);
  *(_QWORD *)(a1 + 264) = v8;
  *(_QWORD *)(a1 + 280) = v7[4];
  *(_QWORD *)(v6 + 8104) = *(_QWORD *)v9;
  *(_OWORD *)(v6 + 8056) = *(_OWORD *)(v9 + 32);
  v10 = *(_QWORD *)(a1 + 192);
  *(_BYTE *)(v10 + 8096) = *(_BYTE *)(v9 + 48);
  v11 = *(_QWORD *)(v9 + 64);
  *(_QWORD *)(v10 + 8112) = *(_QWORD *)(v9 + 56);
  freeDeltaStackTo(a1, v11);
  v12 = *(_QWORD *)(a1 + 192);
  *(_QWORD *)(*(_QWORD *)(a1 + 200) + 1760) = *(_QWORD *)(v9 + 72);
  *(_BYTE *)(v12 + 8121) = *(_BYTE *)(v9 + 80);
  *(_QWORD *)(v12 + 8016) = *(_QWORD *)(v9 + 88);
  *(_OWORD *)(v12 + 8080) = *(_OWORD *)(v9 + 96);
  v13 = *(_OWORD *)(v9 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(v9 + 112);
  *(_OWORD *)(a1 + 128) = v13;
  v14 = *(_OWORD *)(v9 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(v9 + 144);
  *(_OWORD *)(a1 + 160) = v14;
  v15 = *(_QWORD *)(a1 + 192);
  v16 = *(_QWORD *)(a1 + 200);
  *(_BYTE *)(v15 + 8120) = *(_BYTE *)(v9 + 176);
  *(_BYTE *)(v16 + 272) = *(_BYTE *)(v9 + 177);
  *(_DWORD *)(v15 + 9296) = 0;
  if (v5 == 8)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 184) + 432) = 234;
  }
  else if (*(_BYTE *)(v15 + 8012))
  {
    forceErrorBacktrack(a1);
  }
  OUTLINED_FUNCTION_5_54();
}

uint64_t freeDeltaStackTo(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(result + 200);
  v3 = *(_QWORD *)(v2 + 1744);
  if (v3)
  {
    *(_QWORD *)(v2 + 1720) = a2;
    *(_DWORD *)(v2 + 1728) = *(_DWORD *)(v2 + 1780) + a2 - *(_DWORD *)(v3 + 32);
  }
  return result;
}

void vprt_var(uint64_t a1, int a2, __int16 *a3)
{
  uint64_t v5;
  const char *v6;
  int v7;
  char __s1[80];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  switch(*a3)
  {
    case -6:
      v5 = *((_QWORD *)a3 + 1);
      if (v5 == 1)
      {
        v6 = "dangling";
      }
      else
      {
        if (v5)
        {
          absoluteSyncNum(a1, v5);
          goto LABEL_13;
        }
        v6 = "NULL";
      }
      vf_puts(a1, a2, (uint64_t)v6, 1);
      return;
    case -5:
      __sprintf_chk(__s1, 0, 0x50uLL, "%f");
      goto LABEL_14;
    case -4:
LABEL_13:
      __sprintf_chk(__s1, 0, 0x50uLL, "%d");
      goto LABEL_14;
    case -3:
      __sprintf_chk(__s1, 0, 0x50uLL, "%ld");
      goto LABEL_14;
    default:
      v7 = a3[1];
      if (v7 == 255)
        return;
      disptok(a1, (_DWORD)a3 + 16, *a3, v7, __s1);
      if (__s1[0] == 92)
        cleanLiteral((unsigned __int8 *)__s1, 0, 0);
LABEL_14:
      vf_puts(a1, a2, (uint64_t)__s1, 1);
      return;
  }
}

void initGlobalVars(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = 0;
  v3 = 8 * (a1[4] & ~(a1[4] >> 31));
  while (v3 != v2)
    OUTLINED_FUNCTION_3_61(v2);
  v4 = 0;
  for (i = 0; i < *a1; ++i)
  {
    OUTLINED_FUNCTION_1_63();
    v4 += 16;
  }
  v6 = 0;
  v7 = 8 * (a1[1] & ~(a1[1] >> 31));
  while (v7 != v6)
    OUTLINED_FUNCTION_3_61(v6);
  v8 = 0;
  v9 = 8 * (a1[2] & ~(a1[2] >> 31));
  while (v9 != v8)
  {
    **(_WORD **)(*((_QWORD *)a1 + 6) + v8) = 0;
    v8 += 8;
  }
  v10 = 0;
  v11 = 8 * (a1[3] & ~(a1[3] >> 31));
  while (v11 != v10)
    OUTLINED_FUNCTION_3_61(v10);
}

void runtime_new(uint64_t a1)
{
  if (a1)
  {
    init_new(a1);
    ccode_new(a1);
    delta_lib_new(a1);
    dlang_new(a1);
    logio_new(a1);
    eloqc_new(a1);
  }
}

double runtime_delete(uint64_t a1)
{
  double result;

  if (a1)
  {
    init_delete(a1);
    ccode_delete(a1);
    delta_lib_delete(a1);
    dlang_delete(a1);
    logio_delete(a1);
    eloqc_delete(a1);
    result = 0.0;
    *(_OWORD *)(a1 + 216) = 0u;
    *(_OWORD *)(a1 + 200) = 0u;
    *(_OWORD *)(a1 + 184) = 0u;
  }
  return result;
}

void OUTLINED_FUNCTION_0_68(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_DWORD *)(a1 + 1728) += v1;
  *(_QWORD *)(a1 + 1720) = v2 + v1;
}

void OUTLINED_FUNCTION_1_63()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;
  uint64_t v3;
  _WORD *v4;
  size_t v5;

  v3 = *(_QWORD *)(v0 + 32) + v1;
  v4 = *(_WORD **)v3;
  v5 = *(int *)(v3 + 12);
  *v4 = *(_DWORD *)(v3 + 8);
  v4[1] = v2;
  bzero(v4 + 8, v5);
}

void OUTLINED_FUNCTION_2_62(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned __int16 *v9;

  vinitloc_new(a1, (uint64_t)&a9, v9);
}

void OUTLINED_FUNCTION_3_61(uint64_t a1@<X8>)
{
  uint64_t v1;

  **(_QWORD **)(v1 + a1) = 0;
}

double OUTLINED_FUNCTION_4_57()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

uint64_t startloop(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(a1 + 192) + 8064) = a2;
  result = clearDeltaStackBack(a1);
  *(_BYTE *)(*(_QWORD *)(a1 + 192) + 8096) = 0;
  return result;
}

uint64_t clearDeltaStackBack(uint64_t a1)
{
  _BYTE *v1;

  v1 = *(_BYTE **)(*(_QWORD *)(a1 + 200) + 1760);
  if (*v1 == 8)
    v1 = *(_BYTE **)(*(_QWORD *)(a1 + 192) + 8112);
  return freeDeltaStackTo_0(a1, (uint64_t)v1);
}

void forall_adv_l(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  if (OUTLINED_FUNCTION_1_64(a1, a2, a3, a4, a5, a6))
  {
    *(_BYTE *)(*(_QWORD *)(v6 + 192) + 8089) = 0;
    if (OUTLINED_FUNCTION_2_63())
    {
      clearDeltaStackBack(v6);
      v7 = *(_QWORD *)(v6 + 192);
      *(_DWORD *)(*(_QWORD *)(v6 + 200) + 256) = 0;
      *(_BYTE *)(v7 + 8096) = 1;
      OUTLINED_FUNCTION_3_62();
    }
  }
  OUTLINED_FUNCTION_4_58();
}

void forall_adv_upto_l(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  _BYTE *v7;
  char v8;
  _BYTE *v9;

  if (OUTLINED_FUNCTION_1_64(a1, a2, a3, a4, a5, a6))
  {
    *(_BYTE *)(*(_QWORD *)(v6 + 192) + 8089) = 0;
    OUTLINED_FUNCTION_9_52();
    OUTLINED_FUNCTION_7_54();
    if (!v8 && (*v7 & 2) == 0)
    {
      if (OUTLINED_FUNCTION_2_63())
      {
        OUTLINED_FUNCTION_9_52();
        OUTLINED_FUNCTION_7_54();
        if (!v8 && (*v9 & 2) == 0)
          OUTLINED_FUNCTION_0_69();
      }
    }
  }
  OUTLINED_FUNCTION_4_58();
}

void forall_adv_over_l(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  _BYTE *v7;
  char v8;
  uint64_t v9;

  if (OUTLINED_FUNCTION_1_64(a1, a2, a3, a4, a5, a6))
  {
    *(_BYTE *)(*(_QWORD *)(v6 + 192) + 8089) = 0;
    OUTLINED_FUNCTION_9_52();
    OUTLINED_FUNCTION_7_54();
    if (!v8 && (*v7 & 2) == 0 && OUTLINED_FUNCTION_2_63())
    {
      clearDeltaStackBack(v6);
      v9 = *(_QWORD *)(v6 + 192);
      *(_DWORD *)(*(_QWORD *)(v6 + 200) + 256) = 0;
      *(_BYTE *)(v9 + 8096) = 1;
      OUTLINED_FUNCTION_3_62();
    }
  }
  OUTLINED_FUNCTION_4_58();
}

void forall_adv_r(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  char v7;
  int v8;

  OUTLINED_FUNCTION_1_64(a1, a2, a3, a4, a5, a6);
  v7 = OUTLINED_FUNCTION_17_43();
  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(v6 + 192) + 8089) = v7;
    if (OUTLINED_FUNCTION_2_63())
      OUTLINED_FUNCTION_0_69();
  }
  OUTLINED_FUNCTION_4_58();
}

void forall_adv_upto_r(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  char v7;
  int v8;
  _BYTE *v9;
  char v10;
  _BYTE *v11;

  OUTLINED_FUNCTION_1_64(a1, a2, a3, a4, a5, a6);
  v7 = OUTLINED_FUNCTION_17_43();
  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(v6 + 192) + 8089) = v7;
    OUTLINED_FUNCTION_9_52();
    OUTLINED_FUNCTION_5_55();
    if (!v10 && (*v9 & 2) == 0)
    {
      if (OUTLINED_FUNCTION_2_63())
      {
        OUTLINED_FUNCTION_9_52();
        OUTLINED_FUNCTION_5_55();
        if (!v10 && (*v11 & 2) == 0)
          OUTLINED_FUNCTION_0_69();
      }
    }
  }
  OUTLINED_FUNCTION_4_58();
}

void forall_adv_over_r(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  char v7;
  int v8;
  _BYTE *v9;
  char v10;
  uint64_t v11;

  OUTLINED_FUNCTION_1_64(a1, a2, a3, a4, a5, a6);
  v7 = OUTLINED_FUNCTION_17_43();
  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(v6 + 192) + 8089) = v7;
    OUTLINED_FUNCTION_9_52();
    OUTLINED_FUNCTION_5_55();
    if (!v10 && (*v9 & 2) == 0 && OUTLINED_FUNCTION_2_63())
    {
      clearDeltaStackBack(v6);
      v11 = *(_QWORD *)(v6 + 192);
      *(_DWORD *)(*(_QWORD *)(v6 + 200) + 256) = 0;
      *(_BYTE *)(v11 + 8096) = 1;
      OUTLINED_FUNCTION_3_62();
    }
  }
  OUTLINED_FUNCTION_4_58();
}

void forto_adv_l(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  char v7;

  if (OUTLINED_FUNCTION_1_64(a1, a2, a3, a4, a5, a6))
  {
    *(_BYTE *)(*(_QWORD *)(v6 + 192) + 8089) = 0;
    if (OUTLINED_FUNCTION_2_63())
    {
      OUTLINED_FUNCTION_12_47();
      if (!v7)
        OUTLINED_FUNCTION_0_69();
    }
  }
  OUTLINED_FUNCTION_4_58();
}

void forto_adv_upto_l(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  char v7;
  _BYTE *v8;
  _BYTE *v9;

  if (OUTLINED_FUNCTION_1_64(a1, a2, a3, a4, a5, a6))
  {
    *(_BYTE *)(*(_QWORD *)(v6 + 192) + 8089) = 0;
    OUTLINED_FUNCTION_8_53();
    OUTLINED_FUNCTION_6_54();
    if (!v7)
    {
      OUTLINED_FUNCTION_11_49();
      if (!v7 && (*v8 & 2) == 0)
      {
        if (OUTLINED_FUNCTION_2_63())
        {
          OUTLINED_FUNCTION_27_37();
          if (!v7)
          {
            OUTLINED_FUNCTION_8_53();
            OUTLINED_FUNCTION_6_54();
            if (!v7)
            {
              OUTLINED_FUNCTION_11_49();
              if (!v7 && (*v9 & 2) == 0)
                OUTLINED_FUNCTION_0_69();
            }
          }
        }
      }
    }
  }
  OUTLINED_FUNCTION_4_58();
}

void forto_adv_over_l(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  char v7;
  _BYTE *v8;

  if (OUTLINED_FUNCTION_1_64(a1, a2, a3, a4, a5, a6))
  {
    *(_BYTE *)(*(_QWORD *)(v6 + 192) + 8089) = 0;
    OUTLINED_FUNCTION_8_53();
    OUTLINED_FUNCTION_6_54();
    if (!v7)
    {
      OUTLINED_FUNCTION_11_49();
      if (!v7 && (*v8 & 2) == 0)
      {
        if (OUTLINED_FUNCTION_2_63())
        {
          OUTLINED_FUNCTION_12_47();
          if (!v7)
            OUTLINED_FUNCTION_0_69();
        }
      }
    }
  }
  OUTLINED_FUNCTION_4_58();
}

void forto_adv_r(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  char v7;
  int v8;
  char v9;

  OUTLINED_FUNCTION_1_64(a1, a2, a3, a4, a5, a6);
  v7 = OUTLINED_FUNCTION_17_43();
  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(v6 + 192) + 8089) = v7;
    if (OUTLINED_FUNCTION_2_63())
    {
      OUTLINED_FUNCTION_12_47();
      if (!v9)
        OUTLINED_FUNCTION_0_69();
    }
  }
  OUTLINED_FUNCTION_4_58();
}

void forto_adv_upto_r(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  char v7;
  int v8;
  char v9;
  _BYTE *v10;
  _BYTE *v11;

  OUTLINED_FUNCTION_1_64(a1, a2, a3, a4, a5, a6);
  v7 = OUTLINED_FUNCTION_17_43();
  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(v6 + 192) + 8089) = v7;
    OUTLINED_FUNCTION_8_53();
    OUTLINED_FUNCTION_6_54();
    if (!v9)
    {
      OUTLINED_FUNCTION_10_51();
      if (!v9 && (*v10 & 2) == 0)
      {
        if (OUTLINED_FUNCTION_2_63())
        {
          OUTLINED_FUNCTION_27_37();
          if (!v9)
          {
            OUTLINED_FUNCTION_8_53();
            OUTLINED_FUNCTION_6_54();
            if (!v9)
            {
              OUTLINED_FUNCTION_10_51();
              if (!v9 && (*v11 & 2) == 0)
                OUTLINED_FUNCTION_0_69();
            }
          }
        }
      }
    }
  }
  OUTLINED_FUNCTION_4_58();
}

void forto_adv_over_r(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  char v7;
  int v8;
  char v9;
  _BYTE *v10;

  OUTLINED_FUNCTION_1_64(a1, a2, a3, a4, a5, a6);
  v7 = OUTLINED_FUNCTION_17_43();
  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(v6 + 192) + 8089) = v7;
    OUTLINED_FUNCTION_8_53();
    OUTLINED_FUNCTION_6_54();
    if (!v9)
    {
      OUTLINED_FUNCTION_10_51();
      if (!v9 && (*v10 & 2) == 0)
      {
        if (OUTLINED_FUNCTION_2_63())
        {
          OUTLINED_FUNCTION_12_47();
          if (!v9)
            OUTLINED_FUNCTION_0_69();
        }
      }
    }
  }
  OUTLINED_FUNCTION_4_58();
}

uint64_t forall_to_test(uint64_t a1, unsigned __int16 *a2, __int16 *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v16[2];
  uint64_t *v17[2];

  v17[0] = 0;
  v17[1] = 0;
  v16[1] = 0;
  vinitloc_new(a1, (uint64_t)v17, a2);
  OUTLINED_FUNCTION_14_45(v6, v7, v8, v9, v10, v11, v12, v13, 0);
  vcompare(a1, v17, v16);
  if (((__int16)*a2 & 0x80000000) == 0)
    a2[1] = -1;
  if ((*a3 & 0x80000000) == 0)
    OUTLINED_FUNCTION_22_41();
  v14 = *(_QWORD *)(a1 + 192);
  if (*(_BYTE *)(v14 + 8120))
    return 0;
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(v14 + 8064);
  return 2;
}

void forall_cont_from()
{
  __int16 *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;

  OUTLINED_FUNCTION_13_45();
  if (v9)
    v1 = OUTLINED_FUNCTION_26_39();
  OUTLINED_FUNCTION_15_44((uint64_t)v1, v2, v3, v4, v5, v6, v7, v8, v27, v30, v32, v34);
  OUTLINED_FUNCTION_25_40(v10, v11, v12, v13, v14, v15, v16, v17, v28);
  OUTLINED_FUNCTION_19_42(v18, v19, v20, v21, v22, v23, v24, v25, v29, v31, v33);
  OUTLINED_FUNCTION_18_42();
  if ((v26 & 0x80000000) == 0)
    OUTLINED_FUNCTION_22_41();
  if ((*v0 & 0x80000000) == 0)
    v0[1] = -1;
  OUTLINED_FUNCTION_16_43();
}

void for_adv(uint64_t a1, uint64_t a2, uint64_t a3, __int16 *a4, __int16 *a5, __int16 *a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int16 *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
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
  double *v35;
  double *v36[2];

  OUTLINED_FUNCTION_23_40();
  *(_QWORD *)(v11 + 8056) = v10;
  *(_QWORD *)(v11 + 8064) = v12;
  *(_BYTE *)(v11 + 8096) = 0;
  vinitloc_new(v13, (uint64_t)v36, v14);
  OUTLINED_FUNCTION_14_45(v15, v16, v17, v18, v19, v20, v21, v22, (uint64_t)v35);
  OUTLINED_FUNCTION_20_42(v23, v24);
  vadd(v6, v36, &v35);
  OUTLINED_FUNCTION_24_40(v25, v26);
  if ((*a4 & 0x80000000) == 0)
    a4[1] = -1;
  if ((*a5 & 0x80000000) == 0)
    a5[1] = -1;
  if ((*a6 & 0x80000000) == 0)
    OUTLINED_FUNCTION_22_41();
  OUTLINED_FUNCTION_28_37(v27, v28, v29, v30, v31, v32, v33, v34, v35);
  OUTLINED_FUNCTION_21_41();
}

void for_test(uint64_t a1, unsigned __int16 *a2, __int16 *a3, __int16 *a4)
{
  uint64_t v4;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL4 v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  double *v34;
  _BYTE v35[16];

  OUTLINED_FUNCTION_23_40();
  *(_BYTE *)(v8 + 8096) = 0;
  vinitloc_new(v9, (uint64_t)v35, a2);
  OUTLINED_FUNCTION_20_42(v10, v11);
  OUTLINED_FUNCTION_14_45(v12, v13, v14, v15, v16, v17, v18, v19, v33);
  OUTLINED_FUNCTION_24_40(v20, v21);
  if (((__int16)*a2 & 0x80000000) == 0)
    a2[1] = -1;
  if ((*a3 & 0x80000000) == 0)
    a3[1] = -1;
  if ((*a4 & 0x80000000) == 0)
    OUTLINED_FUNCTION_22_41();
  v30 = OUTLINED_FUNCTION_28_37(v22, v23, v24, v25, v26, v27, v28, v29, v34);
  v31 = *(_QWORD *)(v4 + 192);
  v32 = *(unsigned __int8 *)(v31 + 8120);
  if (!v30)
  {
    if (v32 != 1)
      goto LABEL_11;
    goto LABEL_9;
  }
  if (v32 == 255)
LABEL_9:
    *(_QWORD *)(v4 + 104) = *(_QWORD *)(v31 + 8064);
LABEL_11:
  OUTLINED_FUNCTION_21_41();
}

void for_cont_from()
{
  __int16 *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;

  OUTLINED_FUNCTION_13_45();
  if (v9)
    v1 = OUTLINED_FUNCTION_26_39();
  OUTLINED_FUNCTION_15_44((uint64_t)v1, v2, v3, v4, v5, v6, v7, v8, v27, v30, v32, v34);
  OUTLINED_FUNCTION_25_40(v10, v11, v12, v13, v14, v15, v16, v17, v28);
  OUTLINED_FUNCTION_19_42(v18, v19, v20, v21, v22, v23, v24, v25, v29, v31, v33);
  OUTLINED_FUNCTION_18_42();
  if ((v26 & 0x80000000) == 0)
    OUTLINED_FUNCTION_22_41();
  if ((*v0 & 0x80000000) == 0)
    v0[1] = -1;
  OUTLINED_FUNCTION_16_43();
}

uint64_t while_iterate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 192);
  *(_QWORD *)(v4 + 8056) = a3;
  *(_QWORD *)(v4 + 8064) = a2;
  result = clearDeltaStackBack(a1);
  *(_DWORD *)(*(_QWORD *)(a1 + 200) + 256) = 0;
  return result;
}

uint64_t freeDeltaStackTo_0(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(result + 200);
  v3 = *(_QWORD *)(v2 + 1744);
  if (v3)
  {
    *(_QWORD *)(v2 + 1720) = a2;
    *(_DWORD *)(v2 + 1728) = *(_DWORD *)(v2 + 1780) + a2 - *(_DWORD *)(v3 + 32);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_69()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  clearDeltaStackBack((uint64_t)v2);
  v3 = v2[24];
  *(_DWORD *)(v2[25] + 256) = 0;
  *(_BYTE *)(v3 + 8096) = 1;
  v2[13] = v1;
  *(_QWORD *)(v0 + 8) = *(_QWORD *)(v3 + 8080);
  return 2;
}

uint64_t OUTLINED_FUNCTION_1_64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  return for_loop_preamble(a1, a2, a3, a5, a6);
}

uint64_t OUTLINED_FUNCTION_2_63()
{
  _QWORD *v0;

  return vscanadv(v0, 1, 0);
}

uint64_t OUTLINED_FUNCTION_3_62()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 104) = v2;
  *(_QWORD *)(v1 + 8) = *(_QWORD *)(v0 + 8080);
  return 2;
}

uint64_t OUTLINED_FUNCTION_8_53()
{
  return vscanadvUptoTokenOrMarker();
}

uint64_t OUTLINED_FUNCTION_9_52()
{
  return vscanadvUptoToken();
}

void OUTLINED_FUNCTION_14_45(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  unsigned __int16 *v10;

  vinitloc_new(v9, (uint64_t)&a9, v10);
}

void OUTLINED_FUNCTION_15_44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  unsigned __int16 *v12;
  uint64_t v13;

  a11 = 0;
  a12 = 0;
  vinitloc_new(v13, (uint64_t)&a11, v12);
}

uint64_t OUTLINED_FUNCTION_17_43()
{
  return 1;
}

uint64_t OUTLINED_FUNCTION_18_42()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(v0 + 192);
  *(_QWORD *)(v3 + 8056) = v2;
  *(_QWORD *)(v3 + 8064) = v1;
  result = clearDeltaStackBack(v0);
  *(_DWORD *)(*(_QWORD *)(v0 + 200) + 256) = 0;
  return result;
}

void OUTLINED_FUNCTION_19_42(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, uint64_t a10, void *a11)
{
  uint64_t v11;

  vassign(v11, &a11, &a9);
}

void OUTLINED_FUNCTION_20_42(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  unsigned __int16 *v3;
  va_list va;

  va_start(va, a2);
  vinitloc_new(v2, (uint64_t)va, v3);
}

void OUTLINED_FUNCTION_22_41()
{
  uint64_t v0;

  *(_WORD *)(v0 + 2) = -1;
}

void OUTLINED_FUNCTION_24_40(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t *v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, uint64_t *);
  v5 = va_arg(va1, _QWORD);
  vcompare(v2, (uint64_t **)va1, (uint64_t **)va);
}

void OUTLINED_FUNCTION_25_40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned __int16 *v9;
  uint64_t v10;

  vinitloc_new(v10, (uint64_t)&a9, v9);
}

void *OUTLINED_FUNCTION_26_39()
{
  unsigned __int16 *v0;
  uint64_t v1;

  return save_var(v1, v0);
}

BOOL OUTLINED_FUNCTION_28_37(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double *a9)
{
  uint64_t v9;

  return vnegative(v9, &a9);
}

void read_2pt(uint64_t a1, char a2, unsigned int a3)
{
  int v3;
  uint64_t v4;
  unint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  OUTLINED_FUNCTION_3_63(a1, a2, a3);
  if (!v3)
  {
    v4 = OUTLINED_FUNCTION_8_54();
    if (!vrange_2pt(v4, v5, v6, v7, v8))
    {
      OUTLINED_FUNCTION_2_64();
      OUTLINED_FUNCTION_0_70();
    }
  }
  OUTLINED_FUNCTION_6_55();
}

void read_l(uint64_t a1, char a2, unsigned int a3)
{
  int v3;
  int v4;

  OUTLINED_FUNCTION_3_63(a1, a2, a3);
  if (!v3)
  {
    OUTLINED_FUNCTION_8_54();
    vrange_l();
    if (!v4)
      OUTLINED_FUNCTION_9_53();
    OUTLINED_FUNCTION_2_64();
    OUTLINED_FUNCTION_0_70();
  }
  OUTLINED_FUNCTION_6_55();
}

void read_r(uint64_t a1, char a2, unsigned int a3)
{
  int v3;
  int v4;

  OUTLINED_FUNCTION_3_63(a1, a2, a3);
  if (!v3)
  {
    OUTLINED_FUNCTION_8_54();
    vrange_r();
    if (!v4)
      OUTLINED_FUNCTION_9_53();
    OUTLINED_FUNCTION_2_64();
    OUTLINED_FUNCTION_0_70();
  }
  OUTLINED_FUNCTION_6_55();
}

uint64_t read_nvar(uint64_t a1, uint64_t a2, unsigned __int16 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_4_59(a1, a2, a3, a4, a5, a6, a7, a8, v10, v11);
  result = vrd_nvar();
  if ((*v8 & 0x80000000) == 0)
    v8[1] = -1;
  return result;
}

BOOL read_tvar(uint64_t a1, uint64_t a2, unsigned __int16 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 *v8;
  char v9;
  uint64_t v10;
  int v11;
  uint64_t v13[2];

  OUTLINED_FUNCTION_4_59(a1, a2, a3, a4, a5, a6, a7, a8, v13[0], v13[1]);
  v11 = vrd_tvar(v10, v9, (uint64_t)v13);
  if ((*v8 & 0x80000000) == 0)
    v8[1] = -1;
  return v11 != 0;
}

void open_input(uint64_t a1, char a2)
{
  uint64_t v2;
  char *v3;
  int v4;

  v3 = (char *)OUTLINED_FUNCTION_7_55(a1, a2);
  logicalFileOpen(v2, v3, 0);
  if (!v4)
    OUTLINED_FUNCTION_1_65(v2);
  OUTLINED_FUNCTION_5_56();
}

void open_output(uint64_t a1, char a2)
{
  uint64_t v2;
  char *v3;
  int v4;

  v3 = (char *)OUTLINED_FUNCTION_7_55(a1, a2);
  logicalFileOpen(v2, v3, 1);
  if (!v4)
    OUTLINED_FUNCTION_1_65(v2);
  OUTLINED_FUNCTION_5_56();
}

void open_append(uint64_t a1, char a2)
{
  uint64_t v2;
  char *v3;
  int v4;

  v3 = (char *)OUTLINED_FUNCTION_7_55(a1, a2);
  logicalFileOpen(v2, v3, 2);
  if (!v4)
    OUTLINED_FUNCTION_1_65(v2);
  OUTLINED_FUNCTION_5_56();
}

void closeLF()
{
  vfclose_lf();
}

void print_delta1(uint64_t a1, char a2, uint64_t a3, _BYTE *a4, int a5, uint64_t a6, unsigned int a7)
{
  int v13;
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10_52(a1);
  if (!v13)
    OUTLINED_FUNCTION_9_53();
  v14 = 0;
  v15[0] = a5;
  v15[1] = 0;
  while (a5 != v14)
  {
    v15[v14 + 2] = *(_BYTE *)(a6 + v14);
    ++v14;
  }
  lf_print_delta(a1, a2, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 144), a4, (a7 >> 1) & 1, 0, (uint64_t)v15, 0, 0, 0, 80);
}

void print_stream(uint64_t a1, uint64_t a2, int a3, int a4)
{
  int v8;

  OUTLINED_FUNCTION_10_52(a1);
  if (!v8)
    forceErrorBacktrack(a1);
  vprt_strm(a1, a2, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 144), a3, a4);
}

void print_lit(uint64_t a1, char a2, uint64_t a3)
{
  vf_puts(a1, a2, a3, 1);
}

void print_var(uint64_t a1, char a2, __int16 *a3)
{
  vprt_var(a1, a2, a3);
  if ((*a3 & 0x80000000) == 0)
    a3[1] = -1;
  OUTLINED_FUNCTION_5_56();
}

void print_tvar(uint64_t a1, char a2, __int16 *a3, uint64_t a4, uint64_t a5)
{
  _WORD *v6;

  v6 = a3 + 1;
  prt_tvar(a2, a3 + 1, a5);
  if ((*a3 & 0x80000000) == 0)
    *v6 = -1;
  OUTLINED_FUNCTION_5_56();
}

void OUTLINED_FUNCTION_0_70()
{
  unsigned int v0;
  _QWORD *v1;

  ins_rdtoks(v1, v0, v1[14], v1[18]);
}

void OUTLINED_FUNCTION_1_65(uint64_t a1)
{
  forceErrorBacktrack(a1);
}

void OUTLINED_FUNCTION_2_64()
{
  int v0;
  uint64_t v1;

  visnonseq(v1, v0, *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 144));
}

void OUTLINED_FUNCTION_3_63(uint64_t a1, char a2, unsigned int a3)
{
  vrd_delta(a1, a2, a3);
}

void OUTLINED_FUNCTION_4_59(uint64_t a1, uint64_t a2, unsigned __int16 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  a9 = 0;
  a10 = 0;
  vinitloc_new(a1, (uint64_t)&a9, a3);
}

unint64_t OUTLINED_FUNCTION_7_55(uint64_t a1, char a2)
{
  return logicalFileName(a1, a2);
}

uint64_t OUTLINED_FUNCTION_8_54()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_9_53()
{
  uint64_t v0;

  forceErrorBacktrack(v0);
}

void OUTLINED_FUNCTION_10_52(uint64_t a1)
{
  vprt_range(a1, a1 + 112, a1 + 144);
}

uint64_t ccode_misc_new(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 192) + 8024) = -1;
  return result;
}

uint64_t etiwinMain(uint64_t a1, int a2, uint64_t *a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;

  v5 = *a3;
  v4 = a3 + 1;
  v7 = *(_QWORD *)(a1 + 184);
  v6 = *(_QWORD *)(a1 + 192);
  *(_QWORD *)(v6 + 9304) = v5;
  v8 = __OFSUB__(a2, 1);
  v9 = a2 - 1;
  *(_DWORD *)(v7 + 480) = v9;
  if ((v9 < 0) ^ v8 | (v9 == 0))
    v4 = 0;
  *(_QWORD *)(v7 + 488) = v4;
  *(_DWORD *)(v6 + 8872) = 0;
  vcmdinit(a1);
  if (v10)
  {
    vinitrun((int *)a1);
    if (v18)
    {
      DeltaProc_main(a1, v11, v12, v13, v14, v15, v16, v17);
      vcmdend(a1, 0);
    }
  }
  return 1;
}

void etiwinMainDLL(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;

  v4 = *(_QWORD *)(a1 + 184);
  *(_DWORD *)(v4 + 480) = a2 - 1;
  if (a2 < 2)
    v5 = 0;
  else
    v5 = *(_QWORD *)(a3 + 8);
  *(_QWORD *)(v4 + 488) = v5;
  *(_DWORD *)(*(_QWORD *)(a1 + 192) + 8872) = 0;
  vcmdinit(a1);
  if (v6)
    vinitrun((int *)a1);
}

uint64_t getProgramName(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 192) + 9304);
}

void halt()
{
  exit(0);
}

void abort_1(void)
{
  exit(5);
}

void dur_expr(uint64_t a1, char a2, __int16 *a3)
{
  uint64_t *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];

  v6 = (uint64_t *)(a1 + 112);
  vtimept_tv(a1, a1 + 112);
  if (!v7 || (vtimept_tv(a1, a1 + 144), !(_DWORD)v8))
    forceErrorBacktrack(a1);
  v15[3] = 0;
  v15[0] = 0;
  v15[1] = 0;
  OUTLINED_FUNCTION_3_64(v8, (uint64_t)v15);
  vdur(a1, v6, (unint64_t *)(a1 + 144), a2);
  OUTLINED_FUNCTION_0_71();
  OUTLINED_FUNCTION_2_65(v9, v10, v11, v12, v13, v14);
  if ((*a3 & 0x80000000) == 0)
    a3[1] = -1;
  OUTLINED_FUNCTION_1_66();
}

void val_expr1(uint64_t a1, __int16 *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17[4];

  if (val_expr(a1, a1 + 112, a3, a4, 0, a6, a7, a8) == -2147483647)
  {
    if ((*a2 & 0x80000000) == 0)
      a2[1] = -1;
    forceErrorBacktrack(a1);
  }
  v17[3] = 0;
  v17[0] = 0;
  v17[1] = 0;
  OUTLINED_FUNCTION_0_71();
  OUTLINED_FUNCTION_3_64(v10, v11);
  OUTLINED_FUNCTION_2_65(v12, v17, v13, v14, v15, v16);
  if ((*a2 & 0x80000000) == 0)
    a2[1] = -1;
  OUTLINED_FUNCTION_1_66();
}

uint64_t actd_lookup(_QWORD *a1, int a2, uint64_t a3, uint64_t a4)
{
  _BYTE **v8;
  int v9;
  uint64_t v10;
  const char *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  _BYTE *v16;
  _QWORD *v17;
  uint64_t v18;

  v8 = (_BYTE **)(a1 + 14);
  vprt_range((uint64_t)a1, (uint64_t)(a1 + 14), (uint64_t)(a1 + 18));
  if (!v9)
    forceErrorBacktrack((uint64_t)a1);
  v10 = a1[9] + ((uint64_t)a2 << 6);
  v11 = actdlookup((uint64_t)a1, a1[14], a1[18], v10);
  if (v11)
  {
    v12 = 0;
    *(_WORD *)(a1[24] + 9300) = *((_WORD *)v11 + 1);
    while (1)
    {
      if (v12 == 2)
        return 0;
      v14 = *(unsigned __int8 *)v11++;
      v13 = v14;
      if (v14 != 255)
      {
        v15 = 0;
        v16 = *v8;
        while (v15 < v13)
        {
          if (v16 && (*v16 & 2) != 0)
          {
            v17 = &v16[8 * *(_DWORD *)(a1[24] + 9084) + 8 * *(unsigned __int8 *)(v10 + 16)];
          }
          else
          {
            v17 = v16 + 8;
            ++v15;
          }
          v16 = (_BYTE *)(*v17 & 0xFFFFFFFFFFFFFFFCLL);
        }
        if (v12)
        {
          v18 = a4;
          if (!a4)
            goto LABEL_17;
LABEL_16:
          *(_QWORD *)(v18 + 8) = v16;
          goto LABEL_17;
        }
        v18 = a3;
        if (a3)
          goto LABEL_16;
      }
LABEL_17:
      ++v12;
    }
  }
  return 1;
}

BOOL setd_lookup(_QWORD *a1, unsigned __int8 a2, int a3)
{
  int v6;

  if (!a1[14] || !a1[18])
    return 1;
  vprt_range((uint64_t)a1, (uint64_t)(a1 + 14), (uint64_t)(a1 + 18));
  if (!v6)
    forceErrorBacktrack((uint64_t)a1);
  return setdlookup((uint64_t)a1, a1[14], a1[18], a1[8] + ((uint64_t)a3 << 6), a2) == 0;
}

uint64_t actd_goto(uint64_t result)
{
  *(_QWORD *)(result + 104) = *(__int16 *)(*(_QWORD *)(result + 192) + 9300);
  return result;
}

void OUTLINED_FUNCTION_2_65(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  va_list va;

  va_start(va, a6);
  vassign(v6, a2, (const void **)va);
}

void OUTLINED_FUNCTION_3_64(uint64_t a1, uint64_t a2)
{
  unsigned __int16 *v2;
  uint64_t v3;

  vinitloc_new(v3, a2, v2);
}

void if_testeq_v_lng(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_12_48(a1, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_15_45();
  OUTLINED_FUNCTION_27_38(v8, v9, v10, v11, v12, v13, v14, v15);
}

void if_testeq(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;

  v8 = OUTLINED_FUNCTION_6_56(a1, a2, a3, a4, a5, a6, a7, a8, v24, v27, v29, v31);
  v16 = OUTLINED_FUNCTION_13_46(v8, v9, v10, v11, v12, v13, v14, v15, v25);
  OUTLINED_FUNCTION_8_55(v16, v17, v18, v19, v20, v21, v22, v23, v26, v28, v30);
  OUTLINED_FUNCTION_37_35();
  OUTLINED_FUNCTION_16_44();
}

void if_testle_v_lng(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_12_48(a1, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_15_45();
  OUTLINED_FUNCTION_25_41(v8, v9, v10, v11, v12, v13, v14, v15);
}

void if_testle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;

  v8 = OUTLINED_FUNCTION_6_56(a1, a2, a3, a4, a5, a6, a7, a8, v24, v27, v29, v31);
  v16 = OUTLINED_FUNCTION_13_46(v8, v9, v10, v11, v12, v13, v14, v15, v25);
  OUTLINED_FUNCTION_8_55(v16, v17, v18, v19, v20, v21, v22, v23, v26, v28, v30);
  OUTLINED_FUNCTION_35_36();
  OUTLINED_FUNCTION_16_44();
}

void if_testge_v_lng(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_12_48(a1, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_15_45();
  OUTLINED_FUNCTION_22_42(v8, v9, v10, v11, v12, v13, v14, v15);
}

void if_testge(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;

  v8 = OUTLINED_FUNCTION_6_56(a1, a2, a3, a4, a5, a6, a7, a8, v24, v27, v29, v31);
  v16 = OUTLINED_FUNCTION_13_46(v8, v9, v10, v11, v12, v13, v14, v15, v25);
  OUTLINED_FUNCTION_8_55(v16, v17, v18, v19, v20, v21, v22, v23, v26, v28, v30);
  OUTLINED_FUNCTION_36_36();
  OUTLINED_FUNCTION_16_44();
}

void if_testgt_v_lng(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_12_48(a1, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_15_45();
  OUTLINED_FUNCTION_26_40(v8, v9, v10, v11, v12, v13, v14, v15);
}

void if_testgt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;

  v8 = OUTLINED_FUNCTION_6_56(a1, a2, a3, a4, a5, a6, a7, a8, v24, v27, v29, v31);
  v16 = OUTLINED_FUNCTION_13_46(v8, v9, v10, v11, v12, v13, v14, v15, v25);
  OUTLINED_FUNCTION_8_55(v16, v17, v18, v19, v20, v21, v22, v23, v26, v28, v30);
  OUTLINED_FUNCTION_35_36();
  OUTLINED_FUNCTION_16_44();
}

void if_testlt_v_lng(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_12_48(a1, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_15_45();
  OUTLINED_FUNCTION_23_41(v8, v9, v10, v11, v12, v13, v14, v15);
}

void if_testlt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;

  v8 = OUTLINED_FUNCTION_6_56(a1, a2, a3, a4, a5, a6, a7, a8, v24, v27, v29, v31);
  v16 = OUTLINED_FUNCTION_13_46(v8, v9, v10, v11, v12, v13, v14, v15, v25);
  OUTLINED_FUNCTION_8_55(v16, v17, v18, v19, v20, v21, v22, v23, v26, v28, v30);
  OUTLINED_FUNCTION_36_36();
  OUTLINED_FUNCTION_16_44();
}

void if_testneq_v_lng(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_12_48(a1, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_15_45();
  OUTLINED_FUNCTION_24_41(v8, v9, v10, v11, v12, v13, v14, v15);
}

void if_testneq(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;

  v8 = OUTLINED_FUNCTION_6_56(a1, a2, a3, a4, a5, a6, a7, a8, v24, v27, v29, v31);
  v16 = OUTLINED_FUNCTION_13_46(v8, v9, v10, v11, v12, v13, v14, v15, v25);
  OUTLINED_FUNCTION_8_55(v16, v17, v18, v19, v20, v21, v22, v23, v26, v28, v30);
  OUTLINED_FUNCTION_37_35();
  OUTLINED_FUNCTION_16_44();
}

void if_testeq_v_i(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_12_48(a1, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_14_46();
  OUTLINED_FUNCTION_27_38(v8, v9, v10, v11, v12, v13, v14, v15);
}

void if_testle_v_i(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_12_48(a1, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_14_46();
  OUTLINED_FUNCTION_25_41(v8, v9, v10, v11, v12, v13, v14, v15);
}

void if_testge_v_i(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_12_48(a1, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_14_46();
  OUTLINED_FUNCTION_22_42(v8, v9, v10, v11, v12, v13, v14, v15);
}

void if_testgt_v_i(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_12_48(a1, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_14_46();
  OUTLINED_FUNCTION_26_40(v8, v9, v10, v11, v12, v13, v14, v15);
}

void if_testlt_v_i(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_12_48(a1, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_14_46();
  OUTLINED_FUNCTION_23_41(v8, v9, v10, v11, v12, v13, v14, v15);
}

void if_testneq_v_i(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_12_48(a1, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_14_46();
  OUTLINED_FUNCTION_24_41(v8, v9, v10, v11, v12, v13, v14, v15);
}

BOOL testeq_tvars(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  compare_tvars(a1, a2, a3);
  return testeq(a1);
}

BOOL testneq_tvars(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  compare_tvars(a1, a2, a3);
  return testneq(a1);
}

BOOL testFldeq(uint64_t a1, unsigned int a2, int a3, int a4)
{
  uint64_t v4;
  unsigned __int8 *v5;
  _BYTE *v6;
  unint64_t v7;

  v4 = *(_QWORD *)(a1 + 192);
  v5 = (unsigned __int8 *)(v4 + 8088);
  v6 = *(_BYTE **)(v4 + 8080);
  while (1)
  {
    v7 = *(_BYTE *)(v4 + 8089) ? *(int *)(v4 + 9084) + (unint64_t)*v5 : *v5 + 3;
    v6 = (_BYTE *)(*(_QWORD *)&v6[8 * v7] & 0xFFFFFFFFFFFFFFFCLL);
    if (!v6)
      break;
    if ((*v6 & 2) == 0)
      return *(unsigned __int8 *)(*(uint64_t (**)(_BYTE *))&vstmtbl[12 * a2 + 2][8 * a3])(v6 + 16) != a4;
  }
  return 1;
}

void move_lng(uint64_t a1, __int16 *a2, const void *a3)
{
  int v5;
  int v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const void *v13[3];

  v13[2] = a3;
  OUTLINED_FUNCTION_29_37();
  if (v5)
    OUTLINED_FUNCTION_28_38();
  OUTLINED_FUNCTION_34_36();
  if (!(!v9 & v8))
    __asm { BR              X10 }
  if (v7 < 0)
    OUTLINED_FUNCTION_17_44(a1);
  OUTLINED_FUNCTION_11_50(0xFFFDu, v11, 0, 0, (uint64_t)v13[0], (uint64_t)v13[1]);
  OUTLINED_FUNCTION_20_43(v10, &v12, v13);
  if ((*a2 & 0x80000000) == 0)
    a2[1] = -1;
  OUTLINED_FUNCTION_31_37();
}

void move_i(uint64_t a1, __int16 *a2, __int16 a3)
{
  int v5;
  int v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const void *v13[2];
  __int16 v14;

  v14 = a3;
  OUTLINED_FUNCTION_29_37();
  if (v5)
    OUTLINED_FUNCTION_28_38();
  OUTLINED_FUNCTION_34_36();
  if (!(!v9 & v8))
    __asm { BR              X10 }
  if (v7 < 0)
    OUTLINED_FUNCTION_17_44(a1);
  OUTLINED_FUNCTION_11_50(0xFFFCu, v11, 0, 0, (uint64_t)v13[0], (uint64_t)v13[1]);
  OUTLINED_FUNCTION_20_43(v10, &v12, v13);
  if ((*a2 & 0x80000000) == 0)
    a2[1] = -1;
  OUTLINED_FUNCTION_31_37();
}

void move_f(uint64_t a1, __int16 *a2, double a3)
{
  int v5;
  int v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const void *v13[3];

  v13[2] = *(const void **)&a3;
  OUTLINED_FUNCTION_29_37();
  if (v5)
    OUTLINED_FUNCTION_28_38();
  OUTLINED_FUNCTION_34_36();
  if (!(!v9 & v8))
    __asm { BR              X10 }
  if (v7 < 0)
    OUTLINED_FUNCTION_17_44(a1);
  OUTLINED_FUNCTION_11_50(0xFFFBu, v11, 0, 0, (uint64_t)v13[0], (uint64_t)v13[1]);
  OUTLINED_FUNCTION_20_43(v10, &v12, v13);
  if ((*a2 & 0x80000000) == 0)
    a2[1] = -1;
}

void bspush_ca_boa(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_38_34(a1);
  bspush_ca(v1);
}

double bspush_ca_scan_boa(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  double result;

  OUTLINED_FUNCTION_38_34(a1);
  *(_QWORD *)&result = bspush_ca_scan(v2, v1).n128_u64[0];
  return result;
}

uint64_t lpta_rpta_loadp(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)(result + 168) = 1;
  *(_BYTE *)(result + 136) = 1;
  *(_QWORD *)(result + 112) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(result + 144) = *(_QWORD *)(a3 + 8);
  *(_QWORD *)(result + 160) = 0;
  *(_QWORD *)(result + 128) = 0;
  return result;
}

#error "21F87F468: call analysis failed (funcsize=53)"

#error "21F87F568: call analysis failed (funcsize=63)"

#error "21F87F670: call analysis failed (funcsize=64)"

#error "21F87F768: call analysis failed (funcsize=60)"

void ins_tokens_f()
{
  uint64_t v0;
  const char *v1;
  int v2;
  char v3;
  int v4;
  double *v5;
  unsigned __int8 *v6;
  const char *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  int v19;
  uint64_t v20;
  double *v21;
  uint64_t v22;
  double *v23;
  double v24;
  __int16 v25;
  char v26;

  OUTLINED_FUNCTION_33_37();
  if (v4)
  {
    OUTLINED_FUNCTION_4_60();
    switch(OUTLINED_FUNCTION_0_72())
    {
      case 0xFFFFFFFB:
        v5 = &v24;
        goto LABEL_8;
      case 0xFFFFFFFC:
      case 0xFFFFFFFE:
        v5 = (double *)&v25;
        goto LABEL_8;
      case 0xFFFFFFFF:
        v5 = (double *)&v26;
LABEL_8:
        v23 = v5;
        v26 = 0;
        v25 = 0;
        v24 = 0.0;
        v6 = (unsigned __int8 *)&v1[v2];
        v22 = 65531;
        v21 = &v24;
        BYTE2(v22) = v3;
        OUTLINED_FUNCTION_3_65();
        while (v1 < (const char *)v6)
        {
          v9 = *(unsigned __int8 *)v1;
          v7 = v1 + 1;
          v8 = v9;
          v26 = v9;
          v24 = atof(v7);
          OUTLINED_FUNCTION_19_43();
          if (!v18)
            OUTLINED_FUNCTION_10_53(v10, v11, v12, v13, v14, v15, v16, v17, v21, v22, v23);
          OUTLINED_FUNCTION_5_57(v10, v11, v21, v22, v23);
          if (!v19)
            break;
          v1 = &v7[v8];
          if (v1 < (const char *)v6)
          {
            v20 = OUTLINED_FUNCTION_2_66();
            *(_QWORD *)(v0 + 112) = v20;
            if (!v20)
              break;
          }
        }
        break;
      default:
        return;
    }
  }
  else
  {
    OUTLINED_FUNCTION_3_65();
  }
}

void insert_2pt_s(uint64_t a1, char a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;

  if (!OUTLINED_FUNCTION_1_67(a1, a2, a3, a4, a5))
  {
    v5 = OUTLINED_FUNCTION_9_54();
    ins_tokens_s(v5);
  }
  OUTLINED_FUNCTION_18_43();
}

void insert_2pt_l(uint64_t a1, char a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;

  if (!OUTLINED_FUNCTION_1_67(a1, a2, a3, a4, a5))
  {
    v5 = OUTLINED_FUNCTION_9_54();
    ins_tokens_l(v5);
  }
  OUTLINED_FUNCTION_18_43();
}

void insert_2pt_lng(uint64_t a1, char a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;

  if (!OUTLINED_FUNCTION_1_67(a1, a2, a3, a4, a5))
  {
    v5 = OUTLINED_FUNCTION_9_54();
    ins_tokens_lng(v5);
  }
  OUTLINED_FUNCTION_18_43();
}

void insert_2pt_i(uint64_t a1, char a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;

  if (!OUTLINED_FUNCTION_1_67(a1, a2, a3, a4, a5))
  {
    v5 = OUTLINED_FUNCTION_9_54();
    ins_tokens_i(v5);
  }
  OUTLINED_FUNCTION_18_43();
}

void insert_2pt_f(uint64_t a1, char a2, uint64_t a3, uint64_t a4, int a5)
{
  if (!OUTLINED_FUNCTION_1_67(a1, a2, a3, a4, a5))
  {
    OUTLINED_FUNCTION_9_54();
    ins_tokens_f();
  }
  OUTLINED_FUNCTION_18_43();
}

uint64_t OUTLINED_FUNCTION_0_72()
{
  int v0;

  return STMTYP(v0);
}

uint64_t OUTLINED_FUNCTION_1_67(uint64_t a1, char a2, uint64_t a3, uint64_t a4, int a5)
{
  return vrange_2pt(a1, (unint64_t *)(a1 + 112), a1 + 144, a2, a5);
}

uint64_t OUTLINED_FUNCTION_2_66()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;

  return vins_sync(v1, v0, *(_QWORD *)(*(_QWORD *)(v1 + 144) + 8 * v2) & 0xFFFFFFFFFFFFFFFCLL, *(_QWORD *)(v1 + 144));
}

uint64_t OUTLINED_FUNCTION_3_65()
{
  char v0;
  uint64_t *v1;

  return vdel_2pt(v1, v0, v1[14], v1[18]);
}

uint64_t OUTLINED_FUNCTION_4_60()
{
  char v0;

  return STMTYP(v0);
}

void OUTLINED_FUNCTION_5_57(uint64_t a1, uint64_t a2, ...)
{
  unsigned int v2;
  uint64_t *v3;
  va_list va;

  va_start(va, a2);
  vins_tok(v3, v2, v3[14], v3[18], (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_6_56(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  a11 = 0;
  a12 = 0;
  return vnspop(a1, (uint64_t)&a11);
}

void OUTLINED_FUNCTION_8_55(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t a10, uint64_t *a11)
{
  uint64_t v11;

  vcompare(v11, &a11, &a9);
}

uint64_t OUTLINED_FUNCTION_9_54()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_10_53(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, uint64_t a10, void *a11)
{
  uint64_t v11;

  vassign(v11, &a11, &a9);
}

void OUTLINED_FUNCTION_11_50(unsigned __int16 a1@<W8>, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  unsigned __int16 *v7;
  uint64_t v8;

  a5 = v6;
  a6 = a1;
  BYTE2(a6) = 0;
  vinitloc_new(v8, (uint64_t)&a3, v7);
}

void OUTLINED_FUNCTION_12_48(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  npush_v(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t OUTLINED_FUNCTION_13_46(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  return vnspop(v9, (uint64_t)&a9);
}

void OUTLINED_FUNCTION_14_46()
{
  uint64_t v0;

  npush_i(v0);
}

void OUTLINED_FUNCTION_15_45()
{
  uint64_t v0;

  npush_lng(v0);
}

void OUTLINED_FUNCTION_17_44(uint64_t a1)
{
  forceErrorBacktrack(a1);
}

void OUTLINED_FUNCTION_20_43(uint64_t a1, void **a2, const void **a3)
{
  uint64_t v3;

  vassign(v3, a2, a3);
}

void OUTLINED_FUNCTION_22_42(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if_testge(a1, a2, a3, a4, a5, a6, a7, a8);
}

void OUTLINED_FUNCTION_23_41(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if_testlt(a1, a2, a3, a4, a5, a6, a7, a8);
}

void OUTLINED_FUNCTION_24_41(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if_testneq(a1, a2, a3, a4, a5, a6, a7, a8);
}

void OUTLINED_FUNCTION_25_41(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if_testle(a1, a2, a3, a4, a5, a6, a7, a8);
}

void OUTLINED_FUNCTION_26_40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if_testgt(a1, a2, a3, a4, a5, a6, a7, a8);
}

void OUTLINED_FUNCTION_27_38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if_testeq(a1, a2, a3, a4, a5, a6, a7, a8);
}

void *OUTLINED_FUNCTION_28_38()
{
  unsigned __int16 *v0;
  uint64_t v1;

  return save_var(v1, v0);
}

void OUTLINED_FUNCTION_38_34(uint64_t a1)
{
  bspush_boa(a1);
}

uint64_t lpta_loadv(uint64_t a1, char a2, __int16 *a3)
{
  int v3;
  uint64_t v4;

  *(_BYTE *)(a1 + 136) = 2;
  *(_BYTE *)(a1 + 120) = a2;
  v3 = *a3;
  switch(v3)
  {
    case -5:
      v4 = (uint64_t)*((double *)a3 + 1);
      break;
    case -4:
      v4 = a3[1];
      break;
    case -3:
      v4 = *((_QWORD *)a3 + 1);
      break;
    default:
      forceErrorBacktrack(a1);
  }
  *(_QWORD *)(a1 + 128) = v4;
  return a1;
}

uint64_t rpta_loadv(uint64_t a1, char a2, __int16 *a3)
{
  int v3;
  uint64_t v4;

  *(_BYTE *)(a1 + 168) = 2;
  *(_BYTE *)(a1 + 152) = a2;
  v3 = *a3;
  switch(v3)
  {
    case -5:
      v4 = (uint64_t)*((double *)a3 + 1);
      break;
    case -4:
      v4 = a3[1];
      break;
    case -3:
      v4 = *((_QWORD *)a3 + 1);
      break;
    default:
      forceErrorBacktrack(a1);
  }
  *(_QWORD *)(a1 + 160) = v4;
  return a1;
}

void lpta_loadlng(uint64_t a1, char a2, uint64_t a3)
{
  int v5;

  v5 = OUTLINED_FUNCTION_3_66(a1, a2);
  if ((v5 + 4) < 2)
    goto LABEL_4;
  if (v5 == -5)
  {
    a3 = (uint64_t)(double)a3;
LABEL_4:
    *(_QWORD *)(a1 + 128) = a3;
  }
  OUTLINED_FUNCTION_2_67();
}

void rpta_loadl(uint64_t a1, char a2, uint64_t a3)
{
  int v5;

  v5 = OUTLINED_FUNCTION_4_61((char *)a1, a2);
  if ((v5 + 4) < 2)
    goto LABEL_4;
  if (v5 == -5)
  {
    a3 = (uint64_t)(double)a3;
LABEL_4:
    *(_QWORD *)(a1 + 160) = a3;
  }
  OUTLINED_FUNCTION_2_67();
}

void lpta_loadi(uint64_t a1, char a2, int a3)
{
  char v5;
  char v6;

  OUTLINED_FUNCTION_3_66(a1, a2);
  OUTLINED_FUNCTION_19_44();
  if (!(!v6 & v5))
    *(_QWORD *)(a1 + 128) = a3;
  OUTLINED_FUNCTION_2_67();
}

void rpta_loadi(uint64_t a1, char a2, int a3)
{
  char v5;
  char v6;

  OUTLINED_FUNCTION_4_61((char *)a1, a2);
  OUTLINED_FUNCTION_19_44();
  if (!(!v6 & v5))
    *(_QWORD *)(a1 + 160) = a3;
  OUTLINED_FUNCTION_2_67();
}

void lpta_loadf(uint64_t a1, char a2, double a3)
{
  char v5;
  char v6;

  OUTLINED_FUNCTION_3_66(a1, a2);
  OUTLINED_FUNCTION_19_44();
  if (!(!v6 & v5))
    *(_QWORD *)(a1 + 128) = (uint64_t)a3;
  OUTLINED_FUNCTION_20_44();
}

void rpta_loadf(uint64_t a1, char a2, double a3)
{
  char v5;
  char v6;

  OUTLINED_FUNCTION_4_61((char *)a1, a2);
  OUTLINED_FUNCTION_19_44();
  if (!(!v6 & v5))
    *(_QWORD *)(a1 + 160) = (uint64_t)a3;
  OUTLINED_FUNCTION_20_44();
}

uint64_t lpta_leftmost(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_22_43(a1, a2, 6);
}

uint64_t rpta_leftmost(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_21_43(a1, a2, 6);
}

uint64_t lpta_rightmost(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_22_43(a1, a2, 10);
}

uint64_t rpta_rightmost(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_21_43(a1, a2, 10);
}

void lpta_ctxtl(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  char v5;

  OUTLINED_FUNCTION_14_47(a1);
  if (!v2)
    OUTLINED_FUNCTION_9_55();
  OUTLINED_FUNCTION_0_73();
  if ((v5 & 1) == 0)
    *(_QWORD *)(v1 + 112) = OUTLINED_FUNCTION_1_68(v1, 1, v3, v4);
  OUTLINED_FUNCTION_2_67();
}

void rpta_ctxtl(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  char v5;

  OUTLINED_FUNCTION_12_49(a1);
  if (!v2)
    OUTLINED_FUNCTION_9_55();
  OUTLINED_FUNCTION_0_73();
  if ((v5 & 1) == 0)
    *(_QWORD *)(v1 + 144) = OUTLINED_FUNCTION_1_68(v1, 1, v3, v4);
  OUTLINED_FUNCTION_2_67();
}

void lpta_ctxtr(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  char v5;

  OUTLINED_FUNCTION_14_47(a1);
  if (!v2)
    OUTLINED_FUNCTION_9_55();
  OUTLINED_FUNCTION_0_73();
  if ((v5 & 1) == 0)
    *(_QWORD *)(v1 + 112) = OUTLINED_FUNCTION_1_68(v1, 0, v3, v4);
  OUTLINED_FUNCTION_2_67();
}

void rpta_ctxtr(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  char v5;

  OUTLINED_FUNCTION_12_49(a1);
  if (!v2)
    OUTLINED_FUNCTION_9_55();
  OUTLINED_FUNCTION_0_73();
  if ((v5 & 1) == 0)
    *(_QWORD *)(v1 + 144) = OUTLINED_FUNCTION_1_68(v1, 0, v3, v4);
  OUTLINED_FUNCTION_2_67();
}

void lpta_movel(uint64_t a1)
{
  _QWORD *v1;
  int v2;

  v1 = (_QWORD *)(a1 + 112);
  vmove_tv(a1, a1 + 112);
  if (!v2)
    OUTLINED_FUNCTION_15_46();
  *v1 = OUTLINED_FUNCTION_5_58();
  OUTLINED_FUNCTION_7_57();
}

void rpta_movel(uint64_t a1)
{
  _QWORD *v1;
  int v2;

  v1 = (_QWORD *)(a1 + 144);
  vmove_tv(a1, a1 + 144);
  if (!v2)
    OUTLINED_FUNCTION_15_46();
  *v1 = OUTLINED_FUNCTION_5_58();
  OUTLINED_FUNCTION_7_57();
}

void lpta_mover(uint64_t a1)
{
  uint64_t v2;

  vmove_tv(a1, a1 + 112);
  if (!(_DWORD)v2)
    OUTLINED_FUNCTION_9_55();
  *(_QWORD *)(a1 + 112) = OUTLINED_FUNCTION_8_56(v2, *(_BYTE **)(a1 + 112));
  OUTLINED_FUNCTION_2_67();
}

void rpta_mover(uint64_t a1)
{
  uint64_t v2;

  vmove_tv(a1, a1 + 144);
  if (!(_DWORD)v2)
    OUTLINED_FUNCTION_9_55();
  *(_QWORD *)(a1 + 144) = OUTLINED_FUNCTION_8_56(v2, *(_BYTE **)(a1 + 144));
  OUTLINED_FUNCTION_2_67();
}

void lpta_tstctxtl()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  OUTLINED_FUNCTION_17_45();
  vtstctx_tv(v1, v2);
  if (!v3)
  {
    OUTLINED_FUNCTION_0_73();
    if ((v6 & 1) == 0)
      *(_QWORD *)(v0 + 112) = OUTLINED_FUNCTION_1_68(v0, 1, v4, v5);
  }
  OUTLINED_FUNCTION_16_45();
}

void rpta_tstctxtl(uint64_t a1)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  char v5;

  vtstctx_tv(a1, a1 + 144);
  if (!v2)
  {
    OUTLINED_FUNCTION_0_73();
    if ((v5 & 1) == 0)
      *(_QWORD *)(a1 + 144) = OUTLINED_FUNCTION_1_68(a1, 1, v3, v4);
  }
  OUTLINED_FUNCTION_16_45();
}

void lpta_tstctxtr(uint64_t a1)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  char v5;

  vtstctx_tv(a1, a1 + 112);
  if (!v2)
  {
    OUTLINED_FUNCTION_0_73();
    if ((v5 & 1) == 0)
      *(_QWORD *)(a1 + 112) = OUTLINED_FUNCTION_1_68(a1, 0, v3, v4);
  }
  OUTLINED_FUNCTION_6_57();
}

void rpta_tstctxtr()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  OUTLINED_FUNCTION_13_47();
  vtstctx_tv(v1, v2);
  if (!v3)
  {
    OUTLINED_FUNCTION_0_73();
    if ((v6 & 1) == 0)
      *(_QWORD *)(v0 + 144) = OUTLINED_FUNCTION_1_68(v0, 0, v4, v5);
  }
  OUTLINED_FUNCTION_6_57();
}

void lpta_tstmovel(uint64_t a1)
{
  _QWORD *v1;
  int v2;

  v1 = (_QWORD *)(a1 + 112);
  vtsttmark_tv(a1, a1 + 112);
  if (!v2)
    *v1 = OUTLINED_FUNCTION_5_58();
  OUTLINED_FUNCTION_16_45();
}

void rpta_tstmovel(uint64_t a1)
{
  _QWORD *v1;
  int v2;

  v1 = (_QWORD *)(a1 + 144);
  vtsttmark_tv(a1, a1 + 144);
  if (!v2)
    *v1 = OUTLINED_FUNCTION_5_58();
  OUTLINED_FUNCTION_6_57();
}

void lpta_tstmover()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_17_45();
  vtsttmark_tv(v1, v2);
  if (!(_DWORD)v3)
    *(_QWORD *)(v0 + 112) = OUTLINED_FUNCTION_8_56(v3, *(_BYTE **)(v0 + 112));
  OUTLINED_FUNCTION_16_45();
}

void rpta_tstmover()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_13_47();
  vtsttmark_tv(v1, v2);
  if (!(_DWORD)v3)
    *(_QWORD *)(v0 + 144) = OUTLINED_FUNCTION_8_56(v3, *(_BYTE **)(v0 + 144));
  OUTLINED_FUNCTION_6_57();
}

void lpta_storep(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  int v5;

  v4 = (_QWORD *)(a1 + 112);
  vsync_tv(a1, a1 + 112);
  if (!v5)
    OUTLINED_FUNCTION_15_46();
  if (*(_BYTE *)(*(_QWORD *)(a1 + 192) + 8096))
    OUTLINED_FUNCTION_18_44();
  *(_QWORD *)(a2 + 8) = *v4;
  OUTLINED_FUNCTION_7_57();
}

void rpta_storep(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  int v5;

  v4 = (_QWORD *)(a1 + 144);
  vsync_tv(a1, a1 + 144);
  if (!v5)
    OUTLINED_FUNCTION_15_46();
  if (*(_BYTE *)(*(_QWORD *)(a1 + 192) + 8096))
    OUTLINED_FUNCTION_18_44();
  *(_QWORD *)(a2 + 8) = *v4;
  OUTLINED_FUNCTION_7_57();
}

unint64_t OUTLINED_FUNCTION_1_68(uint64_t a1, int a2, uint64_t a3, unint64_t a4)
{
  unsigned int v4;

  return vgetsc(a1, a2, 1, a4, v4);
}

uint64_t OUTLINED_FUNCTION_3_66(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 136) = 2;
  *(_BYTE *)(a1 + 120) = a2;
  return STMTYP(a2);
}

uint64_t OUTLINED_FUNCTION_4_61(char *a1, char a2)
{
  a1[168] = 2;
  a1[152] = a2;
  return STMTYP(a1[120]);
}

_BYTE *OUTLINED_FUNCTION_5_58()
{
  _BYTE **v0;
  int v1;

  return vmovel(*v0, v1);
}

_BYTE *OUTLINED_FUNCTION_8_56(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;
  int v3;

  return vmover(v2, a2, v3);
}

void OUTLINED_FUNCTION_9_55()
{
  uint64_t v0;

  forceErrorBacktrack(v0);
}

uint64_t OUTLINED_FUNCTION_10_54(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(result + 136) = 1;
  *(_QWORD *)(result + 112) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(result + 128) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_11_51(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(result + 168) = 1;
  *(_QWORD *)(result + 144) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(result + 128) = 0;
  return result;
}

void OUTLINED_FUNCTION_12_49(uint64_t a1)
{
  vctxt_tv(a1, a1 + 144);
}

void OUTLINED_FUNCTION_14_47(uint64_t a1)
{
  vctxt_tv(a1, a1 + 112);
}

void OUTLINED_FUNCTION_15_46()
{
  uint64_t v0;

  forceErrorBacktrack(v0);
}

void *OUTLINED_FUNCTION_18_44()
{
  unsigned __int16 *v0;
  uint64_t v1;

  return save_var(v1, v0);
}

uint64_t OUTLINED_FUNCTION_21_43@<X0>(uint64_t result@<X0>, char a2@<W1>, char a3@<W8>)
{
  *(_BYTE *)(result + 168) = a3;
  *(_BYTE *)(result + 152) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_22_43@<X0>(uint64_t result@<X0>, char a2@<W1>, char a3@<W8>)
{
  *(_BYTE *)(result + 136) = a3;
  *(_BYTE *)(result + 120) = a2;
  return result;
}

void npush_v(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _WORD *v18;
  uint64_t v19;

  OUTLINED_FUNCTION_2_68(a1, a2, a3, a4, a5, a6, a7, a8, v17, v19);
  OUTLINED_FUNCTION_6_58(v9, v10, v11, v12, v13, v14, v15, v16, v18);
  if ((*v8 & 0x80000000) == 0)
    v8[1] = -1;
  OUTLINED_FUNCTION_1_69();
}

void npush_vf(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _WORD *v18;
  uint64_t v19;

  OUTLINED_FUNCTION_2_68(a1, a2, a3, a4, a5, a6, a7, a8, v17, v19);
  OUTLINED_FUNCTION_6_58(v9, v10, v11, v12, v13, v14, v15, v16, v18);
  if ((*v8 & 0x80000000) == 0)
    v8[1] = -1;
  OUTLINED_FUNCTION_1_69();
}

void npush_s(uint64_t a1)
{
  uint64_t v1;
  _WORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_0_74(a1, 0xFFFFu, v1, v2, v3);
  OUTLINED_FUNCTION_1_69();
}

void npush_l(uint64_t a1)
{
  uint64_t v1;
  _WORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_0_74(a1, 0xFFFEu, v1, v2, v3);
  OUTLINED_FUNCTION_1_69();
}

void npush_lng(uint64_t a1)
{
  uint64_t v1;
  _WORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_0_74(a1, 0xFFFDu, v1, v2, v3);
  OUTLINED_FUNCTION_1_69();
}

void npush_i(uint64_t a1)
{
  uint64_t v1;
  _WORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_0_74(a1, 0xFFFCu, v1, v2, v3);
  OUTLINED_FUNCTION_1_69();
}

void npush_f(uint64_t a1)
{
  uint64_t v1;
  _WORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_0_74(a1, 0xFFFBu, v1, v2, v3);
  OUTLINED_FUNCTION_1_69();
}

uint64_t npush_fld(uint64_t a1, unsigned int a2, int a3)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _WORD *v13;
  uint64_t v14;

  v14 = 0;
  v4 = &vstmtbl[12 * a2 + 1][40 * a3];
  LOWORD(v14) = *((_WORD *)v4 + 15);
  BYTE2(v14) = v4[32];
  v5 = *(_QWORD *)(a1 + 192);
  v6 = *(unsigned __int8 *)(v5 + 8088);
  if (*(_BYTE *)(v5 + 8089))
    v7 = *(int *)(v5 + 9084) + v6;
  else
    v7 = v6 + 3;
  v8 = (_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 8080) + 8 * v7) & 0xFFFFFFFFFFFFFFFCLL);
  if (!v8)
    return 1;
  v9 = *(unsigned __int8 *)(v5 + 8088);
  while ((*v8 & 2) != 0)
  {
    v10 = *(unsigned __int8 *)(v5 + 8088);
    v11 = v10 + 3;
    if (*(_BYTE *)(v5 + 8089))
    {
      v11 = *(int *)(v5 + 9084) + (uint64_t)(int)v9;
      v10 = v9;
    }
    v9 = v10;
    v8 = (_BYTE *)(*(_QWORD *)&v8[8 * v11] & 0xFFFFFFFFFFFFFFFCLL);
    if (!v8)
      return 1;
  }
  v13 = (_WORD *)(*(uint64_t (**)(_BYTE *))&vstmtbl[12 * a2 + 2][8 * a3])(v8 + 16);
  vnspush(a1, &v13);
  return 0;
}

void npop(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v10[2];
  const void *v11[2];

  OUTLINED_FUNCTION_4_62(a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8, (uint64_t)v10[0], (uint64_t)v10[1], (uint64_t)v11[0], (uint64_t)v11[1]);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 192) + 8096))
    save_var(a1, a2);
  vinitloc_new(a1, (uint64_t)v10, a2);
  vassign(a1, v10, v11);
  if (((__int16)*a2 & 0x80000000) == 0)
    a2[1] = -1;
  OUTLINED_FUNCTION_7_58();
}

void ncompare(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v9[2];
  uint64_t *v10[2];

  OUTLINED_FUNCTION_4_62(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)v9[0], (uint64_t)v9[1], (uint64_t)v10[0], (uint64_t)v10[1]);
  vnspop(a1, (uint64_t)v9);
  vcompare(a1, v10, v9);
  OUTLINED_FUNCTION_7_58();
}

void ncompare_s(uint64_t a1, unsigned int a2)
{
  unsigned int v4;
  char v5;
  uint64_t *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;

  v10 = a2;
  v9 = 0;
  v6 = 0;
  v7 = 0;
  vnspop(a1, (uint64_t)&v6);
  if ((__int16)v7 == -1)
  {
    v4 = *(unsigned __int8 *)v6;
    if (v4 == a2)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 192) + 8120) = 0;
    }
    else
    {
      if (v4 <= a2)
        v5 = -1;
      else
        v5 = 1;
      *(_BYTE *)(*(_QWORD *)(a1 + 192) + 8120) = v5;
    }
  }
  else
  {
    LOWORD(v9) = -1;
    v8 = &v10;
    BYTE2(v9) = 0;
    vcompare(a1, (uint64_t **)&v8, &v6);
  }
}

uint64_t clearDeltaStackBack_0(uint64_t a1)
{
  _BYTE *v1;

  v1 = *(_BYTE **)(*(_QWORD *)(a1 + 200) + 1760);
  if (*v1 == 8)
    v1 = *(_BYTE **)(*(_QWORD *)(a1 + 192) + 8112);
  return freeDeltaStackTo_1(a1, (uint64_t)v1);
}

void bsclr_pushca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  clearDeltaStackBack_0(a1);
  OUTLINED_FUNCTION_3_67(*(_QWORD *)(a1 + 200));
  *(_QWORD *)(v4 + 8) = a2;
}

void bspush_ca(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_3_67(*(_QWORD *)(a1 + 200));
  *(_QWORD *)(v2 + 8) = v1;
}

__n128 bspush_ca_scan(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __n128 *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  __n128 result;

  v3 = *(__n128 **)(a1 + 192);
  v2 = *(_QWORD *)(a1 + 200);
  v4 = *(int *)(v2 + 288);
  v5 = *(_QWORD *)(v2 + 1720) - v4;
  v6 = *(_DWORD *)(v2 + 1728);
  *(_BYTE *)v5 = 0;
  *(_QWORD *)(v5 + 8) = a2;
  v7 = *(int *)(v2 + 284);
  v8 = v5 - v7;
  *(_QWORD *)(v2 + 1720) = v8;
  *(_DWORD *)(v2 + 1728) = v6 - (v4 + v7);
  *(_BYTE *)v8 = 1;
  result = v3[505];
  *(__n128 *)(v8 + 8) = result;
  return result;
}

void bspush_boa(uint64_t a1)
{
  _BYTE *v1;

  OUTLINED_FUNCTION_5_59(*(_QWORD *)(a1 + 200));
  *v1 = 4;
}

void bspush_nboa(uint64_t a1)
{
  _BYTE *v1;

  OUTLINED_FUNCTION_5_59(*(_QWORD *)(a1 + 200));
  *v1 = 6;
}

void bspush_vbot(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_5_59(*(_QWORD *)(a1 + 200));
  *(_BYTE *)v1 = 5;
  *(_QWORD *)(v1 + 8) = *(_QWORD *)(v2 + 1760);
  *(_QWORD *)(v2 + 1760) = v1;
}

uint64_t bspop_vbot(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 200) + 1760) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 1720) + 8);
  return popDeltaStackTop(a1);
}

uint64_t back()
{
  return 1;
}

uint64_t back_nboa(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9296) = 1;
  return 1;
}

uint64_t freeDeltaStackTo_1(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(result + 200);
  v3 = *(_QWORD *)(v2 + 1744);
  if (v3)
  {
    *(_QWORD *)(v2 + 1720) = a2;
    *(_DWORD *)(v2 + 1728) = *(_DWORD *)(v2 + 1780) + a2 - *(_DWORD *)(v3 + 32);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_74@<X0>(uint64_t a1@<X0>, unsigned __int16 a2@<W8>, uint64_t a3, _WORD *a4, uint64_t a5)
{
  _WORD *v5;

  a4 = v5;
  a5 = a2;
  return vnspush(a1, &a4);
}

void OUTLINED_FUNCTION_2_68(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  a9 = 0;
  a10 = 0;
  vinitloc_new(a1, (uint64_t)&a9, a2);
}

void OUTLINED_FUNCTION_3_67(uint64_t a1@<X8>)
{
  uint64_t v1;
  _BYTE *v2;

  v1 = *(int *)(a1 + 288);
  v2 = (_BYTE *)(*(_QWORD *)(a1 + 1720) - v1);
  *(_QWORD *)(a1 + 1720) = v2;
  *(_DWORD *)(a1 + 1728) -= v1;
  *v2 = 0;
}

uint64_t OUTLINED_FUNCTION_4_62(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  a11 = 0;
  a12 = 0;
  return vnspop(a1, (uint64_t)&a11);
}

void OUTLINED_FUNCTION_5_59(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 1720) -= v1;
  *(_DWORD *)(a1 + 1728) -= v1;
}

uint64_t OUTLINED_FUNCTION_6_58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _WORD *a9)
{
  uint64_t v9;

  return vnspush(v9, &a9);
}

void starttest_l(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_75(a1, a2);
  OUTLINED_FUNCTION_18_45();
}

uint64_t clearDeltaStackBack_1(uint64_t a1)
{
  _BYTE *v1;

  v1 = *(_BYTE **)(*(_QWORD *)(a1 + 200) + 1760);
  if (*v1 == 8)
    v1 = *(_BYTE **)(*(_QWORD *)(a1 + 192) + 8112);
  return freeDeltaStackTo_2(a1, (uint64_t)v1);
}

void starttest_e(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_75(a1, a2);
  OUTLINED_FUNCTION_18_45();
}

void starttest(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_75(a1, a2);
  OUTLINED_FUNCTION_18_45();
}

BOOL testeq(uint64_t a1)
{
  return *(_BYTE *)(*(_QWORD *)(a1 + 192) + 8120) != 0;
}

BOOL testneq(uint64_t a1)
{
  return *(_BYTE *)(*(_QWORD *)(a1 + 192) + 8120) == 0;
}

BOOL testgt(uint64_t a1)
{
  return *(_BYTE *)(*(_QWORD *)(a1 + 192) + 8120) != 1;
}

BOOL testge(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 192) + 8120) == 255;
}

BOOL testlt(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 192) + 8120) != 255;
}

BOOL testle(uint64_t a1)
{
  return *(_BYTE *)(*(_QWORD *)(a1 + 192) + 8120) == 1;
}

BOOL compare_ptas(uint64_t a1)
{
  int v1;

  vcomp_pta(a1, a1 + 112, a1 + 144);
  return v1 != 0;
}

void compare_tvars(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  uint64_t *v6[2];
  uint64_t *v7[2];

  v7[0] = 0;
  v7[1] = 0;
  v6[0] = 0;
  v6[1] = 0;
  vinitloc_new(a1, (uint64_t)v7, a2);
  vinitloc_new(a1, (uint64_t)v6, a3);
  vcompare(a1, v7, v6);
  if (((__int16)*a2 & 0x80000000) == 0)
    a2[1] = -1;
  if (((__int16)*a3 & 0x80000000) == 0)
    a3[1] = -1;
}

BOOL test_string(_QWORD *a1, uint64_t a2, int a3, _BYTE *a4)
{
  uint64_t *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (***v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  __int16 v17;
  uint64_t *v19[2];
  uint64_t *v20;
  uint64_t v21;
  double v22;
  __int16 v23;
  unint64_t v24;

  v24 = 0;
  v23 = 0;
  v22 = 0.0;
  if (!a3)
    return vscanadvOverToken() == 0;
  v20 = 0;
  v21 = 0;
  v5 = (uint64_t *)(a4 + 1);
  v6 = *a4 - 199;
  switch(*a4)
  {
    case 0xC7:
      LOWORD(v21) = -1;
      break;
    case 0xC8:
      v8 = -2;
      goto LABEL_8;
    case 0xC9:
      LOWORD(v21) = -3;
      v9 = (uint64_t *)&v24;
      goto LABEL_10;
    case 0xCA:
      v8 = -4;
LABEL_8:
      LOWORD(v21) = v8;
      v9 = (uint64_t *)&v23;
      goto LABEL_10;
    case 0xCB:
      LOWORD(v21) = -5;
      v9 = (uint64_t *)&v22;
LABEL_10:
      v20 = v9;
      break;
    default:
      break;
  }
  v10 = (uint64_t *)&a4[a3];
  v19[0] = 0;
  v19[1] = 0;
  OUTLINED_FUNCTION_10_55();
  v12 = (uint64_t (***)(uint64_t))(v11 + 16);
  while (v5 < v10)
  {
    if (*(_BYTE *)(a1[24] + 8089))
      OUTLINED_FUNCTION_6_59();
    else
      OUTLINED_FUNCTION_11_52();
    v15 = *(_QWORD *)(*(_QWORD *)(v13 + 8080) + 8 * v14);
    if ((v15 & 0xFFFFFFFFFFFFFFFCLL) == 0)
      return 1;
    if ((*(_BYTE *)(v15 & 0xFFFFFFFFFFFFFFFCLL) & 2) == 0)
    {
      switch(v6)
      {
        case 0:
          v20 = v5;
          v5 = (uint64_t *)((char *)v5 + 1);
          break;
        case 1:
        case 2:
          v16 = ((unint64_t)*((unsigned __int8 *)v5 + 1) << 16) & 0xFFFFFFFF80FFFFFFLL | ((unint64_t)(*(_BYTE *)v5 & 0x7F) << 24) | ((unint64_t)*((unsigned __int8 *)v5 + 2) << 8) | *((unsigned __int8 *)v5 + 3);
          v24 = v16;
          if (*(char *)v5 < 0)
            v24 = -(uint64_t)v16;
          v5 = (uint64_t *)((char *)v5 + 4);
          break;
        case 3:
          v17 = *((unsigned __int8 *)v5 + 1) | ((*(_BYTE *)v5 & 0x7F) << 8);
          v23 = v17;
          if (*(char *)v5 < 0)
            v23 = -v17;
          v5 = (uint64_t *)((char *)v5 + 2);
          break;
        case 4:
          v22 = atof((const char *)v5);
          break;
        default:
          break;
      }
      v19[0] = (uint64_t *)OUTLINED_FUNCTION_20_45(*v12);
      vcompare((uint64_t)a1, &v20, v19);
      if (*(_BYTE *)(a1[24] + 8120))
        return 1;
    }
    v7 = 1;
    if (!OUTLINED_FUNCTION_5_60(a1, 1))
      return v7;
  }
  return 0;
}

uint64_t test_string_s(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t *a4)
{
  uint64_t *v4;
  unint64_t v6;
  char *v7;
  int v8;
  uint64_t v9;
  int v10;
  _BYTE *v11;
  char v12;
  int v13;
  int v14;
  _BYTE *v15;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;

  v4 = a4;
  v19 = 0;
  v20 = 0;
  v17 = 0;
  v18 = 0;
  v6 = (unint64_t)a4 + a3;
  v7 = vstmtbl[12 * a2 + 1];
  v8 = *((unsigned __int16 *)v7 + 15);
  if (v8 == 0xFFFF)
  {
    OUTLINED_FUNCTION_19_45();
    v9 = 1;
    while ((unint64_t)v4 < v6)
    {
      OUTLINED_FUNCTION_9_56();
      if (v14)
        OUTLINED_FUNCTION_6_59();
      else
        OUTLINED_FUNCTION_11_52();
      OUTLINED_FUNCTION_8_57();
      if (v12)
        return 1;
      if ((*v15 & 2) == 0)
      {
        if (*(unsigned __int8 *)OUTLINED_FUNCTION_4_63((uint64_t)v15) != *(unsigned __int8 *)v4)
          return 1;
        v4 = (uint64_t *)((char *)v4 + 1);
      }
      if (!OUTLINED_FUNCTION_2_69())
        return v9;
    }
  }
  else
  {
    LOWORD(v20) = -1;
    BYTE2(v20) = v7[32];
    BYTE2(v18) = BYTE2(v20);
    LOWORD(v18) = v8;
    OUTLINED_FUNCTION_19_45();
    v9 = 1;
    while ((unint64_t)v4 < v6)
    {
      OUTLINED_FUNCTION_9_56();
      if (v10)
        OUTLINED_FUNCTION_6_59();
      else
        OUTLINED_FUNCTION_11_52();
      OUTLINED_FUNCTION_8_57();
      if (v12)
        return 1;
      if ((*v11 & 2) == 0)
      {
        v19 = v4;
        v17 = (uint64_t *)OUTLINED_FUNCTION_4_63((uint64_t)v11);
        vcompare(a1, &v19, &v17);
        OUTLINED_FUNCTION_21_44();
        if (v13)
          return 1;
        v4 = (uint64_t *)((char *)v4 + 1);
      }
      if (!OUTLINED_FUNCTION_2_69())
        return v9;
    }
  }
  return 0;
}

void test_string_l()
{
  unint64_t v0;
  unint64_t v1;
  int v2;
  _BYTE *v3;
  char v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  OUTLINED_FUNCTION_15_47();
  OUTLINED_FUNCTION_1_70();
  do
  {
    if (v0 >= v1)
      break;
    OUTLINED_FUNCTION_9_56();
    if (v2)
      OUTLINED_FUNCTION_6_59();
    else
      OUTLINED_FUNCTION_11_52();
    OUTLINED_FUNCTION_8_57();
    if (v4)
      break;
    if ((*v3 & 2) == 0)
    {
      OUTLINED_FUNCTION_17_46();
      v6 = (uint64_t *)OUTLINED_FUNCTION_4_63(v5);
      OUTLINED_FUNCTION_3_68(v6, v7);
      OUTLINED_FUNCTION_21_44();
      if (v8)
        break;
      v0 += 2;
    }
  }
  while (OUTLINED_FUNCTION_2_69());
  OUTLINED_FUNCTION_7_59();
}

void test_string_lng(uint64_t a1, uint64_t a2, unsigned int a3, unint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  int v6;
  _BYTE *v7;
  char v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v4 = a4;
  v5 = a4 + a3;
  OUTLINED_FUNCTION_1_70();
  do
  {
    if (v4 >= v5)
      break;
    OUTLINED_FUNCTION_9_56();
    if (v6)
      OUTLINED_FUNCTION_6_59();
    else
      OUTLINED_FUNCTION_11_52();
    OUTLINED_FUNCTION_8_57();
    if (v8)
      break;
    if ((*v7 & 2) == 0)
    {
      v9 = (uint64_t *)OUTLINED_FUNCTION_4_63((uint64_t)v7);
      OUTLINED_FUNCTION_3_68(v9, v10);
      OUTLINED_FUNCTION_21_44();
      if (v11)
        break;
      v4 += 4;
    }
  }
  while (OUTLINED_FUNCTION_2_69());
  OUTLINED_FUNCTION_7_59();
}

void test_string_i()
{
  unint64_t v0;
  unint64_t v1;
  int v2;
  _BYTE *v3;
  char v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  OUTLINED_FUNCTION_15_47();
  OUTLINED_FUNCTION_1_70();
  do
  {
    if (v0 >= v1)
      break;
    OUTLINED_FUNCTION_9_56();
    if (v2)
      OUTLINED_FUNCTION_6_59();
    else
      OUTLINED_FUNCTION_11_52();
    OUTLINED_FUNCTION_8_57();
    if (v4)
      break;
    if ((*v3 & 2) == 0)
    {
      OUTLINED_FUNCTION_17_46();
      v6 = (uint64_t *)OUTLINED_FUNCTION_4_63(v5);
      OUTLINED_FUNCTION_3_68(v6, v7);
      OUTLINED_FUNCTION_21_44();
      if (v8)
        break;
      v0 += 2;
    }
  }
  while (OUTLINED_FUNCTION_2_69());
  OUTLINED_FUNCTION_7_59();
}

uint64_t test_string_f()
{
  uint64_t v0;
  const char *v1;
  uint64_t v2;
  int v3;
  const char *v4;
  uint64_t v5;
  uint64_t (***v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_10_55();
  if (!v3)
    return 0;
  v4 = v1;
  v5 = v0;
  v6 = (uint64_t (***)(uint64_t))(v2 + 16);
  while (1)
  {
    if (*(_BYTE *)(*(_QWORD *)(v5 + 192) + 8089))
      OUTLINED_FUNCTION_6_59();
    else
      OUTLINED_FUNCTION_11_52();
    v9 = *(_QWORD *)(*(_QWORD *)(v7 + 8080) + 8 * v8);
    if ((v9 & 0xFFFFFFFFFFFFFFFCLL) == 0)
      break;
    if ((*(_BYTE *)(v9 & 0xFFFFFFFFFFFFFFFCLL) & 2) == 0)
    {
      atof(v4);
      v10 = (uint64_t *)OUTLINED_FUNCTION_20_45(*v6);
      OUTLINED_FUNCTION_3_68(v10, v11);
      if (*(_BYTE *)(*(_QWORD *)(v5 + 192) + 8120))
        break;
    }
    v12 = 1;
    if (!OUTLINED_FUNCTION_2_69())
      return v12;
  }
  return 1;
}

uint64_t test_ptr(uint64_t a1)
{
  uint64_t v2;

  if (!*(_QWORD *)(a1 + 112))
    return 1;
  if ((*(_BYTE *)(a1 + 136) & 2) != 0)
    vnormalize(a1, a1 + 112);
  v2 = 1;
  while (*(_QWORD *)(*(_QWORD *)(a1 + 192) + 8080) != *(_QWORD *)(a1 + 112))
  {
    if (!OUTLINED_FUNCTION_5_60((_QWORD *)a1, 0))
      return v2;
  }
  return 0;
}

uint64_t test_time(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[2];

  v4 = *(_OWORD *)(a1 + 128);
  v17[0] = *(_OWORD *)(a1 + 112);
  v17[1] = v4;
  vtsttmark_tv(a1, (uint64_t)v17);
  v5 = 1;
  if (!v6)
  {
    *(_QWORD *)(a1 + 144) = *(_QWORD *)(*(_QWORD *)(a1 + 192) + 8080);
    *(_BYTE *)(a1 + 168) = 1;
    OUTLINED_FUNCTION_14_48();
    if (!v7)
    {
      while (1)
      {
        v9 = *(_QWORD *)(a1 + 192);
        if (!*(_BYTE *)(v9 + 8120))
          break;
        if (!OUTLINED_FUNCTION_5_60((_QWORD *)a1, 0))
          return v5;
        *(_QWORD *)(a1 + 144) = *(_QWORD *)(*(_QWORD *)(a1 + 192) + 8080);
        OUTLINED_FUNCTION_14_48();
        if (v10)
          return 1;
      }
      v5 = 0;
      v11 = *(_QWORD *)(a1 + 200);
      v12 = *(int *)(v11 + 288);
      v13 = *(_QWORD *)(v11 + 1720) - v12;
      v14 = *(_DWORD *)(v11 + 1728);
      *(_BYTE *)v13 = 3;
      *(_QWORD *)(v13 + 8) = a2;
      v15 = *(int *)(v11 + 284);
      v16 = v13 - v15;
      *(_QWORD *)(v11 + 1720) = v16;
      *(_DWORD *)(v11 + 1728) = v14 - (v12 + v15);
      *(_BYTE *)v16 = 1;
      *(_OWORD *)(v16 + 8) = *(_OWORD *)(v9 + 8080);
      *(_BYTE *)(*(_QWORD *)(a1 + 280) + *(unsigned __int8 *)(*(_QWORD *)(a1 + 264) + *(unsigned __int8 *)(a1 + 120))) = 1;
    }
  }
  return v5;
}

void test_synch(_QWORD *a1, uint64_t a2, unsigned int a3, unsigned __int8 *a4)
{
  int v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  unsigned int v14;

  v7 = 0;
  v8 = a3;
  while (!v7)
  {
    v9 = 0;
    v7 = 1;
    while (v9 < v8 && v7)
    {
      if ((*(_QWORD *)(*(_QWORD *)(a1[24] + 8080) + 8 * (*(_DWORD *)(a1[24] + 9084) + a4[v9])) & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        v10 = OUTLINED_FUNCTION_5_60(a1, 0);
        v7 = 0;
        if (!v10)
          goto LABEL_13;
      }
      ++v9;
    }
  }
  OUTLINED_FUNCTION_13_48(a1[25]);
  *(_QWORD *)(v11 + 8) = a2;
  *(_QWORD *)(v12 + 1720) = v11 - *(int *)(v12 + 284);
  OUTLINED_FUNCTION_12_50(v12);
  for (; v8; --v8)
  {
    v14 = *a4++;
    *(_BYTE *)(a1[35] + *(unsigned __int8 *)(a1[33] + v14)) = v13;
  }
LABEL_13:
  OUTLINED_FUNCTION_16_46();
}

void test_fence(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  int v8;
  char v9;
  uint64_t v10;
  int v11;
  int v12;
  char v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;

  if (a3)
  {
    v8 = 0;
    while (!v8)
    {
      v9 = 0;
      v8 = 1;
      while (a3 > v9 && v8)
      {
        v10 = *(unsigned __int8 *)(a4 + v9);
        if (*(unsigned __int8 *)(*(_QWORD *)(a1 + 264) + v10) == *(unsigned __int8 *)(a1 + 288)
          && !FENCED(a1, *(_QWORD *)(*(_QWORD *)(a1 + 192) + 8080), (char)v10))
        {
          v11 = OUTLINED_FUNCTION_5_60((_QWORD *)a1, 0);
          v8 = 0;
          if (!v11)
            goto LABEL_30;
        }
        else
        {
          v8 = 1;
        }
        ++v9;
      }
    }
    v18 = 0;
    v20 = *(_QWORD *)(a1 + 192);
    v19 = *(_QWORD *)(a1 + 200);
    v21 = *(int *)(v19 + 288);
    v22 = *(_QWORD *)(v19 + 1720) - v21;
    *(_BYTE *)v22 = 3;
    *(_QWORD *)(v22 + 8) = a2;
    v23 = *(int *)(v19 + 284);
    v24 = v22 - v23;
    LODWORD(v21) = v21 + v23;
    LODWORD(v23) = *(_DWORD *)(v19 + 1728);
    *(_QWORD *)(v19 + 1720) = v24;
    *(_DWORD *)(v19 + 1728) = v23 - v21;
    *(_BYTE *)v24 = 1;
    *(_OWORD *)(v24 + 8) = *(_OWORD *)(v20 + 8080);
    while (a3 > v18)
      *(_BYTE *)(*(_QWORD *)(a1 + 280) + *(unsigned __int8 *)(*(_QWORD *)(a1 + 264) + *(unsigned __int8 *)(a4 + v18++))) = 1;
  }
  else
  {
    v12 = 0;
    while (!v12)
    {
      v13 = 0;
      v12 = 1;
      while (1)
      {
        v14 = v13;
        v15 = *(unsigned __int8 *)(a1 + 288);
        if (!v12 || v14 >= v15)
          break;
        v16 = *(_QWORD *)(a1 + 192);
        if (v14 == *(unsigned __int8 *)(v16 + 8088)
          || *(unsigned __int8 *)(*(_QWORD *)(a1 + 264) + v14) != v15
          || FENCED(a1, *(_QWORD *)(v16 + 8080), v14))
        {
          v12 = 1;
        }
        else
        {
          v17 = OUTLINED_FUNCTION_5_60((_QWORD *)a1, 0);
          v12 = 0;
          if (!v17)
            goto LABEL_30;
        }
        v13 = v14 + 1;
      }
    }
    OUTLINED_FUNCTION_13_48(*(_QWORD *)(a1 + 200));
    *(_QWORD *)(v25 + 8) = a2;
    *(_QWORD *)(v26 + 1720) = v25 - *(int *)(v26 + 284);
    OUTLINED_FUNCTION_12_50(v26);
    *(_BYTE *)(*(_QWORD *)(a1 + 192) + 8090) = v27;
  }
LABEL_30:
  OUTLINED_FUNCTION_16_46();
}

BOOL test_eof(uint64_t a1, char a2)
{
  return !vf_eof(a1, a2);
}

uint64_t test_hasval(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 184);
  *(_DWORD *)(v1 + 436) = 0;
  *(_BYTE *)(v1 + 32) = 0;
  return 1;
}

uint64_t freeDeltaStackTo_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(result + 200);
  v3 = *(_QWORD *)(v2 + 1744);
  if (v3)
  {
    *(_QWORD *)(v2 + 1720) = a2;
    *(_DWORD *)(v2 + 1728) = *(_DWORD *)(v2 + 1780) + a2 - *(_DWORD *)(v3 + 32);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_75(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(*(_QWORD *)(a1 + 192) + 8064) = a2;
  result = clearDeltaStackBack_1(a1);
  v5 = *(_QWORD *)(a1 + 192);
  v4 = *(_QWORD *)(a1 + 200);
  v6 = *(int *)(v4 + 288);
  v7 = *(_QWORD *)(v4 + 1720) - v6;
  *(_QWORD *)(v4 + 1720) = v7;
  *(_DWORD *)(v4 + 1728) -= v6;
  *(_BYTE *)v7 = 0;
  *(_QWORD *)(v7 + 8) = *(_QWORD *)(v5 + 8064);
  *(_BYTE *)(v5 + 8096) = 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_69()
{
  _QWORD *v0;

  return vscanadv(v0, 1, 1);
}

void OUTLINED_FUNCTION_3_68(uint64_t *a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t *v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v3 = a1;
  vcompare(v2, (uint64_t **)va1, (uint64_t **)va);
}

uint64_t OUTLINED_FUNCTION_4_63@<X0>(uint64_t a1@<X8>)
{
  uint64_t (***v1)(uint64_t);

  return (**v1)(a1 + 16);
}

uint64_t OUTLINED_FUNCTION_5_60(_QWORD *a1, int a2)
{
  return vscanadv(a1, a2, 1);
}

__n128 OUTLINED_FUNCTION_12_50@<Q0>(uint64_t a1@<X8>)
{
  __n128 *v1;
  int v2;
  uint64_t v3;
  int v4;
  __n128 result;

  *(_DWORD *)(a1 + 1728) = v4 - v2;
  *(_BYTE *)v3 = 1;
  result = v1[505];
  *(__n128 *)(v3 + 8) = result;
  return result;
}

void OUTLINED_FUNCTION_13_48(uint64_t a1@<X8>)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 1720) - *(int *)(a1 + 288)) = 3;
}

void OUTLINED_FUNCTION_14_48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  vcomp_pta(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_20_45@<X0>(uint64_t (**a1)(uint64_t)@<X8>)
{
  uint64_t v1;

  return (*a1)(v1 + 16);
}

uint64_t num_streams(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 288);
}

uint64_t num_fields_in_stream(int a1)
{
  return LODWORD(vstmtbl[12 * a1 + 8]);
}

char *stream_name(int a1)
{
  return vstmtbl[12 * a1];
}

uint64_t single_letter_stream(int a1)
{
  return LOBYTE(vstmtbl[12 * a1 + 10]);
}

uint64_t time_stream(int a1)
{
  return BYTE6(vstmtbl[12 * a1 + 10]);
}

uint64_t num_fields(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = 0;
  result = 0;
  while (16 * (*(_DWORD *)a1 & ~(*(int *)a1 >> 31)) != v2)
  {
    result = (*(_DWORD *)(*(_QWORD *)(a1 + 8) + v2 + 4) + result);
    v2 += 16;
  }
  return result;
}

uint64_t field_name(int a1, int a2)
{
  return *(_QWORD *)&vstmtbl[12 * a1 + 1][40 * a2];
}

uint64_t first_field(uint64_t a1, uint64_t a2, _BYTE *a3, _DWORD *a4)
{
  uint64_t v4;

  *(_QWORD *)(*(_QWORD *)(a1 + 200) + 300) = 0;
  if (*(int *)a2 < 1)
    return OUTLINED_FUNCTION_7_60();
  v4 = *(_QWORD *)(a2 + 8);
  if (*(int *)(v4 + 4) < 1)
    return OUTLINED_FUNCTION_7_60();
  else
    return OUTLINED_FUNCTION_3_69(a1, a2, a3, a4, *(_BYTE *)v4);
}

uint64_t next_field(uint64_t a1, uint64_t a2, _BYTE *a3, _DWORD *a4)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 200);
  v5 = *(_DWORD *)(v4 + 304) + 1;
  *(_DWORD *)(v4 + 304) = v5;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(int *)(v4 + 300);
  if (v5 < *(_DWORD *)(v6 + 16 * v7 + 4))
    return OUTLINED_FUNCTION_3_69(a1, a2, a3, a4, *(_BYTE *)(v6 + 16 * v7));
  LODWORD(v7) = v7 + 1;
  *(_DWORD *)(v4 + 300) = v7;
  if ((int)v7 < *(_DWORD *)a2)
  {
    *(_DWORD *)(v4 + 304) = 0;
    v7 = (int)v7;
    return OUTLINED_FUNCTION_3_69(a1, a2, a3, a4, *(_BYTE *)(v6 + 16 * v7));
  }
  return OUTLINED_FUNCTION_7_60();
}

uint64_t left_delta(uint64_t a1)
{
  return **(_QWORD **)(a1 + 200);
}

uint64_t right_delta(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 200) + 8);
}

unint64_t sync_to_right(uint64_t a1, int a2, uint64_t a3)
{
  return VRSYNC(a1, a3, a2);
}

_QWORD *sync_to_left(uint64_t a1, int a2, uint64_t a3)
{
  return VLSYNC(a3, a2);
}

uint64_t is_token_prev(int a1, uint64_t a2)
{
  if ((*(_QWORD *)(a2 + 8 * a1 + 24) & 0xFFFFFFFFFFFFFFFCLL) != 0
    && (*(_BYTE *)(*(_QWORD *)(a2 + 8 * a1 + 24) & 0xFFFFFFFFFFFFFFFCLL) & 2) != 0)
  {
    return OUTLINED_FUNCTION_7_60();
  }
  else
  {
    return OUTLINED_FUNCTION_5_61();
  }
}

uint64_t is_token_next()
{
  uint64_t v0;
  _BYTE *v1;

  OUTLINED_FUNCTION_24_42();
  v1 = (_BYTE *)(v0 & 0xFFFFFFFFFFFFFFFCLL);
  if (v1 && (*v1 & 2) != 0)
    return OUTLINED_FUNCTION_7_60();
  else
    return OUTLINED_FUNCTION_5_61();
}

unint64_t prev_token(int a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 8 * a1 + 24) & 0xFFFFFFFFFFFFFFFCLL;
}

unint64_t next_token()
{
  uint64_t v0;

  OUTLINED_FUNCTION_24_42();
  return v0 & 0xFFFFFFFFFFFFFFFCLL;
}

_QWORD *left_context()
{
  int v0;
  uint64_t v1;
  char v2;

  OUTLINED_FUNCTION_24_42();
  if ((v2 & 1) == 0)
    return VLSYNC(v1, v0);
  return (_QWORD *)v1;
}

unint64_t right_context(uint64_t a1, int a2, uint64_t a3)
{
  if ((*(_QWORD *)(a3 + 8 * (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a2)) & 1) == 0)
    return VRSYNC(a1, a3, a2);
  return a3;
}

BOOL syncmark_equ(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void valid_prefix()
{
  char v1;
  char v2;

  OUTLINED_FUNCTION_9_57();
  if (!(!v2 & v1))
    __asm { BR              X10 }
  OUTLINED_FUNCTION_4_64();
}

BOOL allchrs(unsigned __int8 *a1)
{
  int v1;

  while (1)
  {
    v1 = *a1;
    if (v1 != 45)
      break;
    ++a1;
  }
  return v1 == 0;
}

uint64_t strprefix(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;
  int v4;

  while (1)
  {
    v3 = *a2++;
    v2 = v3;
    if (!v3)
      break;
    v4 = *a1++;
    if (v4 != v2)
      return OUTLINED_FUNCTION_7_60();
  }
  return OUTLINED_FUNCTION_5_61();
}

void legal_long()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  char *v12;

  v2 = OUTLINED_FUNCTION_6_60();
  OUTLINED_FUNCTION_10_56(v2, v3, v4, v5, v6, v7, v8, v9, v11, v12);
  OUTLINED_FUNCTION_22_44();
  if (!v10 && *__error() != 34 && v0)
    *v0 = v1;
  OUTLINED_FUNCTION_20_46();
}

void legal_int()
{
  _DWORD *v0;
  uint64_t v1;
  int *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v12;
  uint64_t v13;
  char *v14;

  v2 = OUTLINED_FUNCTION_6_60();
  OUTLINED_FUNCTION_10_56(v2, v3, v4, v5, v6, v7, v8, v9, v13, v14);
  OUTLINED_FUNCTION_22_44();
  if (!v10)
  {
    v12 = *__error() == 34 || v1 > 0x7FFFFFFF || v1 < (uint64_t)0xFFFFFFFF80000000;
    if (!v12 && v0)
      *v0 = v1;
  }
  OUTLINED_FUNCTION_20_46();
}

uint64_t legal_double()
{
  double *v0;
  const char *v1;
  double v2;
  double v3;
  char *v5;

  *OUTLINED_FUNCTION_6_60() = 35;
  v2 = strtod(v1, &v5);
  if (*v5)
    return 0;
  v3 = v2;
  if (*__error() == 34)
    return 0;
  if (v0)
    *v0 = v3;
  return 1;
}

void valid_prefix_char(int a1, int a2, int a3)
{
  unsigned __int8 v3;
  char *v4;
  unsigned int v5;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v3 = a3;
  v4 = vstmtbl[12 * a1 + 1];
  v5 = *(__int16 *)&v4[40 * a2 + 30];
  if (v5 + 4 >= 2 && v5 >= 0xFFFFFFFE)
  {
    v7 = *(_WORD *)&v4[40 * a2 + 28];
    if (a3 == 45)
    {
      v8 = 0;
      v9 = v7 & ~(v7 >> 31);
      while (8 * v9 != v8)
      {
        v8 += 8;
        if (!OUTLINED_FUNCTION_17_47())
          goto LABEL_14;
      }
    }
    else
    {
      v9 = v7 & ~(v7 >> 31);
    }
    v10 = 0;
    do
    {
      if (8 * v9 == v10)
        break;
      v11 = **(unsigned __int8 **)(*(_QWORD *)&v4[40 * a2 + 16] + v10);
      v10 += 8;
    }
    while (v11 != v3);
  }
LABEL_14:
  OUTLINED_FUNCTION_4_64();
}

uint64_t unique_value(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  char v5;
  char v6;

  if (*a4)
  {
    OUTLINED_FUNCTION_9_57();
    if (!(!v6 & v5))
      __asm { BR              X10 }
  }
  return 0;
}

uint64_t non_unique_value(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  char v5;
  char v6;

  if (*a4)
  {
    OUTLINED_FUNCTION_9_57();
    if (!(!v6 & v5))
      __asm { BR              X10 }
  }
  return 0;
}

BOOL enum_field(int a1, int a2)
{
  return *(unsigned __int16 *)&vstmtbl[12 * a1 + 1][40 * a2 + 30] > 0xFFFDu;
}

char *field_value(int a1, uint64_t a2, int a3, char *a4)
{
  char **v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  _QWORD *v10;
  double v11;
  BOOL v12;
  int v13;
  int v14;
  double v15;
  BOOL v16;
  _QWORD *v17;
  double v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;

  v5 = &vstmtbl[12 * a1];
  v8 = v5[1];
  v7 = v5 + 1;
  v6 = v8;
  switch(*(_WORD *)&v8[40 * a3 + 30])
  {
    case 0xFFFB:
      v10 = (_QWORD *)OUTLINED_FUNCTION_0_76(a2, (uint64_t)vstmtbl);
      v11 = *(double *)v10;
      if (*(_BYTE *)(*v7 + 40 * a3 + 32))
        v12 = v11 == 2.22507386e-308;
      else
        v12 = 0;
      if (v12)
        goto LABEL_19;
      sprintf(a4, *(const char **)(*v7 + 40 * a3 + 8), v11, *v10);
      return a4;
    case 0xFFFC:
      v14 = *(unsigned __int16 *)OUTLINED_FUNCTION_0_76(a2, (uint64_t)vstmtbl);
      if (*(_BYTE *)(*v7 + 40 * a3 + 32))
        v16 = v14 == 32769;
      else
        v16 = 0;
      if (v16)
        goto LABEL_19;
      sprintf(a4, *(const char **)(*v7 + 40 * a3 + 8), v15, (__int16)v14);
      return a4;
    case 0xFFFD:
      v17 = (_QWORD *)OUTLINED_FUNCTION_0_76(a2, (uint64_t)vstmtbl);
      if (*(_BYTE *)(*v7 + 40 * a3 + 32))
        v19 = *v17 == -2147483647;
      else
        v19 = 0;
      if (v19)
      {
LABEL_19:
        v13 = 5259591;
        goto LABEL_26;
      }
      sprintf(a4, *(const char **)(*v7 + 40 * a3 + 8), v18, *v17);
      return a4;
    case 0xFFFE:
      v20 = *(_QWORD *)&v6[40 * a3 + 16];
      v21 = *(int *)OUTLINED_FUNCTION_0_76(a2, (uint64_t)vstmtbl);
      goto LABEL_22;
    case 0xFFFF:
      v20 = *(_QWORD *)&v6[40 * a3 + 16];
      v21 = *(unsigned __int8 *)OUTLINED_FUNCTION_0_76(a2, (uint64_t)vstmtbl);
LABEL_22:
      v22 = strcpy(a4, *(const char **)(v20 + 8 * v21));
      if (!strcmp(v22, "undefined"))
      {
        v13 = 2960685;
      }
      else
      {
        if (strcmp(a4, " "))
          return a4;
        v13 = 2564135;
      }
LABEL_26:
      *(_DWORD *)a4 = v13;
      return a4;
    default:
      v13 = 4144959;
      goto LABEL_26;
  }
}

uint64_t time_field_value(int a1, uint64_t a2)
{
  int v2;

  if (!BYTE6(vstmtbl[12 * a1 + 10]))
    return 0xFFFFFFFFLL;
  v2 = *((__int16 *)vstmtbl[12 * a1 + 1] + 15);
  if (v2 != -4)
  {
    if (v2 == -3)
      return *(unsigned int *)OUTLINED_FUNCTION_11_53(a2, (uint64_t)vstmtbl);
    return 0xFFFFFFFFLL;
  }
  return *(__int16 *)OUTLINED_FUNCTION_11_53(a2, (uint64_t)vstmtbl);
}

unsigned __int8 *first_fieldval(uint64_t a1, char a2, int a3, unsigned __int8 *a4)
{
  uint64_t v5;
  BOOL v6;

  v5 = *(_QWORD *)(a1 + 200);
  *(_BYTE *)(v5 + 308) = a2;
  *(_DWORD *)(v5 + 312) = a3;
  *(_QWORD *)(v5 + 320) = a4;
  *(_DWORD *)(v5 + 328) = -1;
  if (a4)
    v6 = allchrs(a4);
  else
    v6 = 0;
  *(_BYTE *)(v5 + 332) = v6;
  return next_fieldval(a1);
}

unsigned __int8 *next_fieldval(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v5;
  _BYTE *v6;
  uint64_t v7;
  char *v8;
  int v9;
  unsigned __int8 *v10;

  v1 = *(_QWORD *)(a1 + 200);
  v2 = *(int *)(v1 + 328);
  v3 = v2 + 1;
  *(_DWORD *)(v1 + 328) = v2 + 1;
  v4 = vstmtbl[12 * *(char *)(v1 + 308) + 1];
  v5 = *(_DWORD *)(v1 + 312);
  if ((int)v2 + 1 < *(__int16 *)&v4[40 * v5 + 28])
  {
    v6 = *(_BYTE **)(v1 + 320);
    if (!v6 || !*v6)
      return *(unsigned __int8 **)(*(_QWORD *)&v4[40 * v5 + 16] + 8 * (int)v3);
  }
  v7 = *(__int16 *)&v4[40 * v5 + 28];
  v8 = &v4[40 * v5 + 16];
  v9 = v2 + 2;
  while (v3 < v7)
  {
    v10 = *(unsigned __int8 **)(*(_QWORD *)v8 + 8 * v3);
    if (strprefix(v10, *(unsigned __int8 **)(v1 + 320))
      || *(_BYTE *)(v1 + 332) && !strcmp((const char *)v10, "undefined"))
    {
      return v10;
    }
    ++v3;
    *(_DWORD *)(v1 + 328) = v9++;
  }
  return 0;
}

uint64_t can_del_sync(uint64_t a1, int a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v11;
  char v12;
  uint64_t result;
  uint64_t v14;
  char v15[81];
  char v16[81];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD **)(a1 + 200);
  if (*v3 == a3 || v3[1] == a3)
    return 0;
  if (!is_token_next() || !is_token_prev(a2, a3))
    return 1;
  v8 = *(_QWORD *)(a3 + 8 * a2 + 24) & 0xFFFFFFFFFFFFFFFCLL;
  v9 = *(_QWORD *)(a3 + 8 * (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a2)) & 0xFFFFFFFFFFFFFFFCLL;
  if (BYTE6(vstmtbl[12 * a2 + 10])
    || (OUTLINED_FUNCTION_21_45(a2, v8, v7, v16), result = 0, *(_DWORD *)v16 == 5259591)
    && (OUTLINED_FUNCTION_21_45(a2, v9, v14, v15), result = 0, *(_DWORD *)v15 == 5259591))
  {
    if (SLODWORD(vstmtbl[12 * a2 + 8]) > 1)
    {
      OUTLINED_FUNCTION_9_57();
      if (!(!v12 & v11))
        __asm { BR              X9 }
      return 0;
    }
    return 1;
  }
  return result;
}

uint64_t sync_in_stm()
{
  char v0;

  OUTLINED_FUNCTION_24_42();
  return v0 & 1;
}

unsigned __int16 *pvlist_size(unsigned __int16 *result)
{
  if (result)
    return (unsigned __int16 *)(bswap32(*result) >> 17);
  return result;
}

void *pvlist_name()
{
  uint64_t v0;
  __int16 v1;
  unsigned __int16 v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_12_51();
  v4 = vardesc(v0, v1, v2, v3);
  if (v4)
    return *(void **)v4;
  else
    return &unk_21F8A212A;
}

uint64_t pvlist_val()
{
  uint64_t v0;
  __int16 v1;
  unsigned __int16 v2;
  uint64_t v3;

  OUTLINED_FUNCTION_12_51();
  return *(_QWORD *)varloc(v0, v1, v2, v3);
}

uint64_t allow_left_ctxt(uint64_t a1, _BYTE *a2, int a3, _BYTE *a4)
{
  int v4;

  if (a2 != a4)
  {
    v4 = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a3;
    if ((*(_QWORD *)&a2[8 * v4] & 1) != 0)
    {
      while (a2 != a4)
      {
        a2 = (_BYTE *)(*(_QWORD *)&a2[8 * v4] & 0xFFFFFFFFFFFFFFFCLL);
        if (!a2 || (*a2 & 2) == 0)
          return OUTLINED_FUNCTION_7_60();
      }
    }
  }
  return OUTLINED_FUNCTION_5_61();
}

uint64_t allow_right_ctxt(uint64_t a1, _BYTE *a2, int a3, _BYTE *a4)
{
  int v4;

  if (a2 != a4)
  {
    v4 = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a3;
    if ((*(_QWORD *)&a2[8 * v4] & 1) != 0)
    {
      while (a2 != a4)
      {
        a2 = (_BYTE *)(*(_QWORD *)&a2[8 * v4] & 0xFFFFFFFFFFFFFFFCLL);
        if (!a2 || (*a2 & 2) == 0)
          return OUTLINED_FUNCTION_7_60();
      }
    }
  }
  return OUTLINED_FUNCTION_5_61();
}

char *extract_string(uint64_t a1, int a2, uint64_t a3, unint64_t a4, char *a5, int a6)
{
  unint64_t v9;
  int v12;
  int v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char v17;
  char v19[81];
  uint64_t v20;

  v9 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  visleft(a1, a3, a4);
  if (!v12)
    return 0;
  v13 = a6 - 1;
  v14 = a5;
  while (v9 != a4 && v13)
  {
    if (is_token_next())
    {
      v16 = v19;
      OUTLINED_FUNCTION_21_45(a2, *(_QWORD *)(v9 + 8 * (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a2)) & 0xFFFFFFFFFFFFFFFCLL, v15, v19);
      while (1)
      {
        v17 = *v16;
        if (!*v16 || !v13)
          break;
        ++v16;
        *v14++ = v17;
        --v13;
      }
    }
    v9 = VRSYNC(a1, v9, a2);
  }
  *v14 = 0;
  return a5;
}

BOOL init_stream(uint64_t a1, int a2)
{
  int v2;

  vinit_stm(a1, a2);
  return v2 != 0;
}

BOOL ins_tok_named(uint64_t *a1, int a2, uint64_t a3, char *__s1, uint64_t a5)
{
  _QWORD *v8;
  int v9;
  uint64_t v11;
  uint64_t v12;

  v12 = 0;
  v11 = a3;
  LOWORD(v12) = *((_WORD *)vstmtbl[12 * a2 + 1] + 15);
  *(_DWORD *)((char *)&v12 + 2) = strcmp(__s1, "GAP") == 0;
  v8 = VLSYNC(a5, a2);
  vins_tok(a1, a2, (uint64_t)v8, a5, (uint64_t)&v11);
  return v9 != 0;
}

void set_fld_value(uint64_t *a1, int a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned __int8 v9;
  _QWORD *v11;

  v9 = a2;
  v11 = VLSYNC(a6, a2);
  vmark(a1, v9, a3, (unint64_t)v11, a6, a4);
  OUTLINED_FUNCTION_18_46();
}

_QWORD *ins_sync(uint64_t a1, int a2, unint64_t a3, int a4)
{
  if (a4)
  {
    vins_sync(a1, a2, *(_QWORD *)(a3 + 8 * a2 + 24) & 0xFFFFFFFFFFFFFFFCLL, a3);
    return VLSYNC(a3, a2);
  }
  else
  {
    vins_sync(a1, a2, a3, *(_QWORD *)(a3 + 8 * (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a2)) & 0xFFFFFFFFFFFFFFFCLL);
    return (_QWORD *)VRSYNC(a1, a3, a2);
  }
}

uint64_t del_two_point(uint64_t *a1, char a2, uint64_t a3, uint64_t a4)
{
  vdel_2pt(a1, a2, a3, a4);
  return 1;
}

BOOL del_sync(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return vdel_1pt(a1, a2, a3) != 0;
}

uint64_t project_sync(uint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4, int a5)
{
  uint64_t v5;
  int v6;
  int v7;

  v5 = 0;
  if (a2 && a4)
  {
    if (a5)
    {
      vproj_l(a1, a2, a4, a3);
      if (v6)
        return 1;
    }
    else
    {
      vproj_r(a1, a2, a4, a3);
      if (v7)
        return 1;
    }
    return 0;
  }
  return v5;
}

void merge_sync(uint64_t a1, unint64_t a2, int a3, unint64_t a4)
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t i;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  unint64_t v18;
  int v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  int v25;

  if ((*(_QWORD *)(a4 + 8 * (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a3)) & 1) != 0
    && project_sync(a1, a2, a3, a4, 0))
  {
    if (a2 == a4)
    {
LABEL_37:
      vmerge(a1, a4, a2);
    }
    else
    {
      v7 = *(uint64_t **)(a1 + 200);
      v8 = *v7;
      v9 = v7[1];
      if ((v8 != a2 || v9 != a4) && (v8 != a4 || v9 != a2))
      {
        for (i = 0; ; ++i)
        {
          if (i >= *(unsigned __int8 *)(a1 + 288))
            goto LABEL_37;
          v13 = i + *(int *)(*(_QWORD *)(a1 + 192) + 9084);
          v14 = *(_QWORD *)(a2 + 8 * v13);
          v15 = *(_QWORD *)(a4 + 8 * v13);
          if ((v14 & 1) != 0)
          {
            if ((v15 & 1) != 0)
            {
              if ((v14 & 0xFFFFFFFFFFFFFFFCLL) != a4 && (*(_QWORD *)(a2 + 8 * i + 24) & 0xFFFFFFFFFFFFFFFCLL) != a4)
                break;
            }
            else
            {
              v18 = *(_QWORD *)(a4 + 8 * i + 24) & 0xFFFFFFFFFFFFFFFCLL;
              if (v18 != a2)
              {
                visleft(a1, v18, a2);
                if (!v19)
                  break;
              }
              v20 = v15 & 0xFFFFFFFFFFFFFFFCLL;
              if ((v15 & 0xFFFFFFFFFFFFFFFCLL) != a2)
              {
                v21 = a1;
                v22 = a2;
                goto LABEL_29;
              }
            }
          }
          else if ((v15 & 1) != 0)
          {
            v23 = *(_QWORD *)(a2 + 8 * i + 24) & 0xFFFFFFFFFFFFFFFCLL;
            if (v23 != a4)
            {
              visleft(a1, v23, a4);
              if (!v24)
                break;
            }
            v20 = v14 & 0xFFFFFFFFFFFFFFFCLL;
            if ((v14 & 0xFFFFFFFFFFFFFFFCLL) != a4)
            {
              v21 = a1;
              v22 = a4;
LABEL_29:
              visright(v21, v20, v22);
              if (!v25)
                break;
              continue;
            }
          }
          else
          {
            visleft(a1, v14 & 0xFFFFFFFFFFFFFFFCLL, *(_QWORD *)(a4 + 8 * i + 24) & 0xFFFFFFFFFFFFFFFCLL);
            if (v16)
              break;
            visright(a1, *(_QWORD *)(a2 + 8 * i + 24) & 0xFFFFFFFFFFFFFFFCLL, *(_QWORD *)(a4 + 8 * (i + *(int *)(*(_QWORD *)(a1 + 192) + 9084))) & 0xFFFFFFFFFFFFFFFCLL);
            if (v17)
              break;
          }
        }
      }
    }
  }
  OUTLINED_FUNCTION_18_46();
}

BOOL divide_time(uint64_t *a1, unsigned __int8 a2, unint64_t a3, __int16 a4)
{
  return vsplit_time(a1, a2, a3, a4) != 0;
}

void fill_stream_list(uint64_t a1, int *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  int i;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned __int8 *v13;
  unsigned int v14;
  uint64_t v15;
  unsigned __int8 *j;
  _BYTE *v18;
  int v19;
  BOOL v20;
  _QWORD *v21;
  uint64_t k;
  uint64_t v23;
  char *v24;
  size_t v25;
  void *v26;
  uint64_t m;
  char *v28;
  uint64_t v29;

  if (*a3)
  {
    v5 = OUTLINED_FUNCTION_8_58(*a3);
    *((_QWORD *)a2 + 1) = v5;
    if (!v5)
      goto LABEL_28;
    v6 = 0;
    for (i = 1; ; i = v12)
    {
      v8 = *a2;
      if (v6 >= v8)
        break;
      v9 = &a3[i];
      v10 = *((_QWORD *)a2 + 1);
      *(_BYTE *)(v10 + 16 * v6) = *v9;
      v11 = v9[1];
      v12 = i + 2;
      v13 = &a3[i + 2];
      v14 = 1;
      v15 = v11;
      for (j = v13; v15; --v15)
      {
        if (*j++)
          ++v14;
      }
      *(_DWORD *)(v10 + 16 * v6 + 4) = v14;
      v18 = OUTLINED_FUNCTION_13_49(v14);
      *(_QWORD *)(*((_QWORD *)a2 + 1) + 16 * v6 + 8) = v18;
      if (v18)
      {
        *v18 = 0;
        v12 = i + v11 + 2;
        v19 = 1;
        while (1)
        {
          v20 = __OFSUB__((_DWORD)v11, 1);
          LODWORD(v11) = v11 - 1;
          if ((int)v11 < 0 != v20)
            break;
          if (*v13)
            *(_BYTE *)(*(_QWORD *)(*((_QWORD *)a2 + 1) + 16 * v6 + 8) + v19++) = *v13;
          ++v13;
        }
      }
      ++v6;
    }
    v29 = *((_QWORD *)a2 + 1) + 16 * v8;
  }
  else
  {
    v21 = OUTLINED_FUNCTION_8_58(*(unsigned __int8 *)(a1 + 288));
    *((_QWORD *)a2 + 1) = v21;
    if (!v21)
      goto LABEL_28;
    for (k = 0; ; ++k)
    {
      v23 = *a2;
      if (k >= v23)
        break;
      v24 = (char *)&v21[2 * k];
      *v24 = k;
      v25 = SLODWORD(vstmtbl[12 * k + 8]);
      *((_DWORD *)v24 + 1) = v25;
      v26 = OUTLINED_FUNCTION_13_49(v25);
      v21 = (_QWORD *)*((_QWORD *)a2 + 1);
      v21[2 * k + 1] = v26;
      if (v26)
      {
        for (m = 0; ; ++m)
        {
          v28 = (char *)&v21[2 * k];
          if (m >= *((int *)v28 + 1))
            break;
          *(_BYTE *)(*((_QWORD *)v28 + 1) + m) = m;
          v21 = (_QWORD *)*((_QWORD *)a2 + 1);
        }
      }
    }
    v29 = (uint64_t)&v21[2 * v23];
  }
  if (!*(_QWORD *)(v29 - 8))
    free_stream_list(a2);
LABEL_28:
  OUTLINED_FUNCTION_4_64();
}

void free_stream_list(int *a1)
{
  uint64_t v2;
  uint64_t i;
  char *v4;

  v2 = 0;
  for (i = 8; ; i += 16)
  {
    v4 = (char *)*((_QWORD *)a1 + 1);
    if (v2 >= *a1)
      break;
    free(*(void **)&v4[i]);
    ++v2;
  }
  free(v4);
  *((_QWORD *)a1 + 1) = 0;
}

BOOL insert_string(uint64_t *a1, int a2, unint64_t a3, char *a4)
{
  _BOOL8 result;
  char **v6;
  char **v7;
  char *v8;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  __int16 *v15;
  __int16 v17;
  char v18;
  char __s2[2];

  result = 0;
  *(_WORD *)__s2 = 0;
  v6 = &vstmtbl[12 * a2];
  v8 = v6[1];
  v7 = v6 + 1;
  if (*((unsigned __int16 *)v8 + 15) >= 0xFFFEu)
  {
    if (LOBYTE(vstmtbl[12 * a2 + 10]))
    {
      if (is_token_prev(a2, a3))
LABEL_7:
        ins_sync((uint64_t)a1, a2, a3, 1);
LABEL_8:
      if (!*a4)
      {
        result = 1;
        *(_DWORD *)(a1[23] + 452) = 1;
        return result;
      }
      v12 = 0;
      __s2[0] = *a4;
      v13 = *v7;
      v14 = *((__int16 *)*v7 + 14) & ~(*((__int16 *)*v7 + 14) >> 31);
      while (v14 != v12)
      {
        if (!strcmp(*(const char **)(*((_QWORD *)v13 + 2) + 8 * v12), __s2))
        {
          if (*((__int16 *)v13 + 15) == -1)
          {
            v18 = v12;
            v15 = (__int16 *)&v18;
          }
          else
          {
            v17 = v12;
            v15 = &v17;
          }
          result = ins_tok_named(a1, a2, (uint64_t)v15, __s2, a3);
          if (!result)
            return result;
          if (*++a4)
            goto LABEL_7;
          goto LABEL_8;
        }
        ++v12;
      }
    }
    return 0;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_76@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a2 + 96 * v2 + 16) + 8 * v3))(a1 + 16);
}

uint64_t OUTLINED_FUNCTION_1_71()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t))(*v2 + 8 * v1))(v0);
}

uint64_t OUTLINED_FUNCTION_2_70()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t))(*v2 + 8 * v1))(v0);
}

uint64_t OUTLINED_FUNCTION_3_69@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X2>, _DWORD *a4@<X3>, char a5@<W8>)
{
  *a3 = a5;
  *a4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 8) + 16 * *(int *)(*(_QWORD *)(a1 + 200) + 300) + 8)
                           + *(int *)(*(_QWORD *)(a1 + 200) + 304));
  return 1;
}

uint64_t OUTLINED_FUNCTION_5_61()
{
  return 1;
}

int *OUTLINED_FUNCTION_6_60()
{
  return __error();
}

uint64_t OUTLINED_FUNCTION_7_60()
{
  return 0;
}

void *OUTLINED_FUNCTION_8_58(size_t a1)
{
  _DWORD *v1;

  *v1 = a1;
  return malloc_type_calloc(a1, 0x10uLL, 0x1010040449DF08BuLL);
}

uint64_t OUTLINED_FUNCTION_10_56(_DWORD *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *__endptr)
{
  const char *v10;

  *a1 = 35;
  return strtol(v10, &__endptr, 0);
}

uint64_t OUTLINED_FUNCTION_11_53@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  int v2;

  return (**(uint64_t (***)(uint64_t))(a2 + 96 * v2 + 16))(a1 + 16);
}

void *OUTLINED_FUNCTION_13_49(size_t a1)
{
  return malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
}

void OUTLINED_FUNCTION_14_49()
{
  legal_long();
}

void OUTLINED_FUNCTION_15_48()
{
  legal_int();
}

uint64_t OUTLINED_FUNCTION_16_47()
{
  return legal_double();
}

uint64_t OUTLINED_FUNCTION_17_47()
{
  const char *v0;
  uint64_t v1;
  _QWORD *v2;

  return strcmp(*(const char **)(*v2 + v1), v0);
}

char *OUTLINED_FUNCTION_21_45(int a1, uint64_t a2, uint64_t a3, char *a4)
{
  return field_value(a1, a2, 0, a4);
}

uint64_t OUTLINED_FUNCTION_22_44()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_23_42@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v2;

  return strprefix(*(unsigned __int8 **)(a1 + 8 * v2), v1);
}

uint64_t OUTLINED_FUNCTION_25_42@<X0>(uint64_t a1@<X8>)
{
  const char *v1;
  uint64_t v2;

  return strcmp(*(const char **)(a1 + 8 * v2), v1);
}

void vproj_r(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;

  if ((*(_QWORD *)(a2 + 8 * (*(int *)(*(_QWORD *)(a1 + 192) + 9084) + (unint64_t)a4)) & 1) == 0)
  {
    OUTLINED_FUNCTION_11_54();
    if (*(_DWORD *)(v9 + 8864))
    {
      OUTLINED_FUNCTION_2_71(v5, 1);
      OUTLINED_FUNCTION_2_71(v5, 0);
      v8 = *(int *)(*(_QWORD *)(v5 + 192) + 9084) + (unint64_t)v6;
    }
    v10 = (uint64_t *)(*(_QWORD *)(v7 + 8 * v8) & 0xFFFFFFFFFFFFFFFCLL);
    if (!v10 || (v11 = *(_QWORD *)(v7 + 8 * v8) & 0xFFFFFFFFFFFFFFFCLL, (*(_BYTE *)v10 & 2) == 0))
      v11 = v10[1] & 0xFFFFFFFFFFFFFFFCLL;
    project_rl(v5, v4, v7, v10, v6);
    if (NONSEQ(v4) && *(_DWORD *)(*(_QWORD *)(v5 + 192) + 8868))
    {
      OUTLINED_FUNCTION_10_57();
      INSSPINEL(v5, v4, v11);
    }
  }
  OUTLINED_FUNCTION_4_65();
}

unint64_t vgetsc(uint64_t a1, int a2, int a3, unint64_t a4, unsigned int a5)
{
  unint64_t v6;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  unsigned int j;
  int v17;
  unint64_t v18;
  uint64_t v19;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  int i;

  v6 = a4;
  if (a3)
  {
    if (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 8868))
    {
      if (!OUTLINED_FUNCTION_8_59())
      {
        v9 = *(_QWORD *)(a1 + 192);
        if (!*(_BYTE *)(*(_QWORD *)(v9 + 9072) + a5))
        {
          if (!a2)
          {
            for (i = *(_DWORD *)(v9 + 9084); ; v6 = *(_QWORD *)(v6 + 8 * (i - 2)) & 0xFFFFFFFFFFFFFFFCLL)
            {
              if ((*(_QWORD *)(v6 + 8 * (int)(i + a5)) & 1) != 0)
              {
                if (!OUTLINED_FUNCTION_8_59())
                  return v6;
                i = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084);
              }
            }
          }
          while (1)
          {
            if ((*(_QWORD *)(v6 + 8 * (int)(*(_DWORD *)(v9 + 9084) + a5)) & 1) != 0)
            {
              if (!OUTLINED_FUNCTION_8_59())
                return v6;
              v9 = *(_QWORD *)(a1 + 192);
            }
            v6 = *(_QWORD *)(v6 + 8) & 0xFFFFFFFFFFFFFFFCLL;
          }
        }
      }
    }
    v10 = 0;
    v11 = 1;
    v12 = v6;
    v13 = v6;
LABEL_6:
    if (v11 >= 1 && v6)
    {
      while (1)
      {
        v14 = v6;
        v15 = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084);
        if ((*(_QWORD *)(v6 + 8 * (int)(v15 + a5)) & 1) == 0)
          break;
        v6 = *(_QWORD *)(v6 + 8 * (v15 - 1)) & 0xFFFFFFFFFFFFFFFCLL;
        v10 = v14;
        if (!v6)
          goto LABEL_29;
      }
      for (j = 0; ; ++j)
      {
        v17 = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084);
        if (j >= *(unsigned __int8 *)(a1 + 288))
        {
          v21 = v17 - 1;
          v22 = *(_QWORD *)(v14 + 8 * v21);
          v6 = v22 & 0xFFFFFFFFFFFFFFFCLL;
          *(_QWORD *)(v14 + 8 * v21) = v22 & 3;
          if (v10)
          {
            v23 = v10 + 8 * *(int *)(*(_QWORD *)(a1 + 192) + 9084);
            *(_QWORD *)(v23 - 8) = *(_QWORD *)(v23 - 8) & 3 | v6;
          }
          else
          {
            v13 = v22 & 0xFFFFFFFFFFFFFFFCLL;
          }
          --v11;
          goto LABEL_6;
        }
        if ((*(_QWORD *)(v14 + 8 * (int)(j + v17)) & 1) == 0)
          goto LABEL_23;
        if (a2)
        {
          v18 = (unint64_t)VLSYNC(v14, (char)j);
          if (!v18)
            goto LABEL_23;
        }
        else
        {
          v18 = VRSYNC(a1, v14, (char)j);
          if (!v18)
            goto LABEL_23;
        }
        v19 = *(int *)(*(_QWORD *)(a1 + 192) + 9084) - 1;
        if (*(_QWORD *)(v18 + 8 * v19) <= 3uLL && v18 != v12)
        {
          *(_QWORD *)(v12 + 8 * v19) = *(_QWORD *)(v12 + 8 * v19) & 3 | v18;
          ++v11;
          goto LABEL_24;
        }
LABEL_23:
        v18 = v12;
LABEL_24:
        v12 = v18;
      }
    }
LABEL_29:
    v6 = 0;
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 200) + 8 * (a2 != 0));
LABEL_30:
    while (1)
    {
      v25 = v13;
      if (v11 < 2)
        break;
      while (v25)
      {
        v26 = v25;
        v25 = *(_QWORD *)(v25 + 8 * *(int *)(*(_QWORD *)(a1 + 192) + 9084) - 8) & 0xFFFFFFFFFFFFFFFCLL;
        v27 = *(_QWORD *)(v26 + 16);
        if ((v27 & 1) == 0)
        {
          v28 = v27 & 0xFFFFFFFFFFFFFFFCLL;
          if (v28)
            v29 = v28;
          else
            v29 = v26;
          if (a2)
            v30 = VRSYNC(a1, v29, (char)a5);
          else
            v30 = (unint64_t)VLSYNC(v29, (char)a5);
          if (v30 == v24)
          {
            v11 = 1;
            v6 = v26;
            goto LABEL_30;
          }
          if (*(_QWORD *)(v30 + 8 * *(int *)(*(_QWORD *)(a1 + 192) + 9084) - 8) > 3uLL || v30 == v12)
          {
            *(_QWORD *)(v26 + 16) |= 1uLL;
            --v11;
          }
          else
          {
            *(_QWORD *)(v26 + 16) = *(_QWORD *)(v26 + 16) & 3 | v30;
          }
        }
      }
    }
    while (v13)
    {
      if (!v6)
      {
        if ((*(_BYTE *)(v13 + 16) & 1) != 0)
          v6 = 0;
        else
          v6 = v13;
      }
      v32 = v13 + 8 * *(int *)(*(_QWORD *)(a1 + 192) + 9084);
      v33 = *(_QWORD *)(v32 - 8);
      *(_QWORD *)(v32 - 8) = v33 & 3;
      *(_QWORD *)(v13 + 16) &= 2uLL;
      v34 = v13 + 8 * *(int *)(*(_QWORD *)(a1 + 192) + 9084);
      v13 = v33 & 0xFFFFFFFFFFFFFFFCLL;
      *(_QWORD *)(v34 - 8) &= ~1uLL;
    }
  }
  else
  {
    if (a2)
      v35 = a5 + 3;
    else
      v35 = *(int *)(*(_QWORD *)(a1 + 192) + 9084) + (unint64_t)a5;
    return *(_QWORD *)(a4 + 8 * v35) & 0xFFFFFFFFFFFFFFFCLL;
  }
  return v6;
}

uint64_t project_rl(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, unsigned int a5)
{
  unsigned int v10;
  uint64_t result;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;

  v10 = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a5;
  *(_QWORD *)(a2 + 8 * (int)v10) |= 1uLL;
  CLRONESTM(a2);
  result = OUTLINED_FUNCTION_9_58();
  if ((_DWORD)result && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 9072) + a5))
    result = OUTLINED_FUNCTION_7_61();
  if ((uint64_t *)a3 != a4)
  {
    v12 = a5 + 3;
    *(_QWORD *)(a2 + 8 * v12) = *(_QWORD *)(a2 + 8 * v12) & 3 | a3;
    v13 = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a5;
    *(_QWORD *)(a2 + 8 * (int)v13) = *(_QWORD *)(a2 + 8 * (int)v13) & 3 | (unint64_t)a4;
    if (a3 && (*(_BYTE *)a3 & 2) != 0)
    {
      v14 = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a5;
      *(_QWORD *)(a3 + 8 * (int)v14) = *(_QWORD *)(a3 + 8 * (int)v14) & 3 | a2;
      if (!a4)
      {
LABEL_11:
        *a4 = a2;
        return result;
      }
    }
    else
    {
      *(_QWORD *)(a3 + 8) = a2;
      if (!a4)
        goto LABEL_11;
    }
    if ((*(_BYTE *)a4 & 2) == 0)
      goto LABEL_11;
    a4[v12] = a4[v12] & 3 | a2;
  }
  return result;
}

void vproj_l(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;

  if ((*(_QWORD *)(a2 + 8 * (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a4)) & 1) != 0)
    goto LABEL_13;
  OUTLINED_FUNCTION_11_54();
  if (*(_DWORD *)(v8 + 8864))
  {
    OUTLINED_FUNCTION_2_71(v5, 1);
    if ((*(_QWORD *)(v4 + 8 * (int)(*(_DWORD *)(*(_QWORD *)(v5 + 192) + 9084) + v6)) & 1) == 0)
      OUTLINED_FUNCTION_2_71(v5, 0);
  }
  v9 = (uint64_t *)(v7[v6 + 3] & 0xFFFFFFFFFFFFFFFCLL);
  if (v9)
  {
    v10 = *v9;
    v11 = v7[v6 + 3] & 0xFFFFFFFFFFFFFFFCLL;
    if ((*v9 & 2) != 0)
      goto LABEL_10;
  }
  else
  {
    v10 = MEMORY[0];
  }
  v11 = v10 & 0xFFFFFFFFFFFFFFFCLL;
LABEL_10:
  project_rl(v5, v4, (unint64_t)v9, v7, v6);
  if (NONSEQ(v4) && *(_DWORD *)(*(_QWORD *)(v5 + 192) + 8868))
  {
    OUTLINED_FUNCTION_10_57();
    INSSPINER(v5, v4, v11);
  }
LABEL_13:
  OUTLINED_FUNCTION_4_65();
}

uint64_t vctxtinit(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;

  if (*(_BYTE *)(a1 + 288))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 200) + 352) = OUTLINED_FUNCTION_0_77(*(unsigned __int8 *)(a1 + 288));
    *(_QWORD *)(*(_QWORD *)(a1 + 200) + 360) = OUTLINED_FUNCTION_0_77(*(unsigned __int8 *)(a1 + 288));
    *(_QWORD *)(*(_QWORD *)(a1 + 200) + 368) = OUTLINED_FUNCTION_0_77(*(unsigned __int8 *)(a1 + 288));
    *(_QWORD *)(*(_QWORD *)(a1 + 200) + 376) = OUTLINED_FUNCTION_0_77(*(unsigned __int8 *)(a1 + 288));
    *(_QWORD *)(*(_QWORD *)(a1 + 200) + 384) = malloc_type_malloc(*(unsigned __int8 *)(a1 + 288), 0x7908F214uLL);
    v2 = malloc_type_malloc(*(unsigned __int8 *)(a1 + 288), 0xED8631DFuLL);
    v3 = *(_QWORD **)(a1 + 200);
    v3[49] = v2;
  }
  else
  {
    v3 = *(_QWORD **)(a1 + 200);
  }
  v4 = (void *)v3[44];
  if (v4 && v3[45] && v3[46] && v3[47] && v3[48] && v3[49])
    return 1;
  free(v4);
  free(*(void **)(*(_QWORD *)(a1 + 200) + 360));
  free(*(void **)(*(_QWORD *)(a1 + 200) + 368));
  free(*(void **)(*(_QWORD *)(a1 + 200) + 376));
  free(*(void **)(*(_QWORD *)(a1 + 200) + 384));
  free(*(void **)(*(_QWORD *)(a1 + 200) + 392));
  return 0;
}

void vproject(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned int a5)
{
  uint64_t v5;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  v5 = *(int *)(*(_QWORD *)(a1 + 192) + 9084) + (unint64_t)a5;
  if ((*(_QWORD *)(a2 + 8 * v5) & 1) != 0)
    goto LABEL_26;
  if (!a3 || !a4 || (*(_QWORD *)a3 & 2) == 0)
  {
    if (a4 && (*a4 & 2) != 0)
    {
      OUTLINED_FUNCTION_1_72(v5);
      v16 = OUTLINED_FUNCTION_9_58();
      v17 = *(_QWORD *)(a1 + 192);
      if (v16 && !*(_BYTE *)(*(_QWORD *)(v17 + 9072) + a5))
      {
        OUTLINED_FUNCTION_7_61();
        v17 = *(_QWORD *)(a1 + 192);
      }
      *(_QWORD *)(a3 + 8) = a2;
      OUTLINED_FUNCTION_3_70(v17);
      v11 = a5 + 3;
      *(_QWORD *)&a4[8 * v11] = *(_QWORD *)&a4[8 * v11] & 3 | a2;
      goto LABEL_23;
    }
    if (!a3)
      goto LABEL_26;
LABEL_13:
    if ((*(_BYTE *)a3 & 2) == 0)
      goto LABEL_26;
    OUTLINED_FUNCTION_1_72(v5);
    v14 = OUTLINED_FUNCTION_9_58();
    v15 = *(_QWORD *)(a1 + 192);
    if (v14 && !*(_BYTE *)(*(_QWORD *)(v15 + 9072) + a5))
    {
      OUTLINED_FUNCTION_7_61();
      v15 = *(_QWORD *)(a1 + 192);
    }
    OUTLINED_FUNCTION_5_62(v15);
    OUTLINED_FUNCTION_3_70(*(_QWORD *)(a1 + 192));
    *(_QWORD *)a4 = a2;
    v11 = a5 + 3;
    goto LABEL_23;
  }
  if ((*a4 & 2) == 0)
    goto LABEL_13;
  v11 = a5 + 3;
  OUTLINED_FUNCTION_1_72(v5);
  v12 = OUTLINED_FUNCTION_9_58();
  v13 = *(_QWORD *)(a1 + 192);
  if (v12 && !*(_BYTE *)(*(_QWORD *)(v13 + 9072) + a5))
  {
    OUTLINED_FUNCTION_7_61();
    v13 = *(_QWORD *)(a1 + 192);
  }
  OUTLINED_FUNCTION_5_62(v13);
  *(_QWORD *)&a4[8 * v11] = *(_QWORD *)&a4[8 * v11] & 3 | a2;
  OUTLINED_FUNCTION_3_70(*(_QWORD *)(a1 + 192));
LABEL_23:
  *(_QWORD *)(a2 + 8 * v11) = *(_QWORD *)(a2 + 8 * v11) & 3 | a3;
  if (OUTLINED_FUNCTION_8_59() && *(_DWORD *)(*(_QWORD *)(a1 + 192) + 8868))
  {
    DELSPINE(a1, a2);
    INSSPINEL(a1, a2, (uint64_t)a4);
  }
LABEL_26:
  OUTLINED_FUNCTION_4_65();
}

void vdef_proj(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unint64_t v6;
  _BYTE *v7;

  if ((*(_QWORD *)(a2 + 8 * (int)(*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a3)) & 1) == 0)
  {
    v6 = OUTLINED_FUNCTION_6_61(a1, 1);
    if (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 8864))
      v7 = (_BYTE *)OUTLINED_FUNCTION_6_61(a1, 0);
    else
      v7 = (_BYTE *)VRSYNC(a1, v6, (char)a3);
    vproject(a1, a2, v6, v7, a3);
  }
}

uint64_t vsetsc(uint64_t result, int a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  uint64_t v6;

  if (a2)
    v6 = a5 + 3;
  else
    v6 = *(int *)(*(_QWORD *)(result + 192) + 9084) + (unint64_t)a5;
  *(_QWORD *)(a4 + 8 * v6) = *(_QWORD *)(a4 + 8 * v6) & 3 | a6;
  return result;
}

void *OUTLINED_FUNCTION_0_77@<X0>(uint64_t a1@<X8>)
{
  return malloc_type_malloc(8 * a1, 0x80040B8603338uLL);
}

uint64_t OUTLINED_FUNCTION_1_72@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(*(_QWORD *)(v3 + 184) + 452) = 1;
  *(_QWORD *)(v2 + 8 * a1) = v1 | 1;
  return CLRONESTM(v2);
}

unint64_t OUTLINED_FUNCTION_2_71(uint64_t a1, int a2)
{
  unint64_t v2;
  unsigned int v3;

  return vgetsc(a1, a2, 1, v2, v3);
}

void OUTLINED_FUNCTION_3_70(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  *(_QWORD *)(v2 + 8 * (*(_DWORD *)(a1 + 9084) + v3)) = *(_QWORD *)(v2 + 8 * (*(_DWORD *)(a1 + 9084) + v3)) & 3 | v1;
}

void OUTLINED_FUNCTION_5_62(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  *(_QWORD *)(v2 + 8 * (*(_DWORD *)(a1 + 9084) + v3)) = *(_QWORD *)(v2 + 8 * (*(_DWORD *)(a1 + 9084) + v3)) & 3 | v1;
}

unint64_t OUTLINED_FUNCTION_6_61(uint64_t a1, int a2)
{
  unsigned int v2;
  unint64_t v3;

  return vgetsc(a1, a2, 1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_7_61()
{
  uint64_t v0;

  return CLRALLNSQ(v0);
}

uint64_t OUTLINED_FUNCTION_8_59()
{
  uint64_t v0;

  return NONSEQ(v0);
}

uint64_t OUTLINED_FUNCTION_9_58()
{
  uint64_t v0;

  return ALLNSQ(v0);
}

void OUTLINED_FUNCTION_10_57()
{
  uint64_t v0;
  uint64_t v1;

  DELSPINE(v1, v0);
}

double delta_lib_new(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double result;

  v2 = malloc_type_malloc(0x930uLL, 0x10B00402BA2B37CuLL);
  *(_QWORD *)(a1 + 200) = v2;
  bzero(v2, 0x930uLL);
  v3 = *(_QWORD *)(a1 + 200);
  *(_QWORD *)(v3 + 336) = "---";
  *(_DWORD *)(v3 + 344) = 1;
  result = NAN;
  *(_QWORD *)(v3 + 656) = -1;
  *(_QWORD *)(v3 + 2232) = 0;
  return result;
}

void delta_lib_delete(uint64_t a1)
{
  void *v2;

  if (a1)
  {
    v2 = *(void **)(a1 + 200);
    if (v2)
    {
      bzero(v2, 0x930uLL);
      free(*(void **)(a1 + 200));
      *(_QWORD *)(a1 + 200) = 0;
    }
  }
}

uint64_t absoluteSyncNumPtr(uint64_t a1)
{
  if (a1)
    return a1 & 0xFFFFFFFC;
  else
    return -1;
}

uint64_t absoluteSyncNum(uint64_t a1, uint64_t a2)
{
  if (a2)
    return getDeltaHeapSegNumber(a1, a2, *(_DWORD *)(*(_QWORD *)(a1 + 200) + 248));
  else
    return 0xFFFFFFFFLL;
}

char *streamName(int a1)
{
  return vstmtbl[12 * a1];
}

_QWORD *VLSYNC(uint64_t a1, int a2)
{
  _QWORD *result;

  result = (_QWORD *)(*(_QWORD *)(a1 + 8 * a2 + 24) & 0xFFFFFFFFFFFFFFFCLL);
  if (result)
  {
    if ((*result & 2) == 0)
      return (_QWORD *)(*result & 0xFFFFFFFFFFFFFFFCLL);
  }
  return result;
}

unint64_t VRSYNC(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t result;

  result = *(_QWORD *)(a2 + 8 * (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a3)) & 0xFFFFFFFFFFFFFFFCLL;
  if (result)
  {
    if ((*(_BYTE *)result & 2) == 0)
      return *(_QWORD *)(result + 8) & 0xFFFFFFFFFFFFFFFCLL;
  }
  return result;
}

uint64_t FENCED(uint64_t a1, uint64_t a2, int a3)
{
  return (*(_QWORD *)(a2 + 8 * (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a3)) >> 1) & 1;
}

uint64_t SETFENCE(uint64_t result, uint64_t a2, int a3)
{
  int v3;

  v3 = *(_DWORD *)(*(_QWORD *)(result + 192) + 9084) + a3;
  *(_QWORD *)(a2 + 8 * v3) |= 2uLL;
  return result;
}

uint64_t UNSETFENCE(uint64_t result, uint64_t a2, int a3)
{
  int v3;

  v3 = *(_DWORD *)(*(_QWORD *)(result + 192) + 9084) + a3;
  *(_QWORD *)(a2 + 8 * v3) &= ~2uLL;
  return result;
}

uint64_t NONSEQ(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 16) >> 1) & 1;
}

uint64_t SETNONSEQ(uint64_t result)
{
  *(_QWORD *)(result + 16) |= 2uLL;
  return result;
}

uint64_t CLRNONSEQ(uint64_t result)
{
  *(_QWORD *)(result + 16) &= ~2uLL;
  return result;
}

uint64_t SETSPINEL(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_6_62(a1, *(_QWORD *)(a1 + 8) & 3 | a2);
}

uint64_t SETSPINER(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = a2 + 8 * *(int *)(*(_QWORD *)(result + 192) + 9084);
  *(_QWORD *)(v3 - 16) = *(_QWORD *)(v3 - 16) & 3 | a3;
  return result;
}

uint64_t ONESTM(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) & 1;
}

uint64_t SETONESTM(uint64_t a1)
{
  return OUTLINED_FUNCTION_6_62(a1, *(_QWORD *)(a1 + 8) | 1);
}

uint64_t CLRONESTM(uint64_t a1)
{
  return OUTLINED_FUNCTION_6_62(a1, *(_QWORD *)(a1 + 8) & 0xFFFFFFFFFFFFFFFELL);
}

uint64_t ALLNSQ(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 1) & 1;
}

uint64_t SETALLNSQ(uint64_t a1)
{
  return OUTLINED_FUNCTION_6_62(a1, *(_QWORD *)(a1 + 8) | 2);
}

uint64_t CLRALLNSQ(uint64_t a1)
{
  return OUTLINED_FUNCTION_6_62(a1, *(_QWORD *)(a1 + 8) & 0xFFFFFFFFFFFFFFFDLL);
}

uint64_t SETCTXL(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_4_66(a1, 1, a3, a2, a3, a4);
}

uint64_t SETCTXR(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_4_66(a1, 0, a3, a2, a3, a4);
}

uint64_t STMTYP(int a1)
{
  return *((__int16 *)vstmtbl[12 * a1 + 1] + 15);
}

void INSSPINER(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = 8 * *(int *)(*(_QWORD *)(a1 + 192) + 9084) - 16;
  v4 = *(_QWORD *)(a3 + v3) & 0xFFFFFFFFFFFFFFFCLL;
  *(_QWORD *)(a2 + v3) = v4 | *(_QWORD *)(a2 + v3) & 3;
  *(_QWORD *)(v4 + 8) = *(_QWORD *)(v4 + 8) & 3 | a2;
  v5 = a3 + 8 * *(int *)(*(_QWORD *)(a1 + 192) + 9084);
  *(_QWORD *)(v5 - 16) = *(_QWORD *)(v5 - 16) & 3 | a2;
  *(_QWORD *)(a2 + 8) = *(_QWORD *)(a2 + 8) & 3 | a3;
  OUTLINED_FUNCTION_1_73(&spine_changed);
}

void INSSPINEL(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a3 + 8) & 0xFFFFFFFFFFFFFFFCLL;
  *(_QWORD *)(a2 + 8) = v3 | *(_QWORD *)(a2 + 8) & 3;
  v4 = v3 + 8 * *(int *)(*(_QWORD *)(a1 + 192) + 9084);
  *(_QWORD *)(v4 - 16) = *(_QWORD *)(v4 - 16) & 3 | a2;
  *(_QWORD *)(a3 + 8) = *(_QWORD *)(a3 + 8) & 3 | a2;
  v5 = a2 + 8 * *(int *)(*(_QWORD *)(a1 + 192) + 9084);
  *(_QWORD *)(v5 - 16) = *(_QWORD *)(v5 - 16) & 3 | a3;
  OUTLINED_FUNCTION_1_73(&spine_changed);
}

void DELSPINE(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 8);
  v3 = 8 * *(int *)(*(_QWORD *)(a1 + 192) + 9084) - 16;
  v4 = *(_QWORD *)(a2 + v3) & 0xFFFFFFFFFFFFFFFCLL;
  *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFFFCLL) + v3) = v4 | *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFFFCLL) + v3) & 3;
  *(_QWORD *)(v4 + 8) = v2 & 0xFFFFFFFFFFFFFFFCLL | *(_QWORD *)(v4 + 8) & 3;
  OUTLINED_FUNCTION_1_73(&spine_changed);
}

void vinit_stm(uint64_t a1, int a2)
{
  unsigned int v4;
  char **v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2;
  vdel_2pt((uint64_t *)a1, a2, **(_QWORD **)(a1 + 200), *(_QWORD *)(*(_QWORD *)(a1 + 200) + 8));
  if (LOBYTE(vstmtbl[12 * a2 + 6]))
  {
    v9 = 0;
    v5 = &vstmtbl[12 * a2];
    v6 = v5[1];
    v7 = v5[2];
    LOWORD(v9) = *((_WORD *)v6 + 15);
    BYTE2(v9) = v6[32];
    v8 = (*(uint64_t (**)(char *))v7)(v5[5]);
    vins_tok((uint64_t *)a1, v4, **(_QWORD **)(a1 + 200), *(_QWORD *)(*(_QWORD *)(a1 + 200) + 8), (uint64_t)&v8);
  }
}

uint64_t vdel_2pt(uint64_t *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t *v11;

  v8 = a1[25];
  *(_BYTE *)(v8 + 136) = a2;
  *(_QWORD *)(v8 + 120) = a3;
  *(_QWORD *)(v8 + 128) = a4;
  v9 = a2;
  v10 = VRSYNC((uint64_t)a1, a3, a2);
  *(_QWORD *)(v8 + 104) = v10;
  *(_QWORD *)(v8 + 112) = VLSYNC(a4, v9);
  OUTLINED_FUNCTION_9_59(a1[23]);
  if (v10 == a4)
  {
    v11 = (uint64_t *)(*(_QWORD *)(a3 + 8 * (*(_DWORD *)(a1[24] + 9084) + a2)) & 0xFFFFFFFFFFFFFFFCLL);
    if (!v11 || (*(_BYTE *)v11 & 2) == 0)
      fdeldel((uint64_t)a1, v11, (uint64_t)v11);
  }
  else
  {
    fdel((uint64_t)a1, 0);
  }
  return 1;
}

void vins_tok(uint64_t *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  unint64_t v11;
  signed int v12;
  void *v13;
  uint64_t v14;

  v10 = a1[24];
  *(_DWORD *)(a1[23] + 452) = 1;
  if ((*(_QWORD *)(a3 + 8 * (int)(*(_DWORD *)(v10 + 9084) + a2)) & 0xFFFFFFFFFFFFFFFCLL) != a4
    || (*(_QWORD *)(a4 + 8 * (a2 + 3)) & 0xFFFFFFFFFFFFFFFCLL) != a3)
  {
    vdel_2pt(a1, a2, a3, a4);
  }
  v11 = (unint64_t)alloc_tok((uint64_t)a1, (uint64_t)&vstmtbl[12 * a2]);
  if (v11)
  {
    v12 = *(_DWORD *)(a1[24] + 9084) + a2;
    *(_QWORD *)(a3 + 8 * v12) = *(_QWORD *)(a3 + 8 * v12) & 3 | v11;
    *(_QWORD *)(a4 + 8 * (a2 + 3)) = *(_QWORD *)(a4 + 8 * (a2 + 3)) & 3 | v11;
    *(_QWORD *)v11 = a3;
    *(_QWORD *)(v11 + 8) = a4;
    v13 = (void *)(v11 + 16);
    if (*(__int16 *)(a5 + 8) < 0)
      vinitflds((int)v13, a2, v13, *(unsigned __int8 **)a5);
    else
      memcpy(v13, *(const void **)a5, SHIDWORD(vstmtbl[12 * a2 + 8]));
    v14 = a1[24];
    *(_DWORD *)(a1[23] + 452) = 1;
    *(_DWORD *)(v14 + 9080) = 0;
  }
  OUTLINED_FUNCTION_2_72();
}

uint64_t vmergable(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  result = 1;
  if (a2 != a3 && *(_DWORD *)(*(_QWORD *)(a1 + 192) + 8864))
  {
    v5 = *(uint64_t **)(a1 + 200);
    v6 = *v5;
    v7 = v5[1];
    if (v6 == a2 && v7 == a3)
      return OUTLINED_FUNCTION_5_63();
    else
      return v6 != a3 || v7 != a2;
  }
  return result;
}

void vmerge(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  char v7;
  int v8;
  int v9;
  _BOOL4 v10;
  unsigned __int8 i;
  unsigned __int8 v12;
  int v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  int v24;

  if (a2 != a3)
  {
    v4 = a3;
    *(_DWORD *)(*(_QWORD *)(a1 + 184) + 452) = 1;
    v5 = *(_QWORD **)(a1 + 200);
    if (*v5 == a3 || v5[1] == a3 || *(_DWORD *)(*(_QWORD *)(a1 + 192) + 8868) && (*(_BYTE *)(a2 + 16) & 2) != 0)
    {
      v6 = a3;
      v4 = a2;
    }
    else
    {
      v6 = a2;
    }
    v7 = 0;
    v8 = *(unsigned __int8 *)(a1 + 288);
    while (1)
    {
      if (v7 >= v8)
      {
        v10 = 0;
        goto LABEL_15;
      }
      v9 = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + v7;
      if ((*(_QWORD *)(v6 + 8 * v9) & 1) != 0 && (*(_QWORD *)(v4 + 8 * v9) & 1) != 0)
        break;
      ++v7;
    }
    v10 = v6 == (*(_QWORD *)(v4 + 8 * (v7 + 3)) & 0xFFFFFFFFFFFFFFFCLL);
LABEL_15:
    for (i = 0; ; i = v12 + 1)
    {
      v12 = i;
      if ((char)i >= v8)
        break;
      v13 = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + (char)i;
      if ((*(_QWORD *)(v4 + 8 * v13) & 1) != 0)
      {
        if ((*(_QWORD *)(v6 + 8 * v13) & 1) == 0 && v10)
        {
          v15 = OUTLINED_FUNCTION_12_52();
          vproj_l(v15, v16, v17, v18);
          if (!v19)
            break;
          v20 = OUTLINED_FUNCTION_12_52();
          vproj_r(v20, v21, v22, v23);
          if (!v24)
            break;
        }
        vdel_1pt(a1, v12, v4);
        v8 = *(unsigned __int8 *)(a1 + 288);
      }
    }
  }
  OUTLINED_FUNCTION_2_72();
}

uint64_t vdel_1pt(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  unint64_t v14;
  char **v15;
  uint64_t (**v16)(uint64_t);
  int v17;
  unint64_t v18;
  signed int v19;
  double *v21;
  uint64_t v22;
  void *__dst;
  uint64_t v24;

  OUTLINED_FUNCTION_9_59(*(_QWORD *)(a1 + 184));
  v7 = *(_QWORD *)(v6 + 200);
  *(_BYTE *)(v7 + 136) = v8;
  *(_QWORD *)(v7 + 104) = v9;
  *(_QWORD *)(v7 + 112) = v9;
  v10 = v8;
  *(_QWORD *)(v7 + 120) = VLSYNC(v9, v8);
  *(_QWORD *)(v7 + 128) = VRSYNC(a1, a3, v10);
  v11 = *(_QWORD *)(a3 + 8 * (int)(*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a2));
  if ((v11 & 1) != 0)
  {
    v24 = 0;
    v22 = 0;
    v12 = a2 + 3;
    v13 = (_BYTE *)(*(_QWORD *)(a3 + 8 * v12) & 0xFFFFFFFFFFFFFFFCLL);
    if (!v13 || (*v13 & 2) == 0)
    {
      v14 = v11 & 0xFFFFFFFFFFFFFFFCLL;
      if ((v11 & 0xFFFFFFFFFFFFFFFCLL) == 0 || (*(_BYTE *)v14 & 2) == 0)
      {
        LOWORD(v22) = *((_WORD *)vstmtbl[12 * (char)a2 + 1] + 15);
        LOWORD(v24) = v22;
        v15 = &vstmtbl[12 * a2];
        v16 = (uint64_t (**)(uint64_t))v15[2];
        BYTE2(v22) = v15[1][32];
        BYTE2(v24) = BYTE2(v22);
        __dst = (void *)(*v16)((uint64_t)(v13 + 16));
        v21 = (double *)(*(uint64_t (**)(unint64_t))v15[2])(v14 + 16);
        if (*((_BYTE *)v15 + 86))
        {
          vadd(a1, &v21, (double **)&__dst);
          vinitflds(v17, a2, __dst, (unsigned __int8 *)v21);
          OUTLINED_FUNCTION_9_59(*(_QWORD *)(a1 + 184));
          v18 = *(_QWORD *)(v14 + 8) & 0xFFFFFFFFFFFFFFFCLL;
          v19 = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a2;
          *(_QWORD *)(a3 + 8 * v19) = v18 | *(_QWORD *)(a3 + 8 * v19) & 3;
          *(_QWORD *)(v18 + 8 * v12) = *(_QWORD *)(v18 + 8 * v12) & 3 | a3;
          cacheDeletedDeltaObject(a1, v14);
        }
      }
    }
    fdel(a1, 1);
  }
  return 1;
}

uint64_t vscanadv(_QWORD *a1, int a2, int a3)
{
  unint64_t i;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  _BYTE *v9;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  i = 0;
  v4 = a1[24];
  v5 = *(_QWORD *)(v4 + 8080);
  v6 = *(unsigned __int8 *)(v4 + 8088);
  if (a3)
  {
    v7 = *(unsigned __int8 *)(v4 + 8121);
    if (*(_BYTE *)(v4 + 8121))
    {
      if (*(_BYTE *)(v4 + 8090))
      {
        i = 0;
      }
      else
      {
        for (i = 0; i < v7; ++i)
        {
          v11 = *(_DWORD *)(v4 + 9084);
          v12 = *(unsigned __int8 *)(a1[31] + i);
          if ((*(_QWORD *)(v5 + 8 * (v11 + v12)) & 1) != 0)
            return OUTLINED_FUNCTION_5_63();
          v13 = *(_QWORD *)(v5 + 8 * (v11 + (char)v12));
          v14 = a1[35];
          if ((v13 & 2) != 0 && (_DWORD)v6 != v12 && !*(_BYTE *)(v14 + i))
            return OUTLINED_FUNCTION_5_63();
          *(_BYTE *)(v14 + i) = 0;
          v4 = a1[24];
          v7 = *(unsigned __int8 *)(v4 + 8121);
        }
      }
    }
  }
  if (!v5)
    return OUTLINED_FUNCTION_5_63();
  v8 = *(_BYTE *)(v4 + 8089) ? *(int *)(v4 + 9084) + v6 : v6 + 3;
  v9 = (_BYTE *)(*(_QWORD *)(v5 + 8 * v8) & 0xFFFFFFFFFFFFFFFCLL);
  if (!v9)
    return OUTLINED_FUNCTION_5_63();
  if ((*v9 & 2) != 0)
    goto LABEL_13;
  if (!a2)
    return OUTLINED_FUNCTION_5_63();
  v9 = (_BYTE *)(*(_QWORD *)&v9[8 * (*(_BYTE *)(v4 + 8089) != 0)] & 0xFFFFFFFFFFFFFFFCLL);
LABEL_13:
  *(_QWORD *)(v4 + 8080) = v9;
  *(_BYTE *)(v4 + 8090) = 0;
  while (i < *(unsigned __int8 *)(v4 + 8121))
  {
    *(_BYTE *)(a1[35] + i++) = 0;
    v4 = a1[24];
  }
  return OUTLINED_FUNCTION_8_60();
}

uint64_t vscanadvUptoTokenOrMarker()
{
  _QWORD *v0;
  _BYTE *v1;
  int v2;
  _BYTE *v3;
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t i;
  unsigned __int8 v11;
  unint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_0_78();
  do
  {
    if (v3)
    {
      LODWORD(i) = 0;
      if (v2)
      {
        v11 = *(_BYTE *)(v9 + v6 + 31);
        if (v11)
        {
          if (*(_BYTE *)(v9 + v6))
          {
            LODWORD(i) = 0;
          }
          else
          {
            for (i = 0; i < v11; ++i)
            {
              v13 = *(_DWORD *)(v9 + 9084);
              v14 = *(unsigned __int8 *)(v0[31] + i);
              if ((*(_QWORD *)&v3[8 * v13 + 8 * v14] & 1) != 0)
                return OUTLINED_FUNCTION_5_63();
              v15 = *(_QWORD *)&v3[8 * v13 + 8 * (char)v14];
              v16 = v0[35];
              if ((v15 & 2) != 0 && v4 != v14 && !*(_BYTE *)(v16 + i))
                return OUTLINED_FUNCTION_5_63();
              *(_BYTE *)(v16 + i) = 0;
              v9 = v0[24];
              v11 = *(_BYTE *)(v9 + v7);
            }
          }
        }
      }
      v12 = v5;
      if (*(_BYTE *)(v9 + v8))
        v12 = *(int *)(v9 + 9084) + (unint64_t)v4;
      v3 = (_BYTE *)(*(_QWORD *)&v3[8 * v12] & 0xFFFFFFFFFFFFFFFCLL);
      if (v3)
        goto LABEL_10;
    }
    return OUTLINED_FUNCTION_5_63();
LABEL_10:
    if ((*v3 & 2) == 0)
      break;
    *(_QWORD *)(v9 + 8080) = v3;
    *(_BYTE *)(v9 + v8 + 1) = 0;
    for (i = i; i < *(unsigned __int8 *)(v9 + v7); ++i)
    {
      *(_BYTE *)(v0[35] + i) = 0;
      v9 = v0[24];
    }
  }
  while (v3 != v1);
  return OUTLINED_FUNCTION_8_60();
}

uint64_t vscanadvUptoToken()
{
  _QWORD *v0;
  int v1;
  _BYTE *v2;
  unsigned int v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  unsigned __int8 v10;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_0_78();
  while (1)
  {
    if (!v2)
      return OUTLINED_FUNCTION_5_63();
    LODWORD(i) = 0;
    if (v1)
    {
      v10 = *(_BYTE *)(v8 + v5 + 31);
      if (v10)
      {
        if (*(_BYTE *)(v8 + v5))
        {
          LODWORD(i) = 0;
        }
        else
        {
          for (i = 0; i < v10; ++i)
          {
            v12 = *(_DWORD *)(v8 + 9084);
            v13 = *(unsigned __int8 *)(v0[31] + i);
            if ((*(_QWORD *)&v2[8 * v12 + 8 * v13] & 1) != 0)
              return OUTLINED_FUNCTION_5_63();
            v14 = *(_QWORD *)&v2[8 * v12 + 8 * (char)v13];
            v15 = v0[35];
            if ((v14 & 2) != 0 && v3 != v13 && !*(_BYTE *)(v15 + i))
              return OUTLINED_FUNCTION_5_63();
            *(_BYTE *)(v15 + i) = 0;
            v8 = v0[24];
            v10 = *(_BYTE *)(v8 + v6);
          }
        }
      }
    }
    v11 = v4;
    if (*(_BYTE *)(v8 + v7))
      v11 = *(int *)(v8 + 9084) + (unint64_t)v3;
    v2 = (_BYTE *)(*(_QWORD *)&v2[8 * v11] & 0xFFFFFFFFFFFFFFFCLL);
    if (!v2)
      return OUTLINED_FUNCTION_5_63();
    if ((*v2 & 2) == 0)
      break;
    *(_QWORD *)(v8 + 8080) = v2;
    *(_BYTE *)(v8 + v7 + 1) = 0;
    for (i = i; i < *(unsigned __int8 *)(v8 + v6); ++i)
    {
      *(_BYTE *)(v0[35] + i) = 0;
      v8 = v0[24];
    }
  }
  return OUTLINED_FUNCTION_8_60();
}

uint64_t vscanadvOverToken()
{
  _QWORD *v0;
  int v1;
  _BYTE *v2;
  unsigned int v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  unsigned __int8 v10;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_0_78();
  while (v2)
  {
    LODWORD(i) = 0;
    if (v1)
    {
      v10 = *(_BYTE *)(v8 + v5 + 31);
      if (v10)
      {
        if (*(_BYTE *)(v8 + v5))
        {
          LODWORD(i) = 0;
        }
        else
        {
          for (i = 0; i < v10; ++i)
          {
            v12 = *(_DWORD *)(v8 + 9084);
            v13 = *(unsigned __int8 *)(v0[31] + i);
            if ((*(_QWORD *)&v2[8 * v12 + 8 * v13] & 1) != 0)
              return OUTLINED_FUNCTION_5_63();
            v14 = *(_QWORD *)&v2[8 * v12 + 8 * (char)v13];
            v15 = v0[35];
            if ((v14 & 2) != 0 && v3 != v13 && !*(_BYTE *)(v15 + i))
              return OUTLINED_FUNCTION_5_63();
            *(_BYTE *)(v15 + i) = 0;
            v8 = v0[24];
            v10 = *(_BYTE *)(v8 + v6);
          }
        }
      }
    }
    v11 = v4;
    if (*(_BYTE *)(v8 + v7))
      v11 = *(int *)(v8 + 9084) + (unint64_t)v3;
    v2 = (_BYTE *)(*(_QWORD *)&v2[8 * v11] & 0xFFFFFFFFFFFFFFFCLL);
    if (!v2)
      break;
    *(_QWORD *)(v8 + 8080) = v2;
    *(_BYTE *)(v8 + v7 + 1) = 0;
    for (i = i; i < *(unsigned __int8 *)(v8 + v7 + 32); ++i)
    {
      *(_BYTE *)(v0[35] + i) = 0;
      v8 = v0[24];
    }
    if ((*v2 & 2) == 0)
    {
      *(_QWORD *)(v8 + 8080) = *(_QWORD *)&v2[8 * (*(_BYTE *)(v8 + v7) != 0)] & 0xFFFFFFFFFFFFFFFCLL;
      return OUTLINED_FUNCTION_8_60();
    }
  }
  return OUTLINED_FUNCTION_5_63();
}

_BYTE *vmovel(_BYTE *a1, int a2)
{
  _BYTE *v2;

  do
  {
    v2 = a1;
    a1 = (_BYTE *)(*(_QWORD *)&a1[8 * a2 + 24] & 0xFFFFFFFFFFFFFFFCLL);
  }
  while (a1 && (*a1 & 2) != 0);
  return v2;
}

_BYTE *vmover(uint64_t a1, _BYTE *a2, int a3)
{
  uint64_t v3;
  _BYTE *result;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a3;
  do
  {
    result = a2;
    a2 = (_BYTE *)(*(_QWORD *)&a2[8 * v3] & 0xFFFFFFFFFFFFFFFCLL);
  }
  while (a2 && (*a2 & 2) != 0);
  return result;
}

uint64_t vmark(uint64_t *a1, unsigned int a2, unsigned __int8 a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  char **v12;
  uint64_t v13;
  unsigned __int8 v16;

  v16 = a3;
  v11 = a1[25];
  *(_WORD *)(v11 + 96) = -1;
  *(_QWORD *)(v11 + 88) = &v16;
  *(_BYTE *)(v11 + 98) = 0;
  v12 = &vstmtbl[12 * a2 + 3];
LABEL_2:
  v13 = *(_QWORD *)(v11 + 8);
  while (a4 != a5 && a4 != v13)
  {
    a4 = *(_QWORD *)(a4 + 8 * (int)(*(_DWORD *)(a1[24] + 9084) + a2)) & 0xFFFFFFFFFFFFFFFCLL;
    if (!a4 || (*(_BYTE *)a4 & 2) == 0)
    {
      (*(void (**)(unint64_t, uint64_t))&(*v12)[8 * v16])(a4 + 16, a6);
      a4 = *(_QWORD *)(a4 + 8) & 0xFFFFFFFFFFFFFFFCLL;
      v11 = a1[25];
      goto LABEL_2;
    }
  }
  OUTLINED_FUNCTION_9_59(a1[23]);
  return 1;
}

uint64_t vsplit_time(uint64_t *a1, unsigned int a2, unint64_t a3, uint64_t a4)
{
  int v4;
  unint64_t v5;
  _BYTE *v8;
  void *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  unsigned __int8 *v15;
  __int16 v17;
  uint64_t v18;
  int v19;
  __int16 *v20;
  int v21;
  __int16 *v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a4;
  v5 = a3;
  v25 = 0;
  v26 = 0;
  if ((a4 & 0x8000000000000000) == 0)
  {
    v8 = (_BYTE *)(*(_QWORD *)(a3 + 8 * (int)(*(_DWORD *)(a1[24] + 9084) + a2)) & 0xFFFFFFFFFFFFFFFCLL);
    if (v8 && (*v8 & 2) != 0)
      v9 = 0;
    else
      v9 = (void *)(*(_QWORD *)(a3 + 8 * (int)(*(_DWORD *)(a1[24] + 9084) + a2)) & 0xFFFFFFFFFFFFFFFCLL);
    v11 = vins_sync((uint64_t)a1, a2, a3, (unint64_t)v8);
    v12 = v5;
    v5 = v11;
    if (v11)
      goto LABEL_10;
    return 0;
  }
  v10 = (_BYTE *)(*(_QWORD *)(a3 + 8 * a2 + 24) & 0xFFFFFFFFFFFFFFFCLL);
  if (v10 && (*v10 & 2) != 0)
    v9 = 0;
  else
    v9 = v10;
  v11 = vins_sync((uint64_t)a1, a2, (unint64_t)v10, v5);
  v12 = v11;
  if (!v11)
    return 0;
LABEL_10:
  v24 = 0;
  v22 = 0;
  v23 = 0;
  if (!v9)
    goto LABEL_19;
  v13 = *((__int16 *)vstmtbl[12 * a2 + 1] + 15);
  if (v13 == -4)
  {
    OUTLINED_FUNCTION_3_71();
    OUTLINED_FUNCTION_13_50();
    v24 = v17;
    v15 = (unsigned __int8 *)&v24;
  }
  else
  {
    if (v13 != -3)
      goto LABEL_19;
    OUTLINED_FUNCTION_3_71();
    OUTLINED_FUNCTION_13_50();
    v15 = (unsigned __int8 *)&v26;
  }
  vinitflds(v14, a2, v9, v15);
LABEL_19:
  if (v4 >= 0)
    v18 = v4;
  else
    v18 = -v4;
  v25 = v18;
  v19 = *((__int16 *)vstmtbl[12 * a2 + 1] + 15);
  if (v19 == -4)
  {
    LOWORD(v23) = -4;
    v24 = v18;
    v20 = &v24;
  }
  else
  {
    if (v19 != -3)
      goto LABEL_27;
    LOWORD(v23) = -3;
    v20 = (__int16 *)&v25;
  }
  v22 = v20;
  BYTE2(v23) = 0;
LABEL_27:
  vins_tok(a1, a2, v12, v5, (uint64_t)&v22);
  if (v21)
    return v11;
  else
    return 0;
}

uint64_t vins_sync(uint64_t a1, unsigned int a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v23;
  uint64_t v24;

  v8 = (uint64_t)alloc_sync(a1);
  if (v8)
  {
    OUTLINED_FUNCTION_14_50();
    *(_QWORD *)(v8 + 8 * v10) = v9 | 1;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 9072) + a2))
      *(_QWORD *)(v8 + 8) |= 2uLL;
    OUTLINED_FUNCTION_9_59(*(_QWORD *)(a1 + 184));
    if (a3 && (v11 = *(_QWORD *)a3, (*(_QWORD *)a3 & 2) != 0))
    {
      v12 = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a2;
      *(_QWORD *)(a3 + 8 * (int)v12) = *(_QWORD *)(a3 + 8 * (int)v12) & 3 | v8;
      v13 = a3;
    }
    else
    {
      v13 = v11 & 0xFFFFFFFFFFFFFFFCLL;
      *(_QWORD *)(a3 + 8) = v8;
    }
    v14 = a2 + 3;
    *(_QWORD *)(v8 + 8 * v14) = *(_QWORD *)(v8 + 8 * v14) & 3 | a3;
    if (a4 && (*(_BYTE *)a4 & 2) != 0)
    {
      *(_QWORD *)(a4 + 8 * v14) = *(_QWORD *)(a4 + 8 * v14) & 3 | v8;
      v15 = a4;
    }
    else
    {
      v15 = *(_QWORD *)(a4 + 8) & 0xFFFFFFFFFFFFFFFCLL;
      *(_QWORD *)a4 = v8;
    }
    OUTLINED_FUNCTION_14_50();
    *(_QWORD *)(v8 + 8 * v17) = v16 & 3 | a4;
    v18 = *(_QWORD *)(a1 + 192);
    if (*(_DWORD *)(v18 + 8868))
    {
      v19 = *(int *)(v18 + 9084) - 2;
      v20 = *(_QWORD *)(v13 + 8 * v19);
      v21 = v20 & 0xFFFFFFFFFFFFFFFCLL;
      if (v15 != (v20 & 0xFFFFFFFFFFFFFFFCLL))
      {
        if (*(_BYTE *)(*(_QWORD *)(v18 + 9072) + a2))
        {
LABEL_15:
          *(_QWORD *)(v8 + 16) |= 2uLL;
          if (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 8864)
            && (*(_BYTE *)(v8 + 8) & 1) == 0
            && !vchkseqbad(a1, v8))
          {
            return 0;
          }
        }
        else
        {
          while (v21 != v15)
          {
            if ((*(_BYTE *)(v21 + 8) & 3) == 0)
              goto LABEL_15;
            v21 = *(_QWORD *)(v21 + 8 * v19) & 0xFFFFFFFFFFFFFFFCLL;
          }
          while (1)
          {
            v23 = v20 & 0xFFFFFFFFFFFFFFFCLL;
            if (v15 == (v20 & 0xFFFFFFFFFFFFFFFCLL))
              break;
            *(_QWORD *)(v23 + 16) |= 2uLL;
            v24 = *(_QWORD *)(a1 + 192);
            if (*(_DWORD *)(v24 + 8864) && (*(_BYTE *)(v23 + 8) & 1) == 0)
            {
              if (!vchkseqbad(a1, v23))
                return 0;
              v24 = *(_QWORD *)(a1 + 192);
            }
            v20 = *(_QWORD *)(v23 + 8 * *(int *)(v24 + 9084) - 16);
          }
        }
      }
      INSSPINER(a1, v8, v13);
      v18 = *(_QWORD *)(a1 + 192);
    }
    *(_DWORD *)(v18 + 9080) = 0;
  }
  return v8;
}

void *vinitflds(int a1, unsigned int a2, void *__dst, unsigned __int8 *a4)
{
  char **v7;
  void *result;
  char *v9;
  int v10;
  int v11;

  v7 = &vstmtbl[12 * a2];
  memmove(__dst, v7[5], *((int *)v7 + 17));
  result = (void *)(*(uint64_t (**)(void *, unsigned __int8 *))v7[3])(__dst, a4);
  v9 = v7[4];
  if (v9)
  {
    v10 = *((unsigned __int16 *)vstmtbl[12 * a2 + 1] + 15);
    if (v10 == 0xFFFF)
    {
      v11 = *a4;
      return memmove(__dst, &v9[SLODWORD(vstmtbl[12 * a2 + 9]) * (uint64_t)v11], SHIDWORD(vstmtbl[12 * a2 + 9]));
    }
    if (v10 == 65534)
    {
      v11 = *(__int16 *)a4;
      return memmove(__dst, &v9[SLODWORD(vstmtbl[12 * a2 + 9]) * (uint64_t)v11], SHIDWORD(vstmtbl[12 * a2 + 9]));
    }
  }
  return result;
}

uint64_t vchkseqbad(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;

  if ((*(_BYTE *)(a2 + 8) & 3) != 0)
  {
    v2 = 0;
    v3 = 0;
    v4 = 0;
    while (*(unsigned __int8 *)(a1 + 288) != v2)
    {
      v5 = *(_QWORD *)(a1 + 192);
      if ((*(_QWORD *)(a2 + 8 * (v2 + *(int *)(v5 + 9084))) & 1) != 0)
      {
        ++v3;
        if (*(_BYTE *)(*(_QWORD *)(v5 + 9072) + v2))
          ++v4;
      }
      ++v2;
    }
    if (v3 < 2 || v4 >= v3)
      return 1;
  }
  vseqbad();
  return 0;
}

uint64_t vnsqflags(uint64_t result, uint64_t a2)
{
  unsigned int v2;
  int v3;
  char *v4;
  unsigned __int8 v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v13;

  v2 = 0;
  v3 = 0;
  v4 = *(char **)(*(_QWORD *)(result + 200) + 160);
  while (1)
  {
    v6 = *v4++;
    v5 = v6;
    if (v6 < 0)
      break;
    v7 = *(_QWORD *)(a2 + 8 * (*(_DWORD *)(*(_QWORD *)(result + 192) + 9084) + v5)) & 1;
    v2 += v7;
    if (v7)
      v3 = 1;
  }
  v8 = *(unsigned __int8 *)(result + 288);
LABEL_6:
  v9 = v8;
  while (1)
  {
    v8 = v9 - 1;
    if (v9 < 1)
      break;
    v10 = *(_QWORD *)(result + 192);
    v11 = *(_QWORD *)(a2 + 8 * (v9 + *(int *)(v10 + 9084)) - 8);
    --v9;
    if ((v11 & 1) != 0)
    {
      if (!*(_BYTE *)(*(_QWORD *)(v10 + 9072) + v8))
      {
        ++v2;
        v3 = 0;
      }
      if (v2 >= 2 && v3 == 0)
      {
        v3 = 0;
        goto LABEL_19;
      }
      goto LABEL_6;
    }
  }
  if (v2 == 1)
  {
    v13 = *(_QWORD *)(a2 + 8) | 1;
    goto LABEL_20;
  }
LABEL_19:
  v13 = *(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFFELL;
LABEL_20:
  *(_QWORD *)(a2 + 8) = v13 & 0xFFFFFFFFFFFFFFFDLL | (2 * (v3 != 0));
  return result;
}

void visnonseq(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  int v8;
  uint64_t v10;

  v7 = 0;
  v8 = *(unsigned __int8 *)(a1 + 288);
  while (v8 != (_DWORD)v7)
  {
    if (a2 != (_DWORD)v7)
    {
      v10 = v7 + *(int *)(*(_QWORD *)(a1 + 192) + 9084);
      if ((*(_QWORD *)(a3 + 8 * v10) & 1) != 0
        && (*(_QWORD *)(a4 + 8 * v10) & 1) != 0
        && VRSYNC(a1, a3, (char)v7) != a4)
      {
        break;
      }
    }
    ++v7;
  }
  OUTLINED_FUNCTION_2_72();
}

uint64_t fdeldel(uint64_t result, uint64_t *a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t i;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  unint64_t v44;

  v4 = (unint64_t)a2;
  v5 = result;
  *(_DWORD *)(*(_QWORD *)(result + 184) + 452) = 1;
  if (a2)
  {
    v6 = *a2;
    if ((*a2 & 2) != 0)
      v6 = a2[*(char *)(*(_QWORD *)(result + 200) + 136) + 3];
    v7 = v6 & 0xFFFFFFFFFFFFFFFCLL;
  }
  else
  {
    v7 = 0;
  }
  do
  {
    if (!v4)
      return result;
    if ((*(_BYTE *)v4 & 2) == 0)
    {
      v8 = *(_QWORD *)(v4 + 8);
LABEL_35:
      result = cacheDeletedDeltaObject(v5, v4);
      goto LABEL_36;
    }
    v9 = *(_DWORD *)(*(_QWORD *)(v5 + 192) + 9084) + *(char *)(*(_QWORD *)(v5 + 200) + 136);
    v8 = *(_QWORD *)(v4 + 8 * v9);
    v10 = *(_QWORD *)(v4 + 8);
    *(_QWORD *)(v4 + 8 * v9) = v8 & 0xFFFFFFFFFFFFFFFELL;
    v11 = v4 + 8 * *(char *)(*(_QWORD *)(v5 + 200) + 136);
    *(_QWORD *)(v11 + 24) &= 3uLL;
    LODWORD(v11) = *(_DWORD *)(*(_QWORD *)(v5 + 192) + 9084) + *(char *)(*(_QWORD *)(v5 + 200) + 136);
    *(_QWORD *)(v4 + 8 * (int)v11) &= 3uLL;
    if ((v10 & 1) != 0)
    {
      if (*(_DWORD *)(*(_QWORD *)(v5 + 192) + 8868))
        DELSPINE(v5, v4);
      goto LABEL_35;
    }
    result = vnsqflags(v5, v4);
    v12 = *(_QWORD *)(v5 + 192);
    if (!*(_DWORD *)(v12 + 8868))
      goto LABEL_36;
    v13 = *(_QWORD *)(v5 + 200);
    v14 = v4;
    do
      v14 = *(_QWORD *)(v14 + 8) & 0xFFFFFFFFFFFFFFFCLL;
    while ((*(_BYTE *)(v14 + 16) & 2) != 0);
    v15 = *(int *)(v12 + 9084);
    v16 = v4;
    do
      v16 = *(_QWORD *)(v16 + 8 * (v15 - 2)) & 0xFFFFFFFFFFFFFFFCLL;
    while ((*(_BYTE *)(v16 + 16) & 2) != 0);
    LODWORD(v17) = 0;
    v18 = 0;
    v19 = 0;
    v20 = *(unsigned __int8 *)(v5 + 288);
    v21 = v16 + 8 * v15 - 8;
    v22 = v14 + 8 * v15 - 8;
LABEL_16:
    v23 = v17;
    for (i = v20; i > *(unsigned __int8 *)(v13 + 136); --i)
    {
      if ((*(_QWORD *)(v4 + 8 * v15 - 8 + 8 * i) & 1) == 0)
      {
        v20 = i - 1;
        LODWORD(v17) = 1;
        if (!v23)
        {
          LODWORD(v17) = 0;
          if ((*(_QWORD *)(v22 + 8 * i) & 1) != 0)
            v17 = *(_QWORD *)(v21 + 8 * i) & 1;
        }
        goto LABEL_16;
      }
      if ((*(_QWORD *)(v22 + 8 * i) & 1) != 0)
      {
        if (v19 || (*(_QWORD *)(v21 + 8 * i) & 1) != 0)
          goto LABEL_36;
        v19 = 0;
        ++v18;
      }
      else
      {
        if (v19)
          goto LABEL_21;
        if ((*(_QWORD *)(v21 + 8 * i) & 1) != 0)
        {
          if (v18)
            goto LABEL_36;
LABEL_21:
          v19 = 1;
          continue;
        }
        v19 = 0;
      }
    }
    v26 = 8 * v15;
    v27 = *(unsigned __int8 *)(v13 + 136);
    if (*(_BYTE *)(v13 + 136))
    {
      do
      {
        if ((*(_BYTE *)(v4 + v26) & 1) != 0)
        {
          if ((*(_BYTE *)(v14 + v26) & 1) != 0)
          {
            if (v19 || (*(_BYTE *)(v16 + v26) & 1) != 0)
              goto LABEL_36;
            v19 = 0;
            ++v18;
          }
          else if (v19)
          {
            v19 = 1;
          }
          else
          {
            if (v18)
              goto LABEL_36;
            v19 = *(_DWORD *)(v16 + v26) & 1;
          }
        }
        else if (v23)
        {
          v23 = 1;
        }
        else if ((*(_BYTE *)(v14 + v26) & 1) != 0)
        {
          v23 = *(_DWORD *)(v16 + v26) & 1;
        }
        else
        {
          v23 = 0;
        }
        v26 += 8;
        --v27;
      }
      while (v27);
    }
    if (!v19 || !v18)
    {
      if (v23)
      {
        *(_BYTE *)(v13 + 16) = 0;
        *(_QWORD *)(v13 + 24) = v4;
        *(_QWORD *)(v13 + 32) = v4;
        *(_DWORD *)(v13 + 20) = (*(_QWORD *)(v4 + 8) & 3) == 0;
        if (v19 | v18)
        {
          if (v19)
            v28 = -1;
          else
            v28 = 1;
          if (v19)
            v29 = v14;
          else
            v29 = v16;
          *(_QWORD *)(v13 + 48) = v29;
        }
        else
        {
          v28 = 2;
        }
        *(_BYTE *)(v13 + 40) = v28;
LABEL_79:
        switch(v28)
        {
          case -1:
LABEL_82:
            result = OUTLINED_FUNCTION_7_62(result, (unsigned __int8 *)(v13 + 40));
            v13 = *(_QWORD *)(v5 + 200);
            break;
          case 2:
            if (*(_QWORD *)(v13 + 24) == v14 && *(unsigned __int8 *)(v13 + 16) == 255)
            {
              *(_BYTE *)(v13 + 64) = -1;
              v42 = *(_QWORD *)(v13 + 32);
              *(_QWORD *)(v13 + 72) = v14;
              *(_QWORD *)(v13 + 80) = v42;
              *(_DWORD *)(v13 + 68) = *(_DWORD *)(v13 + 20);
            }
            else
            {
              *(_BYTE *)(v13 + 64) = -1;
              v35 = v13 + 64;
              *(_QWORD *)(v35 + 8) = v14;
              result = OUTLINED_FUNCTION_7_62(result, (unsigned __int8 *)v35);
              v13 = *(_QWORD *)(v5 + 200);
            }
            *(_BYTE *)(v13 + 40) = 1;
            v36 = v13 + 40;
            *(_QWORD *)(v36 + 8) = v16;
            result = OUTLINED_FUNCTION_7_62(result, (unsigned __int8 *)v36);
            v13 = *(_QWORD *)(v5 + 200);
            *(_QWORD *)(v13 + 48) = *(_QWORD *)(v13 + 80);
            *(_DWORD *)(v13 + 44) |= *(_DWORD *)(v13 + 68);
            break;
          case 1:
            goto LABEL_82;
        }
        v37 = v13 + 24 * (*(_DWORD *)(v13 + 20) != 0);
        v38 = *(char *)(v37 + 16);
        v39 = *(_QWORD *)(v37 + 24);
        v40 = (_QWORD *)(v37 + 32);
        while (1)
        {
          *(_QWORD *)(v39 + 16) |= 2uLL;
          if (*(_DWORD *)(*(_QWORD *)(v5 + 192) + 8864))
          {
            if ((*(_BYTE *)(v39 + 8) & 1) == 0)
            {
              result = vchkseqbad(v5, v39);
              if (!(_DWORD)result)
                break;
            }
          }
          if (v39 == *v40)
            break;
          if (v38 < 0)
            v41 = 1;
          else
            v41 = *(int *)(*(_QWORD *)(v5 + 192) + 9084) - 2;
          v39 = *(_QWORD *)(v39 + 8 * v41) & 0xFFFFFFFFFFFFFFFCLL;
        }
      }
      else if (v19 | v18)
      {
        v30 = v19 == 0;
        if (v19)
          v31 = -1;
        else
          v31 = 1;
        if (v19)
          v32 = v14;
        else
          v32 = v16;
        *(_BYTE *)(v13 + 16) = v31;
        v33 = v13 + 16;
        *(_QWORD *)(v33 + 8) = v32;
        if (v30)
          v34 = -1;
        else
          v34 = 1;
        *(_QWORD *)(v33 + 32) = v4;
        *(_BYTE *)(v33 + 24) = v34;
        result = OUTLINED_FUNCTION_7_62(result, (unsigned __int8 *)v33);
        v13 = *(_QWORD *)(v5 + 200);
        v28 = *(_BYTE *)(v13 + 40);
        goto LABEL_79;
      }
    }
LABEL_36:
    v25 = v8 & 0xFFFFFFFFFFFFFFFCLL;
    v30 = v4 == a3;
    v4 = v8 & 0xFFFFFFFFFFFFFFFCLL;
  }
  while (!v30);
  if (v7 && (*(_BYTE *)v7 & 2) != 0)
  {
    v43 = *(_DWORD *)(*(_QWORD *)(v5 + 192) + 9084) + *(char *)(*(_QWORD *)(v5 + 200) + 136);
    *(_QWORD *)(v7 + 8 * v43) = *(_QWORD *)(v7 + 8 * v43) & 3 | v25;
    if (v25 && (*(_BYTE *)v25 & 2) != 0)
    {
LABEL_106:
      v44 = v25 + 8 * *(char *)(*(_QWORD *)(v5 + 200) + 136);
      *(_QWORD *)(v44 + 24) = *(_QWORD *)(v44 + 24) & 3 | v7;
    }
    else
    {
      *(_QWORD *)v25 = v7;
    }
  }
  else if (v25 && (*(_BYTE *)v25 & 2) != 0)
  {
    *(_QWORD *)(v7 + 8) = v25;
    goto LABEL_106;
  }
  return result;
}

uint64_t fdel(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  int v5;

  v2 = *(_QWORD *)(a1 + 200);
  if (a2)
  {
    v3 = *(uint64_t **)(v2 + 104);
    v4 = *(_QWORD *)(v2 + 112);
  }
  else
  {
    v5 = *(char *)(v2 + 136);
    v3 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(v2 + 120) + 8 * (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + v5)) & 0xFFFFFFFFFFFFFFFCLL);
    v4 = *(_QWORD *)(*(_QWORD *)(v2 + 128) + 8 * (v5 + 3)) & 0xFFFFFFFFFFFFFFFCLL;
  }
  return fdeldel(a1, v3, v4);
}

uint64_t vdelinit(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  unint64_t i;

  *(_QWORD *)(*(_QWORD *)(a1 + 192) + 9072) = malloc_type_malloc(*(unsigned __int8 *)(a1 + 288), 0x92BB8A27uLL);
  v2 = malloc_type_malloc(*(unsigned __int8 *)(a1 + 288), 0xB32BBAE7uLL);
  result = 0;
  v4 = *(_QWORD *)(a1 + 192);
  *(_QWORD *)(*(_QWORD *)(a1 + 200) + 160) = v2;
  if (*(_QWORD *)(v4 + 9072) && v2)
  {
    for (i = 0; i < *(unsigned __int8 *)(a1 + 288); ++i)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 9072) + i) = 0;
    **(_BYTE **)(*(_QWORD *)(a1 + 200) + 160) = -1;
    return 1;
  }
  return result;
}

void vdelCleanup(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 200) + 160);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 200) + 160) = 0;
  }
  v3 = *(void **)(*(_QWORD *)(a1 + 192) + 9072);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 192) + 9072) = 0;
  }
}

uint64_t setnonseqIndex(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;

  v2 = 0;
  v3 = *(_QWORD *)(*(_QWORD *)(result + 200) + 160);
  while (1)
  {
    v4 = *(char *)(v3 + v2);
    if (v4 == -1)
      break;
    if (v4 == a2)
      return result;
    ++v2;
  }
  *(_BYTE *)(v3 + v2) = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 200) + 160) + (v2 + 1)) = -1;
  return result;
}

uint64_t clearnonseqIndex(uint64_t result)
{
  **(_BYTE **)(*(_QWORD *)(result + 200) + 160) = -1;
  return result;
}

uint64_t mapsyncs(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  char v9;
  int v10;

  result = absoluteSyncNum(a1, a2);
  v5 = 0;
  v6 = a2 + 8 * *(int *)(*(_QWORD *)(a1 + 192) + 9084);
  *(_QWORD *)(v6 - 24) |= 2uLL;
  v7 = *(_QWORD *)(a1 + 200);
  v8 = *(_DWORD *)(v7 + 200);
  *(_DWORD *)(v7 + 200) = v8 + 1;
  *(_WORD *)(*(_QWORD *)(v7 + 192) + 2 * (int)result) = v8;
  while (1)
  {
    v9 = v5;
    if (v5 >= (int)*(unsigned __int8 *)(a1 + 288))
      break;
    v10 = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084);
    if ((*(_QWORD *)(a2 + 8 * (v10 + v5)) & 1) != 0)
    {
      result = VRSYNC(a1, a2, v5);
      if (result)
      {
        if ((*(_QWORD *)(result + 8 * (v10 - 3)) & 2) == 0)
          result = mapsyncs(a1, result);
      }
    }
    v5 = v9 + 1;
  }
  return result;
}

void vredoctxt(uint64_t a1, int a2)
{
  signed __int8 v4;
  _DWORD *v5;
  _QWORD *i;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  BOOL v10;
  int v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  v4 = 0;
  v5 = *(_DWORD **)(a1 + 200);
  v5[86] = 0;
  v5[56] = a2;
  v5[57] = 0;
  while (*(unsigned __int8 *)(a1 + 288) > v4)
  {
    for (i = *(_QWORD **)(*(_QWORD *)(a1 + 200) + 8); i; i = VLSYNC((uint64_t)i, v4))
    {
      v7 = *(_QWORD *)(a1 + 192);
      if (*(_DWORD *)(*(_QWORD *)(a1 + 200) + 224))
      {
        v8 = i[*(int *)(v7 + 9084) - 3];
        if ((v8 & 2) != 0
          || (v8 <= 3 ? (v9 = *i > 3uLL) : (v9 = 1),
              !v9 ? (v10 = ((*i | v8) & 1) == 0) : (v10 = 0),
              !v10))
        {
          v11 = checkInterrupt(a1);
          v12 = *(_QWORD *)(a1 + 200);
          if (v11)
          {
            *(_DWORD *)(v12 + 224) = 0;
          }
          else if (*(_DWORD *)(v12 + 224))
          {
            *(_DWORD *)(v12 + 228) = 1;
            goto LABEL_20;
          }
          v7 = *(_QWORD *)(a1 + 192);
        }
      }
      v13 = &i[*(int *)(v7 + 9084)];
      *(v13 - 3) &= ~2uLL;
      OUTLINED_FUNCTION_10_58(*i & 0xFFFFFFFFFFFFFFFELL);
      *(_QWORD *)(v15 - 24) = v14 & 0xFFFFFFFFFFFFFFFELL;
      OUTLINED_FUNCTION_10_58(*i & 3);
      *(_QWORD *)(v17 - 24) = v16 & 3;
    }
    ++v4;
  }
LABEL_20:
  vclrctxt(a1);
  v22 = *(_QWORD *)(a1 + 200);
  if (a2 && !*(_DWORD *)(v22 + 228))
  {
    vf_printf(a1, *(char *)(*(_QWORD *)(a1 + 216) + 4), 1, "The delta is correct.\n", v18, v19, v20, v21, v23);
    v22 = *(_QWORD *)(a1 + 200);
  }
  *(_DWORD *)(v22 + 344) = 1;
  OUTLINED_FUNCTION_11_55();
}

void vclrctxt(uint64_t a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  _QWORD *i;
  uint64_t j;
  uint64_t v6;

  v2 = 0;
  v3 = *(unsigned __int8 *)(a1 + 288);
  while (v3 > v2)
  {
    for (i = *(_QWORD **)(*(_QWORD *)(a1 + 200) + 8); i; i = VLSYNC((uint64_t)i, (char)v2))
    {
      for (j = 0; v3 != j; ++j)
      {
        if ((i[j + *(int *)(*(_QWORD *)(a1 + 192) + 9084)] & 1) == 0)
        {
          i[j + 3] &= 3uLL;
          v6 = j + *(int *)(*(_QWORD *)(a1 + 192) + 9084);
          i[v6] &= 3uLL;
          *(_DWORD *)(*(_QWORD *)(a1 + 200) + 228) = 1;
        }
      }
    }
    ++v2;
  }
  OUTLINED_FUNCTION_11_55();
}

uint64_t cacheDeletedDeltaObject(uint64_t a1, uint64_t a2)
{
  return free_heap(a1, a2, 0);
}

uint64_t seqscan(uint64_t result, unsigned __int8 *a2)
{
  int v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  int v8;
  unsigned __int8 v9;
  uint64_t v10;
  _QWORD *v11;
  _BYTE v12[100];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *a2;
  v3 = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 2) = v3;
  if (v2 == 1)
    v4 = 1;
  else
    v4 = *(int *)(*(_QWORD *)(result + 192) + 9084) - 2;
  v5 = 0;
  v6 = 0;
  v7 = *(_QWORD *)(v3 + 8 * v4) & 0xFFFFFFFFFFFFFFFCLL;
  v8 = *(unsigned __int8 *)(result + 288);
  while (v8 != (_DWORD)v5)
  {
    if ((*(_QWORD *)(v7 + 8 * (v5 + *(int *)(*(_QWORD *)(result + 192) + 9084))) & 1) != 0)
      v12[v6++] = v5;
    ++v5;
  }
LABEL_9:
  v9 = 0;
  do
  {
    if (v6 <= v9)
    {
      v11 = (_QWORD *)(v3 + 8);
      if ((~*(_DWORD *)(v3 + 8) & 3) != 0)
        *((_DWORD *)a2 + 1) = 1;
      *((_QWORD *)a2 + 2) = v3;
      if (v2 == 1)
        v11 = (_QWORD *)(v3 + 8 * *(int *)(*(_QWORD *)(result + 192) + 9084) - 16);
      v3 = *v11 & 0xFFFFFFFFFFFFFFFCLL;
      goto LABEL_9;
    }
    v10 = *(_QWORD *)(v3 + 8 * (*(_DWORD *)(*(_QWORD *)(result + 192) + 9084) + v12[v9++]));
  }
  while ((v10 & 1) == 0);
  return result;
}

void OUTLINED_FUNCTION_1_73(_DWORD *a1@<X8>)
{
  ++*a1;
}

uint64_t OUTLINED_FUNCTION_3_71()
{
  uint64_t v0;
  unsigned int v1;
  uint64_t v2;

  return (**(uint64_t (***)(uint64_t))(v2 + 96 * v1 + 16))(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_4_66(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  return vsetsc(a1, a2, 1, a4, a5, a6);
}

uint64_t OUTLINED_FUNCTION_5_63()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_6_62@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(result + 8) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_7_62(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;

  return seqscan(v2, a2);
}

uint64_t OUTLINED_FUNCTION_8_60()
{
  return 1;
}

void OUTLINED_FUNCTION_9_59(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 + 452) = 1;
}

void OUTLINED_FUNCTION_10_58(uint64_t a1@<X8>)
{
  _QWORD *v1;

  *v1 = a1;
}

uint64_t OUTLINED_FUNCTION_12_52()
{
  uint64_t v0;

  return v0;
}

uint64_t varloc(uint64_t a1, __int16 a2, unsigned __int16 a3, uint64_t a4)
{
  __int16 v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v4 = a3 | (a2 << 8);
  if ((a2 & 0x80) != 0)
  {
    v7 = *(_QWORD *)(a1 + 192) + 8 * ((a3 | (unsigned __int16)(a2 << 8)) & 0x3FFF) + 9288;
    return *(_QWORD *)v7;
  }
  v5 = *(_QWORD *)(a1 + 192);
  if (!a4 || *(_QWORD *)(v5 + 8104) == a4)
  {
    result = *(_QWORD *)(*(_QWORD *)(v5 + 8112) + 8);
    if (!result)
      return result;
    goto LABEL_8;
  }
  result = vonstack(a1, a4);
  if (result)
  {
LABEL_8:
    v7 = *(_QWORD *)(result + 16) + 8 * (v4 & 0x3FFF);
    return *(_QWORD *)v7;
  }
  return result;
}

uint64_t vrd_nvar()
{
  unsigned __int8 v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  char v4;
  char v5;
  char *v6;
  char v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  char v25[40];
  uint64_t v26;

  OUTLINED_FUNCTION_34_37();
  v3 = 0;
  v4 = 0;
  v26 = *MEMORY[0x24BDAC8D0];
LABEL_2:
  while ((v4 & 1) == 0)
  {
    v5 = 1;
    v6 = v25;
    while (1)
    {
      v7 = v5;
      OUTLINED_FUNCTION_56_24();
      if (v8 == 10)
        break;
      if ((v8 + 1) < 2)
      {
        *v6 = 0;
        v9 = 1;
        OUTLINED_FUNCTION_2_73(v1, *(char *)(*(_QWORD *)(v1 + 216) + 5), *(_QWORD *)(v1 + 184) + 32);
        *(_BYTE *)(*(_QWORD *)(v1 + 184) + 32) = 0;
        *(_DWORD *)(*(_QWORD *)(v1 + 184) + 436) = 0;
        OUTLINED_FUNCTION_32_38();
        v3 = 0;
        v4 = 0;
        if (!v10)
          goto LABEL_2;
        return v9;
      }
      if (v8 == 32)
      {
        v5 = 1;
        if ((v7 & 1) == 0)
        {
          v3 = 32;
          goto LABEL_13;
        }
      }
      else
      {
        v5 = 0;
        *v6++ = v8;
      }
    }
    v3 = 10;
LABEL_13:
    *v6 = 0;
    v11 = *(__int16 *)(v2 + 8);
    if (v11 == -4)
    {
      if (chk_itok((unsigned __int8 *)v25))
      {
        **(_WORD **)v2 = atoi(v25);
        v4 = 1;
        continue;
      }
      readErrorReport(v1, v0, v17, "\"%s\" is not an integer", v18, v19, v20, v21, (uint64_t)v25);
    }
    else
    {
      v4 = 1;
      if (v11 != -3)
        continue;
      if (chk_itok((unsigned __int8 *)v25))
      {
        **(_QWORD **)v2 = atol(v25);
        v4 = 1;
        continue;
      }
      readErrorReport(v1, v0, v12, "\"%s\" is not an long integer (longint)", v13, v14, v15, v16, (uint64_t)v25);
    }
    OUTLINED_FUNCTION_32_38();
    v4 = 1;
    if (v22)
      return 1;
  }
  if (v3 != 10)
  {
    OUTLINED_FUNCTION_56_24();
    if (v23 != 10)
      vf_ungetc();
  }
  return 0;
}

void var_rderr()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  char v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  OUTLINED_FUNCTION_34_37();
  OUTLINED_FUNCTION_16_48(v4, v5, "cmdwin");
  if (v6 || (v2 = 1, OUTLINED_FUNCTION_16_48(v1, v0, "pgmwin"), v7))
  {
    v8 = OUTLINED_FUNCTION_57_24();
    OUTLINED_FUNCTION_46_27(v8);
    v9 = OUTLINED_FUNCTION_40_34();
    OUTLINED_FUNCTION_36_37(v9);
    OUTLINED_FUNCTION_38_35();
    OUTLINED_FUNCTION_37_36();
    v10 = dynaBufContents(v2);
    v11 = OUTLINED_FUNCTION_35_37();
    OUTLINED_FUNCTION_33_38(v11, v12, v13, "Error in <%s>, re-enter:\n", v14, v15, v16, v17, v10 + v3 - v11);
    OUTLINED_FUNCTION_58_24();
  }
  OUTLINED_FUNCTION_8_61();
}

uint64_t chk_itok(unsigned __int8 *a1)
{
  int v1;
  char *v2;
  int v3;
  int v4;

  v1 = *a1;
  if (v1 != 43 && v1 != 45 && ((char)v1 - 48) > 9)
    return 0;
  v2 = (char *)(a1 + 1);
  while (1)
  {
    v4 = *v2++;
    v3 = v4;
    if (!v4)
      break;
    if ((v3 - 48) >= 0xA)
      return 0;
  }
  return 1;
}

void readErrorReport(uint64_t a1, unsigned __int8 a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v11 = *(_QWORD *)(a1 + 216);
  v12 = 4;
  if (*(unsigned __int8 *)(v11 + 1) != a2)
    v12 = 5;
  v13 = *(char *)(v11 + v12);
  vf_printf(a1, v13, 0, "Error: %s: ", a5, a6, a7, a8, (char)"DELTIO");
  vf_printf(a1, v13, 1, a4, v14, v15, v16, v17, (char)&a9);
}

void lithex(_BYTE *a1, char *a2, int a3)
{
  uint64_t v5;
  char *v6;
  int v7;
  char *v9;
  int v10;
  size_t v11;
  char *v12;
  int v13;
  size_t v14;
  char __src[20];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3 - 8;
  v6 = a2;
  while (1)
  {
    v7 = (char)*a1;
    if (!*a1 || v6 - a2 >= v5)
      break;
    if ((v7 - 127) >= 0xA1u)
    {
      *v6++ = v7;
    }
    else
    {
      switch(*a1)
      {
        case 7:
        case 8:
        case 9:
        case 0xA:
        case 0xB:
        case 0xC:
        case 0xD:
          goto LABEL_14;
        default:
          if (v7 == 34 || v7 == 39 || v7 == 63 || v7 == 92)
          {
LABEL_14:
            OUTLINED_FUNCTION_62_23();
            __sprintf_chk(v9, v10, v11, "'\\%s'");
          }
          else
          {
            OUTLINED_FUNCTION_62_23();
            __sprintf_chk(v12, v13, v14, "'\\x%2x'");
          }
          strcpy(v6, __src);
          v6 += strlen(__src);
          break;
      }
    }
    ++a1;
  }
  *v6 = 0;
  OUTLINED_FUNCTION_15_49();
}

uint64_t vrd_tvar(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 *v5;
  int v6;
  char v7;
  unsigned int v8;
  char **v9;
  int v10;
  unsigned __int8 *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 v25;
  char **v26;
  char *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char **v43;
  char *v44;
  int v45;
  uint64_t v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v52;
  void **v53;
  int v54;
  double v55;
  __int16 v56;
  uint64_t v57;
  int v58;
  unsigned __int8 v59;
  char __s1[40];
  uint64_t v61;

  v5 = 0;
  LOBYTE(v6) = 0;
  v7 = 0;
  v61 = *MEMORY[0x24BDAC8D0];
  v59 = 0;
  v58 = 0;
  v57 = 0;
  v56 = 0;
  v55 = 0.0;
  v53 = (void **)a3;
  v8 = *(unsigned __int8 *)(a3 + 8);
  v9 = &vstmtbl[12 * *(unsigned __int8 *)(a3 + 8) + 1];
  v10 = (char)v8;
  while (1)
  {
    v11 = v5;
    if ((v7 & 1) != 0)
    {
      vinitflds(a1, v8, *v53, v5);
      if (v6 != 10)
      {
        OUTLINED_FUNCTION_14_51();
        vf_getc();
        if (v52 != 10)
        {
          OUTLINED_FUNCTION_14_51();
          vf_ungetc();
        }
      }
      return 0;
    }
    v12 = gettok_0(a1, v8, a2, __s1);
    if (!v12)
      break;
    v6 = v12;
    if (OUTLINED_FUNCTION_43_30())
      break;
    v7 = 0;
    v5 = v11;
    if (v6 != 10)
    {
      v13 = STMTYP(v10);
      v7 = 1;
      v5 = v11;
      switch((int)v13)
      {
        case -5:
          v19 = chk_ftok((unsigned __int8 *)__s1);
          if ((_DWORD)v19)
          {
            v55 = atof(__s1);
            v7 = 1;
            v5 = (unsigned __int8 *)&v55;
          }
          else
          {
            OUTLINED_FUNCTION_5_64(v19, v20, v21, v22, v23, v24);
            v7 = 0;
            v5 = (unsigned __int8 *)&v55;
            if (v48)
              return 1;
          }
          continue;
        case -4:
          v30 = chk_itok((unsigned __int8 *)__s1);
          if ((_DWORD)v30)
          {
            v56 = atoi(__s1);
            v7 = 1;
            v5 = (unsigned __int8 *)&v56;
          }
          else
          {
            OUTLINED_FUNCTION_5_64(v30, v31, v32, v33, v34, v35);
            v7 = 0;
            v5 = (unsigned __int8 *)&v56;
            if (v49)
              return 1;
          }
          continue;
        case -3:
          v36 = chk_itok((unsigned __int8 *)__s1);
          if ((_DWORD)v36)
          {
            v57 = atol(__s1);
            v7 = 1;
            v5 = (unsigned __int8 *)&v57;
          }
          else
          {
            OUTLINED_FUNCTION_5_64(v36, v37, v38, v39, v40, v41);
            v7 = 0;
            v5 = (unsigned __int8 *)&v57;
            if (v50)
              return 1;
          }
          break;
        case -2:
          v54 = v10;
          v42 = 0;
          v43 = v9;
          v44 = *v9;
          v45 = *((__int16 *)v44 + 14);
          v46 = v45 & ~(v45 >> 31);
          while (1)
          {
            v58 = v42;
            if (v46 == v42)
              break;
            v13 = strcmp(__s1, *(const char **)(*((_QWORD *)v44 + 2) + 8 * v42++));
            if (!(_DWORD)v13)
            {
              LODWORD(v46) = v42 - 1;
              break;
            }
          }
          v7 = 1;
          v5 = (unsigned __int8 *)&v58;
          v9 = v43;
          v10 = v54;
          if ((_DWORD)v46 != v45)
            continue;
LABEL_23:
          OUTLINED_FUNCTION_5_64(v13, v14, v15, v16, v17, v18, v53);
          v7 = 0;
          v5 = v11;
          if (v47)
            return 1;
          continue;
        case -1:
          v25 = 0;
          v26 = v9;
          v27 = *v9;
          v28 = *((__int16 *)v27 + 14);
          do
          {
            v59 = v25;
            v29 = v25;
            if (v25 >= v28)
              break;
            v13 = strcmp(__s1, *(const char **)(*((_QWORD *)v27 + 2) + 8 * v25));
            v25 = v29 + 1;
          }
          while ((_DWORD)v13);
          v7 = 1;
          v5 = &v59;
          v9 = v26;
          if (v29 != v28)
            continue;
          goto LABEL_23;
        default:
          continue;
      }
    }
  }
  OUTLINED_FUNCTION_59_23();
  return 1;
}

uint64_t gettok_0(uint64_t a1, unsigned int a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  _BOOL4 v7;
  char v8;
  char v9;
  char **v10;
  _BYTE *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  char v17;
  int v18;
  int v19;
  char v20;
  BOOL v21;
  BOOL v23;
  char v24;
  _BOOL4 v26;
  char *v27;

  v6 = (int)vstmtbl[12 * a2 + 10];
  v7 = OUTLINED_FUNCTION_25_43() == -4
    || OUTLINED_FUNCTION_25_43() == -3
    || OUTLINED_FUNCTION_25_43() == -5;
  v8 = 0;
  v9 = 0;
  v10 = &vstmtbl[12 * a2];
  v11 = (char *)v10 + 84;
  v27 = (char *)v10 + 85;
  if (v6 != 1)
    v7 = 1;
  v26 = v7;
  while (1)
  {
    OUTLINED_FUNCTION_11_56();
    v13 = v12;
    v14 = v12;
    if (v12 == 92)
    {
      OUTLINED_FUNCTION_11_56();
      v16 = v15;
      if ((v15 & 0xFFFFFFF8) == 0x30)
      {
        v17 = 0;
        while ((v16 & 0xFFFFFFF8) == 0x30)
        {
          v17 = v16 + 8 * v17 - 48;
          OUTLINED_FUNCTION_11_56();
          v16 = v18;
        }
        OUTLINED_FUNCTION_21_46();
        LOBYTE(v16) = v17;
      }
      else
      {
        if ((v15 & 0xFFFFFFDF) == 0x58)
        {
          for (LOBYTE(v16) = 0; ; LOBYTE(v16) = v19 + 16 * v16 + v20)
          {
            OUTLINED_FUNCTION_11_56();
            if ((v19 - 48) >= 0xA)
            {
              if ((v19 - 97) >= 6)
              {
                if ((v19 - 65) > 5)
                {
                  OUTLINED_FUNCTION_21_46();
                  goto LABEL_26;
                }
                v20 = -55;
              }
              else
              {
                v20 = -87;
              }
            }
            else
            {
              v20 = -48;
            }
          }
        }
        switch(v15)
        {
          case 'n':
            LOBYTE(v16) = 10;
            break;
          case 'o':
          case 'p':
          case 'q':
          case 's':
          case 'u':
            break;
          case 'r':
            LOBYTE(v16) = 13;
            break;
          case 't':
            LOBYTE(v16) = 9;
            break;
          case 'v':
            LOBYTE(v16) = 11;
            break;
          default:
            switch(v15)
            {
              case 'a':
                LOBYTE(v16) = 7;
                break;
              case 'f':
                LOBYTE(v16) = 12;
                break;
              case 'b':
                LOBYTE(v16) = 8;
                break;
            }
            break;
        }
      }
LABEL_26:
      v14 = (char)v16;
    }
    v21 = v13 != 92 && v14 == 10;
    if (v21)
      break;
    if (v13 != 92 && (v14 + 1) <= 1)
    {
      LOBYTE(v14) = 0;
LABEL_69:
      *a4 = 0;
      return (char)v14;
    }
    if (v13 == 92)
      goto LABEL_45;
    if (v14 == (char)*v11)
    {
      v21 = v8 == 0;
      v8 = 1;
      if (!v21)
      {
        if (v14 == *v27)
          goto LABEL_76;
        goto LABEL_71;
      }
    }
    else
    {
      if (v14 == *v27)
      {
        if (v8)
        {
LABEL_76:
          *a4 = 0;
LABEL_77:
          LOBYTE(v14) = *(a4 - 1);
          return (char)v14;
        }
LABEL_71:
        LOBYTE(v14) = 0;
        return (char)v14;
      }
LABEL_45:
      if (v13 == 92 || (v14 == 32 ? (v23 = v6 == 1) : (v23 = 1), v23 || v8))
      {
        *a4++ = v14;
        if (v8)
          v24 = 1;
        else
          v24 = v26;
        if (v26)
          v9 = 1;
        else
          v8 = 1;
        if ((v24 & 1) == 0)
          goto LABEL_69;
      }
      else
      {
        v8 = 0;
        v21 = v9 == 0;
        v9 = 0;
        if (!v21)
        {
          *a4 = 0;
          LOBYTE(v14) = 32;
          return (char)v14;
        }
      }
    }
  }
  if (v8)
  {
    if (v6 == 1)
    {
      LOBYTE(v14) = *v11;
      *(_WORD *)a4 = *v11;
      return (char)v14;
    }
    goto LABEL_71;
  }
  *a4 = 0;
  if (v9)
  {
    OUTLINED_FUNCTION_21_46();
    goto LABEL_77;
  }
  LOBYTE(v14) = 10;
  return (char)v14;
}

void rdtokverr(uint64_t a1, unsigned __int8 a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11[75];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  lithex(a4, v11, 75);
  readErrorReport(a1, a2, v6, "\"%s\" is not a token name in stream \"%s\"", v7, v8, v9, v10, (uint64_t)v11);
  var_rderr();
}

uint64_t chk_ftok(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;
  _BYTE *i;

  v1 = *a1;
  v2 = v1 > 0x2E || ((1 << v1) & 0x680000000000) == 0;
  if (v2 && ((char)v1 - 48) > 9)
    return 0;
  v3 = 0;
  for (i = a1 + 1; ; ++i)
  {
    if (v1 == 46)
    {
      if (v3)
        return 0;
      v1 = *i;
      if (!*i)
        return 0;
      v3 = 1;
    }
    else
    {
      v1 = *i;
    }
    if (v1 != 46)
      break;
LABEL_14:
    ;
  }
  if (v1)
  {
    if (((char)v1 - 48) >= 0xA)
      return 0;
    goto LABEL_14;
  }
  return 1;
}

void vrd_delta(uint64_t a1, uint64_t a2, unsigned int a3)
{
  char **v6;
  char **v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  _BYTE *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  int v27;
  uint64_t v28;
  unsigned __int8 v30;
  char *v31;
  int v32;
  int v33;
  int v34;
  int v35;
  double *v36;
  uint64_t v37;
  double v38;
  __int16 v39;
  uint64_t v40;
  int v41;
  unsigned __int8 v42;
  char __s1[40];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v42 = 0;
  v41 = 0;
  v40 = 0;
  v39 = 0;
  v38 = 0.0;
  v36 = 0;
  v37 = (unsigned __int16)OUTLINED_FUNCTION_25_43();
  v6 = &vstmtbl[12 * a3];
  v8 = v6[1];
  v7 = v6 + 1;
  BYTE2(v37) = v8[32];
  v9 = *(_QWORD *)(a1 + 200);
  v10 = *(int *)(v9 + 292);
  v11 = *(_QWORD *)(v9 + 1720) - v10;
  *(_QWORD *)(v9 + 1720) = v11;
  *(_DWORD *)(v9 + 1728) -= v10;
  *(_BYTE *)v11 = 5;
  *(_QWORD *)(v11 + 8) = *(_QWORD *)(v9 + 1760);
  *(_QWORD *)(v9 + 1760) = v11;
  while (1)
  {
    v12 = OUTLINED_FUNCTION_14_51();
    v15 = gettok_0(v12, v13, a2, v14);
    if (v15 == 10)
      break;
    v16 = v15;
    if (OUTLINED_FUNCTION_43_30())
      break;
    if (!v16)
    {
      OUTLINED_FUNCTION_59_23();
      break;
    }
    v17 = OUTLINED_FUNCTION_25_43();
    switch((int)v17)
    {
      case -5:
        v36 = &v38;
        if (!chk_ftok((unsigned __int8 *)__s1))
          goto LABEL_22;
        v38 = atof(__s1);
        goto LABEL_24;
      case -4:
        if (!OUTLINED_FUNCTION_47_27(v17, v18, v19, v20, v21, v22, v23, v24))
          goto LABEL_22;
        v39 = atoi(__s1);
        goto LABEL_24;
      case -3:
        if (!OUTLINED_FUNCTION_47_27(v17, v18, v19, v20, v21, v22, v23, v24))
          goto LABEL_22;
        v40 = atol(__s1);
        goto LABEL_24;
      case -2:
        v25 = 0;
        v36 = (double *)&v41;
        v26 = *v7;
        v27 = *((__int16 *)*v7 + 14);
        v28 = v27 & ~(v27 >> 31);
        break;
      case -1:
        v30 = 0;
        v36 = (double *)&v42;
        v31 = *v7;
        v32 = *((__int16 *)*v7 + 14);
        do
        {
          v42 = v30;
          v33 = v30;
          if (v30 >= v32)
            break;
          v34 = strcmp(__s1, *(const char **)(*((_QWORD *)v31 + 2) + 8 * v30));
          v30 = v33 + 1;
        }
        while (v34);
        if (v33 != v32)
          goto LABEL_24;
LABEL_22:
        readErrorReport(a1, a2, v19, "\"%s\" is not a token name", v21, v22, v23, v24, (uint64_t)__s1);
        goto LABEL_23;
      default:
        goto LABEL_24;
    }
    while (1)
    {
      v41 = v25;
      if (v28 == v25)
        break;
      if (!strcmp(__s1, *(const char **)(*((_QWORD *)v26 + 2) + 8 * v25++)))
      {
        LODWORD(v28) = v25 - 1;
        break;
      }
    }
    if ((_DWORD)v28 == v27)
    {
      readErrorReport(a1, a2, v19, "\"%s\" is not a token name", v21, v22, v23, v24, (uint64_t)__s1);
      v36 = 0;
LABEL_23:
      dlt_rderr();
      if (v35)
        break;
    }
LABEL_24:
    vpush_var(a1, (uint64_t)&v36);
  }
  OUTLINED_FUNCTION_18_47();
}

void dlt_rderr()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  char v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_34_37();
  OUTLINED_FUNCTION_16_48(v4, v5, "cmdwin");
  if (v6 || (v2 = 1, OUTLINED_FUNCTION_16_48(v1, v0, "pgmwin"), v7))
  {
    v8 = OUTLINED_FUNCTION_57_24();
    OUTLINED_FUNCTION_46_27(v8);
    v9 = OUTLINED_FUNCTION_40_34();
    OUTLINED_FUNCTION_36_37(v9);
    OUTLINED_FUNCTION_38_35();
    OUTLINED_FUNCTION_37_36();
    v10 = dynaBufContents(v2);
    v11 = OUTLINED_FUNCTION_35_37();
    OUTLINED_FUNCTION_33_38(v11, v12, v13, "Error in <%s>, re-enter:\n", v14, v15, v16, v17, v10 + v3 - v11);
    v18 = *(_QWORD *)(v1 + 200);
    v19 = *(_QWORD *)(v18 + 1744);
    if (v19)
    {
      v20 = *(_QWORD *)(v18 + 1760);
      *(_QWORD *)(v18 + 1720) = v20;
      *(_DWORD *)(v18 + 1728) = *(_DWORD *)(v18 + 1780) + v20 - *(_DWORD *)(v19 + 32);
    }
    OUTLINED_FUNCTION_58_24();
  }
  OUTLINED_FUNCTION_8_61();
}

void vprt_strm(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, int a5, int a6)
{
  int v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  char __s1[80];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  while (1)
  {
    OUTLINED_FUNCTION_49_25();
    if (a3 == a4 || a3 == v12)
      break;
    a3 = *(_QWORD *)(a3 + 8 * (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + a5)) & 0xFFFFFFFFFFFFFFFCLL;
    if (!a3 || (*(_BYTE *)a3 & 2) == 0)
    {
      disptok(v11, a3 + 16, a5, a6, __s1);
      if (__s1[0] == 92)
        cleanLiteral((unsigned __int8 *)__s1, 0, 0);
      v14 = __strcat_chk();
      OUTLINED_FUNCTION_28_39(v14, v15, v14);
      a3 = *(_QWORD *)(a3 + 8) & 0xFFFFFFFFFFFFFFFCLL;
    }
  }
  v16 = OUTLINED_FUNCTION_35_37();
  v17 = OUTLINED_FUNCTION_54_25();
  __s1[v16] = 0;
  OUTLINED_FUNCTION_28_39(v17, v18, (uint64_t)__s1);
  OUTLINED_FUNCTION_54_25();
  v19 = OUTLINED_FUNCTION_14_51();
  OUTLINED_FUNCTION_2_73(v19, v20, v21);
}

uint64_t disptok(int a1, int a2, int a3, int a4, char *__s1)
{
  char **v6;
  char *v7;
  _QWORD *v8;
  char *v9;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;

  v6 = &vstmtbl[12 * a3];
  v9 = v6[1];
  v8 = v6 + 1;
  v7 = v9;
  switch(*(_WORD *)&v9[40 * a4 + 30])
  {
    case 0xFFFB:
      OUTLINED_FUNCTION_3_72();
      v11 = *(const char **)(*v8 + 40 * a4 + 8);
      v19 = *(_QWORD *)OUTLINED_FUNCTION_3_72();
      sprintf(__s1, v11, v19);
      break;
    case 0xFFFC:
      OUTLINED_FUNCTION_3_72();
      v12 = *(const char **)(*v8 + 40 * a4 + 8);
      v13 = *(__int16 *)OUTLINED_FUNCTION_3_72();
      sprintf(__s1, v12, v13);
      break;
    case 0xFFFD:
      OUTLINED_FUNCTION_3_72();
      v14 = *(const char **)(*v8 + 40 * a4 + 8);
      v15 = *(_QWORD *)OUTLINED_FUNCTION_3_72();
      sprintf(__s1, v14, v15);
      break;
    case 0xFFFE:
      v16 = *(_QWORD *)&v7[40 * a4 + 16];
      v17 = *(__int16 *)OUTLINED_FUNCTION_4_67((uint64_t)vstmtbl[12 * a3 + 2]);
      goto LABEL_9;
    case 0xFFFF:
      v16 = *(_QWORD *)&v7[40 * a4 + 16];
      v17 = *(unsigned __int8 *)OUTLINED_FUNCTION_4_67((uint64_t)vstmtbl[12 * a3 + 2]);
LABEL_9:
      strcpy(__s1, *(const char **)(v16 + 8 * v17));
      break;
    default:
      break;
  }
  result = strcmp(__s1, "undefined");
  if (!(_DWORD)result)
    *(_DWORD *)__s1 = 2960685;
  return result;
}

void vsvdelta(_QWORD *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char **v9;
  char *v10;
  int v11;
  size_t v12;
  char *v13;
  int v14;
  size_t v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  uint64_t v19;
  int v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  const char **v26;
  char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  const char *v36;

  v2 = a1[25];
  if (*(_DWORD *)(v2 + 248))
  {
    v3 = (uint64_t)a1;
    *(_BYTE *)(v2 + 478) = a2;
    if (*(_QWORD *)(v2 + 400)
      || (a1 = malloc_type_malloc(8 * *((unsigned __int8 *)a1 + 288), 0x80040B8603338uLL),
          (*(_QWORD *)(*(_QWORD *)(v3 + 200) + 400) = a1) != 0))
    {
      v4 = 0;
      v5 = 8 * *(unsigned __int8 *)(v3 + 288);
      while (1)
      {
        v6 = *(_QWORD *)(v3 + 200);
        if (v5 == v4)
          break;
        *(_QWORD *)(*(_QWORD *)(v6 + 400) + v4) = *(_QWORD *)v6;
        v4 += 8;
      }
      OUTLINED_FUNCTION_1_74((uint64_t)a1, *(char *)(v6 + 478), (uint64_t)"\nprint \"clearing...\" to cmdout");
      v8 = 0;
      v9 = vstmtbl;
      while (v8 < *(unsigned __int8 *)(v3 + 288))
      {
        OUTLINED_FUNCTION_10_59();
        __sprintf_chk(v10, v11, v12, "\nset ^_%s = ^left", v35);
        OUTLINED_FUNCTION_0_79();
        OUTLINED_FUNCTION_50_25();
        v9 += 12;
        OUTLINED_FUNCTION_10_59();
        __sprintf_chk(v13, v14, v15, "\ndelta delete %s ^left...^right", v36);
        OUTLINED_FUNCTION_0_79();
        ++v8;
      }
      OUTLINED_FUNCTION_1_74(v7, *(char *)(*(_QWORD *)(v3 + 200) + 478), (uint64_t)"\nprint \"restoring\" to cmdout");
      v17 = *(unsigned __int8 *)(v3 + 288);
      while (1)
      {
        v18 = __OFSUB__(v17--, 1);
        if (v17 < 0 != v18)
          break;
        OUTLINED_FUNCTION_2_73(v3, *(char *)(*(_QWORD *)(v3 + 200) + 478), (uint64_t)"\nprint \".\" to cmdout");
        v19 = OUTLINED_FUNCTION_14_51();
        reach(v19, v20, v21, 0xFFFFFFFF);
      }
      OUTLINED_FUNCTION_1_74(v16, *(char *)(*(_QWORD *)(v3 + 200) + 478), (uint64_t)"\nprint \"cleaning up...\" to cmdout");
      v25 = 0;
      v26 = (const char **)vstmtbl;
      while (v25 < *(unsigned __int8 *)(v3 + 288))
      {
        v27 = (char *)OUTLINED_FUNCTION_50_25();
        v28 = *v26;
        v26 += 12;
        __sprintf_chk(v27, 0, 0x46uLL, "\ndelta delete %s ^_%s", v28, v28);
        OUTLINED_FUNCTION_0_79();
        ++v25;
      }
      v29 = 9186;
      for (i = 1162; ; ++i)
      {
        if (i - 1161 >= *(int *)(v3 + 16))
        {
          OUTLINED_FUNCTION_1_74(v22, *(char *)(*(_QWORD *)(v3 + 200) + 478), (uint64_t)"\nprint \"\\n\" to cmdout\n");
          break;
        }
        v31 = *(_QWORD *)(v3 + 192);
        if (*(__int16 *)(v31 + v29 - 2) == -6 && (*(_BYTE *)(v31 + v29) & 0x20) == 0)
        {
          v32 = **(_QWORD **)(v31 + 8 * i);
          v33 = *(_QWORD *)(v3 + 200);
          if (v32 == *(_QWORD *)v33)
          {
            v34 = "\nset %s = ^left";
          }
          else
          {
            if (v32 != *(_QWORD *)(v33 + 8))
              goto LABEL_25;
            v34 = "\nset %s = ^right";
          }
          OUTLINED_FUNCTION_7_63((char *)(v33 + 408), v23, v24, v34);
          OUTLINED_FUNCTION_0_79();
        }
LABEL_25:
        v29 += 24;
      }
    }
  }
  OUTLINED_FUNCTION_8_61();
}

void reach(uint64_t a1, int a2, _BYTE *a3, unsigned int a4)
{
  uint64_t v5;
  _BYTE *i;
  unint64_t v8;
  int v9;
  const char **v10;
  char v11;
  const char *v12;
  uint64_t v13;
  _BYTE *v14;
  char *v15;
  int v16;
  size_t v17;
  uint64_t j;
  char v19;
  uint64_t v20;
  _BYTE *v21;
  const char *v22;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 400) + 8 * a2);
  if ((_BYTE *)v5 != a3)
  {
    for (i = (_BYTE *)VRSYNC(a1, v5, (char)a2); i != a3; i = (_BYTE *)VRSYNC(a1, (uint64_t)i, (char)a2))
    {
      v8 = 0;
      v9 = 0;
      v10 = (const char **)vstmtbl;
      while (v8 < *(unsigned __int8 *)(a1 + 288))
      {
        if (a2 != v8)
        {
          OUTLINED_FUNCTION_48_26();
          if ((v11 & 1) != 0)
          {
            v12 = ",";
            if (!v9)
            {
              v13 = OUTLINED_FUNCTION_61_23();
              prstuff(v13, a2, v14, i, 0xFFFFFFFFLL);
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 400) + 8 * a2) = i;
              OUTLINED_FUNCTION_2_73(a1, *(char *)(*(_QWORD *)(a1 + 200) + 478), (uint64_t)"\ndelta project ");
              v12 = (const char *)&unk_21F8A212A;
            }
            __sprintf_chk((char *)(*(_QWORD *)(a1 + 200) + 408), 0, 0x46uLL, "%s%s", v12, *v10);
            v9 = 1;
            OUTLINED_FUNCTION_2_73(a1, *(char *)(*(_QWORD *)(a1 + 200) + 478), *(_QWORD *)(a1 + 200) + 408);
          }
        }
        ++v8;
        v10 += 12;
      }
      if (v9)
      {
        OUTLINED_FUNCTION_10_59();
        __sprintf_chk(v15, v16, v17, " (.1) ^_%s", v22);
        OUTLINED_FUNCTION_2_73(a1, *(char *)(*(_QWORD *)(a1 + 200) + 478), *(_QWORD *)(a1 + 200) + 408);
        for (j = 0; j < *(unsigned __int8 *)(a1 + 288); ++j)
        {
          if (a2 != (_DWORD)j)
          {
            OUTLINED_FUNCTION_48_26();
            if ((v19 & 1) != 0)
              reach(a1, j, i, a2);
          }
        }
      }
    }
    v20 = OUTLINED_FUNCTION_61_23();
    prstuff(v20, a2, v21, a3, a4);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 400) + 8 * a2) = a3;
  }
  OUTLINED_FUNCTION_15_49();
}

uint64_t svgetl()
{
  void *v0;
  size_t v1;
  size_t v2;
  FILE *v3;
  unsigned int v5;

  v0 = (void *)OUTLINED_FUNCTION_30_38();
  fread(v0, v1, v2, v3);
  return bswap32(v5);
}

void svgeti()
{
  void *v0;
  size_t v1;
  size_t v2;
  FILE *v3;

  v0 = (void *)OUTLINED_FUNCTION_29_38();
  fread(v0, v1, v2, v3);
  OUTLINED_FUNCTION_39_34();
}

void svgetc(uint64_t a1)
{
  OUTLINED_FUNCTION_12_53(a1);
  OUTLINED_FUNCTION_39_34();
}

void svgetu(uint64_t a1)
{
  OUTLINED_FUNCTION_12_53(a1);
  OUTLINED_FUNCTION_39_34();
}

uint64_t svgets(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 200);
  v3 = 496;
  do
  {
    fread((void *)(v2 + v3), 1uLL, 1uLL, *(FILE **)(v2 + 480));
    v2 = *(_QWORD *)(a1 + 200);
  }
  while (*(unsigned __int8 *)(v2 + v3++));
  return v2 + 496;
}

void svputl()
{
  const void *v0;
  size_t v1;
  size_t v2;
  FILE *v3;

  v0 = (const void *)OUTLINED_FUNCTION_30_38();
  fwrite(v0, v1, v2, v3);
  OUTLINED_FUNCTION_27_39();
}

void svputi()
{
  const void *v0;
  size_t v1;
  size_t v2;
  FILE *v3;

  v0 = (const void *)OUTLINED_FUNCTION_29_38();
  fwrite(v0, v1, v2, v3);
  OUTLINED_FUNCTION_27_39();
}

void svputc(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_17_48(a1, a2);
  OUTLINED_FUNCTION_27_39();
}

void svputu(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_17_48(a1, a2);
  OUTLINED_FUNCTION_27_39();
}

size_t svputs(uint64_t a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s) + 1;
  return fwrite(__s, 1uLL, v4, *(FILE **)(*(_QWORD *)(a1 + 200) + 480));
}

uint64_t svputlptrs(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v2 = *(_QWORD *)(result + 192);
  v3 = *(_QWORD *)(v2 + 8112);
  if (v3)
  {
    v4 = *(_QWORD *)(v3 + 8);
    if (v4)
    {
      v5 = *(_QWORD *)(v2 + 8104);
      if (v5)
      {
        v7 = result;
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (v9 < *(__int16 *)(v5 + 58))
        {
          v11 = *(_QWORD *)(v5 + 16);
          if (*(__int16 *)(v11 + v8 + 16) == -6
            && (*(char *)(v11 + v8 + 18) & 0x80000000) == 0
            && **(_QWORD **)(*(_QWORD *)(v4 + 16) + 8 * v9) == a2)
          {
            if (!v10)
            {
              v12 = OUTLINED_FUNCTION_14_51();
              svputc(v12, v13);
              v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 192) + 8104) + 16);
            }
            result = OUTLINED_FUNCTION_22_45(result, *(char **)(v11 + v8));
            v5 = *(_QWORD *)(*(_QWORD *)(v7 + 192) + 8104);
            v10 = 1;
          }
          ++v9;
          v8 += 24;
        }
        if (v10)
          return svputs(v7, (char *)&unk_21F8A212A);
      }
    }
  }
  return result;
}

void vsv2delta(uint64_t a1, char *__filename)
{
  FILE *v3;
  uint64_t v4;
  unint64_t i;
  uint64_t v6;
  char **v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t k;
  uint64_t v13;
  char **v14;
  _BYTE *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t n;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int m;
  char v35[50];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(a1 + 200) + 488) = __filename;
  v3 = fopen(__filename, "wb");
  *(_QWORD *)(*(_QWORD *)(a1 + 200) + 480) = v3;
  if (v3)
  {
    OUTLINED_FUNCTION_22_45((uint64_t)v3, (char *)&unk_21F8A212A);
    OUTLINED_FUNCTION_44_28();
    svputi();
    OUTLINED_FUNCTION_44_28();
    OUTLINED_FUNCTION_13_51();
    for (i = 0; ; ++i)
    {
      v6 = *(unsigned __int8 *)(a1 + 288);
      if (i >= v6)
        break;
      v7 = &vstmtbl[12 * i];
      OUTLINED_FUNCTION_22_45(v4, *v7);
      v8 = (int *)(v7 + 8);
      OUTLINED_FUNCTION_13_51();
      OUTLINED_FUNCTION_23_43(v9, *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 9072) + i));
      v10 = 0;
      for (j = 0; j < *v8; ++j)
      {
        OUTLINED_FUNCTION_22_45(v4, *(char **)(*((_QWORD *)v8 - 7) + v10));
        OUTLINED_FUNCTION_13_51();
        OUTLINED_FUNCTION_13_51();
        OUTLINED_FUNCTION_13_51();
        v10 += 40;
      }
    }
    for (k = -2; k < v6; k = v13)
    {
      v13 = k + 1;
      if (k != -1)
      {
        svputc(a1, 125);
        OUTLINED_FUNCTION_14_51();
        svputi();
        if (k == -2)
          v14 = 0;
        else
          v14 = &vstmtbl[12 * k];
        v15 = **(_BYTE ***)(a1 + 200);
        if (k == -2)
          v16 = -99;
        else
          v16 = -2;
        for (m = v16; v15; v15 = (_BYTE *)(*v27 & 0xFFFFFFFFFFFFFFFCLL))
        {
          if ((*v15 & 2) != 0)
          {
            v22 = *(_QWORD **)(a1 + 200);
            if (v15 != (_BYTE *)*v22 && v15 != (_BYTE *)v22[1])
            {
              svputc(a1, 124);
              absoluteSyncNum(a1, (uint64_t)v15);
              OUTLINED_FUNCTION_13_51();
              v24 = *(_QWORD *)(a1 + 192);
              v25 = m;
              if (!*(_DWORD *)(v24 + 8868))
              {
                for (n = 0; ; ++n)
                {
                  if (*(unsigned __int8 *)(a1 + 288) + 2 == (_DWORD)n)
                  {
                    v25 = -99;
                    goto LABEL_39;
                  }
                  if ((_DWORD)n != 1 && k > n - 2 && (*(_QWORD *)&v15[8 * n - 16 + 8 * *(int *)(v24 + 9084)] & 1) != 0)
                    break;
                }
                v25 = n - 2;
              }
LABEL_39:
              OUTLINED_FUNCTION_23_43(v23, v25);
              if (v25 == -99)
              {
                v28 = NONSEQ((uint64_t)v15);
                OUTLINED_FUNCTION_23_43(v28, v28);
                v29 = ONESTM((uint64_t)v15);
                OUTLINED_FUNCTION_23_43(v29, v29);
                v30 = ALLNSQ((uint64_t)v15);
                OUTLINED_FUNCTION_23_43(v30, v30);
                svputlptrs(a1, (uint64_t)v15);
              }
            }
            OUTLINED_FUNCTION_60_23();
            v27 = &v15[8 * k + 8 * v31];
          }
          else
          {
            svputc(a1, 123);
            v17 = 0;
            v18 = 30;
            while (v17 < *((int *)v14 + 16))
            {
              v19 = v14[1];
              v20 = (char *)(*(uint64_t (**)(_BYTE *))&v14[2][8 * v17])(v15 + 16);
              switch(*(_WORD *)&v19[v18])
              {
                case 0xFFFB:
                  v21 = __sprintf_chk(v35, 0, 0x32uLL, "%g", *(double *)v20);
                  OUTLINED_FUNCTION_22_45(v21, v35);
                  break;
                case 0xFFFC:
                case 0xFFFE:
                  OUTLINED_FUNCTION_13_51();
                  break;
                case 0xFFFD:
                  svputl();
                  break;
                case 0xFFFF:
                  svputu(a1, *v20);
                  break;
                default:
                  break;
              }
              ++v17;
              v18 += 40;
            }
            v27 = v15 + 8;
          }
        }
        v6 = *(unsigned __int8 *)(a1 + 288);
        v13 = k + 1;
      }
    }
    OUTLINED_FUNCTION_52_25();
    svputlptrs(a1, v32);
    OUTLINED_FUNCTION_51_25();
    svputlptrs(a1, v33);
    svputc(a1, 121);
    OUTLINED_FUNCTION_53_25();
    vclrctxt(a1);
  }
}

_QWORD *findsync(uint64_t a1, int a2, char a3)
{
  uint64_t v4;
  _QWORD *v5;
  int i;

  v4 = (4 * a2);
  v5 = **(_QWORD ***)(a1 + 200);
  for (i = a3; v5; v5 = (_QWORD *)VRSYNC(a1, (uint64_t)v5, i))
  {
    if ((*v5 & 0xFFFFFFFFFFFFFFFCLL) == v4)
      break;
  }
  return v5;
}

void vrsdelta2(uint64_t a1, char *__filename)
{
  char v2;
  char *v3;
  FILE *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char **v20;
  char **v21;
  int *v22;
  int v23;
  int v24;
  char v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  char **v29;
  char **v30;
  uint64_t v31;
  char *v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  uint64_t j;
  uint64_t v42;
  int v43;
  char **v44;
  int *v45;
  unint64_t v46;
  char v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char **v55;
  unsigned __int8 *v56;
  const char *v57;
  __int16 v58;
  char v59;
  _QWORD *v60;
  char *v61;
  int v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t *v69;
  unint64_t v70;
  char **v71;
  int v72;
  int v73;
  int v74;
  uint64_t v75;
  _QWORD *v76;
  unint64_t v77;
  int v78;
  int v79;
  unint64_t *v80;
  uint64_t v81;
  int v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int v88;
  _QWORD *k;
  _QWORD *v90;
  uint64_t v91;
  int v92;
  unsigned __int8 v93;
  int *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  char **v99;
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  char v103;

  *(_QWORD *)(*(_QWORD *)(a1 + 200) + 488) = __filename;
  v5 = fopen(__filename, "rb");
  *(_QWORD *)(*(_QWORD *)(a1 + 200) + 480) = v5;
  if (!v5)
    goto LABEL_98;
  if (*(_BYTE *)OUTLINED_FUNCTION_45_28())
    goto LABEL_98;
  OUTLINED_FUNCTION_6_63();
  if (v6)
    goto LABEL_98;
  OUTLINED_FUNCTION_6_63();
  if (v7 != 1)
    goto LABEL_98;
  OUTLINED_FUNCTION_6_63();
  if (v8)
    goto LABEL_98;
  OUTLINED_FUNCTION_6_63();
  if (v9 != *(_DWORD *)(*(_QWORD *)(a1 + 192) + 8868))
    goto LABEL_98;
  vdltinit(a1, 0);
  *(_DWORD *)(*(_QWORD *)(a1 + 184) + 452) = 1;
  OUTLINED_FUNCTION_52_25();
  ***(_QWORD ***)(a1 + 200) = (4 * OUTLINED_FUNCTION_55_25(v10, v11)) | (unint64_t)(v2 & 3);
  OUTLINED_FUNCTION_51_25();
  **(_QWORD **)(*(_QWORD *)(a1 + 200) + 8) = (4 * OUTLINED_FUNCTION_55_25(v12, v13)) | (unint64_t)(v2 & 3);
  v14 = *(int *)(a1 + 16);
  v15 = 9184;
  for (i = 1162; ; ++i)
  {
    v17 = i - 1161;
    if (i - 1161 >= v14)
      break;
    v18 = *(_QWORD *)(a1 + 192);
    if (*(__int16 *)(v18 + v15) == -6 && v17 != *(__int16 *)(a1 + 290) && v17 != *(__int16 *)(a1 + 292))
      **(_QWORD **)(v18 + 8 * i) = 0;
    v15 += 24;
  }
  v19 = 0;
  v20 = vstmtbl;
  while (v19 < *(unsigned __int8 *)(a1 + 288))
  {
    svgets(a1);
    v21 = &v20[12 * v19];
    v23 = *((_DWORD *)v21 + 16);
    v22 = (int *)(v21 + 8);
    OUTLINED_FUNCTION_6_63();
    if (v23 != v24)
      goto LABEL_98;
    OUTLINED_FUNCTION_19_47();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 9072) + v19) = v25;
    v26 = OUTLINED_FUNCTION_14_51();
    setnonseqIndex(v26, v27);
    if (*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 9072) + v19) > 1u)
      goto LABEL_98;
    v28 = 0;
    v29 = v20;
    v30 = &v20[12 * v19 + 1];
    v31 = -1;
    while (++v31 < *v22)
    {
      v32 = *v30;
      OUTLINED_FUNCTION_45_28();
      v3 = &v32[v28];
      v33 = *(__int16 *)&v32[v28 + 30];
      OUTLINED_FUNCTION_6_63();
      if (v34 == v33)
      {
        v35 = *((__int16 *)v3 + 14);
        OUTLINED_FUNCTION_6_63();
        if (v36 == v35)
        {
          v37 = v32[v28 + 32];
          OUTLINED_FUNCTION_6_63();
          v28 += 40;
          if (v38 == v37)
            continue;
        }
      }
      goto LABEL_98;
    }
    ++v19;
    v20 = v29;
  }
  svgetc(a1);
  if (v39 != 125)
    goto LABEL_98;
  v40 = 0;
  for (j = -2; ; j = v42)
  {
    if (j >= *(unsigned __int8 *)(a1 + 288))
    {
      OUTLINED_FUNCTION_53_25();
      if (v40)
      {
        v88 = 0;
        do
        {
          if (v88 >= *(unsigned __int8 *)(a1 + 288))
            break;
          for (k = **(_QWORD ***)(a1 + 200); k; k = (_QWORD *)(*v90 & 0xFFFFFFFFFFFFFFFCLL))
          {
            if ((*k & 2) != 0)
            {
              *k &= 3uLL;
              v90 = &k[*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + v88];
            }
            else
            {
              v90 = k + 1;
            }
          }
          ++v88;
        }
        while (!OUTLINED_FUNCTION_43_30());
        *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9080) = 0;
      }
      goto LABEL_98;
    }
    v42 = j + 1;
    if (j != -1)
      break;
LABEL_87:
    ;
  }
  if (v40)
    goto LABEL_98;
  v91 = j + 1;
  OUTLINED_FUNCTION_6_63();
  v93 = v43;
  if (v43 != (_DWORD)j)
    goto LABEL_98;
  v40 = 0;
  v44 = &v20[12 * j];
  v96 = j + 3;
  v97 = j;
  v45 = (int *)(v44 + 8);
  v46 = **(_QWORD **)(a1 + 200);
  v98 = v44 + 3;
  v99 = v44 + 1;
  v94 = (int *)v44 + 17;
  v95 = (uint64_t)v44;
  v47 = 1;
  while (2)
  {
    if ((v47 & 1) == 0)
    {
      v42 = v91;
      goto LABEL_87;
    }
    OUTLINED_FUNCTION_19_47();
    v47 = 1;
    switch(v48)
    {
      case 't':
        OUTLINED_FUNCTION_51_25();
        goto LABEL_36;
      case 'u':
        OUTLINED_FUNCTION_52_25();
LABEL_36:
        v50 = a1;
        goto LABEL_38;
      case 'v':
        v50 = a1;
        v49 = v46;
LABEL_38:
        svgetptrs(v50, v49, 0);
        continue;
      case 'w':
        OUTLINED_FUNCTION_51_25();
        goto LABEL_41;
      case 'x':
        OUTLINED_FUNCTION_52_25();
LABEL_41:
        v52 = a1;
        goto LABEL_44;
      case 'y':
        v47 = 0;
        v40 = 1;
        continue;
      case 'z':
        v52 = a1;
        v51 = v46;
LABEL_44:
        svgetptrs(v52, v51, 1);
        continue;
      case '{':
        v92 = v40;
        v53 = 0;
        v54 = 30;
LABEL_46:
        if (v53 >= *v45)
        {
          v47 = 1;
          v40 = v92;
          continue;
        }
        v103 = 0;
        v102 = 0;
        v101 = 0;
        v100 = 0;
        v55 = v20;
        switch(*(_WORD *)&(*v99)[v54])
        {
          case 0xFFFB:
            v57 = (const char *)OUTLINED_FUNCTION_45_28();
            v56 = (unsigned __int8 *)&v100;
            sscanf(v57, "%lg", &v100);
            break;
          case 0xFFFC:
            OUTLINED_FUNCTION_6_63();
            v101 = v58;
            v56 = (unsigned __int8 *)&v101;
            break;
          case 0xFFFD:
          case 0xFFFE:
            v102 = svgetl();
            v56 = (unsigned __int8 *)&v102;
            break;
          case 0xFFFF:
            svgetu(a1);
            v103 = v59;
            v56 = (unsigned __int8 *)&v103;
            break;
          default:
            v56 = 0;
            break;
        }
        if (v53)
        {
          (*(void (**)(uint64_t, unsigned __int8 *))(*v98 + 8 * v53))(16, v56);
          v60 = (_QWORD *)v46;
LABEL_60:
          ++v53;
          v54 += 40;
          v46 = (unint64_t)v60;
          v20 = v55;
          goto LABEL_46;
        }
        v61 = v3;
        v62 = *((__int16 *)*v99 + 15);
        v63 = alloc_tok(a1, v95);
        if (v63)
        {
          v60 = v63;
          OUTLINED_FUNCTION_60_23();
          *(_QWORD *)(v46 + 8 * (v97 + v64)) = *(_QWORD *)(v46 + 8 * (v97 + v64)) & 3 | v65;
          OUTLINED_FUNCTION_49_25();
          *(_QWORD *)(v66 + 8 * v67) = *(_QWORD *)(v66 + 8 * v67) & 3 | v68;
          OUTLINED_FUNCTION_49_25();
          *v69 = v46;
          v69[1] = v70;
          if (v62 < 0)
            vinitflds(a1, v93, v69 + 2, v56);
          else
            memcpy(v69 + 2, v56, *v94);
          v3 = v61;
          goto LABEL_60;
        }
LABEL_98:
        OUTLINED_FUNCTION_18_47();
        return;
      case '|':
        v71 = v20;
        OUTLINED_FUNCTION_6_63();
        v73 = v72;
        OUTLINED_FUNCTION_19_47();
        v75 = (4 * v73);
        if (v74 == -99)
        {
          v76 = alloc_sync(a1);
          if (!v76)
            goto LABEL_98;
          v77 = (unint64_t)v76;
          *v76 = *v76 & 3 | v75;
          OUTLINED_FUNCTION_19_47();
          if (v78)
            SETNONSEQ(v77);
          else
            CLRNONSEQ(v77);
          v81 = v97;
          OUTLINED_FUNCTION_19_47();
          if (v82)
            SETONESTM(v77);
          else
            CLRONESTM(v77);
          OUTLINED_FUNCTION_19_47();
          if (v83)
            SETALLNSQ(v77);
          else
            CLRALLNSQ(v77);
        }
        else
        {
          v79 = v74;
          v80 = *(unint64_t **)(a1 + 200);
          v77 = *v80;
          while (1)
          {
            if (v77 == v80[1])
              goto LABEL_98;
            if ((*(_QWORD *)v77 & 0xFFFFFFFFFFFFFFFCLL) == v75)
              break;
            v77 = VRSYNC(a1, v77, v79);
            v80 = *(unint64_t **)(a1 + 200);
          }
          v81 = v97;
        }
        if (v81 != -2)
        {
          OUTLINED_FUNCTION_60_23();
          *(_QWORD *)(v77 + 8 * (v81 + v84)) |= 1uLL;
        }
        OUTLINED_FUNCTION_49_25();
        *(_QWORD *)(v85 + 8 * v96) = *(_QWORD *)(v85 + 8 * v96) & 3 | v77;
        v86 = v81 + *(int *)(*(_QWORD *)(a1 + 192) + 9084);
        *(_QWORD *)(v77 + 8 * v86) = *(_QWORD *)(v77 + 8 * v86) & 3 | *(_QWORD *)(*(_QWORD *)(a1 + 200) + 8);
        *(_QWORD *)(v77 + 8 * v96) = *(_QWORD *)(v77 + 8 * v96) & 3 | v46;
        if (v46 && (*(_BYTE *)v46 & 2) != 0)
        {
          OUTLINED_FUNCTION_60_23();
          *(_QWORD *)(v46 + 8 * (v97 + v87)) = *(_QWORD *)(v46 + 8 * (v97 + v87)) & 3 | v77;
        }
        else
        {
          *(_QWORD *)(v46 + 8) = v77;
        }
        v47 = 1;
        v46 = v77;
        v20 = v71;
        continue;
      case '}':
        v47 = 0;
        continue;
      default:
        continue;
    }
  }
}

_BYTE *svgetptrs(uint64_t a1, uint64_t a2, int a3)
{
  _BYTE *result;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;

  while (1)
  {
    result = (_BYTE *)svgets(a1);
    if (!*result)
      break;
    v6 = OUTLINED_FUNCTION_26_41();
    if (a3)
    {
      getgptr(v6, v7, v8);
      if (!v9)
      {
        v10 = OUTLINED_FUNCTION_26_41();
        getlptr(v10, v11, v12);
      }
    }
    else
    {
      getlptr(v6, v7, v8);
      if (!v13)
      {
        v14 = OUTLINED_FUNCTION_26_41();
        getgptr(v14, v15, v16);
      }
    }
  }
  return result;
}

void prstuff(uint64_t a1, int a2, _BYTE *a3, _BYTE *a4, uint64_t a5)
{
  _BYTE *v6;
  int v9;
  int v10;
  char **v11;
  _BYTE *v12;
  __int16 v13;
  uint64_t v14;
  int v15;
  const char *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  BOOL v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  char *v27;
  int v28;
  size_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;

  if (a3 != a4)
  {
    v6 = a3;
    v9 = 0;
    v10 = 0;
    v11 = &vstmtbl[12 * a2 + 1];
    v12 = a3;
    if (a3)
      goto LABEL_3;
LABEL_4:
    if (!v10)
      OUTLINED_FUNCTION_42_32();
    v13 = *((_WORD *)*v11 + 15);
    disptok(a1, (_DWORD)v12 + 16, a2, 0, (char *)(*(_QWORD *)(a1 + 200) + 408));
    v14 = *(_QWORD *)(a1 + 200);
    v15 = *(char *)(v14 + 478);
    if ((unsigned __int16)(v13 + 5) > 2u)
    {
      OUTLINED_FUNCTION_2_73(a1, v15, (uint64_t)"'");
      OUTLINED_FUNCTION_0_79();
      v15 = *(char *)(*(_QWORD *)(a1 + 200) + 478);
      v17 = a1;
      v16 = "'";
    }
    else
    {
      v16 = (const char *)(v14 + 408);
      v17 = a1;
    }
    OUTLINED_FUNCTION_2_73(v17, v15, (uint64_t)v16);
    v10 = 1;
    OUTLINED_FUNCTION_2_73(a1, *(char *)(*(_QWORD *)(a1 + 200) + 478), (uint64_t)" ");
    v9 = 0;
    v18 = v12 + 8;
    while (1)
    {
      v12 = (_BYTE *)(*v18 & 0xFFFFFFFFFFFFFFFCLL);
      if (!v12)
        goto LABEL_4;
LABEL_3:
      if ((*v12 & 2) == 0)
        goto LABEL_4;
      if (v9)
      {
        if (v10)
          OUTLINED_FUNCTION_41_33();
        OUTLINED_FUNCTION_42_32();
        v10 = 0;
      }
      v19 = a5;
      v21 = (int)a5 >= 0 && v12 == a4;
      v22 = v6;
      if (v12 != v6 && !v21)
      {
        v23 = 1162;
        v24 = 9184;
        while (v23 - 1161 < *(int *)(a1 + 16))
        {
          v25 = *(_QWORD *)(a1 + 192);
          if (*(__int16 *)(v25 + v24) == -6 && **(_BYTE ***)(v25 + 8 * v23) == v12)
          {
            v26 = *(_QWORD **)(a1 + 200);
            if (v12 != (_BYTE *)*v26 && v12 != (_BYTE *)v26[1])
            {
              OUTLINED_FUNCTION_10_59();
              __sprintf_chk(v27, v28, v29, "!%s ", v40);
              OUTLINED_FUNCTION_0_79();
            }
          }
          v24 += 24;
          ++v23;
        }
      }
      if (v9)
        OUTLINED_FUNCTION_41_33();
      if (v12 == a4)
        break;
      v18 = &v12[8 * *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + 8 * a2];
      v9 = 1;
      a5 = v19;
      v6 = v22;
    }
    if (v10)
      prrange(a1);
    if ((v19 & 0x80000000) == 0)
    {
      v30 = (char *)OUTLINED_FUNCTION_50_25();
      OUTLINED_FUNCTION_7_63(v30, v31, v32, "^_%s");
      OUTLINED_FUNCTION_0_79();
      if (!v10)
      {
        v33 = (char *)OUTLINED_FUNCTION_50_25();
        OUTLINED_FUNCTION_7_63(v33, v34, v35, "\nset ^_%s = ^_%s");
        v36 = OUTLINED_FUNCTION_9_60();
        vf_puts(v36, v37, v38, v39);
      }
    }
  }
}

void prrange(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (char *)OUTLINED_FUNCTION_31_38(a1);
  OUTLINED_FUNCTION_7_63(v1, v2, v3, "!^_%s ] ^_%s...");
  v4 = OUTLINED_FUNCTION_9_60();
  OUTLINED_FUNCTION_20_47(v4, v5, v6, v7);
}

void prinsert(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (char *)OUTLINED_FUNCTION_31_38(a1);
  OUTLINED_FUNCTION_7_63(v1, v2, v3, "\ndelta insert [%s%s ");
  v4 = OUTLINED_FUNCTION_9_60();
  OUTLINED_FUNCTION_20_47(v4, v5, v6, v7);
}

void getgptr(uint64_t a1, uint64_t a2, char *__s2)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = *(int *)(a1 + 16);
  v7 = 1162;
  v8 = 9184;
  while (v7 - 1161 < v6)
  {
    v9 = *(_QWORD *)(a1 + 192);
    if (*(__int16 *)(v9 + v8) == -6 && !strcmp(*(const char **)(v9 + v8 - 16), __s2))
    {
      **(_QWORD **)(v9 + 8 * v7) = a2;
      break;
    }
    ++v7;
    v8 += 24;
  }
  OUTLINED_FUNCTION_24_43();
}

void getlptr(uint64_t a1, uint64_t a2, char *__s2)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = 0;
  v6 = 0;
  v7 = *(_QWORD *)(a1 + 192);
  v8 = *(_QWORD *)(*(_QWORD *)(v7 + 8112) + 8);
  v9 = *(_QWORD *)(v7 + 8104);
  v10 = 8 * (*(__int16 *)(v9 + 58) & ~(*(__int16 *)(v9 + 58) >> 31));
  while (v10 != v6)
  {
    v11 = *(_QWORD *)(v9 + 16);
    if (*(__int16 *)(v11 + v5 + 16) == -6 && !strcmp(*(const char **)(v11 + v5), __s2))
    {
      **(_QWORD **)(*(_QWORD *)(v8 + 16) + v6) = a2;
      break;
    }
    v6 += 8;
    v5 += 24;
  }
  OUTLINED_FUNCTION_24_43();
}

void OUTLINED_FUNCTION_0_79()
{
  uint64_t v0;

  vf_puts(v0, *(char *)(*(_QWORD *)(v0 + 200) + 478), *(_QWORD *)(v0 + 200) + 408, 1);
}

void OUTLINED_FUNCTION_1_74(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;

  vf_puts(v3, a2, a3, 1);
}

void OUTLINED_FUNCTION_2_73(uint64_t a1, int a2, uint64_t a3)
{
  vf_puts(a1, a2, a3, 1);
}

uint64_t OUTLINED_FUNCTION_3_72()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 + 16) + 8 * v1))(v0);
}

uint64_t OUTLINED_FUNCTION_4_67@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(a1 + 8 * v2))(v1);
}

void OUTLINED_FUNCTION_5_64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  va_list va;

  va_start(va, a6);
  rdtokverr(v6, v7, v8, va);
}

void OUTLINED_FUNCTION_6_63()
{
  svgeti();
}

uint64_t OUTLINED_FUNCTION_7_63(char *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  return __sprintf_chk(a1, 0, 0x46uLL, a4);
}

uint64_t OUTLINED_FUNCTION_9_60()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_11_56()
{
  vf_getc();
}

size_t OUTLINED_FUNCTION_12_53(uint64_t a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 1) = 0;
  return fread((void *)(v1 - 1), 1uLL, 1uLL, *(FILE **)(*(_QWORD *)(a1 + 200) + 480));
}

void OUTLINED_FUNCTION_13_51()
{
  svputi();
}

uint64_t OUTLINED_FUNCTION_14_51()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_16_48(uint64_t a1, int a2, _BYTE *a3)
{
  logicalFileFindPhysical(a1, a2, a3, 1);
}

size_t OUTLINED_FUNCTION_17_48(uint64_t a1, char a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 - 1) = a2;
  return fwrite((const void *)(v2 - 1), 1uLL, 1uLL, *(FILE **)(*(_QWORD *)(a1 + 200) + 480));
}

void OUTLINED_FUNCTION_19_47()
{
  uint64_t v0;

  svgetc(v0);
}

void OUTLINED_FUNCTION_20_47(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  vf_puts(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_21_46()
{
  return vf_ungetc();
}

size_t OUTLINED_FUNCTION_22_45(uint64_t a1, char *a2)
{
  uint64_t v2;

  return svputs(v2, a2);
}

void OUTLINED_FUNCTION_23_43(uint64_t a1, char a2)
{
  uint64_t v2;

  svputc(v2, a2);
}

uint64_t OUTLINED_FUNCTION_25_43()
{
  int v0;

  return STMTYP(v0);
}

uint64_t OUTLINED_FUNCTION_26_41()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_28_39(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;

  vf_puts(v3, v4, a3, 0);
}

uint64_t OUTLINED_FUNCTION_29_38()
{
  uint64_t v0;

  return v0 - 2;
}

uint64_t OUTLINED_FUNCTION_30_38()
{
  uint64_t v0;

  return v0 - 4;
}

uint64_t OUTLINED_FUNCTION_31_38(uint64_t a1)
{
  return *(_QWORD *)(a1 + 200) + 408;
}

void OUTLINED_FUNCTION_32_38()
{
  var_rderr();
}

void OUTLINED_FUNCTION_33_38(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v9;
  uint64_t v10;

  vf_printf(v10, v9, 1, a4, a5, a6, a7, a8, a9);
}

size_t OUTLINED_FUNCTION_35_37()
{
  const char *v0;

  return strlen(v0);
}

uint64_t OUTLINED_FUNCTION_36_37(int a1)
{
  uint64_t v1;

  return dynaBufMoveAbs(v1, a1 - 1);
}

uint64_t OUTLINED_FUNCTION_37_36()
{
  uint64_t v0;
  unsigned int v1;

  return dynaBufMoveAbs(v0, v1);
}

uint64_t *OUTLINED_FUNCTION_38_35()
{
  uint64_t *v0;

  return dynaBufDeleteChars(v0, 1uLL);
}

uint64_t OUTLINED_FUNCTION_40_34()
{
  uint64_t v0;

  return dynaBufLength(v0);
}

void OUTLINED_FUNCTION_41_33()
{
  uint64_t v0;

  prrange(v0);
}

void OUTLINED_FUNCTION_42_32()
{
  uint64_t v0;

  prinsert(v0);
}

uint64_t OUTLINED_FUNCTION_43_30()
{
  uint64_t v0;

  return checkInterrupt(v0);
}

void OUTLINED_FUNCTION_44_28()
{
  svputi();
}

uint64_t OUTLINED_FUNCTION_45_28()
{
  uint64_t v0;

  return svgets(v0);
}

uint64_t OUTLINED_FUNCTION_46_27(uint64_t a1)
{
  return dynaBufMoveRel(a1, 0);
}

uint64_t OUTLINED_FUNCTION_47_27(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  return chk_itok((unsigned __int8 *)va);
}

uint64_t OUTLINED_FUNCTION_50_25()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 200) + 408;
}

uint64_t OUTLINED_FUNCTION_53_25()
{
  uint64_t v0;

  return fclose(*(FILE **)(*(_QWORD *)(v0 + 200) + 480));
}

uint64_t OUTLINED_FUNCTION_54_25()
{
  return __memset_chk();
}

uint64_t OUTLINED_FUNCTION_55_25(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return absoluteSyncNum(v2, a2);
}

void OUTLINED_FUNCTION_56_24()
{
  vf_getc();
}

uint64_t OUTLINED_FUNCTION_57_24()
{
  int v0;
  uint64_t v1;

  return logicalFileInputBuffer(v1, v0);
}

uint64_t OUTLINED_FUNCTION_58_24()
{
  int v0;
  uint64_t v1;

  return vf_clrbuf(v1, v0);
}

void OUTLINED_FUNCTION_59_23()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 184) + 32) = 0;
  *(_DWORD *)(*(_QWORD *)(v0 + 184) + 436) = 0;
}

uint64_t OUTLINED_FUNCTION_61_23()
{
  uint64_t v0;

  return v0;
}

uint64_t vdur_ass(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t a5)
{
  int v6;
  uint64_t v11;
  __n128 v12;
  double v13;
  char **v14;
  uint64_t (***v15)(_QWORD, __n128);
  char *v16;
  int v17;
  double v18;
  double v19;
  _BYTE *i;
  int v21;
  uint64_t *v22;
  unsigned __int8 *v23;
  _QWORD *v24;
  __int16 v25;
  uint64_t v26;

  v6 = a4;
  v26 = a5;
  v25 = 0;
  if (vrange_2pt(a1, a2, (uint64_t)a3, a4, 0))
    return 1;
  vdur(a1, (uint64_t *)a2, a3, v6);
  v12.n128_u64[0] = 0;
  v13 = 0.0;
  if (v11)
    v13 = (double)a5 / (double)v11;
  v14 = &vstmtbl[12 * v6];
  v16 = v14[1];
  v15 = (uint64_t (***)(_QWORD, __n128))(v14 + 1);
  v17 = *((_WORD *)v16 + 15) & 0xFFFE;
  v18 = -0.5;
  if (v13 >= 0.0)
    v18 = 0.5;
  if (v17 == 65532)
    v19 = v18;
  else
    v19 = 0.0;
  for (i = (_BYTE *)*a2; i != (_BYTE *)*a3; i = (_BYTE *)(*v24 & 0xFFFFFFFFFFFFFFFCLL))
  {
    if (i && (*i & 2) != 0)
    {
      v24 = &i[8 * *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + 8 * v6];
    }
    else
    {
      v21 = *((__int16 *)*v15 + 15);
      v22 = (uint64_t *)(*v15[1])(i + 16, v12);
      if (v21 == -3)
      {
        v26 = (uint64_t)(v19 + (double)*v22 * v13);
        v23 = (unsigned __int8 *)&v26;
      }
      else
      {
        v26 = (uint64_t)(v19 + (double)*(__int16 *)v22 * v13);
        v25 = v26;
        v23 = (unsigned __int8 *)&v25;
      }
      vinitflds(a1, v6, i + 16, v23);
      v24 = i + 8;
    }
  }
  return 0;
}

uint64_t vrange_2pt(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t *v7;
  _BYTE *v9;
  unint64_t v10;
  _QWORD *v11;
  __int128 v12;
  __int128 v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  int v22;
  uint64_t v23;
  int v24;
  _OWORD v26[2];
  _OWORD v27[2];

  v7 = (uint64_t *)a1;
  if (a5)
  {
    v9 = (_BYTE *)*a2;
    if ((*(_QWORD *)(*a2 + 8 * (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + *((unsigned __int8 *)a2 + 8))) & 1) == 0
      || a2[2])
    {
      a1 = vnormalize(a1, (uint64_t)a2);
      if ((_DWORD)a1 == 2)
      {
        *a2 = vsplit_time(v7, *((unsigned __int8 *)a2 + 8), *a2, a2[2]);
        OUTLINED_FUNCTION_38_36();
        v20 = *(_QWORD *)(v16 + 8 * v19);
        goto LABEL_27;
      }
      if ((_DWORD)a1 == 4)
      {
LABEL_13:
        if (a5 == 205)
        {
          v10 = *a2;
          v11 = (_QWORD *)v7[25];
          v21 = (_QWORD *)v11[1];
          if ((_QWORD *)*a2 == v21)
            goto LABEL_21;
        }
        else
        {
          if (a5 == 206)
          {
            v10 = *a2;
            v11 = (_QWORD *)v7[25];
LABEL_21:
            if (v10 == *v11)
              return 1;
            *(_QWORD *)a3 = v10;
            a1 = OUTLINED_FUNCTION_33_39(a1, *((unsigned __int8 *)a2 + 8), *(_QWORD *)(*a2 + 8 * *((unsigned __int8 *)a2 + 8) + 24) & 0xFFFFFFFFFFFFFFFCLL, *a2);
            *a2 = a1;
            if (!a1)
              return 1;
            goto LABEL_28;
          }
          v10 = *a2;
          v21 = *(_QWORD **)(v7[25] + 8);
        }
        if ((_QWORD *)v10 == v21)
          return 1;
        OUTLINED_FUNCTION_38_36();
        v20 = *(_QWORD *)(v18 + 8 * v22);
LABEL_27:
        a1 = OUTLINED_FUNCTION_33_39(v16, v17, v18, v20 & 0xFFFFFFFFFFFFFFFCLL);
        *(_QWORD *)a3 = a1;
        if (a1)
        {
LABEL_28:
          v15 = 1;
          *((_BYTE *)a2 + 24) = 1;
          *(_BYTE *)(a3 + 24) = 1;
          goto LABEL_29;
        }
        return 1;
      }
      if ((_DWORD)a1 != 3)
        return 1;
      v9 = (_BYTE *)*a2;
    }
    *(_QWORD *)a3 = v9;
    if ((a5 + 51) <= 1u)
    {
      a1 = (uint64_t)lmost(*((char *)a2 + 8), (_QWORD *)*a2);
      *a2 = a1;
      v9 = *(_BYTE **)a3;
    }
    if ((a5 & 0xFFFFFFFD) == 0xCD)
    {
      a1 = (uint64_t)rmost((uint64_t)v7, *((char *)a2 + 8), v9);
      v9 = (_BYTE *)a1;
      *(_QWORD *)a3 = a1;
    }
    if ((_BYTE *)*a2 != v9)
      goto LABEL_28;
    goto LABEL_13;
  }
  v12 = *((_OWORD *)a2 + 1);
  v27[0] = *(_OWORD *)a2;
  v27[1] = v12;
  v13 = *(_OWORD *)(a3 + 16);
  v26[0] = *(_OWORD *)a3;
  v26[1] = v13;
  vcomp_pta(a1, (uint64_t)v27, (uint64_t)v26);
  if (v14 || !*(_BYTE *)(v7[24] + 8120))
    return 1;
  vtmark_tv((uint64_t)v7, (uint64_t)a2);
  v15 = 1;
  vtmark_tv((uint64_t)v7, a3);
LABEL_29:
  OUTLINED_FUNCTION_31_39(a1, *a2);
  if ((_DWORD)v23)
  {
    OUTLINED_FUNCTION_31_39(v23, *(_QWORD *)a3);
    if (v24)
      return 0;
  }
  return v15;
}

void vdur(uint64_t a1, uint64_t *a2, unint64_t *a3, int a4)
{
  dur2(a1, a2, a3, a4, 0);
}

void gcql(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5;
  char v6;

  while (1)
  {
    OUTLINED_FUNCTION_42_33();
    if ((v6 & 1) != 0)
      break;
    VLSYNC(v5, a4);
  }
  OUTLINED_FUNCTION_43_31();
}

void gcqr(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v6;
  char v7;

  while (1)
  {
    OUTLINED_FUNCTION_42_33();
    if ((v7 & 1) != 0)
      break;
    VRSYNC(a1, v6, a4);
  }
  OUTLINED_FUNCTION_43_31();
}

void dur2(uint64_t a1, uint64_t *a2, unint64_t *a3, int a4, int a5)
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;
  _BYTE *v11;
  _BYTE **v12;
  unint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _QWORD *v17;

  v7 = *a2;
  v8 = *a3;
  if (v7 != *a3)
  {
    v10 = a1;
    if (a5)
    {
      v11 = (_BYTE *)v7;
    }
    else
    {
      visleft(a1, v7, *a3);
      if ((_DWORD)a1)
        v12 = (_BYTE **)a2;
      else
        v12 = (_BYTE **)a3;
      if ((_DWORD)a1)
        v13 = a3;
      else
        v13 = (unint64_t *)a2;
      v8 = *v13;
      v11 = *v12;
      v7 = *a2;
    }
    v14 = *(int *)(*(_QWORD *)(v10 + 192) + 9084) + (uint64_t)a4;
    if ((*(_QWORD *)(v7 + 8 * v14) & 1) == 0)
    {
      a1 = OUTLINED_FUNCTION_44_29(a1, v7);
      if (!(_DWORD)a1)
        goto LABEL_28;
      v14 = *(int *)(*(_QWORD *)(v10 + 192) + 9084) + (uint64_t)a4;
    }
    if ((*(_QWORD *)(*a3 + 8 * v14) & 1) != 0 || OUTLINED_FUNCTION_44_29(a1, *a3))
    {
      v15 = 0;
      while (v11 != (_BYTE *)v8 && v11)
      {
        if ((*v11 & 2) != 0)
        {
          v17 = &v11[8 * *(_DWORD *)(*(_QWORD *)(v10 + 192) + 9084) + 8 * a4];
        }
        else
        {
          v16 = *((__int16 *)vstmtbl[12 * a4 + 1] + 15);
          if (v16 == -4)
          {
            v15 += *(__int16 *)OUTLINED_FUNCTION_16_49();
          }
          else if (v16 == -3)
          {
            v15 += *(_QWORD *)OUTLINED_FUNCTION_16_49();
          }
          v17 = v11 + 8;
        }
        v11 = (_BYTE *)(*v17 & 0xFFFFFFFFFFFFFFFCLL);
      }
    }
  }
LABEL_28:
  OUTLINED_FUNCTION_9_61();
}

uint64_t val_expr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v9;

  return val_expr2(a1, a2, a3, a4, a5, 9, &v9, a8);
}

uint64_t val_expr2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7, uint64_t a8)
{
  unsigned int v8;
  int v9;
  uint64_t *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  _QWORD *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  _BYTE *v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  char **v30;
  _QWORD *v31;
  _BYTE *v32;
  uint64_t *v33;
  unint64_t v34;
  int v35;
  uint64_t *v36;
  __int16 *v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  unint64_t *v52;
  int v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  unint64_t *v80;
  int v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  _BYTE *v86;
  uint64_t v87;
  _QWORD *v88;
  int v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;

  v8 = a4;
  v9 = a3;
  v10 = (uint64_t *)a2;
  v11 = a1;
  *a7 = 0;
  v12 = (_QWORD *)*(char *)(a2 + 8);
  if (!(_DWORD)a5)
  {
    if (BYTE4(vstmtbl[12 * (int)a3 + 11]))
      a5 = LODWORD(vstmtbl[12 * *(char *)(a2 + 8) + 11]);
    else
      a5 = 0;
  }
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v86 = a7;
  LODWORD(v87) = a5;
  if ((_DWORD)a6 == 9)
  {
    a1 = vnormalize(a1, a2);
    v13 = -2147483647;
    switch((int)a1)
    {
      case 1:
        return v13;
      case 2:
        v14 = *v10;
        if (v10[2] < 0)
        {
          v15 = *(_QWORD *)(*(_QWORD *)(v14 + 8 * (_QWORD)v12 + 24) & 0xFFFFFFFFFFFFFFFCLL) & 0xFFFFFFFFFFFFFFFCLL;
        }
        else
        {
          v15 = *v10;
          v14 = *(_QWORD *)((*(_QWORD *)(v14 + 8 * (*(_DWORD *)(*(_QWORD *)(v11 + 192) + 9084) + (int)v12)) & 0xFFFFFFFFFFFFFFFCLL)
                          + 8) & 0xFFFFFFFFFFFFFFFCLL;
        }
        *(_QWORD *)&v92 = v15;
        *(_QWORD *)&v90 = v14;
        OUTLINED_FUNCTION_5_65(a1, v15);
        v17 = v28;
        v27 = v11;
        v26 = v14;
        goto LABEL_15;
      case 3:
        v19 = rmost(v11, (int)v12, (_BYTE *)*v10);
        firstdefd(v11, (int)v12, v19, v9, 0);
        v21 = v20;
        v22 = lmost((int)v12, (_QWORD *)*v10);
        HIDWORD(v87) = 1;
        firstdefd(v11, (int)v12, v22, v9, 1);
        OUTLINED_FUNCTION_5_65(v23, v23);
        v17 = v24;
        OUTLINED_FUNCTION_22_46(v11, v21);
        v18 = (_QWORD *)a1;
        goto LABEL_17;
      case 4:
        OUTLINED_FUNCTION_5_65(a1, *v10);
        v17 = v25;
        v26 = *v10;
        v27 = v11;
LABEL_15:
        OUTLINED_FUNCTION_22_46(v27, v26);
        v18 = (_QWORD *)a1;
        break;
      default:
        v89 = (int)v12;
        v17 = 0;
        v18 = 0;
        break;
    }
    HIDWORD(v87) = 1;
  }
  else
  {
    v89 = (int)v12;
    HIDWORD(v87) = 0;
    v16 = *(_QWORD *)(a1 + 200);
    v17 = *(_BYTE **)(*(_QWORD *)(v16 + 616) + 8 * (int)a3);
    v18 = *(_QWORD **)(*(_QWORD *)(v16 + 624) + 8 * (int)a3);
  }
LABEL_17:
  v29 = 0;
  v30 = &vstmtbl[12 * v9];
  v31 = v30 + 1;
  v88 = v30 + 2;
  v32 = v17;
  v13 = -2147483647;
  while (v32 != (_BYTE *)v18)
  {
    if (v32 && (*v32 & 2) != 0)
    {
      v33 = v10;
      v34 = *(_QWORD *)&v32[8 * *(_DWORD *)(*(_QWORD *)(v11 + 192) + 9084) + 8 * v9] & 0xFFFFFFFFFFFFFFFCLL;
      v35 = *(__int16 *)(*v31 + 40 * v8 + 30);
      if (v35 == -4)
      {
        v37 = (__int16 *)OUTLINED_FUNCTION_8_62(a1, a2, a3, a4, a5, a6, (uint64_t)a7, a8, (uint64_t)v86, v87, v88);
        v31 = v12;
        if (*v37 == -32767)
          v29 = -2147483647;
        else
          v29 = *v37;
      }
      else if (v35 == -3)
      {
        v36 = (uint64_t *)OUTLINED_FUNCTION_8_62(a1, a2, a3, a4, a5, a6, (uint64_t)a7, a8, (uint64_t)v86, v87, v88);
        v31 = v12;
        v29 = *v36;
      }
      a1 = v29;
      if (v13 != -2147483647)
      {
        a1 = v13;
        if (v13 != v29)
          return -2147483647;
      }
      v32 = (_BYTE *)(*(_QWORD *)(v34 + 8) & 0xFFFFFFFFFFFFFFFCLL);
      v13 = a1;
      v10 = v33;
    }
  }
  if (v13 != -2147483647)
    return v13;
  *(_QWORD *)&v93 = 0;
  BYTE8(v93) = 1;
  *(_QWORD *)&v91 = 0;
  BYTE8(v91) = 1;
  if (!v17)
  {
LABEL_34:
    v13 = -2147483647;
    if (v18)
      goto LABEL_45;
    goto LABEL_47;
  }
  while ((*v17 & 2) != 0)
  {
    v17 = (_BYTE *)(*(_QWORD *)&v17[8 * v9 + 24] & 0xFFFFFFFFFFFFFFFCLL);
    if (!v17)
      goto LABEL_34;
  }
  OUTLINED_FUNCTION_19_48();
  if ((v39 & 1) == 0)
    v38 = vgetsc(v11, 0, 1, v38, v89);
  *(_QWORD *)&v92 = v38;
  OUTLINED_FUNCTION_28_40();
  v13 = -2147483647;
  if (v48 == -4)
  {
    OUTLINED_FUNCTION_4_68(v40, v41, v42, v43, v44, v45, v46, v47, (uint64_t)v86, v87, v88);
    v13 = -2147483647;
    OUTLINED_FUNCTION_24_44();
    if (!v73)
      v13 = v49;
  }
  else if (v48 == -3)
  {
    v13 = *(_QWORD *)OUTLINED_FUNCTION_4_68(v40, v41, v42, v43, v44, v45, v46, v47, (uint64_t)v86, v87, v88);
    if (v18)
      goto LABEL_45;
    goto LABEL_47;
  }
  if (!v18)
  {
LABEL_47:
    if (!v17)
      return -32767;
    v50 = OUTLINED_FUNCTION_35_38();
    durcalc(v50, v51, v52, v53, v54, SHIDWORD(v87));
    if (v55)
    {
      v56 = v13;
      v13 = -2147483647;
      if (v55 == -2147483647)
        return v56;
    }
    return v13;
  }
LABEL_45:
  while ((*v18 & 2) != 0)
  {
    v18 = (_QWORD *)(v18[*(_DWORD *)(*(_QWORD *)(v11 + 192) + 9084) + v9] & 0xFFFFFFFFFFFFFFFCLL);
    if (!v18)
      goto LABEL_47;
  }
  OUTLINED_FUNCTION_19_48();
  if ((v58 & 1) == 0)
    v57 = vgetsc(v11, 1, 1, v57, v89);
  *(_QWORD *)&v90 = v57;
  OUTLINED_FUNCTION_28_40();
  if (v67 == -4)
  {
    OUTLINED_FUNCTION_11_57(v59, v60, v61, v62, v63, v64, v65, v66, (uint64_t)v86, v87, v88);
    OUTLINED_FUNCTION_24_44();
    if (v73)
      v68 = -2147483647;
    else
      v68 = v69;
  }
  else if (v67 == -3)
  {
    v68 = *(_QWORD *)OUTLINED_FUNCTION_11_57(v59, v60, v61, v62, v63, v64, v65, v66, (uint64_t)v86, v87, v88);
  }
  v70 = *(_QWORD *)(v11 + 200);
  if (v17)
  {
    v71 = v13;
    v13 = v68;
    durcalc(v11, (uint64_t *)&v92, (unint64_t *)&v90, v89, (uint64_t *)(*(_QWORD *)(v70 + 632) + 24 * v9), SHIDWORD(v87));
    v73 = v72 == -2147483647 || v72 == 0;
    if (v73)
    {
      if ((_DWORD)v87 == -1)
        return v71;
      if ((_DWORD)v87 == 1)
        return v13;
      if ((_DWORD)v87)
        return -2147483647;
      return (uint64_t)((double)(v13 + v71) * 0.5);
    }
    else
    {
      v77 = v72;
      *v86 = 1;
      v78 = OUTLINED_FUNCTION_35_38();
      durcalc(v78, v79, v80, v81, v82, SHIDWORD(v87));
      if (v83 == -2147483647)
        v84 = 0;
      else
        v84 = v83;
      return (uint64_t)((double)v71 + (double)(v13 - v71) * ((double)v84 / (double)v77));
    }
  }
  v75 = v68;
  durcalc(v11, v10, (unint64_t *)&v90, v89, (uint64_t *)(*(_QWORD *)(v70 + 648) + 24 * v9), SHIDWORD(v87));
  if (!v76)
    return v75;
  v13 = -2147483647;
  if (v76 == -2147483647)
    return v75;
  return v13;
}

uint64_t vnormalize(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v6)(_BYTE *);
  uint64_t v7;
  int v8;
  _QWORD *v9;
  _QWORD *v10;
  _BYTE *v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  _BYTE *v16;
  _QWORD *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  char v23;
  int v24;
  unint64_t v25;
  uint64_t v26;
  char v27;
  _QWORD *v28;
  _BYTE *v31;
  int v32;
  BOOL v33;

  v4 = *(_QWORD **)a2;
  v5 = *(char *)(a2 + 8);
  v6 = *(uint64_t (**)(_BYTE *))vstmtbl[12 * v5 + 2];
  v7 = *(_QWORD *)(a2 + 16);
  if (v7 < 0)
  {
    v16 = &v4[v5 + 3];
LABEL_18:
    v15 = v7;
    v17 = v16;
    while (v4 != **(_QWORD ***)(a1 + 200))
    {
      v16 = (_BYTE *)(*v17 & 0xFFFFFFFFFFFFFFFCLL);
      if (!v16 || (*v16 & 2) == 0)
      {
        OUTLINED_FUNCTION_15_50();
        if (v33)
        {
          OUTLINED_FUNCTION_25_44();
          OUTLINED_FUNCTION_24_44();
          if (v33)
            v18 = v20;
        }
        else if (v19 == -3)
        {
          v21 = (uint64_t *)OUTLINED_FUNCTION_25_44();
          v20 = -2147483647;
          v18 = *v21;
        }
        v7 += v18;
        if (v18 != v20 && v7 < 1)
          goto LABEL_18;
        break;
      }
      v17 = &v16[8 * v5 + 24];
      v4 = v16;
    }
  }
  else
  {
    OUTLINED_FUNCTION_18_48();
    v9 = &v4[v8];
LABEL_3:
    v10 = *(_QWORD **)(*(_QWORD *)(a1 + 200) + 8);
    while (v4 != v10)
    {
      v11 = (_BYTE *)(*v9 & 0xFFFFFFFFFFFFFFFCLL);
      if (!v11 || (*v11 & 2) == 0)
      {
        OUTLINED_FUNCTION_15_50();
        if (v33)
        {
          v13 = *(__int16 *)OUTLINED_FUNCTION_25_44();
          if (v13 == -32767)
            break;
        }
        else
        {
          if (v14 == -3)
            v13 = *(_QWORD *)OUTLINED_FUNCTION_25_44();
          if (v13 == -2147483647)
            break;
        }
        if (v7 - v13 < 0)
          break;
        v9 = v11 + 8;
        v7 -= v13;
        goto LABEL_3;
      }
      OUTLINED_FUNCTION_18_48();
      v9 = &v11[8 * v12];
      v4 = v11;
    }
    v15 = v7;
  }
  v23 = *(_BYTE *)(a2 + 24);
  if ((v23 & 4) != 0)
  {
    if ((v15 & 0x8000000000000000) == 0)
    {
      if (!v15)
      {
        v4 = lmost(v5, v4);
        v23 = *(_BYTE *)(a2 + 24);
      }
      goto LABEL_50;
    }
    if ((v4[v5 + 3] & 0xFFFFFFFFFFFFFFFCLL) != 0)
    {
      v26 = *(_QWORD *)(v4[v5 + 3] & 0xFFFFFFFFFFFFFFFCLL);
      if ((v26 & 2) != 0)
        goto LABEL_50;
    }
    else
    {
      v26 = MEMORY[0];
    }
    v4 = (_QWORD *)(v26 & 0xFFFFFFFFFFFFFFFCLL);
LABEL_50:
    v27 = v23 ^ 4;
    goto LABEL_51;
  }
  if ((*(_BYTE *)(a2 + 24) & 8) == 0)
  {
    v24 = 1;
    goto LABEL_52;
  }
  if (v15 < 1)
  {
    if ((v15 & 0x8000000000000000) == 0)
    {
      v4 = rmost(a1, v5, v4);
      v23 = *(_BYTE *)(a2 + 24);
    }
  }
  else
  {
    v25 = v4[*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + (int)v5] & 0xFFFFFFFFFFFFFFFCLL;
    if (!v25 || (*(_BYTE *)v25 & 2) == 0)
      v4 = (_QWORD *)(*(_QWORD *)(v25 + 8) & 0xFFFFFFFFFFFFFFFCLL);
  }
  v27 = v23 ^ 8;
LABEL_51:
  v15 = 0;
  v24 = 0;
  *(_BYTE *)(a2 + 24) = v27;
LABEL_52:
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 16) = v15;
  v28 = *(_QWORD **)(a1 + 200);
  if (v4 == (_QWORD *)*v28 && v15 < 0)
    return 1;
  if (v4 == (_QWORD *)v28[1] && v15 > 0)
    return 1;
  if (v15)
    return 2;
  if (!v24)
    return 4;
  OUTLINED_FUNCTION_15_50();
  if (!v33)
  {
    v33 = v32 != -3 || v31 == 0;
    if (!v33 && ((*v31 & 2) != 0 || !*(_QWORD *)v6(v31 + 16)))
      return 3;
    return 4;
  }
  if (!v31 || (*v31 & 2) == 0 && *(_WORD *)v6(v31 + 16))
    return 4;
  return 3;
}

void firstdefd(uint64_t a1, int a2, _BYTE *a3, int a4, int a5)
{
  char **v9;
  uint64_t (*v10)(_BYTE *);
  int v11;
  uint64_t v12;
  _BYTE *v13;
  char v14;
  int v15;
  BOOL v16;
  int v17;
  uint64_t v18;
  _QWORD *v19;

  v9 = &vstmtbl[12 * a2];
  v10 = *(uint64_t (**)(_BYTE *))v9[2];
  v11 = *((unsigned __int8 *)v9 + 86);
  v12 = a2 + 3;
  v13 = a3;
  if (a3)
    goto LABEL_2;
  while (1)
  {
LABEL_3:
    OUTLINED_FUNCTION_15_50();
    if (v16)
    {
      v14 = 0;
      if (v13 && v11)
      {
        v16 = *(unsigned __int16 *)v10(v13 + 16) == 0;
LABEL_15:
        v14 = v16;
      }
    }
    else if (v15 == -3)
    {
      v14 = 0;
      if (v13)
      {
        if (v11)
        {
          v16 = *(_QWORD *)v10(v13 + 16) == 0;
          goto LABEL_15;
        }
      }
    }
    if (!v14)
      break;
    if (a5)
      v19 = v13 + 8;
    else
      v19 = v13;
    while (1)
    {
      v13 = (_BYTE *)(*v19 & 0xFFFFFFFFFFFFFFFCLL);
      if (!v13)
        break;
LABEL_2:
      if ((*v13 & 2) == 0)
        goto LABEL_3;
      v17 = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084);
      if ((*(_QWORD *)&v13[8 * v17 + 8 * a4] & 1) != 0)
        goto LABEL_24;
      v18 = v17 + a2;
      if (!a5)
        v18 = v12;
      v19 = &v13[8 * v18];
    }
  }
LABEL_24:
  OUTLINED_FUNCTION_9_61();
}

_BYTE *rmost(uint64_t a1, int a2, _BYTE *a3)
{
  _BYTE *v3;
  char **v4;
  uint64_t (*v5)(_BYTE *);
  int v6;
  _QWORD *i;
  _BYTE *v8;
  char v9;
  int v10;
  BOOL v11;
  int v12;

  v3 = a3;
  v4 = &vstmtbl[12 * a2];
  v5 = *(uint64_t (**)(_BYTE *))v4[2];
  v6 = *((unsigned __int8 *)v4 + 86);
  for (i = &a3[8 * *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + 8 * a2]; ; i = v8 + 8)
  {
    while (1)
    {
      v8 = (_BYTE *)(*i & 0xFFFFFFFFFFFFFFFCLL);
      if (!v8 || (*v8 & 2) == 0)
        break;
      OUTLINED_FUNCTION_18_48();
      i = &v8[8 * v12];
      v3 = v8;
    }
    OUTLINED_FUNCTION_15_50();
    if (v11)
    {
      v9 = 0;
      if (v8 && v6)
      {
        v11 = *(unsigned __int16 *)v5(v8 + 16) == 0;
LABEL_12:
        v9 = v11;
      }
    }
    else if (v10 == -3)
    {
      v9 = 0;
      if (v8)
      {
        if (v6)
        {
          v11 = *(_QWORD *)v5(v8 + 16) == 0;
          goto LABEL_12;
        }
      }
    }
    if (!v9)
      break;
  }
  return v3;
}

_QWORD *lmost(int a1, _QWORD *a2)
{
  char **v3;
  uint64_t (*v4)(_QWORD *);
  int v5;
  uint64_t v6;
  _QWORD *v7;
  char v8;
  int v9;
  BOOL v10;

  v3 = &vstmtbl[12 * a1];
  v4 = *(uint64_t (**)(_QWORD *))v3[2];
  v5 = *((unsigned __int8 *)v3 + 86);
  v6 = a1 + 3;
LABEL_2:
  v7 = &a2[v6];
  do
  {
    v7 = (_QWORD *)(*v7 & 0xFFFFFFFFFFFFFFFCLL);
    if (v7 && (*(_BYTE *)v7 & 2) != 0)
    {
      a2 = v7;
      goto LABEL_2;
    }
    OUTLINED_FUNCTION_15_50();
    if (v10)
    {
      v8 = 0;
      if (v7 && v5)
      {
        v10 = *(unsigned __int16 *)v4(v7 + 2) == 0;
LABEL_13:
        v8 = v10;
      }
    }
    else if (v9 == -3)
    {
      v8 = 0;
      if (v7)
      {
        if (v5)
        {
          v10 = *(_QWORD *)v4(v7 + 2) == 0;
          goto LABEL_13;
        }
      }
    }
  }
  while (v8);
  return a2;
}

void durcalc(uint64_t a1, uint64_t *a2, unint64_t *a3, int a4, uint64_t *a5, int a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15[4];
  uint64_t v16[4];

  if (a6)
  {
    dur2(a1, a2, a3, a4, 0);
  }
  else
  {
    v16[2] = 0;
    v15[2] = 0;
    v15[3] = 1;
    v16[3] = 1;
    v10 = a5[1];
    v16[0] = *a5;
    v16[1] = 0;
    v15[0] = v10;
    v15[1] = 0;
    v11 = a5[2];
    OUTLINED_FUNCTION_40_35(a1, v15, a3);
    v13 = v12 + v11;
    OUTLINED_FUNCTION_40_35(a1, v16, (unint64_t *)a2);
    a5[2] = v13 - v14 - a3[2] + a2[2];
    *a5 = *a2;
    a5[1] = *a3;
  }
}

uint64_t vgen(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t a4, int a5)
{
  uint64_t result;
  unint64_t *v10;
  int v11;
  uint64_t v12;
  char v13;
  int v14;
  float64x2_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int v20;
  char v21;
  int v22;
  signed __int8 *v23;
  signed __int8 v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _BOOL4 v66;
  uint64_t v67;
  int v68;
  int v69;
  int v70;
  unsigned __int8 *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unsigned int v75;
  uint64_t v76;
  _BYTE *v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  char v81;
  _QWORD *v82;
  uint64_t v83;
  _BOOL4 v84;
  unsigned int v85;
  char *v86;
  int v87;
  size_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unsigned int v97;
  unint64_t v98;
  char *v99;
  int v100;
  size_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  int v111;
  size_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  int v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  _QWORD *v139;
  void *v140;
  void *v141;
  unint64_t *v142;
  uint64_t v143;
  unint64_t *v144;
  void **v145;
  char v146[21];
  uint64_t v147;

  result = 0;
  v147 = *MEMORY[0x24BDAC8D0];
  v146[0] = 0;
  if ((~*(unsigned __int8 *)(a4 + 24) & 7) != 0)
    return result;
  v10 = (unint64_t *)a2;
  v11 = *(char *)(a4 + 8);
  *(_BYTE *)(a2 + 8) = *(_BYTE *)(a4 + 8);
  *(_BYTE *)(a2 + 24) = 2;
  *(_QWORD *)(a2 + 16) = 0;
  result = (uint64_t)dynaBufNew(40);
  v145 = (void **)result;
  if (!result)
    return result;
  v12 = *(_QWORD *)(a1 + 200);
  if (!*(_QWORD *)(v12 + 616))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 200) + 616) = OUTLINED_FUNCTION_6_64();
    *(_QWORD *)(*(_QWORD *)(a1 + 200) + 624) = OUTLINED_FUNCTION_6_64();
    *(_QWORD *)(*(_QWORD *)(a1 + 200) + 640) = OUTLINED_FUNCTION_0_80();
    *(_QWORD *)(*(_QWORD *)(a1 + 200) + 632) = OUTLINED_FUNCTION_0_80();
    v43 = OUTLINED_FUNCTION_0_80();
    v12 = *(_QWORD *)(a1 + 200);
    *(_QWORD *)(v12 + 648) = v43;
    v44 = *(void **)(v12 + 616);
    if (!v44 || !*(_QWORD *)(v12 + 624) || !*(_QWORD *)(v12 + 640) || !v43)
    {
      free(v44);
      free(*(void **)(*(_QWORD *)(a1 + 200) + 624));
      free(*(void **)(*(_QWORD *)(a1 + 200) + 640));
      free(*(void **)(*(_QWORD *)(a1 + 200) + 632));
      v45 = *(void **)(*(_QWORD *)(a1 + 200) + 648);
      goto LABEL_35;
    }
  }
  v13 = 0;
  v14 = *(unsigned __int8 *)(a1 + 288);
  while (v14 > v13)
  {
    *(_QWORD *)(*(_QWORD *)(v12 + 624) + 8 * v13) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 616) + 8 * v13) = 0;
    v12 = *(_QWORD *)(a1 + 200);
    v15 = vld1q_dup_f64((const double *)v12);
    v16 = *(_QWORD *)(v12 + 648) + 24 * v13;
    *(float64x2_t *)v16 = v15;
    v17 = *(_QWORD *)(v12 + 632) + 24 * v13;
    *(float64x2_t *)v17 = v15;
    v18 = *(_QWORD *)(v12 + 640) + 24 * v13;
    *(float64x2_t *)v18 = v15;
    *(_QWORD *)(v16 + 16) = 0;
    *(_QWORD *)(v17 + 16) = 0;
    *(_QWORD *)(v18 + 16) = 0;
    ++v13;
  }
  v142 = a3;
  LODWORD(v138) = a5;
  v19 = (char *)dynaBufContents(*(_QWORD *)(a4 + 16));
  v20 = 0;
  v21 = 0;
  v23 = v19 + 1;
  v22 = *v19;
  v144 = v10;
  LODWORD(v139) = v22;
  while (v22 > v21)
  {
    v24 = *v23;
    v25 = *v23;
    v26 = (_BYTE *)vgetsc(a1, 1, 1, *v10, *v23);
    if (v26)
    {
      do
      {
        v27 = (uint64_t)v26;
        v26 = (_BYTE *)(*(_QWORD *)&v26[8 * v24 + 24] & 0xFFFFFFFFFFFFFFFCLL);
      }
      while (v26 && (*v26 & 2) != 0);
    }
    else
    {
      v27 = 0;
    }
    v28 = v24;
    v29 = (_BYTE *)vgetsc(a1, 0, 1, *v142, v28);
    if (v29)
    {
      do
      {
        v37 = v29;
        v29 = (_BYTE *)(*(_QWORD *)&v29[8 * *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + 8 * (int)v28] & 0xFFFFFFFFFFFFFFFCLL);
      }
      while (v29 && (*v29 & 2) != 0);
      if (v27)
      {
LABEL_20:
        while ((*(_QWORD *)(v27 + 8 * (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + v11)) & 1) != 0)
        {
          v29 = (_BYTE *)VRSYNC(a1, v27, v25);
          if (v29)
          {
            v27 = (uint64_t)v29;
            if (v29 != v37)
              continue;
          }
          goto LABEL_23;
        }
        goto LABEL_85;
      }
    }
    else
    {
      v37 = 0;
      if (v27)
        goto LABEL_20;
    }
LABEL_23:
    v10 = v144;
    gcql(a1, *v144, v28, v11);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 616) + 8 * (int)v28) = v38;
    gcqr(a1, *v144, v25, v11);
    v39 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 624) + 8 * (int)v28) = v40;
    v41 = v23[1];
    while (v39 < v41)
    {
      if (*(unsigned __int8 *)(a4 + 9) == v20)
        v42 = v20 + 1;
      else
        v42 = v20;
      v20 = v42 + 1;
      ++v39;
    }
    v23 += v41 + 2;
    ++v21;
    v22 = (int)v139;
  }
  v29 = malloc_type_malloc(8 * v20 * (unint64_t)*(unsigned __int8 *)(a1 + 288), 0xAD43788BuLL);
  v139 = v29;
  if (!v29)
  {
LABEL_85:
    OUTLINED_FUNCTION_39_35((uint64_t)v29, v30, v31, v32, v33, v34, v35, v36, v123, v128, v129, v130, v131, v132, v133, v134, v136, v138, (uint64_t)v139,
      (uint64_t)v142,
      (uint64_t)v144,
      v145);
    return 0;
  }
  vdur(a1, (uint64_t *)v10, v142, *(char *)(a4 + 8));
  v135 = 0;
  v137 = 0;
  v54 = 0;
  v55 = 1;
  HIDWORD(v128) = (char)v138;
  v143 = v46;
  v56 = v46;
LABEL_38:
  if (v56 < 1)
  {
LABEL_88:
    OUTLINED_FUNCTION_39_35(v46, v47, v48, v49, v50, v51, v52, v53, v123, v128, v129, v130, v131, v132, v133, v135, v137, v138, (uint64_t)v139,
      v143,
      (uint64_t)v144,
      v145);
    free(v140);
    return 1;
  }
  v57 = *v144;
  if (v137 == 3 && (v54 & 1) != 0)
    v57 = (uint64_t)OUTLINED_FUNCTION_29_39();
  v58 = (char *)vnormalize(a1, (uint64_t)v144);
  v137 = v58;
  v133 = v57;
  if ((unint64_t)v58 - 3 < 2)
  {
    v66 = 1;
LABEL_45:
    LODWORD(v130) = v66;
    v67 = *(_QWORD *)a4;
    if (v56 < *(_QWORD *)a4)
      v67 = v56;
    v135 = v67;
    v145 = (void **)dynaBufReset((uint64_t)v145);
    v58 = (char *)dynaBufContents(*(_QWORD *)(a4 + 16));
    v68 = 0;
    v69 = 0;
    v71 = (unsigned __int8 *)(v58 + 1);
    v70 = *v58;
    LODWORD(v132) = v55 | ((_DWORD)v137 != 2);
    v138 = v56;
    HIDWORD(v130) = v70;
    while (1)
    {
      if (v70 <= (char)v69)
      {
LABEL_81:
        v46 = OUTLINED_FUNCTION_30_39();
        if ((_DWORD)v46)
          goto LABEL_88;
        if (*(unsigned __int8 *)(a4 + 9) == v68)
        {
          v110 = (char *)OUTLINED_FUNCTION_26_42();
          v113 = __sprintf_chk(v110, v111, v112, "%d ", v135);
          OUTLINED_FUNCTION_7_64(v113, v114, v115, v116, v117, v118, v119, v120, v127, v128, v129, v130, v131, v132, v133, v135, v137, v138, (uint64_t)v139,
            v143,
            (uint64_t)v144,
            (uint64_t *)v145);
        }
        dynaBufAddChar((uint64_t *)v145, 10, 0);
        dynaBufAddChar((uint64_t *)v145, 0, 0);
        v121 = dynaBufContents((uint64_t)v145);
        v54 = 1;
        vf_puts(a1, SHIDWORD(v128), v121, 1);
        v55 = 0;
        *((_BYTE *)v144 + 24) = 2;
        v122 = *(_QWORD *)a4;
        v144[2] += *(_QWORD *)a4;
        v56 = v138 - v122;
        goto LABEL_38;
      }
      HIDWORD(v132) = v69;
      v72 = (char)*v71;
      v73 = *(_QWORD *)(a1 + 200);
      v74 = *(_QWORD *)(*(_QWORD *)(v73 + 616) + 8 * v72);
      v75 = v71[1];
      v131 = *(_QWORD *)(*(_QWORD *)(v73 + 624) + 8 * v72);
      v76 = *v144;
      if (v137 != 2)
      {
        if (v137 != 4)
        {
          if (v137 != 3)
            goto LABEL_89;
          firstdefd(a1, v11, (_BYTE *)*v144, *v71, 0);
          v129 = v74;
          v77 = OUTLINED_FUNCTION_29_39();
          firstdefd(a1, v11, v77, v72, 1);
          v76 = v78;
        }
        OUTLINED_FUNCTION_36_38();
        if ((v80 & 1) != 0)
          break;
      }
      if ((_DWORD)v130)
      {
        while (1)
        {
          OUTLINED_FUNCTION_36_38();
          if ((v81 & 1) != 0)
            break;
          if (v76 == v133)
            goto LABEL_61;
          v76 = (uint64_t)VLSYNC(v76, v11);
        }
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 616) + 8 * v72) = v76;
        v76 = VRSYNC(a1, v76, v72);
        v82 = (_QWORD *)(*(_QWORD *)(a1 + 200) + 624);
        goto LABEL_60;
      }
LABEL_61:
      v84 = (v132 & 1) == 0
         && (v83 = *(_QWORD *)(a1 + 200), v74 == *(_QWORD *)(*(_QWORD *)(v83 + 616) + 8 * v72))
         && v131 == *(_QWORD *)(*(_QWORD *)(v83 + 624) + 8 * v72);
      v85 = 0;
      v71 += 2;
      do
      {
        if (v85 >= v75)
          break;
        if (*(unsigned __int8 *)(a4 + 9) == v68)
        {
          v86 = (char *)OUTLINED_FUNCTION_26_42();
          v89 = __sprintf_chk(v86, v87, v88, "%d ", v135);
          OUTLINED_FUNCTION_7_64(v89, v90, v91, v92, v93, v94, v95, v96, v124, v128, v129, v130, v131, v132, v133, v135, v137, v138, (uint64_t)v139,
            v143,
            (uint64_t)v144,
            (uint64_t *)v145);
          ++v68;
        }
        if (v56 == v143)
          v62 = LODWORD(vstmtbl[12 * *(unsigned __int8 *)(a4 + 8) + 11]);
        else
          v62 = 0;
        v97 = *v71++;
        v61 = v97;
        if (!v84 || (v58 = (char *)v139[v68], v58 == (char *)0x8000000000000000))
        {
          v58 = (char *)val_expr2(a1, (uint64_t)v144, v72, v61, v62, v137, v146, v65);
          v98 = 0x8000000000000000;
          if (!v146[0])
            v98 = (int)v58;
          v139[v68] = v98;
        }
        if ((_DWORD)v58 == -2147483647)
          goto LABEL_89;
        v125 = (int)v58;
        v99 = (char *)OUTLINED_FUNCTION_26_42();
        v102 = __sprintf_chk(v99, v100, v101, "%d ", v125);
        OUTLINED_FUNCTION_7_64(v102, v103, v104, v105, v106, v107, v108, v109, v126, v128, v129, v130, v131, v132, v133, v135, v137, v138, (uint64_t)v139,
          v143,
          (uint64_t)v144,
          (uint64_t *)v145);
        ++v68;
        ++v85;
        v56 = v138;
      }
      while (!OUTLINED_FUNCTION_30_39());
      v58 = (char *)OUTLINED_FUNCTION_30_39();
      v69 = HIDWORD(v132) + 1;
      v70 = HIDWORD(v130);
      if ((_DWORD)v58)
        goto LABEL_81;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 624) + 8 * v72) = v79;
    v82 = (_QWORD *)(*(_QWORD *)(a1 + 200) + 616);
LABEL_60:
    *(_QWORD *)(*v82 + 8 * v72) = v76;
    goto LABEL_61;
  }
  if (v58 == 2)
  {
    v66 = (uint64_t)v144[2] <= v135;
    goto LABEL_45;
  }
LABEL_89:
  OUTLINED_FUNCTION_39_35((uint64_t)v58, v59, v60, v61, v62, v63, v64, v65, v123, v128, v129, v130, v131, v132, v133, v135, v137, v138, (uint64_t)v139,
    v143,
    (uint64_t)v144,
    v145);
  v45 = v141;
LABEL_35:
  free(v45);
  return 0;
}

void visleft(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unsigned __int8 v6;
  int v7;
  unsigned __int8 v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *i;
  uint64_t j;
  int v17;
  _DWORD *v18;
  int v19;
  int v20;
  uint64_t v21;

  if (a2 != a3)
  {
    if (a2)
    {
      v5 = a3;
      if (a3)
      {
        if (!*(_DWORD *)(*(_QWORD *)(a1 + 192) + 8868) || NONSEQ(a2) || NONSEQ(v5))
        {
          v6 = 0;
          LOBYTE(v7) = *(_BYTE *)(a1 + 288);
          while (1)
          {
            v8 = v7 - 1;
            if ((((_BYTE)v7 - 1) & 0x80) != 0)
            {
              v10 = vgetsc(a1, 1, 1, v5, v6);
              LOBYTE(v7) = v6;
              goto LABEL_15;
            }
            v7 = (char)v8;
            v9 = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + v8;
            if ((*(_QWORD *)(a2 + 8 * v9) & 1) != 0)
            {
              v6 = v7;
              if ((*(_QWORD *)(v5 + 8 * v9) & 1) != 0)
                break;
            }
          }
          v10 = (unint64_t)VLSYNC(v5, v7);
          if (!v10)
            goto LABEL_21;
LABEL_15:
          v11 = (char)v7 + 3;
          while (v10 != a2)
          {
            v12 = (_QWORD *)(*(_QWORD *)(v10 + 8 * v11) & 0xFFFFFFFFFFFFFFFCLL);
            if (!v12)
              break;
            if ((*v12 & 2) != 0)
              v10 = *(_QWORD *)(v10 + 8 * v11) & 0xFFFFFFFFFFFFFFFCLL;
            else
              v10 = *v12 & 0xFFFFFFFFFFFFFFFCLL;
          }
        }
        else
        {
          v13 = *(_QWORD *)(a1 + 200);
          if (*(_DWORD *)(v13 + 656) == spine_changed)
          {
            v14 = 0;
            for (i = (_QWORD *)(v13 + 664); ; ++i)
            {
              if (v14 == 50)
              {
                v19 = *(_DWORD *)(v13 + 660);
                if (v19 <= 48)
                  v20 = v19 + 1;
                else
                  v20 = 0;
                *(_DWORD *)(v13 + 660) = v20;
                v17 = v20;
                while (*(int *)(v13 + 4 * v17 + 1516) >= 13)
                {
                  if (v17 <= 48)
                    ++v17;
                  else
                    v17 = 0;
                  if (v17 == v20)
                  {
                    v21 = v20;
                    v17 = v20;
LABEL_43:
                    *(_DWORD *)(v13 + 660) = v17;
                    *(_QWORD *)(v13 + 8 * v21 + 664) = a2;
                    *(_QWORD *)(*(_QWORD *)(a1 + 200) + 8 * v21 + 1064) = v5;
                    v18 = *(_DWORD **)(a1 + 200);
                    v18[v21 + 379] = 1;
                    goto LABEL_44;
                  }
                }
                v21 = v17;
                goto LABEL_43;
              }
              if (*i == a2 && i[50] == v5)
                break;
              ++v14;
            }
            ++*(_DWORD *)(v13 + 1064 + 4 * v14 + 452);
          }
          else
          {
            for (j = 0; j != 50; ++j)
            {
              *(_QWORD *)(v13 + 8 * j + 664) = 0;
              *(_QWORD *)(*(_QWORD *)(a1 + 200) + 8 * j + 1064) = 0;
              v13 = *(_QWORD *)(a1 + 200);
              *(_DWORD *)(v13 + 4 * j + 1516) = 0;
            }
            v17 = 0;
            *(_QWORD *)(v13 + 664) = a2;
            *(_QWORD *)(*(_QWORD *)(a1 + 200) + 1064) = v5;
            v18 = *(_DWORD **)(a1 + 200);
            v18[379] = 1;
            v18[165] = 0;
            v18[164] = spine_changed;
LABEL_44:
            while (1)
            {
              v5 = *(_QWORD *)(v5 + 8) & 0xFFFFFFFFFFFFFFFCLL;
              if (!v5)
                break;
              if (v5 == a2)
              {
                *((_BYTE *)v18 + v17 + 1464) = 1;
                goto LABEL_21;
              }
            }
            *((_BYTE *)v18 + v17 + 1464) = 0;
          }
        }
      }
    }
LABEL_21:
    OUTLINED_FUNCTION_2_74();
  }
}

void visright(uint64_t a1, unint64_t a2, uint64_t a3)
{
  visleft(a1, a3, a2);
}

void vsync_tv(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a2 + 24) & 1) == 0)
  {
    if (vnormalize(a1, a2) == 2)
      *(_QWORD *)a2 = OUTLINED_FUNCTION_14_52();
    OUTLINED_FUNCTION_10_60();
  }
  OUTLINED_FUNCTION_37_37();
}

void vtmark_tv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;
  char v5;
  _QWORD *v6;
  uint64_t v7;

  if ((*(_BYTE *)(a2 + 24) & 1) == 0)
  {
    v4 = OUTLINED_FUNCTION_1_75(a1, a2);
    if (v4 == 2)
    {
      v7 = OUTLINED_FUNCTION_14_52();
    }
    else
    {
      if (v4 != 3)
      {
LABEL_9:
        OUTLINED_FUNCTION_10_60();
        goto LABEL_10;
      }
      v5 = *(_BYTE *)(v2 + 8);
      v6 = *(_QWORD **)v2;
      if (v3)
        v7 = (uint64_t)OUTLINED_FUNCTION_13_52(v6, v5);
      else
        v7 = (uint64_t)OUTLINED_FUNCTION_12_54(v6, v5);
    }
    *(_QWORD *)v2 = v7;
    goto LABEL_9;
  }
LABEL_10:
  OUTLINED_FUNCTION_3_73();
}

void vtimept_tv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;
  char v5;
  _QWORD *v6;
  void *v7;

  if ((*(_BYTE *)(a2 + 24) & 1) == 0)
  {
    v4 = OUTLINED_FUNCTION_1_75(a1, a2);
    if (v4 != 2)
    {
      if (v4 != 4)
      {
        if (v4 != 3)
          goto LABEL_11;
        v5 = *(_BYTE *)(v2 + 8);
        v6 = *(_QWORD **)v2;
        if (v3)
          v7 = OUTLINED_FUNCTION_13_52(v6, v5);
        else
          v7 = OUTLINED_FUNCTION_12_54(v6, v5);
        *(_QWORD *)v2 = v7;
      }
      OUTLINED_FUNCTION_10_60();
    }
  }
LABEL_11:
  OUTLINED_FUNCTION_3_73();
}

void vctxt_tv(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a2 + 24) & 1) == 0 && vnormalize(a1, a2) - 3 < 2)
    OUTLINED_FUNCTION_10_60();
  OUTLINED_FUNCTION_37_37();
}

void vmove_tv(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a2 + 24) & 1) == 0)
  {
    vnormalize(a1, a2);
    OUTLINED_FUNCTION_10_60();
  }
  OUTLINED_FUNCTION_37_37();
}

void vtsttmark_tv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;
  char v5;
  _QWORD *v6;
  void *v7;

  if ((*(_BYTE *)(a2 + 24) & 1) == 0)
  {
    v4 = OUTLINED_FUNCTION_1_75(a1, a2);
    if ((v4 - 1) >= 2)
    {
      if (v4 == 3)
      {
        v5 = *(_BYTE *)(v2 + 8);
        v6 = *(_QWORD **)v2;
        if (v3)
          v7 = OUTLINED_FUNCTION_13_52(v6, v5);
        else
          v7 = OUTLINED_FUNCTION_12_54(v6, v5);
        *(_QWORD *)v2 = v7;
      }
      OUTLINED_FUNCTION_10_60();
    }
  }
  OUTLINED_FUNCTION_3_73();
}

void vtstctx_tv(uint64_t a1, uint64_t a2)
{
  unint64_t *v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t (*v7)(uint64_t);
  int v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t (*v12)(uint64_t);
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if ((*(_BYTE *)(a2 + 24) & 1) != 0)
    goto LABEL_34;
  v4 = OUTLINED_FUNCTION_1_75(a1, a2);
  if (v4 == 2)
  {
    v5 = v2[2];
    if (v3 == 1 && v5 >= 1)
    {
      OUTLINED_FUNCTION_34_38();
      if (v11)
      {
        v14 = *(_QWORD *)OUTLINED_FUNCTION_17_49(v12);
        v15 = -2147483647;
      }
      else
      {
        if (v13 != -4)
        {
          v14 = 0;
LABEL_25:
          v2[2] -= v14;
LABEL_26:
          v16 = *(_QWORD *)(*v2 + 8);
LABEL_33:
          *v2 = v16 & 0xFFFFFFFFFFFFFFFCLL;
          goto LABEL_34;
        }
        v14 = *(__int16 *)OUTLINED_FUNCTION_17_49(v12);
        v15 = -32767;
      }
      if (v14 == v15)
        goto LABEL_26;
      goto LABEL_25;
    }
    if (v3 || (v5 & 0x8000000000000000) == 0)
      goto LABEL_34;
    OUTLINED_FUNCTION_34_38();
    if (v11)
    {
      v9 = *(_QWORD *)OUTLINED_FUNCTION_17_49(v7);
      v10 = -2147483647;
    }
    else
    {
      if (v8 != -4)
      {
        v9 = 0;
LABEL_31:
        v2[2] += v9;
LABEL_32:
        v16 = *(_QWORD *)*v2;
        goto LABEL_33;
      }
      v9 = *(__int16 *)OUTLINED_FUNCTION_17_49(v7);
      v10 = -32767;
    }
    if (v9 == v10)
      goto LABEL_32;
    goto LABEL_31;
  }
  if (v4 == 4 || v4 == 3)
    OUTLINED_FUNCTION_10_60();
LABEL_34:
  OUTLINED_FUNCTION_3_73();
}

void vcomp_pta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE **v3;
  unint64_t *v6;
  unint64_t v7;
  _QWORD *v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  int v15;
  char v16;
  BOOL v17;

  v3 = (_BYTE **)a3;
  if ((*(_BYTE *)(a2 + 24) & 1) != 0 && (*(_BYTE *)(a3 + 24) & 1) != 0)
  {
    v17 = *(_QWORD *)a2 == *(_QWORD *)a3;
LABEL_23:
    v16 = !v17;
  }
  else
  {
    if ((*(_BYTE *)(a2 + 24) & 2) == 0)
    {
      v6 = (unint64_t *)a2;
LABEL_7:
      v7 = *v6;
      switch(OUTLINED_FUNCTION_32_39())
      {
        case 1u:
        case 2u:
          goto LABEL_20;
        case 3u:
          v8 = lmost(*((char *)v3 + 8), *v3);
          v9 = rmost(a1, *((char *)v3 + 8), *v3);
          v10 = a1 + 192;
          v11 = *((unsigned __int8 *)v3 + 8);
          v12 = *(_QWORD *)(v7 + 8 * (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + (int)v11));
          v13 = v7;
          if ((v12 & 1) == 0)
          {
            v7 = *(_QWORD *)(v7 + 8 * v11 + 24) & 0xFFFFFFFFFFFFFFFCLL;
            v13 = v12 & 0xFFFFFFFFFFFFFFFCLL;
          }
          if ((_QWORD *)v7 != v8)
          {
            visleft(a1, (uint64_t)v8, v7);
            if (!v14)
              goto LABEL_21;
          }
          if ((_BYTE *)v13 != v9)
          {
            visleft(a1, v13, (unint64_t)v9);
            if (!v15)
              goto LABEL_21;
          }
          v16 = 0;
          goto LABEL_27;
        case 4u:
          v17 = *v3 == (_BYTE *)v7;
          goto LABEL_23;
        default:
          goto LABEL_28;
      }
    }
    if ((*(_BYTE *)(a3 + 24) & 2) == 0)
    {
      v6 = (unint64_t *)a3;
      v3 = (_BYTE **)a2;
      goto LABEL_7;
    }
    vnormalize(a1, a2);
    OUTLINED_FUNCTION_32_39();
    if (*(unsigned __int8 *)(a2 + 8) != *((unsigned __int8 *)v3 + 8)
      || *(_BYTE **)a2 != *v3
      || *(_BYTE **)(a2 + 16) != v3[2])
    {
LABEL_20:
      v10 = a1 + 192;
LABEL_21:
      v16 = 1;
      goto LABEL_27;
    }
    v16 = 0;
  }
  v10 = a1 + 192;
LABEL_27:
  *(_BYTE *)(*(_QWORD *)v10 + 8120) = v16;
LABEL_28:
  OUTLINED_FUNCTION_2_74();
}

void vrange_l()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t *v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_27_40();
  vtmark_tv(v5, v6);
  OUTLINED_FUNCTION_23_44();
  if ((_DWORD)v7)
  {
    if (*v2 != **(_QWORD **)(v1 + 200))
    {
      v9 = OUTLINED_FUNCTION_20_48(v7, v8, *(_QWORD *)(*v2 + 8 * v4 + 24) & 0xFFFFFFFFFFFFFFFCLL, *v2);
      *(_QWORD *)v0 = v9;
      if (v9)
      {
        if (v3)
          dupsync(v1, v9, (_BYTE *)*v2, 1);
        *(_BYTE *)(v0 + 24) = 1;
      }
    }
  }
  OUTLINED_FUNCTION_2_74();
}

void dupsync(uint64_t a1, uint64_t a2, _BYTE *a3, int a4)
{
  unint64_t v7;
  char v8;
  int v9;
  uint64_t v10;
  int v11;

  v7 = 0;
  if (a4)
  {
    while (v7 < *(unsigned __int8 *)(a1 + 288))
    {
      OUTLINED_FUNCTION_41_34();
      if ((v8 & 1) != 0)
      {
        vproject(a1, a2, *(_QWORD *)&a3[8 * v7 + 24] & 0xFFFFFFFFFFFFFFFCLL, a3, v7);
        if (!v9)
          break;
      }
      ++v7;
    }
  }
  else
  {
    while (v7 < *(unsigned __int8 *)(a1 + 288))
    {
      OUTLINED_FUNCTION_41_34();
      if ((v10 & 1) != 0)
      {
        vproject(a1, a2, (uint64_t)a3, (_BYTE *)(v10 & 0xFFFFFFFFFFFFFFFCLL), v7);
        if (!v11)
          break;
      }
      LODWORD(v7) = v7 + 1;
    }
  }
}

void vrange_r()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t *v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_27_40();
  vtmark_tv(v5, v6);
  OUTLINED_FUNCTION_23_44();
  if ((_DWORD)v7)
  {
    if (*v2 != *(_QWORD *)(*(_QWORD *)(v1 + 200) + 8))
    {
      v9 = OUTLINED_FUNCTION_20_48(v7, v8, *v2, *(_QWORD *)(*v2 + 8 * (*(_DWORD *)(*(_QWORD *)(v1 + 192) + 9084) + v4)) & 0xFFFFFFFFFFFFFFFCLL);
      *(_QWORD *)v0 = v9;
      if (v9)
      {
        if (v3)
          dupsync(v1, v9, (_BYTE *)*v2, 0);
        *(_BYTE *)(v0 + 24) = 1;
      }
    }
  }
  OUTLINED_FUNCTION_2_74();
}

void vprt_range(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  int v7;

  vtimept_tv(a1, a2);
  if (v6)
  {
    vtimept_tv(a1, a3);
    if (v7)
    {
      if ((*(_BYTE *)(a2 + 24) & 2) != 0 && *(uint64_t *)(a2 + 16) >= 1)
        *(_QWORD *)a2 = VRSYNC(a1, *(_QWORD *)a2, *(char *)(a2 + 8));
      if ((*(_BYTE *)(a3 + 24) & 2) != 0 && (*(_QWORD *)(a3 + 16) & 0x8000000000000000) != 0)
        *(_QWORD *)a3 = VLSYNC(*(_QWORD *)a3, *(char *)(a3 + 8));
    }
  }
  OUTLINED_FUNCTION_3_73();
}

uint64_t ctxt_clstr(uint64_t a1, uint64_t a2, int a3)
{
  char **v5;
  uint64_t (*v6)(_BYTE *);
  _BYTE *v7;
  unint64_t v8;
  int v9;
  _QWORD *v10;

  v5 = &vstmtbl[12 * a3];
  v6 = *(uint64_t (**)(_BYTE *))v5[2];
  v7 = (_BYTE *)OUTLINED_FUNCTION_21_47(a1, 1);
  v8 = OUTLINED_FUNCTION_21_47(a1, 0);
  while (1)
  {
    if (v7 == (_BYTE *)v8)
      return 1;
    if (v7 && (*v7 & 2) != 0)
    {
      v10 = &v7[8 * *(_DWORD *)(*(_QWORD *)(a1 + 192) + 9084) + 8 * a3];
      goto LABEL_12;
    }
    v9 = *((__int16 *)v5[1] + 15);
    if (v9 == -4)
    {
      if (*(_WORD *)v6(v7 + 16))
        return 0;
      goto LABEL_11;
    }
    if (v9 == -3 && *(_QWORD *)v6(v7 + 16))
      return 0;
LABEL_11:
    v10 = v7 + 8;
LABEL_12:
    v7 = (_BYTE *)(*v10 & 0xFFFFFFFFFFFFFFFCLL);
  }
}

void *OUTLINED_FUNCTION_0_80()
{
  uint64_t v0;

  return malloc_type_malloc(24 * *(unsigned __int8 *)(v0 + 288), 0x1080040CC6EE3FDuLL);
}

uint64_t OUTLINED_FUNCTION_1_75(uint64_t a1, uint64_t a2)
{
  return vnormalize(a1, a2);
}

uint64_t OUTLINED_FUNCTION_4_68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _QWORD *a11)
{
  uint64_t v11;
  uint64_t v12;

  return (*(uint64_t (**)(uint64_t))(*a11 + 8 * v12))(v11 + 16);
}

void OUTLINED_FUNCTION_5_65(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  gcql(v3, a2, v4, v2);
}

void *OUTLINED_FUNCTION_6_64()
{
  uint64_t v0;

  return malloc_type_malloc(8 * *(unsigned __int8 *)(v0 + 288), 0x80040B8603338uLL);
}

void OUTLINED_FUNCTION_7_64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t *a22)
{
  uint64_t v22;

  dynaBufAddString(a22, (char *)(v22 - 108), 0);
}

uint64_t OUTLINED_FUNCTION_8_62(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _QWORD *a11)
{
  uint64_t v11;
  uint64_t v12;

  return (*(uint64_t (**)(uint64_t))(*a11 + 8 * v12))(v11 + 16);
}

void OUTLINED_FUNCTION_10_60()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 24) = 1;
}

uint64_t OUTLINED_FUNCTION_11_57(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _QWORD *a11)
{
  uint64_t v11;
  uint64_t v12;

  return (*(uint64_t (**)(uint64_t))(*a11 + 8 * v12))(v11 + 16);
}

_BYTE *OUTLINED_FUNCTION_12_54@<X0>(_BYTE *a1@<X2>, char a2@<W8>)
{
  uint64_t v2;

  return rmost(v2, a2, a1);
}

_QWORD *OUTLINED_FUNCTION_13_52@<X0>(_QWORD *a1@<X2>, char a2@<W8>)
{
  return lmost(a2, a1);
}

uint64_t OUTLINED_FUNCTION_14_52()
{
  uint64_t v0;
  uint64_t *v1;

  return vsplit_time(v1, *(unsigned __int8 *)(v0 + 8), *(_QWORD *)v0, *(_QWORD *)(v0 + 16));
}

uint64_t OUTLINED_FUNCTION_16_49()
{
  uint64_t v0;
  uint64_t (***v1)(uint64_t);

  return (**v1)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_17_49@<X0>(uint64_t (*a1)(uint64_t)@<X8>)
{
  uint64_t v1;

  return a1(v1 + 16);
}

uint64_t OUTLINED_FUNCTION_20_48(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v4;
  unsigned __int8 v5;

  return vins_sync(v4, v5, a3, a4);
}

unint64_t OUTLINED_FUNCTION_21_47(uint64_t a1, int a2)
{
  unint64_t v2;
  unsigned int v3;

  return vgetsc(a1, a2, 1, v2, v3);
}

void OUTLINED_FUNCTION_22_46(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;

  gcqr(a1, a2, v3, v2);
}

void OUTLINED_FUNCTION_23_44()
{
  uint64_t v0;
  uint64_t *v1;
  unsigned __int8 v2;

  vdef_proj(v0, *v1, v2);
}

uint64_t OUTLINED_FUNCTION_25_44()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  return v1(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_26_42()
{
  uint64_t v0;

  return v0 - 108;
}

_QWORD *OUTLINED_FUNCTION_29_39()
{
  int v0;
  _QWORD *v1;

  return lmost(v0, v1);
}

uint64_t OUTLINED_FUNCTION_30_39()
{
  uint64_t v0;

  return checkInterrupt(v0);
}

void OUTLINED_FUNCTION_31_39(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;

  vdef_proj(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_32_39()
{
  uint64_t v0;
  uint64_t v1;

  return vnormalize(v0, v1);
}

uint64_t OUTLINED_FUNCTION_33_39(uint64_t a1, unsigned int a2, unint64_t a3, unint64_t a4)
{
  uint64_t v4;

  return vins_sync(v4, a2, a3, a4);
}

void OUTLINED_FUNCTION_34_38()
{
  uint64_t v0;
  unint64_t *v1;

  *v1 = v0 & 0xFFFFFFFFFFFFFFFCLL;
}

uint64_t OUTLINED_FUNCTION_35_38()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_39_35(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void **a22)
{
  return dynaBufDelete(a22);
}

void OUTLINED_FUNCTION_40_35(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  int v3;

  dur2(a1, a2, a3, v3, 1);
}

uint64_t OUTLINED_FUNCTION_44_29(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;

  return ctxt_clstr(v3, a2, v2);
}

BOOL initializeDeltaHeap(uint64_t a1, unsigned int a2)
{
  int v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = OUTLINED_FUNCTION_0_81(a1, a2);
  v5 = 0;
  v6 = *(_QWORD *)(v3 + 200);
  *(_QWORD *)(v6 + 1736) = v4;
  *(_QWORD *)(v6 + 1752) = v4;
  *(_DWORD *)(v6 + 1776) = v2;
  v7 = v6 + 1800;
  while (v5 != 400)
  {
    *(_BYTE *)(v7 + v5) = 1;
    v5 += 40;
  }
  return v4 != 0;
}

_DWORD *allocDynaSegment(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v8;
  void *v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 200);
  v3 = *(_DWORD **)(v2 + 2192);
  if (v3)
  {
    v3[4] = 0;
    v4 = *((_QWORD *)v3 + 4);
    *(_QWORD *)(v2 + 2192) = *((_QWORD *)v3 + 5);
    --*(_DWORD *)(v2 + 2184);
    v5 = v4 & 3;
    if ((v4 & 7) == 0)
      v5 = v4 & 3 | 4;
    *((_QWORD *)v3 + 5) = 0;
    *(_QWORD *)v3 = 0;
    *((_QWORD *)v3 + 1) = v5;
  }
  else
  {
    v8 = malloc_type_malloc(0x30uLL, 0x10A0040B1233896uLL);
    v3 = v8;
    if (v8)
    {
      v8[5] = 0;
      *v8 = 0;
      *((_DWORD *)v8 + 4) = 0;
      v9 = malloc_type_malloc(a2, 0xE65396F9uLL);
      *((_QWORD *)v3 + 3) = v9;
      if (v9)
      {
        v10 = (uint64_t)v9 + a2 - 1;
        *((_QWORD *)v3 + 4) = v10;
        *((_QWORD *)v3 + 1) = v10 & 3;
        if ((v10 & 7) == 0)
          *((_QWORD *)v3 + 1) = v10 & 3 | 4;
      }
      else
      {
        free(v3);
        return 0;
      }
    }
  }
  return v3;
}

_QWORD *allocDeltaHeapObject(uint64_t a1, int a2)
{
  uint64_t v2;
  _QWORD *v3;
  signed int v4;
  uint64_t v5;
  uint64_t v6;
  signed int v7;
  _QWORD *result;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 200);
  v3 = *(_QWORD **)(v2 + 1752);
  if (a2 + 8 < 1)
  {
    LODWORD(v6) = *((_DWORD *)v3 + 2);
  }
  else
  {
    v4 = (a2 + 15) & 0xFFFFFFF8;
    v5 = v3[1];
    v6 = v5 + v4;
    v3[1] = v6;
    v7 = *(_DWORD *)(v2 + 1776);
    if (v7 <= (int)v6)
    {
      v3[1] = v5;
      result = allocDynaSegment(a1, v7);
      v3[5] = result;
      if (!result)
        return result;
      v6 = result[1] + v4;
      *result = v3;
      result[1] = v6;
      v2 = *(_QWORD *)(a1 + 200);
      if (*(_DWORD *)(v2 + 1776) < (int)v6)
        return 0;
      v3 = result;
    }
  }
  v10 = v3[4];
  if (!v10)
    return 0;
  v11 = (_QWORD *)(v10 - v6);
  v12 = *(_QWORD *)(v2 + 1752);
  v13 = *(_QWORD *)(v12 + 40);
  if (v13)
  {
    *(_QWORD *)(v2 + 1752) = v13;
    v12 = v13;
  }
  *v11 = v12;
  result = v11 + 1;
  ++*(_DWORD *)(v12 + 16);
  return result;
}

void freeDeltaHeapObject(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = *(uint64_t **)(a2 - 8);
  v3 = *((_DWORD *)v2 + 4) - 1;
  *((_DWORD *)v2 + 4) = v3;
  if (v3)
    goto LABEL_2;
  v4 = *(_QWORD *)(a1 + 200);
  if (v2 == *(uint64_t **)(v4 + 1752))
  {
    v2[1] = v2[4] & 3;
LABEL_2:
    OUTLINED_FUNCTION_1_76();
    return;
  }
  v5 = *(_DWORD *)(v4 + 2184);
  v6 = *v2;
  *(_QWORD *)(*v2 + 40) = v2[5];
  v7 = (_QWORD *)v2[5];
  if (v5 <= 19)
  {
    if (v7)
      *v7 = v6;
    v2[5] = *(_QWORD *)(v4 + 2192);
    *(_QWORD *)(v4 + 2192) = v2;
    *(_DWORD *)(v4 + 2184) = v5 + 1;
    goto LABEL_2;
  }
  if (v7)
    *v7 = v6;
  free((void *)v2[3]);
  free(v2);
}

BOOL resetDeltaHeap()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_2_75();
  freeDynaMem(*(_QWORD *)(v1 + 1736));
  return initializeDeltaHeap(v0, *(_DWORD *)(*(_QWORD *)(v0 + 200) + 1776));
}

void freeDynaMem(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1;
  if (a1)
  {
    do
    {
      v2 = *(_QWORD *)(v1 + 40);
      free(*(void **)(v1 + 24));
      free((void *)v1);
      v1 = v2;
    }
    while (v2);
  }
  OUTLINED_FUNCTION_1_76();
}

void freeDeltaHeapTo(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  for (i = 0; i != 10; ++i)
  {
    v7 = *(_QWORD *)(a1 + 200);
    if (!*(_BYTE *)(v7 + 40 * i + 1800) && *(_QWORD *)(v7 + 40 * i + 1784) == a2)
    {
      while (1)
      {
        v10 = *(_QWORD *)(v7 + 1752);
        if (!v10 || v10 == *(_QWORD *)(v7 + 40 * i + 1792))
          break;
        free(*(void **)(v10 + 24));
        v8 = *(_QWORD *)(a1 + 200);
        v9 = **(_QWORD **)(v8 + 1752);
        *(_QWORD *)(v8 + 1752) = v9;
        free(*(void **)(v9 + 40));
        v7 = *(_QWORD *)(a1 + 200);
      }
      if (v10)
      {
        v12 = v7 + 40 * i;
        *(_QWORD *)(v10 + 8) = *(_QWORD *)(v12 + 1808);
        *(_DWORD *)(v10 + 16) = *(_DWORD *)(v12 + 1816);
        if (a3)
          *(_BYTE *)(v7 + 40 * i + 1800) = 1;
        return;
      }
    }
  }
}

uint64_t recordDeltaHeapPos(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = 0;
  v2 = *(_QWORD *)(a1 + 200);
  while (1)
  {
    v3 = v1 + 40;
    if (v1 == 400)
      break;
    v4 = *(unsigned __int8 *)(v2 + v1 + 1800);
    v1 += 40;
    if (v4)
    {
      v5 = v2 + v3;
      *(_BYTE *)(v5 + 1760) = 0;
      v6 = *(_QWORD *)(v2 + 1752);
      v7 = *(_QWORD *)(v6 + 8);
      *(_QWORD *)(v5 + 1744) = *(_QWORD *)(v6 + 32) - v7;
      *(_QWORD *)(v5 + 1768) = v7;
      *(_DWORD *)(v5 + 1776) = *(_DWORD *)(v6 + 16);
      *(_QWORD *)(v5 + 1752) = v6;
      return 1;
    }
  }
  return 0;
}

uint64_t getDeltaHeapSegNumber(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *i;
  uint64_t v7;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;

  v3 = 0;
  v4 = *(_QWORD *)(a2 - 8);
  v5 = *(_QWORD *)(a1 + 200);
  for (i = (uint64_t *)(v5 + 1736); ; i = (uint64_t *)(v7 + 40))
  {
    v7 = *i;
    if (!v7 || v7 == v4)
      break;
    ++v3;
  }
  if (v7)
    return ((*(_QWORD *)(v4 + 32) - a2) / (int)a3) + *(_DWORD *)(v5 + 1776) / a3 * v3;
  v10 = (_QWORD *)(v5 + 2192);
  do
  {
    v11 = *v10;
    v10 = (_QWORD *)(*v10 + 40);
    if (v11)
      v12 = v11 == v4;
    else
      v12 = 1;
  }
  while (!v12);
  if (v11)
    return 4294967294;
  else
    return 0xFFFFFFFFLL;
}

BOOL initializeDeltaStack(uint64_t a1, unsigned int a2)
{
  int v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;

  v4 = OUTLINED_FUNCTION_0_81(a1, a2);
  v5 = *(_QWORD *)(v3 + 200);
  *(_QWORD *)(v5 + 1744) = v4;
  v6 = *((_QWORD *)v4 + 1);
  v7 = *((_QWORD *)v4 + 4) - v6;
  *(_DWORD *)(v5 + 1780) = v2;
  v8 = *(int *)(v5 + 296);
  v9 = (_BYTE *)(v7 - v8);
  *(_QWORD *)(v5 + 1720) = v9;
  *(_DWORD *)(v5 + 1728) = v2 - v6 - v8;
  *v9 = 8;
  *(_QWORD *)(v5 + 1760) = v9;
  return v4 != 0;
}

BOOL resetDeltaStack()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_2_75();
  freeDynaMem(*(_QWORD *)(v1 + 1744));
  v2 = *(_QWORD *)(v0 + 200);
  *(_QWORD *)(v2 + 1744) = 0;
  return initializeDeltaStack(v0, *(_DWORD *)(v2 + 1780));
}

uint64_t peekDeltaStackStart()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_2_75();
  *(_QWORD *)(v1 + 1768) = *(_QWORD *)(v1 + 1720);
  peekDeltaStackNext(v2);
  return *(_QWORD *)(*(_QWORD *)(v0 + 200) + 1768);
}

uint64_t peekDeltaStackNext(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  int v3;

  v1 = *(_QWORD *)(a1 + 200);
  result = *(_QWORD *)(v1 + 1768);
  switch(*(_BYTE *)result)
  {
    case 0:
    case 3:
      v3 = *(_DWORD *)(v1 + 288);
      break;
    case 1:
      v3 = *(_DWORD *)(v1 + 284);
      break;
    case 2:
      v3 = *(_DWORD *)(v1 + 280) + ((*(_DWORD *)(result + 16) - 1) | 3) + 1;
      break;
    case 4:
    case 6:
      v3 = *(_DWORD *)(v1 + 296);
      break;
    case 5:
      v3 = *(_DWORD *)(v1 + 292);
      break;
    case 7:
      v3 = *(_DWORD *)(v1 + 276);
      break;
    case 8:
      v3 = 2;
      break;
    default:
      v3 = 0;
      break;
  }
  *(_QWORD *)(v1 + 1768) = result + v3;
  return result;
}

uint64_t popDeltaStackTop(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  int v3;

  v1 = *(_QWORD *)(a1 + 200);
  result = *(_QWORD *)(v1 + 1720);
  switch(*(_BYTE *)result)
  {
    case 0:
    case 3:
      v3 = *(_DWORD *)(v1 + 288);
      break;
    case 1:
      v3 = *(_DWORD *)(v1 + 284);
      break;
    case 2:
      v3 = *(_DWORD *)(v1 + 280) + ((*(_DWORD *)(result + 16) - 1) | 3) + 1;
      break;
    case 4:
    case 6:
      v3 = *(_DWORD *)(v1 + 296);
      break;
    case 5:
      v3 = *(_DWORD *)(v1 + 292);
      break;
    case 7:
      v3 = *(_DWORD *)(v1 + 276);
      break;
    default:
      v3 = 0;
      break;
  }
  *(_QWORD *)(v1 + 1720) = result + v3;
  *(_DWORD *)(v1 + 1728) += v3;
  return result;
}

void deltaHeapCleanup()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_75();
  v2 = v1[274];
  if (v2)
  {
    freeDynaMem(v2);
    v1 = *(_QWORD **)(v0 + 200);
  }
  v3 = v1[217];
  if (v3)
  {
    freeDynaMem(v3);
    v1 = *(_QWORD **)(v0 + 200);
  }
  v4 = v1[218];
  if (v4)
  {
    freeDynaMem(v4);
    v1 = *(_QWORD **)(v0 + 200);
  }
  v1[274] = 0;
  v1[217] = 0;
  v1[219] = 0;
  v1[218] = 0;
  OUTLINED_FUNCTION_1_76();
}

_DWORD *OUTLINED_FUNCTION_0_81(uint64_t a1, unsigned int a2)
{
  return allocDynaSegment(a1, a2);
}

uint64_t vmeminit(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 200);
  *(_DWORD *)(v2 + 276) = ((*(unsigned __int8 *)(a1 + 232) - 1) | 3) + 1;
  *(_OWORD *)(v2 + 280) = xmmword_21F8A0BA0;
  *(_DWORD *)(v2 + 296) = 4;
  result = initializeDeltaStack(a1, 0xFA00u);
  if ((_DWORD)result)
  {
    result = initializeDeltaHeap(a1, 0x2000u);
    if ((_DWORD)result)
    {
      v4 = *(_QWORD *)(a1 + 200);
      *(_QWORD *)(*(_QWORD *)(a1 + 192) + 8112) = *(_QWORD *)(v4 + 1720);
      *(_DWORD *)(v4 + 252) = 0;
      *(_DWORD *)(v4 + 256) = 0;
      result = (uint64_t)malloc_type_malloc(0x50uLL, 0x100004090896170uLL);
      v5 = *(_QWORD *)(a1 + 200);
      *(_QWORD *)(v5 + 264) = result;
      if (result)
      {
        *(_BYTE *)(v5 + 272) = -1;
        viasizes();
        return 1;
      }
    }
  }
  return result;
}

void *vpush_var(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;

  v2 = *(__int16 *)(a2 + 8);
  v3 = (char *)&unk_21F8A0BC8 + 4 * v2 + 24;
  if (v2 <= 0xFFFFFFF9)
    v3 = (char *)&vstmtbl[12 * *(__int16 *)(a2 + 8) + 8] + 4;
  v4 = *(int *)v3;
  v5 = *(_QWORD *)(a1 + 200);
  v6 = *(int *)(v5 + 280);
  v7 = ((v4 - 1) | 3) + 1;
  v8 = *(_QWORD *)(v5 + 1720) - (v7 + v6);
  *(_QWORD *)(v5 + 1720) = v8;
  *(_DWORD *)(v5 + 1728) -= v7 + v6;
  *(_BYTE *)v8 = 2;
  *(_WORD *)(v8 + 2) = v2;
  *(_DWORD *)(v8 + 16) = v4;
  v9 = *(const void **)a2;
  *(_QWORD *)(v8 + 8) = v9;
  return memcpy((void *)(v8 + v6), v9, (int)v7);
}

void vadd(uint64_t a1, double **a2, double **a3)
{
  int v3;
  int v4;
  int v5;
  double *v6;
  double v7;
  double v8;
  int v9;

  v3 = *((__int16 *)a2 + 4);
  switch(v3)
  {
    case -5:
      v5 = *((__int16 *)a3 + 4);
      switch(v5)
      {
        case -5:
          v6 = *a2;
          v7 = **a2;
          v8 = **a3;
          break;
        case -4:
          v6 = *a2;
          v7 = **a2;
          v8 = (double)*(__int16 *)*a3;
          break;
        case -3:
          v6 = *a2;
          v7 = **a2;
          v8 = (double)*(uint64_t *)*a3;
          break;
        default:
          return;
      }
      *v6 = v7 + v8;
      break;
    case -4:
      v9 = *((__int16 *)a3 + 4);
      if (v9 == -5 || v9 == -4 || v9 == -3)
        OUTLINED_FUNCTION_1_77(*a2);
      break;
    case -3:
      v4 = *((__int16 *)a3 + 4);
      if (v4 == -5 || v4 == -4 || v4 == -3)
        OUTLINED_FUNCTION_2_76(*a2);
      break;
  }
}

void vsub(uint64_t a1, double **a2, double **a3)
{
  int v3;
  int v4;
  int v5;
  double *v6;
  double v7;
  double v8;
  int v9;

  v3 = *((__int16 *)a2 + 4);
  switch(v3)
  {
    case -5:
      v5 = *((__int16 *)a3 + 4);
      switch(v5)
      {
        case -5:
          v6 = *a2;
          v7 = **a2;
          v8 = **a3;
          break;
        case -4:
          v6 = *a2;
          v7 = **a2;
          v8 = (double)*(__int16 *)*a3;
          break;
        case -3:
          v6 = *a2;
          v7 = **a2;
          v8 = (double)*(uint64_t *)*a3;
          break;
        default:
          return;
      }
      *v6 = v7 - v8;
      break;
    case -4:
      v9 = *((__int16 *)a3 + 4);
      if (v9 == -5 || v9 == -4 || v9 == -3)
        OUTLINED_FUNCTION_1_77(*a2);
      break;
    case -3:
      v4 = *((__int16 *)a3 + 4);
      if (v4 == -5 || v4 == -4 || v4 == -3)
        OUTLINED_FUNCTION_2_76(*a2);
      break;
  }
}

void vmult(uint64_t a1, double **a2, double **a3)
{
  int v3;
  int v4;
  int v5;
  double *v6;
  double v7;
  double v8;
  int v9;

  v3 = *((__int16 *)a2 + 4);
  switch(v3)
  {
    case -5:
      v5 = *((__int16 *)a3 + 4);
      switch(v5)
      {
        case -5:
          v6 = *a2;
          v7 = **a2;
          v8 = **a3;
          break;
        case -4:
          v6 = *a2;
          v7 = **a2;
          v8 = (double)*(__int16 *)*a3;
          break;
        case -3:
          v6 = *a2;
          v7 = **a2;
          v8 = (double)*(uint64_t *)*a3;
          break;
        default:
          return;
      }
      *v6 = v7 * v8;
      break;
    case -4:
      v9 = *((__int16 *)a3 + 4);
      if (v9 == -5 || v9 == -4 || v9 == -3)
        OUTLINED_FUNCTION_1_77(*a2);
      break;
    case -3:
      v4 = *((__int16 *)a3 + 4);
      if (v4 == -5 || v4 == -4 || v4 == -3)
        OUTLINED_FUNCTION_2_76(*a2);
      break;
  }
}

void vdiv(uint64_t a1, double **a2, uint64_t **a3)
{
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  double *v7;
  double v8;
  double v9;
  int v10;

  v3 = *((__int16 *)a2 + 4);
  switch(v3)
  {
    case -5:
      v6 = *((__int16 *)a3 + 4);
      if (v6 != -5)
      {
        if (v6 == -4)
        {
          v7 = *a2;
          v8 = **a2;
          v9 = (double)*(__int16 *)*a3;
        }
        else
        {
          if (v6 != -3)
            return;
          v7 = *a2;
          v8 = **a2;
          v9 = (double)**a3;
        }
        *v7 = v8 / v9;
        return;
      }
      **a2 = **a2 / *(double *)*a3;
      break;
    case -4:
      v10 = *((__int16 *)a3 + 4);
      switch(v10)
      {
        case -5:
          OUTLINED_FUNCTION_1_77(*a2);
          break;
        case -4:
          *(__int16 *)*a2 /= *(__int16 *)*a3;
          break;
        case -3:
          *(_WORD *)*a2 = *(__int16 *)*a2 / **a3;
          break;
      }
      break;
    case -3:
      v4 = *((__int16 *)a3 + 4);
      switch(v4)
      {
        case -5:
          OUTLINED_FUNCTION_2_76(*a2);
          return;
        case -4:
          v5 = *(__int16 *)*a3;
          goto LABEL_18;
        case -3:
          v5 = **a3;
LABEL_18:
          *(uint64_t *)*a2 /= v5;
          break;
      }
      break;
  }
}

BOOL vnegative(uint64_t a1, double **a2)
{
  int v2;

  v2 = *((__int16 *)a2 + 4);
  switch(v2)
  {
    case -5:
      return **a2 < 0.0;
    case -4:
      return *(__int16 *)*a2 < 0;
    case -3:
      return *(_QWORD *)*a2 >> 63;
  }
  return 0;
}

void vnegate(uint64_t a1, _QWORD **a2)
{
  int v2;

  v2 = *((__int16 *)a2 + 4);
  switch(v2)
  {
    case -5:
      *(double *)*a2 = -*(double *)*a2;
      break;
    case -4:
      OUTLINED_FUNCTION_1_77(*a2);
      break;
    case -3:
      OUTLINED_FUNCTION_2_76(*a2);
      break;
  }
}

void vassign(uint64_t a1, void **a2, const void **a3)
{
  int v3;
  uint64_t v4;
  double v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  double v11;
  double v12;

  switch(*((_WORD *)a2 + 4))
  {
    case 0xFFFA:
      goto LABEL_26;
    case 0xFFFB:
      v3 = *((__int16 *)a3 + 4);
      if (v3 == -5)
      {
        v5 = *(double *)*a3;
        goto LABEL_29;
      }
      if (v3 == -4)
      {
        v10 = *(unsigned __int16 *)*a3;
        if (v10 == 32769)
          goto LABEL_26;
        v5 = (double)(__int16)v10;
        goto LABEL_29;
      }
      if (v3 != -3)
        return;
      v4 = *(_QWORD *)*a3;
      if (v4 != -2147483647)
      {
        v5 = (double)v4;
LABEL_29:
        *(double *)*a2 = v5;
        return;
      }
LABEL_26:
      OUTLINED_FUNCTION_2_76(*a2);
      return;
    case 0xFFFC:
      v6 = *((__int16 *)a3 + 4);
      switch(v6)
      {
        case -5:
          v11 = *(double *)*a3;
          if (v11 == 2.22507386e-308)
          {
            OUTLINED_FUNCTION_1_77(*a2);
            return;
          }
          v7 = (int)v11;
LABEL_13:
          *(_WORD *)*a2 = v7;
          return;
        case -4:
LABEL_12:
          LOWORD(v7) = *(_WORD *)*a3;
          goto LABEL_13;
        case -3:
          *(_WORD *)*a2 = *(_QWORD *)*a3;
          break;
      }
      return;
    case 0xFFFD:
      v8 = *((__int16 *)a3 + 4);
      switch(v8)
      {
        case -5:
          v12 = *(double *)*a3;
          if (v12 == 2.22507386e-308)
            goto LABEL_26;
          v9 = (uint64_t)v12;
          break;
        case -4:
          v9 = *(__int16 *)*a3;
          break;
        case -3:
          v9 = *(_QWORD *)*a3;
          break;
        default:
          return;
      }
      *(_QWORD *)*a2 = v9;
      return;
    case 0xFFFE:
      goto LABEL_12;
    case 0xFFFF:
      *(_BYTE *)*a2 = *(_BYTE *)*a3;
      return;
    default:
      memcpy(*a2, *a3, SHIDWORD(vstmtbl[12 * *((__int16 *)a2 + 4) + 8]));
      return;
  }
}

void vcompare(uint64_t a1, uint64_t **a2, uint64_t **a3)
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  double v12;
  uint64_t v13;
  double v14;
  int v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;

  switch(*((_WORD *)a2 + 4))
  {
    case 0xFFFA:
      v5 = absoluteSyncNumPtr(**a2);
      v6 = absoluteSyncNumPtr(**a3);
      v7 = (_BYTE *)(*(_QWORD *)(a1 + 192) + 8120);
      if (v5 == v6)
        goto LABEL_32;
      goto LABEL_3;
    case 0xFFFB:
      v11 = *((__int16 *)a3 + 4);
      if (v11 == -5)
      {
        v12 = OUTLINED_FUNCTION_6_65(a1, (uint64_t)a2);
      }
      else
      {
        if (v11 != -3)
          return;
        v12 = OUTLINED_FUNCTION_6_65(a1, (uint64_t)a2);
        v14 = (double)v13;
      }
      if (v12 < v14)
        goto LABEL_29;
      v7 = (_BYTE *)(*(_QWORD *)(a1 + 192) + 8120);
      if (v12 == v14)
LABEL_32:
        *v7 = 0;
      else
LABEL_3:
        *v7 = 1;
      return;
    case 0xFFFC:
      v15 = *((__int16 *)a3 + 4);
      if (v15 == -4)
        goto LABEL_17;
      if (v15 != -3)
        return;
      if (**a3 > *(__int16 *)*a2)
        goto LABEL_29;
      OUTLINED_FUNCTION_3_74();
      if (v18 != v17)
        goto LABEL_26;
      goto LABEL_21;
    case 0xFFFD:
      v8 = *((__int16 *)a3 + 4);
      if (v8 == -4)
      {
        v9 = **a2;
        v10 = *(__int16 *)*a3;
      }
      else
      {
        if (v8 != -3)
          return;
        v9 = **a2;
        v10 = **a3;
      }
      if (v9 < v10)
      {
LABEL_29:
        v21 = *(_QWORD *)(a1 + 192);
        v22 = -1;
        goto LABEL_30;
      }
      OUTLINED_FUNCTION_3_74();
      if (v23 == v24)
LABEL_21:
        *v16 = 0;
      else
LABEL_26:
        *v16 = 1;
      break;
    case 0xFFFE:
LABEL_17:
      if (*(__int16 *)*a2 < *(__int16 *)*a3)
        goto LABEL_29;
      goto LABEL_20;
    case 0xFFFF:
      if (*(unsigned __int8 *)*a2 < *(unsigned __int8 *)*a3)
        goto LABEL_29;
LABEL_20:
      OUTLINED_FUNCTION_3_74();
      if (v19 == v20)
        goto LABEL_21;
      goto LABEL_26;
    default:
      if (*((unsigned __int16 *)a3 + 4) == *((unsigned __int16 *)a2 + 4))
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 192) + 8120) = memcmp(*a2, *a3, SHIDWORD(vstmtbl[12 * *((__int16 *)a2 + 4) + 8]));
      }
      else
      {
        v21 = *(_QWORD *)(a1 + 192);
        v22 = 1;
LABEL_30:
        *(_BYTE *)(v21 + 8120) = v22;
      }
      break;
  }
}

BOOL vcompareTypeCheck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  _BOOL8 result;
  BOOL v5;

  v3 = *(__int16 *)(a2 + 8);
  switch(*(_WORD *)(a2 + 8))
  {
    case 0xFFFA:
      v5 = *(__int16 *)(a3 + 8) == -6;
      goto LABEL_8;
    case 0xFFFB:
    case 0xFFFC:
    case 0xFFFD:
      return (*(__int16 *)(a3 + 8) + 5) < 3;
    case 0xFFFE:
      v5 = *(__int16 *)(a3 + 8) == -2;
      goto LABEL_8;
    case 0xFFFF:
      v5 = *(__int16 *)(a3 + 8) == -1;
LABEL_8:
      result = v5;
      break;
    default:
      result = (v3 & 0x80000000) == 0 && v3 < *(unsigned __int8 *)(a1 + 288);
      break;
  }
  return result;
}

uint64_t vinitloc(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  char *v8;
  char v9;

  v3 = result;
  v4 = *(__int16 *)(*(_QWORD *)a2 + 16);
  if (v4 < 0 || (v5 = *(__int16 *)(a2 + 8), v5 == -1))
  {
    v9 = 0;
    *(_WORD *)(result + 8) = v4;
    *(_QWORD *)result = *(_QWORD *)(a2 + 16);
  }
  else
  {
    v6 = *(uint64_t (**)(uint64_t))&vstmtbl[12 * *(unsigned __int16 *)(*(_QWORD *)a2 + 16) + 2][8 * v5];
    v7 = TVFLDS(*(_QWORD *)(a2 + 16));
    result = v6(v7);
    *(_QWORD *)v3 = result;
    v8 = &vstmtbl[12 * *(__int16 *)(*(_QWORD *)a2 + 16) + 1][40 * *(__int16 *)(a2 + 8)];
    *(_WORD *)(v3 + 8) = *((_WORD *)v8 + 15);
    v9 = v8[32];
  }
  *(_BYTE *)(v3 + 10) = v9;
  return result;
}

uint64_t vnspush(uint64_t result, _WORD **a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = *((__int16 *)a2 + 4);
  v3 = *(_QWORD *)(result + 200);
  v4 = *(_QWORD *)(v3 + 264);
  v5 = *(_BYTE *)(v3 + 272) + 1;
  *(_BYTE *)(v3 + 272) = v5;
  *(_WORD *)(v4 + 16 * v5 + 8) = v2;
  switch(v2)
  {
    case -5:
      *(_QWORD *)(v4 + 16 * v5) = *(_QWORD *)*a2;
      break;
    case -4:
    case -2:
      *(_WORD *)(v4 + 16 * v5) = **a2;
      break;
    case -3:
      *(_QWORD *)(v4 + 16 * v5) = *(_QWORD *)*a2;
      break;
    case -1:
      *(_BYTE *)(v4 + 16 * v5) = *(_BYTE *)*a2;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t vnspop(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;

  v2 = *(_QWORD *)(result + 200);
  v3 = *(char *)(v2 + 272);
  v4 = *(_QWORD *)(v2 + 264) + 16 * v3;
  v5 = *(unsigned __int16 *)(v4 + 8);
  *(_WORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 10) = 0;
  if (v5 >= 0xFFFB)
    *(_QWORD *)a2 = v4;
  *(_BYTE *)(v2 + 272) = v3 - 1;
  return result;
}

uint64_t vonstack(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 192) + 8112;
  while (1)
  {
    v3 = *(_QWORD *)v2;
    if (!v3)
      break;
    v4 = *(uint64_t **)(v3 + 8);
    v5 = *v4;
    v2 = (uint64_t)(v4 + 7);
    if (v5 == a2)
      return *(_QWORD *)(*(_QWORD *)v2 + 8);
  }
  return 0;
}

_QWORD *alloc_sync(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = allocDeltaHeapObject(a1, *(_DWORD *)(*(_QWORD *)(a1 + 200) + 248));
  v3 = v2;
  if (v2)
  {
    bzero(v2, *(int *)(*(_QWORD *)(a1 + 200) + 248));
    *v3 |= 2uLL;
    SETONESTM((uint64_t)v3);
    CLRALLNSQ((uint64_t)v3);
  }
  return v3;
}

_QWORD *alloc_tok(uint64_t a1, uint64_t a2)
{
  return allocDeltaHeapObject(a1, *(_DWORD *)(a2 + 68) + 16);
}

void vdltinit(uint64_t a1, int a2)
{
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  char *v7;
  int v8;
  uint64_t v9;

  *(_DWORD *)(*(_QWORD *)(a1 + 200) + 248) = 16 * *(unsigned __int8 *)(a1 + 288) + 48;
  resetDeltaHeap();
  **(_QWORD **)(a1 + 200) = alloc_sync(a1);
  v4 = alloc_sync(a1);
  v5 = *(_QWORD **)(a1 + 200);
  v5[1] = v4;
  if (*v5 && v4 && recordDeltaHeapPos(a1))
  {
    CLRONESTM(**(_QWORD **)(a1 + 200));
    OUTLINED_FUNCTION_7_65();
    v6 = 0;
    v7 = (char *)&unk_2555014A8;
    while (v6 < *(unsigned __int8 *)(a1 + 288))
    {
      OUTLINED_FUNCTION_0_82();
      if (a2)
      {
        OUTLINED_FUNCTION_5_66();
        if (!v8)
          return;
      }
      ++v6;
      v7 += 96;
    }
    OUTLINED_FUNCTION_4_69();
    SETSPINEL(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 8), **(_QWORD **)(a1 + 200));
    v9 = *(_QWORD *)(a1 + 192);
    *(_QWORD *)(v9 + 8080) = 0;
    *(_WORD *)(v9 + 8088) = 256;
    *(_BYTE *)(v9 + 8090) = 1;
    *(_DWORD *)(v9 + 9080) = 1;
  }
}

uint64_t vscaninit(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 192);
  *(_QWORD *)(v1 + 8080) = 0;
  *(_WORD *)(v1 + 8088) = 256;
  *(_BYTE *)(v1 + 8090) = 1;
  return result;
}

uint64_t deltaReinit(uint64_t a1, int a2)
{
  unint64_t v4;
  char *v5;

  CLRONESTM(**(_QWORD **)(a1 + 200));
  OUTLINED_FUNCTION_7_65();
  v4 = 0;
  v5 = (char *)&unk_2555014A8;
  while (v4 < *(unsigned __int8 *)(a1 + 288))
  {
    OUTLINED_FUNCTION_0_82();
    if (a2)
      OUTLINED_FUNCTION_5_66();
    ++v4;
    v5 += 96;
  }
  OUTLINED_FUNCTION_4_69();
  return SETSPINEL(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 8), **(_QWORD **)(a1 + 200));
}

void vnstackCleanup(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 200) + 264);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 200) + 264) = 0;
  }
}

void OUTLINED_FUNCTION_0_82()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *v2 = 0;
  v3 = v1 + *(int *)(*(_QWORD *)(v0 + 192) + 9084);
  *(_QWORD *)(**(_QWORD **)(v0 + 200) + 8 * v3) |= 1uLL;
  v4 = v1 + *(int *)(*(_QWORD *)(v0 + 192) + 9084);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 200) + 8) + 8 * v4) |= 1uLL;
  v5 = v1 + *(int *)(*(_QWORD *)(v0 + 192) + 9084);
  *(_QWORD *)(**(_QWORD **)(v0 + 200) + 8 * v5) = *(_QWORD *)(**(_QWORD **)(v0 + 200) + 8 * v5) & 3 | *(_QWORD *)(*(_QWORD *)(v0 + 200) + 8);
  v6 = *(_QWORD *)(*(_QWORD *)(v0 + 200) + 8) + 8 * v1;
  *(_QWORD *)(v6 + 24) = *(_QWORD *)(v6 + 24) & 3 | **(_QWORD **)(v0 + 200);
}

void OUTLINED_FUNCTION_1_77(_WORD *a1@<X8>)
{
  __int16 v1;

  *a1 = v1;
}

void OUTLINED_FUNCTION_2_76(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_4_69()
{
  uint64_t v0;

  return SETSPINER(v0, **(_QWORD **)(v0 + 200), *(_QWORD *)(*(_QWORD *)(v0 + 200) + 8));
}

void OUTLINED_FUNCTION_5_66()
{
  uint64_t v0;
  char v1;

  vinit_stm(v0, v1);
}

double OUTLINED_FUNCTION_6_65(uint64_t a1, uint64_t a2)
{
  return **(double **)a2;
}

uint64_t OUTLINED_FUNCTION_7_65()
{
  uint64_t v0;

  return CLRONESTM(*(_QWORD *)(*(_QWORD *)(v0 + 200) + 8));
}

uint64_t print_delta(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, uint64_t a8, int a9, char a10, char a11)
{
  _DWORD *v15;
  uint64_t v16;
  int v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _BYTE *v22;
  _BYTE *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  _DWORD *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  int v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  _DWORD *v42;
  int i;
  int v44;
  int v45;
  int v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  signed int v54;
  int v55;
  uint64_t v56;
  uint64_t k;
  int v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  unint64_t v63;
  int v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  int off;
  uint64_t v69;
  int v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  char v74;
  unint64_t token;
  int v76;
  unint64_t v77;
  int v78;
  int v79;
  int v80;
  uint64_t v81;
  uint64_t j;
  int v83;
  int v84;
  uint64_t m;
  uint64_t sync;
  int v87;
  int v88;
  int n;
  unsigned __int8 *v90;
  uint64_t v91;
  int v92;
  int v93;
  uint64_t v94;
  char v95[16];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v95 = a4;
  *(_QWORD *)&v95[8] = a5;
  v15 = malloc_type_malloc(0x58uLL, 0x10300406A7A1B15uLL);
  if (!v15)
    return 0;
  v16 = (uint64_t)v15;
  v15[16] = a9 + 2;
  v15[6] = a9;
  *(_OWORD *)v15 = *(_OWORD *)v95;
  *((_QWORD *)v15 + 2) = a8;
  *((_BYTE *)v15 + 68) = a6;
  v17 = num_fields((uint64_t)v15);
  *(_DWORD *)(v16 + 28) = v17;
  v18 = (char *)malloc_type_calloc(v17 + 1, 0x10uLL, 0x1010040449DF08BuLL);
  *(_QWORD *)(v16 + 32) = v18;
  if (!v18)
    goto LABEL_20;
  v19 = 0;
  v20 = *(int *)(v16 + 28);
  v21 = v18 + 8;
  while (v19 <= v20)
  {
    *v21 = 0;
    v21 += 2;
    ++v19;
  }
  v22 = OUTLINED_FUNCTION_33_40();
  *(_QWORD *)(v16 + 72) = v22;
  if (!v22)
  {
LABEL_19:
    free_lines(v16);
LABEL_20:
    free((void *)v16);
    return 0;
  }
  v23 = OUTLINED_FUNCTION_33_40();
  *(_QWORD *)(v16 + 80) = v23;
  if (!v23)
  {
LABEL_18:
    *(_QWORD *)(v16 + 72) = OUTLINED_FUNCTION_12_55(*(int **)(v16 + 72));
    goto LABEL_19;
  }
  v24 = rb_alloc(*(_DWORD *)(v16 + 28), 0);
  *(_QWORD *)(v16 + 40) = v24;
  if (!v24)
  {
LABEL_17:
    *(_QWORD *)(v16 + 80) = OUTLINED_FUNCTION_12_55(*(int **)(v16 + 80));
    goto LABEL_18;
  }
  if (a6)
  {
    v25 = OUTLINED_FUNCTION_55_26();
    *(_QWORD *)(v16 + 48) = v25;
    if (!v25)
      goto LABEL_16;
  }
  else
  {
    *(_QWORD *)(v16 + 48) = 0;
  }
  if ((int)OUTLINED_FUNCTION_52_26() < 1)
  {
    *(_QWORD *)(v16 + 56) = 0;
  }
  else
  {
    v26 = OUTLINED_FUNCTION_55_26();
    *(_QWORD *)(v16 + 56) = v26;
    if (!v26)
    {
      rb_free(*(_QWORD **)(v16 + 48));
LABEL_16:
      rb_free(*(_QWORD **)(v16 + 40));
      goto LABEL_17;
    }
  }
  v28 = OUTLINED_FUNCTION_43_32();
  if (first_field(v28, v29, v30, v31))
  {
    v32 = 0;
    do
    {
      v33 = *(_QWORD *)(v16 + 32) + 16 * v32;
      *(_BYTE *)v33 = 0;
      *(_DWORD *)(v33 + 4) = 0;
      v34 = stream_name(0);
      v35 = 0;
      *(_QWORD *)(*(_QWORD *)(v16 + 32) + 16 * v32 + 8) = strdup(v34);
      while (1)
      {
        v36 = OUTLINED_FUNCTION_49_26();
        if (v35 >= v38)
          break;
        place_char(v36, v37, v35++, 32);
      }
      place_char(v36, v37, v35, 0);
      ++v32;
      v39 = OUTLINED_FUNCTION_43_32();
    }
    while (next_field(v39, v40, v41, v42));
  }
  for (i = 0; ; ++i)
  {
    v44 = *(_DWORD *)(v16 + 28);
    if (i >= *(_DWORD *)(v16 + 64))
      break;
    OUTLINED_FUNCTION_51_26(v16, v44, i);
  }
  place_char(v16, v44, i, 0);
  v45 = 0;
  while (1)
  {
    v46 = *(_DWORD *)(v16 + 28);
    if (v45 >= v46)
      break;
    left_delta(a1);
    v47 = OUTLINED_FUNCTION_49_26();
    register_sync(v47, v48, v49, 0);
    if (v50)
    {
      right_delta(a1);
      v51 = OUTLINED_FUNCTION_49_26();
      register_sync(v51, v52, v53, v54);
      ++v45;
      if (v55)
        continue;
    }
    goto LABEL_37;
  }
  if (!a7)
  {
    v81 = 0;
    for (j = 0; j < v46; ++j)
    {
      if (OUTLINED_FUNCTION_35_39())
      {
        OUTLINED_FUNCTION_22_47();
        if (!v83)
          goto LABEL_37;
        if (a11)
        {
          OUTLINED_FUNCTION_23_45();
          if (!v84)
            goto LABEL_37;
        }
      }
      v46 = *(_DWORD *)(v16 + 28);
      v81 += 16;
    }
  }
  v56 = 0;
  for (k = 0; k < v46; ++k)
  {
    if (!OUTLINED_FUNCTION_35_39())
    {
      OUTLINED_FUNCTION_22_47();
      if (!v58)
        goto LABEL_37;
      if (a11)
      {
        OUTLINED_FUNCTION_23_45();
        if (!v59)
          goto LABEL_37;
      }
    }
    v46 = *(_DWORD *)(v16 + 28);
    v56 += 16;
  }
  if (a7)
  {
    v60 = 0;
    while (v60 < v46)
    {
      v94 = v60;
      v61 = 16 * v60;
      if (!time_stream(*(char *)(*(_QWORD *)(v16 + 32) + 16 * v60)))
        goto LABEL_73;
      v62 = *(_BYTE *)(*(_QWORD *)(v16 + 32) + v61);
      if (OUTLINED_FUNCTION_11_58())
        goto LABEL_37;
      v63 = left_delta(a1);
      v64 = 0;
      while (1)
      {
        v65 = right_delta(a1);
        if (syncmark_equ(v63, v65))
          break;
        v66 = v63;
        do
        {
          v66 = sync_to_right(a1, v62, v66);
          v67 = hashLookupInt(*(_QWORD *)(v16 + 80), v66);
        }
        while (!v67);
        off = find_off(v67, v16, v66);
        OUTLINED_FUNCTION_34_39(v16, v94, off);
        v70 = find_off(v69, v16, v63);
        OUTLINED_FUNCTION_32_40(v16, v94, v70 + 1);
        if (v72)
          goto LABEL_37;
        v73 = v71;
        v74 = 1;
        while (1)
        {
          v63 = sync_to_right(a1, v62, v63);
          if (syncmark_equ(v63, v66))
            break;
          if (is_token_prev(v62, v63))
          {
            if ((v74 & 1) != 0)
              v64 = 0;
            token = prev_token(v62, v63);
            v74 = 0;
            v64 += OUTLINED_FUNCTION_41_35(token);
          }
        }
        if (is_token_prev(v62, v66))
        {
          if ((v74 & 1) != 0)
            v76 = 0;
          else
            v76 = v64;
          v77 = prev_token(v62, v66);
          v64 = OUTLINED_FUNCTION_41_35(v77) + v76;
          goto LABEL_68;
        }
        v63 = v66;
        if ((v74 & 1) == 0)
        {
LABEL_68:
          __sprintf_chk(v95, 0, 0x10uLL, "%i", v64);
          insert_token_name(v16, v94, v73, (uint64_t)v95);
          if (v78 == -1)
            goto LABEL_37;
          insert_padding(v16, v94, v78);
          v63 = v66;
          if (v79 == -1)
            goto LABEL_37;
        }
      }
      if (a11)
      {
        space_syncs(a1, v16, v94);
        if (!v80)
          goto LABEL_37;
      }
LABEL_73:
      v60 = v94 + 1;
      v46 = *(_DWORD *)(v16 + 28);
    }
  }
  if (a6)
  {
    for (m = 0; m < *(int *)(v16 + 64); ++m)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v16 + 40) + 16) + 8 * *(int *)(v16 + 28)) + m) == 43)
      {
        sync = find_sync(v16, m);
        v87 = absoluteSyncNum(a1, sync);
        __sprintf_chk(v95, 0, 6uLL, "%i", v87);
        rb_stradd(*(int **)(v16 + 48), m, (unsigned __int8 *)v95);
        if (!v88)
          goto LABEL_37;
      }
    }
  }
  if (OUTLINED_FUNCTION_11_58())
  {
LABEL_37:
    close_ddisp(v16);
    return 0;
  }
  if ((int)OUTLINED_FUNCTION_52_26() >= 1)
  {
    for (n = 0; n < (int)OUTLINED_FUNCTION_52_26(); ++n)
    {
      v90 = (unsigned __int8 *)pvlist_name();
      v91 = pvlist_val();
      if (v91)
      {
        v92 = find_off(v91, v16, v91);
        if ((v92 & 0x80000000) == 0)
        {
          rb_stradd(*(int **)(v16 + 56), v92, v90);
          if (!v93)
            goto LABEL_37;
        }
      }
    }
  }
  return v16;
}

void add_tokens(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int off;
  uint64_t v18;
  char v19;
  uint64_t v20;
  unsigned int sync;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  int v34;
  unint64_t token;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  int v44;
  int v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  _DWORD *v50;
  char *v51;
  int v52;
  char v53;
  uint64_t v54;
  int v55;
  int v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char *v60;
  int v61;
  int v62;
  unint64_t v63;
  int v64;
  int v65;
  uint64_t v66;
  int v67;
  int v68;
  char v69[81];
  uint64_t v70;

  v5 = a1;
  v70 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a2 + 32) + 16 * (int)a3;
  LOBYTE(v7) = *(_BYTE *)v6;
  v8 = *(_DWORD *)(v6 + 4);
  if (!checkInterrupt(a1))
  {
    v9 = left_delta(v5);
    v7 = (char)v7;
    while (1)
    {
      v10 = right_delta(v5);
      if (syncmark_equ(v9, v10))
        break;
      v11 = v9;
      do
      {
        v11 = sync_to_right(v5, v7, v11);
        v12 = hashLookupInt(*(_QWORD *)(a2 + 80), v11);
      }
      while (!v12);
      find_off(v12, a2, v11);
      v13 = OUTLINED_FUNCTION_2_77();
      OUTLINED_FUNCTION_34_39(v13, v14, v15);
      off = find_off(v16, a2, v9);
      OUTLINED_FUNCTION_32_40(a2, a3, off + 1);
      if (v19)
        break;
      v20 = v18;
      while (1)
      {
        v9 = sync_to_right(v5, v7, v9);
        if (syncmark_equ(v9, v11))
          break;
        sync = v20;
        while (col_next_sync(a2, sync) != -1)
        {
          v22 = OUTLINED_FUNCTION_40_36();
          if (!syncmark_order(v5, v22, v9))
            break;
          v23 = OUTLINED_FUNCTION_21_48();
          ensure_spaces(v23, v24, v25, v26);
          sync = v27;
          if (v27 == -1)
            return;
        }
        v28 = hashLookupInt(*(_QWORD *)(a2 + 72), sync);
        if (v28)
        {
          if (!syncmark_equ(*(_QWORD *)(v28 + 8), v9))
          {
            v29 = OUTLINED_FUNCTION_21_48();
            insert_space_0(v29, v30, v31);
            if (!v32)
              return;
          }
        }
        v33 = OUTLINED_FUNCTION_2_77();
        register_sync(v33, v34, v9, sync);
        if (is_token_prev(v7, v9))
        {
          v66 = v5;
          v63 = v9;
          token = prev_token(v7, v9);
          v64 = v7;
          v65 = v8;
          v37 = OUTLINED_FUNCTION_38_37(token, token, v36, v69);
          v38 = 0;
          v39 = (int)v20;
          v68 = v20;
          v40 = v37 + 1;
          v41 = (int)a3;
          while (1)
          {
            v42 = v37[v38];
            if (!v42
              || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 40) + 16) + 8 * (int)a3) + v39 + v38) != 32)
            {
              break;
            }
            v43 = OUTLINED_FUNCTION_2_77();
            place_char(v43, v44, v45, v46);
            ++v38;
            LODWORD(v20) = v20 + 1;
            ++v40;
          }
          while (1)
          {
            if (!v42)
              goto LABEL_28;
            OUTLINED_FUNCTION_53_26();
            if (*(_BYTE *)(*(_QWORD *)(v47 + 8 * v41) + v39 + v38) != 124
              || *(_BYTE *)(*(_QWORD *)(v47 + 8 * *(int *)(a2 + 28)) + v39 + v38 + 1) == 43)
            {
              break;
            }
            OUTLINED_FUNCTION_31_40(a2, a3);
            v48 = OUTLINED_FUNCTION_2_77();
            place_char_in_stream(v48, v49);
            OUTLINED_FUNCTION_51_26(a2, *(_DWORD *)(a2 + 28), v68 + v38);
            place_char(a2, *(_DWORD *)(a2 + 28), v68 + v38 + 1, 43);
            v67 = v20;
            v20 = v39;
            v50 = (_DWORD *)hashLookupInt(*(_QWORD *)(a2 + 72), v68 + (int)v38);
            *v50 = v68 + v38 + 1;
            hashDeleteInt();
            hashInsertInt(*(_QWORD *)(a2 + 72), v68 + v38 + 1, (uint64_t)v50);
            v51 = &v37[v38];
            place_char(a2, a3, v68 + v38, v37[v38]);
            ++v38;
            v42 = v51[1];
            v39 = v20;
            v41 = (int)a3;
            LODWORD(v20) = v67 + 1;
            ++v40;
          }
          v42 = 1;
LABEL_28:
          while (v42)
          {
            insert_space_0(a2, a3, v20);
            if (!v52)
              return;
            place_char(a2, a3, v20, *(v40 - 1));
            v53 = *v40++;
            v42 = v53;
            LODWORD(v20) = v20 + 1;
          }
          if ((_DWORD)v20 == -1)
            return;
          OUTLINED_FUNCTION_32_40(a2, a3, v20);
          if (v19)
            return;
          v54 = OUTLINED_FUNCTION_21_48();
          sync = next_sync(v54, v55, v56);
          v5 = v66;
          v7 = v64;
          v8 = v65;
          v9 = v63;
        }
        insert_padding(a2, a3, sync + 1);
        v20 = v57;
        if ((_DWORD)v57 == -1)
          return;
      }
      v9 = v11;
      if (is_token_prev(v7, v11))
      {
        v58 = prev_token(v7, v11);
        v60 = OUTLINED_FUNCTION_38_37(v58, v58, v59, v69);
        insert_token_name(a2, a3, v20, (uint64_t)v60);
        if (v61 == -1)
          break;
        OUTLINED_FUNCTION_17_50(v61);
        v9 = v11;
        if (v62 == -1)
          break;
      }
    }
  }
}

void space_syncs(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  int v6;
  int i;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;

  if (!checkInterrupt(a1))
  {
    v5 = OUTLINED_FUNCTION_2_77();
    for (i = next_sync(v5, v6, 1); i < *(_DWORD *)(a2 + 64); i = next_sync(v13, v14, v15))
    {
      OUTLINED_FUNCTION_53_26();
      if (*(_BYTE *)(*(_QWORD *)(v8 + 8 * a3) + i - 1) == 124)
      {
        v9 = OUTLINED_FUNCTION_7_66();
        insert_space_0(v9, v10, v11);
        if (!v12)
          break;
      }
      v13 = OUTLINED_FUNCTION_2_77();
    }
  }
  OUTLINED_FUNCTION_0_83();
}

void close_ddisp(uint64_t a1)
{
  if (a1)
  {
    *(_QWORD *)(a1 + 80) = OUTLINED_FUNCTION_12_55(*(int **)(a1 + 80));
    *(_QWORD *)(a1 + 72) = hashDelete(*(int **)(a1 + 72), 0, 1);
    rb_free(*(_QWORD **)(a1 + 40));
    rb_free(*(_QWORD **)(a1 + 48));
    rb_free(*(_QWORD **)(a1 + 56));
    free_lines(a1);
    free((void *)a1);
  }
}

BOOL sync_in_ticks(uint64_t a1, int a2)
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 8 * *(int *)(a1 + 28)) + a2) == 43;
}

uint64_t find_sync(uint64_t a1, unsigned int a2)
{
  uint64_t v4;

  do
    v4 = hashLookupInt(*(_QWORD *)(a1 + 72), a2--);
  while (!v4);
  return *(_QWORD *)(v4 + 8);
}

uint64_t find_off(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int *v3;

  v3 = (unsigned int *)hashLookupInt(*(_QWORD *)(a2 + 80), a3);
  if (v3)
    return *v3;
  else
    return 0xFFFFFFFFLL;
}

void lf_print_delta(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, _BYTE *a5, int a6, int a7, uint64_t a8, int a9, char a10, char a11, int a12)
{
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int i;
  int v38;
  int j;
  char v40;
  char v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int k;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  int v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  int v64;
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  unsigned int *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unsigned int v96;
  uint64_t v97;
  uint64_t v98;
  _BYTE v99[80];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v97 = 0;
  v98 = 0;
  if (a12)
    v17 = a12;
  else
    v17 = 77;
  fill_stream_list(a1, (int *)&v97, a5);
  if (v20)
  {
    v21 = print_delta(a1, v18, v19, v97, v98, a6, a7, a8, a9, 0, a11);
    if (v21)
    {
      v22 = v21;
      v95 = a1;
      v96 = a2;
      v23 = 0;
      v24 = 0;
      v25 = 16 * (*(_DWORD *)(v21 + 28) & ~(*(int *)(v21 + 28) >> 31));
      while (v25 != v23)
      {
        v26 = *(_QWORD *)(v22 + 32) + v23;
        v27 = strlen(*(const char **)(v26 + 8));
        if (*(_DWORD *)(v26 + 4))
          v28 = 3;
        else
          v28 = 2;
        v29 = v28 + v27;
        if (v24 <= v29)
          v24 = v29;
        v23 += 16;
      }
      __memset_chk();
      LODWORD(v30) = 0;
      v99[v24] = 0;
      HIDWORD(v94) = v17 - v24;
LABEL_15:
      while ((v30 & 0x80000000) == 0)
      {
        v31 = *(_DWORD *)(v22 + 64);
        if ((int)v30 >= v31)
          break;
        v32 = 0;
        v33 = v30 + HIDWORD(v94);
        if ((int)v30 + HIDWORD(v94) >= v31)
          v34 = *(_DWORD *)(v22 + 64);
        else
          v34 = v30 + HIDWORD(v94);
        v35 = *(_DWORD *)(v22 + 28) & ~(*(int *)(v22 + 28) >> 31);
        v36 = v34;
        while ((_DWORD)v32 != v35)
        {
          for (i = v34; i > (int)v30; --i)
          {
            can_split_stream_line(v22, v32, i);
            if (v38)
              break;
          }
          if (v36 >= i)
            v36 = i;
          v32 = (v32 + 1);
        }
        if (*(_BYTE *)(v22 + 68))
        {
          for (j = 0; j < (int)rb_lines(*(unsigned int **)(v22 + 48)); ++j)
          {
            OUTLINED_FUNCTION_20_49();
            OUTLINED_FUNCTION_37_38();
            if (v40 == v41)
              OUTLINED_FUNCTION_20_49();
            OUTLINED_FUNCTION_25_45();
            if (v36 >= v42)
            {
              OUTLINED_FUNCTION_20_49();
              OUTLINED_FUNCTION_37_38();
              if (v40 == v41)
                OUTLINED_FUNCTION_20_49();
              OUTLINED_FUNCTION_25_45();
              v36 = v43;
            }
          }
        }
        v44 = (uint64_t)OUTLINED_FUNCTION_14_53();
        if ((int)v44 >= 1)
        {
          for (k = 0; ; ++k)
          {
            v44 = (uint64_t)OUTLINED_FUNCTION_14_53();
            if (k >= (int)v44)
              break;
            OUTLINED_FUNCTION_13_53();
            OUTLINED_FUNCTION_37_38();
            if (v40 == v41)
              OUTLINED_FUNCTION_13_53();
            OUTLINED_FUNCTION_24_45();
            if (v36 >= v52)
            {
              OUTLINED_FUNCTION_13_53();
              OUTLINED_FUNCTION_37_38();
              if (v40 == v41)
                OUTLINED_FUNCTION_13_53();
              OUTLINED_FUNCTION_24_45();
              v36 = v53;
            }
          }
        }
        if (v36 == (_DWORD)v30)
        {
          if (v33 >= *(_DWORD *)(v22 + 64))
            v36 = *(_DWORD *)(v22 + 64);
          else
            v36 = v30 + HIDWORD(v94);
        }
        v54 = 0;
        while (1)
        {
          v55 = *(int *)(v22 + 28);
          if (v54 >= v55)
            break;
          v56 = *(_QWORD *)(v22 + 32);
          if (*(int *)(v56 + 16 * v54 + 4) < 1)
          {
            v57 = 0;
          }
          else
          {
            heading_string_buf[0] = 32;
            v57 = 1u;
          }
          for (m = 0; ; ++m)
          {
            v59 = *(unsigned __int8 *)(*(_QWORD *)(v56 + 16 * v54 + 8) + m);
            if (!v59)
              break;
            heading_string_buf[v57 + m] = v59;
            v56 = *(_QWORD *)(v22 + 32);
          }
          v60 = v57 + m;
          v61 = (v57 + m);
          v62 = 58;
          do
          {
            heading_string_buf[v61] = v62;
            v61 = v60 + 1;
            LODWORD(v57) = v57 + 1;
            v62 = 32;
            ++v60;
          }
          while (v24 > (int)m + (int)v57);
          heading_string_buf[(m + v57)] = 0;
          v63 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v22 + 40) + 16) + 8 * v54);
          OUTLINED_FUNCTION_9_62();
          next_stream_split();
          v65 = v64;
          OUTLINED_FUNCTION_8_63();
          next_stream_split();
          lf_put_disp_line(v95, v96, (uint64_t)heading_string_buf, v63, v30, v65);
          v44 = OUTLINED_FUNCTION_11_58();
          ++v54;
          if ((_DWORD)v44)
          {
LABEL_74:
            LODWORD(v30) = -1;
            goto LABEL_15;
          }
        }
        if (*(_BYTE *)(v22 + 68))
        {
          OUTLINED_FUNCTION_5_67(v44, v45, v46, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v22 + 40) + 16) + 8 * v55), v47, v48, v49, v50, v92, HIDWORD(v92), v93, v94);
          v66 = 0;
          while (v66 < (int)rb_lines(*(unsigned int **)(v22 + 48)))
          {
            OUTLINED_FUNCTION_45_29(*(_QWORD *)(v22 + 48));
            OUTLINED_FUNCTION_9_62();
            next_abs_split();
            OUTLINED_FUNCTION_8_63();
            next_abs_split();
            OUTLINED_FUNCTION_3_75(v67, v68, v69, v70, v71, v72, v73, v74);
            ++v66;
            if (OUTLINED_FUNCTION_11_58())
              goto LABEL_74;
          }
        }
        v75 = OUTLINED_FUNCTION_14_53();
        if ((_DWORD)v75)
        {
          OUTLINED_FUNCTION_5_67((uint64_t)v75, v76, v77, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v22 + 40) + 16) + 8 * *(int *)(v22 + 28)), v78, v79, v80, v81, v92, HIDWORD(v92), v93, v94);
          v82 = 0;
          while (v82 < (int)OUTLINED_FUNCTION_14_53())
          {
            OUTLINED_FUNCTION_45_29(*(_QWORD *)(v22 + 56));
            OUTLINED_FUNCTION_9_62();
            next_ptr_split();
            OUTLINED_FUNCTION_8_63();
            next_ptr_split();
            OUTLINED_FUNCTION_3_75(v83, v84, v85, v86, v87, v88, v89, v90);
            ++v82;
            if (OUTLINED_FUNCTION_11_58())
              goto LABEL_74;
          }
        }
        vf_puts(v95, v96, (uint64_t)"\n", 1);
        v30 = v36;
        if (v36 <= v33)
          v91 = v33;
        else
          v91 = v36;
        while (v30 < v33)
        {
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v22 + 40) + 16) + 8 * *(int *)(v22 + 28)) + v30) == 43)
            goto LABEL_15;
          ++v30;
        }
        LODWORD(v30) = v91;
      }
      close_ddisp(v22);
    }
  }
}

void free_lines(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  char *v4;

  v2 = 0;
  for (i = 8; ; i += 16)
  {
    v4 = *(char **)(a1 + 32);
    if (v2 > *(int *)(a1 + 28))
      break;
    free(*(void **)&v4[i]);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + i) = 0;
    ++v2;
  }
  free(v4);
  *(_QWORD *)(a1 + 32) = 0;
}

void delta_erase(uint64_t *a1, uint64_t a2, uint64_t a3, int a4, unsigned int a5)
{
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  char v19;
  uint64_t v20;
  uint64_t sync;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;

  if (*(_DWORD *)(a2 + 28) <= (int)a3)
    goto LABEL_17;
  if (a4 == a5)
  {
    OUTLINED_FUNCTION_53_26();
    v10 = (int)a3;
    if (*(_BYTE *)(*(_QWORD *)(v11 + 8 * (int)a3) + a4) == 124)
    {
      v12 = *(char *)(*(_QWORD *)(a2 + 32) + 16 * (int)a3);
      v13 = OUTLINED_FUNCTION_10_61();
      if (can_del_sync((uint64_t)a1, v12, v13))
      {
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + 32) + 16 * (int)a3);
        v15 = OUTLINED_FUNCTION_10_61();
        if (del_sync((uint64_t)a1, v14, v15))
        {
          v16 = OUTLINED_FUNCTION_7_66();
          unregister_sync(v16, v17, v18);
          update_token(a2, a3, (a4 - 1));
        }
      }
      goto LABEL_17;
    }
  }
  else
  {
    v10 = (int)a3;
  }
  v19 = *(_BYTE *)(*(_QWORD *)(a2 + 32) + 16 * v10);
  v20 = OUTLINED_FUNCTION_10_61();
  sync = find_sync(a2, a5);
  if (del_two_point(a1, v19, v20, sync))
  {
    v22 = OUTLINED_FUNCTION_7_66();
    v25 = prev_sync(v22, v23, v24);
    v26 = OUTLINED_FUNCTION_2_77();
    v28 = v25;
    v29 = (int)(next_sync(v26, v27, a5) - 1);
    v30 = v25 + 1;
    while (v28 < v29)
    {
      OUTLINED_FUNCTION_53_26();
      v31 = OUTLINED_FUNCTION_7_66();
      if (v34 == 124)
        unregister_sync(v31, v32, v33);
      else
        OUTLINED_FUNCTION_31_40(v31, v32);
      ++v30;
      ++v28;
    }
  }
LABEL_17:
  OUTLINED_FUNCTION_4_70();
}

void unregister_sync(uint64_t a1, int a2, int a3)
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  unsigned int v9;

  if (a3 && *(_DWORD *)(a1 + 64) - 1 != a3)
  {
    OUTLINED_FUNCTION_31_40(a1, a2);
    v5 = 0;
    v6 = *(_DWORD *)(a1 + 28);
    while (8 * (v6 & ~(v6 >> 31)) != v5)
    {
      v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + v5) + a3);
      v5 += 8;
      if (v7 == 124)
        return;
    }
    OUTLINED_FUNCTION_51_26(a1, v6, a3);
    v8 = OUTLINED_FUNCTION_2_77();
    find_sync(v8, v9);
    hashDeleteInt();
    hashDeleteInt();
    if (*(_BYTE *)(a1 + 68))
      rb_strdel(*(_QWORD *)(a1 + 48), a3);
    if (rb_lines(*(unsigned int **)(a1 + 56)))
      rb_strdel(*(_QWORD *)(a1 + 56), a3);
  }
}

unint64_t update_token(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  int sync;
  int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t result;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int i;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  char *v26;
  int v27;
  char v28[81];
  uint64_t v29;

  v3 = a3;
  v4 = a2;
  v29 = *MEMORY[0x24BDAC8D0];
  sync = prev_sync(a1, a2, a3);
  v7 = next_sync(a1, v4, v3);
  v8 = *(char *)(*(_QWORD *)(a1 + 32) + 16 * v4);
  v9 = OUTLINED_FUNCTION_49_26();
  v11 = find_sync(v9, v10);
  result = prev_token(v8, v11);
  if (result)
  {
    v13 = result;
    v14 = v4;
    v15 = v4;
    v16 = sync + 1;
    for (i = v16; i < v7; ++i)
      OUTLINED_FUNCTION_31_40(a1, v4);
    OUTLINED_FUNCTION_32_40(a1, v4, v16);
    if (v19)
    {
      return 0;
    }
    else
    {
      v20 = v18;
      v21 = 0;
      v22 = 16 * v14;
      v23 = v18;
      while (v14 + v21 < *(int *)(a1 + 28))
      {
        v24 = *(_QWORD *)(a1 + 32);
        v25 = *(unsigned __int8 *)(v24 + v22);
        if (v25 != *(unsigned __int8 *)(v24 + 16 * v14))
          break;
        v26 = field_value((char)v25, v13, *(_DWORD *)(v24 + v22 + 4), v28);
        insert_token_name(a1, (v15 + v21), v20, (uint64_t)v26);
        if (v27 == -1)
          return 0;
        if (v23 <= v27)
          v23 = v27;
        v22 += 16;
        ++v21;
      }
      OUTLINED_FUNCTION_32_40(a1, v15, v23);
      return !v19;
    }
  }
  return result;
}

uint64_t prev_sync(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(int *)(a1 + 28);
  if ((int)a3 >= -1)
    result = 0xFFFFFFFFLL;
  else
    result = a3;
  if ((int)v4 <= (int)a2)
  {
    while ((a3 & 0x80000000) == 0)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 8 * v4) + a3) == 43)
        return OUTLINED_FUNCTION_28_41(result, a2, a3);
      a3 = (a3 - 1);
    }
  }
  else if ((a3 & 0x80000000) == 0)
  {
    while (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 8 * (int)a2) + a3) != 124)
    {
      a3 = (a3 - 1);
      if ((a3 & 0x80000000) != 0)
        return result;
    }
    return OUTLINED_FUNCTION_28_41(result, a2, a3);
  }
  return result;
}

uint64_t next_sync(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  v3 = *(int *)(a1 + 28);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  result = a3;
  if ((int)v3 <= a2)
  {
    v7 = *(_QWORD *)(v4 + 8 * v3);
    while (*(_BYTE *)(v7 + result) && *(_BYTE *)(v7 + result) != 43)
      ++result;
  }
  else
  {
    v6 = *(_QWORD *)(v4 + 8 * a2);
    while (*(_BYTE *)(v6 + result) && *(_BYTE *)(v6 + result) != 124)
      ++result;
  }
  return result;
}

void place_char_in_stream(uint64_t a1, int a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t i;

  v3 = a2;
  v4 = a2;
  v5 = 16 * a2;
  while (v4 >= 1)
  {
    if (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16 * --v4) != *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + v5))
      break;
    OUTLINED_FUNCTION_39_36(a1, v4);
  }
  for (i = v5;
        v3 < *(int *)(a1 + 28)
     && *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + i) == *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + v5);
        i += 16)
  {
    OUTLINED_FUNCTION_39_36(a1, v3++);
  }
  OUTLINED_FUNCTION_16_50();
}

void insert_spaces(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t i;
  int v9;
  int *v10;
  int v11;
  int space_or_sync;
  int v13;
  int v14;
  int v15;

  for (i = 0; ; i = (i + 1))
  {
    v9 = *(_DWORD *)(a1 + 28);
    if ((int)i >= v9)
      break;
    if (a2 == (_DWORD)i)
    {
      v10 = *(int **)(a1 + 40);
      v11 = a2;
      space_or_sync = a3;
    }
    else
    {
      space_or_sync = next_space_or_sync(a1, i, a3);
      v10 = *(int **)(a1 + 40);
      v11 = i;
    }
    rb_inscn(v10, v11, space_or_sync, 32, a4);
    if (!v13)
      goto LABEL_11;
  }
  rb_inscn(*(int **)(a1 + 40), v9, a3, 45, a4);
  if (v14)
  {
    shift_table_right(*(_QWORD *)(a1 + 72), a3, *(_DWORD *)(a1 + 64), a4);
    *(_DWORD *)(a1 + 64) += a4;
    OUTLINED_FUNCTION_56_25(*(_QWORD *)(a1 + 48));
    if (v15)
      OUTLINED_FUNCTION_56_25(*(_QWORD *)(a1 + 56));
  }
LABEL_11:
  OUTLINED_FUNCTION_15_51();
}

uint64_t next_space_or_sync(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 *i;
  int v4;

  for (i = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 8 * (int)a2) + (int)a3); ; ++i)
  {
    v4 = *i;
    if (v4 != 39)
      break;
    if (i[1] == 32 && i[2] == 39)
    {
      LODWORD(a3) = a3 + 2;
      i += 2;
    }
LABEL_10:
    a3 = (a3 + 1);
  }
  if (*i && v4 != 32 && v4 != 124)
    goto LABEL_10;
  return OUTLINED_FUNCTION_28_41(a1, a2, a3);
}

void shift_table_right(uint64_t a1, int a2, unsigned int a3, int a4)
{
  signed int v7;
  _DWORD *v8;

  v7 = a4 + a2;
  while ((int)(a4 + a3) >= v7)
  {
    v8 = (_DWORD *)hashMoveInt(a1, a3, a4 + a3);
    if (v8)
      *v8 = a4 + a3;
    --a3;
  }
  OUTLINED_FUNCTION_16_50();
}

void place_char(uint64_t a1, int a2, int a3, char a4)
{
  rb_putc(*(_QWORD *)(a1 + 40), a2, a3, a4);
}

void place_sync(uint64_t a1, uint64_t a2, int a3, signed int a4)
{
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  unsigned int sync;
  _QWORD *v26;
  uint64_t v27;
  int v28;
  char v29[6];

  preceded_by_token(a2, a3);
  if (v8)
  {
    v9 = OUTLINED_FUNCTION_6_66();
    followed_by_token(v9, v10);
    if (v11)
      return;
    v21 = *(char *)(*(_QWORD *)(a2 + 32) + 16 * a3);
    v22 = OUTLINED_FUNCTION_6_66();
    sync = next_sync(v22, v23, v24);
    v17 = OUTLINED_FUNCTION_36_39(sync);
    v18 = a1;
    v19 = v21;
    v20 = 1;
  }
  else
  {
    v12 = *(char *)(*(_QWORD *)(a2 + 32) + 16 * a3);
    v13 = OUTLINED_FUNCTION_6_66();
    v16 = prev_sync(v13, v14, v15);
    v17 = OUTLINED_FUNCTION_36_39(v16);
    v18 = a1;
    v19 = v12;
    v20 = 0;
  }
  v26 = ins_sync(v18, v19, v17, v20);
  place_char_in_stream(a2, a3);
  OUTLINED_FUNCTION_54_26();
  if (*(_BYTE *)(v27 + a4) != 43 && new_sync(a2, (uint64_t)v26, a4))
  {
    if (*(_BYTE *)(a2 + 68))
    {
      v28 = OUTLINED_FUNCTION_42_34();
      __sprintf_chk(v29, 0, 6uLL, "%i", v28);
      rb_stradd(*(int **)(a2 + 48), a4, (unsigned __int8 *)v29);
    }
  }
}

void preceded_by_token(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  if (*(_DWORD *)(a1 + 28) > a2)
  {
    OUTLINED_FUNCTION_29_40();
    prev_non_blank(v3, v4, (v2 - 1));
  }
  OUTLINED_FUNCTION_30_40();
}

void followed_by_token(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  if (*(_DWORD *)(a1 + 28) > a2)
  {
    OUTLINED_FUNCTION_29_40();
    next_non_blank(v3, v4, (v2 + 1));
  }
  OUTLINED_FUNCTION_30_40();
}

void *new_sync(uint64_t a1, uint64_t a2, unsigned int a3)
{
  void *v6;
  _DWORD *v8;
  int v9;
  int v10;

  if (!hashLookupInt(*(_QWORD *)(a1 + 72), a3) && !hashLookupInt(*(_QWORD *)(a1 + 80), a2))
  {
    v8 = malloc_type_malloc(0x10uLL, 0x10800407411B482uLL);
    v6 = v8;
    if (!v8)
      return v6;
    *v8 = a3;
    *((_QWORD *)v8 + 1) = a2;
    hashInsertInt(*(_QWORD *)(a1 + 72), a3, (uint64_t)v8);
    if (v9)
    {
      hashInsertInt(*(_QWORD *)(a1 + 80), a2, (uint64_t)v6);
      if (v10)
      {
        place_char(a1, *(_DWORD *)(a1 + 28), a3, 43);
        return v6;
      }
    }
    free(v6);
  }
  return 0;
}

void insert_token(uint64_t *a1, uint64_t a2, uint64_t a3, unsigned int a4, char *a5, uint64_t a6)
{
  int v12;
  uint64_t v13;
  signed int sync;

  v12 = *(char *)(*(_QWORD *)(a2 + 32) + 16 * (int)a3);
  v13 = OUTLINED_FUNCTION_44_30((uint64_t)a1, a2, a3, a4);
  if (ins_tok_named(a1, v12, a6, a5, v13) && update_token(a2, a3, a4 - 1))
  {
    sync = next_sync(a2, a3, a4);
    change_field(a1, a2, a3, sync, (uint64_t)a5, a6);
  }
  else
  {
    OUTLINED_FUNCTION_4_70();
  }
}

void change_field(uint64_t *a1, uint64_t a2, uint64_t a3, signed int a4, uint64_t a5, uint64_t a6)
{
  char *v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int i;
  uint64_t v20;
  int v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;

  v10 = (char *)(*(_QWORD *)(a2 + 32) + 16 * (int)a3);
  v11 = *v10;
  v12 = *((_DWORD *)v10 + 1);
  v13 = OUTLINED_FUNCTION_44_30((uint64_t)a1, a2, a3, a4);
  set_fld_value(a1, v11, v12, a6, a5, v13);
  if (v14)
  {
    v15 = OUTLINED_FUNCTION_2_77();
    v18 = prev_sync(v15, v16, v17) + 1;
    for (i = v18; ; ++i)
    {
      v20 = OUTLINED_FUNCTION_2_77();
      if (i >= a4)
        break;
      place_char(v20, v21, i, 32);
    }
    OUTLINED_FUNCTION_32_40(v20, v21, v18);
    if (!v22)
    {
      v23 = OUTLINED_FUNCTION_2_77();
      insert_token_name(v23, v24, v25, a5);
      if (v26 != -1)
        OUTLINED_FUNCTION_17_50(v26);
    }
  }
  OUTLINED_FUNCTION_4_70();
}

void insert_padding(uint64_t a1, int a2, int a3)
{
  ensure_spaces(a1, a2, a3, *(_DWORD *)(a1 + 24));
}

void insert_token_name(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v6;
  uint64_t v7;
  char *i;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v4 = a2;
  v6 = (int)a2;
  v7 = (int)a3;
  for (i = (char *)(a4 + 1); ; ++i)
  {
    v9 = *(i - 1);
    if (!v9)
      break;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 8 * v6) + v7) == 124)
    {
      v9 = 1;
      break;
    }
    OUTLINED_FUNCTION_27_41(a1, a2, a3, v9);
    ++v7;
  }
  while (v9)
  {
    insert_space_0(a1, v4, v7);
    if (!(_DWORD)v10)
      break;
    OUTLINED_FUNCTION_27_41(v10, v11, v12, *(i - 1));
    v13 = *i++;
    v9 = v13;
    LODWORD(v7) = v7 + 1;
  }
  OUTLINED_FUNCTION_15_51();
}

uint64_t col_prev_sync(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((int)a2 >= -1)
    result = 0xFFFFFFFFLL;
  else
    result = a2;
  if ((a2 & 0x80000000) == 0)
  {
    while (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 8 * *(int *)(a1 + 28)) + a2) == 45)
    {
      a2 = (a2 - 1);
      if ((a2 & 0x80000000) != 0)
        return result;
    }
    return a2;
  }
  return result;
}

uint64_t col_next_sync(uint64_t a1, unsigned int a2)
{
  unsigned __int8 *v2;
  int v3;
  int v4;

  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 8 * *(int *)(a1 + 28)) + (int)a2);
  while (1)
  {
    v4 = *v2++;
    v3 = v4;
    if (v4 != 45)
      break;
    ++a2;
  }
  if (v3 == 43)
    return a2;
  else
    return 0xFFFFFFFFLL;
}

uint64_t prev_non_blank(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  BOOL v5;

  v3 = *(_DWORD *)(a1 + 28);
  if (v3 <= (int)a2)
  {
    if ((a3 & 0x80000000) == 0 && v3 == (_DWORD)a2)
    {
      while (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 8 * (int)a2) + a3) == 45)
      {
        v5 = (int)a3 <= 0;
        a3 = (a3 - 1);
        if (v5)
        {
          a3 = 0xFFFFFFFFLL;
          return OUTLINED_FUNCTION_28_41(a1, a2, a3);
        }
      }
    }
  }
  else
  {
    if ((int)a3 >= -1)
      v4 = 0xFFFFFFFFLL;
    else
      v4 = a3;
    if ((a3 & 0x80000000) != 0)
    {
LABEL_8:
      a3 = v4;
    }
    else
    {
      while (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 8 * (int)a2) + a3) == 32)
      {
        a3 = (a3 - 1);
        if ((a3 & 0x80000000) != 0)
          goto LABEL_8;
      }
    }
  }
  return OUTLINED_FUNCTION_28_41(a1, a2, a3);
}

uint64_t next_non_blank(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  unsigned __int8 *v4;
  int v5;
  unsigned __int8 *v6;
  int v7;

  v3 = *(_DWORD *)(a1 + 28);
  if (v3 <= (int)a2)
  {
    if (v3 == (_DWORD)a2)
    {
      v6 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 8 * (int)a2) + (int)a3);
      LODWORD(a3) = a3 + 1;
      do
      {
        v7 = *v6--;
        a3 = (a3 - 1);
      }
      while (v7 == 45);
    }
  }
  else
  {
    v4 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 8 * (int)a2) + (int)a3);
    LODWORD(a3) = a3 - 1;
    do
    {
      v5 = *v4++;
      a3 = (a3 + 1);
    }
    while (v5 == 32);
  }
  return OUTLINED_FUNCTION_28_41(a1, a2, a3);
}

uint64_t num_to_sync(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t i;
  uint64_t v6;
  uint64_t v7;

  for (i = 0; i < *(int *)(a2 + 64); ++i)
  {
    OUTLINED_FUNCTION_54_26();
    if (*(_BYTE *)(v6 + i) == 43)
    {
      v7 = OUTLINED_FUNCTION_40_36();
      if (OUTLINED_FUNCTION_42_34() == a3)
        return v7;
    }
  }
  return 0;
}

void bet_tokens()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;

  OUTLINED_FUNCTION_48_27();
  preceded_by_token(v2, v3);
  if (v4)
    followed_by_token(v1, v0);
  OUTLINED_FUNCTION_0_83();
}

void ensure_spaces(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v5;

  v5 = a3;
  while (a4 >= 1)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 8 * a2) + v5) != 32)
    {
      insert_spaces(a1, a2, v5, a4);
      break;
    }
    ++v5;
    --a4;
  }
  OUTLINED_FUNCTION_30_40();
}

void register_sync(uint64_t a1, int a2, uint64_t a3, signed int a4)
{
  OUTLINED_FUNCTION_34_39(a1, a2, a4);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 8 * *(int *)(a1 + 28)) + a4) != 43)
    new_sync(a1, a3, a4);
  OUTLINED_FUNCTION_0_83();
}

void insert_space_0(uint64_t a1, int a2, int a3)
{
  int i;
  int v7;
  int *v8;
  int v9;
  int space_or_sync;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;

  for (i = 0; ; ++i)
  {
    v7 = *(_DWORD *)(a1 + 28);
    if (i >= v7)
      break;
    if (a2 == i)
    {
      v8 = *(int **)(a1 + 40);
      v9 = a2;
      space_or_sync = a3;
    }
    else
    {
      v11 = OUTLINED_FUNCTION_6_66();
      space_or_sync = next_space_or_sync(v11, v12, v13);
      v8 = *(int **)(a1 + 40);
      v9 = i;
    }
    rb_insc(v8, v9, space_or_sync, 32);
    if (!v14)
      goto LABEL_11;
  }
  rb_insc(*(int **)(a1 + 40), v7, a3, 45);
  if (v15)
  {
    shift_table_right(*(_QWORD *)(a1 + 72), a3, *(_DWORD *)(a1 + 64), 1);
    ++*(_DWORD *)(a1 + 64);
    OUTLINED_FUNCTION_47_28(*(_QWORD *)(a1 + 48));
    if (v16)
      OUTLINED_FUNCTION_47_28(*(_QWORD *)(a1 + 56));
  }
LABEL_11:
  OUTLINED_FUNCTION_0_83();
}

void prev_abs_split()
{
  int v0;
  int v1;
  int v2;

  OUTLINED_FUNCTION_1_78();
  while (v0 > v1)
  {
    OUTLINED_FUNCTION_18_49();
    if (v2)
      break;
    --v0;
  }
  OUTLINED_FUNCTION_0_83();
}

void prev_ptr_split()
{
  int v0;
  int v1;
  int v2;

  OUTLINED_FUNCTION_1_78();
  while (v0 > v1)
  {
    OUTLINED_FUNCTION_19_49();
    if (v2)
      break;
    --v0;
  }
  OUTLINED_FUNCTION_0_83();
}

void lf_put_disp_line(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  int v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  int v20;
  _BYTE *i;
  int j;
  uint64_t v23;
  uint64_t v24;

  OUTLINED_FUNCTION_48_27();
  v17 = v16;
  v18 = *(_BYTE *)(v14 + v16);
  *(_BYTE *)(v14 + v16) = 0;
  v19 = v14 + v15;
  if (!v20)
    goto LABEL_6;
  for (i = (_BYTE *)(v14 + v15); *i == 32; ++i)
    ;
  if (*i)
  {
LABEL_6:
    OUTLINED_FUNCTION_26_43(v11, v12, v13);
    for (j = (a6 - a5) & ~((a6 - a5) >> 31); j; --j)
      vf_puts(v7, v6, (uint64_t)" ", 0);
    vf_puts(v7, v6, v19, 0);
    OUTLINED_FUNCTION_26_43(v23, v24, (uint64_t)"\n");
  }
  *(_BYTE *)(a4 + v17) = v18;
}

void next_stream_split()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  OUTLINED_FUNCTION_1_78();
  while (v0 < v1)
  {
    can_split_stream_line(v3, v2, v0);
    if (v4)
      break;
    ++v0;
  }
  OUTLINED_FUNCTION_0_83();
}

void next_abs_split()
{
  int v0;
  int v1;
  int v2;

  OUTLINED_FUNCTION_1_78();
  while (v0 < v1)
  {
    OUTLINED_FUNCTION_18_49();
    if (v2)
      break;
    ++v0;
  }
  OUTLINED_FUNCTION_0_83();
}

void next_ptr_split()
{
  int v0;
  int v1;
  int v2;

  OUTLINED_FUNCTION_1_78();
  while (v0 < v1)
  {
    OUTLINED_FUNCTION_19_49();
    if (v2)
      break;
    ++v0;
  }
  OUTLINED_FUNCTION_0_83();
}

void can_split_stream_line(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_DWORD *)(a1 + 64) != a3)
  {
    OUTLINED_FUNCTION_29_40();
    if (*(_BYTE *)(v3 + (int)v6) == 32)
      next_non_blank(v4, v5, v6);
  }
  OUTLINED_FUNCTION_30_40();
}

void can_split_abs_line(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  char v5;

  OUTLINED_FUNCTION_48_27();
  if (rb_width(*(_QWORD *)(v4 + 48)) != a3)
  {
    if (a3)
    {
      OUTLINED_FUNCTION_46_28();
      if (!v5)
        OUTLINED_FUNCTION_50_26();
    }
  }
  OUTLINED_FUNCTION_0_83();
}

void can_split_ptr_line(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  char v5;

  OUTLINED_FUNCTION_48_27();
  if (rb_width(*(_QWORD *)(v4 + 56)) != a3)
  {
    if (a3)
    {
      OUTLINED_FUNCTION_46_28();
      if (!v5)
        OUTLINED_FUNCTION_50_26();
    }
  }
  OUTLINED_FUNCTION_0_83();
}

uint64_t OUTLINED_FUNCTION_2_77()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_3_75(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  int v9;
  int v10;
  va_list va;

  va_start(va, a8);
  lf_put_disp_line(a4, a6, (uint64_t)va, v8, v9, v10);
}

void OUTLINED_FUNCTION_5_67(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10, uint64_t a11, uint64_t a12, ...)
{
  int v12;
  va_list va;

  va_start(va, a12);
  lf_put_disp_line(a8, a10, (uint64_t)va, a4, v12, v12);
}

uint64_t OUTLINED_FUNCTION_6_66()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_7_66()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_8_63()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_9_62()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_10_61()
{
  uint64_t v0;
  unsigned int v1;

  return find_sync(v0, v1);
}

uint64_t OUTLINED_FUNCTION_11_58()
{
  uint64_t v0;

  return checkInterrupt(v0);
}

uint64_t OUTLINED_FUNCTION_12_55(int *a1)
{
  return hashDelete(a1, 0, 0);
}

uint64_t OUTLINED_FUNCTION_13_53()
{
  uint64_t v0;

  return rb_width(*(_QWORD *)(v0 + 56));
}

unsigned int *OUTLINED_FUNCTION_14_53()
{
  uint64_t v0;

  return rb_lines(*(unsigned int **)(v0 + 56));
}

void OUTLINED_FUNCTION_17_50(int a1)
{
  int v1;
  uint64_t v2;

  insert_padding(v2, v1, a1);
}

void OUTLINED_FUNCTION_18_49()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  can_split_abs_line(v2, v1, v0);
}

void OUTLINED_FUNCTION_19_49()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  can_split_ptr_line(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_20_49()
{
  uint64_t v0;

  return rb_width(*(_QWORD *)(v0 + 48));
}

uint64_t OUTLINED_FUNCTION_21_48()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_22_47()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  add_tokens(v1, v0, v2);
}

void OUTLINED_FUNCTION_23_45()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  space_syncs(v1, v0, v2);
}

void OUTLINED_FUNCTION_24_45()
{
  prev_ptr_split();
}

void OUTLINED_FUNCTION_25_45()
{
  prev_abs_split();
}

void OUTLINED_FUNCTION_26_43(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  vf_puts(v4, v3, a3, 0);
}

void OUTLINED_FUNCTION_27_41(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  int v4;
  int v5;
  uint64_t v6;

  place_char(v6, v5, v4, a4);
}

uint64_t OUTLINED_FUNCTION_28_41(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

void OUTLINED_FUNCTION_31_40(uint64_t a1, int a2)
{
  place_char_in_stream(a1, a2);
}

void OUTLINED_FUNCTION_32_40(uint64_t a1, int a2, int a3)
{
  insert_padding(a1, a2, a3);
}

_BYTE *OUTLINED_FUNCTION_33_40()
{
  return hashNew(347, 0, 0);
}

void OUTLINED_FUNCTION_34_39(uint64_t a1, int a2, int a3)
{
  place_char(a1, a2, a3, 124);
}

uint64_t OUTLINED_FUNCTION_35_39()
{
  uint64_t v0;
  uint64_t v1;

  return time_stream(*(char *)(*(_QWORD *)(v0 + 32) + v1));
}

uint64_t OUTLINED_FUNCTION_36_39(unsigned int a1)
{
  uint64_t v1;

  return find_sync(v1, a1);
}

char *OUTLINED_FUNCTION_38_37(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  int v4;
  int v5;

  return field_value(v4, a2, v5, a4);
}

void OUTLINED_FUNCTION_39_36(uint64_t a1, int a2)
{
  char v2;
  int v3;

  place_char(a1, a2, v3, v2);
}

uint64_t OUTLINED_FUNCTION_40_36()
{
  uint64_t v0;
  unsigned int v1;

  return find_sync(v0, v1);
}

uint64_t OUTLINED_FUNCTION_41_35(uint64_t a1)
{
  int v1;

  return time_field_value(v1, a1);
}

uint64_t OUTLINED_FUNCTION_42_34()
{
  uint64_t v0;
  uint64_t v1;

  return absoluteSyncNum(v0, v1);
}

uint64_t OUTLINED_FUNCTION_43_32()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_44_30(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  return find_sync(a2, a4);
}

uint64_t OUTLINED_FUNCTION_45_29(uint64_t a1)
{
  int v1;

  return rb_gets(a1, v1, 0);
}

void OUTLINED_FUNCTION_47_28(uint64_t a1)
{
  int v1;

  rb_push(a1, v1, 1);
}

uint64_t OUTLINED_FUNCTION_49_26()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_51_26(uint64_t a1, int a2, int a3)
{
  place_char(a1, a2, a3, 45);
}

unsigned __int16 *OUTLINED_FUNCTION_52_26()
{
  uint64_t v0;

  return pvlist_size(*(unsigned __int16 **)(v0 + 16));
}

_QWORD *OUTLINED_FUNCTION_55_26()
{
  return rb_alloc(1, 0);
}

void OUTLINED_FUNCTION_56_25(uint64_t a1)
{
  int v1;
  int v2;

  rb_push(a1, v2, v1);
}

uint64_t vardesc(uint64_t a1, __int16 a2, unsigned __int16 a3, uint64_t a4)
{
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = a3 | (a2 << 8);
  if ((a2 & 0x80) != 0)
    return *(_QWORD *)(a1 + 192) + 24 * ((a3 | (unsigned __int16)(a2 << 8)) & 0x3FFF) + 9144;
  v5 = a4;
  v6 = *(_QWORD *)(a1 + 192);
  if (!a4)
  {
    v5 = *(_QWORD *)(v6 + 8104);
LABEL_8:
    result = *(_QWORD *)(*(_QWORD *)(v6 + 8112) + 8);
    if (!result)
      return result;
    return *(_QWORD *)(v5 + 16) + 24 * (v4 & 0x3FFF);
  }
  if (*(_QWORD *)(v6 + 8104) == a4)
    goto LABEL_8;
  result = vonstack(a1, a4);
  if (result)
    return *(_QWORD *)(v5 + 16) + 24 * (v4 & 0x3FFF);
  return result;
}

_QWORD *rb_alloc(int a1, int a2)
{
  size_t v3;
  _DWORD *v4;
  _QWORD *v5;
  int v6;
  void *v7;
  uint64_t i;
  void *v9;
  void **v10;

  LODWORD(v3) = a1;
  v4 = malloc_type_malloc(0x18uLL, 0x1080040216EE090uLL);
  v5 = v4;
  if (v4)
  {
    if (a2 >= 1)
      v6 = 96 * (a2 / 0x60u) + 96;
    else
      v6 = 96;
    if ((int)v3 <= 1)
      v3 = 1;
    else
      v3 = v3;
    *v4 = v3;
    v4[1] = v6;
    v4[2] = -1;
    v7 = malloc_type_calloc(v3, 8uLL, 0x10040436913F5uLL);
    v5[2] = v7;
    if (v7)
    {
      for (i = 0; v3 != i; ++i)
      {
        v9 = OUTLINED_FUNCTION_1_79(v6 + 1);
        *(_QWORD *)(v5[2] + 8 * i) = v9;
        if (!v9)
        {
          while (1)
          {
            v10 = (void **)v5[2];
            if ((i & 0x80000000) != 0)
              break;
            free(v10[i]);
            LODWORD(i) = i - 1;
          }
          free(v10);
          goto LABEL_16;
        }
        init_line(*(void **)(v5[2] + 8 * i), v6);
      }
    }
    else
    {
LABEL_16:
      free(v5);
      return 0;
    }
  }
  return v5;
}

void *init_line(void *a1, int a2)
{
  void *result;

  result = memset(a1, 32, a2);
  *((_BYTE *)a1 + a2) = 0;
  return result;
}

void rb_free(_QWORD *a1)
{
  uint64_t i;
  void **v3;

  if (a1)
  {
    for (i = 0; ; ++i)
    {
      v3 = (void **)a1[2];
      if (i >= *(int *)a1)
        break;
      free(v3[i]);
    }
    free(v3);
    free(a1);
  }
}

void rb_putc(uint64_t a1, int a2, int a3, char a4)
{
  int v8;
  int v9;
  int v10;

  expand_lines((int *)a1, a2);
  if (v8)
  {
    expand_cols((int *)a1, a3);
    if (v9)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * a2) + a3) = a4;
      v10 = *(_DWORD *)(a1 + 8);
      if (v10 <= a3)
        v10 = a3;
      *(_DWORD *)(a1 + 8) = v10;
    }
  }
  OUTLINED_FUNCTION_0_84();
}

void expand_lines(int *a1, int a2)
{
  int v4;
  void *v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void **v9;

  if (*a1 <= a2)
  {
    v4 = a2 + 1;
    v5 = OUTLINED_FUNCTION_2_78(*((void **)a1 + 2), 8 * (a2 + 1));
    if (v5)
    {
      *((_QWORD *)a1 + 2) = v5;
      for (i = *a1; ; ++i)
      {
        if (i > a2)
        {
          *a1 = v4;
          goto LABEL_11;
        }
        v7 = OUTLINED_FUNCTION_1_79(a1[1] + 1);
        *(_QWORD *)(*((_QWORD *)a1 + 2) + 8 * i) = v7;
        if (!v7)
          break;
        init_line(*(void **)(*((_QWORD *)a1 + 2) + 8 * i), a1[1]);
      }
      while (1)
      {
        v8 = *a1;
        v9 = (void **)*((_QWORD *)a1 + 2);
        if (i < v8)
          break;
        free(v9[i--]);
      }
      *((_QWORD *)a1 + 2) = OUTLINED_FUNCTION_2_78(v9, 8 * v8);
    }
  }
LABEL_11:
  OUTLINED_FUNCTION_0_84();
}

void expand_cols(int *a1, int a2)
{
  uint64_t v3;
  int v4;
  int v5;
  size_t v6;
  uint64_t v7;
  void *v8;

  if (a1[1] <= a2)
  {
    v3 = 0;
    v4 = 96 * ((a2 + 1) / 96);
    v5 = v4 + 96;
    v6 = v4 + 97;
    while (1)
    {
      v7 = *a1;
      if (v3 >= v7)
        break;
      v8 = malloc_type_realloc(*(void **)(*((_QWORD *)a1 + 2) + 8 * v3), v6, 0x100004077774924uLL);
      if (!v8)
      {
        LODWORD(v7) = *a1;
        break;
      }
      *(_QWORD *)(*((_QWORD *)a1 + 2) + 8 * v3) = v8;
      init_line((void *)(*(_QWORD *)(*((_QWORD *)a1 + 2) + 8 * v3++) + a1[1]), v5 - a1[1]);
    }
    if ((int)v7 <= (int)v3)
    {
      a1[1] = v5;
    }
    else
    {
      for (; (v3 & 0x80000000) == 0; LODWORD(v3) = v3 - 1)
        *(_QWORD *)(*((_QWORD *)a1 + 2) + 8 * v3) = malloc_type_realloc(*(void **)(*((_QWORD *)a1 + 2)+ 8 * v3), a1[1] + 1, 0x421C09F8uLL);
    }
  }
  OUTLINED_FUNCTION_0_84();
}

void rb_insc(int *a1, int a2, int a3, char a4)
{
  uint64_t v4;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  _BYTE *v13;

  OUTLINED_FUNCTION_6_67(a1, a2);
  if (v8)
  {
    expand_cols((int *)v4, a3);
    if (v9)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(v4 + 16) + 8 * a2);
      v11 = *(int *)(v4 + 4);
      if (*(_BYTE *)(v11 + v10 - 1) == 32)
      {
LABEL_6:
        v13 = (_BYTE *)(v10 + a3);
        memmove(v13 + 1, v13, (int)v11 + ~a3);
        *v13 = a4;
        ++*(_DWORD *)(v4 + 8);
        goto LABEL_7;
      }
      expand_cols((int *)v4, v11 + 1);
      if (v12)
      {
        v10 = *(_QWORD *)(*(_QWORD *)(v4 + 16) + 8 * a2);
        LODWORD(v11) = *(_DWORD *)(v4 + 4);
        goto LABEL_6;
      }
    }
  }
LABEL_7:
  OUTLINED_FUNCTION_0_84();
}

void rb_inscn(int *a1, int a2, int a3, int a4, int a5)
{
  uint64_t v5;
  int v10;
  int v11;
  int v12;
  int v13;
  int v15;
  char *v16;
  int v17;

  OUTLINED_FUNCTION_6_67(a1, a2);
  if (v10)
  {
    v11 = *(_DWORD *)(v5 + 8);
    v12 = v11 - a5;
    if (v11 >= -1)
      v13 = -1;
    else
      v13 = *(_DWORD *)(v5 + 8);
    if ((v11 & 0x80000000) == 0)
    {
      while (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 16) + 8 * a2) + v11) == 32 && v11 > v12)
      {
        if (--v11 < 0)
          goto LABEL_13;
      }
      v13 = v11;
    }
LABEL_13:
    expand_cols((int *)v5, v13 + a5);
    if (v15)
    {
      v16 = (char *)(*(_QWORD *)(*(_QWORD *)(v5 + 16) + 8 * a2) + a3);
      if ((v11 & 0x80000000) == 0)
        memmove(&v16[a5], v16, v13 - a3 + 1);
      memset(v16, a4, a5);
      v17 = *(_DWORD *)(v5 + 8);
      if (v17 <= v13 + a5)
        v17 = v13 + a5;
      *(_DWORD *)(v5 + 8) = v17;
    }
  }
  OUTLINED_FUNCTION_3_76();
}

void rb_puts(int *a1, int a2, int a3, char *a4)
{
  uint64_t v4;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  char v12;
  int v13;

  OUTLINED_FUNCTION_6_67(a1, a2);
  if (v8)
  {
    v9 = 0;
    v10 = a3;
    while (*a4)
    {
      expand_cols((int *)v4, a3 + v9);
      if (!v11)
        goto LABEL_9;
      v12 = *a4++;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 16) + 8 * a2) + v10) = v12;
      ++v9;
      ++v10;
    }
    v13 = *(_DWORD *)(v4 + 8);
    if (v13 < v9)
      v13 = v9 - 2;
    *(_DWORD *)(v4 + 8) = v13;
  }
LABEL_9:
  OUTLINED_FUNCTION_4_71();
}

void rb_puts_v(int *a1, int a2, int a3, char *a4)
{
  int v8;
  int v9;
  char v10;
  char v11;
  int v12;

  expand_cols(a1, a3);
  if (v8)
  {
    while (*a4)
    {
      expand_lines(a1, a2);
      if (!v9)
        goto LABEL_11;
      v10 = *a4++;
      OUTLINED_FUNCTION_5_68(v10);
    }
    v11 = 32;
    while (a2 < (uint64_t)*a1)
      OUTLINED_FUNCTION_5_68(v11);
    v12 = a1[2];
    if (v12 <= a3)
      v12 = a3;
    a1[2] = v12;
  }
LABEL_11:
  OUTLINED_FUNCTION_4_71();
}

void rb_stradd(int *a1, int a2, unsigned __int8 *a3)
{
  int v4;
  int v6;
  int v7;
  uint64_t v8;
  int i;
  int v10;
  BOOL v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  char v23;
  int v24;

  v4 = a2;
  v6 = 0;
  v7 = a2 - 1;
  v8 = a2;
  if (!a1)
    goto LABEL_3;
LABEL_2:
  for (i = *a1; v6 < i; i = 0)
  {
    v10 = a1[1];
    v11 = v4 < 1 || v10 < v4;
    if (v11 || (v12 = OUTLINED_FUNCTION_7_67(), rb_getc(v12, v13, v7) == 32))
    {
      v14 = v10;
      if (v10 <= v4)
        goto LABEL_23;
      v15 = v8;
      v16 = a3;
      while (*v16++)
      {
        if (v15 >= v14 || (v18 = OUTLINED_FUNCTION_7_67(), rb_getc(v18, v19, v15) != 32))
        {
          if ((int)v15 < (int)v14)
            goto LABEL_20;
          goto LABEL_23;
        }
        ++v15;
      }
      if ((int)v15 >= (int)v14)
        goto LABEL_23;
      v20 = OUTLINED_FUNCTION_7_67();
      if (rb_getc(v20, v21, v15) == 32)
        goto LABEL_23;
    }
LABEL_20:
    ++v6;
    if (a1)
      goto LABEL_2;
LABEL_3:
    ;
  }
  do
  {
LABEL_23:
    v24 = *a3++;
    v23 = v24;
    if (!v24)
      break;
    rb_putc((uint64_t)a1, v6, v4++, v23);
  }
  while (v22);
}

unsigned int *rb_lines(unsigned int *result)
{
  if (result)
    return (unsigned int *)*result;
  return result;
}

uint64_t rb_getc(uint64_t a1, int a2, int a3)
{
  if (*(_DWORD *)a1 <= a2 || *(_DWORD *)(a1 + 4) <= a3)
    return 0;
  else
    return *(char *)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * a2) + a3);
}

void rb_strdel(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int i;
  uint64_t j;

  v4 = 0;
  v5 = a2;
  v6 = a2 - 1;
  if (!a1)
    goto LABEL_3;
LABEL_2:
  for (i = *(_DWORD *)a1; v4 < i; i = 0)
  {
    if (rb_getc(a1, v4, a2) != 32
      && (!a2 || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * v4) + v6) == 32))
    {
      for (j = v5; *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * v4) + j) != 32; ++j)
        rb_putc(a1, v4, j, 32);
    }
    ++v4;
    if (a1)
      goto LABEL_2;
LABEL_3:
    ;
  }
}

void rb_push(uint64_t a1, int a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int i;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  int *v18;
  int v19;
  int v20;
  int v21;

  v6 = 0;
  v7 = a2 - 1;
  v8 = a2 + 1;
  v9 = a2 + 1;
  if (!a1)
    goto LABEL_3;
LABEL_2:
  for (i = *(_DWORD *)a1; v6 < i; i = 0)
  {
    if (a2)
    {
      v11 = rb_getc(a1, v6, a2);
      v12 = a2;
      if (v11 != 32)
      {
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * v6);
        v12 = a2;
        if (*(_BYTE *)(v13 + v7) != 32)
        {
          v14 = *(int *)(a1 + 4);
          if ((int)v14 <= v8)
            v15 = v8;
          else
            v15 = *(_DWORD *)(a1 + 4);
          v16 = v9;
          v12 = a2;
          while (v16 < v14)
          {
            v17 = *(unsigned __int8 *)(v13 + v16);
            ++v12;
            ++v16;
            if (v17 == 32)
              goto LABEL_16;
          }
          v12 = v15;
        }
      }
    }
    else
    {
      v12 = 0;
    }
LABEL_16:
    if (v12 < *(_DWORD *)(a1 + 4))
    {
      v18 = (int *)OUTLINED_FUNCTION_7_67();
      rb_inscn(v18, v19, v20, 32, a3);
      if (!v21)
        break;
    }
    ++v6;
    if (a1)
      goto LABEL_2;
LABEL_3:
    ;
  }
  OUTLINED_FUNCTION_3_76();
}

uint64_t rb_gets(uint64_t a1, int a2, int a3)
{
  if (*(_DWORD *)a1 > a2 && *(_DWORD *)(a1 + 4) >= a3)
    return *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * a2) + a3;
  else
    return 0;
}

uint64_t rb_width(uint64_t result)
{
  if (result)
    return (*(_DWORD *)(result + 8) + 1);
  return result;
}

void *OUTLINED_FUNCTION_1_79(size_t a1)
{
  return malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
}

void *OUTLINED_FUNCTION_2_78(void *a1, size_t a2)
{
  return malloc_type_realloc(a1, a2, 0x10040436913F5uLL);
}

void OUTLINED_FUNCTION_5_68(char a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 16) + 8 * v2) + v3) = a1;
}

void OUTLINED_FUNCTION_6_67(int *a1, int a2)
{
  expand_lines(a1, a2);
}

uint64_t OUTLINED_FUNCTION_7_67()
{
  uint64_t v0;

  return v0;
}

uint64_t calcMidline(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;

  v3 = *(__int16 *)(a2 + 2) & ~(*(__int16 *)(a2 + 2) >> 31);
  if (v3 >= 0x64)
    v3 = 100;
  *(_WORD *)(a3 + 2) = MidlineVals[v3];
  return OUTLINED_FUNCTION_0_85();
}

uint64_t f0_stepi(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;

  v6 = *(__int16 *)(a3 + 2);
  v7 = *(__int16 *)(a5 + 2) * *(__int16 *)(a4 + 2);
  if (v7 + v6 < 1)
    v7 = 20 - v6;
  if (v7 << 16)
  {
    v8 = (__int16)v7;
    if (v6 >= 4208)
      v9 = 4208;
    else
      v9 = *(__int16 *)(a3 + 2);
    v10 = v9 & ~(v9 >> 31);
    v11 = v10 >> 4;
    v12 = v10 & 0xF;
    if (v12)
    {
      v13 = LnTable[v11 + 1];
      v14 = LnTable[v11];
      v11 = v14 + (((v13 - v14) * v12) >> 4);
    }
    else
    {
      LOWORD(v11) = LnTable[v11];
    }
    v16 = v8 + v6;
    if (v16 >= 4208)
      v16 = 4208;
    v17 = (__int16)v16;
    if (v16 < 0)
      v17 = 0;
    v18 = v17 >> 4;
    v19 = v17 % 16;
    if (v19)
      v18 = LnTable[v18] + (((LnTable[v18 + 1] - LnTable[v18]) * (__int16)v19) >> 4);
    else
      LOWORD(v18) = LnTable[(__int16)v18];
    v15 = ((__int16)v11 - (__int16)v18) / *(__int16 *)(a2 + 2);
  }
  else
  {
    LOWORD(v15) = 0;
  }
  *(_WORD *)(a6 + 2) = v15;
  return OUTLINED_FUNCTION_0_85();
}

uint64_t calcIntoni(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_WORD *)(a2 + 2);
  if (*(_WORD *)(a3 + 2))
  {
    LODWORD(v6) = *(__int16 *)(a4 + 2) * *(__int16 *)(a3 + 2);
    if ((int)v6 >= 1023)
      LODWORD(v6) = 1023;
    if ((int)v6 >= 0)
      v6 = (__int16)v6;
    else
      v6 = 0;
    v7 = ExpTable[v6] * (uint64_t)*(__int16 *)(a2 + 2);
    if (v7 <= 0x1FFFFFFF)
      v5 = (unint64_t)v7 >> 14;
    else
      v5 = 0x7FFF;
  }
  *(_WORD *)(a5 + 2) = v5;
  return OUTLINED_FUNCTION_0_85();
}

uint64_t scaleValue100i(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(__int16 *)(a1 + 2);
  v5 = *(__int16 *)(a2 + 2);
  if (v5 >= *(__int16 *)(a4 + 2) * *(__int16 *)(a3 + 2) / 100)
    v5 = *(__int16 *)(a4 + 2) * *(__int16 *)(a3 + 2) / 100;
  if (v5 >= v4)
    LOWORD(v4) = v5;
  *(_WORD *)(a4 + 2) = v4;
  return OUTLINED_FUNCTION_0_85();
}

uint64_t calcSpeedFactori(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;

  v3 = *(__int16 *)(a2 + 2) & ~(*(__int16 *)(a2 + 2) >> 31);
  if (v3 >= 0x96)
    v3 = 150;
  *(_QWORD *)(a3 + 8) = SpeedTable[v3];
  return OUTLINED_FUNCTION_0_85();
}

uint64_t modulate_pwindi(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  int v5;

  v4 = *(__int16 *)(a2 + 2);
  if (v4 >= 9)
    v4 = 9;
  if (v4 <= 1)
    v4 = 1;
  *(_WORD *)(a3 + 2) = (PwindModTable[v4] * *(__int16 *)(a3 + 2)) >> 7;
  if (v4 <= 4)
    v5 = v4 + 95;
  else
    v5 = 105 - v4;
  *(_WORD *)(a4 + 2) = v5 * *(__int16 *)(a4 + 2) / 100;
  return OUTLINED_FUNCTION_0_85();
}

uint64_t modulo(uint64_t a1, __int16 *a2, __int16 *a3, double *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  getDeltaCcodeParm(a2, &v9, -3);
  getDeltaCcodeParm(a3, &v8, -3);
  v7 = v9 % v8;
  setDeltaCcodeReturnValue((double *)&v7, -3, a4);
  return 0;
}

uint64_t IntLog(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  int v4;

  v3 = *(__int16 *)(a2 + 2) & ~(*(__int16 *)(a2 + 2) >> 31);
  if (v3 >= 0x1400)
    v3 = 5120;
  v4 = LogTab[v3 >> 5];
  *(_WORD *)(a3 + 2) = v4 + (((LogTab[(v3 >> 5) + 1] - v4) * (v3 & 0x1F)) >> 5);
  return OUTLINED_FUNCTION_0_85();
}

uint64_t IntExp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  unsigned int v4;
  int v5;

  v3 = *(__int16 *)(a2 + 2);
  if (v3 <= 2400)
    v3 = 2400;
  if (v3 >= 0x1450)
    v3 = 5200;
  v4 = (v3 - 2400) >> 4;
  v5 = ExpTab[v4];
  *(_WORD *)(a3 + 2) = v5 + (((ExpTab[v4 + 1] - v5) * (v3 & 0xFu)) >> 4);
  return OUTLINED_FUNCTION_0_85();
}

uint64_t OUTLINED_FUNCTION_0_85()
{
  return 0;
}

_DWORD *clr_vector(_DWORD *result, uint64_t a2)
{
  uint64_t i;

  for (i = a2 & ~(a2 >> 63); i; --i)
    *result++ = 0;
  return result;
}

__int16 *mul1_vector(__int16 *result, float a2, float *a3, uint64_t a4)
{
  uint64_t i;
  int v5;

  for (i = a4 & ~(a4 >> 63); i; --i)
  {
    v5 = *result++;
    *a3 = *a3 + (float)(a2 * (float)v5);
    ++a3;
  }
  return result;
}

float *mulf_vector(float *result, float a2, float *a3, uint64_t a4)
{
  uint64_t i;
  float v5;

  for (i = a4 & ~(a4 >> 63); i; --i)
  {
    v5 = *result++;
    *a3 = *a3 + (float)(a2 * v5);
    ++a3;
  }
  return result;
}

float parallel0_filter(float *a1, float *a2, uint64_t a3)
{
  float *v3;
  float v4;
  float *v5;
  uint64_t i;
  float *v7;
  float result;

  *(a2 - 2) = a1[13];
  v3 = a1 + 12;
  v4 = a1[12];
  *(a2 - 1) = v4;
  v5 = a2;
  for (i = a3 & ~(a3 >> 63); i; --i)
  {
    v4 = (float)(a1[2] * *(v5 - 2)) + (float)(a1[1] * v4);
    *v5++ = v4;
  }
  v7 = &a2[a3 & ~(a3 >> 63)];
  if (a3 > 1)
    v3 = v7 - 2;
  a1[13] = *v3;
  result = *(v7 - 1);
  a1[12] = result;
  return result;
}

uint64_t output_speech(uint64_t result, uint64_t a2)
{
  _BYTE *v2;
  uint64_t *v3;
  float v4;
  uint64_t i;
  int v6;
  uint64_t v7;

  v2 = (_BYTE *)(result + 8662);
  if (*(_BYTE *)(result + 8866))
  {
    v6 = a2;
    v3 = (uint64_t *)(result + 2048);
    v7 = result + 2048;
    v4 = *(float *)(result + 148);
    if (v4 != 1.0)
    {
      for (i = a2 & ~(a2 >> 63); i; --i)
      {
        *v3 = (uint64_t)(float)(v4 * (float)*v3);
        ++v3;
      }
    }
    if (*(_DWORD *)(result + 3720) == 2)
    {
      result = (*(uint64_t (**)(_QWORD, int *))(result + 3728))(*(_QWORD *)(result + 8), &v6);
      *v2 = result;
    }
  }
  return result;
}

BOOL verifyKlattHandle(const char **a1)
{
  return strcmp(*a1, KlattVersion) == 0;
}

void klatt_new(uint64_t a1)
{
  char *v2;

  v2 = (char *)malloc_type_calloc(1uLL, 0x22A8uLL, 0x10F20402EFE26D7uLL);
  if (v2)
  {
    *(_QWORD *)v2 = KlattVersion;
    *((_QWORD *)v2 + 1) = a1;
    *((_DWORD *)v2 + 38) = 0;
    *((_DWORD *)v2 + 1588) = 0;
    *((_WORD *)v2 + 4330) = 0;
    *(_OWORD *)(v2 + 6504) = 0u;
    *((_QWORD *)v2 + 817) = 0;
    *((_QWORD *)v2 + 819) = 0;
    *((_QWORD *)v2 + 818) = 0;
    v2[8866] = 1;
  }
  OUTLINED_FUNCTION_13_54();
}

void klatt_delete(const char **a1)
{
  void *v1;

  if (OUTLINED_FUNCTION_2_79(a1))
    free(v1);
  else
    OUTLINED_FUNCTION_12_56();
}

uint64_t errorKlattIgnore()
{
  return 0;
}

void *KlattSetConstParms(const char **a1, const void *a2)
{
  uint64_t v2;
  void *result;
  float v5;
  __int16 v6;
  float v7;
  int v8;

  result = (void *)OUTLINED_FUNCTION_2_79(a1);
  if ((_DWORD)result)
  {
    if (*(_DWORD *)(v2 + 152) == 2)
      KlattClose((const char **)v2);
    result = memcpy((void *)(v2 + 3648), a2, 0x58uLL);
    v5 = *(float *)(v2 + 3652);
    *(float *)(v2 + 6412) = 1000.0 / v5;
    *(float *)(v2 + 6408) = v5 * 0.001;
    v6 = *(_WORD *)(v2 + 3664);
    *(_WORD *)(v2 + 8656) = v6;
    *(_WORD *)(v2 + 8658) = v6;
    *(_QWORD *)(v2 + 6392) = 0;
    v7 = (float)((float)(1000.0 / v5) * 3.1416) * 0.001;
    *(float *)(v2 + 6400) = v7;
    *(float *)(v2 + 6404) = v7 + v7;
    *(_QWORD *)(v2 + 8160) = *(int *)(v2 + 3660);
    *(_BYTE *)(v2 + 8865) = 0;
    *(_QWORD *)(v2 + 8200) = (uint64_t)*(float *)(v2 + 3680);
    *(_QWORD *)(v2 + 8208) = (uint64_t)*(float *)(v2 + 3692);
    *(_QWORD *)(v2 + 8216) = (uint64_t)*(float *)(v2 + 3684);
    *(_QWORD *)(v2 + 8224) = (uint64_t)*(float *)(v2 + 3688);
    if (v5 == 11025.0)
    {
      v8 = 1;
    }
    else if (v5 == 16000.0)
    {
      v8 = 2;
    }
    else
    {
      if (v5 == 8000.0)
      {
        *(_DWORD *)(v2 + 8868) = 0;
        goto LABEL_9;
      }
      v8 = 3;
    }
    *(_DWORD *)(v2 + 8868) = v8;
LABEL_9:
    *(_BYTE *)(v2 + 24) = 1;
  }
  return result;
}

void KlattClose(const char **a1)
{
  uint64_t v1;

  if (OUTLINED_FUNCTION_2_79(a1))
    *(_DWORD *)(v1 + 152) = 0;
  OUTLINED_FUNCTION_12_56();
}

BOOL KlattOpen(const char **a1)
{
  uint64_t v1;
  _BOOL8 result;
  uint64_t v3;
  uint64_t v4;

  result = OUTLINED_FUNCTION_2_79(a1);
  if (result)
  {
    if (*(_BYTE *)(v1 + 24) != 1)
    {
      (*(void (**)(_QWORD, const char *, const char *))(v1 + 3712))(*(_QWORD *)(v1 + 8), " KlattOpen error", "Call KlattSetConstParms at least once before KlattOpen!");
      return 0;
    }
    if (*(_DWORD *)(v1 + 152) == 2)
    {
      (*(void (**)(_QWORD, const char *, const char *))(v1 + 3712))(*(_QWORD *)(v1 + 8), " KlattOpen error", "Synthesizer is already open!");
      return 0;
    }
    v3 = 0;
    *(_DWORD *)(v1 + 152) = 2;
    *(_QWORD *)(v1 + 4544) = v1 + 3744;
    *(_QWORD *)(v1 + 6168) = v1 + 5364;
    *(_DWORD *)(v1 + 6364) = 0;
    while (v3 != 1848)
    {
      v4 = v1 + v3;
      *(_DWORD *)(v4 + 232) = 0;
      *(_DWORD *)(v4 + 216) = 0;
      *(_QWORD *)(v4 + 208) = 0;
      v3 += 88;
      *(_QWORD *)(v4 + 240) = 0;
    }
    *(_QWORD *)(v1 + 16) = 0;
    *(_DWORD *)(v1 + 6360) = 0;
    *(_QWORD *)(v1 + 6352) = 0;
    *(_OWORD *)(v1 + 6504) = 0u;
    *(_QWORD *)(v1 + 6536) = 0;
    *(_QWORD *)(v1 + 6552) = 0;
    *(_QWORD *)(v1 + 6544) = 0;
    result = 1;
    *(_BYTE *)(v1 + 8866) = 1;
    *(_WORD *)(v1 + 8660) = 0;
  }
  return result;
}

void KlattSetOutputSamplesOption(uint64_t a1, char a2)
{
  if (verifyKlattHandle((const char **)a1))
    *(_BYTE *)(a1 + 8866) = a2;
  OUTLINED_FUNCTION_12_56();
}

void KlattLength(const char **a1)
{
  OUTLINED_FUNCTION_2_79(a1);
  OUTLINED_FUNCTION_13_54();
}

void KlattMax(const char **a1)
{
  OUTLINED_FUNCTION_2_79(a1);
  OUTLINED_FUNCTION_13_54();
}

BOOL KlattSynth(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  _QWORD *v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int64x2_t v31;
  int64x2_t v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  float v39;
  double v40;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float *v51;
  uint64_t i;
  float *v53;
  uint64_t v54;
  float v55;
  float v56;
  float v57;
  float v58;
  uint64_t v59;
  uint64_t v60;
  float v61;
  float v62;
  float v63;
  uint64_t v64;
  float *v65;
  float v66;
  float v67;
  float v68;
  uint64_t v69;
  float v70;
  uint64_t v71;
  float v72;
  uint64_t v73;
  uint64_t v74;
  float *v75;
  float v76;
  uint64_t v77;
  float v78;
  uint64_t v79;
  uint64_t j;
  uint64_t v81;
  uint64_t v82;
  uint64_t k;
  float *v84;
  float v85;
  uint64_t v86;
  uint64_t v87;
  float v88;
  uint64_t v89;
  uint64_t v90;
  float v91;
  float v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  float v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  float v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  float v113;
  float v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  float v120;
  float v121;
  uint64_t v122;
  float v123;
  float v124;
  float v125;
  uint64_t v126;
  uint64_t v127;
  _DWORD *v128;
  float v129;
  float v130;
  float v131;
  uint64_t v132;
  float v133;
  float v134;
  float v135;
  int v136;
  char *v137;
  uint64_t m;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  float v143;
  float v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v151;
  uint64_t v152;
  int v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  float v157;
  float v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  float *v172;
  uint64_t v173;
  float *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  float *v179;
  uint64_t v180;
  double v181;
  double v182;
  int v183;
  int v184;
  float v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  float *v191;
  uint64_t v192;
  float *n;
  float v194;
  float v195;
  float *v196;
  uint64_t v197;
  float v198;
  float v199;
  float v200;
  float *ii;
  uint64_t v202;
  uint64_t v203;
  float *v204;
  float *v205;
  float *v206;
  float *v207;
  float v208;
  __int16 v209;
  uint64_t v210;
  uint64_t v211;
  float *v212;
  uint64_t v213;
  float v214;
  uint64_t v215;
  uint64_t v216;
  float *v217;
  float v218;
  float *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t jj;
  float v223;
  uint64_t v224;
  uint64_t v225;
  float v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  float *v230;
  int v231;
  float v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  int v236;
  uint64_t v237;
  uint64_t *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  _OWORD v243[2];
  uint64_t v244;
  int64x2_t v245;
  uint64_t v246;
  float v247[5];
  _DWORD v248[8];
  __int128 v249;
  int v250;
  uint64_t v251;
  int v252;
  _DWORD v253[5];
  _DWORD v254[5];
  int v255;
  int v256;
  int v257;
  int v258;
  int v259;
  int v260;
  int v261;
  int v262;
  int v263;
  int v264;
  int v265;
  uint64_t v266;

  v266 = *MEMORY[0x24BDAC8D0];
  result = verifyKlattHandle((const char **)a1);
  if (!result)
    return result;
  v5 = (_QWORD *)(a1 + 6420);
  ++*(_QWORD *)(a1 + 16);
  v6 = *(float *)a2;
  v7 = *(float *)(a1 + 3648);
  v8 = *(float *)(a1 + 6408);
  v9 = (uint64_t)*(float *)(a2 + 8);
  *(_QWORD *)(a1 + 8176) = v9;
  v10 = (uint64_t)*(float *)(a2 + 28);
  *(_QWORD *)(a1 + 8184) = v10;
  v11 = *(float *)(a2 + 32);
  *(_QWORD *)(a1 + 0x2000) = (uint64_t)v11;
  if (v9 | v10)
    *(_DWORD *)(a1 + 6356) = 1101004800;
  v12 = v6 * v7;
  if ((uint64_t)v11)
    *(_DWORD *)(a1 + 6360) = 1101004800;
  v13 = v12 * v8;
  *(_BYTE *)(a1 + 8663) = 0;
  v14 = *(float *)(a2 + 108);
  v15 = *(float *)(a2 + 112);
  v17 = *(float *)(a2 + 116);
  v16 = *(float *)(a2 + 120);
  v19 = *(float *)(a2 + 124);
  v18 = *(float *)(a2 + 128);
  *(float *)&v253[3] = v14;
  *(float *)&v253[4] = v19;
  v247[3] = v15;
  v247[4] = v18;
  v21 = *(float *)(a2 + 132);
  v20 = *(float *)(a2 + 136);
  *(float *)&v253[1] = v17;
  *(float *)&v253[2] = v21;
  v247[1] = v16;
  v247[2] = v20;
  v22 = *(_DWORD *)(a2 + 40);
  v23 = *(_DWORD *)(a2 + 52);
  v24 = *(_DWORD *)(a2 + 56);
  v254[0] = *(_DWORD *)(a2 + 36);
  v254[1] = v23;
  v248[0] = v22;
  v248[1] = v24;
  v25 = *(_DWORD *)(a2 + 60);
  v26 = *(_DWORD *)(a2 + 64);
  v259 = v23;
  v260 = v25;
  v27 = *(_DWORD *)(a2 + 68);
  v28 = *(_DWORD *)(a2 + 72);
  v254[2] = v25;
  v254[3] = v27;
  v248[2] = v26;
  v248[3] = v28;
  v29 = *(_DWORD *)(a2 + 76);
  v30 = *(_DWORD *)(a2 + 80);
  v261 = v27;
  v262 = v29;
  v258 = v254[0];
  v254[4] = v29;
  v248[4] = v30;
  v31 = vcvtq_s64_f64(vcvtq_f64_f32(*(float32x2_t *)(a2 + 140)));
  v249 = *(_OWORD *)(a2 + 176);
  v32 = vcvtq_s64_f64(vcvtq_f64_f32(*(float32x2_t *)(a2 + 148)));
  v243[0] = v31;
  v243[1] = v32;
  v250 = *(_DWORD *)(a2 + 192);
  v244 = (uint64_t)*(float *)(a2 + 156);
  v33 = *(_QWORD *)(a1 + 8160);
  if (v33 >= 6)
  {
    v34 = *(_DWORD *)(a2 + 88);
    v35 = *(_DWORD *)(a2 + 92);
    v36 = *(_DWORD *)(a2 + 96);
    v255 = *(_DWORD *)(a2 + 84);
    v256 = v35;
    v248[5] = v34;
    v248[6] = v36;
    v37 = *(_DWORD *)(a2 + 100);
    v38 = *(_DWORD *)(a2 + 104);
    v264 = v35;
    v265 = v37;
    v263 = v255;
    v257 = v37;
    v248[7] = v38;
    v251 = *(_QWORD *)(a2 + 196);
    v245 = vcvtq_s64_f64(vcvtq_f64_f32(*(float32x2_t *)(a2 + 160)));
    v252 = *(_DWORD *)(a2 + 204);
    v246 = (uint64_t)*(float *)(a2 + 168);
  }
  v234 = (uint64_t)v13;
  v39 = *(float *)(a1 + 6356);
  v40 = v39;
  if (v39 > 0.00001)
  {
    if (v14 == v17 && v15 == v16)
    {
      *(_DWORD *)(a1 + 320) = 0;
      *(_DWORD *)(a1 + 496) = 0;
    }
    else
    {
      *(float *)(a1 + 320) = v39;
      *(float *)(a1 + 496) = v39;
      if (v14 != *(float *)(a1 + 480))
        *(float *)(a1 + 6188) = OUTLINED_FUNCTION_5_69(v14);
      if (v17 != *(float *)(a1 + 304))
        *(float *)(a1 + 6180) = cosf(v17 * *(float *)(a1 + 6404));
      if (v15 != *(float *)(a1 + 484))
        *(float *)(a1 + 6272) = OUTLINED_FUNCTION_9_63();
      if (v16 != *(float *)(a1 + 308))
        *(float *)(a1 + 6264) = expf(-(float)(*(float *)(a1 + 6400) * v16));
    }
    if (v19 == v21 && v18 == v20)
    {
      *(_DWORD *)(a1 + 408) = 0;
      *(_DWORD *)(a1 + 584) = 0;
    }
    else
    {
      *(float *)(a1 + 408) = v39;
      *(float *)(a1 + 584) = v39;
      if (v19 != *(float *)(a1 + 568))
        *(float *)(a1 + 6192) = cosf(v19 * *(float *)(a1 + 6404));
      if (v21 != *(float *)(a1 + 392))
        *(float *)(a1 + 6184) = cosf(v21 * *(float *)(a1 + 6404));
      if (v18 != *(float *)(a1 + 572))
        *(float *)(a1 + 6276) = expf(-(float)(*(float *)(a1 + 6400) * v18));
      if (v20 != *(float *)(a1 + 396))
        *(float *)(a1 + 6268) = expf(-(float)(*(float *)(a1 + 6400) * v20));
    }
  }
  v237 = a2;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  v46 = v33 + 5;
  while (v43 + 5 < v46)
  {
    *(_DWORD *)(a1 + v44 + 672) = *(_DWORD *)(a1 + 6356);
    v47 = *(float *)&v254[v45 / 4];
    if (v47 != *(float *)(a1 + v44 + 656))
      *(float *)(a1 + v45 + 6196) = OUTLINED_FUNCTION_5_69(v47);
    v48 = *(float *)&v248[v45 / 4];
    if (v48 != *(float *)(a1 + v44 + 660) && *(float *)(a1 + 6356) != 0.0)
      *(float *)(a1 + v45 + 6280) = OUTLINED_FUNCTION_10_62(v48);
    v49 = *(float *)(a1 + 6360);
    if (v49 <= 0.00001)
    {
      *(_DWORD *)(a1 + v44 + 1376) = 0;
    }
    else
    {
      if (*((_QWORD *)v243 + v43))
        *(float *)(a1 + v44 + 1376) = v49;
      *(_DWORD *)(a1 + v45 + 6228) = *(_DWORD *)(a1 + v45 + 6196);
      v50 = *(float *)((char *)&v249 + v45);
      if (v50 != *(float *)(a1 + v44 + 1364))
        *(float *)(a1 + v45 + 6312) = OUTLINED_FUNCTION_10_62(v50);
    }
    v45 += 4;
    v44 += 88;
    ++v43;
  }
  v51 = (float *)(a1 + 284);
  for (i = 1; i < v46; ++i)
  {
    if (*(float *)(a1 + 88 * i + 232) != 0.0)
    {
      v53 = (float *)(a1 + 88 * i);
      v54 = a1 + 4 * i;
      v55 = *(float *)(v54 + 6260);
      v56 = -(float)(v55 * v55);
      v53[42] = v56;
      v57 = (float)(v55 * *(float *)(v54 + 6176)) + (float)(v55 * *(float *)(v54 + 6176));
      v53[40] = (float)(1.0 - v57) - v56;
      v53[41] = v57;
      v58 = v53[54];
      if (v58 == 0.0 || *(float *)&v253[i] == v58 && v247[i] == *(float *)(a1 + 88 * i + 220))
      {
        *(_QWORD *)(a1 + 88 * i + 240) = 0;
      }
      else
      {
        v59 = a1 + 88 * i;
        v61 = *(float *)(v59 + 228);
        v60 = v59 + 228;
        *(_QWORD *)(v60 + 12) = 3;
        v62 = (float)(v57 - *(float *)(v60 - 4)) * 0.25;
        v63 = (float)(v56 - v61) * 0.25;
        v64 = -3;
        v65 = v51;
        do
        {
          v66 = (float)(v64 + 4);
          v67 = *(float *)v60 + (float)(v66 * v63);
          *v65 = v67;
          v68 = *(float *)(v60 - 4) + (float)(v66 * v62);
          *(v65 - 3) = v68;
          *(v65 - 6) = (float)(1.0 - v68) - v67;
          ++v64;
          ++v65;
        }
        while (v64);
      }
    }
    v51 += 22;
  }
  v69 = *(_QWORD *)(a1 + 8208) + *(_QWORD *)(a1 + 0x2000) + *(_QWORD *)(a1 + 8224);
  v70 = *(float *)(v237 + 172);
  if (v70 != 0.0)
    *(float *)(a1 + 4552) = db2lin(v69 + (uint64_t)v70) * -0.0000000033599;
  v71 = 0;
  v72 = 0.0000000033599;
  v73 = 6312;
  v74 = 1304;
  while (v71 + 13 < *(_QWORD *)(a1 + 8160) + 13)
  {
    v75 = (float *)(a1 + v74);
    if (*(float *)(a1 + v74 + 72) != 0.0)
    {
      v76 = *(float *)(a1 + v73);
      v75[2] = -(float)(v76 * v76);
      v75[1] = (float)(v76 * *(float *)(a1 + v73 - 84)) + (float)(v76 * *(float *)(a1 + v73 - 84));
      v77 = *((_QWORD *)v243 + v71);
      if (v77)
        v78 = (float)(v72 * db2lin(v77 + v69)) * (float)((float)(1.0 - v75[1]) - v75[2]);
      else
        v78 = 0.0;
      *v75 = v78;
    }
    v72 = -v72;
    ++v71;
    v73 += 4;
    v74 += 88;
  }
  if (*(float *)(a1 + 6356) > 0.0001)
  {
    v79 = a1 + 260;
    for (j = 1; j != 3; ++j)
    {
      if (*(float *)(a1 + 88 * j + 232) != 0.0)
      {
        v81 = a1 + 88 * j;
        LODWORD(v40) = *(_DWORD *)(v81 + 160);
        v82 = a1 + 12 * j;
        *(float *)(v82 + 2008) = 1.0 / *(float *)&v40;
        v40 = COERCE_DOUBLE(vdiv_f32(vneg_f32(*(float32x2_t *)(v81 + 164)), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v40, 0)));
        *(double *)(v82 + 2012) = v40;
        if (*(_QWORD *)(v81 + 240))
        {
          for (k = 0; k != 12; k += 4)
          {
            v84 = (float *)(v79 + k);
            v85 = *(float *)(v79 + k);
            *v84 = 1.0 / v85;
            v84[3] = (float)-*(float *)(v79 + k + 12) / v85;
            v84[6] = (float)-*(float *)(v79 + k + 24) / v85;
          }
        }
      }
      v79 += 88;
    }
  }
  *(_DWORD *)(a1 + 6376) = *(_DWORD *)(v237 + 4);
  *(_DWORD *)(a1 + 6372) = *(_DWORD *)(v237 + 24);
  *(float *)(a1 + 6388) = *(float *)(v237 + 12) * 0.01;
  v86 = 200;
  if (v234 < 200)
    v86 = v234;
  *(_QWORD *)(a1 + 6448) = v86;
  v87 = *(_QWORD *)(a1 + 8184);
  if (v87)
    v88 = db2lin(*(_QWORD *)(a1 + 8208) + v87 + *(_QWORD *)(a1 + 8216)) * 0.000011921;
  else
    v88 = 0.0;
  v238 = (uint64_t *)(a1 + 6504);
  v239 = a1 + 160;
  v235 = a1 + 512;
  v89 = a1 + 8665;
  v90 = a1 + 2048;
  v91 = 10000.0;
  v92 = 0.001;
  v233 = 1;
  v236 = 1;
  v93 = v234;
  while (v93 >= 1)
  {
    if (*(_QWORD *)(a1 + 6448) >= v93)
      v94 = v93;
    else
      v94 = *(_QWORD *)(a1 + 6448);
    *(_QWORD *)(a1 + 6448) = v94;
    *(float *)(a1 + 6364) = (float)(1000 * v94) / *(float *)(a1 + 3652);
    v241 = v93;
    if (*(float *)(a1 + 6356) >= 0.0001)
    {
      v95 = *v238;
LABEL_94:
      *(_QWORD *)(a1 + 8232) = 0;
      *(_QWORD *)(a1 + 6560) = 0;
      if (v95)
        goto LABEL_95;
      v96 = 0;
      goto LABEL_103;
    }
    v95 = *(_QWORD *)(a1 + 6504);
    if (*(float *)(a1 + 6360) >= 0.0001)
      goto LABEL_94;
    if (v95)
    {
      *(_QWORD *)(a1 + 8232) = 0;
      *(_QWORD *)(a1 + 6560) = 0;
LABEL_95:
      if (v95 >= v94)
        v96 = v94;
      else
        v96 = v95;
      clr_vector(*(_DWORD **)(a1 + 4544), v96);
      *(_QWORD *)(a1 + 6504) -= v96;
      v97 = v94 - v96;
      OUTLINED_FUNCTION_7_68();
      v95 = *(_QWORD *)(a1 + 8232);
      goto LABEL_104;
    }
    if (!*(_QWORD *)(a1 + 6536))
    {
      v98 = *(_QWORD *)(a1 + 6512);
      if (!v98)
      {
        for (m = v94; v98 < m; m = *(_QWORD *)(a1 + 6448))
          *(_QWORD *)(v90 + 8 * v98++) = 0;
        goto LABEL_294;
      }
    }
    v95 = 0;
    v96 = 0;
    *(_QWORD *)(a1 + 6560) = 0;
LABEL_103:
    v97 = v94;
LABEL_104:
    v242 = v94;
    OUTLINED_FUNCTION_0_86(v95);
    v99 = *(_QWORD *)(a1 + 6512);
    if (v99)
    {
      if (v99 >= v97)
        v100 = v97;
      else
        v100 = *(_QWORD *)(a1 + 6512);
      *(_QWORD *)(a1 + 6480) = v100;
      v101 = *(float *)(a1 + 6416);
      v102 = v100 + v96;
      while (v96 < v102)
      {
        *(float *)(*(_QWORD *)(a1 + 4544) + 4 * v96) = v101
                                                     + (float)((float)-(float)(*(float *)(a1 + 6424) * v101) * v101);
        v101 = v101 + *(float *)(a1 + 6420);
        ++v96;
      }
      *(float *)(a1 + 6416) = v101;
      *(_QWORD *)(a1 + 6512) = v99 - v100;
      v97 -= v100;
      OUTLINED_FUNCTION_1_80(v100);
    }
    else
    {
      v102 = v96;
    }
    OUTLINED_FUNCTION_0_86(*(_QWORD *)(a1 + 8232));
    v104 = *(_QWORD *)(a1 + 6536);
    if (v104 && v97)
    {
      if (v104 >= v97)
        v105 = v97;
      else
        v105 = *(_QWORD *)(a1 + 6536);
      *(_QWORD *)(a1 + 6496) = v105;
      OUTLINED_FUNCTION_4_72(v103, v105);
      v106 = *(_QWORD *)(a1 + 6496);
      *(_QWORD *)(a1 + 6536) -= v106;
      v97 -= v106;
      v102 += v106;
      OUTLINED_FUNCTION_1_80(v106);
    }
    if (v102 < 1)
    {
      v107 = 0;
    }
    else
    {
      pole_filter(v239, *(float **)(a1 + 4544), v102);
      v107 = v102;
    }
    v240 = v107;
    if (v97 < 1)
      goto LABEL_199;
    v108 = *(float *)(a1 + 6376);
    if (v108 != 0.0)
    {
      v112 = *(_QWORD *)(a1 + 8176);
      if (v112)
      {
        if (v236)
        {
          v113 = *(float *)(v237 + 20);
          if (v113 != 0.0)
          {
            v114 = v92;
            v115 = v91;
            v116 = (float)(v108 * v113) * 0.0002;
            v117 = OUTLINED_FUNCTION_14_54(0.079796);
            v118 = v117 + OUTLINED_FUNCTION_14_54(0.044611);
            v119 = v116 * (float)(OUTLINED_FUNCTION_14_54(0.029531) + v118);
            v91 = v115;
            v92 = v114;
            *(_QWORD *)(a1 + 8248) = (uint64_t)v119;
            v108 = v108 + (float)(uint64_t)v119;
            *(float *)(a1 + 6376) = v108;
            if (v108 <= 0.0)
            {
              *(_DWORD *)(a1 + 6376) = 1065353216;
              v108 = 1.0;
            }
          }
          *(float *)(a1 + 6380) = v91 / v108;
          v120 = (float)(v91 / v108) * (float)(*(float *)(a1 + 3652) * v92);
          *(float *)(a1 + 6384) = v120;
          v121 = *(float *)(a1 + 6388);
          if (v121 > 0.0)
          {
            v122 = *(_QWORD *)(a1 + 8200) + v112 + *(_QWORD *)(a1 + 8208);
            if (v122 < 1)
            {
              *(_QWORD *)(a1 + 6436) = 0;
            }
            else
            {
              *(float *)(a1 + 6440) = 1.5 / (float)(v121 * v120);
              v123 = db2lin(v122);
              v124 = *(float *)(a1 + 6440);
              v125 = (float)(v123 * 18.469) * v124;
              *(float *)(a1 + 6436) = v125;
              *(float *)(a1 + 6440) = v124 / v125;
            }
          }
          v129 = *(float *)(a1 + 6372);
          if (*(_BYTE *)(a1 + 8660))
          {
            if (v129 == 0.0)
            {
              *(_WORD *)(a1 + 8660) = 0;
              goto LABEL_144;
            }
LABEL_142:
            v130 = 1.0 - (float)(v129 * 0.01);
            *(float *)(a1 + 6368) = v130;
            *(_QWORD *)(a1 + 6464) = (uint64_t)(float)((float)((float)(v129 * *(float *)(a1 + 6384))
                                                            * (float)(1.0 - *(float *)(a1 + 6388)))
                                                    * 0.01);
            if (v130 <= 0.0)
            {
              *(_QWORD *)(a1 + 6428) = 0;
            }
            else
            {
              *(float *)(a1 + 6428) = v130 * *(float *)(a1 + 6436);
              *(float *)(a1 + 6432) = *(float *)(a1 + 6440) / v130;
            }
          }
          else
          {
            if (v129 > 0.0)
            {
              *(_WORD *)(a1 + 8660) = 1;
              goto LABEL_142;
            }
LABEL_144:
            *v5 = *(_QWORD *)(a1 + 6436);
          }
          v131 = *(float *)(v237 + 16);
          if (v131 >= 35.0)
            v131 = 35.0;
          v132 = (uint64_t)v131;
          *(_QWORD *)(a1 + 8168) = (uint64_t)v131;
          if ((uint64_t)v131 && (v133 = *(float *)(a1 + 6356), v133 > 0.0001))
          {
            *(float *)(a1 + 232) = v133;
            *(_QWORD *)(a1 + 240) = 0;
            v134 = tl_table[v132];
            *(float *)v253 = v134;
            v135 = v134 * 0.375;
            v247[0] = v134 * 0.375;
            v136 = *(_DWORD *)(a1 + 8868);
            if (v136)
            {
              if (v136 == 2 || v136 == 1)
              {
                v233 = 0;
                v137 = (char *)&tilt16;
                goto LABEL_159;
              }
              if (v134 != *(float *)(a1 + 216))
                *(float *)(a1 + 6176) = OUTLINED_FUNCTION_5_69(v134);
              if (v135 != *(float *)(a1 + 220))
                *(float *)(a1 + 6260) = OUTLINED_FUNCTION_9_63();
              v233 = 0;
              if (v133 != 0.0)
              {
                v198 = *(float *)(a1 + 6260);
                v199 = -(float)(v198 * v198);
                *(float *)(a1 + 168) = v199;
                v200 = (float)(v198 * *(float *)(a1 + 6176)) + (float)(v198 * *(float *)(a1 + 6176));
                *(float *)(a1 + 160) = (float)(1.0 - v200) - v199;
                *(float *)(a1 + 164) = v200;
                *(_QWORD *)(a1 + 240) = 0;
              }
            }
            else
            {
              v233 = 0;
              v137 = (char *)&tilt8;
LABEL_159:
              v139 = &v137[12 * v132];
              *(_QWORD *)(a1 + 160) = *(_QWORD *)v139;
              *(_DWORD *)(a1 + 168) = *((_DWORD *)v139 + 2);
            }
          }
          else
          {
            *(_DWORD *)(a1 + 232) = 0;
          }
        }
        compute_voicing_size((float *)a1);
        v236 = 0;
        goto LABEL_172;
      }
    }
    if (*(_QWORD *)(a1 + 8184))
    {
      *(_QWORD *)(a1 + 6456) = v97;
      *(_QWORD *)(a1 + 6472) = v97;
      OUTLINED_FUNCTION_11_59();
      v111 = (uint64_t *)(v110 + 6560);
    }
    else
    {
      *(_QWORD *)(a1 + 6472) = 0;
      OUTLINED_FUNCTION_0_86(*(_QWORD *)(a1 + 8232));
      v111 = (uint64_t *)(a1 + 6456);
      v109 = v97;
    }
    *v111 = v97;
    *(_QWORD *)(a1 + 6488) = v109;
    OUTLINED_FUNCTION_11_59();
    *(_QWORD *)(v127 + 6560) = v126;
    v128 = clr_vector((_DWORD *)(*(_QWORD *)(a1 + 4544) + 4 * v102), v97);
    v97 = 0;
    *(_DWORD *)(a1 + 6392) = 0;
LABEL_172:
    while (v97 >= 1 && v97 >= *(_QWORD *)(a1 + 6456))
    {
      if (*(_BYTE *)(a1 + 8660))
      {
        if (*(_BYTE *)(a1 + 8661))
        {
          *v5 = *(_QWORD *)(a1 + 6428);
          v140 = *(_QWORD *)(a1 + 6464);
          *(_QWORD *)(a1 + 6496) = *(_QWORD *)(a1 + 6488) - v140;
          OUTLINED_FUNCTION_4_72((uint64_t)v128, v140);
          v141 = *(_QWORD *)(a1 + 6464);
          v102 += v141;
          OUTLINED_FUNCTION_1_80(v141);
          v142 = *(unsigned __int8 *)(a1 + 8661);
        }
        else
        {
          OUTLINED_FUNCTION_15_52();
        }
        *(_BYTE *)(a1 + 8661) = v142 == 0;
      }
      OUTLINED_FUNCTION_0_86(*(_QWORD *)(a1 + 8232));
      v143 = *(float *)(a1 + 6420);
      if (v143 == 0.0)
      {
        clr_vector((_DWORD *)(*(_QWORD *)(a1 + 4544) + 4 * v102), *(_QWORD *)(a1 + 6472));
        v145 = *(_QWORD *)(a1 + 6472);
        v146 = v145 + v102;
      }
      else
      {
        v144 = v143 * (float)(*(float *)(a1 + 6392) * *(float *)(a1 + 6408));
        v145 = *(_QWORD *)(a1 + 6472);
        v146 = v145 + v102;
        while (v102 < v146)
        {
          *(float *)(*(_QWORD *)(a1 + 4544) + 4 * v102) = v144
                                                        + (float)((float)-(float)(*(float *)(a1 + 6424) * v144) * v144);
          v144 = v144 + *(float *)(a1 + 6420);
          ++v102;
        }
      }
      v147 = a1 + 6560;
      *(_QWORD *)(a1 + 6560 + 8 * *(_QWORD *)(a1 + 8232)) += v145;
      OUTLINED_FUNCTION_3_77();
      *(_QWORD *)(v147 + 8 * v148) = 0;
      clr_vector((_DWORD *)(*(_QWORD *)(a1 + 4544) + 4 * v146), *(_QWORD *)(a1 + 6496));
      v149 = *(_QWORD *)(a1 + 6496);
      v102 = v149 + v146;
      *(_QWORD *)(v147 + 8 * *(_QWORD *)(a1 + 8232)) += v149;
      v97 -= *(_QWORD *)(a1 + 6456);
      compute_v_start((float *)a1);
      compute_voicing_size((float *)a1);
    }
    if (v97 < 1)
    {
      *(_QWORD *)(a1 + 6536) = 0;
      *v238 = 0;
      *(_QWORD *)(a1 + 6512) = 0;
    }
    else
    {
      if (*(_BYTE *)(a1 + 8660))
      {
        if (*(_BYTE *)(a1 + 8661))
        {
          *v5 = *(_QWORD *)(a1 + 6428);
          v151 = *(_QWORD *)(a1 + 6464);
          *(_QWORD *)(a1 + 6496) -= v151;
          if (v151 >= v97)
            v152 = v97;
          else
            v152 = v151;
          clr_vector((_DWORD *)(*(_QWORD *)(a1 + 4544) + 4 * v102), v152);
          *(_QWORD *)(a1 + 6504) = *(_QWORD *)(a1 + 6464) - v152;
          v102 += v152;
          v97 -= v152;
          OUTLINED_FUNCTION_7_68();
          v153 = *(unsigned __int8 *)(a1 + 8661);
        }
        else
        {
          OUTLINED_FUNCTION_15_52();
          *(_QWORD *)(a1 + 6504) = 0;
        }
        *(_BYTE *)(a1 + 8661) = v153 == 0;
      }
      OUTLINED_FUNCTION_0_86(*(_QWORD *)(a1 + 8232));
      v155 = *(_QWORD *)(a1 + 6472);
      if (v155 >= v97)
        v156 = v97;
      else
        v156 = *(_QWORD *)(a1 + 6472);
      *(_QWORD *)(a1 + 6480) = v156;
      v157 = *(float *)(a1 + 6420);
      v158 = (float)(*(float *)(a1 + 6392) * *(float *)(a1 + 6408)) * v157;
      if (v157 == 0.0)
      {
        OUTLINED_FUNCTION_4_72(v154, v156);
        v155 = *(_QWORD *)(a1 + 6472);
        v156 = *(_QWORD *)(a1 + 6480);
        v157 = *(float *)(a1 + 6420);
      }
      else
      {
        v159 = v156 + v102;
        while (v102 < v159)
        {
          *(float *)(*(_QWORD *)(a1 + 4544) + 4 * v102) = v158
                                                        + (float)((float)-(float)(*(float *)(a1 + 6424) * v158) * v158);
          v157 = *(float *)(a1 + 6420);
          v158 = v158 + v157;
          ++v102;
        }
      }
      *(float *)(a1 + 6416) = v158;
      *(_QWORD *)(a1 + 6512) = v155 - v156;
      *(_QWORD *)(a1 + 6520) = v155;
      *(_QWORD *)(a1 + 6528) = (uint64_t)v157;
      *(_QWORD *)(a1 + 6560 + 8 * *(_QWORD *)(a1 + 8232)) += v156;
      OUTLINED_FUNCTION_3_77();
      *(_QWORD *)(a1 + 6560 + 8 * v162) = 0;
      if (*(_QWORD *)(a1 + 6496) >= v97 - v160)
        v163 = v97 - v160;
      else
        v163 = *(_QWORD *)(a1 + 6496);
      clr_vector((_DWORD *)(*(_QWORD *)(a1 + 4544) + 4 * v161), v163);
      *(_QWORD *)(a1 + 6536) = *(_QWORD *)(a1 + 6496) - v163;
      *(_QWORD *)(a1 + 6560 + 8 * *(_QWORD *)(a1 + 8232)) += v163;
      compute_v_start((float *)a1);
    }
LABEL_199:
    OUTLINED_FUNCTION_3_77();
    *(_QWORD *)(a1 + 6560 + 8 * v164) = 0;
    OUTLINED_FUNCTION_3_77();
    *(_QWORD *)(v166 + 8 * v165) = 0;
    v167 = a1 + 8256;
    v94 = v242;
    if (*(_BYTE *)(a1 + 8663))
    {
      v168 = 0;
      v169 = 0;
      v170 = 0;
      while (v169 < *(_QWORD *)(a1 + 8232) / 2)
      {
        v171 = *(_QWORD *)(a1 + 16 * v169 + 6560) + v170;
        while (v168 < v171)
          *(_BYTE *)(v89 + v168++) = 0;
        v170 = *(_QWORD *)(a1 + ((16 * v169) | 8) + 6560) + v171;
        while (v168 < v170)
          *(_BYTE *)(v89 + v168++) = 1;
        ++v169;
      }
    }
    pole_filter(v239, (float *)(*(_QWORD *)(a1 + 4544) + 4 * v240), *(_QWORD *)(a1 + 6448) - v240);
    if (!*(_DWORD *)(a1 + 3676))
    {
      if (*(float *)(a1 + 6356) > 0.0001)
      {
        if (*(_QWORD *)(a1 + 8184))
        {
          *(_WORD *)(a1 + 8656) = noise((_BYTE *)a1, *(_WORD *)(a1 + 8656));
          mul1_vector((__int16 *)(a1 + 8256), v88, *(float **)(a1 + 4544), *(_QWORD *)(a1 + 6448));
        }
        OUTLINED_FUNCTION_8_64();
        pole_filter(a1 + 424, v172, v173);
        zero_filter(a1 + 248, (float *)(a1 + 2020), *(float **)(a1 + 4544), *(_QWORD *)(a1 + 6448));
        OUTLINED_FUNCTION_8_64();
        pole_filter(v235, v174, v175);
        zero_filter(a1 + 336, (float *)(a1 + 2032), *(float **)(a1 + 4544), *(_QWORD *)(a1 + 6448));
        v176 = *(_QWORD *)(a1 + 8160);
        v177 = v176 + 4;
        v178 = v235 + 88 * v176;
        while (v177 >= 6)
        {
          pole_filter(v178, *(float **)(a1 + 4544), *(_QWORD *)(a1 + 6448));
          --v177;
          v178 -= 88;
        }
        OUTLINED_FUNCTION_8_64();
        if (v183)
        {
          v167 = a1 + 8256;
          v184 = 2;
          v94 = v242;
          if (*(float *)(a1 + 672) != 0.0)
          {
            *(v179 - 2) = *(float *)(a1 + 652);
            v185 = *(float *)(a1 + 648);
            *(v179 - 1) = v185;
            v186 = 0;
            v187 = 0;
            v188 = 0;
            switch(*(_DWORD *)(a1 + 156))
            {
              case 0:
                v189 = *(_QWORD *)(a1 + 680);
                if (v189 >= v180)
                  v190 = v180;
                else
                  v190 = *(_QWORD *)(a1 + 680);
                v186 = v190 & ~(v190 >> 63);
                v191 = (float *)(a1 + 648 - 4 * v189);
                v192 = v186;
                for (n = v179; v192; --v192)
                {
                  v194 = (float)(v185 * *(v191 - 3)) + (float)(*(v191 - 6) * *n);
                  v195 = *v191++;
                  v185 = v194 + (float)(v195 * *(n - 2));
                  *n++ = v185;
                }
                *(_QWORD *)(a1 + 680) = v189 - v190;
                goto LABEL_240;
              case 1:
                goto LABEL_240;
              case 2:
                goto LABEL_228;
              case 3:
                goto LABEL_248;
              default:
                v186 = 0;
                if (*(_BYTE *)(a1 + 8665))
                  goto LABEL_227;
                break;
            }
LABEL_247:
            *(_DWORD *)(a1 + 156) = 3;
            v188 = v186;
LABEL_248:
            v205 = &v179[v188];
            v186 = v188;
            while (2)
            {
              if (v186 < v180)
              {
                if (!*(_BYTE *)(v89 + v186))
                {
                  *(float *)&v182 = *(v205 - 1);
                  *(float *)&v181 = *(float *)(a1 + 604) * *(float *)&v182;
                  OUTLINED_FUNCTION_6_68(*(float *)&v181 + (float)(*(float *)(a1 + 600) * *v205), *(float *)(a1 + 608), v181, v182, *(v205 - 2));
                  continue;
                }
                v197 = 3;
LABEL_296:
                *(_QWORD *)(a1 + 8240) = v197;
                *(_DWORD *)(a1 + 156) = 1;
LABEL_240:
                for (ii = &v179[v186];
                      ;
                      OUTLINED_FUNCTION_6_68(*(float *)&v181 + (float)(v204[3] * *ii), v204[9], v181, v182, *(ii - 2)))
                {
                  if (v186 >= v180)
                    goto LABEL_252;
                  v202 = *(_QWORD *)(a1 + 8240);
                  if (*(_BYTE *)(v89 + v186))
                  {
                    v203 = v202 - 1;
                    *(_QWORD *)(a1 + 8240) = v202 - 1;
                    if (v202 < 1)
                    {
LABEL_227:
                      *(_DWORD *)(a1 + 156) = v184;
                      v187 = v186;
LABEL_228:
                      v196 = &v179[v187];
                      v186 = v187;
                      while (1)
                      {
                        if (v186 >= v180)
                          goto LABEL_252;
                        if (!*(_BYTE *)(v89 + v186))
                          break;
                        *(float *)&v182 = *(v196 - 1);
                        *(float *)&v181 = *(float *)algn_25551E63C * *(float *)&v182;
                        OUTLINED_FUNCTION_6_68((float)(*(float *)algn_25551E63C * *(float *)&v182) + (float)(*(float *)f1d * *v196), *(float *)&dword_25551E640, v181, v182, *(v196 - 2));
                      }
                      v197 = -1;
                      goto LABEL_296;
                    }
                  }
                  else
                  {
                    v203 = v202 + 1;
                    *(_QWORD *)(a1 + 8240) = v202 + 1;
                    if (v202 > 1)
                      goto LABEL_247;
                  }
                  v204 = (float *)&f1d[v203];
                  *(float *)&v182 = *(ii - 1);
                  *(float *)&v181 = v204[6] * *(float *)&v182;
                }
              }
              break;
            }
LABEL_252:
            v206 = &v179[v186];
            v207 = v206 - 2;
            if (v180 <= 1)
              v207 = (float *)(a1 + 648);
            *(float *)(a1 + 652) = *v207;
            *(float *)(a1 + 648) = *(v206 - 1);
          }
        }
        else
        {
          pole_filter(a1 + 600, v179, v180);
          v167 = a1 + 8256;
          v94 = v242;
        }
        if (!*(_QWORD *)(a1 + 8184) && !*(_QWORD *)(a1 + 8176))
        {
          v208 = *(float *)(a1 + 6356) - *(float *)(a1 + 6364);
          *(float *)(a1 + 6356) = v208;
          if (v208 < 0.00001)
            *(_DWORD *)(a1 + 6356) = 0;
        }
      }
      if (*(float *)(a1 + 6360) <= 0.0001)
        goto LABEL_287;
      if (*(_QWORD *)(a1 + 0x2000))
      {
        v209 = noise((_BYTE *)a1, *(_WORD *)(a1 + 8658));
        v210 = 0;
        *(_WORD *)(a1 + 8658) = v209;
        v211 = *(_QWORD *)(a1 + 6448) & ~(*(uint64_t *)(a1 + 6448) >> 63);
        while (v211 != v210)
        {
          *(float *)(v167 + 4 * v210 - 3700) = (float)*(__int16 *)(v167 + 2 * v210);
          ++v210;
        }
      }
      if (*(float *)(v237 + 172) != 0.0 && *(_QWORD *)(a1 + 0x2000))
      {
        OUTLINED_FUNCTION_8_64();
        mulf_vector((float *)(a1 + 4556), v214, v212, v213);
      }
      v215 = 13;
      while (2)
      {
        if (v215 >= *(_QWORD *)(a1 + 8160) + 13)
        {
          v94 = v242;
          if (!*(_QWORD *)(a1 + 0x2000))
          {
            v226 = *(float *)(a1 + 6360) - *(float *)(a1 + 6364);
            *(float *)(a1 + 6360) = v226;
            if (v226 < 0.0001)
              *(_DWORD *)(a1 + 6360) = 0;
          }
          break;
        }
        v216 = a1 + 88 * v215;
        v218 = *(float *)(v216 + 232);
        v217 = (float *)(v216 + 232);
        if (v218 != 0.0)
        {
          v219 = v217 - 18;
          if (*(_QWORD *)(a1 + 0x2000))
          {
            v220 = v215 - 13;
            v221 = *(_QWORD *)(a1 + 6448);
            if (*((_QWORD *)&v243[-6] + v215 - 1))
            {
              for (jj = 0; (v221 & ~(v221 >> 63)) != jj; ++jj)
                *(_DWORD *)(*(_QWORD *)(a1 + 6168) + 4 * jj) = *(_DWORD *)(a1 + 4556 + 4 * jj);
              pole_filter((uint64_t)v219, *(float **)(a1 + 6168), v221);
              goto LABEL_280;
            }
          }
          else
          {
            v221 = *(_QWORD *)(a1 + 6448);
            v220 = v215 - 13;
          }
          parallel0_filter(v219, *(float **)(a1 + 6168), v221);
          if (!*((_QWORD *)v243 + v220))
          {
            v223 = *v217 - *(float *)(a1 + 6364);
            *v217 = v223;
            if (v223 < 0.0)
              *v217 = 0.0;
          }
LABEL_280:
          v224 = 0;
          v225 = *(_QWORD *)(a1 + 6448) & ~(*(uint64_t *)(a1 + 6448) >> 63);
          while (v225 != v224)
          {
            *(float *)(*(_QWORD *)(a1 + 4544) + 4 * v224) = *(float *)(*(_QWORD *)(a1 + 6168) + 4 * v224)
                                                          + *(float *)(*(_QWORD *)(a1 + 4544) + 4 * v224);
            ++v224;
          }
        }
        ++v215;
        continue;
      }
    }
LABEL_287:
    v227 = 0;
    v93 = v241;
    while (1)
    {
      m = *(_QWORD *)(a1 + 6448);
      if (v227 >= m)
        break;
      v228 = (uint64_t)*(float *)(*(_QWORD *)(a1 + 4544) + 4 * v227);
      *(_QWORD *)(v90 + 8 * v227) = v228;
      if (v228 < 0)
        v228 = -v228;
      if (v228 > *(_QWORD *)(a1 + 6552))
        *(_QWORD *)(a1 + 6552) = v228;
      ++v227;
    }
LABEL_294:
    v93 -= v94;
    output_speech(a1, m);
  }
  *(float *)(a1 + 6352) = *(float *)(a1 + 6352) + (float)(*(float *)v237 * *(float *)(a1 + 3648));
  *(_QWORD *)(a1 + 6544) += v234;
  v229 = v233;
  v230 = (float *)(a1 + 88 * v233 + 232);
  while (v229 <= 20)
  {
    if (*v230 == 0.0)
    {
      *((_QWORD *)v230 - 3) = 0;
      v231 = 0;
      v232 = 0.0;
    }
    else
    {
      v231 = v253[v229];
      v232 = v247[v229];
      *((_QWORD *)v230 - 1) = *(_QWORD *)(v230 - 17);
    }
    *((_DWORD *)v230 - 4) = v231;
    *(v230 - 3) = v232;
    ++v229;
    v230 += 22;
  }
  return 1;
}

float db2lin(uint64_t a1)
{
  ldiv_t v1;

  if (a1 < 1)
    return 0.0;
  if (a1 >= 400)
    a1 = 400;
  v1 = ldiv(a1, 20);
  return p10[v1.quot] * l10[v1.rem];
}

float pole_filter(uint64_t a1, float *a2, uint64_t a3)
{
  float result;
  float *v4;
  float v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float *v9;
  float *v10;
  uint64_t i;
  float v12;
  float v13;
  float *v14;

  result = *(float *)(a1 + 72);
  if (result != 0.0)
  {
    *(a2 - 2) = *(float *)(a1 + 52);
    v4 = (float *)(a1 + 48);
    v5 = *(float *)(a1 + 48);
    *(a2 - 1) = v5;
    v6 = *(_QWORD *)(a1 + 80);
    if (v6)
    {
      if (v6 >= a3)
        v7 = a3;
      else
        v7 = *(_QWORD *)(a1 + 80);
      v8 = v7 & ~(v7 >> 63);
      v9 = (float *)(a1 - 4 * v6 + 48);
      v10 = a2;
      for (i = v8; i; --i)
      {
        v12 = (float)(*(v9 - 3) * v5) + (float)(*(v9 - 6) * *v10);
        v13 = *v9++;
        v5 = v12 + (float)(v13 * *(v10 - 2));
        *v10++ = v5;
      }
      *(_QWORD *)(a1 + 80) = v6 - v7;
    }
    else
    {
      v8 = 0;
    }
    v14 = &a2[v8 - 2];
    while (v8 < a3)
    {
      v14[2] = (float)((float)(*(float *)(a1 + 4) * v14[1]) + (float)(*(float *)a1 * v14[2]))
             + (float)(*(float *)(a1 + 8) * *v14);
      ++v8;
      ++v14;
    }
    if (a3 > 1)
      v4 = v14;
    *(float *)(a1 + 52) = *v4;
    result = v14[1];
    *(float *)(a1 + 48) = result;
  }
  return result;
}

double compute_voicing_size(float *a1)
{
  float v1;
  float v2;
  float v3;
  uint64_t v4;
  double result;
  uint64_t v6;

  v1 = a1[1595];
  v2 = a1[1598];
  v3 = a1[1602];
  v4 = (uint64_t)((float)((float)(v1 - v2) * v3) + 0.9999);
  result = (float)(v3 * (float)-(float)(v2 - (float)(a1[1597] * v1))) + 0.4999;
  *((_QWORD *)a1 + 807) = v4;
  *((_QWORD *)a1 + 809) = (uint64_t)result;
  *((_QWORD *)a1 + 810) = (uint64_t)result;
  v6 = v4 - (uint64_t)result;
  *((_QWORD *)a1 + 811) = v6;
  *((_QWORD *)a1 + 812) = v6;
  return result;
}

float compute_v_start(float *a1)
{
  float result;

  result = (float)(a1[1598] + (float)((float)*((uint64_t *)a1 + 807) * a1[1603])) - a1[1595];
  a1[1598] = result;
  return result;
}

uint64_t noise(_BYTE *a1, __int16 a2)
{
  uint64_t v2;
  _WORD *v3;
  uint64_t i;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;

  a1[8865] = 0;
  *((_WORD *)a1 + 4128) = 20077 * a2 + 12345;
  v2 = *((_QWORD *)a1 + 806);
  v3 = a1 + 8258;
  for (i = 1; ; ++i)
  {
    v5 = *(v3 - 1);
    if (i >= v2)
      break;
    *v3++ = 20077 * v5 + 12345;
  }
  if (*((_QWORD *)a1 + 1022))
  {
    v6 = 0;
    v7 = 0;
    v8 = *((_QWORD *)a1 + 820);
    v9 = (*((_QWORD *)a1 + 1029) / 2) & ~((*((_QWORD *)a1 + 1029) / 2) >> 63);
    while (v6 != v9)
    {
      while (v7 < v8)
      {
        *(_WORD *)&a1[2 * v7 + 8256] = *(__int16 *)&a1[2 * v7 + 8256] >> 1;
        ++v7;
      }
      v10 = &a1[16 * v6];
      v7 += *((_QWORD *)v10 + 821);
      v8 = v7 + *((_QWORD *)v10 + 822);
      ++v6;
    }
  }
  return v5;
}

uint64_t zero_filter(uint64_t result, float *a2, float *a3, uint64_t a4)
{
  float v4;
  float v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float *v9;
  uint64_t v10;
  float *v11;
  float v12;
  float v13;

  if (*(float *)(result + 72) != 0.0)
  {
    v5 = *(float *)(result + 48);
    v4 = *(float *)(result + 52);
    v6 = *(_QWORD *)(result + 80);
    if (v6)
    {
      if (v6 >= a4)
        v7 = a4;
      else
        v7 = *(_QWORD *)(result + 80);
      v8 = v7 & ~(v7 >> 63);
      v9 = (float *)(result - 4 * v6 + 24);
      v10 = v8;
      v11 = a3;
      while (1)
      {
        v12 = v5;
        if (!v10)
          break;
        v5 = *v11;
        *v11 = (float)((float)(v12 * v9[3]) + (float)(*v9 * *v11)) + (float)(v9[6] * v4);
        ++v11;
        --v10;
        ++v9;
        v4 = v12;
      }
      *(_QWORD *)(result + 80) = v6 - v7;
    }
    else
    {
      v8 = 0;
    }
    while (1)
    {
      v13 = v5;
      if (v8 >= a4)
        break;
      v5 = a3[v8];
      a3[v8++] = (float)((float)(v13 * a2[1]) + (float)(*a2 * v5)) + (float)(a2[2] * v4);
      v4 = v13;
    }
    if (a4 <= 1)
      v4 = *(float *)(result + 48);
    *(float *)(result + 48) = v5;
    *(float *)(result + 52) = v4;
  }
  return result;
}

BOOL klattSetVolumeMultiplier(const char **a1, float a2)
{
  uint64_t v2;
  _BOOL8 result;

  result = OUTLINED_FUNCTION_2_79(a1);
  if (result)
    *(float *)(v2 + 148) = a2;
  return result;
}

void OUTLINED_FUNCTION_0_86(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = a1 + 1;
  *(_QWORD *)(v1 + 8232) = v2;
  *(_QWORD *)(v1 + 8 * v2 + 6560) = 0;
}

void OUTLINED_FUNCTION_1_80(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8 * *(_QWORD *)(v1 + 8232) + 6560) += a1;
}

BOOL OUTLINED_FUNCTION_2_79(const char **a1)
{
  return verifyKlattHandle(a1);
}

void OUTLINED_FUNCTION_3_77()
{
  uint64_t v0;

  ++*(_QWORD *)(v0 + 8232);
}

_DWORD *OUTLINED_FUNCTION_4_72(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return clr_vector((_DWORD *)(*(_QWORD *)(v2 + 4544) + 4 * v3), a2);
}

float OUTLINED_FUNCTION_5_69(float a1)
{
  uint64_t v1;

  return cosf(a1 * *(float *)(v1 + 6404));
}

float OUTLINED_FUNCTION_6_68(float a1, float a2, double a3, double a4, float a5)
{
  float *v5;
  float result;

  result = a1 + (float)(a2 * a5);
  *v5 = result;
  return result;
}

void OUTLINED_FUNCTION_7_68()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 8 * *(_QWORD *)(v0 + 8232) + 6560) += v1;
}

float OUTLINED_FUNCTION_9_63()
{
  uint64_t v0;
  float v1;

  return expf(-(float)(*(float *)(v0 + 6400) * v1));
}

float OUTLINED_FUNCTION_10_62(float a1)
{
  uint64_t v1;

  return expf(-(float)(*(float *)(v1 + 6400) * a1));
}

void OUTLINED_FUNCTION_11_59()
{
  uint64_t v0;

  ++*(_QWORD *)(v0 + 8232);
}

float OUTLINED_FUNCTION_14_54(float a1)
{
  float v1;

  return sinf(v1 * a1);
}

double OUTLINED_FUNCTION_15_52()
{
  uint64_t v0;
  double *v1;
  double result;

  result = v1[2];
  *v1 = result;
  *(_QWORD *)(v0 + 6496) = *(_QWORD *)(v0 + 6488);
  return result;
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
  OUTLINED_FUNCTION_0_87();
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
        for (i = a1[2] - 1; i >= a1[3] + v7; OUTLINED_FUNCTION_1_81(i))
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
  OUTLINED_FUNCTION_0_87();
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
      for (i = a1[2]; i >= a1[3] + v6; OUTLINED_FUNCTION_1_81(i))
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
  OUTLINED_FUNCTION_0_87();
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
  return OUTLINED_FUNCTION_2_80(a1, v2);
}

uint64_t dynaBufMoveAbs(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  if ((a2 & 0x80000000) != 0)
    v2 = *(_QWORD *)(a1 + 16);
  else
    v2 = a2;
  return OUTLINED_FUNCTION_2_80(a1, v2);
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

void OUTLINED_FUNCTION_1_81(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v2 + a1) = *(_BYTE *)(v2 + a1 + v1);
}

uint64_t OUTLINED_FUNCTION_2_80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a1 + 24) = a2;
  return a2;
}

uint64_t errorIgnore()
{
  return 0;
}

uint64_t errorStd(uint64_t a1, const char *a2, char *a3, ...)
{
  FILE **v4;
  va_list va;

  va_start(va, a3);
  v4 = (FILE **)MEMORY[0x24BDAC8D8];
  if (a2 && *a2)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s: ", a2);
  vfprintf(*v4, a3, va);
  fwrite(".\n", 2uLL, 1uLL, *v4);
  return 0;
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
      OUTLINED_FUNCTION_0_88((uint64_t)result, a2, a3, a4, a5, a6, a7, a8, v16);
      return (_BYTE *)(OUTLINED_FUNCTION_1_82(v8, v9, v10, v11, v12, v13, v14, v15, v17) == 0);
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
    OUTLINED_FUNCTION_0_88((uint64_t)result, a2, a3, a4, a5, a6, a7, a8, v16);
    if ((OUTLINED_FUNCTION_1_82(v8, v9, v10, v11, v12, v13, v14, v15, v17) & 0x80000000) != 0)
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
    OUTLINED_FUNCTION_0_88(result, a2, a3, a4, a5, a6, a7, a8, *(uint64_t *)&v10.st_dev);
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
      __s = fileFindInPath();
      if (!(_DWORD)__s)
        return __s;
      v4 = strlen(a2);
      a2[v4 - strlen(v2)] = 0;
    }
    return 1;
  }
  return __s;
}

uint64_t fileFindInPath()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  const char *v12;
  size_t v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char __s[4097];
  uint64_t v26;

  v0 = (char *)MEMORY[0x24BDAC7A8]();
  v26 = *MEMORY[0x24BDAC8D0];
  if (!v0)
    return 0;
  v8 = v0;
  if (!*v0)
    return 0;
  v9 = (char *)v1;
  if (fileExists(v0, v1, v2, v3, v4, v5, v6, v7))
  {
    if (v9)
      strcpy(v9, v8);
    return 1;
  }
  v11 = getenv("PATH");
  if (!v11)
    return 0;
  v12 = v11;
  v13 = strlen(v11);
  v14 = (char *)malloc_type_malloc(v13 + 1, 0xE885C551uLL);
  v15 = strcpy(v14, v12);
  if (strtok(v15, ":"))
  {
    while (1)
    {
      __strcpy_chk();
      v16 = &__s[strlen(__s)];
      *v16 = 47;
      strcpy(v16 + 1, v8);
      if (fileExists(__s, v17, v18, v19, v20, v21, v22, v23))
        break;
      if (!strtok(0, ":"))
        goto LABEL_11;
    }
    if (v9)
      strcpy(v9, __s);
    v10 = 1;
  }
  else
  {
LABEL_11:
    v10 = 0;
  }
  free(v14);
  return v10;
}

void OUTLINED_FUNCTION_0_88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  bzero(&a9, 0x90uLL);
}

uint64_t OUTLINED_FUNCTION_1_82(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  const char *v9;

  return stat(v9, (stat *)&a9);
}

_BYTE *hashNew(int a1, char a2, int a3)
{
  _BYTE *v6;
  _BYTE *v7;
  int v9;
  void *v11;

  v6 = malloc_type_malloc(0x18uLL, 0x10A0040E78F1B74uLL);
  v7 = v6;
  if (v6)
  {
    if (a1 < 1)
    {
      a1 = 211;
    }
    else if (a3)
    {
      if ((a1 & 1) == 0 && a1 < 0x7FFFFFFE)
        ++a1;
LABEL_9:
      if (a1 <= 2147483645)
      {
        v9 = 2;
        while (v9 < a1)
        {
          if (!(a1 % v9++))
          {
            a1 += 2;
            goto LABEL_9;
          }
        }
      }
    }
    *(_DWORD *)v6 = a1;
    v6[4] = a2;
    v11 = malloc_type_calloc(a1, 8uLL, 0x2004093837F09uLL);
    *((_QWORD *)v7 + 1) = v11;
    if (!v11)
    {
      OUTLINED_FUNCTION_4_73();
      return 0;
    }
  }
  return v7;
}

uint64_t hashDelete(int *a1, int a2, int a3)
{
  uint64_t i;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  if (a1)
  {
    if (*((_QWORD *)a1 + 1))
    {
      for (i = 0; ; ++i)
      {
        v7 = (_QWORD *)*((_QWORD *)a1 + 1);
        if (i >= *a1)
          break;
        v8 = v7[i];
        if (v8)
        {
          do
          {
            v9 = *(_QWORD *)(v8 + 8);
            if (a2 && *((_BYTE *)a1 + 4))
              free(*(void **)v8);
            if (a3)
              free(*(void **)(v8 + 16));
            free((void *)v8);
            v8 = v9;
          }
          while (v9);
        }
      }
      free(v7);
    }
    OUTLINED_FUNCTION_4_73();
  }
  return OUTLINED_FUNCTION_5_70();
}

void hashInsertInt(uint64_t a1, int a2, uint64_t a3)
{
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  OUTLINED_FUNCTION_2_81();
  v9 = (v6 - v8 * v7);
  v11 = *(_QWORD *)(*(_QWORD *)(v10 + 8) + 8 * v9);
  v12 = OUTLINED_FUNCTION_1_83();
  if (v12)
  {
    *(_DWORD *)v12 = a2;
    v12[1] = v11;
    v12[2] = a3;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v9) = v12;
  }
  OUTLINED_FUNCTION_0_89();
}

uint64_t hashLookupInt(uint64_t a1, unsigned int a2)
{
  _DWORD **i;
  _DWORD *v3;

  for (i = (_DWORD **)(*(_QWORD *)(a1 + 8)
                      + 8
                      * (((((unsigned __int16)a2 ^ HIWORD(a2)) >> 10) & 0xF ^ (unsigned __int16)a2 ^ HIWORD(a2))
                       % *(_DWORD *)a1)); ; i = (_DWORD **)(v3 + 2))
  {
    v3 = *i;
    if (!v3)
      return OUTLINED_FUNCTION_5_70();
    if (*v3 == a2)
      break;
  }
  return OUTLINED_FUNCTION_7_69((uint64_t)v3);
}

uint64_t hashDeleteInt()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  OUTLINED_FUNCTION_2_81();
  v5 = (v2 - v4 * v3);
  v7 = *(_QWORD *)(v6 + 8);
  v8 = *(_QWORD *)(v7 + 8 * v5);
  if (*(_DWORD *)v8 == v0)
  {
    *(_QWORD *)(v7 + 8 * v5) = *(_QWORD *)(v8 + 8);
    if (v1)
LABEL_3:
      free(*(void **)(v8 + 16));
  }
  else
  {
    do
    {
      v10 = v8;
      v8 = *(_QWORD *)(v8 + 8);
      if (!v8)
        return 0;
    }
    while (*(_DWORD *)v8 != v0);
    *(_QWORD *)(v10 + 8) = *(_QWORD *)(v8 + 8);
    if (v1)
      goto LABEL_3;
  }
  OUTLINED_FUNCTION_4_73();
  return 1;
}

uint64_t hashMoveInt(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  unsigned int v8;
  _QWORD *v9;
  uint64_t v10;

  v3 = 0;
  v4 = ((((unsigned __int16)a2 ^ HIWORD(a2)) >> 10) & 0xF ^ (unsigned __int16)a2 ^ HIWORD(a2))
     % *(_DWORD *)a1;
  v5 = (uint64_t *)(*(_QWORD *)(a1 + 8) + 8 * v4);
  while (1)
  {
    v6 = *v5;
    if (!*v5)
      return OUTLINED_FUNCTION_5_70();
    if (*(_DWORD *)v6 == a2)
      break;
    v5 = (uint64_t *)(v6 + 8);
    v3 = v6;
  }
  v8 = ((((unsigned __int16)a3 ^ HIWORD(a3)) >> 10) & 0xF ^ (unsigned __int16)a3 ^ HIWORD(a3))
     % *(_DWORD *)a1;
  *(_DWORD *)v6 = a3;
  if (v8 != (_DWORD)v4)
  {
    if (v3)
      v9 = (_QWORD *)(v3 + 8);
    else
      v9 = (_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v4);
    *v9 = *(_QWORD *)(v6 + 8);
    v10 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(v6 + 8) = *(_QWORD *)(v10 + 8 * v8);
    *(_QWORD *)(v10 + 8 * v8) = v6;
  }
  return OUTLINED_FUNCTION_7_69(v6);
}

void hashInsertString(int *a1, _BYTE *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  _QWORD *v7;

  v5 = OUTLINED_FUNCTION_3_78(a1, a2);
  v6 = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 8 * v5);
  v7 = OUTLINED_FUNCTION_1_83();
  if (v7)
  {
    v7[1] = v6;
    v7[2] = v3;
    *v7 = v4;
    *(_QWORD *)(*(_QWORD *)(v2 + 8) + 8 * v5) = v7;
  }
  OUTLINED_FUNCTION_0_89();
}

uint64_t stringHashFunction(int *a1, _BYTE *a2)
{
  unint64_t v2;

  v2 = 0;
  while (*a2)
  {
    v2 = (char)*a2 + 16 * v2;
    if ((v2 & 0xF0000000) != 0)
      v2 = v2 & 0xFFFFFFFF0FFFFFFFLL ^ ((unint64_t)(v2 & 0xF0000000) >> 24);
    ++a2;
  }
  return (v2 % *a1);
}

uint64_t hashLookupString(uint64_t a1, char *a2)
{
  uint64_t v3;
  uint64_t *i;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = (uint64_t *)(v3 + 8 * (int)stringHashFunction((int *)a1, a2)); ; i = (uint64_t *)(v5 + 8))
  {
    v5 = *i;
    if (!*i)
      return 0;
    if (!strcmp(*(const char **)v5, a2))
      break;
  }
  return *(_QWORD *)(v5 + 16);
}

void hashDeleteString(uint64_t a1, _BYTE *a2, int a3, int a4)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7 = stringHashFunction((int *)a1, a2);
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(v8 + 8 * v7);
  if (OUTLINED_FUNCTION_6_69())
  {
    while (1)
    {
      v10 = v9;
      v9 = *(_QWORD *)(v9 + 8);
      if (!v9)
        break;
      if (!OUTLINED_FUNCTION_6_69())
      {
        *(_QWORD *)(v10 + 8) = *(_QWORD *)(v9 + 8);
        if (a3)
          goto LABEL_7;
        goto LABEL_8;
      }
    }
  }
  else
  {
    *(_QWORD *)(v8 + 8 * v7) = *(_QWORD *)(v9 + 8);
    if (a3)
LABEL_7:
      free(*(void **)v9);
LABEL_8:
    if (a4)
      free(*(void **)(v9 + 16));
    OUTLINED_FUNCTION_4_73();
  }
  OUTLINED_FUNCTION_0_89();
}

uint64_t hashMoveString(int *a1, _BYTE *a2)
{
  uint64_t v2;
  _BYTE *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v10;
  _QWORD *v11;
  uint64_t v12;

  v5 = 0;
  v6 = (int)OUTLINED_FUNCTION_3_78(a1, a2);
  v7 = (uint64_t *)(*(_QWORD *)(v2 + 8) + 8 * v6);
  while (1)
  {
    v8 = *v7;
    if (!*v7)
      return 0;
    if (!strcmp(*(const char **)v8, v4))
      break;
    v7 = (uint64_t *)(v8 + 8);
    v5 = v8;
  }
  v10 = stringHashFunction((int *)v2, v3);
  *(_QWORD *)v8 = v3;
  if (v10 != (_DWORD)v6)
  {
    if (v5)
      v11 = (_QWORD *)(v5 + 8);
    else
      v11 = (_QWORD *)(*(_QWORD *)(v2 + 8) + 8 * v6);
    *v11 = *(_QWORD *)(v8 + 8);
    v12 = *(_QWORD *)(v2 + 8);
    *(_QWORD *)(v8 + 8) = *(_QWORD *)(v12 + 8 * v10);
    *(_QWORD *)(v12 + 8 * v10) = v8;
  }
  return *(_QWORD *)(v8 + 16);
}

BOOL hashIterConstruct(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)a1 = a2;
  *(_DWORD *)(a1 + 8) = 0;
  v2 = **(_QWORD **)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v2;
  return v2 || hashIterNext(a1);
}

BOOL hashIterNext(uint64_t a1)
{
  uint64_t i;
  uint64_t v2;

  i = *(_QWORD *)(a1 + 16);
  if (!i)
    goto LABEL_4;
  for (i = *(_QWORD *)(i + 8); ; i = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 8 * v2))
  {
    *(_QWORD *)(a1 + 16) = i;
LABEL_4:
    if (i)
      break;
    v2 = *(int *)(a1 + 8) + 1;
    *(_DWORD *)(a1 + 8) = v2;
    if ((int)v2 >= **(_DWORD **)a1)
    {
      *(_DWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 0;
      return i != 0;
    }
  }
  return i != 0;
}

uint64_t hashIterInt(uint64_t a1)
{
  return **(unsigned int **)(a1 + 16);
}

uint64_t hashIterString(uint64_t a1)
{
  return **(_QWORD **)(a1 + 16);
}

uint64_t hashIterRef(uint64_t a1)
{
  return OUTLINED_FUNCTION_7_69(*(_QWORD *)(a1 + 16));
}

void *OUTLINED_FUNCTION_1_83()
{
  return malloc_type_malloc(0x18uLL, 0x10F2040DD287011uLL);
}

uint64_t OUTLINED_FUNCTION_3_78(int *a1, _BYTE *a2)
{
  return stringHashFunction(a1, a2);
}

void OUTLINED_FUNCTION_4_73()
{
  void *v0;

  free(v0);
}

uint64_t OUTLINED_FUNCTION_5_70()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_6_69()
{
  const char **v0;
  const char *v1;

  return strcmp(*v0, v1);
}

uint64_t OUTLINED_FUNCTION_7_69@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t ECollection::size(ECollection *this)
{
  unsigned int (***v1)(_QWORD);
  uint64_t v2;
  void *v4;
  unsigned int (***v5)(_QWORD);

  v4 = &unk_24E46A9A0;
  v1 = (unsigned int (***)(_QWORD))(*(uint64_t (**)(ECollection *))(*(_QWORD *)this + 8))(this);
  v2 = 0;
  v5 = v1;
  while ((**v1)(v1))
  {
    ((void (*)(unsigned int (***)(_QWORD), _QWORD))(*v5)[5])(v5, 0);
    v2 = (v2 + 1);
    v1 = v5;
  }
  ECollectIter::~ECollectIter((ECollectIter *)&v4);
  return v2;
}

void sub_21F8934BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  ECollectIter::~ECollectIter((ECollectIter *)&a9);
  _Unwind_Resume(a1);
}

uint64_t ECollectIter::inBounds(ECollectIter *this)
{
  return (***((uint64_t (****)(_QWORD))this + 1))(*((_QWORD *)this + 1));
}

uint64_t ECollectIter::operator++(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 40))(*(_QWORD *)(a1 + 8));
}

{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 32))(*(_QWORD *)(a1 + 8));
}

uint64_t EList::reset(EList *this)
{
  uint64_t result;

  while (1)
  {
    result = OUTLINED_FUNCTION_6_70();
    if ((_DWORD)result)
      break;
    (*(void (**)(EList *))(*(_QWORD *)this + 64))(this);
  }
  return result;
}

void ESList::ESList(ESList *this, const ESList *a2)
{
  uint64_t *v2;
  uint64_t v3;

  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  v2 = (uint64_t *)((char *)a2 + 8);
  *(_QWORD *)this = off_24E46A748;
  while (1)
  {
    v3 = *v2;
    if (!*v2)
      break;
    OUTLINED_FUNCTION_4_74();
    v2 = (uint64_t *)(v3 + 16);
  }
  OUTLINED_FUNCTION_8_65();
}

BOOL ESListIter::inBounds(ESListIter *this)
{
  return *((_QWORD *)this + 2) != 0;
}

uint64_t ESListIter::operator()(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t ESListIter::operator++(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(v1 + 16);
  return v1;
}

{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
  *(_QWORD *)(a1 + 16) = v1;
  return v1;
}

void ESList::operator=(EList *a1)
{
  uint64_t v1;
  uint64_t *i;
  uint64_t v3;

  OUTLINED_FUNCTION_14_55(a1);
  for (i = (uint64_t *)(v1 + 8); ; i = (uint64_t *)(v3 + 16))
  {
    v3 = *i;
    if (!*i)
      break;
    OUTLINED_FUNCTION_4_74();
  }
  OUTLINED_FUNCTION_8_65();
}

void ESList::addToHead(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;

  v6 = (_QWORD *)OUTLINED_FUNCTION_3_79();
  *v6 = a2;
  v6[1] = a3;
  v6[2] = *(_QWORD *)(a1 + 8);
  if (OUTLINED_FUNCTION_13_55())
    *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 8) = v6;
  OUTLINED_FUNCTION_2_82();
}

void ESList::addToTail(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;

  v6 = (_QWORD *)OUTLINED_FUNCTION_3_79();
  *v6 = a2;
  v6[1] = a3;
  v6[2] = 0;
  if (OUTLINED_FUNCTION_6_70())
    v7 = (_QWORD *)(a1 + 8);
  else
    v7 = (_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
  *v7 = v6;
  *(_QWORD *)(a1 + 16) = v6;
  OUTLINED_FUNCTION_2_82();
}

uint64_t ESList::addToTail(ESList *this, ESList *a2)
{
  _QWORD *v4;
  uint64_t v5;

  if ((**(unsigned int (***)(ESList *))this)(this))
    v4 = (_QWORD *)((char *)this + 8);
  else
    v4 = (_QWORD *)(*((_QWORD *)this + 2) + 16);
  *v4 = *((_QWORD *)a2 + 1);
  v5 = *((_QWORD *)a2 + 2);
  if (v5)
    *((_QWORD *)this + 2) = v5;
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  return 1;
}

void ESList::addAfter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void);

  OUTLINED_FUNCTION_10_63();
  if (v3)
  {
    OUTLINED_FUNCTION_12_57();
    OUTLINED_FUNCTION_5_71(v8, v9, v10, v11);
  }
  else
  {
    v4 = v2;
    v5 = (_QWORD *)OUTLINED_FUNCTION_3_79();
    v6 = *(_QWORD *)(v4 + 16);
    v7 = *(_QWORD *)(v6 + 16);
    *v5 = v1;
    v5[1] = v0;
    v5[2] = v7;
    *(_QWORD *)(v6 + 16) = v5;
    OUTLINED_FUNCTION_2_82();
  }
}

void ESList::removeHead(ESList *this)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *((_QWORD *)this + 1);
  if (v2 == *((_QWORD *)this + 2))
  {
    v3 = 0;
    *((_QWORD *)this + 2) = 0;
  }
  else
  {
    v3 = *(_QWORD *)(v2 + 16);
  }
  *((_QWORD *)this + 1) = v3;
  OUTLINED_FUNCTION_0_90();
}

void ESList::removeAfter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 + 16);
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v4 + 16);
  if (v4 == *(_QWORD *)(a1 + 16))
    *(_QWORD *)(a1 + 16) = v3;
  OUTLINED_FUNCTION_0_90();
}

void ESList::newIter(ESList *this)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)OUTLINED_FUNCTION_7_70();
  *v2 = &off_24E46A890;
  v2[1] = v1;
  v2[2] = *(_QWORD *)(v1 + 8);
  OUTLINED_FUNCTION_8_65();
}

BOOL ESListIter::atEnd(ESListIter *this)
{
  return *((_QWORD *)this + 2) == *(_QWORD *)(*((_QWORD *)this + 1) + 16);
}

uint64_t ESListIter::resetToTail(ESListIter *this)
{
  return OUTLINED_FUNCTION_11_60((uint64_t)this, *(_QWORD *)(*((_QWORD *)this + 1) + 16));
}

uint64_t ESListIter::reset(ESListIter *this)
{
  return OUTLINED_FUNCTION_11_60((uint64_t)this, *(_QWORD *)(*((_QWORD *)this + 1) + 8));
}

void EDList::EDList(EDList *this, const EDList *a2)
{
  uint64_t *v2;
  uint64_t v3;

  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  v2 = (uint64_t *)((char *)a2 + 8);
  *(_QWORD *)this = off_24E46A7B8;
  while (1)
  {
    v3 = *v2;
    if (!*v2)
      break;
    OUTLINED_FUNCTION_4_74();
    v2 = (uint64_t *)(v3 + 16);
  }
  OUTLINED_FUNCTION_8_65();
}

BOOL EDListIter::inBounds(EDListIter *this)
{
  return *((_QWORD *)this + 2) != 0;
}

uint64_t EDListIter::operator()(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t EDListIter::operator++(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(v1 + 16);
  return v1;
}

{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
  *(_QWORD *)(a1 + 16) = v1;
  return v1;
}

void EDList::operator=(EList *a1)
{
  uint64_t v1;
  uint64_t *i;
  uint64_t v3;

  OUTLINED_FUNCTION_14_55(a1);
  for (i = (uint64_t *)(v1 + 8); ; i = (uint64_t *)(v3 + 16))
  {
    v3 = *i;
    if (!*i)
      break;
    OUTLINED_FUNCTION_4_74();
  }
  OUTLINED_FUNCTION_8_65();
}

void EDList::addToHead(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;

  v6 = (_QWORD *)OUTLINED_FUNCTION_1_84();
  *v6 = a2;
  v6[1] = a3;
  v6[2] = *(_QWORD *)(a1 + 8);
  v6[3] = 0;
  if (OUTLINED_FUNCTION_13_55())
    v7 = (_QWORD *)(a1 + 16);
  else
    v7 = (_QWORD *)(*(_QWORD *)(a1 + 8) + 24);
  *v7 = v6;
  *(_QWORD *)(a1 + 8) = v6;
  OUTLINED_FUNCTION_2_82();
}

void EDList::addToTail(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (_QWORD *)OUTLINED_FUNCTION_1_84();
  v7 = *(_QWORD *)(a1 + 16);
  *v6 = a2;
  v6[1] = a3;
  v6[2] = 0;
  v6[3] = v7;
  if (OUTLINED_FUNCTION_6_70())
    v8 = (_QWORD *)(a1 + 8);
  else
    v8 = (_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
  *v8 = v6;
  *(_QWORD *)(a1 + 16) = v6;
  OUTLINED_FUNCTION_2_82();
}

void EDList::addAfter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void);

  OUTLINED_FUNCTION_10_63();
  if (v3)
  {
    OUTLINED_FUNCTION_12_57();
    OUTLINED_FUNCTION_5_71(v8, v9, v10, v11);
  }
  else
  {
    v4 = v2;
    v5 = (_QWORD *)OUTLINED_FUNCTION_1_84();
    v6 = *(_QWORD *)(v4 + 16);
    v7 = *(_QWORD *)(v6 + 16);
    *v5 = v1;
    v5[1] = v0;
    v5[2] = v7;
    v5[3] = v6;
    *(_QWORD *)(v7 + 24) = v5;
    *(_QWORD *)(v6 + 16) = v5;
    OUTLINED_FUNCTION_2_82();
  }
}

void EDList::addBefore(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  if (*(_QWORD *)(a2 + 16) == a1[1])
  {
    OUTLINED_FUNCTION_5_71((uint64_t)a1, a3, a4, *(uint64_t (**)(void))(*a1 + 40));
  }
  else
  {
    v7 = (_QWORD *)OUTLINED_FUNCTION_1_84();
    v8 = *(_QWORD *)(a2 + 16);
    v9 = *(_QWORD *)(v8 + 24);
    *v7 = a3;
    v7[1] = a4;
    v7[2] = v8;
    v7[3] = v9;
    *(_QWORD *)(v9 + 16) = v7;
    *(_QWORD *)(v8 + 24) = v7;
    OUTLINED_FUNCTION_2_82();
  }
}

void EDList::removeHead(EDList *this)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)((char *)this + 16);
  v2 = *((_QWORD *)this + 1);
  if (v2 == *((_QWORD *)this + 2))
  {
    v3 = 0;
  }
  else
  {
    v3 = *(_QWORD *)(v2 + 16);
    v1 = (_QWORD *)(v3 + 24);
  }
  *v1 = 0;
  *((_QWORD *)this + 1) = v3;
  OUTLINED_FUNCTION_0_90();
}

void EDList::removeTail(EDList *this)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *((_QWORD *)this + 2);
  v2 = (_QWORD *)((char *)this + 8);
  if (*((_QWORD *)this + 1) == v1)
  {
    v3 = 0;
  }
  else
  {
    v3 = *(_QWORD *)(v1 + 24);
    v2 = (_QWORD *)(v3 + 16);
  }
  *v2 = 0;
  *((_QWORD *)this + 2) = v3;
  OUTLINED_FUNCTION_0_90();
}

uint64_t EDList::removeAt(EDList *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 16);
  if (v3 != *((_QWORD *)a1 + 1))
  {
    if (v3 != *((_QWORD *)a1 + 2))
    {
      v4 = *(_QWORD *)(v3 + 16);
      *(_QWORD *)(v4 + 24) = *(_QWORD *)(v3 + 24);
      *(_QWORD *)(*(_QWORD *)(v3 + 24) + 16) = v4;
      OUTLINED_FUNCTION_0_90();
    }
    OUTLINED_FUNCTION_9_64(a1);
  }
  return (*(uint64_t (**)(EDList *))(*(_QWORD *)a1 + 64))(a1);
}

void EDList::removeAfter(EDList *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4 != *((_QWORD *)a1 + 2))
  {
    v5 = *(_QWORD *)(v4 + 16);
    *(_QWORD *)(v5 + 24) = v3;
    *(_QWORD *)(v3 + 16) = v5;
    OUTLINED_FUNCTION_0_90();
  }
  OUTLINED_FUNCTION_9_64(a1);
}

void EDList::newIter(EDList *this)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)OUTLINED_FUNCTION_7_70();
  *v2 = &off_24E46A938;
  v2[1] = v1;
  v2[2] = *(_QWORD *)(v1 + 8);
  OUTLINED_FUNCTION_8_65();
}

BOOL EDListIter::atStart(EDListIter *this)
{
  return *((_QWORD *)this + 2) == *(_QWORD *)(*((_QWORD *)this + 1) + 8);
}

BOOL EDListIter::atEnd(EDListIter *this)
{
  return *((_QWORD *)this + 2) == *(_QWORD *)(*((_QWORD *)this + 1) + 16);
}

uint64_t EDListIter::resetToTail(EDListIter *this)
{
  return OUTLINED_FUNCTION_11_60((uint64_t)this, *(_QWORD *)(*((_QWORD *)this + 1) + 16));
}

uint64_t EDListIter::reset(EDListIter *this)
{
  return OUTLINED_FUNCTION_11_60((uint64_t)this, *(_QWORD *)(*((_QWORD *)this + 1) + 8));
}

BOOL ESList::isEmpty(ESList *this)
{
  return *((_QWORD *)this + 1) == 0;
}

void sub_21F893BCC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2207CC9B0](v1, 0xA1C409BE6959DLL);
  _Unwind_Resume(a1);
}

uint64_t ESListIter::next(ESListIter *this)
{
  return *(_QWORD *)(*((_QWORD *)this + 2) + 16);
}

BOOL EDList::isEmpty(EDList *this)
{
  return *((_QWORD *)this + 1) == 0;
}

uint64_t EDList::head(EDList *this)
{
  return *((_QWORD *)this + 1);
}

uint64_t EDList::tail(EDList *this)
{
  return *((_QWORD *)this + 2);
}

void EDList::~EDList(EDList *this)
{
  EDList::~EDList(this);
  JUMPOUT(0x2207CC9B0);
}

{
  *(_QWORD *)this = off_24E46A7B8;
  EList::reset(this);
}

void sub_21F893C68(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2207CC9B0](v1, 0xA1C409BE6959DLL);
  _Unwind_Resume(a1);
}

uint64_t EDListIter::next(EDListIter *this)
{
  return *(_QWORD *)(*((_QWORD *)this + 2) + 16);
}

uint64_t ECollectIter::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 8))(*(_QWORD *)(a1 + 8));
}

uint64_t ECollectIter::atEnd(ECollectIter *this)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1));
}

uint64_t ECollectIter::next(ECollectIter *this)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1));
}

uint64_t ECollectIter::reset(ECollectIter *this)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 48))(*((_QWORD *)this + 1));
}

void ECollectIter::~ECollectIter(ECollectIter *this)
{
  ECollectIter::~ECollectIter(this);
  JUMPOUT(0x2207CC9B0);
}

{
  *(_QWORD *)this = &unk_24E46A9A0;
  MEMORY[0x2207CC9B0](*((_QWORD *)this + 1), 0x81C40B8603338);
}

void OUTLINED_FUNCTION_0_90()
{
  JUMPOUT(0x2207CC9B0);
}

uint64_t OUTLINED_FUNCTION_1_84()
{
  return operator new();
}

uint64_t OUTLINED_FUNCTION_3_79()
{
  return operator new();
}

uint64_t OUTLINED_FUNCTION_4_74()
{
  uint64_t v0;
  _QWORD *v1;

  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v0 + 48))(v0, *v1, v1[1]);
}

uint64_t OUTLINED_FUNCTION_5_71(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_6_70()
{
  uint64_t (***v0)(_QWORD);

  return (**v0)(v0);
}

uint64_t OUTLINED_FUNCTION_7_70()
{
  return operator new();
}

void OUTLINED_FUNCTION_9_64(EDList *a1@<X8>)
{
  EDList::removeTail(a1);
}

uint64_t OUTLINED_FUNCTION_11_60@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(result + 16) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_13_55()
{
  uint64_t (**v0)(uint64_t);
  uint64_t v1;

  return (*v0)(v1);
}

uint64_t OUTLINED_FUNCTION_14_55(EList *a1)
{
  return EList::reset(a1);
}

uint64_t IndexQueue::addOffsetFromLast(IndexQueue *this, unsigned int a2, uint64_t a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(IndexQueue *, _QWORD))(*(_QWORD *)this + 48))(this, a2);
  if ((_DWORD)result)
  {
    *((_QWORD *)this + 3) += a3;
    return 1;
  }
  return result;
}

uint64_t IndexQueue::reduceLeadTime(IndexQueue *this, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  v2 = a2;
  if (*(_QWORD *)(OUTLINED_FUNCTION_1_85((uint64_t)this) + 8) < a2)
    v2 = *(_QWORD *)(OUTLINED_FUNCTION_0_91() + 8);
  v3 = OUTLINED_FUNCTION_0_91();
  *(_QWORD *)(v3 + 8) -= v2;
  return OUTLINED_FUNCTION_2_83();
}

uint64_t IndexQueue::reduceLeadTime(IndexQueue *this)
{
  OUTLINED_FUNCTION_1_85((uint64_t)this);
  *(_QWORD *)(OUTLINED_FUNCTION_0_91() + 8) = 0;
  return OUTLINED_FUNCTION_2_83();
}

uint64_t IndexQueue::increaseLeadTime(IndexQueue *this, uint64_t a2)
{
  uint64_t result;

  result = (**(uint64_t (***)(IndexQueue *))this)(this);
  if (!(_DWORD)result)
  {
    *((_QWORD *)this + 3) += a2;
    result = (*(uint64_t (**)(IndexQueue *))(*(_QWORD *)this + 24))(this);
    *(_QWORD *)(result + 8) += a2;
  }
  return result;
}

void IndexQueue::remove(IndexQueue *this)
{
  ESList *v1;

  OUTLINED_FUNCTION_1_85((uint64_t)this);
  *((_QWORD *)v1 + 3) -= *(_QWORD *)(OUTLINED_FUNCTION_0_91() + 8);
  ESList::removeHead(v1);
}

uint64_t sub_21F893FBC()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_0_91()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 24))(v0);
}

uint64_t OUTLINED_FUNCTION_1_85(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
}

uint64_t OUTLINED_FUNCTION_2_83()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 24) -= v1;
  return v1;
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
    *(_QWORD *)&v2[OUTLINED_FUNCTION_10_64()] = 0x696E692E696365;
  }
}

void IniFileWriter::~IniFileWriter(IniFileWriter *this)
{
  if (*((_QWORD *)this + 514))
    OUTLINED_FUNCTION_0_92();
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
    v7 = OUTLINED_FUNCTION_1_86();
    *(_WORD *)v7 = 23306;
    strcpy((char *)(v7 + 2), a2);
    *(_WORD *)(v7 + OUTLINED_FUNCTION_10_64()) = 93;
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
          v17 = (char *)OUTLINED_FUNCTION_1_86();
          OUTLINED_FUNCTION_8_66();
          strcpy(v20, (const char *)(v18 + v19));
          OUTLINED_FUNCTION_7_71(this, 0, a3);
          if (v21)
          {
            while (1)
            {
              v22 = *v17;
              v23 = OUTLINED_FUNCTION_2_84();
              v24 = v23;
              if (!v22)
                break;
              if (v23)
                OUTLINED_FUNCTION_4_75(*v17);
              OUTLINED_FUNCTION_11_61();
              if (!v24)
                goto LABEL_38;
            }
            if (v23)
              OUTLINED_FUNCTION_5_72();
          }
LABEL_38:
          OUTLINED_FUNCTION_0_92();
        }
        if (IniFileWriter::goEndKey(this))
        {
          v38 = *((_QWORD *)this + 515);
          v28 = IniFileWriter::goEndData(this, &v38);
          v29 = v38;
          strlen((const char *)(*((_QWORD *)this + 514) + v38));
          v30 = (char *)OUTLINED_FUNCTION_1_86();
          v31 = v30;
          if (v28)
          {
            strcpy(v30, (const char *)(*((_QWORD *)this + 514) + v29));
            OUTLINED_FUNCTION_7_71(this, 0, 0);
            v32 = v31;
            if (v33)
            {
              while (1)
              {
                v34 = *v32;
                v35 = OUTLINED_FUNCTION_2_84();
                v36 = v35;
                if (!v34)
                  break;
                if (v35)
                  OUTLINED_FUNCTION_4_75(*v32);
                OUTLINED_FUNCTION_3_80();
                ++v32;
                if (!v36)
                  goto LABEL_38;
              }
              if (v35)
                OUTLINED_FUNCTION_5_72();
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
      OUTLINED_FUNCTION_7_71(this, v25, a3);
      if (v26 && OUTLINED_FUNCTION_2_84())
      {
        OUTLINED_FUNCTION_5_72();
        IniFileWriter::writeFileFromMemory(this);
      }
    }
    OUTLINED_FUNCTION_0_92();
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

  *(_OWORD *)((char *)this + 4120) = xmmword_21F8A20F0;
  if (*((_QWORD *)this + 514))
    OUTLINED_FUNCTION_0_92();
  *((_QWORD *)this + 514) = OUTLINED_FUNCTION_1_86();
  v4 = fopen((const char *)this + 8, a2);
  *(_QWORD *)this = v4;
  if (!v4)
    return 0;
LABEL_4:
  v5 = fgetc(v4);
  v6 = 1;
  while (v6 && v5 != -1)
  {
    v6 = OUTLINED_FUNCTION_2_84();
    if (v6)
    {
      OUTLINED_FUNCTION_8_66();
      *(_BYTE *)(v7 + v8) = v5;
      OUTLINED_FUNCTION_3_80();
      v4 = *(FILE **)this;
      goto LABEL_4;
    }
  }
  if (v6)
  {
    v9 = OUTLINED_FUNCTION_2_84();
    if ((_DWORD)v9)
      OUTLINED_FUNCTION_5_72();
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
    v9 = OUTLINED_FUNCTION_2_84();
    if (!v8)
      break;
    if (v9)
      OUTLINED_FUNCTION_4_75(*a2);
    OUTLINED_FUNCTION_11_61();
    if (!v10)
      return;
  }
  if (v9)
  {
    OUTLINED_FUNCTION_6_71();
    if (v5)
    {
LABEL_12:
      while (1)
      {
        v11 = *v5;
        v12 = OUTLINED_FUNCTION_2_84();
        if (!v11)
          break;
        if (v12)
          OUTLINED_FUNCTION_4_75(*v5);
        OUTLINED_FUNCTION_3_80();
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
            v17 = OUTLINED_FUNCTION_2_84();
            if (!v16)
              break;
            if (v17)
              OUTLINED_FUNCTION_4_75(*a4);
            OUTLINED_FUNCTION_3_80();
            ++a4;
            if (!v18)
              return;
          }
          if (v17)
            OUTLINED_FUNCTION_6_71();
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
    OUTLINED_FUNCTION_3_80();
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
    OUTLINED_FUNCTION_10_64();
    v4 = OUTLINED_FUNCTION_1_86();
    *(_BYTE *)v4 = 91;
    strcpy((char *)(v4 + 1), a2);
    *(_WORD *)(v4 + strlen((const char *)v4)) = 93;
    v5 = strlen(this[514]);
    this[515] = (const char *)IniFileWriter::stringSearch((IniFileWriter *)this, (const char *)v4, 0, v5);
    OUTLINED_FUNCTION_0_92();
  }
  OUTLINED_FUNCTION_9_65();
}

void IniFileWriter::doubleBuffer(IniFileWriter *this)
{
  uint64_t v2;
  void *v3;
  const void *v4;

  v2 = 2 * *((_QWORD *)this + 516);
  v3 = (void *)OUTLINED_FUNCTION_1_86();
  v4 = (const void *)*((_QWORD *)this + 514);
  memcpy(v3, v4, *((_QWORD *)this + 516));
  if (v4)
    OUTLINED_FUNCTION_0_92();
  *((_QWORD *)this + 514) = v3;
  *((_QWORD *)this + 516) = v2;
  OUTLINED_FUNCTION_9_65();
}

void OUTLINED_FUNCTION_0_92()
{
  JUMPOUT(0x2207CC9A4);
}

uint64_t OUTLINED_FUNCTION_1_86()
{
  return operator new[]();
}

uint64_t OUTLINED_FUNCTION_2_84()
{
  IniFileWriter *v0;

  return IniFileWriter::ensureBufferSpace(v0);
}

void OUTLINED_FUNCTION_3_80()
{
  uint64_t v0;

  ++*(_QWORD *)(v0 + 4120);
}

void OUTLINED_FUNCTION_4_75(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)(v1 + 4112) + *(_QWORD *)(v1 + 4120)) = a1;
}

void OUTLINED_FUNCTION_5_72()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 4112) + *(_QWORD *)(v0 + 4120)) = 0;
}

void OUTLINED_FUNCTION_6_71()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 4112);
  v2 = *(_QWORD *)(v0 + 4120);
  *(_QWORD *)(v0 + 4120) = v2 + 1;
  *(_BYTE *)(v1 + v2) = 10;
}

void OUTLINED_FUNCTION_7_71(IniFileWriter *a1, char *a2, char *a3)
{
  char *v3;

  IniFileWriter::writeToMemory(a1, a2, a3, v3);
}

size_t OUTLINED_FUNCTION_10_64()
{
  const char *v0;

  return strlen(v0);
}

void OUTLINED_FUNCTION_11_61()
{
  uint64_t v0;

  ++*(_QWORD *)(v0 + 4120);
}

void RequestLicense::RequestLicense(RequestLicense *this)
{
  OUTLINED_FUNCTION_0_93((uint64_t)this, (uint64_t)&off_24E46AA10);
}

{
  OUTLINED_FUNCTION_0_93((uint64_t)this, (uint64_t)&off_24E46AA10);
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

uint64_t OUTLINED_FUNCTION_0_93@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)result = a2;
  *(_BYTE *)(result + 8) = 1;
  return result;
}

void init_new(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = malloc_type_malloc(0x260uLL, 0x10F004008EEF3F9uLL);
  *(_QWORD *)(a1 + 184) = v2;
  bzero(v2, 0x260uLL);
  v3 = malloc_type_malloc(0x30uLL, 0x10040436913F5uLL);
  **(_QWORD **)(a1 + 184) = v3;
  *v3 = "STATEMENT";
  OUTLINED_FUNCTION_4_76();
  *(_QWORD *)(v4 + 8) = "TEST";
  OUTLINED_FUNCTION_4_76();
  *(_QWORD *)(v5 + 16) = "NULL";
  OUTLINED_FUNCTION_4_76();
  *(_QWORD *)(v6 + 24) = "LOOP";
  OUTLINED_FUNCTION_4_76();
  *(_QWORD *)(v7 + 32) = "COMMAND";
  *(_QWORD *)(**(_QWORD **)(a1 + 184) + 40) = &unk_21F8A2128;
  v8 = *(_QWORD *)(a1 + 184);
  *(_DWORD *)(v8 + 8) = 3;
  *(_DWORD *)(v8 + 28) = 2;
  *(_BYTE *)(v8 + 444) = 5;
  *(_BYTE *)(v8 + 496) = 1;
  *(_QWORD *)(v8 + 528) = &unk_21F8A2128;
}

void init_delete(uint64_t a1)
{
  void **v2;

  if (a1)
  {
    v2 = *(void ***)(a1 + 184);
    if (*v2)
    {
      free(*v2);
      v2 = *(void ***)(a1 + 184);
      *v2 = 0;
    }
    bzero(v2, 0x260uLL);
    free(*(void **)(a1 + 184));
    *(_QWORD *)(a1 + 184) = 0;
  }
}

uint64_t notspecialvar()
{
  return 0;
}

void vcmdinit(uint64_t a1)
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
  int v15;
  int v16;

  v2 = *(_QWORD *)(a1 + 184);
  v3 = *(_QWORD *)(a1 + 192);
  *(_QWORD *)(v2 + 472) = 14000;
  *(_QWORD *)(v3 + 8864) = 1;
  *(_DWORD *)(v3 + 9084) = *(unsigned __int8 *)(a1 + 288) + 6;
  if (logicalIOInit(a1, *(_DWORD *)(v2 + 448) + *(unsigned __int8 *)(a1 + 304), (uint64_t)errorIgnore))
  {
    v4 = builtInLogicalFiles(a1);
    v5 = (int)v4;
    while (v5 < *(unsigned __int8 *)(a1 + 304))
    {
      v4 = vfdef_lf(a1, *(_QWORD *)(*(_QWORD *)(a1 + 296) + 8 * v5++));
      if ((_DWORD)v4 == -1)
        return;
    }
    OUTLINED_FUNCTION_2_85(v4, **(char **)(a1 + 216), "null", (_OWORD *)(*(_QWORD *)(a1 + 216) + 240));
    if ((_DWORD)v6)
    {
      OUTLINED_FUNCTION_0_94(v6, *(char *)(*(_QWORD *)(a1 + 216) + 5), "null", (_OWORD *)(*(_QWORD *)(a1 + 216) + 240));
      if ((_DWORD)v7)
      {
        OUTLINED_FUNCTION_2_85(v7, *(char *)(*(_QWORD *)(a1 + 216) + 1), "null", (_OWORD *)(*(_QWORD *)(a1 + 216) + 240));
        if ((_DWORD)v8)
        {
          OUTLINED_FUNCTION_0_94(v8, *(char *)(*(_QWORD *)(a1 + 216) + 4), "null", (_OWORD *)(*(_QWORD *)(a1 + 216) + 240));
          if ((_DWORD)v9)
          {
            OUTLINED_FUNCTION_0_94(v9, *(char *)(*(_QWORD *)(a1 + 216) + 2), "null", (_OWORD *)(*(_QWORD *)(a1 + 216) + 240));
            if ((_DWORD)v10)
            {
              OUTLINED_FUNCTION_3_81(v10, "pgmin");
              if ((_DWORD)v11)
              {
                OUTLINED_FUNCTION_1_87(v11, "pgmout");
                if ((_DWORD)v12)
                {
                  OUTLINED_FUNCTION_3_81(v12, "cmdin");
                  if ((_DWORD)v13)
                  {
                    OUTLINED_FUNCTION_1_87(v13, "cmdout");
                    if ((_DWORD)v14)
                    {
                      OUTLINED_FUNCTION_1_87(v14, "prompt");
                      if (v15)
                      {
                        if (vmeminit(a1))
                        {
                          if (vdelinit(a1))
                          {
                            vdltinit(a1, 1);
                            if (v16)
                            {
                              if (vdictinit(a1))
                                vlinkinit(a1);
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void vcmdend(int a1, int a2)
{
  exit(a2);
}

void OUTLINED_FUNCTION_0_94(uint64_t a1, int a2, const char *a3, _OWORD *a4)
{
  uint64_t v4;

  logicalFileAddPhysical(v4, a2, a3, a4, 0, 1);
}

void OUTLINED_FUNCTION_1_87(uint64_t a1, char *a2)
{
  uint64_t v2;

  logicalFileOpen(v2, a2, 1);
}

void OUTLINED_FUNCTION_2_85(uint64_t a1, int a2, const char *a3, _OWORD *a4)
{
  uint64_t v4;

  logicalFileAddPhysical(v4, a2, a3, a4, 0, 0);
}

void OUTLINED_FUNCTION_3_81(uint64_t a1, char *a2)
{
  uint64_t v2;

  logicalFileOpen(v2, a2, 0);
}

uint64_t vlinkinit(uint64_t result)
{
  uint64_t v1;
  uint64_t i;
  uint64_t v3;
  __int16 *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = 0;
  for (i = 9224; ; i += 120)
  {
    v3 = *(_QWORD *)(result + 192);
    v4 = (__int16 *)(v3 + 9112);
    if (v1 >= *(__int16 *)(v3 + 9114))
      break;
    v5 = (_QWORD *)(v3 + i);
    v6 = *(_QWORD *)(v3 + i - 48);
    if (v6)
    {
      **(_QWORD **)v6 = v5 - 7;
      **(_QWORD **)(v6 + 8) = *v5;
      **(_QWORD **)(v6 + 24) = *(_QWORD *)(v6 + 16);
    }
    ++v1;
  }
  v7 = *v4 & ~(*v4 >> 31);
  v8 = (uint64_t *)(v3 + 9136);
  if ((*v4 & ~(*v4 >> 31)) != 0)
  {
    do
    {
      v9 = *(v8 - 2);
      if (v9)
      {
        v10 = *(_QWORD *)(v9 + 8);
        if (v10)
        {
          v11 = *(_QWORD *)(v10 + 16) + 80 * *((__int16 *)v8 - 4);
          *v8 = v11;
          *(_QWORD *)(v11 + 40) = v9;
        }
      }
      --v7;
      v8 += 3;
    }
    while (v7);
  }
  return result;
}

double logio_new(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  _OWORD *v15;
  __int128 v16;
  double result;
  __int128 v18;

  if (a1)
  {
    v2 = malloc_type_malloc(0x178uLL, 0x10D0040C1D992DBuLL);
    *(_QWORD *)(a1 + 216) = v2;
    bzero(v2, 0x178uLL);
    v3 = *(_QWORD *)(a1 + 216);
    *(_WORD *)(v3 + 4) = -1;
    *(_DWORD *)v3 = -1;
    v4 = *(_OWORD *)&off_25551D248;
    *(_OWORD *)(v3 + 80) = xmmword_25551D238;
    *(_OWORD *)(v3 + 96) = v4;
    v5 = *(_OWORD *)algn_25551D228;
    *(_OWORD *)(v3 + 48) = diskFileClass_glob;
    *(_OWORD *)(v3 + 64) = v5;
    v6 = *(_OWORD **)(a1 + 216);
    v7 = *(_OWORD *)algn_25551D268;
    v6[7] = dynaBufFileClass_glob;
    v6[8] = v7;
    v8 = *(_OWORD *)&off_25551D288;
    v6[9] = xmmword_25551D278;
    v6[10] = v8;
    v9 = *(_OWORD **)(a1 + 216);
    v10 = *(_OWORD *)&off_25551D2C8;
    v9[13] = xmmword_25551D2B8;
    v9[14] = v10;
    v11 = *(_OWORD *)algn_25551D2A8;
    v9[11] = stdTermFileClass_glob;
    v9[12] = v11;
    v12 = *(_OWORD **)(a1 + 216);
    v13 = *(_OWORD *)&off_25551D308;
    v12[17] = xmmword_25551D2F8;
    v12[18] = v13;
    v14 = *(_OWORD *)algn_25551D2E8;
    v12[15] = nullFileClass_glob;
    v12[16] = v14;
    v15 = *(_OWORD **)(a1 + 216);
    v16 = *(_OWORD *)algn_25551D328;
    v15[19] = stdErrorFileClass_glob;
    v15[20] = v16;
    result = *(double *)&xmmword_25551D338;
    v18 = *(_OWORD *)&off_25551D348;
    v15[21] = xmmword_25551D338;
    v15[22] = v18;
  }
  return result;
}

void logio_delete(uint64_t a1)
{
  void *v2;

  if (a1)
  {
    v2 = *(void **)(a1 + 216);
    if (v2)
    {
      bzero(v2, 0x178uLL);
      free(*(void **)(a1 + 216));
      *(_QWORD *)(a1 + 216) = 0;
    }
  }
}

uint64_t logicalIOInit(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v4 = *(_QWORD *)(a1 + 216);
  *(_QWORD *)(v4 + 32) = a3;
  *(_DWORD *)(v4 + 16) = a2;
  result = (uint64_t)malloc_type_calloc(0x40uLL, a2, 0x999E51CDuLL);
  *(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) = result;
  if (result)
  {
    OUTLINED_FUNCTION_3_82(result, "pgmin");
    **(_BYTE **)(a1 + 216) = v6;
    if ((_DWORD)v6 == -1)
      return 0;
    OUTLINED_FUNCTION_3_82(v6, "pgmout");
    *(_BYTE *)(*(_QWORD *)(a1 + 216) + 5) = v7;
    if ((_DWORD)v7 == -1)
      return 0;
    OUTLINED_FUNCTION_3_82(v7, "cmdin");
    *(_BYTE *)(*(_QWORD *)(a1 + 216) + 1) = v8;
    if ((_DWORD)v8 == -1)
      return 0;
    OUTLINED_FUNCTION_3_82(v8, "cmdout");
    *(_BYTE *)(*(_QWORD *)(a1 + 216) + 4) = v9;
    if ((_DWORD)v9 == -1)
      return 0;
    OUTLINED_FUNCTION_3_82(v9, "prompt");
    *(_BYTE *)(*(_QWORD *)(a1 + 216) + 2) = v10;
    if ((_DWORD)v10 == -1)
      return 0;
    OUTLINED_FUNCTION_3_82(v10, "prmout");
    v12 = *(_QWORD *)(a1 + 216);
    *(_BYTE *)(v12 + 3) = v11;
    if (v11 == -1)
    {
      return 0;
    }
    else
    {
      *(_DWORD *)(v12 + 20) = v11 + 1;
      return 1;
    }
  }
  return result;
}

void addLogicalFile(uint64_t a1, char *a2)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  char v8;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  if (a2)
  {
    vffind_lf(a1, a2);
    v4 = *(_QWORD *)(a1 + 216);
    if (v5 == -1)
    {
      v6 = 0;
      v7 = *(_QWORD *)(v4 + 8);
      do
        v8 = v6;
      while (*(unsigned __int8 *)(v7 + ((uint64_t)(char)v6++ << 6)));
      if (*(_DWORD *)(v4 + 16) <= v8)
      {
        (*(void (**)(uint64_t, const char *, const char *))(v4 + 32))(a1, "LOGIO", "There are too many interactive lfiles; use a bigger -lfiles argument on the DeltaTools command line");
        goto LABEL_11;
      }
      v10 = v7 + ((uint64_t)v8 << 6);
      strncpy((char *)v10, a2, 0x14uLL);
      v12 = (_QWORD *)(v10 + 48);
      v11 = *(_QWORD *)(v10 + 48);
      *(_QWORD *)(v10 + 28) = 0;
      *(_QWORD *)(v10 + 20) = 0;
      *(_DWORD *)(v10 + 44) = 0;
      *(_QWORD *)(v10 + 36) = 0;
      if (v11)
      {
        dynaBufReset(v11);
        if (*v12)
          goto LABEL_11;
      }
      else
      {
        v13 = dynaBufNew(0);
        *v12 = v13;
        if (v13)
          goto LABEL_11;
      }
      *(_BYTE *)v10 = 0;
      goto LABEL_11;
    }
    (*(void (**)(uint64_t, const char *, const char *))(v4 + 32))(a1, "LFILE", "%s is already defined");
  }
LABEL_11:
  OUTLINED_FUNCTION_0_95();
}

void logicalIOCleanup(uint64_t a1)
{
  uint64_t v1;
  char i;

  v1 = *(_QWORD *)(a1 + 216);
  if (*(_QWORD *)(v1 + 8))
  {
    for (i = 0; *(_DWORD *)(v1 + 16) > i; ++i)
    {
      if (*(_BYTE *)(*(_QWORD *)(v1 + 8) + ((uint64_t)i << 6)))
      {
        vfundef_lf();
        v1 = *(_QWORD *)(a1 + 216);
      }
    }
    *(_DWORD *)(v1 + 16) = 0;
    free(*(void **)(v1 + 8));
    *(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) = 0;
  }
}

void vfundef_lf()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void **v9;

  OUTLINED_FUNCTION_9_66();
  v4 = *(_QWORD **)(v3 + 40);
  if (v4)
  {
    do
    {
      v5 = (_QWORD *)v4[2];
      removeOutputElement(v0, v4, v1);
      v4 = v5;
    }
    while (v5);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(v0 + 216) + 8) + (v2 << 6);
  *(_QWORD *)(v6 + 32) = 0;
  v7 = *(_QWORD *)(v6 + 24);
  if (v7)
  {
    do
    {
      v8 = *(_QWORD *)(v7 + 72);
      (*(void (**)(uint64_t))(v7 + 64))(v7 + 8);
      free(*(void **)v7);
      free((void *)v7);
      v7 = v8;
    }
    while (v8);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v0 + 216) + 8) + (v2 << 6)) = 0;
  v9 = (void **)OUTLINED_FUNCTION_5_73();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 216) + 8) + (v2 << 6) + 48) = dynaBufDelete(v9);
  OUTLINED_FUNCTION_8_67();
}

void vffind_lf(uint64_t a1, _BYTE *a2)
{
  char v2;
  uint64_t v3;
  int v4;

  if (a2 && *a2)
  {
    v2 = 0;
    v3 = *(_QWORD *)(a1 + 216);
    v4 = *(_DWORD *)(v3 + 16);
    while (v4 > v2 && OUTLINED_FUNCTION_15_53((const char *)(*(_QWORD *)(v3 + 8) + ((uint64_t)v2 << 6))))
      ++v2;
  }
  OUTLINED_FUNCTION_1_88();
}

unint64_t logicalFileName(uint64_t a1, int a2)
{
  uint64_t v2;

  if (a2 < 0)
    return 0;
  v2 = *(_QWORD *)(a1 + 216);
  if (*(_DWORD *)(v2 + 16) < (int)a2)
    return 0;
  else
    return *(_QWORD *)(v2 + 8) + ((unint64_t)a2 << 6);
}

BOOL vf_eof(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + ((uint64_t)a2 << 6);
  if (*(_DWORD *)(v2 + 20) != 1)
    return 0;
  v3 = *(_QWORD *)(v2 + 32);
  return !v3 || (*(unsigned int (**)(uint64_t))(v3 + 56))(v3 + 8) != 0;
}

uint64_t builtInLogicalFiles(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 216) + 20);
}

void vfstat(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  _QWORD **v21;
  _QWORD *v22;
  uint64_t v23;
  int v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int v41;
  int v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t v46;

  if ((a2 & 0x80000000) == 0)
  {
    v9 = *(_QWORD *)(a1 + 216);
    if (*(_DWORD *)(v9 + 16) >= (int)a2)
    {
      v10 = *(_QWORD *)(v9 + 8);
      v11 = a2;
      if (*(_BYTE *)(v10 + ((unint64_t)a2 << 6)))
      {
        vf_printf(a1, a3, 1, "  %.70s (%s)\n", a5, a6, a7, a8, v10 + ((_BYTE)a2 << 6));
        if (v13)
        {
          v14 = v10 + (v11 << 6);
          v15 = (_QWORD *)(v14 + 24);
          if (*(_QWORD *)(v14 + 24))
          {
            OUTLINED_FUNCTION_4_77(a1, a3, (uint64_t)"    input files:\n");
            if (!v20)
              return;
            v21 = (_QWORD **)(v14 + 24);
            while (1)
            {
              v22 = *v21;
              if (!v22)
                break;
              v23 = *v22;
              v21 = (_QWORD **)(v22 + 9);
              vf_printf(a1, a3, 1, "      %.70s\n", v16, v17, v18, v19, v23);
              if (!v24)
                return;
            }
          }
          v26 = *(_QWORD *)(v14 + 40);
          v25 = (uint64_t *)(v14 + 40);
          if (v26)
          {
            v27 = OUTLINED_FUNCTION_16_51();
            vf_puts(v27, v28, v29, 0);
            if (!v30)
              return;
            v31 = v25;
            while (1)
            {
              v32 = *v31;
              if (!*v31)
                break;
              v46 = **(_QWORD **)(v32 + 8);
              v33 = OUTLINED_FUNCTION_16_51();
              vf_printf(v33, v34, 0, "      %.70s", v35, v36, v37, v38, v46);
              if (v39)
              {
                if (*(_DWORD *)v32 != 1
                  || (v40 = OUTLINED_FUNCTION_16_51(), OUTLINED_FUNCTION_4_77(v40, v41, (uint64_t)" (+)"), v42))
                {
                  v43 = OUTLINED_FUNCTION_16_51();
                  OUTLINED_FUNCTION_4_77(v43, v44, (uint64_t)"\n");
                  v31 = (uint64_t *)(v32 + 16);
                  if (v45)
                    continue;
                }
              }
              return;
            }
          }
          if (!*v15 && !*v25)
            OUTLINED_FUNCTION_4_77(a1, a3, (uint64_t)"    no files assigned\n");
        }
      }
    }
  }
}

void vf_printf(uint64_t a1, int a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t *i;
  uint64_t v18;
  uint64_t v19;

  v12 = *(_QWORD *)(a1 + 216);
  v13 = a2;
  v14 = *(_QWORD *)(v12 + 8) + ((uint64_t)a2 << 6);
  if (*(_DWORD *)(v14 + 20) || *(_BYTE *)(v14 + 56))
  {
    if (a4)
    {
      v15 = (char *)malloc_type_malloc(0x200uLL, 0x27E0C141uLL);
      if (!v15)
      {
        (*(void (**)(uint64_t, const char *, const char *))(*(_QWORD *)(a1 + 216) + 32))(a1, "Logical I/O", "Out of memory (LOGIO:1)");
        return;
      }
      v16 = v15;
      __vsprintf_chk(v15, 0, 0x200uLL, a4, &a9);
      for (i = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + (v13 << 6) + 40); ; i = (uint64_t *)(v18 + 16))
      {
        v18 = *i;
        if (!*i)
          break;
        v19 = *(_QWORD *)(v18 + 8);
        if (v19)
        {
          if (!(*(unsigned int (**)(uint64_t, char *, uint64_t))(v19 + 56))(v19 + 16, v16, a3))
            break;
        }
      }
      free(v16);
    }
  }
  else
  {
    (*(void (**)(uint64_t, const char *, const char *, ...))(v12 + 32))(a1, "LFILE", "Logical file %s is not open for output", (const char *)v14);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + (v13 << 6) + 56) = 1;
  }
  OUTLINED_FUNCTION_7_72();
}

void vf_puts(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *i;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a1 + 216);
  v7 = a2;
  v8 = *(_QWORD *)(v6 + 8) + ((uint64_t)a2 << 6);
  if (*(_DWORD *)(v8 + 20) || *(_BYTE *)(v8 + 56))
  {
    for (i = (uint64_t *)(v8 + 40); ; i = (uint64_t *)(v10 + 16))
    {
      v10 = *i;
      if (!*i)
        break;
      v11 = *(_QWORD *)(v10 + 8);
      if (v11)
      {
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 56))(v11 + 16, a3, a4))
          break;
      }
    }
  }
  else
  {
    (*(void (**)(uint64_t))(v6 + 32))(a1);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + (v7 << 6) + 56) = 1;
  }
  OUTLINED_FUNCTION_0_95();
}

void vfstatall(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char v10;
  uint64_t v11;
  int v12;

  OUTLINED_FUNCTION_4_77(a1, a2, (uint64_t)"logical files:\n");
  if (v9)
  {
    v10 = 0;
    do
    {
      v11 = *(_QWORD *)(a1 + 216);
      if (*(_DWORD *)(v11 + 16) <= v10)
        break;
      if (*(_BYTE *)(v11 + 40))
        break;
      vfstat(a1, v10++, a2, v4, v5, v6, v7, v8);
    }
    while (v12);
  }
  OUTLINED_FUNCTION_8_67();
}

uint64_t checkInterrupt(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 216) + 40);
}

void logicalFileOpen(uint64_t a1, char *a2, int a3)
{
  int v6;
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
  int v17;
  _DWORD *v18;
  int v19;
  uint64_t v20;
  const char *v21;
  int v22;
  _OWORD *v23;
  uint64_t v24;
  int v25;
  uint64_t (*v26)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  int v37;
  uint64_t v38;
  const char *v39;
  int v40;
  _OWORD *v41;
  uint64_t v42;
  int v43;

  vffind_lf(a1, a2);
  if (v6 == -1)
  {
    addLogicalFile(a1, a2);
    if (v6 == -1)
      goto LABEL_32;
  }
  v13 = *(_QWORD *)(a1 + 216);
  v14 = *(_QWORD *)(v13 + 8);
  v15 = v6;
  *(_BYTE *)(v14 + ((uint64_t)v6 << 6) + 56) = 0;
  v16 = v14 + ((uint64_t)v6 << 6);
  v19 = *(_DWORD *)(v16 + 20);
  v18 = (_DWORD *)(v16 + 20);
  v17 = v19;
  if (v19)
  {
    if (a3 || v17 != 2)
    {
      if (a3 == 1 && v17 == 1)
        (*(void (**)(uint64_t, const char *, const char *))(v13 + 32))(a1, "LFILE OPEN", "The file %s is currently opened for INPUT");
    }
    else
    {
      (*(void (**)(uint64_t, const char *, const char *))(v13 + 32))(a1, "LFILE OPEN", "The file %s is currently opened for OUTPUT");
    }
    goto LABEL_32;
  }
  if ((a3 - 1) < 2)
  {
    if (!*(_QWORD *)(v14 + ((uint64_t)v6 << 6) + 40))
    {
      v20 = OUTLINED_FUNCTION_14_56();
      if (!assignOutputFile(v20, v21, v22, v23, v24, v25))
      {
        OUTLINED_FUNCTION_11_62();
LABEL_37:
        OUTLINED_FUNCTION_6_72(v26);
        goto LABEL_32;
      }
    }
    goto LABEL_21;
  }
  if (a3)
  {
LABEL_21:
    v33 = 0;
    goto LABEL_22;
  }
  v28 = v14 + ((uint64_t)v6 << 6);
  v31 = *(_QWORD *)(v28 + 24);
  v30 = (uint64_t *)(v28 + 24);
  v29 = v31;
  if (!v31)
  {
    if (!fileExists((_BYTE *)(v14 + ((uint64_t)v6 << 6)), 0, v7, v8, v9, v10, v11, v12))
    {
      v26 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 216) + 32);
      goto LABEL_37;
    }
    v38 = OUTLINED_FUNCTION_14_56();
    assignInputFile(v38, v39, v40, v41, v42);
    if (!v43)
      goto LABEL_32;
    v29 = *v30;
  }
  openInputFile(a1, v29, v15);
  if (!v32)
    goto LABEL_32;
  v33 = 1;
LABEL_22:
  v34 = (uint64_t *)(v14 + (v15 << 6) + 40);
  while (1)
  {
    v35 = *v34;
    if (!*v34)
      break;
    if (a3 == 2)
      v36 = 1;
    else
      v36 = *(_DWORD *)v35;
    v37 = openOutputFile(a1, *(_QWORD *)(v35 + 8), v36);
    v34 = (uint64_t *)(v35 + 16);
    if (!v37)
      goto LABEL_32;
  }
  if (v33)
  {
    *v18 = 1;
    dynaBufReset(*(_QWORD *)(v14 + (v15 << 6) + 48));
  }
  else
  {
    *v18 = 2;
  }
LABEL_32:
  OUTLINED_FUNCTION_2_86();
}

uint64_t assignOutputFile(uint64_t a1, const char *a2, int a3, _OWORD *a4, uint64_t a5, int a6)
{
  uint64_t result;
  _QWORD *v13;
  size_t v14;
  char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  result = (uint64_t)findOutputFile(a1, (uint64_t)a2);
  if (result)
  {
    v13 = (_QWORD *)result;
    if (findOutputElement(a1, a3, (_QWORD *)result))
      return 1;
    v19 = *(_QWORD *)(a1 + 216);
  }
  else
  {
    if (!a2)
      return result;
    if (!a4)
      return result;
    result = (uint64_t)malloc_type_malloc(0x58uLL, 0x10F004011FC8696uLL);
    if (!result)
      return result;
    v13 = (_QWORD *)result;
    v14 = strlen(a2);
    v15 = (char *)malloc_type_malloc(v14 + 1, 0xDC03B7E8uLL);
    *v13 = v15;
    if (!v15)
    {
      free(v13);
      return 0;
    }
    strcpy(v15, a2);
    v13[1] = 0;
    v16 = a4[2];
    v17 = a4[3];
    v18 = a4[1];
    *((_OWORD *)v13 + 1) = *a4;
    *((_OWORD *)v13 + 2) = v18;
    *((_OWORD *)v13 + 3) = v16;
    *((_OWORD *)v13 + 4) = v17;
    v13[3] = *v13;
    v13[4] = a5;
    v19 = *(_QWORD *)(a1 + 216);
    v13[10] = *(_QWORD *)(v19 + 24);
    *(_QWORD *)(v19 + 24) = v13;
  }
  v20 = *(_QWORD *)(v19 + 8);
  result = (uint64_t)malloc_type_malloc(0x18uLL, 0x1020040F89CB87BuLL);
  if (result)
  {
    *(_DWORD *)result = a6;
    v21 = v20 + ((uint64_t)a3 << 6);
    v22 = *(_QWORD *)(v21 + 40);
    *(_QWORD *)(v21 + 40) = result;
    *(_QWORD *)(result + 8) = v13;
    *(_QWORD *)(result + 16) = v22;
    ++*((_DWORD *)v13 + 3);
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + ((uint64_t)a3 << 6) + 20))
      return 1;
    return openOutputFile(a1, (uint64_t)v13, a6);
  }
  return result;
}

void assignInputFile(uint64_t a1, const char *a2, int a3, _OWORD *a4, uint64_t a5)
{
  char *v10;
  char *v11;
  size_t v12;
  char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t (*v24)(uint64_t);

  if (a2)
  {
    if (a4)
    {
      v10 = (char *)malloc_type_malloc(0x50uLL, 0xF0040EFA0FAE9uLL);
      if (v10)
      {
        v11 = v10;
        v12 = strlen(a2);
        v13 = (char *)malloc_type_malloc(v12 + 1, 0x599D529uLL);
        *(_QWORD *)v11 = v13;
        if (v13)
        {
          strcpy(v13, a2);
          v14 = a4[2];
          v15 = a4[3];
          v16 = a4[1];
          *(_OWORD *)(v11 + 8) = *a4;
          *(_OWORD *)(v11 + 24) = v16;
          *(_OWORD *)(v11 + 56) = v15;
          *(_OWORD *)(v11 + 40) = v14;
          *((_QWORD *)v11 + 2) = *(_QWORD *)v11;
          *((_QWORD *)v11 + 3) = a5;
          *((_QWORD *)v11 + 9) = 0;
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 216) + 8);
          v18 = v17 + ((uint64_t)a3 << 6);
          v21 = *(_QWORD *)(v18 + 24);
          v19 = (_QWORD *)(v18 + 24);
          v20 = v21;
          if (v21)
          {
            do
            {
              v22 = v20;
              v20 = *(_QWORD *)(v20 + 72);
            }
            while (v20);
            v19 = (_QWORD *)(v22 + 72);
          }
          *v19 = v11;
          if (*(_DWORD *)(v17 + ((uint64_t)a3 << 6) + 20) == 1 && !*(_QWORD *)(v17 + ((uint64_t)a3 << 6) + 32))
          {
            openInputFile(a1, (uint64_t)v11, a3);
            if (!v23)
            {
              OUTLINED_FUNCTION_11_62();
              OUTLINED_FUNCTION_6_72(v24);
            }
          }
        }
        else
        {
          free(v11);
        }
      }
    }
  }
  OUTLINED_FUNCTION_7_72();
}

void openInputFile(uint64_t a1, uint64_t a2, int a3)
{
  if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(a2 + 32))(a1, a2 + 8, 0))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + ((uint64_t)a3 << 6) + 32) = a2;
  OUTLINED_FUNCTION_1_88();
}

uint64_t openOutputFile(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v7)(uint64_t);

  v4 = a2 + 16;
  if (a3)
    v5 = 2;
  else
    v5 = 1;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(a2 + 40))(a1, v4, v5))
  {
    ++*(_DWORD *)(a2 + 8);
    return 1;
  }
  else
  {
    OUTLINED_FUNCTION_11_62();
    return OUTLINED_FUNCTION_6_72(v7);
  }
}

void vfclose_lf()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t *i;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_13_56();
  v1 = *(_QWORD *)(v0 + 40);
  while (v1)
  {
    v2 = *(_QWORD *)(v1 + 8);
    v3 = *(_QWORD *)(v1 + 16);
    v1 = v3;
    v4 = *(_DWORD *)(v2 + 8) - 1;
    *(_DWORD *)(v2 + 8) = v4;
    if (!v4)
    {
      (*(void (**)(uint64_t))(v2 + 72))(v2 + 16);
      v1 = v3;
    }
  }
  OUTLINED_FUNCTION_12_58();
  for (i = (uint64_t *)(v5 + 24); ; i = (uint64_t *)(v7 + 72))
  {
    v7 = *i;
    if (!*i)
      break;
    (*(void (**)(uint64_t))(v7 + 64))(v7 + 8);
  }
  OUTLINED_FUNCTION_12_58();
  *(_DWORD *)(v8 + 20) = 0;
  *(_QWORD *)(v8 + 32) = 0;
  OUTLINED_FUNCTION_8_67();
}

void vf_gets(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t (*v17)(uint64_t);

  v5 = *(_QWORD *)(a1 + 216);
  v6 = *(_QWORD *)(v5 + 8);
  v7 = v6 + ((uint64_t)a2 << 6);
  if (*(_DWORD *)(v7 + 20) != 1)
  {
    v17 = *(uint64_t (**)(uint64_t))(v5 + 32);
    goto LABEL_17;
  }
  if (!*(_QWORD *)(v7 + 24))
  {
    v17 = *(uint64_t (**)(uint64_t))(v5 + 32);
    goto LABEL_17;
  }
  v8 = v6 + ((uint64_t)a2 << 6);
  v10 = (uint64_t *)(v8 + 32);
  v9 = *(_QWORD *)(v8 + 32);
  if (!v9)
  {
    v17 = *(uint64_t (**)(uint64_t))(v5 + 32);
    goto LABEL_17;
  }
  v13 = *(_QWORD *)(v8 + 48);
  v12 = (uint64_t *)(v8 + 48);
  dynaBufReset(v13);
  do
  {
    if ((*(unsigned int (**)(uint64_t))(v9 + 56))(v9 + 8))
    {
      if (!*(_QWORD *)(v9 + 72))
        goto LABEL_18;
      (*(void (**)(uint64_t))(v9 + 64))(v9 + 8);
      v9 = *(_QWORD *)(v9 + 72);
      *v10 = v9;
      openInputFile(a1, v9, a2);
      if (!v14 || !v9)
        goto LABEL_18;
    }
    else if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 40))(v9 + 8, *v12, a3))
    {
      goto LABEL_18;
    }
  }
  while (!dynaBufLength(*v12));
  v15 = dynaBufContents(*v12);
  OUTLINED_FUNCTION_4_77(a1, a2, v15);
  if (!v16)
  {
    OUTLINED_FUNCTION_11_62();
LABEL_17:
    OUTLINED_FUNCTION_6_72(v17);
  }
LABEL_18:
  OUTLINED_FUNCTION_2_86();
}

void vf_getc()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t *v5;

  OUTLINED_FUNCTION_9_66();
  if (!dynaBufAtEnd(*(_QWORD *)(v2 + 48)))
    goto LABEL_4;
  vf_gets(v0, v1, (uint64_t)&unk_21F8A212A);
  if (v3 == 1)
  {
    v4 = OUTLINED_FUNCTION_5_73();
    dynaBufMoveAbs(v4, 0);
LABEL_4:
    v5 = (uint64_t *)OUTLINED_FUNCTION_5_73();
    dynaBufCurrentChar(v5, 1);
  }
  OUTLINED_FUNCTION_1_88();
}

uint64_t vf_ungetc()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  OUTLINED_FUNCTION_13_56();
  result = dynaBufMoveRel(*(_QWORD *)(v0 + 48), 0);
  if (result)
  {
    OUTLINED_FUNCTION_12_58();
    dynaBufMoveRel(*(_QWORD *)(v2 + 48), 0xFFFFFFFF);
    return 1;
  }
  return result;
}

uint64_t vf_clrbuf(uint64_t a1, int a2)
{
  return dynaBufReset(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + ((uint64_t)a2 << 6) + 48));
}

uint64_t logicalFileInputBuffer(uint64_t a1, int a2)
{
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + ((uint64_t)a2 << 6) + 48);
}

void logicalFileAddPhysical(uint64_t a1, int a2, const char *a3, _OWORD *a4, uint64_t a5, int a6)
{
  if (a6)
    assignOutputFile(a1, a3, a2, a4, a5, a6 != 1);
  else
    assignInputFile(a1, a3, a2, a4, a5);
}

void logicalFileRemovePhysical(uint64_t a1, int a2, uint64_t a3, int a4)
{
  const char **InputFile;
  const char **OutputFile;
  _QWORD *OutputElement;
  void (*v9)(uint64_t, const char *, const char *);
  const char *v10;
  uint64_t (*v11)(uint64_t);

  if (a3)
  {
    if (a4)
    {
      InputFile = findInputFile(a1, a3, a2);
      if (InputFile)
      {
        removeInputFile(a1, (uint64_t)InputFile, a2);
        goto LABEL_13;
      }
      OUTLINED_FUNCTION_10_65();
      v10 = "The input file %s is not assigned to %s";
    }
    else
    {
      OutputFile = findOutputFile(a1, a3);
      if (!OutputFile)
      {
        OUTLINED_FUNCTION_11_62();
        OUTLINED_FUNCTION_6_72(v11);
        goto LABEL_13;
      }
      OutputElement = (_QWORD *)findOutputElement(a1, a2, OutputFile);
      if (OutputElement)
      {
        removeOutputElement(a1, OutputElement, a2);
        goto LABEL_13;
      }
      OUTLINED_FUNCTION_10_65();
      v10 = "The output file %s is not assigned to %s";
    }
    v9(a1, "LFILE REMOVE", v10);
  }
LABEL_13:
  OUTLINED_FUNCTION_0_95();
}

const char **findInputFile(uint64_t a1, uint64_t a2, int a3)
{
  const char ***i;
  const char **v4;

  for (i = (const char ***)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + ((uint64_t)a3 << 6) + 24);
        ;
        i = (const char ***)(v4 + 9))
  {
    v4 = *i;
    if (!*i || !OUTLINED_FUNCTION_15_53(*v4))
      break;
  }
  return v4;
}

void removeInputFile(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 216) + 8);
  v7 = (const char *)(v6 + ((uint64_t)a3 << 6));
  v9 = v7 + 24;
  v8 = *((_QWORD *)v7 + 3);
  if (v8 == a2)
  {
LABEL_5:
    *v9 = *(_QWORD *)(a2 + 72);
  }
  else
  {
    while (1)
    {
      v10 = v8;
      v8 = *(_QWORD *)(v8 + 72);
      if (!v8)
        break;
      if (v8 == a2)
      {
        v9 = (_QWORD *)(v10 + 72);
        goto LABEL_5;
      }
    }
  }
  v11 = v6 + ((uint64_t)a3 << 6);
  v13 = *(_QWORD *)(v11 + 32);
  v12 = (_QWORD *)(v11 + 32);
  if (v13 == a2)
  {
    (*(void (**)(uint64_t))(a2 + 64))(a2 + 8);
    *v12 = 0;
    v14 = *(_QWORD *)(a2 + 72);
    if (v14)
    {
      openInputFile(a1, v14, a3);
      if (!v15)
      {
        (*(void (**)(uint64_t, const char *, const char *, ...))(*(_QWORD *)(a1 + 216) + 32))(a1, "LFILE REMOVE", "Can't open the next input file %s for logical file %s", **(const char ***)(a2 + 72), v7);
        *v12 = 0;
      }
    }
  }
  free(*(void **)a2);
  free((void *)a2);
}

const char **findOutputFile(uint64_t a1, uint64_t a2)
{
  const char ***i;
  const char **v3;

  if (!a2)
    return 0;
  for (i = (const char ***)(*(_QWORD *)(a1 + 216) + 24); ; i = (const char ***)(v3 + 10))
  {
    v3 = *i;
    if (!*i || !OUTLINED_FUNCTION_15_53(*v3))
      break;
  }
  return v3;
}

uint64_t findOutputElement(uint64_t a1, int a2, _QWORD *a3)
{
  uint64_t *i;
  uint64_t result;

  for (i = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + ((uint64_t)a2 << 6) + 40); ; i = (uint64_t *)(result + 16))
  {
    result = *i;
    if (!*i || **(_QWORD **)(result + 8) == *a3)
      break;
  }
  return result;
}

void removeOutputElement(uint64_t a1, _QWORD *a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_QWORD *)(a1 + 216);
  v6 = *(_QWORD *)(v5 + 8);
  v7 = v6 + ((uint64_t)a3 << 6);
  v10 = *(_QWORD **)(v7 + 40);
  v9 = (_QWORD *)(v7 + 40);
  v8 = v10;
  if (v10 == a2)
  {
    v12 = a2[1];
    *v9 = a2[2];
LABEL_6:
    v13 = *(_DWORD *)(v6 + ((uint64_t)a3 << 6) + 20);
    v14 = *(_DWORD *)(v12 + 8);
    if (v13)
      *(_DWORD *)(v12 + 8) = --v14;
    if (!v14)
      (*(void (**)(uint64_t))(v12 + 72))(v12 + 16);
    v15 = *(_DWORD *)(v12 + 12) - 1;
    *(_DWORD *)(v12 + 12) = v15;
    if (!v15)
    {
      v16 = *(_QWORD *)(a1 + 216);
      v19 = *(_QWORD *)(v16 + 24);
      v18 = (_QWORD *)(v16 + 24);
      v17 = v19;
      if (v19 == v12)
      {
LABEL_15:
        *v18 = *(_QWORD *)(v12 + 80);
      }
      else
      {
        while (1)
        {
          v20 = v17;
          v17 = *(_QWORD *)(v17 + 80);
          if (!v17)
            break;
          if (v17 == v12)
          {
            v18 = (_QWORD *)(v20 + 80);
            goto LABEL_15;
          }
        }
      }
      free(*(void **)v12);
      free((void *)v12);
    }
    free(a2);
  }
  else
  {
    while (1)
    {
      v11 = v8;
      v8 = (_QWORD *)v8[2];
      if (!v8)
        break;
      if (v8 == a2)
      {
        v12 = a2[1];
        v11[2] = a2[2];
        goto LABEL_6;
      }
    }
    (*(void (**)(uint64_t, const char *, const char *, ...))(v5 + 32))(a1, "LFILE REMOVE", "The output file %s is not assigned to the logical file %s", *(const char **)a2[1], (const char *)(v6 + ((uint64_t)a3 << 6)));
  }
}

void logicalFileRemoveAllPhysical(uint64_t a1, uint64_t a2)
{
  char i;
  int v5;
  const char **InputFile;
  const char **OutputFile;
  const char **v8;
  char j;
  _QWORD *OutputElement;

  if (a2)
  {
    for (i = 0; ; ++i)
    {
      v5 = *(_DWORD *)(*(_QWORD *)(a1 + 216) + 16);
      if (v5 <= i)
        break;
      InputFile = findInputFile(a1, a2, i);
      if (InputFile)
        removeInputFile(a1, (uint64_t)InputFile, i);
    }
    OutputFile = findOutputFile(a1, a2);
    if (OutputFile)
    {
      v8 = OutputFile;
      for (j = 0; v5 > j; ++j)
      {
        OutputElement = (_QWORD *)findOutputElement(a1, j, v8);
        if (OutputElement)
        {
          removeOutputElement(a1, OutputElement, j);
          v5 = *(_DWORD *)(*(_QWORD *)(a1 + 216) + 16);
        }
      }
    }
  }
}

void logicalFileFindPhysical(uint64_t a1, int a2, _BYTE *a3, int a4)
{
  const char **OutputFile;

  if (a3)
  {
    if (*a3)
    {
      if (a4)
      {
        findInputFile(a1, (uint64_t)a3, a2);
      }
      else
      {
        OutputFile = findOutputFile(a1, (uint64_t)a3);
        if (OutputFile)
          findOutputElement(a1, a2, OutputFile);
      }
    }
    OUTLINED_FUNCTION_1_88();
  }
}

uint64_t setInterrupt(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(result + 216) + 40) = a2;
  return result;
}

void OUTLINED_FUNCTION_3_82(uint64_t a1, char *a2)
{
  uint64_t v2;

  addLogicalFile(v2, a2);
}

void OUTLINED_FUNCTION_4_77(uint64_t a1, int a2, uint64_t a3)
{
  vf_puts(a1, a2, a3, 1);
}

uint64_t OUTLINED_FUNCTION_5_73()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 216) + 8) + (v1 << 6) + 48);
}

uint64_t OUTLINED_FUNCTION_6_72@<X0>(uint64_t (*a1)(uint64_t)@<X8>)
{
  uint64_t v1;

  return a1(v1);
}

uint64_t OUTLINED_FUNCTION_14_56()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_15_53(const char *a1)
{
  const char *v1;

  return strcmp(a1, v1);
}

uint64_t OUTLINED_FUNCTION_16_51()
{
  uint64_t v0;

  return v0;
}

void diskFileOpen(uint64_t a1, uint64_t a2, unsigned int a3)
{
  const char *v4;

  *(_QWORD *)a2 = a1;
  if (!*(_QWORD *)(a2 + 16))
  {
    if (a3 > 2)
      v4 = (const char *)&unk_21F8A212A;
    else
      v4 = (&off_24E46AA50)[a3];
    *(_QWORD *)(a2 + 16) = fopen(*(const char **)(a2 + 8), v4);
  }
  OUTLINED_FUNCTION_1_89();
}

uint64_t diskFileRead(uint64_t a1, uint64_t *a2)
{
  FILE *v3;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;
  char __s[64];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(FILE **)(a1 + 16);
  if (!v3 || feof(v3))
    return 0;
  while (!feof(*(FILE **)(a1 + 16)))
  {
    if (!fgets(__s, 64, *(FILE **)(a1 + 16)) && !feof(*(FILE **)(a1 + 16)))
      return 0;
    dynaBufAddString(a2, __s, 0);
    if (!v7)
      return 0;
    v8 = OUTLINED_FUNCTION_5_74();
    if (OUTLINED_FUNCTION_6_73() == 10)
    {
      v9 = OUTLINED_FUNCTION_5_74();
      if (OUTLINED_FUNCTION_6_73() == 32)
      {
        if (v8 != v9)
        {
          v5 = 1;
          OUTLINED_FUNCTION_2_87();
          return v5;
        }
      }
      else
      {
        if (v8 != v9)
          OUTLINED_FUNCTION_2_87();
        OUTLINED_FUNCTION_4_78(a2, 32);
        OUTLINED_FUNCTION_4_78(a2, 10);
      }
      return 1;
    }
    OUTLINED_FUNCTION_2_87();
  }
  return 1;
}

void diskFileWrite(uint64_t a1, char *a2, int a3)
{
  FILE *v4;

  if (a2)
  {
    v4 = *(FILE **)(a1 + 16);
    if (v4)
    {
      if (OUTLINED_FUNCTION_7_73(a2, v4) != -1 && a3)
        fflush(*(FILE **)(a1 + 16));
    }
  }
  OUTLINED_FUNCTION_1_89();
}

void diskFileEof(uint64_t *a1)
{
  FILE *v2;

  if (checkInterrupt(*a1))
  {
    setInterrupt(*a1, 0);
  }
  else
  {
    v2 = (FILE *)a1[2];
    if (v2)
      feof(v2);
  }
  OUTLINED_FUNCTION_1_89();
}

BOOL diskFileClose(uint64_t a1)
{
  FILE *v1;

  v1 = *(FILE **)(a1 + 16);
  return !v1 || fclose(v1) == 0;
}

void dynaBufFileOpen(uint64_t a1, _QWORD *a2, int a3)
{
  uint64_t v3;
  unsigned int v4;

  *a2 = a1;
  v3 = a2[2];
  if (v3)
  {
    switch(a3)
    {
      case 2:
        v4 = -1;
        goto LABEL_7;
      case 1:
        dynaBufReset(v3);
        break;
      case 0:
        v4 = 0;
LABEL_7:
        dynaBufMoveAbs(v3, v4);
        break;
    }
  }
  OUTLINED_FUNCTION_1_89();
}

void dynaBufFileRead(uint64_t a1, uint64_t *a2)
{
  int v4;
  int v6;

  if (*(_QWORD *)(a1 + 16))
  {
    while (1)
    {
      v4 = dynaBufCurrentChar(*(uint64_t **)(a1 + 16), 1);
      if (!v4 || v4 == 10)
        break;
      OUTLINED_FUNCTION_4_78(a2, v4);
      if (!v6)
        goto LABEL_7;
    }
    addSpace(a2);
    OUTLINED_FUNCTION_8_68(a2, 10, 0);
  }
  else
  {
LABEL_7:
    OUTLINED_FUNCTION_1_89();
  }
}

void addSpace(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = dynaBufMoveRel((uint64_t)a1, 0);
  v3 = OUTLINED_FUNCTION_5_74();
  if (OUTLINED_FUNCTION_6_73() == 32)
  {
    if (v2 != v3)
      dynaBufMoveRel((uint64_t)a1, 1u);
  }
  else
  {
    if (v2 != v3)
      OUTLINED_FUNCTION_2_87();
    dynaBufAddChar(a1, 32, 0);
  }
}

uint64_t *dynaBufFileWrite(uint64_t a1, char *a2)
{
  uint64_t *result;
  int v3;

  result = *(uint64_t **)(a1 + 16);
  if (result)
  {
    dynaBufAddString(result, a2, 0);
    return (uint64_t *)(v3 != 0);
  }
  return result;
}

BOOL dynaBufFileEof(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  return !v1 || dynaBufAtEnd(v1);
}

uint64_t stdTermFileOpen(uint64_t a1, _QWORD *a2)
{
  *a2 = a1;
  return OUTLINED_FUNCTION_0_96();
}

void stdTermFileRead(int a1, uint64_t *a2, char *a3)
{
  int v4;
  int v6;

  if (a3)
    fputs(a3, (FILE *)*MEMORY[0x24BDAC8E8]);
  while (1)
  {
    v4 = getchar();
    if (v4 == -1 || v4 == 10)
      break;
    OUTLINED_FUNCTION_4_78(a2, v4);
    if (!v6)
    {
      OUTLINED_FUNCTION_1_89();
      return;
    }
  }
  addSpace(a2);
  OUTLINED_FUNCTION_8_68(a2, 10, 0);
}

void stdTermFileWrite(uint64_t a1, char *a2, int a3)
{
  FILE **v4;

  if (a2)
  {
    v4 = (FILE **)MEMORY[0x24BDAC8E8];
    if (OUTLINED_FUNCTION_7_73(a2, (FILE *)*MEMORY[0x24BDAC8E8]) != -1)
    {
      if (a3)
        fflush(*v4);
    }
    OUTLINED_FUNCTION_1_89();
  }
  else
  {
    OUTLINED_FUNCTION_3_83();
  }
}

uint64_t stdErrorFileOpen(uint64_t a1, _QWORD *a2)
{
  *a2 = a1;
  return OUTLINED_FUNCTION_0_96();
}

void stdErrorFileWrite(uint64_t a1, char *a2, int a3)
{
  FILE **v4;

  if (a2)
  {
    v4 = (FILE **)MEMORY[0x24BDAC8D8];
    if (OUTLINED_FUNCTION_7_73(a2, (FILE *)*MEMORY[0x24BDAC8D8]) != -1)
    {
      if (a3)
        fflush(*v4);
    }
    OUTLINED_FUNCTION_1_89();
  }
  else
  {
    OUTLINED_FUNCTION_3_83();
  }
}

uint64_t nullFileOpen(uint64_t a1, _QWORD *a2)
{
  *a2 = a1;
  return OUTLINED_FUNCTION_0_96();
}

uint64_t nullFileRead(uint64_t a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_4_78(a2, 10);
  return 1;
}

uint64_t OUTLINED_FUNCTION_0_96()
{
  return 1;
}

uint64_t OUTLINED_FUNCTION_2_87()
{
  uint64_t v0;

  return dynaBufMoveRel(v0, 1u);
}

uint64_t OUTLINED_FUNCTION_3_83()
{
  return 0;
}

void OUTLINED_FUNCTION_4_78(uint64_t *a1, char a2)
{
  dynaBufAddChar(a1, a2, 0);
}

uint64_t OUTLINED_FUNCTION_5_74()
{
  uint64_t v0;

  return dynaBufMoveRel(v0, 0xFFFFFFFF);
}

uint64_t OUTLINED_FUNCTION_6_73()
{
  uint64_t *v0;

  return dynaBufCurrentChar(v0, 0);
}

uint64_t OUTLINED_FUNCTION_7_73@<X0>(char *a1@<X1>, FILE *a2@<X8>)
{
  return fputs(a1, a2);
}

void OUTLINED_FUNCTION_8_68(uint64_t *a1, char a2, int a3)
{
  dynaBufAddChar(a1, a2, a3);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

void std::string::__init(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC30](this, __n, __c);
}

void std::string::~string(std::string *this)
{
  MEMORY[0x24BEDACF8](this);
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

uint64_t std::istream::getline()
{
  return MEMORY[0x24BEDAE58]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
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
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ifstream::open()
{
  return MEMORY[0x24BEDB000]();
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x24BEDB018]();
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
  return off_24E469E78();
}

uint64_t operator delete()
{
  return off_24E469E80();
}

uint64_t operator new[]()
{
  return off_24E469E88();
}

uint64_t operator new()
{
  return off_24E469E90();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
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

uint64_t __memset_chk()
{
  return MEMORY[0x24BDAC858]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x24BDAC8B8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strcat_chk()
{
  return MEMORY[0x24BDAC8F8]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x24BDAC900]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

int __vsprintf_chk(char *a1, int a2, size_t a3, const char *a4, va_list a5)
{
  return MEMORY[0x24BDAC968](a1, *(_QWORD *)&a2, a3, a4, a5);
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

uint64_t atol(const char *a1)
{
  return MEMORY[0x24BDAD260](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAD990](a1, a2);
}

clock_t clock(void)
{
  return MEMORY[0x24BDAD9B0]();
}

float cosf(float a1)
{
  float result;

  MEMORY[0x24BDADBE8](a1);
  return result;
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x24BDAE278](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int fgetc(FILE *a1)
{
  return MEMORY[0x24BDAE368](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x24BDAE380](a1, *(_QWORD *)&a2, a3);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
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

int getchar(void)
{
  return MEMORY[0x24BDAE5D0]();
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return (char *)MEMORY[0x24BDAE5D8](a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  ldiv_t result;

  v2 = MEMORY[0x24BDAEA40](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

void longjmp(jmp_buf a1, int a2)
{
  MEMORY[0x24BDAEB00](a1, *(_QWORD *)&a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
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

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int setjmp(jmp_buf a1)
{
  return MEMORY[0x24BDAFD30](a1);
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
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

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x24BDAFFD0](a1, a2);
  return result;
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return (char *)MEMORY[0x24BDAFFF0](__str, __sep);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0370](a1, a2, a3);
}

