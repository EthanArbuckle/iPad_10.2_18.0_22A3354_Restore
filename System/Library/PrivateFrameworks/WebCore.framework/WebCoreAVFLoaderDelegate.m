@implementation WebCoreAVFLoaderDelegate

- (WebCoreAVFLoaderDelegate)initWithPlayer:(void *)a3
{
  WebCoreAVFLoaderDelegate *v4;
  void *v5;
  WebCoreAVFLoaderDelegate *v6;
  ThreadSafeWeakPtrControlBlock *v7;
  ThreadSafeWeakPtrControlBlock *m_ptr;
  uint64_t v10;
  uint64_t v11;
  int v12;
  MediaPlayerPrivateAVFoundationObjC *v13;
  int v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WebCoreAVFLoaderDelegate;
  v4 = -[WebCoreAVFLoaderDelegate init](&v16, sel_init);
  v6 = v4;
  if (v4)
  {
    v7 = *(ThreadSafeWeakPtrControlBlock **)a3;
    *(_QWORD *)a3 = 0;
    m_ptr = v4->m_player.m_controlBlock.m_ptr;
    v4->m_player.m_controlBlock.m_ptr = v7;
    if (!m_ptr)
      goto LABEL_15;
    if (__ldaxr((unsigned __int8 *)m_ptr))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
    {
      goto LABEL_7;
    }
    MEMORY[0x19AEA534C](m_ptr);
LABEL_7:
    v10 = *((_QWORD *)m_ptr + 2) - 1;
    *((_QWORD *)m_ptr + 2) = v10;
    if (v10)
    {
      v15 = __ldxr((unsigned __int8 *)m_ptr);
      if (v15 == 1)
      {
        if (!__stlxr(0, (unsigned __int8 *)m_ptr))
          goto LABEL_15;
      }
      else
      {
        __clrex();
      }
      WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
      goto LABEL_15;
    }
    v11 = *((_QWORD *)m_ptr + 1);
    v12 = __ldxr((unsigned __int8 *)m_ptr);
    if (v12 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)m_ptr))
      {
        if (!v11)
          goto LABEL_14;
        goto LABEL_15;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
    if (!v11)
LABEL_14:
      WTF::fastFree((WTF *)m_ptr, v5);
LABEL_15:
    v13 = (MediaPlayerPrivateAVFoundationObjC *)*((_QWORD *)a3 + 1);
    *((_QWORD *)a3 + 1) = 0;
    v6->m_player.m_objectOfCorrectType = v13;
  }
  return v6;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  MediaPlayerPrivateAVFoundationObjC *m_objectOfCorrectType;
  int v9;
  _QWORD *v10;
  _QWORD *v12;

  m_ptr = self->m_player.m_controlBlock.m_ptr;
  if (!m_ptr)
    return 0;
  m_objectOfCorrectType = self->m_player.m_objectOfCorrectType;
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](m_ptr, a2, a3);
LABEL_6:
  if (*((_QWORD *)m_ptr + 3))
    ++*((_QWORD *)m_ptr + 1);
  else
    m_objectOfCorrectType = 0;
  v9 = __ldxr((unsigned __int8 *)m_ptr);
  if (v9 != 1)
  {
    __clrex();
LABEL_18:
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
    if (m_objectOfCorrectType)
      goto LABEL_12;
    return 0;
  }
  if (__stlxr(0, (unsigned __int8 *)m_ptr))
    goto LABEL_18;
  if (!m_objectOfCorrectType)
    return 0;
LABEL_12:
  CFRetain(self);
  if (a4)
    CFRetain(a4);
  v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v10 = &off_1E3205120;
  v10[1] = self;
  v10[2] = self;
  v10[3] = a4;
  v12 = v10;
  WTF::ensureOnMainThread();
  if (v12)
    (*(void (**)(_QWORD *))(*v12 + 8))(v12);
  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*((unsigned __int8 **)m_objectOfCorrectType + 6));
  return 1;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForResponseToAuthenticationChallenge:(id)a4
{
  return 0;
}

- (void)resourceLoader:(id)a3 didCancelLoadingRequest:(id)a4
{
  _QWORD *v6;
  _QWORD *v7;

  if (self)
    CFRetain(self);
  if (a4)
    CFRetain(a4);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v6 = &off_1E3205170;
  v6[1] = self;
  v6[2] = self;
  v6[3] = a4;
  v7 = v6;
  WTF::ensureOnMainThread();
  if (v7)
    (*(void (**)(_QWORD *))(*v7 + 8))(v7);
}

- (void).cxx_destruct
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;

  m_ptr = self->m_player.m_controlBlock.m_ptr;
  self->m_player.m_controlBlock.m_ptr = 0;
  if (!m_ptr)
    return;
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](m_ptr, a2);
LABEL_6:
  v4 = *((_QWORD *)m_ptr + 2) - 1;
  *((_QWORD *)m_ptr + 2) = v4;
  if (v4)
  {
    v7 = __ldxr((unsigned __int8 *)m_ptr);
    if (v7 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)m_ptr))
        return;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
    return;
  }
  v5 = *((_QWORD *)m_ptr + 1);
  v6 = __ldxr((unsigned __int8 *)m_ptr);
  if (v6 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)m_ptr))
    {
      if (!v5)
        goto LABEL_14;
      return;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
  if (!v5)
LABEL_14:
    WTF::fastFree((WTF *)m_ptr, (void *)a2);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (_QWORD)resourceLoader:(_QWORD *)a1 shouldWaitForLoadingOfRequestedResource:
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E3205120;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)resourceLoader:(WTF *)this shouldWaitForLoadingOfRequestedResource:(void *)a2
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E3205120;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (uint64_t)resourceLoader:(***WTF:(void>::call(uint64_t *)(result :Detail::CallableWrapper<-[WebCoreAVFLoaderDelegate)resourceLoader:shouldWaitForLoadingOfRequestedResource:]::$_35 shouldWaitForLoadingOfRequestedResource:
{
  uint64_t (**v1)();
  uint64_t (*v2)();
  uint64_t (***v3)();
  uint64_t (*v4)();
  int v6;
  uint64_t (**v7)();
  uint64_t (***v8)();
  uint64_t (**v9)();
  uint64_t v10;
  uint64_t v11;
  int v13;
  uint64_t (***v14)();

  v1 = result[1];
  v2 = v1[1];
  if (!v2)
    return result;
  v3 = result;
  v4 = v1[2];
  if (__ldaxr((unsigned __int8 *)v2))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v2))
  {
    goto LABEL_6;
  }
  result = (uint64_t (***)())MEMORY[0x19AEA534C](v2);
LABEL_6:
  if (*((_QWORD *)v2 + 3))
    ++*((_QWORD *)v2 + 1);
  else
    v4 = 0;
  v6 = __ldxr((unsigned __int8 *)v2);
  if (v6 != 1)
  {
    __clrex();
LABEL_14:
    result = (uint64_t (***)())WTF::Lock::unlockSlow((WTF::Lock *)v2);
    if (!v4)
      return result;
    goto LABEL_15;
  }
  if (__stlxr(0, (unsigned __int8 *)v2))
    goto LABEL_14;
  if (!v4)
    return result;
LABEL_15:
  v7 = v3[3];
  v3[3] = 0;
  v8 = (uint64_t (***)())WTF::fastMalloc((WTF *)0x18);
  v9 = &off_1E3205148;
  *v8 = &off_1E3205148;
  v8[1] = (uint64_t (**)())v4;
  v8[2] = v7;
  v14 = v8;
  v10 = *((_QWORD *)v4 + 11);
  if (!v10)
  {
    v14 = 0;
    return (uint64_t (***)())v9[1]();
  }
  v11 = *((_QWORD *)v4 + 12);
  if (__ldaxr((unsigned __int8 *)v10))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v10))
  {
    goto LABEL_21;
  }
  MEMORY[0x19AEA534C](v10);
