@implementation ZN7WebCore24VideoMediaSampleRenderer23resetReadyForMoreSampleEv

_QWORD *___ZN7WebCore24VideoMediaSampleRenderer23resetReadyForMoreSampleEv_block_invoke(_QWORD *result, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v5;
  unsigned __int8 *v6;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  BOOL v11;
  int v12;
  WTF *v13;
  void *v14;
  uint64_t v15;

  v2 = result[4];
  if (!v2)
    return result;
  v3 = result[5];
  if (__ldaxr((unsigned __int8 *)v2))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v2))
  {
    goto LABEL_6;
  }
  result = (_QWORD *)MEMORY[0x19AEA534C](v2);
LABEL_6:
  if (*(_QWORD *)(v2 + 24))
    ++*(_QWORD *)(v2 + 8);
  else
    v3 = 0;
  v5 = __ldxr((unsigned __int8 *)v2);
  if (v5 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v2))
    {
      if (!v3)
        return result;
      goto LABEL_15;
    }
  }
  else
  {
    __clrex();
  }
  result = (_QWORD *)WTF::Lock::unlockSlow((WTF::Lock *)v2);
  if (!v3)
    return result;
LABEL_15:
  result = *(_QWORD **)(v3 + 32);
  if (result)
    result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 16))(result);
  v6 = *(unsigned __int8 **)v3;
  if (__ldaxr(*(unsigned __int8 **)v3))
  {
    __clrex();
  }
  else if (!__stxr(1u, v6))
  {
    goto LABEL_21;
  }
  result = (_QWORD *)MEMORY[0x19AEA534C](v6);
LABEL_21:
  v8 = *((_QWORD *)v6 + 1);
  v9 = v8 - 1;
  *((_QWORD *)v6 + 1) = v8 - 1;
  if (v8 == 1)
  {
    v15 = *((_QWORD *)v6 + 2);
    v10 = (id *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = 0;
    v11 = v15 != 0;
  }
  else
  {
    v10 = 0;
    v11 = 1;
  }
  v12 = __ldxr(v6);
  if (v12 != 1)
  {
    __clrex();
LABEL_28:
    result = (_QWORD *)WTF::Lock::unlockSlow((WTF::Lock *)v6);
    if (v9)
      return result;
    goto LABEL_29;
  }
  if (__stlxr(0, v6))
    goto LABEL_28;
  if (v9)
    return result;
LABEL_29:
  if (v10)
  {
    WebCore::VideoMediaSampleRenderer::~VideoMediaSampleRenderer(v10);
    result = (_QWORD *)WTF::fastFree(v13, v14);
  }
  if (!v11)
    return (_QWORD *)WTF::fastFree((WTF *)v6, a2);
  return result;
}

@end
