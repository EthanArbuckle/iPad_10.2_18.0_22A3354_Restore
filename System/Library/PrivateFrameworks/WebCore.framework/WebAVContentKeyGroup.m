@implementation WebAVContentKeyGroup

- (WebAVContentKeyGroup)initWithContentKeySession:(id)a3 dataSource:(void *)a4
{
  WebAVContentKeyGroup *v6;
  WebAVContentKeyGroup *v7;
  void *v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int *m_ptr;
  unsigned int v15;
  unsigned int v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  WebAVContentKeyGroup *result;
  int v22;
  int v23;
  int v24;
  BOOL v25;
  int v26;
  BOOL v27;
  int v28;
  unsigned int v29;
  WTF::StringImpl *v30;
  WTF::StringImpl *v31;
  WTF::StringImpl *v32;
  WTF::StringImpl *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  char *v37;
  unsigned __int8 *v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  WTF::Logger *v45;
  uint64_t v46;
  uint64_t v47;
  WTF::StringImpl *v48;
  WTF::StringImpl *v49;
  WTF::Logger *v50;
  uint64_t v51;
  uint64_t v52;
  WTF::StringImpl **v53;
  WTF::StringImpl *v54;
  WTF::StringImpl *v55;
  WTF::StringImpl *v56;
  WTF::StringImpl *v57;
  int v58;
  WTF::StringImpl *v59;
  uint64_t v60;
  void *v61;
  _QWORD v62[4];
  objc_super v63;
  WTF::Logger *v64;
  uint64_t v65;
  WTF::StringImpl *v66;
  WTF::StringImpl *v67;
  WTF::StringImpl *v68;
  WTF::StringImpl *v69;
  __int128 buf;
  int v71;
  WTF::StringImpl *v72;
  int v73;
  WTF::StringImpl *v74[3];

  v74[1] = *(WTF::StringImpl **)MEMORY[0x1E0C80C00];
  v63.receiver = self;
  v63.super_class = (Class)WebAVContentKeyGroup;
  v6 = -[WebAVContentKeyGroup init](&v63, sel_init);
  v7 = v6;
  if (!v6)
    return v7;
  objc_storeWeak(&v6->_contentKeySession.m_weakReference, a3);
  v9 = *((_QWORD *)a4 + 1);
  if (v9)
    goto LABEL_117;
  v9 = WTF::fastCompactMalloc((WTF *)0x10);
  *(_DWORD *)v9 = 1;
  *(_QWORD *)(v9 + 8) = a4;
  v10 = (unsigned int *)*((_QWORD *)a4 + 1);
  *((_QWORD *)a4 + 1) = v9;
  if (!v10)
    goto LABEL_117;
  do
  {
    v11 = __ldaxr(v10);
    v12 = v11 - 1;
  }
  while (__stlxr(v12, v10));
  if (!v12)
  {
    atomic_store(1u, v10);
    WTF::fastFree((WTF *)v10, v8);
  }
  v9 = *((_QWORD *)a4 + 1);
  if (v9)
  {
LABEL_117:
    do
      v13 = __ldaxr((unsigned int *)v9);
    while (__stlxr(v13 + 1, (unsigned int *)v9));
  }
  m_ptr = (unsigned int *)v7->_dataSource.m_impl.m_ptr;
  v7->_dataSource.m_impl.m_ptr = (DefaultWeakPtrImpl *)v9;
  if (m_ptr)
  {
    do
    {
      v15 = __ldaxr(m_ptr);
      v16 = v15 - 1;
    }
    while (__stlxr(v16, m_ptr));
    if (!v16)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v8);
    }
  }
  v17 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v18 = v7->_groupIdentifier.m_ptr;
  v7->_groupIdentifier.m_ptr = v17;
  if (v18)
    CFRelease(v18);
  if (!-[WebAVContentKeyGroup loggerPtr](v7, "loggerPtr"))
    return v7;
  if (!-[WebAVContentKeyGroup logChannel](v7, "logChannel"))
    return v7;
  v19 = -[WebAVContentKeyGroup loggerPtr](v7, "loggerPtr");
  v20 = -[WebAVContentKeyGroup logChannel](v7, "logChannel");
  v62[0] = 0;
  v62[1] = 0;
  v62[2] = "-[WebAVContentKeyGroup initWithContentKeySession:dataSource:]";
  v62[3] = -[WebAVContentKeyGroup logIdentifier](v7, "logIdentifier");
  if (!*(_BYTE *)(v19 + 12) || !*(_BYTE *)v20 || *(unsigned __int8 *)(v20 + 16) < 3u)
    return v7;
  v61 = v7->_groupIdentifier.m_ptr;
  WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v62);
  WTF::String::String((WTF::String *)&v67, "groupIdentifier=");
  result = (WebAVContentKeyGroup *)MEMORY[0x19AEA5508](&v66, objc_msgSend(v61, "description"));
  if (v68)
  {
    v22 = *((_DWORD *)v68 + 1);
    if (v67)
      goto LABEL_22;
LABEL_110:
    v23 = 0;
    if (v66)
      goto LABEL_23;
LABEL_111:
    v24 = 0;
    goto LABEL_24;
  }
  v22 = 0;
  if (!v67)
    goto LABEL_110;
LABEL_22:
  v23 = *((_DWORD *)v67 + 1);
  if (!v66)
    goto LABEL_111;
LABEL_23:
  v24 = *((_DWORD *)v66 + 1);
LABEL_24:
  if ((v24 | v23) < 0)
    goto LABEL_114;
  v25 = __OFADD__(v23, v24);
  v26 = v23 + v24;
  v27 = v25;
  if (v22 < 0)
    goto LABEL_114;
  if (v27)
    goto LABEL_114;
  result = (WebAVContentKeyGroup *)(v22 + v26);
  if (__OFADD__(v22, v26))
    goto LABEL_114;
  if (v68 && (*((_BYTE *)v68 + 16) & 4) == 0)
  {
    v28 = 0;
    goto LABEL_38;
  }
  if (v67)
  {
    v29 = *((_DWORD *)v67 + 4);
    v28 = (v29 >> 2) & 1;
    if (v66 && (v29 & 4) != 0)
      goto LABEL_37;
  }
  else
  {
    if (v66)
    {
LABEL_37:
      v28 = (*((unsigned __int8 *)v66 + 16) >> 2) & 1;
      goto LABEL_38;
    }
    v28 = 1;
  }
