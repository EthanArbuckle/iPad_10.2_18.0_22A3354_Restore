@implementation ZN7WebCore26SourceBufferPrivateAVFObjC35notifyClientWhenReadyForMoreSamplesEy

unsigned __int8 *___ZN7WebCore26SourceBufferPrivateAVFObjC35notifyClientWhenReadyForMoreSamplesEy_block_invoke(unsigned __int8 *result)
{
  uint64_t v1;
  unsigned __int8 *v2;
  uint64_t v3;
  int v5;

  v1 = *((_QWORD *)result + 4);
  if (!v1)
    return result;
  v2 = result;
  v3 = *((_QWORD *)result + 5);
  if (__ldaxr((unsigned __int8 *)v1))
  {
    __clrex();
LABEL_5:
    result = (unsigned __int8 *)MEMORY[0x19AEA534C](v1);
    goto LABEL_6;
  }
  if (__stxr(1u, (unsigned __int8 *)v1))
    goto LABEL_5;
LABEL_6:
  if (*(_QWORD *)(v1 + 24))
    ++*(_QWORD *)(v1 + 8);
  else
    v3 = 0;
  v5 = __ldxr((unsigned __int8 *)v1);
  if (v5 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v1))
    {
      if (!v3)
        return result;
      goto LABEL_12;
    }
  }
  else
  {
    __clrex();
  }
  result = (unsigned __int8 *)WTF::Lock::unlockSlow((WTF::Lock *)v1);
  if (v3)
  {
LABEL_12:
    WebCore::SourceBufferPrivateAVFObjC::didBecomeReadyForMoreSamples((_QWORD *)v3, *((WTF::String **)v2 + 6));
    return WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::SourceBufferPrivate,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v3 + 8));
  }
  return result;
}

@end
