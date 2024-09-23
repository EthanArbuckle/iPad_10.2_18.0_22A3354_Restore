vm_address_t _sanitizers_init(unsigned __int8 **a1, const char **a2)
{
  vm_address_t result;
  uint64_t v3;
  _BOOL4 v4;
  int v5;
  unint64_t v6;
  trace *v7;

  result = config::env::Parser::consumeEnv(a1, a2);
  if ((_DWORD)v3)
    v4 = 0;
  else
    v4 = (v3 & 0xFFFFFFFF00000000) == 0x200000000;
  v5 = (v3 & 0xFFFFFFFE) == 2 || v4;
  v6 = result & 0xFFFFFFFF0000FF00 | ((v3 & 0xFFFFFFFF00000000) == 0x200000000);
  LODWORD(v7) = v5 | (((_DWORD)v3 == 3) << 8);
  if ((v3 & 0xFFFFFFFF00000000) == 0x200000000)
  {
    result = asan::initRuntime((asan *)&v6);
    v5 = v7;
  }
  if (v5)
    return trace::initTraceCollection((trace *)BYTE1(v7));
  return result;
}

void asan::ReportGenerator::createReport(uint64_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  int v7;
  const char *v8;

  *(_OWORD *)a4 = *(_OWORD *)a2;
  *(_QWORD *)(a4 + 16) = *(_QWORD *)(a2 + 16);
  bzero((void *)(a4 + 48), 0x470uLL);
  *(_QWORD *)(a4 + 40) = a3[2];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)a3;
  *(_QWORD *)(a4 + 1184) = 3;
  *(_QWORD *)(a4 + 1192) = (**(uint64_t (***)(uint64_t))*a1)(*a1);
  v7 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)*a1 + 104))(*a1, *a3, a3[1]);
  switch(v7)
  {
    case 233:
    case 250:
      *(_DWORD *)(a4 + 48) = 6;
      *(_QWORD *)(a4 + 56) = "unimplemented";
      *(_QWORD *)(a4 + 64) = "unimplemented";
      break;
    case 234:
    case 235:
    case 236:
    case 237:
    case 238:
    case 239:
    case 240:
    case 244:
    case 245:
    case 246:
    case 247:
    case 248:
      break;
    case 241:
      *(_DWORD *)(a4 + 48) = 5;
      v8 = "stack-buffer-underflow";
      goto LABEL_6;
    case 242:
    case 243:
      *(_DWORD *)(a4 + 48) = 4;
      v8 = "stack-buffer-overflow";
LABEL_6:
      *(_QWORD *)(a4 + 56) = v8;
      asan::ReportGenerator::fillStackVarInfo(a1, a4);
      break;
    case 249:
      asan::ReportGenerator::addGlobalBufferOverflowInfo((uint64_t)a1, a4);
      break;
    case 251:
      asan::ReportGenerator::addHeapBufferOverflowInfo(a1, a4);
      break;
    case 252:
    case 253:
      asan::ReportGenerator::addUseAfterFreeInfo(a1, a4);
      break;
    default:
      if (!v7)
        asan::ReportGenerator::createReport();
      return;
  }
  if (!*(_DWORD *)(a4 + 48))
  {
    *(_QWORD *)(a4 + 56) = "corrupted shadow";
    *(_QWORD *)(a4 + 64) = "corrupted shadow";
  }
}

uint64_t asan::ReportGenerator::addHeapBufferOverflowInfo(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  uint64_t v12;

  *(_DWORD *)(a2 + 48) = 3;
  *(_QWORD *)(a2 + 56) = "heap-buffer-overflow";
  *(_QWORD *)(a2 + 64) = "heap";
  v4 = *a1;
  v11 = *(_OWORD *)(a2 + 24);
  v12 = *(_QWORD *)(a2 + 40);
  v5 = (*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)v4 + 56))(v4, &v11);
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
    asan::ReportGenerator::addHeapBufferOverflowInfo();
  v8 = v5;
  v9 = v6;
  bzero((void *)(a2 + 105), 0x437uLL);
  *(_QWORD *)(a2 + 88) = v8;
  *(_QWORD *)(a2 + 96) = v9;
  *(_BYTE *)(a2 + 104) = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t, uint64_t))a1[1])(a1[1], v8, a2 + 112, a2 + 648);
}

uint64_t asan::ReportGenerator::addUseAfterFreeInfo(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  uint64_t v12;

  *(_DWORD *)(a2 + 48) = 1;
  *(_QWORD *)(a2 + 56) = "heap-use-after-free";
  *(_QWORD *)(a2 + 64) = "heap";
  v4 = *a1;
  v11 = *(_OWORD *)(a2 + 24);
  v12 = *(_QWORD *)(a2 + 40);
  v5 = (*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)v4 + 56))(v4, &v11);
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
    asan::ReportGenerator::addUseAfterFreeInfo();
  v8 = v5;
  v9 = v6;
  bzero((void *)(a2 + 105), 0x437uLL);
  *(_QWORD *)(a2 + 88) = v8;
  *(_QWORD *)(a2 + 96) = v9;
  *(_BYTE *)(a2 + 104) = 1;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t, uint64_t))a1[1])(a1[1], v8, a2 + 112, a2 + 648);
}

void asan::ReportGenerator::addGlobalBufferOverflowInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)(a2 + 48) = 2;
  *(_QWORD *)(a2 + 56) = "global-buffer-overflow";
  *(_QWORD *)(a2 + 64) = "global";
  v3 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 16) + 8))(*(_QWORD *)(a1 + 16), *(_QWORD *)(a2 + 24));
  if (!v3)
    asan::ReportGenerator::addGlobalBufferOverflowInfo();
  v4 = 0;
  v5 = *(_QWORD *)(v3 + 24);
  while (*(unsigned __int8 *)(v5 + v4++))
    ;
  *(_QWORD *)(a2 + 72) = v5;
  *(_QWORD *)(a2 + 80) = v4 - 1;
  *(_OWORD *)(a2 + 88) = *(_OWORD *)v3;
  bzero((void *)(a2 + 104), 0x438uLL);
}

void asan::ReportGenerator::addStackBufferOverflowInfo(uint64_t *a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 48) = 4;
  *(_QWORD *)(a2 + 56) = "stack-buffer-overflow";
  asan::ReportGenerator::fillStackVarInfo(a1, a2);
}

void asan::ReportGenerator::addStackBufferUnderflowInfo(uint64_t *a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 48) = 5;
  *(_QWORD *)(a2 + 56) = "stack-buffer-underflow";
  asan::ReportGenerator::fillStackVarInfo(a1, a2);
}

void asan::ReportGenerator::fillStackVarInfo(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  *(_QWORD *)(a2 + 64) = "stack";
  v3 = *a1;
  v14 = *(_OWORD *)(a2 + 24);
  v15 = *(_QWORD *)(a2 + 40);
  v4 = (*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)v3 + 56))(v3, &v14);
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    asan::ReportGenerator::fillStackVarInfo();
  v7 = v4;
  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  asan::ReportGenerator::StackVar::getStackVar(*(asan::ReportGenerator::StackVar **)(v4 + 8), (const char *)(*(_QWORD *)(a2 + 24) - v4), (uint64_t)&v11);
  v8 = v11;
  if (!(_QWORD)v11)
    asan::ReportGenerator::fillStackVarInfo();
  v9 = *((_QWORD *)&v12 + 1);
  *(_QWORD *)(a2 + 72) = v12;
  *(_QWORD *)(a2 + 80) = v9;
  bzero((void *)(a2 + 105), 0x437uLL);
  v10 = *((_QWORD *)&v11 + 1);
  *(_QWORD *)(a2 + 88) = v8 + v7;
  *(_QWORD *)(a2 + 96) = v10;
  *(_BYTE *)(a2 + 104) = 0;
}

unint64_t asan::ReportGenerator::StackVar::getStackVar@<X0>(asan::ReportGenerator::StackVar *this@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t result;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *__endptr;

  __endptr = (char *)this;
  v5 = strtoul((const char *)this, &__endptr, 10);
  if (!v5)
    asan::ReportGenerator::StackVar::getStackVar();
  v6 = v5;
  *(_QWORD *)(a3 + 32) = 0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  result = asan::ReportGenerator::StackVar::parse((const char **)&__endptr, (unint64_t *)a3);
  v8 = v6 - 1;
  if (v6 != 1 && *(_QWORD *)(a3 + 8) + *(_QWORD *)a3 < (unint64_t)a2)
  {
    v9 = 0;
    v10 = v6 - 2;
    do
    {
      if (v8 == v9)
        break;
      *(_QWORD *)(a3 + 32) = 0;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      result = asan::ReportGenerator::StackVar::parse((const char **)&__endptr, (unint64_t *)a3);
      if (v10 == v9)
        break;
      ++v9;
    }
    while (*(_QWORD *)(a3 + 8) + *(_QWORD *)a3 < (unint64_t)a2);
  }
  return result;
}

unint64_t asan::ReportGenerator::StackVar::parse@<X0>(const char **__endptr@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result;
  unint64_t v6;
  const char *v7;
  char *v8;
  char *v9;
  unsigned int v10;
  char *v12;

  a2[4] = 0;
  *a2 = strtoul(*__endptr, (char **)__endptr, 10);
  a2[1] = strtoul(*__endptr, (char **)__endptr, 10);
  result = strtoul(*__endptr, (char **)__endptr, 10);
  v6 = 0;
  v7 = *__endptr;
  v8 = (char *)(*__endptr + 1);
  while (1)
  {
    v9 = (char *)&v7[v6 + 1];
    *__endptr = v9;
    v10 = *v9;
    if (v10 <= 0x3A && ((1 << v10) & 0x400000100000001) != 0)
      break;
    ++v6;
  }
  a2[2] = (unint64_t)v8;
  a2[3] = v6;
  if (v10 == 58)
  {
    v12 = (char *)&v7[v6 + 2];
    *__endptr = v12;
    result = strtoul(v12, (char **)__endptr, 10);
    a2[4] = result;
  }
  return result;
}

