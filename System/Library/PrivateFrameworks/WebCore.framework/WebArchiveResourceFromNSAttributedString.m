@implementation WebArchiveResourceFromNSAttributedString

- (WebArchiveResourceFromNSAttributedString)initWithData:(id)a3 URL:(id)a4 MIMEType:(id)a5 textEncodingName:(id)a6 frameName:(id)a7
{
  WebArchiveResourceFromNSAttributedString *v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  const void *v19;
  CFIndex v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  WTF::StringImpl *v24;
  uint64_t v25;
  ArchiveResource *m_ptr;
  WTF::StringImpl *v27;
  CFTypeRef v28;
  WTF::StringImpl *v29;
  WTF::StringImpl *v30;
  WTF::StringImpl *v31;
  WTF::StringImpl *v32;
  WTF::StringImpl *v33;
  uint64_t v34;
  unsigned int v35;
  unsigned int v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int *v41;
  unsigned int v42;
  unsigned int v43;
  uint64_t v44;
  WTF *v45;
  WTF::StringImpl *v47;
  WTF::StringImpl *v48[5];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  char v54;
  char v55;
  __int16 v56;
  char v57;
  int64x2_t v58;
  int64x2_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  int64x2_t v63;
  uint64_t v64;
  char v65;
  __int16 v66;
  char v67;
  CFTypeRef cf;
  char v69;
  WTF::StringImpl *v70;
  WTF::StringImpl *v71;
  WTF::StringImpl *v72;
  _QWORD v73[5];
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  objc_super v77;

  v77.receiver = self;
  v77.super_class = (Class)WebArchiveResourceFromNSAttributedString;
  v12 = -[WebArchiveResourceFromNSAttributedString init](&v77, sel_init);
  if (!v12)
    return v12;
  if (!a3 || !a4 || !a5)
  {
LABEL_44:

    return 0;
  }
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("application/octet-stream")))
  {
    MEMORY[0x19AEA5508](v73, objc_msgSend(a4, "pathExtension"));
    v13 = v73[0];
    if (v73[0])
    {
      v14 = *(_QWORD *)(v73[0] + 8);
      v13 = *(_DWORD *)(v73[0] + 4);
      v15 = ((unint64_t)*(unsigned int *)(v73[0] + 16) >> 2) & 1;
    }
    else
    {
      v14 = 0;
      v15 = 1;
    }
    WebCore::MIMETypeRegistry::mimeTypeForExtension(v14, v13 | (v15 << 32), v48);
    v17 = (WTF::StringImpl *)v73[0];
    v73[0] = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2)
        WTF::StringImpl::destroy(v17, v16);
      else
        *(_DWORD *)v17 -= 2;
    }
    v18 = v48[0];
    if (v48[0])
    {
      if (*((_DWORD *)v48[0] + 1))
      {
        a5 = (id)WTF::StringImpl::operator NSString *();
        v18 = v48[0];
        v48[0] = 0;
        if (!v18)
          goto LABEL_18;
      }
      else
      {
        v48[0] = 0;
      }
      if (*(_DWORD *)v18 == 2)
        WTF::StringImpl::destroy(v18, v16);
      else
        *(_DWORD *)v18 -= 2;
    }
  }