LABEL_38:
  result = (WebAVContentKeyGroup *)WTF::tryMakeStringImplFromAdaptersInternal<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)result, v28, v68, (uint64_t)v67, (uint64_t)v66, &buf);
  v69 = (WTF::StringImpl *)buf;
  if ((_QWORD)buf)
  {
    v31 = v66;
    v66 = 0;
    if (v31)
    {
      if (*(_DWORD *)v31 == 2)
        WTF::StringImpl::destroy(v31, v30);
      else
        *(_DWORD *)v31 -= 2;
    }
    v32 = v67;
    v67 = 0;
    if (v32)
    {
      if (*(_DWORD *)v32 == 2)
        WTF::StringImpl::destroy(v32, v30);
      else
        *(_DWORD *)v32 -= 2;
    }
    v33 = v68;
    v68 = 0;
    if (v33)
    {
      if (*(_DWORD *)v33 == 2)
        WTF::StringImpl::destroy(v33, v30);
      else
        *(_DWORD *)v33 -= 2;
    }
    v34 = *(NSObject **)(v20 + 32);
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v35)
    {
      WTF::String::utf8();
      v37 = v64 ? (char *)v64 + 16 : 0;
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v37;
      _os_log_impl(&dword_1940B8000, v34, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
      v35 = (uint64_t)v64;
      v64 = 0;
      if (v35)
      {
        if (*(_DWORD *)v35 == 1)
          v35 = WTF::fastFree((WTF *)v35, v36);
        else
          --*(_DWORD *)v35;
      }
    }
    if (*(_BYTE *)v20 && *(unsigned __int8 *)(v20 + 16) >= 3u)
    {
      v38 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
      while (1)
      {
        v39 = *v38;
        if ((v39 & 1) != 0)
          break;
        v40 = __ldaxr(v38);
        if (v40 == v39)
        {
          if (!__stxr(v39 | 1, v38))
          {
            v41 = WTF::Logger::observers((WTF::Logger *)v35);
            v42 = *(unsigned int *)(v41 + 12);
            if ((_DWORD)v42)
            {
              v43 = *(uint64_t **)v41;
              v60 = *(_QWORD *)v41 + 8 * v42;
              do
              {
                v44 = *v43;
                LODWORD(buf) = 0;
                WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v62);
                v71 = 0;
                WTF::String::String((WTF::String *)&v72, "groupIdentifier=");
                v73 = 0;
                MEMORY[0x19AEA5508](v74, objc_msgSend(v61, "description"));
                v64 = 0;
                v65 = 0;
                v45 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x30);
                LODWORD(v65) = 3;
                v64 = v45;
                v46 = HIDWORD(v65);
                *((_DWORD *)v45 + 4 * HIDWORD(v65)) = buf;
                v47 = *((_QWORD *)&buf + 1);
                if (*((_QWORD *)&buf + 1))
                  **((_DWORD **)&buf + 1) += 2;
                *((_QWORD *)v45 + 2 * v46 + 1) = v47;
                *((_DWORD *)v45 + 4 * (v46 + 1)) = v71;
                v48 = v72;
                if (v72)
                  *(_DWORD *)v72 += 2;
                *((_QWORD *)v45 + 2 * (v46 + 1) + 1) = v48;
                *((_DWORD *)v45 + 4 * (v46 + 2)) = v73;
                v49 = v74[0];
                if (v74[0])
                  *(_DWORD *)v74[0] += 2;
                *((_QWORD *)v45 + 2 * (v46 + 2) + 1) = v49;
                HIDWORD(v65) = v46 + 3;
                (*(void (**)(uint64_t, uint64_t, uint64_t, WTF::Logger **))(*(_QWORD *)v44 + 16))(v44, v20, 3, &v64);
                v50 = v64;
                if (HIDWORD(v65))
                {
                  v51 = v20;
                  v52 = 16 * HIDWORD(v65);
                  v53 = (WTF::StringImpl **)((char *)v64 + 8);
                  do
                  {
                    v54 = *v53;
                    *v53 = 0;
                    if (v54)
                    {
                      if (*(_DWORD *)v54 == 2)
                        WTF::StringImpl::destroy(v54, (WTF::StringImpl *)v36);
                      else
                        *(_DWORD *)v54 -= 2;
                    }
                    v53 += 2;
                    v52 -= 16;
                  }
                  while (v52);
                  v50 = v64;
                  v20 = v51;
                }
                if (v50)
                {
                  v64 = 0;
                  LODWORD(v65) = 0;
                  WTF::fastFree(v50, v36);
                }
                v55 = v74[0];
                v74[0] = 0;
                if (v55)
                {
                  if (*(_DWORD *)v55 == 2)
                    WTF::StringImpl::destroy(v55, (WTF::StringImpl *)v36);
                  else
                    *(_DWORD *)v55 -= 2;
                }
                v56 = v72;
                v72 = 0;
                if (v56)
                {
                  if (*(_DWORD *)v56 == 2)
                    WTF::StringImpl::destroy(v56, (WTF::StringImpl *)v36);
                  else
                    *(_DWORD *)v56 -= 2;
                }
                v57 = (WTF::StringImpl *)*((_QWORD *)&buf + 1);
                *((_QWORD *)&buf + 1) = 0;
                if (v57)
                {
                  if (*(_DWORD *)v57 == 2)
                    WTF::StringImpl::destroy(v57, (WTF::StringImpl *)v36);
                  else
                    *(_DWORD *)v57 -= 2;
                }
                ++v43;
              }
              while (v43 != (uint64_t *)v60);
            }
            v58 = __ldxr(v38);
            if (v58 == 1)
            {
              if (!__stlxr(0, v38))
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
    v59 = v69;
    v69 = 0;
    if (v59)
    {
      if (*(_DWORD *)v59 == 2)
        WTF::StringImpl::destroy(v59, (WTF::StringImpl *)v36);
      else
        *(_DWORD *)v59 -= 2;
    }
    return v7;
  }
LABEL_114:
  __break(0xC471u);
  return result;
}

- (NSData)contentProtectionSessionIdentifier
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  v3[1] = 0;
  objc_msgSend(self->_groupIdentifier.m_ptr, "getUUIDBytes:", v3);
  return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v3, 16);
}

