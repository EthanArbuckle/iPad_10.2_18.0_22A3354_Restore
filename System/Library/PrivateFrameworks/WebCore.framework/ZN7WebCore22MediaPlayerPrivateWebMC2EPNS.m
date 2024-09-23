@implementation ZN7WebCore22MediaPlayerPrivateWebMC2EPNS

unsigned __int8 *___ZN7WebCore22MediaPlayerPrivateWebMC2EPNS_11MediaPlayerE_block_invoke(unsigned __int8 *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unsigned __int8 v5;
  uint64_t v6;
  unsigned __int8 v7;
  _BOOL4 v9;
  char v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  const char **v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  const char *v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  __int128 v23;

  v2 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 4) + 8) + 48);
  if (v2 && *(_QWORD *)(v2 + 8))
  {
    v3 = *((_QWORD *)result + 5);
    v4 = *(_DWORD *)(a2 + 12);
    if ((v4 & 0x1D) == 1)
    {
      v5 = v4 & 1;
      if ((~v4 & 3) == 0)
        v5 = v4 & 1 | 2;
      if ((~v4 & 5) == 0)
        v5 |= 4u;
      if ((~v4 & 9) == 0)
        v5 |= 8u;
      v6 = *(_QWORD *)a2;
      if ((~v4 & 0x11) != 0)
        v7 = v5;
      else
        v7 = v5 | 0x10;
      v9 = (v7 & 1) == 0 || *(_DWORD *)(a2 + 8) != 0;
      if (v6 >= 0)
        v10 = 5;
      else
        v10 = 9;
      v11 = !v9;
      if (v9)
      {
        v12 = *(_QWORD *)a2;
      }
      else
      {
        v7 = v10;
        v12 = v6 >> 63;
      }
      if (v11)
        v13 = 1;
      else
        v13 = *(unsigned int *)(a2 + 8);
      v19 = (const char *)v12;
      v20 = v13 | ((unint64_t)v7 << 32);
      if ((*(_BYTE *)(v3 + 724) & 0x1D) != 1
        || (v14 = (const char **)(v3 + 712),
            result = (unsigned __int8 *)WTF::MediaTime::compare((WTF::MediaTime *)&v19, (const WTF::MediaTime *)(v3 + 712)), (_DWORD)result != -1))
      {
        v14 = &v19;
      }
      v15 = *(_OWORD *)v14;
    }
    else
    {
      result = (unsigned __int8 *)WTF::MediaTime::zeroTime((WTF::MediaTime *)result);
      v15 = *(_OWORD *)result;
    }
    v23 = v15;
    v16 = *(_QWORD *)(v3 + 368);
    v17 = *(_QWORD *)(v3 + 376);
    v19 = "MediaPlayerPrivateWebM";
    v20 = 23;
    v21 = "MediaPlayerPrivateWebM_block_invoke";
    v22 = v17;
    v18 = *(_BYTE *)(v3 + 776);
    if (*(_BYTE *)(v16 + 12))
      result = (unsigned __int8 *)WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [36],WTF::MediaTime,char [13],BOOL,char [13],BOOL>((uint64_t)&WebCore::LogMedia, 0, (WTF::Logger::LogSiteIdentifier *)&v19, "synchronizer fired: time clamped = ", (WTF::MediaTime *)&v23, ", seeking = ", (int)v3 + 788, ", pending = ", (uint64_t)&v18);
    if (*(_BYTE *)(v3 + 788))
    {
      if (!*(_BYTE *)(v3 + 776))
      {
        *(_BYTE *)(v3 + 788) = 0;
        return WebCore::MediaPlayerPrivateWebM::maybeCompleteSeek((unsigned __int8 *)v3);
      }
    }
  }
  return result;
}

@end
