@implementation WebAVStreamDataParserListener

- (WebAVStreamDataParserListener)initWithParser:(id)a3 parent:(void *)a4
{
  WebAVStreamDataParserListener *v6;
  WebAVStreamDataParserListener *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebAVStreamDataParserListener;
  v6 = -[WebAVStreamDataParserListener init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_parent = a4;
    v6->_parser = (AVStreamDataParser *)a3;
    objc_msgSend(a3, "setDelegate:", v6);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[AVStreamDataParser setDelegate:](self->_parser, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WebAVStreamDataParserListener;
  -[WebAVStreamDataParserListener dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[AVStreamDataParser setDelegate:](self->_parser, "setDelegate:", 0);
  self->_parser = 0;
}

- (void)streamDataParser:(id)a3 didParseStreamDataAsAsset:(id)a4
{
  WebCore::SourceBufferParserAVFObjC::didParseStreamDataAsAsset((WebCore::SourceBufferParserAVFObjC *)self->_parent, a4);
}

- (void)streamDataParser:(id)a3 didParseStreamDataAsAsset:(id)a4 withDiscontinuity:(BOOL)a5
{
  WebCore::SourceBufferParserAVFObjC::didParseStreamDataAsAsset((WebCore::SourceBufferParserAVFObjC *)self->_parent, a4);
}

- (void)streamDataParser:(id)a3 didFailToParseStreamDataWithError:(id)a4
{
  _QWORD *parent;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  parent = self->_parent;
  v8 = a4;
  v5 = parent[15];
  if (v5)
  {
    v6 = parent[16];
    v7[0] = "SourceBufferParserAVFObjC";
    v7[1] = 26;
    v7[2] = "didFailToParseStreamDataWithError";
    v7[3] = v6;
    if (*(_BYTE *)(v5 + 12))
    {
      WTF::Logger::log<WTF::Logger::LogSiteIdentifier,NSError *>((uint64_t)&WebCore::LogMedia, 1u, (WTF::Logger::LogSiteIdentifier *)v7, &v8);
      a4 = v8;
    }
  }
  *((_DWORD *)parent + 27) = objc_msgSend(a4, "code", a3);
  *((_BYTE *)parent + 112) = 1;
}

- (void)streamDataParser:(id)a3 didProvideMediaData:(opaqueCMSampleBuffer *)a4 forTrackID:(int)a5 mediaType:(id)a6 flags:(unint64_t)a7
{
  char *parent;
  uint64_t v10;
  uint64_t v11;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  char *v22;
  unsigned __int8 *v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  WTF::StringImpl *v30;
  WTF::Logger *v31;
  uint64_t v32;
  uint64_t v33;
  WTF::StringImpl *v34;
  WTF::StringImpl *v35;
  WTF::StringImpl *v36;
  WTF::StringImpl *v37;
  WTF::Logger *v38;
  uint64_t v39;
  WTF::StringImpl **v40;
  WTF::StringImpl *v41;
  WTF::StringImpl *v42;
  WTF::StringImpl *v43;
  WTF::StringImpl *v44;
  WTF::StringImpl *v45;
  WTF::StringImpl *v46;
  int v47;
  WTF::StringImpl *v48;
  unsigned int *v49;
  unsigned int v50;
  WTF::StringImpl *v51;
  _QWORD *v52;
  WTF::StringImpl *v53;
  uint64_t v54;
  WTF::StringImpl *v55;
  uint64_t v56;
  WTF::StringImpl *v57;
  _QWORD v58[4];
  WTF::Logger *v59;
  uint64_t v60;
  WTF::StringImpl *v61;
  WTF::StringImpl *v62;
  WTF::StringImpl *v63;
  WTF::StringImpl *v64;
  WTF::StringImpl *v65;
  WTF::StringImpl *v66;
  WTF::StringImpl *v67;
  WTF::StringImpl *v68;
  __int128 buf;
  int v70;
  WTF::StringImpl *v71;
  int v72;
  WTF::StringImpl *v73;
  int v74;
  WTF::StringImpl *v75;
  int v76;
  WTF::StringImpl *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  parent = (char *)self->_parent;
  MEMORY[0x19AEA5508](&v57, a6, a3);
  v10 = *((_QWORD *)parent + 15);
  if (v10)
  {
    v11 = *((_QWORD *)parent + 16);
    v58[0] = "SourceBufferParserAVFObjC";
    v58[1] = 26;
    v58[2] = "didProvideMediaDataForTrackID";
    v58[3] = v11;
    if (*(_BYTE *)(v10 + 12))
    {
      if (WebCore::LogMedia && byte_1ECE7C490 >= 3u)
      {
        WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v58);
        WTF::String::String((WTF::String *)&v63, "trackID = ");
        WTF::String::number((WTF::String *)a5);
        WTF::String::String((WTF::String *)&v61, ", mediaType = ");
        v13 = v57;
        if (v57)
          *(_DWORD *)v57 += 2;
        v59 = v63;
        v68 = v62;
        *(_QWORD *)&buf = v64;
        v66 = v13;
        v67 = v61;
        WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)&buf, (uint64_t *)&v59, (uint64_t *)&v68, (uint64_t *)&v67, (uint64_t *)&v66, &v65);
        if (!v65)
        {
          __break(0xC471u);
          return;
        }
        if (v13)
        {
          if (*(_DWORD *)v13 == 2)
            WTF::StringImpl::destroy(v13, v14);
          else
            *(_DWORD *)v13 -= 2;
        }
        v15 = v61;
        v61 = 0;
        if (v15)
        {
          if (*(_DWORD *)v15 == 2)
            WTF::StringImpl::destroy(v15, v14);
          else
            *(_DWORD *)v15 -= 2;
        }
        v16 = v62;
        v62 = 0;
        if (v16)
        {
          if (*(_DWORD *)v16 == 2)
            WTF::StringImpl::destroy(v16, v14);
          else
            *(_DWORD *)v16 -= 2;
        }
        v17 = v63;
        v63 = 0;
        if (v17)
        {
          if (*(_DWORD *)v17 == 2)
            WTF::StringImpl::destroy(v17, v14);
          else
            *(_DWORD *)v17 -= 2;
        }
        v18 = v64;
        v64 = 0;
        if (v18)
        {
          if (*(_DWORD *)v18 == 2)
            WTF::StringImpl::destroy(v18, v14);
          else
            *(_DWORD *)v18 -= 2;
        }
        v19 = qword_1ECE7C4A0;
        v20 = os_log_type_enabled((os_log_t)qword_1ECE7C4A0, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v20)
        {
          WTF::String::utf8();
          v22 = v59 ? (char *)v59 + 16 : 0;
          LODWORD(buf) = 136446210;
          *(_QWORD *)((char *)&buf + 4) = v22;
          _os_log_impl(&dword_1940B8000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
          v20 = (uint64_t)v59;
          v59 = 0;
          if (v20)
          {
            if (*(_DWORD *)v20 == 1)
              v20 = WTF::fastFree((WTF *)v20, v21);
            else
              --*(_DWORD *)v20;
          }
        }
        if (WebCore::LogMedia && byte_1ECE7C490 >= 3u)
        {
          v23 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
          while (1)
          {
            v24 = *v23;
            if ((v24 & 1) != 0)
              break;
            v25 = __ldaxr(v23);
            if (v25 == v24)
            {
              if (!__stxr(v24 | 1, v23))
              {
                v26 = WTF::Logger::observers((WTF::Logger *)v20);
                v27 = *(unsigned int *)(v26 + 12);
                if ((_DWORD)v27)
                {
                  v28 = *(uint64_t **)v26;
                  v56 = *(_QWORD *)v26 + 8 * v27;
                  do
                  {
                    v29 = *v28;
                    LODWORD(buf) = 0;
                    WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v58);
                    v70 = 0;
                    WTF::String::String((WTF::String *)&v71, "trackID = ");
                    v72 = 0;
                    WTF::String::number((WTF::String *)a5);
                    v74 = 0;
                    WTF::String::String((WTF::String *)&v75, ", mediaType = ");
                    v76 = 0;
                    v30 = v57;
                    if (v57)
                      *(_DWORD *)v57 += 2;
                    v77 = v30;
                    v59 = 0;
                    v60 = 0;
                    v31 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x50);
                    LODWORD(v60) = 5;
                    v59 = v31;
                    v32 = HIDWORD(v60);
                    *((_DWORD *)v31 + 4 * HIDWORD(v60)) = buf;
                    v33 = *((_QWORD *)&buf + 1);
                    if (*((_QWORD *)&buf + 1))
                      **((_DWORD **)&buf + 1) += 2;
                    *((_QWORD *)v31 + 2 * v32 + 1) = v33;
                    *((_DWORD *)v31 + 4 * (v32 + 1)) = v70;
                    v34 = v71;
                    if (v71)
                      *(_DWORD *)v71 += 2;
                    *((_QWORD *)v31 + 2 * (v32 + 1) + 1) = v34;
                    *((_DWORD *)v31 + 4 * (v32 + 2)) = v72;
                    v35 = v73;
                    if (v73)
                      *(_DWORD *)v73 += 2;
                    *((_QWORD *)v31 + 2 * (v32 + 2) + 1) = v35;
                    *((_DWORD *)v31 + 4 * (v32 + 3)) = v74;
                    v36 = v75;
                    if (v75)
                      *(_DWORD *)v75 += 2;
                    *((_QWORD *)v31 + 2 * (v32 + 3) + 1) = v36;
                    *((_DWORD *)v31 + 4 * (v32 + 4)) = v76;
                    v37 = v77;
                    if (v77)
                      *(_DWORD *)v77 += 2;
                    *((_QWORD *)v31 + 2 * (v32 + 4) + 1) = v37;
                    HIDWORD(v60) = v32 + 5;
                    (*(void (**)(uint64_t, char *, uint64_t, WTF::Logger **))(*(_QWORD *)v29 + 16))(v29, &WebCore::LogMedia, 3, &v59);
                    v38 = v59;
                    if (HIDWORD(v60))
                    {
                      v39 = 16 * HIDWORD(v60);
                      v40 = (WTF::StringImpl **)((char *)v59 + 8);
                      do
                      {
                        v41 = *v40;
                        *v40 = 0;
                        if (v41)
                        {
                          if (*(_DWORD *)v41 == 2)
                            WTF::StringImpl::destroy(v41, (WTF::StringImpl *)v21);
                          else
                            *(_DWORD *)v41 -= 2;
                        }
                        v40 += 2;
                        v39 -= 16;
                      }
                      while (v39);
                      v38 = v59;
                    }
                    if (v38)
                    {
                      v59 = 0;
                      LODWORD(v60) = 0;
                      WTF::fastFree(v38, v21);
                    }
                    v42 = v77;
                    v77 = 0;
                    if (v42)
                    {
                      if (*(_DWORD *)v42 == 2)
                        WTF::StringImpl::destroy(v42, (WTF::StringImpl *)v21);
                      else
                        *(_DWORD *)v42 -= 2;
                    }
                    v43 = v75;
                    v75 = 0;
                    if (v43)
                    {
                      if (*(_DWORD *)v43 == 2)
                        WTF::StringImpl::destroy(v43, (WTF::StringImpl *)v21);
                      else
                        *(_DWORD *)v43 -= 2;
                    }
                    v44 = v73;
                    v73 = 0;
                    if (v44)
                    {
                      if (*(_DWORD *)v44 == 2)
                        WTF::StringImpl::destroy(v44, (WTF::StringImpl *)v21);
                      else
                        *(_DWORD *)v44 -= 2;
                    }
                    v45 = v71;
                    v71 = 0;
                    if (v45)
                    {
                      if (*(_DWORD *)v45 == 2)
                        WTF::StringImpl::destroy(v45, (WTF::StringImpl *)v21);
                      else
                        *(_DWORD *)v45 -= 2;
                    }
                    v46 = (WTF::StringImpl *)*((_QWORD *)&buf + 1);
                    *((_QWORD *)&buf + 1) = 0;
                    if (v46)
                    {
                      if (*(_DWORD *)v46 == 2)
                        WTF::StringImpl::destroy(v46, (WTF::StringImpl *)v21);
                      else
                        *(_DWORD *)v46 -= 2;
                    }
                    ++v28;
                  }
                  while (v28 != (uint64_t *)v56);
                }
                v47 = __ldxr(v23);
                if (v47 == 1)
                {
                  if (!__stlxr(0, v23))
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
        v48 = v65;
        v65 = 0;
        if (v48)
        {
          if (*(_DWORD *)v48 == 2)
            WTF::StringImpl::destroy(v48, (WTF::StringImpl *)v21);
          else
            *(_DWORD *)v48 -= 2;
        }
      }
    }
  }
  v49 = (unsigned int *)(parent + 8);
  do
    v50 = __ldaxr(v49);
  while (__stlxr(v50 + 1, v49));
  if (a4)
    CFRetain(a4);
  v51 = v57;
  if (v57)
    *(_DWORD *)v57 += 2;
  v52 = (_QWORD *)WTF::fastMalloc((WTF *)0x30);
  *v52 = off_1E320CE40;
  v52[1] = parent;
  v52[2] = parent;
  v52[3] = a4;
  v52[4] = a5;
  v52[5] = v51;
  v58[0] = v52;
  (*(void (**)(_QWORD, _QWORD *))(**((_QWORD **)parent + 2) + 16))(*((_QWORD *)parent + 2), v58);
  v54 = v58[0];
  v58[0] = 0;
  if (v54)
    (*(void (**)(uint64_t))(*(_QWORD *)v54 + 8))(v54);
  v55 = v57;
  v57 = 0;
  if (v55)
  {
    if (*(_DWORD *)v55 == 2)
      WTF::StringImpl::destroy(v55, v53);
    else
      *(_DWORD *)v55 -= 2;
  }
}

- (void)streamDataParserWillProvideContentKeyRequestInitializationData:(id)a3 forTrackID:(int)a4
{
  _QWORD *parent;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  _QWORD v9[4];
  WTF::String *v10;

  parent = self->_parent;
  v5 = a4;
  v10 = (WTF::String *)a4;
  v6 = parent[15];
  if (v6)
  {
    v7 = parent[16];
    v9[0] = "SourceBufferParserAVFObjC";
    v9[1] = 26;
    v9[2] = "willProvideContentKeyRequestInitializationDataForTrackID";
    v9[3] = v7;
    if (*(_BYTE *)(v6 + 12))
    {
      if (WebCore::LogMedia)
        v8 = byte_1ECE7C490 >= 3u;
      else
        v8 = 0;
      if (v8)
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [11],unsigned long long>((WTF::Logger::LogSiteIdentifier *)v9, &v10);
    }
  }
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)parent[5] + 16))(parent[5], v5, a3);
}

- (void)streamDataParser:(id)a3 didProvideContentKeyRequestInitializationData:(id)a4 forTrackID:(int)a5
{
  _QWORD *parent;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  uint64_t v11[4];
  WTF::String *v12;
  WebCore::FragmentedSharedBuffer *v13;

  parent = self->_parent;
  v6 = a5;
  v13 = (WebCore::FragmentedSharedBuffer *)a4;
  v12 = (WTF::String *)a5;
  v7 = parent[15];
  if (v7)
  {
    v8 = parent[16];
    v11[0] = (uint64_t)"SourceBufferParserAVFObjC";
    v11[1] = 26;
    v11[2] = (uint64_t)"didProvideContentKeyRequestInitializationDataForTrackID";
    v11[3] = v8;
    if (*(_BYTE *)(v7 + 12))
    {
      if (WebCore::LogMedia)
        v9 = byte_1ECE7C490 >= 3u;
      else
        v9 = 0;
      if (v9)
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [11],unsigned long long>((WTF::Logger::LogSiteIdentifier *)v11, &v12);
    }
  }
  WebCore::SharedBuffer::create<NSData *&>(&v13, v11);
  (*(void (**)(_QWORD, uint64_t *, uint64_t))(*(_QWORD *)parent[6] + 16))(parent[6], v11, v6);
  WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(v11, v10);
}

- (void)parent
{
  return self->_parent;
}

- (void)setParent:(void *)a3
{
  self->_parent = a3;
}

@end