vm_address_t trace::initTraceCollection(trace *this)
{
  char v1;
  vm_address_t v2;
  vm_address_t result;

  v1 = (char)this;
  v2 = vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>();
  result = vm::create<trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>>();
  *(_QWORD *)&sanitizers_report_globals = v2;
  *((_QWORD *)&sanitizers_report_globals + 1) = result;
  collector = v2;
  collector = result;
  collector = v1;
  if ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, int))*MEMORY[0x24BDB1148] == libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc)
    trace::initTraceCollection();
  libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::previousLogger = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))*MEMORY[0x24BDB1148];
  *MEMORY[0x24BDB1148] = libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc;
  return result;
}

vm_address_t vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>()
{
  vm_map_t v0;
  debug *v1;
  const char *v2;
  vm_address_t v3;
  vm_address_t address;

  if (0x2404000uLL % *MEMORY[0x24BDB1100])
    vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>();
  v0 = *MEMORY[0x24BDB1040];
  address = 0;
  v1 = (debug *)vm_map(v0, &address, 0x2404000uLL, 0, 1660944385, 0, 0, 0, 3, 3, 1u);
  if ((_DWORD)v1)
    vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>(v1, v2);
  v3 = address;
  bzero((void *)address, 0x2404000uLL);
  return v3;
}

vm_address_t vm::create<trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>>()
{
  vm_map_t v0;
  debug *v1;
  const char *v2;
  vm_address_t v3;
  vm_address_t address;

  if (0x1000000uLL % *MEMORY[0x24BDB1100])
    vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>();
  v0 = *MEMORY[0x24BDB1040];
  address = 0;
  v1 = (debug *)vm_map(v0, &address, 0x1000000uLL, 0, 1660944385, 0, 0, 0, 3, 3, 1u);
  if ((_DWORD)v1)
    vm::create<trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>>(v1, v2);
  v3 = address;
  bzero((void *)address, 0x1000000uLL);
  return v3;
}

const char *sanitizers_diagnose_memory_error(unsigned int a1, uint64_t a2, void (*a3)(_QWORD, _QWORD, _QWORD), unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t *v8;
  unint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  const char *v13;
  uint64_t i;
  _QWORD v16[3];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  unsigned int v21;

  v18 = 0;
  v19 = a2;
  v20 = a3;
  v21 = a1;
  v8 = (unint64_t *)MemoryReader::read((MemoryReader *)v17, a4, 16);
  if (v8)
  {
    v9 = v8;
    if (*v8 && v8[1])
    {
      v10 = MemoryReader::read((MemoryReader *)v17, *v8, 37765120);
      v11 = MemoryReader::read((MemoryReader *)v17, v9[1], 0x1000000);
      if (v10)
        v12 = v11 == 0;
      else
        v12 = 1;
      if (v12)
      {
        v13 = "failed to load trace depot and/or allocation map";
      }
      else
      {
        v16[0] = &off_251CE0BF0;
        v16[1] = v10;
        v16[2] = v11;
        v13 = trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::diagnoseMemoryError((uint64_t)v16, a5, a6);
      }
    }
    else
    {
    }
  }
  else
  {
  }
  for (i = v18; v18; i = v18)
  {
    v18 = i - 1;
    v20(v21, v17[2 * i - 2], v17[2 * i - 1]);
  }
  return v13;
}

const char *trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::diagnoseMemoryError(uint64_t a1, unint64_t a2, uint64_t a3)
{
  __int128 v6;
  BOOL v7;
  char v9;
  const char *v10;
  const char *v11;
  __int128 v12;
  __int128 v13;

  v12 = 0u;
  v13 = 0u;
  trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::diagnoseFault(a1, a2, &v12);
  v6 = v12;
  if ((_QWORD)v12)
    v7 = *((_QWORD *)&v12 + 1) == 0;
  else
    v7 = 1;
  if (v7)
    return "allocation metadata unavailable";
  v9 = v13;
  v10 = "underflow";
  if ((unint64_t)v12 < a2)
    v10 = "overflow";
  if ((_BYTE)v13)
    v11 = "use-after-free";
  else
    v11 = v10;
  bzero((void *)(a3 + 33), 0x437uLL);
  *(_QWORD *)a3 = v11;
  *(_QWORD *)(a3 + 8) = a2;
  *(_OWORD *)(a3 + 16) = v6;
  *(_BYTE *)(a3 + 32) = v9;
  trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::retrieveTraces(a1, (uint64_t)&v12, a3 + 40, a3 + 576);
  return 0;
}

double trace::Lookup::create(trace::Lookup *this, unsigned __int8 (*a2)[24])
{
  double result;

  *(_QWORD *)this = &off_251CE0BF0;
  result = *(double *)&sanitizers_report_globals;
  *(_OWORD *)((char *)this + 8) = sanitizers_report_globals;
  return result;
}

uint64_t trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::insert(uint64_t result, uint64_t a2, unint64_t a3, unsigned int a4)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  unsigned __int128 *v7;

  if ((a2 & 0xF) != 0 || (a2 & 0xF0FFFFFFFFFFFFFFLL) >= 0xFC0000001)
    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::insert();
  v4 = (1540483477 * ((1540483477 * ((1540483477 * a2) ^ ((1540483477 * a2) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(a2)) ^ ((1540483477 * HIDWORD(a2)) >> 24)));
  v5 = (1540483477 * (v4 ^ (v4 >> 13))) & 0xFFFFF ^ ((1540483477 * (v4 ^ (v4 >> 13))) >> 15);
  v6 = 0xFFFFLL;
  if (a3 < 0xFFFF)
    v6 = a3;
  v7 = (unsigned __int128 *)(result + 16 * v5);
  do
    __ldxp(v7);
  while (__stxp(__PAIR128__(a4, (8 * a2) & 0x7800000000000000 | ((a2 & 0xF0FFFFFFFFFFFFFFLL) >> 4) | (v6 << 43)), v7));
  return result;
}

uint64_t trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t *v4;
  uint64_t result;
  unint64_t v7;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (a3 >= 0x41)
    trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace();
  v4 = a2;
  result = hash::Murmur2::hashPointers(a2, a3);
  v7 = *(_QWORD *)(a1 + 8 * (result & 0x7FFFF));
  if ((_DWORD)result != (_DWORD)v7 || HIBYTE(v7) != a3)
  {
    v9 = (unint64_t *)(a1 + 37748736);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + a3, v9));
    *(_QWORD *)(a1 + 8 * (result & 0x7FFFF)) = result | ((unint64_t)(((_DWORD)a3 << 24) | v10 & 0x3FFFFF) << 32);
    if ((((_DWORD)a3 << 24) | v10 & 0x3FFFFF) >> 24)
    {
      v11 = (unint64_t)((_DWORD)a3 << 24) >> 24;
      do
      {
        v12 = *v4++;
        *(_QWORD *)(a1 + 0x400000 + 8 * (v10++ & 0x3FFFFF)) = v12;
        --v11;
      }
      while (v11);
    }
  }
  return result;
}

uint64_t hash::Murmur2::hashPointers(uint64_t *a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;

  v2 = -474048815;
  if (a2)
  {
    v3 = 8 * a2;
    do
    {
      v4 = *a1++;
      v2 = (1540483477
          * ((1540483477 * ((1540483477 * v4) ^ ((1540483477 * v4) >> 24))) ^ (1540483477 * v2))) ^ (1540483477 * ((1540483477 * HIDWORD(v4)) ^ ((1540483477 * HIDWORD(v4)) >> 24)));
      v3 -= 8;
    }
    while (v3);
  }
  return (1540483477 * (v2 ^ (v2 >> 13))) ^ ((1540483477 * (v2 ^ (v2 >> 13))) >> 15);
}