LABEL_21:
  if (*(_QWORD *)(v10 + 24))
    ++*(_QWORD *)(v10 + 8);
  else
    v11 = 0;
  v13 = __ldxr((unsigned __int8 *)v10);
  if (v13 != 1)
  {
    __clrex();
    goto LABEL_28;
  }
  if (__stlxr(0, (unsigned __int8 *)v10))
LABEL_28:
    WTF::Lock::unlockSlow((WTF::Lock *)v10);
  if (v11)
  {
    (*(void (**)(_QWORD, uint64_t (****)()))(**(_QWORD **)(*(_QWORD *)(v11 + 8) + 8) + 592))(*(_QWORD *)(*(_QWORD *)(v11 + 8) + 8), &v14);
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayer,(WTF::DestructionThread)1>(*(unsigned __int8 **)v11);
  }
  result = v14;
  v14 = 0;
  if (result)
  {
    v9 = *result;
    return (uint64_t (***)())v9[1]();
  }
  return result;
}

- (_QWORD)resourceLoader:shouldWaitForLoadingOfRequestedResource:
{
  const void *v2;
  uint64_t v3;

  *a1 = &off_1E3205148;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  v3 = a1[1];
  a1[1] = 0;
  if (v3)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v3 + 48));
  return a1;
}

- (uint64_t)resourceLoader:shouldWaitForLoadingOfRequestedResource:
{
  const void *v3;
  uint64_t v4;

  *(_QWORD *)this = &off_1E3205148;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v4 + 48));
  return WTF::fastFree(this, a2);
}

- (unsigned)resourceLoader:shouldWaitForLoadingOfRequestedResource:
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  WTF *v12;
  WTF *v13;
  WTF::StringImpl *v14;
  unsigned int v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  JSC::ArrayBufferView *v19;
  WTF *v20;
  WTF::StringImpl *v21;
  int v22;
  WTF *v23;
  unint64_t v24;
  unint64_t v25;
  WTF *v26;
  WTF *v27;
  WTF *v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  JSC::ArrayBuffer *v35;
  void *v36;
  char v37;
  void *v38;
  WTF *v39;
  BOOL v40;
  unint64_t v41;
  uint64_t v42;
  WTF *v43;
  WTF *v44;
  char v45;
  uint64_t v46;
  void *v47;
  void *v48;
  PAL *v49;
  void *v50;
  uint64_t AVFoundation_AVStreamingKeyDeliveryContentKeyType;
  void *v52;
  RefCountedSerialFunctionDispatcher *v53;
  unsigned int *v54;
  uint64_t *v55;
  unsigned int *v56;
  unsigned int v57;
  uint64_t v58;
  int v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unsigned int v63;
  _QWORD *v64;
  void *v65;
  _QWORD *v66;
  int v67;
  unsigned int *v68;
  unsigned int *v69;
  unsigned int v70;
  unsigned int v71;
  uint64_t v72;
  int v73;
  unsigned int v74;
  unsigned int v75;
  __CFString *v76;
  WebCore::FragmentedSharedBuffer *v77;
  WebCore::FragmentedSharedBuffer *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  WTF::StringImpl *v82;
  WTF *v83;
  unsigned int v84;
  unsigned int v85;
  WTF::StringImpl *v86;
  WTF *v87;
  WTF::StringImpl *v88;
  _DWORD *v89;
  void *v90;
  AVAssetResourceLoadingRequest *v91;
  WTF::StringImpl *v92;
  WTF::StringImpl *v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  unint64_t v97;
  unsigned int v98;
  uint64_t v99;
  uint64_t v100;
  unsigned int v102;
  WTF::StringImpl *v103;
  WTF::StringImpl *v104;
  unsigned __int8 *result;
  int v106;
  unint64_t v107;
  __int128 v108;
  WTF *v109;
  int8x16_t v110;
  __int128 v111;
  __int128 v112;
  char *v113;
  char *v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unsigned int *v119;
  uint64_t v120;
  unsigned int v121;
  unsigned int v122;
  uint64_t v123;
  WTF *v124;
  uint64_t v126;
  void *v127;
  WTF *v128;
  WTF *v129;
  uint64_t v130;
  void *v131;
  WTF *v132;
  WTF *v133;
  Class isa;
  void *v135;
  AVAssetResourceLoadingRequestInternal *loadingRequest;
  WTF *v137;
  uint64_t v138;
  WTF *v139;
  uint64_t v140;
  void *v141;
  WTF *v142;
  WTF *v143;
  uint64_t v144;
  uint64_t v145;
  WTF *v146;
  WTF::StringImpl *v147;
  int v148;
  AVAssetResourceLoadingRequest *v149;
  WTF *v150;
  uint64_t v151;
  _QWORD v152[8];
  WTF *v153;
  unint64_t v154;
  _DWORD *v155;
  WTF::StringImpl *v156;
  WTF::StringImpl *v157;
  WTF::StringImpl *v158;
  CFTypeRef v159[2];
  int8x16x2_t v160;
  int8x16x2_t v161;
  int8x16x2_t v162;

  v2 = *(_QWORD *)(a1 + 8);
  v159[0] = *(CFTypeRef *)(a1 + 16);
  v3 = *(_QWORD *)(v2 + 88);
  if (!v3)
    return (unsigned __int8 *)objc_msgSend(*(id *)(a1 + 16), "finishLoadingWithError:", 0);
  v4 = *(_QWORD *)(v2 + 96);
  if (__ldaxr((unsigned __int8 *)v3))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v3))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](v3);