- (BOOL)associateContentKeyRequest:(id)a3
{
  _BYTE *v5;
  $F9635BD25436628440684A9CD771B596 *v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  BOOL v11;
  int v12;
  BOOL v13;
  int v14;
  unsigned int v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  NSObject *var4;
  uint64_t v21;
  void *v22;
  char *v23;
  unsigned __int8 *v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  WTF::Logger *v31;
  uint64_t v32;
  uint64_t v33;
  WTF::StringImpl *v34;
  WTF::StringImpl *v35;
  WTF::Logger *v36;
  id v37;
  uint64_t v38;
  WTF::StringImpl **v39;
  WTF::StringImpl *v40;
  WTF::StringImpl *v41;
  WTF::StringImpl *v42;
  WTF::StringImpl *v43;
  int v44;
  WTF::StringImpl *v45;
  int *v47;
  uint64_t v48;
  _QWORD v49[4];
  WTF::Logger *v50;
  uint64_t v51;
  WTF::StringImpl *v52;
  WTF::StringImpl *v53;
  WTF::StringImpl *v54;
  WTF::StringImpl *v55;
  __int128 buf;
  int v57;
  WTF::StringImpl *v58;
  int v59;
  WTF::StringImpl *v60[3];

  v60[1] = *(WTF::StringImpl **)MEMORY[0x1E0C80C00];
  if (-[WebAVContentKeyGroup loggerPtr](self, "loggerPtr"))
  {
    if (-[WebAVContentKeyGroup logChannel](self, "logChannel"))
    {
      v5 = -[WebAVContentKeyGroup loggerPtr](self, "loggerPtr");
      v6 = -[WebAVContentKeyGroup logChannel](self, "logChannel");
      v49[0] = 0;
      v49[1] = 0;
      v49[2] = "-[WebAVContentKeyGroup associateContentKeyRequest:]";
      v49[3] = -[WebAVContentKeyGroup logIdentifier](self, "logIdentifier");
      if (v5[12])
      {
        if (v6->var0 && v6->var2 >= 3u)
        {
          WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v49);
          WTF::String::String((WTF::String *)&v53, "contentKeyRequest=");
          LOBYTE(v7) = MEMORY[0x19AEA5508](&v52, objc_msgSend(a3, "description"));
          if (v54)
          {
            v8 = *((_DWORD *)v54 + 1);
            if (v53)
              goto LABEL_8;
          }
          else
          {
            v8 = 0;
            if (v53)
            {
LABEL_8:
              v9 = *((_DWORD *)v53 + 1);
              if (v52)
              {
LABEL_9:
                v10 = *((_DWORD *)v52 + 1);
LABEL_10:
                if ((v10 | v9) < 0)
                  goto LABEL_100;
                v11 = __OFADD__(v9, v10);
                v12 = v9 + v10;
                v13 = v11;
                if (v8 < 0)
                  goto LABEL_100;
                if (v13)
                  goto LABEL_100;
                v7 = (v8 + v12);
                if (__OFADD__(v8, v12))
                  goto LABEL_100;
                if (v54 && (*((_BYTE *)v54 + 16) & 4) == 0)
                {
                  v14 = 0;
                  goto LABEL_24;
                }
                if (v53)
                {
                  v15 = *((_DWORD *)v53 + 4);
                  v14 = (v15 >> 2) & 1;
                  if (v52 && (v15 & 4) != 0)
                    goto LABEL_23;
                }
                else
                {
                  if (v52)
                  {
LABEL_23:
                    v14 = (*((unsigned __int8 *)v52 + 16) >> 2) & 1;
                    goto LABEL_24;
                  }
                  v14 = 1;
                }
LABEL_24:
                LOBYTE(v7) = WTF::tryMakeStringImplFromAdaptersInternal<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>(v7, v14, v54, (uint64_t)v53, (uint64_t)v52, &buf);
                v55 = (WTF::StringImpl *)buf;
                if ((_QWORD)buf)
                {
                  v17 = v52;
                  v52 = 0;
                  if (v17)
                  {
                    if (*(_DWORD *)v17 == 2)
                      WTF::StringImpl::destroy(v17, v16);
                    else
                      *(_DWORD *)v17 -= 2;
                  }
                  v18 = v53;
                  v53 = 0;
                  if (v18)
                  {
                    if (*(_DWORD *)v18 == 2)
                      WTF::StringImpl::destroy(v18, v16);
                    else
                      *(_DWORD *)v18 -= 2;
                  }
                  v19 = v54;
                  v54 = 0;
                  if (v19)
                  {
                    if (*(_DWORD *)v19 == 2)
                      WTF::StringImpl::destroy(v19, v16);
                    else
                      *(_DWORD *)v19 -= 2;
                  }
                  var4 = v6->var4;
                  v21 = os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
                  if ((_DWORD)v21)
                  {
                    WTF::String::utf8();
                    v23 = v50 ? (char *)v50 + 16 : 0;
                    LODWORD(buf) = 136446210;
                    *(_QWORD *)((char *)&buf + 4) = v23;
                    _os_log_impl(&dword_1940B8000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
                    v21 = (uint64_t)v50;
                    v50 = 0;
                    if (v21)
                    {
                      if (*(_DWORD *)v21 == 1)
                        v21 = WTF::fastFree((WTF *)v21, v22);
                      else
                        --*(_DWORD *)v21;
                    }
                  }
                  if (v6->var0 && v6->var2 >= 3u)
                  {
                    v24 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
                    while (1)
                    {
                      v25 = *v24;
                      if ((v25 & 1) != 0)
                        break;
                      v26 = __ldaxr(v24);
                      if (v26 == v25)
                      {
                        if (!__stxr(v25 | 1, v24))
                        {
                          v27 = WTF::Logger::observers((WTF::Logger *)v21);
                          v28 = *(unsigned int *)(v27 + 12);
                          if ((_DWORD)v28)
                          {
                            v29 = *(uint64_t **)v27;
                            v47 = &v57;
                            v48 = *(_QWORD *)v27 + 8 * v28;
                            do
                            {
                              v30 = *v29;
                              LODWORD(buf) = 0;
                              WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v49);
                              v57 = 0;
                              WTF::String::String((WTF::String *)&v58, "contentKeyRequest=");
                              v59 = 0;
                              MEMORY[0x19AEA5508](v60, objc_msgSend(a3, "description", v47));
                              v50 = 0;
                              v51 = 0;
                              v31 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x30);
                              LODWORD(v51) = 3;
                              v50 = v31;
                              v32 = HIDWORD(v51);
                              *((_DWORD *)v31 + 4 * HIDWORD(v51)) = buf;
                              v33 = *((_QWORD *)&buf + 1);
                              if (*((_QWORD *)&buf + 1))
                                **((_DWORD **)&buf + 1) += 2;
                              *((_QWORD *)v31 + 2 * v32 + 1) = v33;
                              *((_DWORD *)v31 + 4 * (v32 + 1)) = v57;
                              v34 = v58;
                              if (v58)
                                *(_DWORD *)v58 += 2;
                              *((_QWORD *)v31 + 2 * (v32 + 1) + 1) = v34;
                              *((_DWORD *)v31 + 4 * (v32 + 2)) = v59;
                              v35 = v60[0];
                              if (v60[0])
                                *(_DWORD *)v60[0] += 2;
                              *((_QWORD *)v31 + 2 * (v32 + 2) + 1) = v35;
                              HIDWORD(v51) = v32 + 3;
                              (*(void (**)(uint64_t, $F9635BD25436628440684A9CD771B596 *, uint64_t, WTF::Logger **))(*(_QWORD *)v30 + 16))(v30, v6, 3, &v50);
                              v36 = v50;
                              if (HIDWORD(v51))
                              {
                                v37 = a3;
                                v38 = 16 * HIDWORD(v51);
                                v39 = (WTF::StringImpl **)((char *)v50 + 8);
                                do
                                {
                                  v40 = *v39;
                                  *v39 = 0;
                                  if (v40)
                                  {
                                    if (*(_DWORD *)v40 == 2)
                                      WTF::StringImpl::destroy(v40, (WTF::StringImpl *)v22);
                                    else
                                      *(_DWORD *)v40 -= 2;
                                  }
                                  v39 += 2;
                                  v38 -= 16;
                                }
                                while (v38);
                                v36 = v50;
                                a3 = v37;
                              }
                              if (v36)
                              {
                                v50 = 0;
                                LODWORD(v51) = 0;
                                WTF::fastFree(v36, v22);
                              }
                              v41 = v60[0];
                              v60[0] = 0;
                              if (v41)
                              {
                                if (*(_DWORD *)v41 == 2)
                                  WTF::StringImpl::destroy(v41, (WTF::StringImpl *)v22);
                                else
                                  *(_DWORD *)v41 -= 2;
                              }
                              v42 = v58;
                              v58 = 0;
                              if (v42)
                              {
                                if (*(_DWORD *)v42 == 2)
                                  WTF::StringImpl::destroy(v42, (WTF::StringImpl *)v22);
                                else
                                  *(_DWORD *)v42 -= 2;
                              }
                              v43 = (WTF::StringImpl *)*((_QWORD *)&buf + 1);
                              *((_QWORD *)&buf + 1) = 0;
                              if (v43)
                              {
                                if (*(_DWORD *)v43 == 2)
                                  WTF::StringImpl::destroy(v43, (WTF::StringImpl *)v22);
                                else
                                  *(_DWORD *)v43 -= 2;
                              }
                              ++v29;
                            }
                            while (v29 != (uint64_t *)v48);
                          }
                          v44 = __ldxr(v24);
                          if (v44 == 1)
                          {
                            if (!__stlxr(0, v24))
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
                  v45 = v55;
                  v55 = 0;
                  if (v45)
                  {
                    if (*(_DWORD *)v45 == 2)
                      WTF::StringImpl::destroy(v45, (WTF::StringImpl *)v22);
                    else
                      *(_DWORD *)v45 -= 2;
                  }
                  goto LABEL_89;
                }
LABEL_100:
                __break(0xC471u);
                return v7;
              }
LABEL_97:
              v10 = 0;
              goto LABEL_10;
            }
          }
          v9 = 0;
          if (v52)
            goto LABEL_9;
          goto LABEL_97;
        }
      }
    }
  }
LABEL_89:
  LOBYTE(v7) = 1;
  return v7;
}

- (void)expire
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v4;
  $F9635BD25436628440684A9CD771B596 *v5;
  _BYTE *v6;
  $F9635BD25436628440684A9CD771B596 *v7;
  int v8;
  int v9;
  int v10;
  BOOL v11;
  int v12;
  BOOL v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  NSObject *var4;
  uint64_t v22;
  void *v23;
  char *v24;
  unsigned __int8 *v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  WTF::Logger *v33;
  uint64_t v34;
  uint64_t v35;
  WTF::StringImpl *v36;
  WTF::StringImpl *v37;
  WTF::Logger *v38;
  uint64_t v39;
  WTF::StringImpl **v40;
  WTF::StringImpl *v41;
  WTF::StringImpl *v42;
  WTF::StringImpl *v43;
  WTF::StringImpl *v44;
  int v45;
  int v46;
  void *v47;
  id *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  int *v52;
  WTF::String *v53;
  _QWORD v54[4];
  WTF *v55;
  int v56;
  unsigned int v57;
  WTF::Logger *v58;
  uint64_t v59;
  WTF::StringImpl *v60;
  WTF::StringImpl *v61;
  WTF::StringImpl *v62;
  WTF::StringImpl *v63;
  __int128 buf;
  int v65;
  WTF::StringImpl *v66;
  int v67;
  WTF::StringImpl *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  m_ptr = self->_dataSource.m_impl.m_ptr;
  if (!m_ptr)
    return;
  v4 = *((_QWORD *)m_ptr + 1);
  if (!v4)
    return;
  (*(void (**)(WTF **__return_ptr))(*(_QWORD *)v4 + 16))(&v55);
  v5 = -[WebAVContentKeyGroup loggerPtr](self, "loggerPtr");
  if (v5)
  {
    v5 = -[WebAVContentKeyGroup logChannel](self, "logChannel");
    if (v5)
    {
      v6 = -[WebAVContentKeyGroup loggerPtr](self, "loggerPtr");
      v7 = -[WebAVContentKeyGroup logChannel](self, "logChannel");
      v5 = -[WebAVContentKeyGroup logIdentifier](self, "logIdentifier");
      v54[0] = 0;
      v54[1] = 0;
      v54[2] = "-[WebAVContentKeyGroup expire]";
      v54[3] = v5;
      if (v6[12])
      {
        if (v7->var0 && v7->var2 >= 3u)
        {
          v53 = (WTF::String *)v57;
          WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v54);
          WTF::String::String((WTF::String *)&v61, "keys=");
          WTF::String::number(v53);
          if (v62)
          {
            v8 = *((_DWORD *)v62 + 1);
            if (v61)
              goto LABEL_10;
          }
          else
          {
            v8 = 0;
            if (v61)
            {
LABEL_10:
              v9 = *((_DWORD *)v61 + 1);
              if (v60)
              {
LABEL_11:
                v10 = *((_DWORD *)v60 + 1);
LABEL_12:
                if ((v10 | v9) < 0)
                  goto LABEL_115;
                v11 = __OFADD__(v9, v10);
                v12 = v9 + v10;
                v13 = v11;
                if (v8 < 0)
                  goto LABEL_115;
                if (v13)
                  goto LABEL_115;
                v14 = (v8 + v12);
                if (__OFADD__(v8, v12))
                  goto LABEL_115;
                if (v62 && (*((_BYTE *)v62 + 16) & 4) == 0)
                {
                  v15 = 0;
                  goto LABEL_26;
                }
                if (v61)
                {
                  v16 = *((_DWORD *)v61 + 4);
                  v15 = (v16 >> 2) & 1;
                  if (v60 && (v16 & 4) != 0)
                    goto LABEL_25;
                }
                else
                {
                  if (v60)
                  {
LABEL_25:
                    v15 = (*((unsigned __int8 *)v60 + 16) >> 2) & 1;
                    goto LABEL_26;
                  }
                  v15 = 1;
                }
LABEL_26:
                WTF::tryMakeStringImplFromAdaptersInternal<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>(v14, v15, v62, (uint64_t)v61, (uint64_t)v60, &buf);
                v63 = (WTF::StringImpl *)buf;
                if ((_QWORD)buf)
                {
                  v18 = v60;
                  v60 = 0;
                  if (v18)
                  {
                    if (*(_DWORD *)v18 == 2)
                      WTF::StringImpl::destroy(v18, v17);
                    else
                      *(_DWORD *)v18 -= 2;
                  }
                  v19 = v61;
                  v61 = 0;
                  if (v19)
                  {
                    if (*(_DWORD *)v19 == 2)
                      WTF::StringImpl::destroy(v19, v17);
                    else
                      *(_DWORD *)v19 -= 2;
                  }
                  v20 = v62;
                  v62 = 0;
                  if (v20)
                  {
                    if (*(_DWORD *)v20 == 2)
                      WTF::StringImpl::destroy(v20, v17);
                    else
                      *(_DWORD *)v20 -= 2;
                  }
                  var4 = v7->var4;
                  v22 = os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
                  if ((_DWORD)v22)
                  {
                    WTF::String::utf8();
                    v24 = v58 ? (char *)v58 + 16 : 0;
                    LODWORD(buf) = 136446210;
                    *(_QWORD *)((char *)&buf + 4) = v24;
                    _os_log_impl(&dword_1940B8000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
                    v22 = (uint64_t)v58;
                    v58 = 0;
                    if (v22)
                    {
                      if (*(_DWORD *)v22 == 1)
                        v22 = WTF::fastFree((WTF *)v22, v23);
                      else
                        --*(_DWORD *)v22;
                    }
                  }
                  if (v7->var0 && v7->var2 >= 3u)
                  {
                    v25 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
                    while (1)
                    {
                      v26 = *v25;
                      if ((v26 & 1) != 0)
                        break;
                      v27 = __ldaxr(v25);
                      if (v27 == v26)
                      {
                        if (!__stxr(v26 | 1, v25))
                        {
                          v28 = WTF::Logger::observers((WTF::Logger *)v22);
                          v29 = *(unsigned int *)(v28 + 12);
                          if ((_DWORD)v29)
                          {
                            v30 = *(uint64_t **)v28;
                            v31 = *(_QWORD *)v28 + 8 * v29;
                            v52 = &v65;
                            do
                            {
                              v32 = *v30;
                              LODWORD(buf) = 0;
                              WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v54);
                              v65 = 0;
                              WTF::String::String((WTF::String *)&v66, "keys=");
                              v67 = 0;
                              WTF::String::number(v53);
                              v58 = 0;
                              v59 = 0;
                              v33 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x30);
                              LODWORD(v59) = 3;
                              v58 = v33;
                              v34 = HIDWORD(v59);
                              *((_DWORD *)v33 + 4 * HIDWORD(v59)) = buf;
                              v35 = *((_QWORD *)&buf + 1);
                              if (*((_QWORD *)&buf + 1))
                                **((_DWORD **)&buf + 1) += 2;
                              *((_QWORD *)v33 + 2 * v34 + 1) = v35;
                              *((_DWORD *)v33 + 4 * (v34 + 1)) = v65;
                              v36 = v66;
                              if (v66)
                                *(_DWORD *)v66 += 2;
                              *((_QWORD *)v33 + 2 * (v34 + 1) + 1) = v36;
                              *((_DWORD *)v33 + 4 * (v34 + 2)) = v67;
                              v37 = v68;
                              if (v68)
                                *(_DWORD *)v68 += 2;
                              *((_QWORD *)v33 + 2 * (v34 + 2) + 1) = v37;
                              HIDWORD(v59) = v34 + 3;
                              (*(void (**)(uint64_t, $F9635BD25436628440684A9CD771B596 *, uint64_t, WTF::Logger **))(*(_QWORD *)v32 + 16))(v32, v7, 3, &v58);
                              v38 = v58;
                              if (HIDWORD(v59))
                              {
                                v39 = 16 * HIDWORD(v59);
                                v40 = (WTF::StringImpl **)((char *)v58 + 8);
                                do
                                {
                                  v41 = *v40;
                                  *v40 = 0;
                                  if (v41)
                                  {
                                    if (*(_DWORD *)v41 == 2)
                                      WTF::StringImpl::destroy(v41, (WTF::StringImpl *)v23);
                                    else
                                      *(_DWORD *)v41 -= 2;
                                  }
                                  v40 += 2;
                                  v39 -= 16;
                                }
                                while (v39);
                                v38 = v58;
                              }
                              if (v38)
                              {
                                v58 = 0;
                                LODWORD(v59) = 0;
                                WTF::fastFree(v38, v23);
                              }
                              v42 = v68;
                              v68 = 0;
                              if (v42)
                              {
                                if (*(_DWORD *)v42 == 2)
                                  WTF::StringImpl::destroy(v42, (WTF::StringImpl *)v23);
                                else
                                  *(_DWORD *)v42 -= 2;
                              }
                              v43 = v66;
                              v66 = 0;
                              if (v43)
                              {
                                if (*(_DWORD *)v43 == 2)
                                  WTF::StringImpl::destroy(v43, (WTF::StringImpl *)v23);
                                else
                                  *(_DWORD *)v43 -= 2;
                              }
                              v44 = (WTF::StringImpl *)*((_QWORD *)&buf + 1);
                              *((_QWORD *)&buf + 1) = 0;
                              if (v44)
                              {
                                if (*(_DWORD *)v44 == 2)
                                  WTF::StringImpl::destroy(v44, (WTF::StringImpl *)v23);
                                else
                                  *(_DWORD *)v44 -= 2;
                              }
                              ++v30;
                            }
                            while (v30 != (uint64_t *)v31);
                          }
                          v45 = __ldxr(v25);
                          if (v45 == 1)
                          {
                            if (!__stlxr(0, v25))
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
                  v5 = ($F9635BD25436628440684A9CD771B596 *)v63;
                  v63 = 0;
                  if (v5)
                  {
                    if (*(_DWORD *)&v5->var0 == 2)
                      v5 = ($F9635BD25436628440684A9CD771B596 *)WTF::StringImpl::destroy((WTF::StringImpl *)v5, (WTF::StringImpl *)v23);
                    else
                      *(_DWORD *)&v5->var0 -= 2;
                  }
                  goto LABEL_91;
                }
LABEL_115:
                __break(0xC471u);
                return;
              }
LABEL_112:
              v10 = 0;
              goto LABEL_12;
            }
          }
          v9 = 0;
          if (v60)
            goto LABEL_11;
          goto LABEL_112;
        }
      }
    }
  }
LABEL_91:
  v46 = objc_msgSend((id)PAL::getAVContentKeyClass[0]((PAL *)v5), "instancesRespondToSelector:", sel_revoke);
  v48 = (id *)v55;
  if (v46 && v57)
  {
    v49 = 8 * v57;
    do
    {
      objc_msgSend(*v48++, "revoke", v52);
      v49 -= 8;
    }
    while (v49);
    v48 = (id *)v55;
  }
  if (v57)
  {
    v50 = 8 * v57;
    do
    {
      v51 = *v48;
      *v48 = 0;
      if (v51)
        CFRelease(v51);
      ++v48;
      v50 -= 8;
    }
    while (v50);
    v48 = (id *)v55;
  }
  if (v48)
  {
    v55 = 0;
    v56 = 0;
    WTF::fastFree((WTF *)v48, v47);
  }
}

- (void)processContentKeyRequestWithIdentifier:(id)a3 initializationData:(id)a4 options:(id)a5
{
  _BYTE *v9;
  $F9635BD25436628440684A9CD771B596 *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  NSObject *var4;
  uint64_t v19;
  void *v20;
  char *v21;
  unsigned __int8 *v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  WTF::Logger *v29;
  uint64_t v30;
  uint64_t v31;
  WTF::StringImpl *v32;
  WTF::StringImpl *v33;
  WTF::StringImpl *v34;
  WTF::StringImpl *v35;
  uint64_t v36;
  WTF::Logger *v37;
  uint64_t v38;
  WTF::StringImpl **v39;
  WTF::StringImpl *v40;
  WTF::StringImpl *v41;
  WTF::StringImpl *v42;
  WTF::StringImpl *v43;
  WTF::StringImpl *v44;
  WTF::StringImpl *v45;
  WTF::StringImpl *v46;
  int v47;
  WTF::StringImpl *v48;
  uint64_t v49;
  _QWORD v50[4];
  WTF::Logger *v51;
  uint64_t v52;
  WTF::StringImpl *v53;
  WTF::StringImpl *v54;
  WTF::StringImpl *v55;
  WTF::StringImpl *v56;
  WTF::StringImpl *v57;
  WTF::StringImpl *v58;
  WTF::StringImpl *v59;
  WTF::StringImpl *v60;
  WTF::StringImpl *v61;
  WTF::StringImpl *v62;
  WTF::StringImpl *v63;
  __int128 buf;
  int v65;
  WTF::StringImpl *v66;
  int v67;
  WTF::StringImpl *v68;
  int v69;
  WTF::StringImpl *v70;
  int v71;
  WTF::StringImpl *v72;
  int v73;
  _QWORD v74[3];

  v74[1] = *MEMORY[0x1E0C80C00];
  if (!-[WebAVContentKeyGroup loggerPtr](self, "loggerPtr")
    || !-[WebAVContentKeyGroup logChannel](self, "logChannel")
    || (v9 = -[WebAVContentKeyGroup loggerPtr](self, "loggerPtr"),
        v10 = -[WebAVContentKeyGroup logChannel](self, "logChannel"),
        v50[0] = 0,
        v50[1] = 0,
        v50[2] = "-[WebAVContentKeyGroup processContentKeyRequestWithIdentifier:initializationData:options:]",
        v50[3] = -[WebAVContentKeyGroup logIdentifier](self, "logIdentifier"),
        !v9[12])
    || !v10->var0
    || v10->var2 < 3u)
  {
LABEL_104:
    objc_msgSend(objc_loadWeak(&self->_contentKeySession.m_weakReference), "processContentKeyRequestWithIdentifier:initializationData:options:", a3, a4, a5);
    return;
  }
  WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v50);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    MEMORY[0x19AEA5508](&v57, objc_msgSend(a3, "description"));
  else
    WTF::LogArgument<void const*>::toString();
  WTF::String::String((WTF::String *)&v56, ", initializationData=");
  MEMORY[0x19AEA5508](&v55, objc_msgSend(a4, "description"));
  WTF::String::String((WTF::String *)&v54, ", options=");
  MEMORY[0x19AEA5508](&v53, objc_msgSend(a5, "description"));
  v51 = v57;
  v63 = v56;
  *(_QWORD *)&buf = v58;
  v62 = v55;
  v60 = v53;
  v61 = v54;
  WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)&buf, (uint64_t *)&v51, (uint64_t *)&v63, (uint64_t *)&v62, (uint64_t *)&v61, (uint64_t *)&v60, &v59);
  if (v59)
  {
    v12 = v53;
    v53 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
        WTF::StringImpl::destroy(v12, v11);
      else
        *(_DWORD *)v12 -= 2;
    }
    v13 = v54;
    v54 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
        WTF::StringImpl::destroy(v13, v11);
      else
        *(_DWORD *)v13 -= 2;
    }
    v14 = v55;
    v55 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
        WTF::StringImpl::destroy(v14, v11);
      else
        *(_DWORD *)v14 -= 2;
    }
    v15 = v56;
    v56 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
        WTF::StringImpl::destroy(v15, v11);
      else
        *(_DWORD *)v15 -= 2;
    }
    v16 = v57;
    v57 = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2)
        WTF::StringImpl::destroy(v16, v11);
      else
        *(_DWORD *)v16 -= 2;
    }
    v17 = v58;
    v58 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2)
        WTF::StringImpl::destroy(v17, v11);
      else
        *(_DWORD *)v17 -= 2;
    }
    var4 = v10->var4;
    v19 = os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v19)
    {
      WTF::String::utf8();
      v21 = v51 ? (char *)v51 + 16 : 0;
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v21;
      _os_log_impl(&dword_1940B8000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
      v19 = (uint64_t)v51;
      v51 = 0;
      if (v19)
      {
        if (*(_DWORD *)v19 == 1)
          v19 = WTF::fastFree((WTF *)v19, v20);
        else
          --*(_DWORD *)v19;
      }
    }
    if (v10->var0 && v10->var2 >= 3u)
    {
      v22 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
      while (1)
      {
        v23 = *v22;
        if ((v23 & 1) != 0)
          break;
        v24 = __ldaxr(v22);
        if (v24 == v23)
        {
          if (!__stxr(v23 | 1, v22))
          {
            v25 = WTF::Logger::observers((WTF::Logger *)v19);
            v26 = *(unsigned int *)(v25 + 12);
            if ((_DWORD)v26)
            {
              v27 = *(uint64_t **)v25;
              v49 = *(_QWORD *)v25 + 8 * v26;
              do
              {
                v28 = *v27;
                LODWORD(buf) = 0;
                WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v50);
                v65 = 0;
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  MEMORY[0x19AEA5508](&v66, objc_msgSend(a3, "description"));
                else
                  WTF::LogArgument<void const*>::toString();
                v67 = 0;
                WTF::String::String((WTF::String *)&v68, ", initializationData=");
                v69 = 0;
                MEMORY[0x19AEA5508](&v70, objc_msgSend(a4, "description"));
                v71 = 0;
                WTF::String::String((WTF::String *)&v72, ", options=");
                v73 = 0;
                MEMORY[0x19AEA5508](v74, objc_msgSend(a5, "description"));
                v51 = 0;
                v52 = 0;
                v29 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x60);
                LODWORD(v52) = 6;
                v51 = v29;
                v30 = HIDWORD(v52);
                *((_DWORD *)v29 + 4 * HIDWORD(v52)) = buf;
                v31 = *((_QWORD *)&buf + 1);
                if (*((_QWORD *)&buf + 1))
                  **((_DWORD **)&buf + 1) += 2;
                *((_QWORD *)v29 + 2 * v30 + 1) = v31;
                *((_DWORD *)v29 + 4 * (v30 + 1)) = v65;
                v32 = v66;
                if (v66)
                  *(_DWORD *)v66 += 2;
                *((_QWORD *)v29 + 2 * (v30 + 1) + 1) = v32;
                *((_DWORD *)v29 + 4 * (v30 + 2)) = v67;
                v33 = v68;
                if (v68)
                  *(_DWORD *)v68 += 2;
                *((_QWORD *)v29 + 2 * (v30 + 2) + 1) = v33;
                *((_DWORD *)v29 + 4 * (v30 + 3)) = v69;
                v34 = v70;
                if (v70)
                  *(_DWORD *)v70 += 2;
                *((_QWORD *)v29 + 2 * (v30 + 3) + 1) = v34;
                *((_DWORD *)v29 + 4 * (v30 + 4)) = v71;
                v35 = v72;
                if (v72)
                  *(_DWORD *)v72 += 2;
                *((_QWORD *)v29 + 2 * (v30 + 4) + 1) = v35;
                *((_DWORD *)v29 + 4 * (v30 + 5)) = v73;
                v36 = v74[0];
                if (v74[0])
                  *(_DWORD *)v74[0] += 2;
                *((_QWORD *)v29 + 2 * (v30 + 5) + 1) = v36;
                HIDWORD(v52) = v30 + 6;
                (*(void (**)(uint64_t, $F9635BD25436628440684A9CD771B596 *, uint64_t, WTF::Logger **))(*(_QWORD *)v28 + 16))(v28, v10, 3, &v51);
                v37 = v51;
                if (HIDWORD(v52))
                {
                  v38 = 16 * HIDWORD(v52);
                  v39 = (WTF::StringImpl **)((char *)v51 + 8);
                  do
                  {
                    v40 = *v39;
                    *v39 = 0;
                    if (v40)
                    {
                      if (*(_DWORD *)v40 == 2)
                        WTF::StringImpl::destroy(v40, (WTF::StringImpl *)v20);
                      else
                        *(_DWORD *)v40 -= 2;
                    }
                    v39 += 2;
                    v38 -= 16;
                  }
                  while (v38);
                  v37 = v51;
                }
                if (v37)
                {
                  v51 = 0;
                  LODWORD(v52) = 0;
                  WTF::fastFree(v37, v20);
                }
                v41 = (WTF::StringImpl *)v74[0];
                v74[0] = 0;
                if (v41)
                {
                  if (*(_DWORD *)v41 == 2)
                    WTF::StringImpl::destroy(v41, (WTF::StringImpl *)v20);
                  else
                    *(_DWORD *)v41 -= 2;
                }
                v42 = v72;
                v72 = 0;
                if (v42)
                {
                  if (*(_DWORD *)v42 == 2)
                    WTF::StringImpl::destroy(v42, (WTF::StringImpl *)v20);
                  else
                    *(_DWORD *)v42 -= 2;
                }
                v43 = v70;
                v70 = 0;
                if (v43)
                {
                  if (*(_DWORD *)v43 == 2)
                    WTF::StringImpl::destroy(v43, (WTF::StringImpl *)v20);
                  else
                    *(_DWORD *)v43 -= 2;
                }
                v44 = v68;
                v68 = 0;
                if (v44)
                {
                  if (*(_DWORD *)v44 == 2)
                    WTF::StringImpl::destroy(v44, (WTF::StringImpl *)v20);
                  else
                    *(_DWORD *)v44 -= 2;
                }
                v45 = v66;
                v66 = 0;
                if (v45)
                {
                  if (*(_DWORD *)v45 == 2)
                    WTF::StringImpl::destroy(v45, (WTF::StringImpl *)v20);
                  else
                    *(_DWORD *)v45 -= 2;
                }
                v46 = (WTF::StringImpl *)*((_QWORD *)&buf + 1);
                *((_QWORD *)&buf + 1) = 0;
                if (v46)
                {
                  if (*(_DWORD *)v46 == 2)
                    WTF::StringImpl::destroy(v46, (WTF::StringImpl *)v20);
                  else
                    *(_DWORD *)v46 -= 2;
                }
                ++v27;
              }
              while (v27 != (uint64_t *)v49);
            }
            v47 = __ldxr(v22);
            if (v47 == 1)
            {
              if (!__stlxr(0, v22))
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
    v48 = v59;
    v59 = 0;
    if (v48)
    {
      if (*(_DWORD *)v48 == 2)
        WTF::StringImpl::destroy(v48, (WTF::StringImpl *)v20);
      else
        *(_DWORD *)v48 -= 2;
    }
    goto LABEL_104;
  }
  __break(0xC471u);
}

- (void).cxx_destruct
{
  void *m_ptr;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;

  m_ptr = self->_groupIdentifier.m_ptr;
  self->_groupIdentifier.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = (unsigned int *)self->_dataSource.m_impl.m_ptr;
  self->_dataSource.m_impl.m_ptr = 0;
  if (v4)
  {
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      atomic_store(1u, v4);
      WTF::fastFree((WTF *)v4, (void *)a2);
    }
  }
  objc_destroyWeak(&self->_contentKeySession.m_weakReference);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (const)logIdentifier
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v3;

  m_ptr = self->_dataSource.m_impl.m_ptr;
  if (m_ptr && (v3 = *((_QWORD *)m_ptr + 1)) != 0)
    return (const void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  else
    return 0;
}

- (const)loggerPtr
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v3;

  m_ptr = self->_dataSource.m_impl.m_ptr;
  if (m_ptr && (v3 = *((_QWORD *)m_ptr + 1)) != 0)
    return (const void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 32))(v3);
  else
    return 0;
}

- ($F9635BD25436628440684A9CD771B596)logChannel
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v3;

  m_ptr = self->_dataSource.m_impl.m_ptr;
  if (m_ptr && (v3 = *((_QWORD *)m_ptr + 1)) != 0)
    return ($F9635BD25436628440684A9CD771B596 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 40))(v3);
  else
    return 0;
}

@end