uint64_t trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::addDeallocTrace(uint64_t result, uint64_t a2, unsigned int a3)
{
  unsigned int v3;
  unsigned __int128 *v4;
  unsigned __int128 v5;

  if ((a2 & 0xF) != 0 || (a2 & 0xF0FFFFFFFFFFFFFFLL) >= 0xFC0000001)
    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::addDeallocTrace();
  v3 = (1540483477 * ((1540483477 * ((1540483477 * a2) ^ ((1540483477 * a2) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(a2)) ^ ((1540483477 * HIDWORD(a2)) >> 24)));
  v4 = (unsigned __int128 *)(result
                           + 16
                           * ((1540483477 * (v3 ^ (v3 >> 13))) & 0xFFFFF ^ ((1540483477 * (v3 ^ (v3 >> 13))) >> 15)));
  do
    v5 = __ldxp(v4);
  while (__stxp(v5, v4));
  if ((((unint64_t)v5 >> 3) & 0xF00000000000000 | (16 * (v5 & 0x7FFFFFFFFFFLL))) == a2)
  {
    do
      __ldxp(v4);
    while (__stxp(__PAIR128__(DWORD2(v5) | ((unint64_t)a3 << 32), (unint64_t)v5 | 0x8000000000000000), v4));
  }
  return result;
}

uint64_t debug::print(debug *this, const char *a2, ...)
{
  char __str[1024];
  uint64_t v4;
  va_list va;

  va_start(va, a2);
  v4 = *MEMORY[0x24BDB0D28];
  vsnprintf(__str, 0x400uLL, "Failed to map VM region of size %zu (%zu pages)\n", va);
  return fputs(__str, (FILE *)*MEMORY[0x24BDB0D30]);
}

{
  char __str[1024];
  uint64_t v4;
  va_list va;

  va_start(va, a2);
  v4 = *MEMORY[0x24BDB0D28];
  vsnprintf(__str, 0x400uLL, (const char *)this, va);
  return fputs(__str, (FILE *)*MEMORY[0x24BDB0D30]);
}

uint64_t libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t ptr, int a6)
{
  int v9;
  unsigned int v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  size_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int inserted;
  _QWORD v25[73];

  v9 = result;
  v25[72] = *MEMORY[0x24BDB0D28];
  if (libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::previousLogger)
    result = libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::previousLogger(result, a2, a3, a4, ptr, (a6 + 1));
  if ((v9 & 8) != 0)
  {
    v10 = a6 + 2;
    if ((~v9 & 6) != 0)
    {
      if ((v9 & 2) != 0)
      {
        if (ptr && ((ptr & 0xF00000000000000) != 0 || !collector))
        {
          v19 = malloc_size((const void *)ptr);
          if (v10 >= 7)
            libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc(v19, v20, v21);
          v22 = v19;
          v23 = collector;
          thread_stack_pcs();
          inserted = trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace(v23, &v25[a6 + 3], 0);
          return trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::insert(collector, ptr, v22, inserted);
        }
        return result;
      }
      if ((v9 & 4) == 0 || !a3 || (a3 & 0xF00000000000000) == 0 && collector)
        return result;
      if (v10 >= 7)
        libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc(result, a2, a3);
    }
    else
    {
      if (!ptr)
        return result;
      if ((ptr & 0xF00000000000000) != 0 || !collector)
      {
        v11 = malloc_size((const void *)ptr);
        if (v10 >= 7)
          libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc(v11, v12, v13);
        v14 = v11;
        v15 = collector;
        thread_stack_pcs();
        v16 = trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace(v15, &v25[a6 + 3], 0);
        result = trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::insert(collector, ptr, v14, v16);
      }
      if (!a3 || (a3 & 0xF00000000000000) == 0 && collector)
        return result;
      if (v10 >= 7)
        libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc(result, a2, a3);
    }
    v17 = collector;
    thread_stack_pcs();
    v18 = trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace(v17, &v25[a6 + 3], 0);
    return trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::addDeallocTrace(collector, a3, v18);
  }
  return result;
}

uint64_t MemoryReader::read(MemoryReader *this, unint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  _QWORD *v7;

  if (*((_QWORD *)this + 6) >= 3uLL)
    MemoryReader::read();
  result = (*((uint64_t (**)(_QWORD))this + 7))(*((unsigned int *)this + 18));
  if (result)
  {
    v6 = *((_QWORD *)this + 6);
    *((_QWORD *)this + 6) = v6 + 1;
    v7 = (_QWORD *)((char *)this + 16 * v6);
    *v7 = result;
    v7[1] = a3;
  }
  return result;
}

uint64_t trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::retrieveTraces(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v7;
  uint64_t v8;
  _OWORD v10[2];

  memset(v10, 0, sizeof(v10));
  trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get(*(_QWORD *)(a1 + 16), a2, (uint64_t)v10);
  if (*(_QWORD *)&v10[0])
    v7 = *((_QWORD *)&v10[0] + 1) == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (!v7)
    trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::retrieveTraces(a1, (uint64_t)v10, a3, a4);
  return v8;
}

{
  BOOL v4;
  uint64_t result;

  if (*(_QWORD *)a2)
    v4 = *(_QWORD *)(a2 + 8) == 0;
  else
    v4 = 1;
  if (v4)
    trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::retrieveTraces();
  result = trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::retrieveTrace(*(_QWORD *)(a1 + 8), *(_DWORD *)(a2 + 20), (_QWORD *)(a3 + 24));
  *(_DWORD *)(a3 + 16) = result;
  if (*(_BYTE *)(a2 + 16))
  {
    result = trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::retrieveTrace(*(_QWORD *)(a1 + 8), *(_DWORD *)(a2 + 24), (_QWORD *)(a4 + 24));
    *(_DWORD *)(a4 + 16) = result;
  }
  return result;
}

double trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  double result;

  if ((a2 & 0xF) != 0 || (a2 & 0xF0FFFFFFFFFFFFFFLL) >= 0xFC0000001)
    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get();
  v3 = (1540483477 * ((1540483477 * ((1540483477 * a2) ^ ((1540483477 * a2) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(a2)) ^ ((1540483477 * HIDWORD(a2)) >> 24)));
  v4 = (1540483477 * (v3 ^ (v3 >> 13))) & 0xFFFFF ^ ((1540483477 * (v3 ^ (v3 >> 13))) >> 15);
  v5 = *(_QWORD *)(a1 + 16 * v4);
  if ((((unint64_t)v5 >> 3) & 0xF00000000000000 | (16 * (v5 & 0x7FFFFFFFFFFLL))) == a2)
  {
    *(_QWORD *)a3 = a2;
    *(_QWORD *)(a3 + 8) = (unsigned __int16)((unint64_t)v5 >> 43);
    *(_BYTE *)(a3 + 16) = v5 < 0;
    result = *(double *)(a1 + 16 * v4 + 8);
    *(double *)(a3 + 20) = result;
  }
  else
  {
    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::retrieveTrace(uint64_t a1, int a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v8;
  unint64_t v9;
  unsigned int v11;

  v3 = *(_QWORD *)(a1 + 8 * (*(_QWORD *)&a2 & 0x7FFFFLL));
  if ((_DWORD)v3 != a2 || (v3 & 0xC0000000000000) != 0 || (HIDWORD(v3) - 0x1000000) >> 30 != 0)
    return 0;
  v11 = -474048815;
  trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::forEachFrame<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::retrieveTrace(trace::Id,unsigned long (&)[64])::{lambda(unsigned long,unsigned long)#1}>(a1, v3, &v11);
  if (((1540483477 * (v11 ^ (v11 >> 13))) ^ ((1540483477 * (v11 ^ (v11 >> 13))) >> 15)) != (_DWORD)v3)
    return 0;
  v8 = HIBYTE(v3);
  v9 = HIDWORD(v3);
  do
  {
    *a3++ = *(_QWORD *)(a1 + 0x400000 + 8 * (v9++ & 0x3FFFFF));
    --v8;
  }
  while (v8);
  return HIBYTE(HIDWORD(v3));
}

uint64_t trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::forEachFrame<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::retrieveTrace(trace::Id,unsigned long (&)[64])::{lambda(unsigned long,unsigned long)#1}>(uint64_t result, unint64_t a2, unsigned int *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  unsigned int v8;

  v3 = HIBYTE(a2);
  if (HIBYTE(a2))
  {
    v4 = HIDWORD(a2);
    v5 = result + 0x400000;
    v6 = *a3;
    do
    {
      v7 = *(_DWORD *)(v5 + 8 * (v4 & 0x3FFFFF) + 4);
      v8 = 1540483477 * *(_DWORD *)(v5 + 8 * (v4 & 0x3FFFFF));
      v6 = (1540483477 * ((1540483477 * (v8 ^ HIBYTE(v8))) ^ (1540483477 * v6))) ^ (1540483477
                                                                                  * ((1540483477 * v7) ^ ((1540483477 * v7) >> 24)));
      ++v4;
      --v3;
    }
    while (v3);
    *a3 = v6;
  }
  return result;
}

double trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::diagnoseFault@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, __int128 *a3@<X8>)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  __int128 *v16;
  BOOL v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDB0D28];
  v5 = a2 & 0xFFFFFFFFFFFFFFF0;
  v6 = a2 & 0xFFFFFFFFFFFFFFF0;
  v7 = -16;
  v8 = a2 & 0xFFFFFFFFFFFFFFF0;
  while ((v8 & 0xF0FFFFFFFFFFFFF0) < 0xFC0000001)
  {
    v27 = 0u;
    v28 = 0u;
    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get(*(_QWORD *)(a1 + 16), v8, (uint64_t)&v27);
    if ((_QWORD)v27)
      v9 = *((_QWORD *)&v27 + 1) == 0;
    else
      v9 = 1;
    if (!v9 && !BlockInfo::absDistance((BlockInfo *)&v27, a2) && (_BYTE)v28)
    {
      v29 = v28;
      if ((_QWORD)v27 && *((_QWORD *)&v27 + 1))
      {
        *a3 = v27;
        *(_QWORD *)&v19 = v29;
        a3[1] = v29;
        return *(double *)&v19;
      }
      break;
    }
    v8 -= 16;
    v7 += 16;
    if (v7 >= 0x3FF1)
      break;
  }
  v10 = -16;
  while (1)
  {
    if ((v6 & 0xF0FFFFFFFFFFFFF0) >= 0xFC0000001)
    {
LABEL_19:
      v25 = 0u;
      v26 = 0u;
      goto LABEL_20;
    }
    v27 = 0u;
    v28 = 0u;
    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get(*(_QWORD *)(a1 + 16), v6, (uint64_t)&v27);
    v11 = !(_QWORD)v27 || *((_QWORD *)&v27 + 1) == 0;
    if (!v11 && BlockInfo::absDistance((BlockInfo *)&v27, a2) && !(_BYTE)v28)
      break;
    v6 -= 16;
    v10 += 16;
    if (v10 >= 0x3FF1)
      goto LABEL_19;
  }
  v25 = v27;
  v26 = v28;
LABEL_20:
  v12 = -16;
  while (1)
  {
    v13 = v5 + v12 + 16;
    if ((v13 & 0xF0FFFFFFFFFFFFF0) >= 0xFC0000001)
    {
LABEL_29:
      v23 = 0u;
      v24 = 0u;
      goto LABEL_30;
    }
    v27 = 0u;
    v28 = 0u;
    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get(*(_QWORD *)(a1 + 16), v13, (uint64_t)&v27);
    v14 = !(_QWORD)v27 || *((_QWORD *)&v27 + 1) == 0;
    if (!v14 && BlockInfo::absDistance((BlockInfo *)&v27, a2) && !(_BYTE)v28)
      break;
    v12 += 16;
    if (v12 >= 0x3FF1)
      goto LABEL_29;
  }
  v23 = v27;
  v24 = v28;
LABEL_30:
  if ((_QWORD)v25)
    v15 = *((_QWORD *)&v25 + 1) == 0;
  else
    v15 = 1;
  if (v15)
  {
    v16 = &v23;
  }
  else
  {
    v16 = &v25;
    if ((_QWORD)v23)
      v17 = *((_QWORD *)&v23 + 1) == 0;
    else
      v17 = 1;
    if (!v17)
    {
      v18 = BlockInfo::absDistance((BlockInfo *)&v25, a2);
      if (v18 > BlockInfo::absDistance((BlockInfo *)&v23, a2))
        v16 = &v23;
    }
  }
  v19 = *v16;
  v20 = v16[1];
  *a3 = *v16;
  a3[1] = v20;
  return *(double *)&v19;
}

unint64_t BlockInfo::absDistance(BlockInfo *this, unint64_t a2)
{
  BOOL v3;
  unint64_t result;

  v3 = *(_QWORD *)this >= a2;
  result = *(_QWORD *)this - a2;
  if (result == 0 || !v3)
  {
    if (BlockInfo::endInclusive(this) >= a2)
      return 0;
    else
      return a2 - BlockInfo::endInclusive(this);
  }
  return result;
}

uint64_t BlockInfo::endInclusive(BlockInfo *this)
{
  uint64_t v1;

  if (!*(_QWORD *)this || (v1 = *((_QWORD *)this + 1)) == 0)
    BlockInfo::endInclusive();
  return *(_QWORD *)this + v1 - 1;
}

uint64_t OUTLINED_FUNCTION_0(debug *a1, const char *a2)
{
  return debug::print(a1, a2);
}

void OUTLINED_FUNCTION_1(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 150, a4);
}

uint64_t config::env::Parser::consumeEnv(unsigned __int8 **this, const char **a2)
{
  uint64_t Config;
  unsigned __int8 **v4;

  v4 = this;
  Config = config::env::Parser::getConfig((config::env::Parser *)&v4);
  if ((Config & 1) == 0)
    config::env::Parser::removeEnvVars(&v4);
  return Config;
}

uint64_t config::env::Parser::getConfig(config::env::Parser *this)
{
  unsigned int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDB0D28];
  v8 = xmmword_251CE0CD8;
  v9 = unk_251CE0CE8;
  v10 = xmmword_251CE0CF8;
  v2 = config::env::Parser::getSetting<BOOL,3ul>((uint64_t)this, (uint64_t)"SanitizersChildProcessPropagation", 0, (uint64_t)&v8);
  v8 = xmmword_251CE0CD8;
  v9 = unk_251CE0CE8;
  v10 = xmmword_251CE0CF8;
  v3 = config::env::Parser::getSetting<BOOL,3ul>((uint64_t)this, (uint64_t)"SanitizersPrintReportToStderr", 0, (uint64_t)&v8);
  v4 = config::env::Parser::getNumber<long,&(strtol)>((uint64_t)this, (uint64_t)"SanitizersExitCode", 0);
  v8 = xmmword_251CE0C78;
  v9 = unk_251CE0C88;
  v10 = xmmword_251CE0C98;
  v11 = unk_251CE0CA8;
  config::env::Parser::getSetting<config::env::AllocationTraces,4ul>((uint64_t)this, (uint64_t)"SanitizersAllocationTraces", 0, (uint64_t)&v8);
  v7[0] = xmmword_251CE0CB8;
  v7[1] = unk_251CE0CC8;
  config::env::Parser::getSetting<config::env::Address,2ul>((uint64_t)this, (uint64_t)"SanitizersAddress", 0, (uint64_t)v7);
  v5 = 256;
  if (!v3)
    v5 = 0;
  return v5 | (v4 << 32) | v2;
}