LABEL_6:
  if (*(_QWORD *)(v3 + 24))
    ++*(_QWORD *)(v3 + 8);
  else
    v4 = 0;
  v6 = __ldxr((unsigned __int8 *)v3);
  if (v6 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v3))
    {
      if (!v4)
        return (unsigned __int8 *)objc_msgSend(*(id *)(a1 + 16), "finishLoadingWithError:", 0);
      goto LABEL_15;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v3);
  if (!v4)
    return (unsigned __int8 *)objc_msgSend(*(id *)(a1 + 16), "finishLoadingWithError:", 0);
LABEL_15:
  v7 = (void *)v159[0];
  MEMORY[0x19AEA5508](&v158, objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v159[0], "request"), "URL"), "scheme"));
  MEMORY[0x19AEA5508](&v157, objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "request"), "URL"), "absoluteString"));
  if (MEMORY[0x19AEA53F4](v158, "skd", 3))
  {
    v8 = *(_QWORD *)(v2 + 280);
    v9 = *(_QWORD *)(v2 + 288);
    v150 = (WTF *)"MediaPlayerPrivateAVFoundationObjC";
    v151 = 35;
    v152[0] = "shouldWaitForLoadingOfResource";
    v152[1] = v9;
    if (*(_BYTE *)(v8 + 12) && WebCore::LogMedia && byte_1ECE7C490 >= 3u)
      WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [20]>((uint64_t)&WebCore::LogMedia, 3u, (WTF::Logger::LogSiteIdentifier *)&v150, "received skd:// URI");
    v10 = (int)v157;
    if (v157)
      v10 = *((_DWORD *)v157 + 1);
    v11 = 2 * v10;
    JSC::ArrayBuffer::create((JSC::ArrayBuffer *)(2 * v10 + 4));
    v12 = v156;
    *(_DWORD *)v156 += 2;
    v147 = 0;
    v150 = v12;
    JSC::DataView::create();
    v13 = v150;
    v150 = 0;
    if (v13)
    {
      v40 = *(_DWORD *)v13 == 2;
      *(_DWORD *)v13 -= 2;
      if (v40)
      {
        v126 = *((_QWORD *)v13 + 10);
        if (v126)
        {
          *(_QWORD *)(v126 + 8) = 3;
          *((_QWORD *)v13 + 10) = 0;
        }
        if ((*((_BYTE *)v13 + 72) & 1) == 0)
          JSC::InlineWatchpointSet::freeFat((WTF *)((char *)v13 + 72));
        JSC::ArrayBufferContents::~ArrayBufferContents((WTF *)((char *)v13 + 16));
        v128 = (WTF *)*((_QWORD *)v13 + 1);
        if ((v128 & 1) == 0 && v128)
        {
          v129 = *(WTF **)v128;
          if (*(_QWORD *)v128)
          {
            *(_QWORD *)v128 = 0;
            *((_DWORD *)v128 + 2) = 0;
            WTF::fastFree(v129, v127);
          }
          WTF::fastFree(v128, v127);
        }
        WTF::fastFree(v13, v127);
      }
    }
    WTF::Ref<JSC::ArrayBuffer,WTF::RawPtrTraits<JSC::ArrayBuffer>,WTF::DefaultRefDerefTraits<JSC::ArrayBuffer>>::~Ref((uint64_t *)&v147);
    JSC::DataView::set<unsigned int>((uint64_t)v155, 0, v11, 1, 0);
    v14 = v156;
    *(_DWORD *)v156 += 2;
    v147 = 0;
    v150 = v14;
    v15 = v157;
    if (v157)
      v15 = *((_DWORD *)v157 + 1);
    if (*((_BYTE *)v14 + 64) && (v144 = *((_QWORD *)v14 + 4)) != 0)
      v16 = *(_QWORD *)(v144 + 32);
    else
      v16 = *((_QWORD *)v14 + 6);
    v17 = v16 >= 4;
    v18 = v16 - 4;
    if (!v17 || v15 > v18 >> 1)
    {
      __break(0xC471u);
      JUMPOUT(0x19477AE08);
    }
    v19 = (JSC::ArrayBufferView *)WTF::fastMalloc((WTF *)0x28);
    JSC::ArrayBufferView::ArrayBufferView();
    v20 = v150;
    v150 = 0;
    if (v20)
    {
      v40 = *(_DWORD *)v20 == 2;
      *(_DWORD *)v20 -= 2;
      if (v40)
      {
        v130 = *((_QWORD *)v20 + 10);
        if (v130)
        {
          *(_QWORD *)(v130 + 8) = 3;
          *((_QWORD *)v20 + 10) = 0;
        }
        if ((*((_BYTE *)v20 + 72) & 1) == 0)
          JSC::InlineWatchpointSet::freeFat((WTF *)((char *)v20 + 72));
        JSC::ArrayBufferContents::~ArrayBufferContents((WTF *)((char *)v20 + 16));
        v132 = (WTF *)*((_QWORD *)v20 + 1);
        if ((v132 & 1) == 0 && v132)
        {
          v133 = *(WTF **)v132;
          if (*(_QWORD *)v132)
          {
            *(_QWORD *)v132 = 0;
            *((_DWORD *)v132 + 2) = 0;
            WTF::fastFree(v133, v131);
          }
          WTF::fastFree(v132, v131);
        }
        WTF::fastFree(v20, v131);
      }
    }
    WTF::Ref<JSC::ArrayBuffer,WTF::RawPtrTraits<JSC::ArrayBuffer>,WTF::DefaultRefDerefTraits<JSC::ArrayBuffer>>::~Ref((uint64_t *)&v147);
    v21 = v157;
    if (v157)
    {
      v22 = *((_DWORD *)v157 + 4);
      v23 = (WTF *)*((_QWORD *)v157 + 1);
      v24 = *((unsigned int *)v157 + 1);
      v150 = (WTF *)v152;
      v151 = 32;
      v153 = 0;
      v154 = 0;
      if ((v22 & 4) == 0)
      {
        v153 = v23;
        v154 = v24;
LABEL_48:
        LODWORD(v21) = *((_DWORD *)v21 + 1);
LABEL_49:
        JSC::ArrayBufferView::setRangeImpl(v19, v23, 2 * v21, 0);
        v39 = v150;
        v40 = v152 == (_QWORD *)v150 || v150 == 0;
        if (!v40)
        {
          v150 = 0;
          LODWORD(v151) = 0;
          WTF::fastFree(v39, v38);
        }
        v41 = *((_QWORD *)v156 + 2);
        if (v41)
        {
          v42 = *(_QWORD *)(MEMORY[0x1E0CC10F8] + 56);
          if (v42)
          {
            if (*(_BYTE *)(MEMORY[0x1E0CC10F8] + 34) || !*MEMORY[0x1E0CC10F0])
              v41 = (v41 & 0x3FFFFFFFFLL) + v42;
          }
        }
        if (*((_BYTE *)v156 + 64) && (v145 = *((_QWORD *)v156 + 4)) != 0)
          v43 = *(WTF **)(v145 + 32);
        else
          v43 = (WTF *)*((_QWORD *)v156 + 6);
        v150 = 0;
        LODWORD(v151) = 0;
        HIDWORD(v151) = (_DWORD)v43;
        if (v43)
        {
          if ((unint64_t)v43 >> 32)
          {
            __break(0xC471u);
            JUMPOUT(0x19477AEA8);
          }
          v44 = (WTF *)WTF::fastMalloc(v43);
          LODWORD(v151) = (_DWORD)v43;
          v150 = v44;
          do
          {
            v45 = *(_BYTE *)v41++;
            *(_BYTE *)v44 = v45;
            v44 = (WTF *)((char *)v44 + 1);
            v43 = (WTF *)((char *)v43 - 1);
          }
          while (v43);
        }
        WebCore::FragmentedSharedBuffer::create(&v150, (uint64_t *)&v147);
        v46 = WTF::fastMalloc((WTF *)0x38);
        v149 = (AVAssetResourceLoadingRequest *)WebCore::SharedBuffer::SharedBuffer(v46, (uint64_t *)&v147);
        WTF::Ref<WebCore::FragmentedSharedBuffer,WTF::RawPtrTraits<WebCore::FragmentedSharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::FragmentedSharedBuffer>>::~Ref((uint64_t *)&v147, v47);
        if (v150)
          WTF::fastFree(v150, v48);
        v49 = (PAL *)(*(uint64_t (**)(_QWORD, AVAssetResourceLoadingRequest *))(**(_QWORD **)(*(_QWORD *)(v4 + 8) + 8)
                                                                                        + 176))(*(_QWORD *)(*(_QWORD *)(v4 + 8) + 8), v149);
        if (!*(_BYTE *)(v2 + 720))
          goto LABEL_110;
        if (*(_QWORD *)(v2 + 728))
        {
          AVFoundation_AVStreamingKeyDeliveryContentKeyType = PAL::get_AVFoundation_AVStreamingKeyDeliveryContentKeyType(v49);
          v52 = (void *)v159[0];
          objc_msgSend((id)objc_msgSend((id)v159[0], "contentInformationRequest"), "setContentType:", AVFoundation_AVStreamingKeyDeliveryContentKeyType);
          objc_msgSend(v52, "finishLoading");
LABEL_110:
          WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref((uint64_t *)&v149, v50);
          if (*(_DWORD *)v19 == 1)
            JSC::ArrayBufferView::operator delete();
          else
            --*(_DWORD *)v19;
          v89 = v155;
          v155 = 0;
          if (v89)
          {
            if (*v89 == 1)
              JSC::ArrayBufferView::operator delete();
            else
              --*v89;
          }
          WTF::Ref<JSC::ArrayBuffer,WTF::RawPtrTraits<JSC::ArrayBuffer>,WTF::DefaultRefDerefTraits<JSC::ArrayBuffer>>::~Ref((uint64_t *)&v156);
          v37 = 1;
          goto LABEL_145;
        }
        if (v157)
          v76 = (__CFString *)WTF::StringImpl::operator NSString *();
        else
          v76 = &stru_1E3487BC0;
        v77 = (WebCore::FragmentedSharedBuffer *)-[__CFString dataUsingEncoding:allowLossyConversion:](v76, "dataUsingEncoding:allowLossyConversion:", 4, 1);
        v78 = v77;
        if (v77)
          CFRetain(v77);
        WebCore::FragmentedSharedBuffer::create(v78, (CFIndex *)&v150);
        v79 = WTF::fastMalloc((WTF *)0x38);
        v147 = (WTF::StringImpl *)WebCore::SharedBuffer::SharedBuffer(v79, (uint64_t *)&v150);
        WTF::Ref<WebCore::FragmentedSharedBuffer,WTF::RawPtrTraits<WebCore::FragmentedSharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::FragmentedSharedBuffer>>::~Ref((uint64_t *)&v150, v80);
        v82 = v147;
        v147 = 0;
        v83 = *(WTF **)(v2 + 880);
        *(_QWORD *)(v2 + 880) = v82;
        if (v83)
        {
          do
          {
            v84 = __ldaxr((unsigned int *)v83);
            v85 = v84 - 1;
          }
          while (__stlxr(v85, (unsigned int *)v83));
          if (!v85)
          {
            atomic_store(1u, (unsigned int *)v83);
            v116 = *((unsigned int *)v83 + 5);
            v146 = v83;
            if ((_DWORD)v116)
            {
              v117 = *((_QWORD *)v83 + 1);
              v118 = v117 + 16 * v116;
              do
              {
                v119 = *(unsigned int **)(v117 + 8);
                v120 = v117;
                *(_QWORD *)(v117 + 8) = 0;
                if (v119)
                {
                  do
                  {
                    v121 = __ldaxr(v119);
                    v122 = v121 - 1;
                  }
                  while (__stlxr(v122, v119));
                  if (!v122)
                  {
                    atomic_store(1u, v119);
                    v123 = v119[6];
                    if ((_DWORD)v123 != -1)
                      ((void (*)(WTF **, unsigned int *))off_1E3204BC8[v123])(&v150, v119 + 2);
                    v119[6] = -1;
                    WTF::fastFree((WTF *)v119, v81);
                  }
                }
                v117 = v120 + 16;
                v83 = v146;
              }
              while (v120 + 16 != v118);
            }
            v124 = (WTF *)*((_QWORD *)v83 + 1);
            if ((WTF *)((char *)v83 + 24) != v124 && v124 != 0)
            {
              *((_QWORD *)v146 + 1) = 0;
              *((_DWORD *)v146 + 4) = 0;
              WTF::fastFree(v124, v81);
            }
            WTF::fastFree(v146, v81);
          }
        }
        WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref((uint64_t *)&v147, v81);
        WTF::StringImpl::createWithoutCopyingNonEmpty();
        v147 = v150;
        WebCore::FragmentedSharedBuffer::tryCreateArrayBuffer(*(WebCore::FragmentedSharedBuffer **)(v2 + 880), &v150);
        (*(void (**)(_QWORD, WTF::StringImpl **, WTF **))(**(_QWORD **)(*(_QWORD *)(v4 + 8) + 8) + 192))(*(_QWORD *)(*(_QWORD *)(v4 + 8) + 8), &v147, &v150);
        v87 = v150;
        v150 = 0;
        if (v87)
        {
          v40 = *(_DWORD *)v87 == 2;
          *(_DWORD *)v87 -= 2;
          if (v40)
          {
            v138 = v4;
            v139 = v87;
            v140 = *((_QWORD *)v87 + 10);
            if (v140)
            {
              *(_QWORD *)(v140 + 8) = 3;
              *((_QWORD *)v139 + 10) = 0;
            }
            if ((*((_BYTE *)v139 + 72) & 1) == 0)
              JSC::InlineWatchpointSet::freeFat((WTF *)((char *)v139 + 72));
            JSC::ArrayBufferContents::~ArrayBufferContents((WTF *)((char *)v139 + 16));
            v142 = (WTF *)*((_QWORD *)v139 + 1);
            if ((v142 & 1) == 0 && v142)
            {
              v143 = *(WTF **)v142;
              if (*(_QWORD *)v142)
              {
                *(_QWORD *)v142 = 0;
                *((_DWORD *)v142 + 2) = 0;
                WTF::fastFree(v143, v141);
              }
              WTF::fastFree(v142, v141);
            }
            WTF::fastFree(v139, v141);
            v4 = v138;
          }
        }
        v88 = v147;
        v147 = 0;
        if (v88)
        {
          if (*(_DWORD *)v88 == 2)
            WTF::StringImpl::destroy(v88, v86);
          else
            *(_DWORD *)v88 -= 2;
        }
        if (*(_BYTE *)(v2 + 721) || (*(_BYTE *)(v2 + 721) = 1, (v99 = *(_QWORD *)(v2 + 88)) == 0))
        {
LABEL_108:
          WTF::HashMap<WTF::String,WTF::RetainPtr<AVAssetResourceLoadingRequest>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RetainPtr<AVAssetResourceLoadingRequest>>,WTF::MemoryCompactRobinHoodHashTableTraits>::inlineSet<WTF::String const&,AVAssetResourceLoadingRequest*&>((uint64_t)&v150, v2 + 568, &v157, v159);
          if (v78)
            CFRelease(v78);
          goto LABEL_110;
        }
        v100 = *(_QWORD *)(v2 + 96);
        if (__ldaxr((unsigned __int8 *)v99))
        {
          __clrex();
        }
        else if (!__stxr(1u, (unsigned __int8 *)v99))
        {
          goto LABEL_163;
        }
        MEMORY[0x19AEA534C](v99);
LABEL_163:
        if (*(_QWORD *)(v99 + 24))
          ++*(_QWORD *)(v99 + 8);
        else
          v100 = 0;
        v106 = __ldxr((unsigned __int8 *)v99);
        if (v106 == 1)
        {
          if (!__stlxr(0, (unsigned __int8 *)v99))
          {
LABEL_171:
            if (v100)
            {
              (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(v100 + 8) + 8) + 200))(*(_QWORD *)(*(_QWORD *)(v100 + 8) + 8));
              WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayer,(WTF::DestructionThread)1>(*(unsigned __int8 **)v100);
            }
            goto LABEL_108;
          }
        }
        else
        {
          __clrex();
        }
        WTF::Lock::unlockSlow((WTF::Lock *)v99);
        goto LABEL_171;
      }
      if (v24 > 0x20)
      {
        if (v24 <= 0x29)
          v107 = 41;
        else
          v107 = v24;
        WTF::Vector<char16_t,32ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)&v150, v107);
        HIDWORD(v151) = v24;
        v26 = v150;
        if (v24 < 0x40)
        {
          v27 = v150;
        }
        else
        {
          v27 = (WTF *)((char *)v150 + 2 * (v24 & 0xFFFFFFC0));
          v108 = 0uLL;
          v109 = v150;
          do
          {
            v160.val[0] = *(int8x16_t *)v23;
            v110 = *((int8x16_t *)v23 + 1);
            v161.val[0] = (int8x16_t)*((_OWORD *)v23 + 2);
            v111 = *((_OWORD *)v23 + 3);
            v23 = (WTF *)((char *)v23 + 64);
            v112 = v111;
            v161.val[1] = 0uLL;
            v162.val[0] = v110;
            v160.val[1] = 0uLL;
            v113 = (char *)v109;
            vst2q_s8(v113, v160);
            v113 += 32;
            v162.val[1] = 0uLL;
            vst2q_s8(v113, v162);
            v114 = (char *)v109 + 64;
            vst2q_s8(v114, v161);
            v115 = (char *)v109 + 96;
            vst2q_s8(v115, *(int8x16x2_t *)(&v108 - 1));
            v109 = (WTF *)((char *)v109 + 128);
          }
          while (v109 != v27);
        }