LABEL_18:
  v19 = (const void *)objc_msgSend(a3, "copy");
  v20 = WTF::fastMalloc((WTF *)0x38);
  *(_DWORD *)v20 = 1;
  *(_QWORD *)(v20 + 8) = v20 + 24;
  *(_QWORD *)(v20 + 16) = 1;
  *(_BYTE *)(v20 + 40) = 0;
  *(_QWORD *)(v20 + 48) = 0;
  WebCore::FragmentedSharedBuffer::append(v20, v19);
  v48[0] = (WTF::StringImpl *)v20;
  v21 = WTF::fastMalloc((WTF *)0x38);
  v74 = WebCore::SharedBuffer::SharedBuffer(v21, (uint64_t *)v48);
  WTF::Ref<WebCore::FragmentedSharedBuffer,WTF::RawPtrTraits<WebCore::FragmentedSharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::FragmentedSharedBuffer>>::~Ref((uint64_t *)v48, v22);
  v23 = v74;
  v74 = 0;
  v75 = v23;
  MEMORY[0x19AEA52E0](v73, a4);
  MEMORY[0x19AEA5508](&v72, a5);
  MEMORY[0x19AEA5508](&v71, a6);
  MEMORY[0x19AEA5508](&v70, a7);
  v48[0] = 0;
  WTF::URL::invalidate((WTF::URL *)v48);
  v55 = 0;
  v56 = 0;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0;
  v58 = vdupq_n_s64(0x7FF8000000000000uLL);
  v59 = v58;
  v60 = 0;
  v61 = 0;
  v63 = v58;
  v62 = 0x8000000000000000;
  v64 = 0x7FF8000000000000;
  v65 &= 0xF0u;
  v66 &= 0xC000u;
  v67 = v67 & 0xF8 | 2;
  cf = 0;
  v69 = 0;
  v57 = v57 & 0xC0 | 5;
  v47 = 0;
  WebCore::ArchiveResource::create((uint64_t)&v75, (uint64_t)v73, (_DWORD **)&v72, (_DWORD **)&v71, (_DWORD **)&v70, (WebCore::ResourceResponseBase *)v48, (_DWORD **)&v47, &v76);
  v25 = v76;
  v76 = 0;
  m_ptr = v12->resource.m_ptr;
  v12->resource.m_ptr = (ArchiveResource *)v25;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 2) == 1)
    {
      (*(void (**)(ArchiveResource *))(*(_QWORD *)m_ptr + 8))(m_ptr);
      v76 = 0;
    }
    else
    {
      --*((_DWORD *)m_ptr + 2);
    }
  }
  v27 = v47;
  v47 = 0;
  if (v27)
  {
    if (*(_DWORD *)v27 == 2)
      WTF::StringImpl::destroy(v27, v24);
    else
      *(_DWORD *)v27 -= 2;
  }
  v28 = cf;
  cf = 0;
  if (v28)
    CFRelease(v28);
  WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v48, v24);
  v30 = v70;
  v70 = 0;
  if (v30)
  {
    if (*(_DWORD *)v30 == 2)
      WTF::StringImpl::destroy(v30, v29);
    else
      *(_DWORD *)v30 -= 2;
  }
  v31 = v71;
  v71 = 0;
  if (v31)
  {
    if (*(_DWORD *)v31 == 2)
      WTF::StringImpl::destroy(v31, v29);
    else
      *(_DWORD *)v31 -= 2;
  }
  v32 = v72;
  v72 = 0;
  if (v32)
  {
    if (*(_DWORD *)v32 == 2)
      WTF::StringImpl::destroy(v32, v29);
    else
      *(_DWORD *)v32 -= 2;
  }
  v33 = (WTF::StringImpl *)v73[0];
  v73[0] = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 2)
      WTF::StringImpl::destroy(v33, v29);
    else
      *(_DWORD *)v33 -= 2;
  }
  v34 = v75;
  v75 = 0;
  if (v34)
  {
    do
    {
      v35 = __ldaxr((unsigned int *)v34);
      v36 = v35 - 1;
    }
    while (__stlxr(v36, (unsigned int *)v34));
    if (!v36)
    {
      atomic_store(1u, (unsigned int *)v34);
      v38 = *(unsigned int *)(v34 + 20);
      if ((_DWORD)v38)
      {
        v39 = *(_QWORD *)(v34 + 8);
        v40 = v39 + 16 * v38;
        do
        {
          v41 = *(unsigned int **)(v39 + 8);
          *(_QWORD *)(v39 + 8) = 0;
          if (v41)
          {
            do
            {
              v42 = __ldaxr(v41);
              v43 = v42 - 1;
            }
            while (__stlxr(v43, v41));
            if (!v43)
            {
              atomic_store(1u, v41);
              v44 = v41[6];
              if ((_DWORD)v44 != -1)
                ((void (*)(WTF::StringImpl **, unsigned int *))off_1E3283A88[v44])(v48, v41 + 2);
              v41[6] = -1;
              WTF::fastFree((WTF *)v41, v29);
            }
          }
          v39 += 16;
        }
        while (v39 != v40);
      }
      v45 = *(WTF **)(v34 + 8);
      if ((WTF *)(v34 + 24) != v45 && v45 != 0)
      {
        *(_QWORD *)(v34 + 8) = 0;
        *(_DWORD *)(v34 + 16) = 0;
        WTF::fastFree(v45, v29);
      }
      WTF::fastFree((WTF *)v34, v29);
    }
  }
  WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v74, v29);
  if (v19)
    CFRelease(v19);
  if (!v12->resource.m_ptr)
    goto LABEL_44;
  return v12;
}

- (id)MIMEType
{
  if (*((_QWORD *)self->resource.m_ptr + 40))
    return (id)WTF::StringImpl::operator NSString *();
  else
    return &stru_1E3487BC0;
}

- (id)URL
{
  return (id)WTF::URL::operator NSURL *();
}

- (void).cxx_destruct
{
  ArchiveResource *m_ptr;

  m_ptr = self->resource.m_ptr;
  self->resource.m_ptr = 0;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 2) == 1)
      (*(void (**)(ArchiveResource *))(*(_QWORD *)m_ptr + 8))(m_ptr);
    else
      --*((_DWORD *)m_ptr + 2);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
