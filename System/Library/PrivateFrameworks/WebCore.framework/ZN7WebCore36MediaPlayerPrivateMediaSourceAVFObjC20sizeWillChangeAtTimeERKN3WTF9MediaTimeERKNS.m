@implementation ZN7WebCore36MediaPlayerPrivateMediaSourceAVFObjC20sizeWillChangeAtTimeERKN3WTF9MediaTimeERKNS

unsigned __int8 *___ZN7WebCore36MediaPlayerPrivateMediaSourceAVFObjC20sizeWillChangeAtTimeERKN3WTF9MediaTimeERKNS_9FloatSizeE_block_invoke(unsigned __int8 *result)
{
  uint64_t v1;
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  const void *v8;
  uint64_t v9;

  v1 = *((_QWORD *)result + 5);
  if (v1 && *(_QWORD *)(v1 + 8))
  {
    v2 = result;
    v3 = *((_QWORD *)result + 4);
    v4 = *(_QWORD *)(v3 + 296);
    if (v4 != *(_QWORD *)(v3 + 304))
    {
      v5 = *(_QWORD *)(v3 + 312);
      v6 = *(const void **)(v5 + 8 * v4);
      *(_QWORD *)(v5 + 8 * v4) = 0;
      v7 = *(_QWORD *)(v3 + 312);
      v8 = *(const void **)(v7 + 8 * v4);
      *(_QWORD *)(v7 + 8 * v4) = 0;
      if (v8)
      {
        CFRelease(v8);
        v4 = *(_QWORD *)(v3 + 296);
      }
      if (v4 == *(unsigned int *)(v3 + 320) - 1)
        v9 = 0;
      else
        v9 = v4 + 1;
      *(_QWORD *)(v3 + 296) = v9;
      objc_msgSend(*(id *)(v3 + 192), "removeTimeObserver:", v6);
      if (v6)
        CFRelease(v6);
    }
    return WebCore::MediaPlayerPrivateMediaSourceAVFObjC::setNaturalSize((unsigned __int8 *)v3, (const WebCore::FloatSize *)(v2 + 48));
  }
  return result;
}

@end