LABEL_38:
        v28 = (WTF *)((char *)v26 + 2 * v24);
        while (v27 != v28)
        {
          v29 = *(unsigned __int8 *)v23;
          v23 = (WTF *)((char *)v23 + 1);
          *(_WORD *)v27 = v29;
          v27 = (WTF *)((char *)v27 + 2);
        }
        v23 = v150;
        v21 = v157;
        v153 = v150;
        v154 = HIDWORD(v151);
        if (!v157)
          goto LABEL_49;
        goto LABEL_48;
      }
      v25 = v24;
    }
    else
    {
      v23 = 0;
      LODWORD(v24) = 0;
      v25 = 0;
      v150 = (WTF *)v152;
      v151 = 32;
      v153 = 0;
      v154 = 0;
    }
    HIDWORD(v151) = v24;
    v24 = v25;
    v26 = (WTF *)v152;
    v27 = (WTF *)v152;
    goto LABEL_38;
  }
  if (MEMORY[0x19AEA53F4](v158, "clearkey", 8))
  {
    MEMORY[0x19AEA5508](&v156, objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "request"), "URL"), "resourceSpecifier"));
    v30 = v156;
    if (v156)
    {
      v31 = *((_QWORD *)v156 + 1);
      v30 = *((_DWORD *)v156 + 1);
      v32 = ((unint64_t)*((unsigned int *)v156 + 4) >> 2) & 1;
    }
    else
    {
      v31 = 0;
      v32 = 1;
    }
    PAL::TextCodecUTF8::encodeUTF8(v31, v30 | (v32 << 32), (uint64_t)&v147);
    WebCore::FragmentedSharedBuffer::create(&v147, (uint64_t *)&v150);
    v33 = WTF::fastMalloc((WTF *)0x38);
    v155 = (_DWORD *)WebCore::SharedBuffer::SharedBuffer(v33, (uint64_t *)&v150);
    WTF::Ref<WebCore::FragmentedSharedBuffer,WTF::RawPtrTraits<WebCore::FragmentedSharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::FragmentedSharedBuffer>>::~Ref((uint64_t *)&v150, v34);
    (*(void (**)(AVAssetResourceLoadingRequest **__return_ptr, _QWORD, WTF::StringImpl **))(**(_QWORD **)(*(_QWORD *)(v4 + 8) + 8) + 168))(&v149, *(_QWORD *)(*(_QWORD *)(v4 + 8) + 8), &v156);
    if (v149)
    {
      WebCore::fulfillRequestWithKeyData((WebCore *)v7, v149, v35);
    }
    else
    {
      (*(void (**)(_QWORD, _DWORD *))(**(_QWORD **)(*(_QWORD *)(v4 + 8) + 8) + 176))(*(_QWORD *)(*(_QWORD *)(v4 + 8) + 8), v155);
      if (*(_BYTE *)(v2 + 720))
      {
        WTF::HashMap<WTF::String,WTF::RetainPtr<AVAssetResourceLoadingRequest>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RetainPtr<AVAssetResourceLoadingRequest>>,WTF::MemoryCompactRobinHoodHashTableTraits>::inlineSet<WTF::String const&,AVAssetResourceLoadingRequest*&>((uint64_t)&v150, v2 + 568, &v156, v159);
        v37 = 1;
LABEL_118:
        v91 = v149;
        v149 = 0;
        if (v91)
        {
          v40 = LODWORD(v91->super.isa) == 2;
          LODWORD(v91->super.isa) -= 2;
          if (v40)
          {
            isa = v91[5].super.isa;
            if (isa)
            {
              *((_QWORD *)isa + 1) = 3;
              v91[5].super.isa = 0;
            }
            if (((uint64_t)v91[4]._loadingRequest & 1) == 0)
              JSC::InlineWatchpointSet::freeFat((JSC::InlineWatchpointSet *)&v91[4]._loadingRequest);
            JSC::ArrayBufferContents::~ArrayBufferContents((JSC::ArrayBufferContents *)&v91[1]);
            loadingRequest = v91->_loadingRequest;
            if ((loadingRequest & 1) == 0 && loadingRequest)
            {
              v137 = *(WTF **)loadingRequest;
              if (*(_QWORD *)loadingRequest)
              {
                *(_QWORD *)loadingRequest = 0;
                *((_DWORD *)loadingRequest + 2) = 0;
                WTF::fastFree(v137, v135);
              }
              WTF::fastFree(loadingRequest, v135);
            }
            WTF::fastFree((WTF *)v91, v135);
          }
        }
        WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref((uint64_t *)&v155, v36);
        v92 = v147;
        if (v147)
        {
          v147 = 0;
          v148 = 0;
          WTF::fastFree(v92, v90);
        }
        v93 = v156;
        v156 = 0;
        if (v93)
        {
          if (*(_DWORD *)v93 == 2)
            WTF::StringImpl::destroy(v93, (WTF::StringImpl *)v90);
          else
            *(_DWORD *)v93 -= 2;
        }
        goto LABEL_145;
      }
    }
    v37 = 0;
    goto LABEL_118;
  }
  v53 = *(RefCountedSerialFunctionDispatcher **)(v2 + 1176);
  v54 = (unsigned int *)WTF::fastMalloc((WTF *)0x68);
  WebCore::WebCoreAVFResourceLoader::WebCoreAVFResourceLoader((WebCore::WebCoreAVFResourceLoader *)v54, (WebCore::MediaPlayerPrivateAVFoundationObjC *)v2, v7, v53);
  if (v7)
    CFRetain(v7);
  v55 = (uint64_t *)(v2 + 552);
  v56 = v54 + 2;
  do
    v57 = __ldaxr(v56);
  while (__stlxr(v57 + 1, v56));
  v58 = *v55;
  if (*v55
    || (WTF::HashTable<WTF::RetainPtr<void const*>,WTF::KeyValuePair<WTF::RetainPtr<void const*>,WTF::RefPtr<WebCore::WebCoreAVFResourceLoader,WTF::RawPtrTraits<WebCore::WebCoreAVFResourceLoader>,WTF::DefaultRefDerefTraits<WebCore::WebCoreAVFResourceLoader>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::RetainPtr<void const*>,WTF::RefPtr<WebCore::WebCoreAVFResourceLoader,WTF::RawPtrTraits<WebCore::WebCoreAVFResourceLoader>,WTF::DefaultRefDerefTraits<WebCore::WebCoreAVFResourceLoader>>>>,WTF::DefaultHash<WTF::RetainPtr<void const*>>,WTF::HashMap<WTF::RetainPtr<void const*>,WTF::RefPtr<WebCore::WebCoreAVFResourceLoader,WTF::RawPtrTraits<WebCore::WebCoreAVFResourceLoader>,WTF::DefaultRefDerefTraits<WebCore::WebCoreAVFResourceLoader>>,WTF::DefaultHash<WTF::RetainPtr<void const*>>,WTF::HashTraits<WTF::RetainPtr<void const*>>,WTF::HashTraits<WTF::RefPtr<WebCore::WebCoreAVFResourceLoader,WTF::RawPtrTraits<WebCore::WebCoreAVFResourceLoader>,WTF::DefaultRefDerefTraits<WebCore::WebCoreAVFResourceLoader>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::RetainPtr<void const*>>>::rehash(v55, 8u), (v58 = *v55) != 0))
  {
    v59 = *(_DWORD *)(v58 - 8);
  }
  else
  {
    v59 = 0;
  }
  v60 = ((unint64_t)v7 + ~((_QWORD)v7 << 32)) ^ (((unint64_t)v7 + ~((_QWORD)v7 << 32)) >> 22);
  v61 = 9 * ((v60 + ~(v60 << 13)) ^ ((v60 + ~(v60 << 13)) >> 8));
  v62 = (v61 ^ (v61 >> 15)) + ~((v61 ^ (v61 >> 15)) << 27);
  v63 = v59 & ((v62 >> 31) ^ v62);
  v64 = (_QWORD *)(v58 + 16 * v63);
  v65 = (void *)*v64;
  if (!*v64)
  {
LABEL_84:
    v68 = (unsigned int *)v64[1];
    *v64 = v7;
    v64[1] = v54;
    if (v68)
    {
      v69 = v68 + 2;
      do
      {
        v70 = __ldaxr(v69);
        v71 = v70 - 1;
      }
      while (__stlxr(v71, v69));
      if (!v71)
      {
        atomic_store(1u, v68 + 2);
        (*(void (**)(unsigned int *))(*(_QWORD *)v68 + 8))(v68);
      }
    }
    v72 = *v55;
    if (*v55)
      v73 = *(_DWORD *)(v72 - 12) + 1;
    else
      v73 = 1;
    *(_DWORD *)(v72 - 12) = v73;
    v94 = *v55;
    if (*v55)
      v95 = *(_DWORD *)(v94 - 12);
    else
      v95 = 0;
    v96 = (*(_DWORD *)(v94 - 16) + v95);
    v97 = *(unsigned int *)(v94 - 4);
    if (v97 > 0x400)
    {
      if (v97 > 2 * v96)
        goto LABEL_141;
    }
    else
    {
      if (3 * v97 > 4 * v96)
        goto LABEL_141;
      if (!(_DWORD)v97)
      {
        v98 = 8;
        goto LABEL_140;
      }
    }
    v98 = (_DWORD)v97 << (6 * *(_DWORD *)(v94 - 12) >= (2 * v97));
LABEL_140:
    WTF::HashTable<WTF::RetainPtr<void const*>,WTF::KeyValuePair<WTF::RetainPtr<void const*>,WTF::RefPtr<WebCore::WebCoreAVFResourceLoader,WTF::RawPtrTraits<WebCore::WebCoreAVFResourceLoader>,WTF::DefaultRefDerefTraits<WebCore::WebCoreAVFResourceLoader>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::RetainPtr<void const*>,WTF::RefPtr<WebCore::WebCoreAVFResourceLoader,WTF::RawPtrTraits<WebCore::WebCoreAVFResourceLoader>,WTF::DefaultRefDerefTraits<WebCore::WebCoreAVFResourceLoader>>>>,WTF::DefaultHash<WTF::RetainPtr<void const*>>,WTF::HashMap<WTF::RetainPtr<void const*>,WTF::RefPtr<WebCore::WebCoreAVFResourceLoader,WTF::RawPtrTraits<WebCore::WebCoreAVFResourceLoader>,WTF::DefaultRefDerefTraits<WebCore::WebCoreAVFResourceLoader>>,WTF::DefaultHash<WTF::RetainPtr<void const*>>,WTF::HashTraits<WTF::RetainPtr<void const*>>,WTF::HashTraits<WTF::RefPtr<WebCore::WebCoreAVFResourceLoader,WTF::RawPtrTraits<WebCore::WebCoreAVFResourceLoader>,WTF::DefaultRefDerefTraits<WebCore::WebCoreAVFResourceLoader>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::RetainPtr<void const*>>>::rehash(v55, v98);
    goto LABEL_141;
  }
  v66 = 0;
  v67 = 1;
  while (v65 != v7)
  {
    if (v65 == (void *)-1)
      v66 = v64;
    v63 = (v63 + v67) & v59;
    v64 = (_QWORD *)(v58 + 16 * v63);
    v65 = (void *)*v64;
    ++v67;
    if (!*v64)
    {
      if (v66)
      {
        *v66 = 0;
        v66[1] = 0;
        --*(_DWORD *)(*v55 - 16);
        v64 = v66;
      }
      goto LABEL_84;
    }
  }
  do
  {
    v74 = __ldaxr(v56);
    v75 = v74 - 1;
  }
  while (__stlxr(v75, v56));
  if (v75)
  {
    if (!v7)
      goto LABEL_141;
    goto LABEL_94;
  }
  atomic_store(1u, v54 + 2);
  (*(void (**)(unsigned int *))(*(_QWORD *)v54 + 8))(v54);
  if (v7)
