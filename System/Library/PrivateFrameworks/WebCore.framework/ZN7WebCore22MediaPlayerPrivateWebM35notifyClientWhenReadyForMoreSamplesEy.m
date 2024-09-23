@implementation ZN7WebCore22MediaPlayerPrivateWebM35notifyClientWhenReadyForMoreSamplesEy

unsigned __int8 *___ZN7WebCore22MediaPlayerPrivateWebM35notifyClientWhenReadyForMoreSamplesEy_block_invoke(unsigned __int8 *result)
{
  uint64_t v1;
  unsigned __int8 *v2;
  _QWORD *v3;
  uint64_t v4;
  int v6;

  v1 = *((_QWORD *)result + 5);
  if (!v1)
    return result;
  v2 = result;
  v3 = (_QWORD *)*((_QWORD *)result + 4);
  v4 = *((_QWORD *)result + 6);
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
    v4 = 0;
  v6 = __ldxr((unsigned __int8 *)v1);
  if (v6 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v1))
    {
      if (!v4)
        return result;
      goto LABEL_12;
    }
  }
  else
  {
    __clrex();
  }
  result = (unsigned __int8 *)WTF::Lock::unlockSlow((WTF::Lock *)v1);
  if (v4)
  {
LABEL_12:
    WebCore::MediaPlayerPrivateWebM::didBecomeReadyForMoreSamples(v3, *((WTF::String **)v2 + 7));
    return WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::WebMResourceClientParent,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v4 + 56));
  }
  return result;
}

@end