unsigned __int8 **config::env::Parser::removeEnvVars(unsigned __int8 ***this)
{
  config::env::Parser::unsetEnv<34ul>(*this, "SanitizersChildProcessPropagation");
  config::env::Parser::unsetEnv<30ul>(*this, "SanitizersPrintReportToStderr");
  config::env::Parser::unsetEnv<19ul>(*this, "SanitizersExitCode");
  config::env::Parser::unsetEnv<27ul>(*this, "SanitizersAllocationTraces");
  return config::env::Parser::unsetEnv<18ul>(*this, "SanitizersAddress");
}

uint64_t config::env::Parser::getSetting<config::env::AllocationTraces,4ul>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _BYTE *v9;
  int v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  int v13;

  v6 = _simple_getenv();
  if (v6)
  {
    v7 = 0;
    while (1)
    {
      v8 = (_QWORD *)(a4 + 16 * v7);
      v9 = (_BYTE *)v8[1];
      v10 = *v9;
      if (*v9)
      {
        v11 = v9 + 1;
        v12 = (unsigned __int8 *)v6;
        do
        {
          if (v10 != *v12)
            break;
          ++v12;
          v13 = *v11++;
          v10 = v13;
        }
        while (v13);
      }
      else
      {
        v12 = (unsigned __int8 *)v6;
      }
      if (v10 == *v12)
        break;
      if (++v7 == 4)
        return a3;
    }
    return *(unsigned int *)v8;
  }
  return a3;
}

uint64_t config::env::Parser::getSetting<config::env::Address,2ul>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _BYTE *v9;
  int v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  int v13;

  v6 = _simple_getenv();
  if (v6)
  {
    v7 = 0;
    while (1)
    {
      v8 = (_QWORD *)(a4 + 16 * v7);
      v9 = (_BYTE *)v8[1];
      v10 = *v9;
      if (*v9)
      {
        v11 = v9 + 1;
        v12 = (unsigned __int8 *)v6;
        do
        {
          if (v10 != *v12)
            break;
          ++v12;
          v13 = *v11++;
          v10 = v13;
        }
        while (v13);
      }
      else
      {
        v12 = (unsigned __int8 *)v6;
      }
      if (v10 == *v12)
        break;
      if (++v7 == 2)
        return a3;
    }
    return *(unsigned int *)v8;
  }
  return a3;
}

uint64_t config::env::Parser::getSetting<BOOL,3ul>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  int v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  int v13;

  v6 = _simple_getenv();
  if (v6)
  {
    v7 = 0;
    while (1)
    {
      v8 = a4 + 16 * v7;
      v9 = *(_BYTE **)(v8 + 8);
      v10 = *v9;
      if (*v9)
      {
        v11 = v9 + 1;
        v12 = (unsigned __int8 *)v6;
        do
        {
          if (v10 != *v12)
            break;
          ++v12;
          v13 = *v11++;
          v10 = v13;
        }
        while (v13);
      }
      else
      {
        v12 = (unsigned __int8 *)v6;
      }
      if (v10 == *v12)
        break;
      if (++v7 == 3)
        return a3;
    }
    return *(_BYTE *)v8 & 1;
  }
  return a3;
}

uint64_t config::env::Parser::getNumber<long,&(strtol)>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const char *v4;
  int v5;
  unsigned __int8 *v6;
  char *v7;
  int v8;

  v4 = (const char *)_simple_getenv();
  if (!v4)
    return a3;
  v5 = *(unsigned __int8 *)v4;
  if (*v4)
  {
    v6 = (unsigned __int8 *)(v4 + 1);
    v7 = &byte_24BC73B6F;
    do
    {
      if (v5 != *v7)
        break;
      ++v7;
      v8 = *v6++;
      v5 = v8;
    }
    while (v8);
  }
  else
  {
    v7 = &byte_24BC73B6F;
  }
  if (v5 != *v7)
    return strtol(v4, 0, 0);
  else
    return a3;
}

unsigned __int8 **config::env::Parser::unsetEnv<34ul>(unsigned __int8 **result, unsigned __int8 *a2)
{
  unsigned __int8 *v2;
  _QWORD *v3;
  int v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;

  v2 = *result;
  if (*result)
  {
    v3 = result;
    while (1)
    {
      v4 = *v2;
      v5 = a2;
      if (*v2)
      {
        v6 = v2 + 1;
        v5 = a2;
        while (1)
        {
          v7 = *v5;
          if (v4 != v7)
            break;
          ++v5;
          v8 = *v6++;
          v4 = v8;
          if (!v8)
            goto LABEL_7;
        }
      }
      else
      {
LABEL_7:
        v7 = *v5;
      }
      if (!v7 && v2[33] == 61)
      {
        v9 = result[1];
        ++result;
        v2 = v9;
        if (v9)
          continue;
      }
      *v3++ = v2;
      v10 = result[1];
      ++result;
      v2 = v10;
      if (!v10)
        break;
    }
  }
  else
  {
    v3 = result;
  }
  *v3 = 0;
  return result;
}

unsigned __int8 **config::env::Parser::unsetEnv<30ul>(unsigned __int8 **result, unsigned __int8 *a2)
{
  unsigned __int8 *v2;
  _QWORD *v3;
  int v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;

  v2 = *result;
  if (*result)
  {
    v3 = result;
    while (1)
    {
      v4 = *v2;
      v5 = a2;
      if (*v2)
      {
        v6 = v2 + 1;
        v5 = a2;
        while (1)
        {
          v7 = *v5;
          if (v4 != v7)
            break;
          ++v5;
          v8 = *v6++;
          v4 = v8;
          if (!v8)
            goto LABEL_7;
        }
      }
      else
      {
LABEL_7:
        v7 = *v5;
      }
      if (!v7 && v2[29] == 61)
      {
        v9 = result[1];
        ++result;
        v2 = v9;
        if (v9)
          continue;
      }
      *v3++ = v2;
      v10 = result[1];
      ++result;
      v2 = v10;
      if (!v10)
        break;
    }
  }
  else
  {
    v3 = result;
  }
  *v3 = 0;
  return result;
}