LABEL_94:
    CFRelease(v7);
LABEL_141:
  WebCore::WebCoreAVFResourceLoader::startLoading((WebCore::WebCoreAVFResourceLoader *)v54);
  do
    v102 = __ldaxr(v56);
  while (__stlxr(v102 - 1, v56));
  v37 = 1;
  if (v102 == 1)
  {
    atomic_store(1u, v54 + 2);
    (*(void (**)(unsigned int *))(*(_QWORD *)v54 + 8))(v54);
  }
LABEL_145:
  v103 = v157;
  v157 = 0;
  if (v103)
  {
    if (*(_DWORD *)v103 == 2)
      WTF::StringImpl::destroy(v103, (WTF::StringImpl *)v90);
    else
      *(_DWORD *)v103 -= 2;
  }
  v104 = v158;
  v158 = 0;
  if (v104)
  {
    if (*(_DWORD *)v104 == 2)
      WTF::StringImpl::destroy(v104, (WTF::StringImpl *)v90);
    else
      *(_DWORD *)v104 -= 2;
  }
  result = WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayer,(WTF::DestructionThread)1>(*(unsigned __int8 **)v4);
  if ((v37 & 1) == 0)
    return (unsigned __int8 *)objc_msgSend(*(id *)(a1 + 16), "finishLoadingWithError:", 0);
  return result;
}

