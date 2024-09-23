@implementation ZN7WebCore32InbandChapterTrackPrivateAVFObjC15processChaptersEN3WTF9RetainPtrI7NSArrayIP20AVTimedMetadataGroupEEE

WTF::StringImpl *___ZN7WebCore32InbandChapterTrackPrivateAVFObjC15processChaptersEN3WTF9RetainPtrI7NSArrayIP20AVTimedMetadataGroupEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  WTF::StringImpl *result;
  char v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  char *v14;
  unsigned __int8 *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  WTF::Logger *v22;
  uint64_t v23;
  uint64_t v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  WTF::StringImpl *v27;
  WTF::StringImpl *v28;
  WTF::Logger *v29;
  uint64_t v30;
  WTF::StringImpl **v31;
  WTF::StringImpl *v32;
  WTF::StringImpl *v33;
  WTF::StringImpl *v34;
  WTF::StringImpl *v35;
  WTF::StringImpl *v36;
  WTF::StringImpl *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  WTF::String *v45;
  id v46;
  WTF::Logger *v47;
  uint64_t v48;
  WTF::StringImpl *v49;
  WTF::StringImpl *v50;
  WTF::StringImpl *v51;
  WTF::StringImpl *v52;
  WTF::StringImpl *v53;
  WTF::StringImpl *v54;
  WTF::StringImpl *v55;
  WTF::StringImpl *v56;
  WTF::StringImpl *v57;
  uint8_t buf[16];
  WTF::StringImpl *v59[2];
  uint64_t v60;
  WTF::StringImpl *v61;
  int v62;
  WTF::StringImpl *v63;
  int v64;
  WTF::StringImpl *v65[3];

  v65[1] = *(WTF::StringImpl **)MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v46 = 0;
  result = (WTF::StringImpl *)objc_msgSend(*(id *)(a1 + 48), "statusOfValueForKey:error:", CFSTR("value"), &v46);
  v45 = result;
  v4 = (char)v46;
  if (v46)
  {
    if (!*(_BYTE *)(*(_QWORD *)(v2 + 32) + 12))
      return result;
    WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)(a1 + 104));
    WTF::String::String((WTF::String *)&v52, "@\"value\" failed failed to load, status is ");
    WTF::String::number(v45);
    WTF::String::String((WTF::String *)&v50, ", error = ");
    MEMORY[0x19AEA5508](&v49, objc_msgSend(v46, "localizedDescription"));
    v47 = v52;
    v57 = v51;
    *(_QWORD *)buf = v53;
    v55 = v49;
    v56 = v50;
    result = (WTF::StringImpl *)WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)&v47, (uint64_t *)&v57, (uint64_t *)&v56, (uint64_t *)&v55, &v54);
    if (!v54)
    {
      __break(0xC471u);
      return result;
    }
    v6 = v49;
    v49 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2)
        WTF::StringImpl::destroy(v6, v5);
      else
        *(_DWORD *)v6 -= 2;
    }
    v7 = v50;
    v50 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2)
        WTF::StringImpl::destroy(v7, v5);
      else
        *(_DWORD *)v7 -= 2;
    }
    v8 = v51;
    v51 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2)
        WTF::StringImpl::destroy(v8, v5);
      else
        *(_DWORD *)v8 -= 2;
    }
    v9 = v52;
    v52 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
        WTF::StringImpl::destroy(v9, v5);
      else
        *(_DWORD *)v9 -= 2;
    }
    v10 = v53;
    v53 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
        WTF::StringImpl::destroy(v10, v5);
      else
        *(_DWORD *)v10 -= 2;
    }
    v11 = qword_1ECE7C4A0;
    v12 = os_log_type_enabled((os_log_t)qword_1ECE7C4A0, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v12)
    {
      WTF::String::utf8();
      v14 = v47 ? (char *)v47 + 16 : 0;
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v14;
      _os_log_impl(&dword_1940B8000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      v12 = (uint64_t)v47;
      v47 = 0;
      if (v12)
      {
        if (*(_DWORD *)v12 == 1)
          v12 = WTF::fastFree((WTF *)v12, v13);
        else
          --*(_DWORD *)v12;
      }
    }
    if (WebCore::LogMedia && byte_1ECE7C490)
    {
      v15 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
      while (1)
      {
        v16 = *v15;
        if ((v16 & 1) != 0)
          break;
        v17 = __ldaxr(v15);
        if (v17 == v16)
        {
          if (!__stxr(v16 | 1, v15))
          {
            v18 = WTF::Logger::observers((WTF::Logger *)v12);
            v19 = *(unsigned int *)(v18 + 12);
            if ((_DWORD)v19)
            {
              v20 = *(uint64_t **)v18;
              v44 = *(_QWORD *)v18 + 8 * v19;
              do
              {
                v21 = *v20;
                *(_DWORD *)buf = 0;
                WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)(a1 + 104));
                LODWORD(v59[0]) = 0;
                WTF::String::String((WTF::String *)&v59[1], "@\"value\" failed failed to load, status is ");
                LODWORD(v60) = 0;
                WTF::String::number(v45);
                v62 = 0;
                WTF::String::String((WTF::String *)&v63, ", error = ");
                v64 = 0;
                MEMORY[0x19AEA5508](v65, objc_msgSend(v46, "localizedDescription"));
                v47 = 0;
                v48 = 0;
                v22 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x50);
                LODWORD(v48) = 5;
                v47 = v22;
                v23 = HIDWORD(v48);
                *((_DWORD *)v22 + 4 * HIDWORD(v48)) = *(_DWORD *)buf;
                v24 = *(_QWORD *)&buf[8];
                if (*(_QWORD *)&buf[8])
                  **(_DWORD **)&buf[8] += 2;
                *((_QWORD *)v22 + 2 * v23 + 1) = v24;
                *((_DWORD *)v22 + 4 * (v23 + 1)) = v59[0];
                v25 = v59[1];
                if (v59[1])
                  *(_DWORD *)v59[1] += 2;
                *((_QWORD *)v22 + 2 * (v23 + 1) + 1) = v25;
                *((_DWORD *)v22 + 4 * (v23 + 2)) = v60;
                v26 = v61;
                if (v61)
                  *(_DWORD *)v61 += 2;
                *((_QWORD *)v22 + 2 * (v23 + 2) + 1) = v26;
                *((_DWORD *)v22 + 4 * (v23 + 3)) = v62;
                v27 = v63;
                if (v63)
                  *(_DWORD *)v63 += 2;
                *((_QWORD *)v22 + 2 * (v23 + 3) + 1) = v27;
                *((_DWORD *)v22 + 4 * (v23 + 4)) = v64;
                v28 = v65[0];
                if (v65[0])
                  *(_DWORD *)v65[0] += 2;
                *((_QWORD *)v22 + 2 * (v23 + 4) + 1) = v28;
                HIDWORD(v48) = v23 + 5;
                (*(void (**)(uint64_t, char *, uint64_t, WTF::Logger **))(*(_QWORD *)v21 + 16))(v21, &WebCore::LogMedia, 1, &v47);
                v29 = v47;
                if (HIDWORD(v48))
                {
                  v30 = 16 * HIDWORD(v48);
                  v31 = (WTF::StringImpl **)((char *)v47 + 8);
                  do
                  {
                    v32 = *v31;
                    *v31 = 0;
                    if (v32)
                    {
                      if (*(_DWORD *)v32 == 2)
                        WTF::StringImpl::destroy(v32, (WTF::StringImpl *)v13);
                      else
                        *(_DWORD *)v32 -= 2;
                    }
                    v31 += 2;
                    v30 -= 16;
                  }
                  while (v30);
                  v29 = v47;
                }
                if (v29)
                {
                  v47 = 0;
                  LODWORD(v48) = 0;
                  WTF::fastFree(v29, v13);
                }
                v33 = v65[0];
                v65[0] = 0;
                if (v33)
                {
                  if (*(_DWORD *)v33 == 2)
                    WTF::StringImpl::destroy(v33, (WTF::StringImpl *)v13);
                  else
                    *(_DWORD *)v33 -= 2;
                }
                v34 = v63;
                v63 = 0;
                if (v34)
                {
                  if (*(_DWORD *)v34 == 2)
                    WTF::StringImpl::destroy(v34, (WTF::StringImpl *)v13);
                  else
                    *(_DWORD *)v34 -= 2;
                }
                v35 = v61;
                v61 = 0;
                if (v35)
                {
                  if (*(_DWORD *)v35 == 2)
                    WTF::StringImpl::destroy(v35, (WTF::StringImpl *)v13);
                  else
                    *(_DWORD *)v35 -= 2;
                }
                v36 = v59[1];
                v59[1] = 0;
                if (v36)
                {
                  if (*(_DWORD *)v36 == 2)
                    WTF::StringImpl::destroy(v36, (WTF::StringImpl *)v13);
                  else
                    *(_DWORD *)v36 -= 2;
                }
                v37 = *(WTF::StringImpl **)&buf[8];
                *(_QWORD *)&buf[8] = 0;
                if (v37)
                {
                  if (*(_DWORD *)v37 == 2)
                    WTF::StringImpl::destroy(v37, (WTF::StringImpl *)v13);
                  else
                    *(_DWORD *)v37 -= 2;
                }
                ++v20;
              }
              while (v20 != (uint64_t *)v44);
            }
            v38 = __ldxr(v15);
            if (v38 == 1)
            {
              if (!__stlxr(0, v15))
                break;
            }
            else
            {
              __clrex();
            }
            WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
            break;
          }
        }
        else
        {
          __clrex();
        }
      }
    }
    result = v54;
    v54 = 0;
    if (result)
    {
      if (*(_DWORD *)result == 2)
        result = (WTF::StringImpl *)WTF::StringImpl::destroy(result, (WTF::StringImpl *)v13);
      else
        *(_DWORD *)result -= 2;
    }
    v4 = v46 != 0;
  }
  if (v45 == (WTF::String *)2 && (v4 & 1) == 0)
  {
    v40 = *(_QWORD *)(a1 + 40);
    v39 = *(_QWORD *)(a1 + 48);
    *(_QWORD *)(a1 + 40) = 0;
    *(_QWORD *)(a1 + 48) = 0;
    v41 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)buf = *(_OWORD *)(a1 + 56);
    *(_OWORD *)v59 = v41;
    v60 = *(_QWORD *)(a1 + 88);
    v42 = *(_DWORD *)(a1 + 96);
    v43 = WTF::fastMalloc((WTF *)0x48);
    *(_QWORD *)v43 = &off_1E3202668;
    *(_QWORD *)(v43 + 8) = v39;
    *(_QWORD *)(v43 + 16) = v40;
    *(_OWORD *)(v43 + 24) = *(_OWORD *)buf;
    *(_OWORD *)(v43 + 40) = *(_OWORD *)v59;
    *(_QWORD *)(v43 + 56) = v60;
    *(_DWORD *)(v43 + 64) = v42;
    v47 = (WTF::Logger *)v43;
    WTF::callOnMainThread();
    result = v47;
    v47 = 0;
    if (result)
      return (WTF::StringImpl *)(*(uint64_t (**)(WTF::StringImpl *))(*(_QWORD *)result + 8))(result);
  }
  return result;
}

@end