unsigned __int8 **config::env::Parser::unsetEnv<19ul>(unsigned __int8 **result, unsigned __int8 *a2)
{
  unsigned __int8 *v2;
  _QWORD *v3;
  int v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;

  v2 = *result;
  if (*result)
  {
    v3 = result;
    while (1)
    {
      v4 = *v2;
      v5 = a2;
      if (*v2)
      {
        v6 = v2 + 1;
        v5 = a2;
        while (1)
        {
          v7 = *v5;
          if (v4 != v7)
            break;
          ++v5;
          v8 = *v6++;
          v4 = v8;
          if (!v8)
            goto LABEL_7;
        }
      }
      else
      {
LABEL_7:
        v7 = *v5;
      }
      if (!v7 && v2[18] == 61)
      {
        v9 = result[1];
        ++result;
        v2 = v9;
        if (v9)
          continue;
      }
      *v3++ = v2;
      v10 = result[1];
      ++result;
      v2 = v10;
      if (!v10)
        break;
    }
  }
  else
  {
    v3 = result;
  }
  *v3 = 0;
  return result;
}

unsigned __int8 **config::env::Parser::unsetEnv<27ul>(unsigned __int8 **result, unsigned __int8 *a2)
{
  unsigned __int8 *v2;
  _QWORD *v3;
  int v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;

  v2 = *result;
  if (*result)
  {
    v3 = result;
    while (1)
    {
      v4 = *v2;
      v5 = a2;
      if (*v2)
      {
        v6 = v2 + 1;
        v5 = a2;
        while (1)
        {
          v7 = *v5;
          if (v4 != v7)
            break;
          ++v5;
          v8 = *v6++;
          v4 = v8;
          if (!v8)
            goto LABEL_7;
        }
      }
      else
      {
LABEL_7:
        v7 = *v5;
      }
      if (!v7 && v2[26] == 61)
      {
        v9 = result[1];
        ++result;
        v2 = v9;
        if (v9)
          continue;
      }
      *v3++ = v2;
      v10 = result[1];
      ++result;
      v2 = v10;
      if (!v10)
        break;
    }
  }
  else
  {
    v3 = result;
  }
  *v3 = 0;
  return result;
}

unsigned __int8 **config::env::Parser::unsetEnv<18ul>(unsigned __int8 **result, unsigned __int8 *a2)
{
  unsigned __int8 *v2;
  _QWORD *v3;
  int v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;

  v2 = *result;
  if (*result)
  {
    v3 = result;
    while (1)
    {
      v4 = *v2;
      v5 = a2;
      if (*v2)
      {
        v6 = v2 + 1;
        v5 = a2;
        while (1)
        {
          v7 = *v5;
          if (v4 != v7)
            break;
          ++v5;
          v8 = *v6++;
          v4 = v8;
          if (!v8)
            goto LABEL_7;
        }
      }
      else
      {
LABEL_7:
        v7 = *v5;
      }
      if (!v7 && v2[17] == 61)
      {
        v9 = result[1];
        ++result;
        v2 = v9;
        if (v9)
          continue;
      }
      *v3++ = v2;
      v10 = result[1];
      ++result;
      v2 = v10;
      if (!v10)
        break;
    }
  }
  else
  {
    v3 = result;
  }
  *v3 = 0;
  return result;
}

void asan::initGlobalVars(uint64_t a1, uint64_t a2)
{
  asan::_shadow = a1;
  asan::_globals = a2;
  _dyld_register_func_for_add_image((void (__cdecl *)(const mach_header *, intptr_t))asan::initGlobalVars(Shadow *,asan::GlobalsRegistry *)::$_0::__invoke);
}

uint64_t asan::GlobalsRegistryImpl::registerSection(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = (unint64_t *)(result + 8);
  v4 = *(_QWORD *)(result + 8);
  if (v4 >= 0x7FF)
    asan::GlobalsRegistryImpl::registerSection();
  v5 = result + 16 * v4;
  *(_QWORD *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 24) = a3;
  do
    v6 = __ldxr(v3);
  while (__stlxr(v6 + 1, v3));
  return result;
}

unint64_t *asan::GlobalsRegistryImpl::getGlobalVar(asan::GlobalsRegistryImpl *this, unint64_t a2)
{
  unint64_t v2;
  char *v3;
  char *v4;
  uint64_t v5;
  unint64_t *result;
  uint64_t v7;

  v2 = atomic_load((unint64_t *)this + 1);
  if (!v2)
    return 0;
  v3 = (char *)this + 16;
  v4 = (char *)this + 16 * v2 + 16;
  while (1)
  {
    v5 = *((_QWORD *)v3 + 1);
    if (v5)
      break;
LABEL_8:
    v3 += 16;
    if (v3 == v4)
      return 0;
  }
  result = *(unint64_t **)v3;
  v7 = v5 << 6;
  while (*result > a2 || result[2] + *result <= a2)
  {
    result += 8;
    v7 -= 64;
    if (!v7)
      goto LABEL_8;
  }
  return result;
}

vm_address_t vm::create<asan::GlobalsRegistryImpl>()
{
  vm_map_t v0;
  debug *v1;
  const char *v2;
  vm_address_t v3;
  vm_address_t address;

  if (0x8000uLL % *MEMORY[0x24BDB1100])
    vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>();
  v0 = *MEMORY[0x24BDB1040];
  address = 0;
  v1 = (debug *)vm_map(v0, &address, 0x8000uLL, 0, 1660944385, 0, 0, 0, 3, 3, 1u);
  if ((_DWORD)v1)
    vm::create<asan::GlobalsRegistryImpl>(v1, v2);
  v3 = address;
  *(_QWORD *)address = &off_251CE0BD0;
  *(_QWORD *)(v3 + 8) = 0;
  bzero((void *)(v3 + 16), 0x7FF0uLL);
  return v3;
}

uint8_t *asan::initGlobalVars(Shadow *,asan::GlobalsRegistry *)::$_0::__invoke(const mach_header_64 *a1)
{
  uint8_t *result;
  uint8_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  unint64_t size;

  size = 0;
  result = getsectiondata(a1, "__DATA", "__asan_globals", &size);
  if ((size & 0x3F) != 0)
    asan::initGlobalVars(Shadow *,asan::GlobalsRegistry *)::$_0::__invoke();
  if (size)
  {
    v2 = result;
    v3 = (uint64_t)size >> 6;
    v4 = (uint64_t)size >> 6 << 6;
    v5 = result;
    do
    {
      (*(void (**)(uint64_t, uint8_t *))(*(_QWORD *)asan::_shadow + 16))(asan::_shadow, v5);
      v5 += 64;
      v4 -= 64;
    }
    while (v4);
    return (uint8_t *)(**(uint64_t (***)(uint64_t, uint8_t *, uint64_t))asan::_globals)(asan::_globals, v2, v3);
  }
  return result;
}

uint64_t asan::initCompilerABI(uint64_t result)
{
  _shadow = result;
  return result;
}

uint64_t __asan_abi_load_n(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  __int128 v6;
  char v7;
  _BYTE v8[7];
  __int128 v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t vars0;

  result = _shadow;
  if (_shadow)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)_shadow + 88))(_shadow, a1, a2);
    if (result)
    {
      v11 = 0;
      memset(v8, 0, sizeof(v8));
      *(_QWORD *)&v9 = v2;
      *((_QWORD *)&v9 + 1) = &vars0;
      v10 = &v11;
      *(_QWORD *)&v6 = a1;
      *((_QWORD *)&v6 + 1) = a2;
      v7 = 0;
      asan::reportError(&v9, &v6);
    }
  }
  return result;
}

uint64_t __asan_abi_region_is_poisoned(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = _shadow;
  if (_shadow)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)_shadow + 88))(_shadow, a1, a2);
  return result;
}

uint64_t __asan_abi_exp_load_n(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = _shadow;
  if (_shadow)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)_shadow + 88))(_shadow, a1, a2);
  return result;
}

uint64_t __asan_abi_store_n(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  __int128 v6;
  char v7;
  _BYTE v8[7];
  __int128 v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t vars0;

  result = _shadow;
  if (_shadow)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)_shadow + 88))(_shadow, a1, a2);
    if (result)
    {
      v11 = 0;
      memset(v8, 0, sizeof(v8));
      *(_QWORD *)&v9 = v2;
      *((_QWORD *)&v9 + 1) = &vars0;
      v10 = &v11;
      *(_QWORD *)&v6 = a1;
      *((_QWORD *)&v6 + 1) = a2;
      v7 = 1;
      asan::reportError(&v9, &v6);
    }
  }
  return result;
}

uint64_t __asan_abi_exp_store_n(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = _shadow;
  if (_shadow)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)_shadow + 88))(_shadow, a1, a2);
  return result;
}

uint64_t __asan_abi_address_is_poisoned(uint64_t a1)
{
  uint64_t result;

  result = _shadow;
  if (_shadow)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)_shadow + 64))(_shadow, a1);
  return result;
}

uint64_t __asan_abi_poison_memory_region(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = _shadow;
  if (_shadow)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)_shadow + 72))(_shadow, a1, 0, 0, a2, 249);
  return result;
}

uint64_t __asan_abi_unpoison_memory_region(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = _shadow;
  if (_shadow)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)_shadow + 80))(_shadow, a1, a2);
  return result;
}

uint64_t __asan_abi_set_shadow_xx_n(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = _shadow;
  if (_shadow)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)_shadow + 8))(_shadow, a1, a3, a2);
  return result;
}

uint64_t __asan_abi_load_cxx_array_cookie()
{
  return 0;
}

uint64_t __asan_abi_get_current_fake_stack()
{
  return 0;
}

uint64_t __asan_abi_addr_is_in_fake_stack()
{
  return 0;
}

void *__asan_abi_stack_malloc_n(int a1, size_t size)
{
  unint64_t StatusReg;
  void *result;

  if (!_shadow)
    return 0;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  *(_QWORD *)(StatusReg + 1848) = 1;
  result = malloc_type_malloc(size, 0xBA746D43uLL);
  *(_QWORD *)(StatusReg + 1848) = 0;
  return result;
}