- (_QWORD)resourceLoader:(_QWORD *)a1 didCancelLoadingRequest:
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E3205170;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)resourceLoader:(WTF *)this didCancelLoadingRequest:(void *)a2
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E3205170;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (uint64_t)resourceLoader:(***WTF:(void>::call(uint64_t *)(result :Detail::CallableWrapper<-[WebCoreAVFLoaderDelegate)resourceLoader:didCancelLoadingRequest:]::$_36 didCancelLoadingRequest:
{
  uint64_t (**v1)();
  uint64_t (*v2)();
  uint64_t (***v3)();
  uint64_t (*v4)();
  int v6;
  uint64_t (**v7)();
  uint64_t (***v8)();
  uint64_t (**v9)();
  uint64_t v10;
  uint64_t v11;
  int v13;
  uint64_t (***v14)();

  v1 = result[1];
  v2 = v1[1];
  if (!v2)
    return result;
  v3 = result;
  v4 = v1[2];
  if (__ldaxr((unsigned __int8 *)v2))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v2))
  {
    goto LABEL_6;
  }
  result = (uint64_t (***)())MEMORY[0x19AEA534C](v2);
LABEL_6:
  if (*((_QWORD *)v2 + 3))
    ++*((_QWORD *)v2 + 1);
  else
    v4 = 0;
  v6 = __ldxr((unsigned __int8 *)v2);
  if (v6 != 1)
  {
    __clrex();
LABEL_14:
    result = (uint64_t (***)())WTF::Lock::unlockSlow((WTF::Lock *)v2);
    if (!v4)
      return result;
    goto LABEL_15;
  }
  if (__stlxr(0, (unsigned __int8 *)v2))
    goto LABEL_14;
  if (!v4)
    return result;
LABEL_15:
  v7 = v3[3];
  v3[3] = 0;
  v8 = (uint64_t (***)())WTF::fastMalloc((WTF *)0x18);
  v9 = &off_1E3205198;
  *v8 = &off_1E3205198;
  v8[1] = (uint64_t (**)())v4;
  v8[2] = v7;
  v14 = v8;
  v10 = *((_QWORD *)v4 + 11);
  if (!v10)
  {
    v14 = 0;
    return (uint64_t (***)())v9[1]();
  }
  v11 = *((_QWORD *)v4 + 12);
  if (__ldaxr((unsigned __int8 *)v10))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v10))
  {
    goto LABEL_21;
  }
  MEMORY[0x19AEA534C](v10);
