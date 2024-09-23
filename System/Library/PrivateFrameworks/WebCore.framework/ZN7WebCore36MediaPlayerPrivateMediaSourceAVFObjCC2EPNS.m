@implementation ZN7WebCore36MediaPlayerPrivateMediaSourceAVFObjCC2EPNS

WTF::MediaTime *___ZN7WebCore36MediaPlayerPrivateMediaSourceAVFObjCC2EPNS_11MediaPlayerE_block_invoke(WTF::MediaTime *result, uint64_t a2)
{
  uint64_t v2;
  WTF::MediaTime *v3;
  uint64_t v4;
  int v5;
  unsigned __int8 v6;
  uint64_t v7;
  unsigned __int8 v8;
  _BOOL4 v10;
  char v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  _QWORD v18[2];
  __int128 v19;

  v2 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 4) + 8) + 48);
  if (v2 && *(_QWORD *)(v2 + 8))
  {
    v3 = result;
    v4 = *((_QWORD *)result + 5);
    v5 = *(_DWORD *)(a2 + 12);
    if ((v5 & 0x1D) == 1)
    {
      v6 = v5 & 1;
      if ((~v5 & 3) == 0)
        v6 = v5 & 1 | 2;
      if ((~v5 & 5) == 0)
        v6 |= 4u;
      if ((~v5 & 9) == 0)
        v6 |= 8u;
      v7 = *(_QWORD *)a2;
      if ((~v5 & 0x11) != 0)
        v8 = v6;
      else
        v8 = v6 | 0x10;
      v10 = (v8 & 1) == 0 || *(_DWORD *)(a2 + 8) != 0;
      if (v7 >= 0)
        v11 = 5;
      else
        v11 = 9;
      v12 = !v10;
      if (v10)
      {
        v13 = *(_QWORD *)a2;
      }
      else
      {
        v8 = v11;
        v13 = v7 >> 63;
      }
      if (v12)
        v14 = 1;
      else
        v14 = *(unsigned int *)(a2 + 8);
      v18[0] = v13;
      v18[1] = v14 | ((unint64_t)v8 << 32);
      *(_QWORD *)&v19 = WebCore::MediaPlayerPrivateMediaSourceAVFObjC::clampTimeToSensicalValue((WebCore::MediaPlayerPrivateMediaSourceAVFObjC *)v4, (const WTF::MediaTime *)v18);
      *((_QWORD *)&v19 + 1) = v15;
    }
    else
    {
      v19 = *(_OWORD *)WTF::MediaTime::zeroTime(result);
    }
    v16 = *(_QWORD *)(v4 + 488);
    v17 = *(unsigned __int8 *)(v4 + 120);
    LOBYTE(v18[0]) = *(_BYTE *)(v4 + 120);
    if (*(_BYTE *)(v16 + 12))
    {
      WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [36],WTF::MediaTime,char [13],BOOL,char [13],BOOL>((uint64_t)&WebCore::LogMediaSource, 0, (WTF::MediaTime *)((char *)v3 + 48), "synchronizer fired: time clamped = ", (WTF::MediaTime *)&v19, ", seeking = ", v4 + 449, ", pending = ", (uint64_t)v18);
      v17 = *(unsigned __int8 *)(v4 + 120);
    }
    if (*(_BYTE *)(v4 + 449))
    {
      if (v17)
      {
LABEL_36:
        WebCore::MediaPlayerPrivateMediaSourceAVFObjC::seekInternal(v4);
LABEL_37:
        result = *(WTF::MediaTime **)(v4 + 224);
        if (result)
          return (WTF::MediaTime *)(*(uint64_t (**)(WTF::MediaTime *, __int128 *))(*(_QWORD *)result + 48))(result, &v19);
        return result;
      }
      *(_BYTE *)(v4 + 449) = 0;
      WebCore::MediaPlayerPrivateMediaSourceAVFObjC::maybeCompleteSeek((WebCore::MediaPlayerPrivateMediaSourceAVFObjC *)v4);
      v17 = *(unsigned __int8 *)(v4 + 120);
    }
    if (!v17)
      goto LABEL_37;
    goto LABEL_36;
  }
  return result;
}

@end
