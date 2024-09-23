@implementation WebCache

+ (id)statistics
{
  WebCore::MemoryCache *v2;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v2 = (WebCore::MemoryCache *)WebCore::MemoryCache::singleton((WebCore::MemoryCache *)a1);
  WebCore::MemoryCache::getStatistics(v2);
  v26[0] = CFSTR("Images");
  v27[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v26[1] = CFSTR("CSS");
  v27[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v26[2] = CFSTR("XSL");
  v27[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
  v26[3] = CFSTR("JavaScript");
  v27[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v28[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v24[0] = CFSTR("Images");
  v25[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v24[1] = CFSTR("CSS");
  v25[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v24[2] = CFSTR("XSL");
  v25[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
  v24[3] = CFSTR("JavaScript");
  v25[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
  v28[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v22[0] = CFSTR("Images");
  v23[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v22[1] = CFSTR("CSS");
  v23[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
  v22[2] = CFSTR("XSL");
  v23[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
  v22[3] = CFSTR("JavaScript");
  v23[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
  v28[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v20[0] = CFSTR("Images");
  v21[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v20[1] = CFSTR("CSS");
  v21[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v20[2] = CFSTR("XSL");
  v21[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
  v20[3] = CFSTR("JavaScript");
  v21[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
  v28[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
}

+ (void)empty
{
  unint64_t v2;
  WebCore::CrossOriginPreflightResultCache *v3;

  v2 = +[WebView _cacheModel](WebView, "_cacheModel");
  +[WebView _setCacheModel:](WebView, "_setCacheModel:", 0);
  v3 = (WebCore::CrossOriginPreflightResultCache *)WebCore::CrossOriginPreflightResultCache::singleton((WebCore::CrossOriginPreflightResultCache *)+[WebView _setCacheModel:](WebView, "_setCacheModel:", v2));
  WebCore::CrossOriginPreflightResultCache::clear(v3);
}

+ (void)emptyInMemoryResources
{
  WebThreadRun();
}

uint64_t __34__WebCache_emptyInMemoryResources__block_invoke()
{
  unint64_t v0;
  WebCore::MemoryCache *v1;

  v0 = +[WebView _cacheModel](WebView, "_cacheModel");
  +[WebView _setCacheModel:](WebView, "_setCacheModel:", 0);
  v1 = (WebCore::MemoryCache *)WebCore::MemoryCache::singleton((WebCore::MemoryCache *)+[WebView _setCacheModel:](WebView, "_setCacheModel:", v0));
  return WebCore::MemoryCache::pruneLiveResources(v1);
}

+ (void)sizeOfDeadResources:(int *)a3
{
  WebCore::MemoryCache *v4;
  int32x2_t v5;
  int32x2_t v6;
  int32x2_t v7;
  int32x2_t v8;
  int32x2_t v9;

  v4 = (WebCore::MemoryCache *)WebCore::MemoryCache::singleton((WebCore::MemoryCache *)a1);
  WebCore::MemoryCache::getStatistics(v4);
  if (a3)
  {
    v5 = vadd_s32(vadd_s32(v6, v7), vadd_s32(v9, v8));
    *a3 = vsub_s32(v5, vdup_lane_s32(v5, 1)).u32[0];
  }
}

+ (CGImage)imageForURL:(id)a3
{
  StringImpl *v3;
  _DWORD *v4;
  WTF::StringImpl *v5;
  CGImage *v6;
  uint64_t v7;
  StringImpl *v8;
  WebCore::DestinationColorSpace *v9;
  uint64_t v10;
  WTF::StringImpl *v11;
  uint64_t v12;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  int v19;
  uint64_t v20;
  WTF::StringImpl *v21[5];
  _BYTE v22[148];
  char v23;
  uint64_t v24;
  _DWORD *v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;
  uint64_t v30;

  if (a3)
  {
    MEMORY[0x1D82A38F0](v21, a3);
    WebCore::ResourceRequestBase::RequestData::RequestData((uint64_t)v22, (uint64_t)v21, 0);
    v24 = 0;
    v4 = (_DWORD *)*MEMORY[0x1E0CBF738];
    if (*MEMORY[0x1E0CBF738])
      *v4 += 2;
    v25 = v4;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = v29 & 0xE0 | 5;
    v23 |= 2u;
    v30 = 0;
    v5 = v21[0];
    v21[0] = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
        v5 = (WTF::StringImpl *)WTF::StringImpl::destroy(v5, v3);
      else
        *(_DWORD *)v5 -= 2;
    }
    WebCore::MemoryCache::singleton(v5);
    v7 = WebCore::MemoryCache::resourceForRequest();
    if (v7
      && (*(_BYTE *)(v7 + 556) & 0x1F) == 1
      && *(_QWORD *)(v7 + 688)
      && (v9 = (WebCore::DestinationColorSpace *)WebCore::CachedImage::image((WebCore::CachedImage *)v7),
          v10 = WebCore::DestinationColorSpace::SRGB(v9),
          (*(void (**)(WTF::StringImpl **__return_ptr, WebCore::DestinationColorSpace *, uint64_t))(*(_QWORD *)v9 + 288))(v21, v9, v10), v21[0]))
    {
      v6 = *(CGImage **)WebCore::NativeImage::platformImage(v21[0]);
      v11 = v21[0];
      v21[0] = 0;
      if (v11)
      {
        v12 = *((_QWORD *)v11 + 1);
        if (__ldaxr((unsigned __int8 *)v12))
        {
          __clrex();
        }
        else if (!__stxr(1u, (unsigned __int8 *)v12))
        {
          goto LABEL_21;
        }
        MEMORY[0x1D82A3914](v12);
LABEL_21:
        v15 = *(_QWORD *)(v12 + 8);
        v16 = v15 - 1;
        *(_QWORD *)(v12 + 8) = v15 - 1;
        if (v15 == 1)
        {
          v20 = *(_QWORD *)(v12 + 16);
          v17 = *(_QWORD *)(v12 + 24);
          *(_QWORD *)(v12 + 24) = 0;
          v18 = v20 != 0;
          LODWORD(v20) = __ldxr((unsigned __int8 *)v12);
          if ((_DWORD)v20 == 1)
          {
LABEL_23:
            if (!__stlxr(0, (unsigned __int8 *)v12))
            {
LABEL_28:
              if (!v16)
              {
                if (v17)
                  (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
                if (!v18)
                  WTF::fastFree((WTF *)v12, v8);
              }
              goto LABEL_17;
            }
LABEL_27:
            WTF::Lock::unlockSlow((WTF::Lock *)v12);
            goto LABEL_28;
          }
        }
        else
        {
          v17 = 0;
          v18 = 1;
          v19 = __ldxr((unsigned __int8 *)v12);
          if (v19 == 1)
            goto LABEL_23;
        }
        __clrex();
        goto LABEL_27;
      }
    }
    else
    {
      v6 = 0;
    }
LABEL_17:
    WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)v22, v8);
    return v6;
  }
  return 0;
}

+ (void)setDisabled:(BOOL)a3
{
  _BOOL8 v3;
  WebCore::MemoryCache *v5;
  WebCore::MemoryCache *v6;

  v3 = a3;
  v5 = (WebCore::MemoryCache *)pthread_main_np();
  if ((_DWORD)v5)
  {
    v6 = (WebCore::MemoryCache *)WebCore::MemoryCache::singleton(v5);
    WebCore::MemoryCache::setDisabled(v6);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(a1, "_webkit_invokeOnMainThread"), "setDisabled:", v3);
  }
}

+ (BOOL)isDisabled
{
  return *(_BYTE *)WebCore::MemoryCache::singleton((WebCore::MemoryCache *)a1);
}

+ (void)clearCachedCredentials
{
  uint64_t v2;
  WebCore::NetworkStorageSession *v3;
  SessionID v4;
  uint64_t v5;
  void *v6;

  +[WebView _makeAllWebViewsPerformSelector:](WebView, "_makeAllWebViewsPerformSelector:", sel__clearCredentials);
  {
    v2 = defaultNetworkStorageSession(void)::session;
    if (defaultNetworkStorageSession(void)::session)
      goto LABEL_3;
  }
  else
  {
    defaultNetworkStorageSession(void)::session = 0;
  }
  v3 = (WebCore::NetworkStorageSession *)WTF::fastMalloc((WTF *)0x128);
  v4.m_identifier = 1;
  v2 = WebCore::NetworkStorageSession::NetworkStorageSession(v3, v4);
  {
    defaultNetworkStorageSession(void)::session = v2;
    WebCore::CredentialStorage::clearCredentials((WebCore::CredentialStorage *)(v2 + 96));
    return;
  }
  v5 = defaultNetworkStorageSession(void)::session;
  defaultNetworkStorageSession(void)::session = v2;
  if (v5)
  {
    MEMORY[0x1D82A5C18](v5);
    if (*(_DWORD *)(v5 + 8))
    {
      *(_QWORD *)(v5 + 288) = 0;
      *(_OWORD *)(v5 + 256) = 0u;
      *(_OWORD *)(v5 + 272) = 0u;
      *(_OWORD *)(v5 + 224) = 0u;
      *(_OWORD *)(v5 + 240) = 0u;
      *(_OWORD *)(v5 + 192) = 0u;
      *(_OWORD *)(v5 + 208) = 0u;
      *(_OWORD *)(v5 + 160) = 0u;
      *(_OWORD *)(v5 + 176) = 0u;
      *(_OWORD *)(v5 + 128) = 0u;
      *(_OWORD *)(v5 + 144) = 0u;
      *(_OWORD *)(v5 + 96) = 0u;
      *(_OWORD *)(v5 + 112) = 0u;
      *(_OWORD *)(v5 + 64) = 0u;
      *(_OWORD *)(v5 + 80) = 0u;
      *(_OWORD *)(v5 + 32) = 0u;
      *(_OWORD *)(v5 + 48) = 0u;
      *(_OWORD *)v5 = 0u;
      *(_OWORD *)(v5 + 16) = 0u;
        goto LABEL_10;
    }
    else
    {
      WTF::fastFree((WTF *)v5, v6);
      {
LABEL_10:
        WebCore::CredentialStorage::clearCredentials((WebCore::CredentialStorage *)(defaultNetworkStorageSession(void)::session
                                                                                  + 96));
        return;
      }
    }
    defaultNetworkStorageSession(void)::session = 0;
    WebCore::CredentialStorage::clearCredentials((WebCore::CredentialStorage *)0x60);
    return;
  }
LABEL_3:
  WebCore::CredentialStorage::clearCredentials((WebCore::CredentialStorage *)(v2 + 96));
}

@end
