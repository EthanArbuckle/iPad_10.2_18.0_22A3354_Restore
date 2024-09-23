@implementation ZN7WebCore36MediaPlayerPrivateMediaSourceAVFObjC31setCurrentTimeDidChangeCallbackEONSt3

WTF::MediaTime *___ZN7WebCore36MediaPlayerPrivateMediaSourceAVFObjC31setCurrentTimeDidChangeCallbackEONSt3__18functionIFvRKN3WTF9MediaTimeEEEE_block_invoke(WTF::MediaTime *result, uint64_t a2)
{
  WebCore::MediaPlayerPrivateMediaSourceAVFObjC *v2;
  int v3;
  unsigned __int8 v4;
  uint64_t v5;
  unsigned __int8 v6;
  _BOOL4 v8;
  char v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  WebCore::MediaPlayerPrivateMediaSourceAVFObjC *v15;
  const WTF::MonotonicTime *v16;
  _QWORD v17[2];
  __int128 v18;

  v2 = (WebCore::MediaPlayerPrivateMediaSourceAVFObjC *)*((_QWORD *)result + 4);
  if (*((_QWORD *)v2 + 28))
  {
    v3 = *(_DWORD *)(a2 + 12);
    if ((v3 & 0x1D) == 1)
    {
      v4 = v3 & 1;
      if ((~v3 & 3) == 0)
        v4 = v3 & 1 | 2;
      if ((~v3 & 5) == 0)
        v4 |= 4u;
      if ((~v3 & 9) == 0)
        v4 |= 8u;
      v5 = *(_QWORD *)a2;
      if ((~v3 & 0x11) != 0)
        v6 = v4;
      else
        v6 = v4 | 0x10;
      v8 = (v6 & 1) == 0 || *(_DWORD *)(a2 + 8) != 0;
      if (v5 >= 0)
        v9 = 5;
      else
        v9 = 9;
      v10 = !v8;
      if (v8)
      {
        v11 = *(_QWORD *)a2;
      }
      else
      {
        v6 = v9;
        v11 = v5 >> 63;
      }
      if (v10)
        v12 = 1;
      else
        v12 = *(unsigned int *)(a2 + 8);
      v17[0] = v11;
      v17[1] = v12 | ((unint64_t)v6 << 32);
      *(_QWORD *)&v18 = WebCore::MediaPlayerPrivateMediaSourceAVFObjC::clampTimeToSensicalValue(v2, (const WTF::MediaTime *)v17);
      *((_QWORD *)&v18 + 1) = v13;
    }
    else
    {
      v18 = *(_OWORD *)WTF::MediaTime::zeroTime(result);
    }
    v14 = *((_QWORD *)v2 + 28);
    if (v14)
    {
      return (WTF::MediaTime *)(*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)v14 + 48))(v14, &v18);
    }
    else
    {
      v15 = (WebCore::MediaPlayerPrivateMediaSourceAVFObjC *)std::__throw_bad_function_call[abi:sn180100]();
      return (WTF::MediaTime *)WebCore::MediaPlayerPrivateMediaSourceAVFObjC::playAtHostTime(v15, v16);
    }
  }
  return result;
}

@end
