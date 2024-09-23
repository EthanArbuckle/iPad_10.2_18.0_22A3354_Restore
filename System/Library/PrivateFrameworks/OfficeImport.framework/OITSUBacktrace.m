@implementation OITSUBacktrace

- (OITSUBacktrace)initWithAdjustment:(int)a3
{
  OITSUBacktrace *v4;
  int v5;
  void **v6;
  objc_super v8;
  void *__src[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)OITSUBacktrace;
  v4 = -[OITSUBacktrace init](&v8, sel_init);
  if (v4)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    *(_OWORD *)__src = 0u;
    v10 = 0u;
    v5 = backtrace(__src, 256);
    v4->_frames = v5;
    v6 = (void **)malloc_type_calloc(v5, 8uLL, 0x80040B8603338uLL);
    v4->_callstack = v6;
    memcpy(v6, __src, 8 * v4->_frames);
    v4->_initAdjustment = a3;
  }
  return v4;
}

- (OITSUBacktrace)init
{
  return -[OITSUBacktrace initWithAdjustment:](self, "initWithAdjustment:", 2);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_callstack);
  v3.receiver = self;
  v3.super_class = (Class)OITSUBacktrace;
  -[OITSUBacktrace dealloc](&v3, sel_dealloc);
}

+ (id)backtrace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAdjustment:", 2);
}

+ (id)new
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAdjustment:", 2);
}

+ (id)caller
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "backtrace"), "callerAtIndex:", 2);
}

+ (id)callee
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "backtrace"), "callerAtIndex:", 1);
}

- (id)backtraceString
{
  uint64_t initAdjustment;
  uint64_t v3;
  char **v4;
  void *v5;
  char **v6;
  uint64_t v7;

  initAdjustment = self->_initAdjustment;
  v3 = (self->_frames - initAdjustment);
  v4 = backtrace_symbols(&self->_callstack[initAdjustment], v3);
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("Backtrace:\n"));
  if ((int)v3 >= 1)
  {
    v6 = v4;
    do
    {
      v7 = (uint64_t)*v6++;
      objc_msgSend(v5, "appendFormat:", CFSTR("\t%s\n"), v7);
      --v3;
    }
    while (v3);
  }
  free(v4);
  return v5;
}

- (id)callerAtIndex:(int64_t)a3
{
  Dl_info v6;

  memset(&v6, 0, sizeof(v6));
  if (dladdr(*((const void **)&self->_callstack[self->_initAdjustment] + a3), &v6))
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6.dli_sname);
  else
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%s @ %p)"), v6.dli_fname, *((_QWORD *)&self->_callstack[self->_initAdjustment] + a3));
}

- (id)caller
{
  return -[OITSUBacktrace callerAtIndex:](self, "callerAtIndex:", 1);
}

- (id)callee
{
  return -[OITSUBacktrace callerAtIndex:](self, "callerAtIndex:", 0);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int frames;
  int v9;
  BOOL v10;
  BOOL v12;

  v5 = objc_opt_class();
  v6 = TSUDynamicCast(v5, (uint64_t)a3);
  frames = self->_frames;
  LODWORD(v7) = self->_initAdjustment;
  v9 = *(_DWORD *)(v6 + 16) - *(_DWORD *)(v6 + 20);
  v10 = frames - (_DWORD)v7 == v9;
  if (frames - (_DWORD)v7 == v9 && frames > (int)v7)
  {
    v7 = (int)v7;
    do
    {
      v12 = self->_callstack[v7] == *(void **)(*(_QWORD *)(v6 + 8) + 8 * v7);
      v10 = v12;
      ++v7;
    }
    while (v12 && v7 < frames);
  }
  return v10;
}

- (unint64_t)hash
{
  return 2048;
}

@end