void *__asan_abi_stack_malloc_always_n(int a1, size_t size)
{
  unint64_t StatusReg;
  void *result;

  if (!_shadow)
    return 0;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  *(_QWORD *)(StatusReg + 1848) = 1;
  result = malloc_type_malloc(size, 0x3827F463uLL);
  *(_QWORD *)(StatusReg + 1848) = 0;
  return result;
}

void __asan_abi_stack_free_n(int a1, void *a2)
{
  unint64_t StatusReg;

  if (_shadow)
  {
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    *(_QWORD *)(StatusReg + 1848) = 1;
    free(a2);
    *(_QWORD *)(StatusReg + 1848) = 0;
  }
}

uint64_t asan::initRuntime(asan *a1)
{
  asan *v1;
  uint64_t v2;
  uint64_t inited;

  if ((_BYTE)cfg)
    asan::initRuntime();
  cfg = *(_QWORD *)a1;
  asan::initShadow(a1);
  v2 = (uint64_t)v1;
  inited = asan::initGlobalsRegistry(v1);
  return asan::initRuntime(v2, inited);
}

uint64_t asan::initRuntime(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  asan::initCompilerABI(a1);
  asan::initGlobalVars(a1, a2);
  libmallocShadow = a1;
  result = malloc_sanitizer_set_functions();
  reportShadow = a1;
  reportGlobals = a2;
  return result;
}

uint64_t asan::initLibmallocHooks(uint64_t a1)
{
  libmallocShadow = a1;
  return malloc_sanitizer_set_functions();
}

uint64_t asan::initReportGeneration(uint64_t result, uint64_t a2)
{
  reportShadow = result;
  reportGlobals = a2;
  return result;
}

uint64_t asan::initLibmallocHooks(Shadow *)::$_0::__invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  if (a2)
    asan::initLibmallocHooks(Shadow *)::$_0::__invoke();
  if (!a4)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)libmallocShadow
                                                                                         + 72))(libmallocShadow, a1, a3, 0, 0, 251);
  v4 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 1848);
  v5 = *(_QWORD *)libmallocShadow;
  if (v4)
    v6 = *(uint64_t (**)(void))(v5 + 40);
  else
    v6 = *(uint64_t (**)(void))(v5 + 24);
  return v6();
}

uint64_t asan::initLibmallocHooks(Shadow *)::$_1::__invoke()
{
  uint64_t v0;

  v0 = 48;
  if (!*(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 1848))
    v0 = 32;
  return (*(uint64_t (**)(void))(*(_QWORD *)libmallocShadow + v0))();
}

void asan::reportError(__int128 *a1, __int128 *a2)
{
  unsigned __int8 (*v4)[24];
  void *v5;
  const char *v6;
  const char *v7;
  unsigned int v8;
  char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  void *v21;
  unint64_t StatusReg;
  const char *v23;
  const char *v24;
  unint64_t v25;
  const void *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  unint64_t v30;
  const void *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  unint64_t i;
  _BYTE *v36;
  const char *v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  __int128 __src;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _OWORD v50[32];
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  _QWORD v54[66];
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  Dl_info v59;
  Dl_info v60;

  malloc_sanitizer_set_functions();
  memset(v50, 0, 384);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  __src = 0u;
  v43 = 0u;
  v40 = *a1;
  v41 = *((_QWORD *)a1 + 2);
  v38 = *a2;
  v39 = *((_QWORD *)a2 + 2);
  trace::Lookup::create((trace::Lookup *)&v59, v4);
  v60.dli_fname = (const char *)reportShadow;
  v60.dli_fbase = v5;
  v60.dli_sname = (const char *)reportGlobals;
  v57 = v40;
  v58 = v41;
  v55 = v38;
  v56 = v39;
  asan::ReportGenerator::createReport((uint64_t *)&v60, (uint64_t)&v57, &v55, (uint64_t)&__src);
  if (BYTE1(cfg))
  {
    if (BYTE8(v44))
      v7 = "WRITE";
    else
      v7 = "READ";
    v8 = v45;
    if (BYTE8(v48))
      v9 = "freed ";
    else
      v9 = &byte_24BC73B6F;
    v10 = "allocation";
    if ((v45 & 0xFFFFFFFE) == 4)
      v10 = "stack variable";
    if ((_DWORD)v45 == 2)
      v11 = "global variable";
    else
      v11 = v10;
    v12 = *((_QWORD *)&v47 + 1);
    v13 = *((_QWORD *)&v43 + 1) - *((_QWORD *)&v47 + 1);
    v14 = v48 + *((_QWORD *)&v47 + 1);
    debug::print((debug *)"=================================================================\n", v6);
    debug::print((debug *)"Address Sanitizer: %s at address %p\n", v15, *((_QWORD *)&v45 + 1), *((_QWORD *)&v43 + 1));
    debug::print((debug *)"Registers: pc=%p fp=%p sp=%p\n", v16, __src, (_QWORD)v43);
    debug::print((debug *)"Faulty %s of size %zu at address %p\n", v17, v7, (_QWORD)v44, *((_QWORD *)&v43 + 1));
    debug::print((debug *)"Located at offset %td of %s%s ", v18, v13, v9, v11);
    if (v8 <= 5 && ((1 << v8) & 0x34) != 0)
      debug::print((debug *)"'%.*s' ", v19, (_QWORD)v47, *((_QWORD *)&v46 + 1));
    debug::print((debug *)"[%p, %p), size: %td\n", v19, v12, v14, (_QWORD)v48);
    debug::print((debug *)"\n", v20);
    v21 = (void *)*((_QWORD *)&__src + 1);
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    bzero(&v59.dli_sname, 0x208uLL);
    v59.dli_fname = *(const char **)(StatusReg - 8);
    v59.dli_fbase = (void *)mach_absolute_time();
    LODWORD(v59.dli_sname) = backtrace_from_fp(v21, &v59.dli_saddr, 64);
    debug::print((debug *)"%s trace on thread %llu at MAT %llu\n", v23, "Fault", v59.dli_fname, v59.dli_fbase);
    if (LODWORD(v59.dli_sname))
    {
      v25 = 0;
      do
      {
        v26 = (const void *)*((_QWORD *)&v59.dli_saddr + v25);
        memset(&v60, 0, sizeof(v60));
        dladdr(v26, &v60);
        debug::print((debug *)"  %2lu. %p in %s + %zu (%s)\n", v27, ++v25, v26, v60.dli_sname, (_BYTE *)v26 - (char *)v60.dli_saddr, v60.dli_fname);
      }
      while (v25 < LODWORD(v59.dli_sname));
    }
    debug::print((debug *)"\n", v24);
    if (v8 > 5 || ((1 << v8) & 0x34) == 0)
    {
      debug::print((debug *)"%s trace on thread %llu at MAT %llu\n", v28, "Allocation", v49);
      if (LODWORD(v50[0]))
      {
        v30 = 0;
        do
        {
          v31 = (const void *)*((_QWORD *)v50 + v30 + 1);
          memset(&v59, 0, sizeof(v59));
          dladdr(v31, &v59);
          debug::print((debug *)"  %2lu. %p in %s + %zu (%s)\n", v32, ++v30, v31, v59.dli_sname, (_BYTE *)v31 - (char *)v59.dli_saddr, v59.dli_fname);
        }
        while (v30 < LODWORD(v50[0]));
      }
      debug::print((debug *)"\n", v29);
      if (BYTE8(v48))
      {
        debug::print((debug *)"%s trace on thread %llu at MAT %llu\n", v33, "Deallocation", v51, v52);
        if (v53)
        {
          for (i = 0;
                i < v53;
                debug::print((debug *)"  %2lu. %p in %s + %zu (%s)\n", v37, ++i, v36, v59.dli_sname, v36 - (char *)v59.dli_saddr, v59.dli_fname))
          {
            v36 = (_BYTE *)v54[i];
            memset(&v59, 0, sizeof(v59));
            dladdr(v36, &v59);
          }
        }
        debug::print((debug *)"\n", v34);
      }
    }
  }
  asan::callDebuggerBreakpointSymbol(&__src);
  die();
}

void die(void)
{
  if (!HIDWORD(cfg))
    abort();
  _exit(SHIDWORD(cfg));
}

void *asan::callDebuggerBreakpointSymbol(void *__src)
{
  return memcpy(&report, __src, 0x4B0uLL);
}

BOOL __asan_report_present()
{
  return qword_257A51018 != 0;
}

uint64_t __asan_get_report_pc()
{
  return report;
}

uint64_t __asan_get_report_bp()
{
  return qword_257A51008;
}

uint64_t __asan_get_report_sp()
{
  return qword_257A51010;
}

uint64_t __asan_get_report_address()
{
  return qword_257A51018;
}

uint64_t __asan_get_report_access_type()
{
  return byte_257A51028;
}

uint64_t __asan_get_report_access_size()
{
  return qword_257A51020;
}

uint64_t __asan_get_report_description()
{
  return qword_257A51038;
}

uint64_t __asan_locate_address(uint64_t a1, uint64_t a2, unint64_t a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (qword_257A51018 != a1)
    __asan_locate_address_cold_3();
  v5 = unk_257A51060;
  *a4 = qword_257A51058;
  *a5 = v5;
  if (qword_257A51050)
  {
    if (!a3)
      __asan_locate_address_cold_1();
    if (a3 >= qword_257A51050 + 1)
      v6 = qword_257A51050 + 1;
    else
      v6 = a3;
    if (!v6)
      __asan_locate_address_cold_2();
    v7 = v6 - 1;
    v8 = *(unsigned __int8 *)qword_257A51048;
    if (v7)
      v9 = v8 == 0;
    else
      v9 = 1;
    if (v9)
    {
      v10 = 0;
    }
    else
    {
      v11 = 0;
      v12 = qword_257A51048 + 1;
      do
      {
        *(_BYTE *)(a2 + v11) = v8;
        v10 = v11 + 1;
        v8 = *(unsigned __int8 *)(v12 + v11);
      }
      while (++v11 < v7 && v8 != 0);
    }
    *(_BYTE *)(a2 + v10) = 0;
  }
  return qword_257A51040;
}