LABEL_21:
  if (*(_QWORD *)(v10 + 24))
    ++*(_QWORD *)(v10 + 8);
  else
    v11 = 0;
  v13 = __ldxr((unsigned __int8 *)v10);
  if (v13 != 1)
  {
    __clrex();
    goto LABEL_28;
  }
  if (__stlxr(0, (unsigned __int8 *)v10))
LABEL_28:
    WTF::Lock::unlockSlow((WTF::Lock *)v10);
  if (v11)
  {
    (*(void (**)(_QWORD, uint64_t (****)()))(**(_QWORD **)(*(_QWORD *)(v11 + 8) + 8) + 592))(*(_QWORD *)(*(_QWORD *)(v11 + 8) + 8), &v14);
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayer,(WTF::DestructionThread)1>(*(unsigned __int8 **)v11);
  }
  result = v14;
  v14 = 0;
  if (result)
  {
    v9 = *result;
    return (uint64_t (***)())v9[1]();
  }
  return result;
}

- (_QWORD)resourceLoader:didCancelLoadingRequest:
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v18[4];

  v2 = (_QWORD *)result[1];
  v1 = result[2];
  ++WebCore::ScriptDisallowedScope::s_count;
  v3 = v2[35];
  v4 = v2[36];
  v18[0] = "MediaPlayerPrivateAVFoundationObjC";
  v18[1] = 35;
  v18[2] = "didCancelLoadingRequest";
  v18[3] = v4;
  if (*(_BYTE *)(v3 + 12))
    result = (_QWORD *)WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)&WebCore::LogMedia, 0, (WTF::Logger::LogSiteIdentifier *)v18);
  v5 = v2[69];
  if (v5)
  {
    v6 = *(_DWORD *)(v5 - 8);
    v7 = (~(v1 << 32) + v1) ^ ((unint64_t)(~(v1 << 32) + v1) >> 22);
    v8 = 9 * ((v7 + ~(v7 << 13)) ^ ((v7 + ~(v7 << 13)) >> 8));
    v9 = (v8 ^ (v8 >> 15)) + ~((v8 ^ (v8 >> 15)) << 27);
    v10 = v6 & ((v9 >> 31) ^ v9);
    v11 = *(_QWORD *)(v5 + 16 * v10);
    if (v11 == v1)
    {
LABEL_8:
      v13 = *(_QWORD *)(v5 + 16 * v10 + 8);
      if (v13)
      {
        v14 = (unsigned int *)(v13 + 8);
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 + 1, v14));
        v16 = v2[147];
        v17 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
        *v17 = &off_1E3204DD8;
        v17[1] = v13;
        v18[0] = v17;
        (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v16 + 16))(v16, v18);
        result = (_QWORD *)v18[0];
        v18[0] = 0;
        if (result)
          result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 8))(result);
      }
    }
    else
    {
      v12 = 1;
      while (v11)
      {
        v10 = ((_DWORD)v10 + v12) & v6;
        v11 = *(_QWORD *)(v5 + 16 * v10);
        ++v12;
        if (v11 == v1)
          goto LABEL_8;
      }
    }
  }
  --WebCore::ScriptDisallowedScope::s_count;
  return result;
}

- (uint64_t)resourceLoader:didCancelLoadingRequest:
{
  const void *v3;
  uint64_t v4;

  *(_QWORD *)this = &off_1E3205198;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v4 + 48));
  return WTF::fastFree(this, a2);
}

@end
