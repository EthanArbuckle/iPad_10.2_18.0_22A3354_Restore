@implementation ZN7WebCore29LocalSampleBufferDisplayLayer40requestNotificationWhenReadyForVideoDataEv

unsigned __int8 *___ZN7WebCore29LocalSampleBufferDisplayLayer40requestNotificationWhenReadyForVideoDataEv_block_invoke(unsigned __int8 *result)
{
  uint64_t v1;
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  int v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  int v16;
  void *v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  _QWORD *v24;

  v1 = *((_QWORD *)result + 5);
  if (v1)
  {
    v2 = result;
    v3 = *((_QWORD *)result + 4);
    v4 = *((_QWORD *)result + 6);
    if (__ldaxr((unsigned __int8 *)v1))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v1))
    {
      goto LABEL_6;
    }
    result = (unsigned __int8 *)MEMORY[0x19AEA534C](v1);
LABEL_6:
    if (*(_QWORD *)(v1 + 24))
      ++*(_QWORD *)(v1 + 8);
    else
      v4 = 0;
    v6 = __ldxr((unsigned __int8 *)v1);
    if (v6 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v1))
      {
        if (!v4)
          return result;
        goto LABEL_15;
      }
    }
    else
    {
      __clrex();
    }
    result = (unsigned __int8 *)WTF::Lock::unlockSlow((WTF::Lock *)v1);
    if (!v4)
      return result;
LABEL_15:
    v7 = *(_QWORD *)(v3 + 56);
    v8 = *((_QWORD *)v2 + 5);
    if (!v8)
    {
      v10 = 0;
      goto LABEL_27;
    }
    if (__ldaxr((unsigned __int8 *)v8))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v8))
    {
      goto LABEL_20;
    }
    MEMORY[0x19AEA534C](v8);
LABEL_20:
    if (*(_QWORD *)(v8 + 24))
    {
      ++*(_QWORD *)(v8 + 16);
      v10 = v8;
    }
    else
    {
      v10 = 0;
    }
    v11 = __ldxr((unsigned __int8 *)v8);
    if (v11 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v8))
      {
LABEL_27:
        v12 = *((_QWORD *)v2 + 6);
        v13 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
        *v13 = &off_1E3202D48;
        v13[1] = v3;
        if (!v10)
        {
          v15 = 0;
          goto LABEL_39;
        }
        if (__ldaxr((unsigned __int8 *)v10))
        {
          __clrex();
        }
        else if (!__stxr(1u, (unsigned __int8 *)v10))
        {
          goto LABEL_32;
        }
        MEMORY[0x19AEA534C](v10);
LABEL_32:
        if (*(_QWORD *)(v10 + 24))
        {
          ++*(_QWORD *)(v10 + 16);
          v15 = v10;
        }
        else
        {
          v15 = 0;
        }
        v16 = __ldxr((unsigned __int8 *)v10);
        if (v16 == 1)
        {
          if (!__stlxr(0, (unsigned __int8 *)v10))
          {
LABEL_39:
            v13[2] = v15;
            v13[3] = v12;
            v24 = v13;
            (*(void (**)(uint64_t, _QWORD **))(*(_QWORD *)v7 + 32))(v7, &v24);
            v18 = v24;
            v24 = 0;
            if (v18)
              (*(void (**)(_QWORD *))(*v18 + 8))(v18);
            if (!v10)
              return WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::SampleBufferDisplayLayer,(WTF::DestructionThread)2>(*(unsigned __int8 **)(v4 + 8));
            if (__ldaxr((unsigned __int8 *)v10))
            {
              __clrex();
            }
            else if (!__stxr(1u, (unsigned __int8 *)v10))
            {
              goto LABEL_46;
            }
            MEMORY[0x19AEA534C](v10);
LABEL_46:
            v20 = *(_QWORD *)(v10 + 16) - 1;
            *(_QWORD *)(v10 + 16) = v20;
            if (v20)
            {
              v23 = __ldxr((unsigned __int8 *)v10);
              if (v23 == 1)
              {
                if (!__stlxr(0, (unsigned __int8 *)v10))
                  return WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::SampleBufferDisplayLayer,(WTF::DestructionThread)2>(*(unsigned __int8 **)(v4 + 8));
              }
              else
              {
                __clrex();
              }
              WTF::Lock::unlockSlow((WTF::Lock *)v10);
              return WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::SampleBufferDisplayLayer,(WTF::DestructionThread)2>(*(unsigned __int8 **)(v4 + 8));
            }
            v21 = *(_QWORD *)(v10 + 8);
            v22 = __ldxr((unsigned __int8 *)v10);
            if (v22 == 1)
            {
              if (!__stlxr(0, (unsigned __int8 *)v10))
              {
                if (!v21)
                  goto LABEL_53;
                return WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::SampleBufferDisplayLayer,(WTF::DestructionThread)2>(*(unsigned __int8 **)(v4 + 8));
              }
            }
            else
            {
              __clrex();
            }
            WTF::Lock::unlockSlow((WTF::Lock *)v10);
            if (!v21)
LABEL_53:
              WTF::fastFree((WTF *)v10, v17);
            return WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::SampleBufferDisplayLayer,(WTF::DestructionThread)2>(*(unsigned __int8 **)(v4 + 8));
          }
        }
        else
        {
          __clrex();
        }
        WTF::Lock::unlockSlow((WTF::Lock *)v10);
        goto LABEL_39;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v8);
    goto LABEL_27;
  }
  return result;
}

@end