_QWORD *__asan_get_shadow_mapping(_QWORD *result, _QWORD *a2)
{
  *result = qword_257A514A0;
  *a2 = qword_257A514A8;
  return result;
}

unint64_t __asan_get_alloc_stack(uint64_t a1, _QWORD *a2, unint64_t a3, _DWORD *a4)
{
  unint64_t result;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;

  if (qword_257A51018 != a1)
    __asan_get_alloc_stack_cold_1();
  if (a3 >= dword_257A51080)
    result = dword_257A51080;
  else
    result = a3;
  if (result)
  {
    v5 = &qword_257A51088;
    v6 = result;
    do
    {
      v7 = *v5++;
      *a2++ = v7;
      --v6;
    }
    while (v6);
  }
  *a4 = qword_257A51070;
  return result;
}

unint64_t __asan_get_free_stack(uint64_t a1, _QWORD *a2, unint64_t a3, _DWORD *a4)
{
  unint64_t result;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;

  if (qword_257A51018 != a1)
    __asan_get_free_stack_cold_1();
  if (a3 >= dword_257A51298)
    result = dword_257A51298;
  else
    result = a3;
  if (result)
  {
    v5 = &qword_257A512A0;
    v6 = result;
    do
    {
      v7 = *v5++;
      *a2++ = v7;
      --v6;
    }
    while (v6);
  }
  *a4 = qword_257A51288;
  return result;
}

double asan::initShadow(asan *this)
{
  vm_map_t v1;
  debug *v2;
  const char *v3;
  double result;
  vm_address_t address;

  if (0x200000000uLL % *MEMORY[0x24BDB1100])
    vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>();
  v1 = *MEMORY[0x24BDB1040];
  address = 0;
  v2 = (debug *)vm_map(v1, &address, 0x200000000uLL, 0, 1660944385, 0, 0, 0, 3, 3, 1u);
  if ((_DWORD)v2)
    asan::initShadow(v2, v3);
  shadow = (uint64_t)&off_251CE0C08;
  *(_QWORD *)algn_257A514B8 = address;
  *(_QWORD *)&result = 0x200000000;
  xmmword_257A514C0 = xmmword_24BC735A0;
  return result;
}

void *ASanShadow::memsetShadow(ASanShadow *this, void *__b, int __c, size_t __len)
{
  return memset(__b, __c, __len);
}

void ASanShadow::bzeroShadow(ASanShadow *this, void *a2, size_t a3)
{
  bzero(a2, a3);
}

void *ASanShadow::poison(ASanShadow *this, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, int a6)
{
  char *v6;
  int v7;
  size_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  char *v15;
  char *v16;
  size_t v17;
  size_t v18;

  if ((a2 & 7) != 0)
    ASanShadow::poison((uint64_t)this, a2, a3);
  v6 = (char *)(*((_QWORD *)this + 1) + ((unint64_t)(a2 - *((_QWORD *)this + 3)) >> 3));
  v7 = a3 & 7;
  v8 = a3 >> 3;
  v9 = a4 >> 3;
  v10 = (a4 + a3 + a5) >> 3;
  if (a6 == 233)
    v11 = 250;
  else
    v11 = a6;
  if (a6 == 233)
    v12 = 251;
  else
    v12 = a6;
  if (a6 == 240)
    v13 = 241;
  else
    v13 = v11;
  if (a6 == 240)
    v14 = 243;
  else
    v14 = v12;
  memset(v6, v13, a4 >> 3);
  v15 = &v6[v9];
  bzero(v15, v8);
  v16 = &v15[v8];
  v17 = v9 + v8;
  if (v7 && v10 > v17)
  {
    *v16++ = v7;
    v18 = v10 + ~v17;
  }
  else
  {
    v18 = v10 - v17;
  }
  return memset(v16, v14, v18);
}

void ASanShadow::unpoison(ASanShadow *this, uint64_t a2, unint64_t a3)
{
  bzero((void *)(*((_QWORD *)this + 1) + ((unint64_t)(a2 - *((_QWORD *)this + 3)) >> 3)), a3 >> 3);
}

BOOL ASanShadow::addressIsPoisoned(ASanShadow *this, uint64_t a2)
{
  BOOL v2;

  if (*(_BYTE *)(((unint64_t)(a2 - *((_QWORD *)this + 3)) >> 3) + *((_QWORD *)this + 1)))
    v2 = (a2 & 7) < *(char *)(((unint64_t)(a2 - *((_QWORD *)this + 3)) >> 3) + *((_QWORD *)this + 1));
  else
    v2 = 1;
  return !v2;
}

uint64_t ASanShadow::regionIsPoisoned(uint64_t this, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  BOOL v25;

  if (!a3)
    return 0;
  v3 = a2;
  v4 = a2 + a3;
  if (__CFADD__(a2, a3))
  {
    __break(1u);
    return this;
  }
  v5 = *(_QWORD *)(this + 24);
  v6 = *(_QWORD *)(this + 8);
  if (!*(_BYTE *)(((unint64_t)(v4 - 1 - v5) >> 3) + v6)
    || ((v4 - 1) & 7) < *(char *)(((unint64_t)(v4 - 1 - v5) >> 3) + v6))
  {
    v8 = v6 + ((unint64_t)(a2 - v5) >> 3);
    v9 = v4 - v5;
    v10 = v6 + ((unint64_t)(v4 - v5) >> 3);
    v11 = v10 - v8;
    if (v10 <= v8)
      return 0;
    v12 = v11 >= 0x100 ? 256 : v10 - v8;
    if (!memcmp((const void *)(v6 + ((unint64_t)(a2 - v5) >> 3)), &zeros, v12))
    {
      v13 = 0;
      v14 = v9 >> 3;
      v15 = v11 >> 8;
      v16 = (char *)(v8 + 256);
      v17 = v14 - ((unint64_t)(v3 - v5) >> 3) - 256;
      do
      {
        v18 = v13;
        if (v15 == v13)
          break;
        ++v13;
        v19 = v17 - 256;
        v20 = v17 >= 0x100 ? 256 : v17;
        v21 = memcmp(v16, &zeros, v20);
        v16 += 256;
        v17 = v19;
      }
      while (!v21);
      if (v15 <= v18)
        return 0;
    }
  }
  v22 = v3;
  do
  {
    v23 = *(char *)(((unint64_t)(v3 - v5) >> 3) + v6);
    v24 = v3 & 7;
    ++v22;
    ++v3;
    if (v23)
      v25 = v24 < v23;
    else
      v25 = 1;
  }
  while (v25);
  return v3 - 1;
}

uint64_t ASanShadow::getShadowByteForAddress(ASanShadow *this, unint64_t a2)
{
  return *(unsigned __int8 *)(((a2 - *((_QWORD *)this + 3)) >> 3) + *((_QWORD *)this + 1));
}

_QWORD *ASanShadow::setShadowBytes(_QWORD *result, uint64_t a2, size_t a3, int __c)
{
  if (a3)
    return memset((void *)(result[1] + a2), __c, a3);
  return result;
}

unint64_t ASanShadow::shadowForAddress(ASanShadow *this, uint64_t a2)
{
  return *((_QWORD *)this + 1) + ((unint64_t)(a2 - *((_QWORD *)this + 3)) >> 3);
}

BOOL ASanShadow::addressIsInMem(ASanShadow *this, unint64_t a2)
{
  unint64_t v2;

  v2 = *((_QWORD *)this + 1);
  return v2 > a2 || *((_QWORD *)this + 2) + v2 <= a2;
}

BOOL ASanShadow::addressIsInShadow(ASanShadow *this, unint64_t a2)
{
  unint64_t v2;

  v2 = *((_QWORD *)this + 1);
  return v2 <= a2 && *((_QWORD *)this + 2) + v2 > a2;
}

uint64_t ASanShadow::getShadowStart(ASanShadow *this)
{
  return *((_QWORD *)this + 1);
}

uint64_t ASanShadow::getShadowValue(ASanShadow *this, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unsigned __int8 *v4;

  v3 = *((_QWORD *)this + 1);
  if (v3 <= a2 && *((_QWORD *)this + 2) + v3 > a2)
    ASanShadow::getShadowValue();
  if (a3 >= 0x11)
    ASanShadow::getShadowValue();
  v4 = (unsigned __int8 *)(v3 + ((a2 - *((_QWORD *)this + 3)) >> 3));
  if (a3 > 8 && *v4 == 0)
    ++v4;
  if ((char)*v4 > 0)
    ++v4;
  return *v4;
}

void ASanShadow::getAllocationEnd(uint64_t a1, uint64_t *a2)
{
  uint64_t IsPoisoned;
  unsigned __int8 *v4;
  unsigned int v5;

  IsPoisoned = ASanShadow::regionIsPoisoned(a1, *a2, a2[1]);
  if (IsPoisoned)
  {
    v4 = (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + ((unint64_t)(IsPoisoned - *(_QWORD *)(a1 + 24)) >> 3));
    v5 = *v4;
    if (v5 <= 7)
    {
      v5 = v4[1];
      if (v5 <= 8)
        ASanShadow::getAllocationEnd();
    }
    __asm { BR              X13 }
  }
  ASanShadow::getAllocationEnd();
}

unint64_t ASanShadow::getAllocationInfo(uint64_t a1, __int128 *a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t result;
  __int128 v7;
  uint64_t v8;

  v7 = *a2;
  v8 = *((_QWORD *)a2 + 2);
  ASanShadow::getAllocationEnd(a1, (uint64_t *)&v7);
  v4 = v3;
  result = v3 - *(_QWORD *)(v3 - 16);
  if (result > *(_QWORD *)a2 || *(_QWORD *)a2 >= v4)
    ASanShadow::getAllocationInfo();
  return result;
}

