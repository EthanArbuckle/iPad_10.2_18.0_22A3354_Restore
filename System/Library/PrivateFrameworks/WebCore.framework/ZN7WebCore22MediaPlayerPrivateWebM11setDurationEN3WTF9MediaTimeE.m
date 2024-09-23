@implementation ZN7WebCore22MediaPlayerPrivateWebM11setDurationEN3WTF9MediaTimeE

unsigned __int8 *___ZN7WebCore22MediaPlayerPrivateWebM11setDurationEN3WTF9MediaTimeE_block_invoke(unsigned __int8 *result)
{
  uint64_t v1;
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  double v8;
  int v9;
  void *v10;
  double v11;
  int v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  int v17;
  _BYTE v18[12];
  unsigned int v19;
  _QWORD v20[2];

  v1 = *((_QWORD *)result + 4);
  if (v1)
  {
    v2 = result;
    v3 = *((_QWORD *)result + 12);
    v4 = *((_QWORD *)result + 5);
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
    v20[0] = WebCore::MediaPlayerPrivateWebM::currentTime((id *)v3);
    v20[1] = v7;
    if (*(_BYTE *)(*(_QWORD *)(v3 + 368) + 12))
      WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [38],WTF::MediaTime>((uint64_t)&WebCore::LogMedia, 0, (WTF::Logger::LogSiteIdentifier *)(v2 + 64), "boundary time observer called, now = ", (WTF::MediaTime *)v20);
    *(_BYTE *)(v3 + 640) = 0;
    LODWORD(v8) = 0;
    objc_msgSend(*(id *)(v3 + 112), "setRate:", v8);
    if (WTF::MediaTime::compare((WTF::MediaTime *)v20, (const WTF::MediaTime *)(v2 + 48)) == -1)
    {
      if (*(_BYTE *)(*(_QWORD *)(v3 + 368) + 12))
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [53]>((uint64_t)&WebCore::LogMedia, 1u, (WTF::Logger::LogSiteIdentifier *)(v2 + 64), "ERROR: boundary time observer called before duration");
      v10 = *(void **)(v3 + 112);
      if ((v2[60] & 0x20) != 0)
      {
        WTF::MediaTime::toDouble((WTF::MediaTime *)(v2 + 48));
        PAL::softLinkCoreMediaCMTimeMakeWithSeconds((PAL *)*((unsigned int *)v2 + 14), v13, v12);
      }
      else
      {
        PAL::softLinkCoreMediaCMTimeMake(*((PAL **)v2 + 6), *((unsigned int *)v2 + 14), v9);
      }
      v19 = v19 & 0xFFFFFFFE | v2[60] & 1 | v2[60] & 0xE;
      LODWORD(v11) = 0;
      objc_msgSend(v10, "setRate:time:", v18, v11);
    }
    v14 = *(_QWORD *)(v3 + 96);
    if (!v14)
      return WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::WebMResourceClientParent,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v4 + 56));
    v15 = *(_QWORD *)(v3 + 104);
    if (__ldaxr((unsigned __int8 *)v14))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v14))
    {
      goto LABEL_29;
    }
    MEMORY[0x19AEA534C](v14);
LABEL_29:
    if (*(_QWORD *)(v14 + 24))
      ++*(_QWORD *)(v14 + 8);
    else
      v15 = 0;
    v17 = __ldxr((unsigned __int8 *)v14);
    if (v17 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v14))
      {
        if (!v15)
          return WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::WebMResourceClientParent,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v4 + 56));
LABEL_35:
        (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(v15 + 8) + 8) + 56))(*(_QWORD *)(*(_QWORD *)(v15 + 8) + 8));
        WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayer,(WTF::DestructionThread)1>(*(unsigned __int8 **)v15);
        return WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::WebMResourceClientParent,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v4 + 56));
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v14);
    if (!v15)
      return WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::WebMResourceClientParent,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v4 + 56));
    goto LABEL_35;
  }
  return result;
}

@end