void *ASanShadow::poisonGlobal(ASanShadow *a1, uint64_t *a2)
{
  void *result;

  result = ASanShadow::poison(a1, *a2, a2[1], 0, a2[2] - a2[1], 249);
  *(_QWORD *)((((unint64_t)a2 - *((_QWORD *)a1 + 3)) >> 3) + *((_QWORD *)a1 + 1)) = 0xF9F9F9F9F9F9F9F9;
  return result;
}

void *ASanShadow::poisonAllocation(ASanShadow *a1, uint64_t a2, unint64_t a3, unint64_t a4, int a5)
{
  unint64_t v6;
  void *result;

  v6 = a3 - a4;
  if (a3 <= a4)
    ASanShadow::poisonAllocation();
  if (v6 <= 0xF)
    ASanShadow::poisonAllocation();
  result = ASanShadow::poison(a1, a2, a4, 0, v6, a5);
  if (((a3 + a2) & 7) != 0)
    ASanShadow::poisonAllocation();
  *(_QWORD *)(a3 + a2 - 16) = a3;
  return result;
}

void *ASanShadow::poisonNewAllocation(ASanShadow *this, uint64_t a2, unint64_t a3, unint64_t a4)
{
  return ASanShadow::poisonAllocation(this, a2, a3, a4, 251);
}

void *ASanShadow::poisonNewStackFrame(ASanShadow *this, uint64_t a2, unint64_t a3, unint64_t a4)
{
  return ASanShadow::poisonAllocation(this, a2, a3, a4, 243);
}

void *ASanShadow::poisonFreedAllocation(ASanShadow *this, uint64_t a2, uint64_t a3)
{
  void *result;
  uint64_t v6;
  uint64_t v7;

  result = ASanShadow::poison(this, a2, 0, 0, a3, 253);
  if ((a2 & 7) != 0)
    ASanShadow::poison((uint64_t)result, v6, v7);
  *(_BYTE *)(((unint64_t)(a2 - *((_QWORD *)this + 3)) >> 3) + *((_QWORD *)this + 1)) = -4;
  return result;
}

void *ASanShadow::poisonFreedStackFrame(ASanShadow *this, uint64_t a2, uint64_t a3)
{
  void *result;
  uint64_t v6;
  uint64_t v7;

  result = ASanShadow::poison(this, a2, 0, 0, a3, 253);
  if ((a2 & 7) != 0)
    ASanShadow::poison((uint64_t)result, v6, v7);
  *(_BYTE *)(((unint64_t)(a2 - *((_QWORD *)this + 3)) >> 3) + *((_QWORD *)this + 1)) = -4;
  return result;
}

void OUTLINED_FUNCTION_0_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 127, a4);
}

void asan::ReportGenerator::createReport()
{
  __assert_rtn("createReport", "report_generator.cpp", 27, "shadowVal != ShadowValue::Valid");
}

void asan::ReportGenerator::addHeapBufferOverflowInfo()
{
  __assert_rtn("addHeapBufferOverflowInfo", "report_generator.cpp", 140, "alloc.isValid()");
}

void asan::ReportGenerator::addUseAfterFreeInfo()
{
  __assert_rtn("addUseAfterFreeInfo", "report_generator.cpp", 120, "alloc.isValid()");
}

void asan::ReportGenerator::addGlobalBufferOverflowInfo()
{
  __assert_rtn("addGlobalBufferOverflowInfo", "report_generator.cpp", 104, "global");
}

void asan::ReportGenerator::fillStackVarInfo()
{
  __assert_rtn("fillStackVarInfo", "report_generator.cpp", 88, "stackVar.offset != 0");
}

{
  __assert_rtn("fillStackVarInfo", "report_generator.cpp", 80, "alloc.isValid()");
}

void asan::ReportGenerator::StackVar::getStackVar()
{
  __assert_rtn("getStackVar", "report_generator.cpp", 191, "numVars != 0");
}

void trace::initTraceCollection()
{
  __assert_rtn("install", "malloc_logger.h", 76, "malloc_logger != loggerFunc");
}

void vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>(debug *a1, const char *a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  abort();
}

void vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>()
{
  __assert_rtn("mapCommon", "vm_helpers.h", 26, "(size % vm_page_size) == 0");
}

void vm::create<trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>>(debug *a1, const char *a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  abort();
}

void trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::insert()
{
  __assert_rtn("insert", "allocation_map.h", 69, "BlockInfo::isValidBlockAddress(blockAddress)");
}

void trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace()
{
  __assert_rtn("insertTrace", "trace_depot.h", 128, "length <= MaxTraceLength");
}

void trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::addDeallocTrace()
{
  __assert_rtn("addDeallocTrace", "allocation_map.h", 82, "BlockInfo::isValidBlockAddress(blockAddress)");
}

void libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1("collectTrace", "trace_depot.h", a3, "topFramesToSkip <= 6");
}

void MemoryReader::read()
{
  __assert_rtn("read", "memory_reader.h", 38, "count < MaxCount");
}

void trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get()
{
  __assert_rtn("get", "allocation_map.h", 96, "BlockInfo::isValidBlockAddress(blockAddress)");
}

void trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::retrieveTraces()
{
  __assert_rtn("retrieveTraces", "trace_collector.h", 68, "alloc.isValid()");
}

void BlockInfo::endInclusive()
{
  __assert_rtn("endInclusive", "types.h", 108, "isValid()");
}

void asan::GlobalsRegistryImpl::registerSection()
{
  __assert_rtn("registerSection", "globals.cpp", 60, "sectionCount < MaxSectionCount");
}

void vm::create<asan::GlobalsRegistryImpl>(debug *a1, const char *a2)
{
  debug::print(a1, a2, 0x8000, 0x8000uLL % *MEMORY[0x24BDB1100]);
  abort();
}

void asan::initGlobalVars(Shadow *,asan::GlobalsRegistry *)::$_0::__invoke()
{
  __assert_rtn("getGlobalsSection", "globals.cpp", 33, "(size % sizeof(GlobalVar)) == 0");
}

void asan::initRuntime()
{
  __assert_rtn("initRuntime", "runtime.cpp", 24, "!cfg.enable");
}

void asan::initLibmallocHooks(Shadow *)::$_0::__invoke()
{
  __assert_rtn("operator()", "runtime.cpp", 43, "leftrz_sz == 0");
}

void __asan_locate_address_cold_1()
{
  __assert_rtn("copyNonTerminated", "internal_helpers.h", 92, "dstSize > 0");
}

void __asan_locate_address_cold_2()
{
  __assert_rtn("copy", "internal_helpers.h", 78, "dstSize > 0");
}

void __asan_locate_address_cold_3()
{
  __assert_rtn("__asan_locate_address", "debugger_abi.cpp", 36, "(uintptr_t)addr == report.access.address");
}

void __asan_get_alloc_stack_cold_1()
{
  __assert_rtn("__asan_get_alloc_stack", "debugger_abi.cpp", 61, "(uintptr_t)addr == report.access.address");
}

void __asan_get_free_stack_cold_1()
{
  __assert_rtn("__asan_get_free_stack", "debugger_abi.cpp", 66, "(uintptr_t)addr == report.access.address");
}

void asan::initShadow(debug *a1, const char *a2)
{
  debug::print(a1, a2, 0x200000000, 0x200000000uLL % *MEMORY[0x24BDB1100]);
  abort();
}

void ASanShadow::poison(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_0("poison", "shadow.cpp", a3, "(base & (ASAN_SHADOW_ALIGNMENT - 1)) == 0");
}

void ASanShadow::getShadowValue()
{
  __assert_rtn("getShadowValue", "shadow.cpp", 271, "accessSize <= 16");
}

{
  __assert_rtn("getShadowValue", "shadow.cpp", 270, "addressIsInMem(addr)");
}

void ASanShadow::getAllocationEnd()
{
  __assert_rtn("getAllocationEnd", "shadow.cpp", 289, "allocationEnd");
}

{
  __assert_rtn("getAllocationEnd", "shadow.cpp", 296, "*shadowVal > 0x8");
}

void ASanShadow::getAllocationInfo()
{
  __assert_rtn("getAllocationInfo", "shadow.cpp", 342, "allocation <= access.address && access.address < allocationEnd");
}

void ASanShadow::poisonAllocation()
{
  __assert_rtn("poisonAllocation", "shadow.cpp", 357, "redzoneSize >= 16");
}

{
  __assert_rtn("poisonAllocation", "shadow.cpp", 361, "endPtr % 8 == 0");
}

{
  __assert_rtn("poisonAllocation", "shadow.cpp", 355, "allocSize > userSize");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDB0CF8](a1, a2, *(_QWORD *)&a3, a4);
}

void _dyld_register_func_for_add_image(void (__cdecl *func)(const mach_header *, intptr_t))
{
  MEMORY[0x24BDB0CB0](func);
}

void _exit(int a1)
{
  MEMORY[0x24BDB0F60](*(_QWORD *)&a1);
}

uint64_t _simple_getenv()
{
  return MEMORY[0x24BDB1230]();
}

void abort(void)
{
  MEMORY[0x24BDB0D40]();
}

int backtrace_from_fp(void *startfp, void **array, int size)
{
  return MEMORY[0x24BDB0D60](startfp, array, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDB0D68](a1, a2);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x24BDB0CB8](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDB0DB8](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDB1128](a1);
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x24BDB0CC0](mhp, segname, sectname, size);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDB1008]();
}

uint64_t malloc_sanitizer_set_functions()
{
  return MEMORY[0x24BDB1170]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDB1180](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDB1190](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDB0E20](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDB0E28](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDB0E30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDB0E38](__b, *(_QWORD *)&__c, __len);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0EE0](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0EF0](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t thread_stack_pcs()
{
  return MEMORY[0x24BDB0F08]();
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x24BDB10F8](*(_QWORD *)&target_task, address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&object, offset, *(_QWORD *)&copy);
}

