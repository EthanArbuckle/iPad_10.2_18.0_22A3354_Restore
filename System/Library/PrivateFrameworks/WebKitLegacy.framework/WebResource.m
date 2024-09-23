@implementation WebResource

- (WebResource)init
{
  WebResource *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WebResource;
  v2 = -[WebResource init](&v4, sel_init);
  if (v2)
    v2->_private = objc_alloc_init(WebResourcePrivate);
  return v2;
}

- (WebResource)initWithData:(NSData *)data URL:(NSURL *)URL MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)textEncodingName frameName:(NSString *)frameName
{
  uint64_t v8;

  LOBYTE(v8) = 1;
  return (WebResource *)-[WebResource _initWithData:URL:MIMEType:textEncodingName:frameName:response:copyData:](self, "_initWithData:URL:MIMEType:textEncodingName:frameName:response:copyData:", data, URL, MIMEType, textEncodingName, frameName, 0, v8);
}

- (WebResource)initWithCoder:(id)a3
{
  WebResource *v4;
  uint64_t v5;
  WebCore::FragmentedSharedBuffer *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  NSData *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  StringImpl *v16;
  CFTypeRef v17;
  StringImpl *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  WebResourcePrivate *v26;
  _DWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int *v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;
  WTF *v35;
  void *v37;
  _DWORD *v38;
  _QWORD v40[17];
  char v41;
  CFTypeRef cf;
  char v43;
  WTF::StringImpl *v44;
  WTF::StringImpl *v45;
  WTF::StringImpl *v46;
  WTF::StringImpl *v47;
  uint64_t v48;
  uint64_t v49;
  _DWORD *v50;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)WebResource;
  v4 = -[WebResource init](&v51, sel_init);
  if (!v4)
    return v4;
  v5 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("WebResourceData"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (WebCore::FragmentedSharedBuffer *)v5;
  else
    v6 = 0;
  v7 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("WebResourceURL"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v7 = 0;
  v8 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("WebResourceMIMEType"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v8 = 0;
  v9 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("WebResourceTextEncodingName"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v9 = 0;
  v10 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("WebResourceFrameName"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v10 = 0;
  v11 = (const void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("WebResourceResponse"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v11 = 0;
  WebCore::FragmentedSharedBuffer::create(v6, v12);
  v13 = WTF::fastMalloc((WTF *)0x38);
  MEMORY[0x1D82A42EC](v13, v40);
  v48 = v13;
  WTF::Ref<WebCore::FragmentedSharedBuffer,WTF::RawPtrTraits<WebCore::FragmentedSharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::FragmentedSharedBuffer>>::~Ref(v40, v14);
  v15 = v48;
  v48 = 0;
  v49 = v15;
  MEMORY[0x1D82A38F0](&v47, v7);
  MEMORY[0x1D82A3998](&v46, v8);
  MEMORY[0x1D82A3998](&v45, v9);
  MEMORY[0x1D82A3998](&v44, v10);
  WebCore::ResourceResponseBase::ResourceResponseBase((WebCore::ResourceResponseBase *)v40);
  cf = v11;
  if (v11)
    CFRetain(v11);
  v43 = 0;
  v41 = v41 & 0xF0 | (v11 == 0);
  WebCore::ArchiveResource::create();
  v17 = cf;
  cf = 0;
  if (v17)
    CFRelease(v17);
  WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v40, v16);
  v19 = v44;
  v44 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
    {
      WTF::StringImpl::destroy(v19, v18);
      v20 = v45;
      v45 = 0;
      if (!v20)
        goto LABEL_27;
      goto LABEL_25;
    }
    *(_DWORD *)v19 -= 2;
  }
  v20 = v45;
  v45 = 0;
  if (!v20)
  {
LABEL_27:
    v21 = v46;
    v46 = 0;
    if (!v21)
      goto LABEL_32;
    goto LABEL_30;
  }
LABEL_25:
  if (*(_DWORD *)v20 != 2)
  {
    *(_DWORD *)v20 -= 2;
    goto LABEL_27;
  }
  WTF::StringImpl::destroy(v20, v18);
  v21 = v46;
  v46 = 0;
  if (!v21)
    goto LABEL_32;
LABEL_30:
  if (*(_DWORD *)v21 == 2)
  {
    WTF::StringImpl::destroy(v21, v18);
    v22 = v47;
    v47 = 0;
    if (!v22)
      goto LABEL_37;
    goto LABEL_35;
  }
  *(_DWORD *)v21 -= 2;
LABEL_32:
  v22 = v47;
  v47 = 0;
  if (!v22)
  {
LABEL_37:
    v23 = v49;
    v49 = 0;
    if (!v23)
      goto LABEL_42;
    goto LABEL_40;
  }
LABEL_35:
  if (*(_DWORD *)v22 != 2)
  {
    *(_DWORD *)v22 -= 2;
    goto LABEL_37;
  }
  WTF::StringImpl::destroy(v22, v18);
  v23 = v49;
  v49 = 0;
  if (!v23)
    goto LABEL_42;
  do
  {
LABEL_40:
    v24 = __ldaxr((unsigned int *)v23);
    v25 = v24 - 1;
  }
  while (__stlxr(v25, (unsigned int *)v23));
  if (!v25)
  {
    atomic_store(1u, (unsigned int *)v23);
    v28 = *(unsigned int *)(v23 + 20);
    if ((_DWORD)v28)
    {
      v29 = *(_QWORD *)(v23 + 8);
      v30 = v29 + 16 * v28;
      do
      {
        v31 = *(unsigned int **)(v29 + 8);
        *(_QWORD *)(v29 + 8) = 0;
        if (v31)
        {
          do
          {
            v32 = __ldaxr(v31);
            v33 = v32 - 1;
          }
          while (__stlxr(v33, v31));
          if (!v33)
          {
            atomic_store(1u, v31);
            v34 = v31[6];
            if ((_DWORD)v34 != -1)
              ((void (*)(_QWORD *, unsigned int *))off_1E9D6E8C0[v34])(v40, v31 + 2);
            v31[6] = -1;
            WTF::fastFree((WTF *)v31, v18);
          }
        }
        v29 += 16;
      }
      while (v29 != v30);
    }
    v35 = *(WTF **)(v23 + 8);
    if ((WTF *)(v23 + 24) != v35 && v35 != 0)
    {
      *(_QWORD *)(v23 + 8) = 0;
      *(_DWORD *)(v23 + 16) = 0;
      WTF::fastFree(v35, v18);
    }
    WTF::fastFree((WTF *)v23, v18);
    WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v48, v37);
    if (v50)
      goto LABEL_43;
    goto LABEL_62;
  }
LABEL_42:
  WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v48, v18);
  if (v50)
  {
LABEL_43:
    v26 = [WebResourcePrivate alloc];
    v40[0] = v50;
    v50 = 0;
    v4->_private = -[WebResourcePrivate initWithCoreResource:](v26, "initWithCoreResource:", v40, 0);
    v27 = (_DWORD *)v40[0];
    v40[0] = 0;
    if (v27)
    {
      if (v27[2] == 1)
        (*(void (**)(_DWORD *))(*(_QWORD *)v27 + 8))(v27);
      else
        --v27[2];
    }
    goto LABEL_63;
  }
LABEL_62:

  v4 = 0;
LABEL_63:
  v38 = v50;
  v50 = 0;
  if (v38)
  {
    if (v38[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v38 + 8))(v38);
    else
      --v38[2];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t *m_ptr;
  WebCore::FragmentedSharedBuffer *v5;
  const void *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  WebCore::SharedBuffer *v12;
  const void *v13;

  m_ptr = (uint64_t *)self->_private->coreResource.m_ptr;
  if (!m_ptr)
  {
    v6 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    goto LABEL_11;
  }
  v5 = (WebCore::FragmentedSharedBuffer *)WebCore::SubstituteResource::data(m_ptr[39], (void *)a2);
  WebCore::FragmentedSharedBuffer::makeContiguous(v5);
  WebCore::SharedBuffer::createNSData(v12);
  v6 = v13;
  v13 = 0;
  WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v12, v7);
  v8 = WTF::URL::operator NSURL *();
  if (m_ptr[40])
  {
    v9 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (m_ptr[41])
      goto LABEL_4;
LABEL_8:
    v10 = &stru_1E9D6EC48;
    if (m_ptr[42])
      goto LABEL_5;
LABEL_9:
    v11 = &stru_1E9D6EC48;
    goto LABEL_10;
  }
  v9 = &stru_1E9D6EC48;
  if (!m_ptr[41])
    goto LABEL_8;
LABEL_4:
  v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
  if (!m_ptr[42])
    goto LABEL_9;
LABEL_5:
  v11 = (const __CFString *)WTF::StringImpl::operator NSString *();
LABEL_10:
  m_ptr = (uint64_t *)WebCore::ResourceResponse::nsURLResponse((WebCore::ResourceResponse *)(m_ptr + 7));
LABEL_11:
  objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("WebResourceData"));
  objc_msgSend(a3, "encodeObject:forKey:", v8, CFSTR("WebResourceURL"));
  objc_msgSend(a3, "encodeObject:forKey:", v9, CFSTR("WebResourceMIMEType"));
  objc_msgSend(a3, "encodeObject:forKey:", v10, CFSTR("WebResourceTextEncodingName"));
  objc_msgSend(a3, "encodeObject:forKey:", v11, CFSTR("WebResourceFrameName"));
  objc_msgSend(a3, "encodeObject:forKey:", m_ptr, CFSTR("WebResourceResponse"));
  if (v6)
    CFRelease(v6);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebResource;
  -[WebResource dealloc](&v3, sel_dealloc);
}

- (NSData)data
{
  ArchiveResource *m_ptr;
  WebCore::FragmentedSharedBuffer *v3;
  NSData *v4;
  void *v5;
  WebCore::SharedBuffer *v7;
  CFTypeRef cf;

  m_ptr = self->_private->coreResource.m_ptr;
  if (!m_ptr)
    return 0;
  v3 = (WebCore::FragmentedSharedBuffer *)WebCore::SubstituteResource::data(*((_QWORD *)m_ptr + 39), (void *)a2);
  WebCore::FragmentedSharedBuffer::makeContiguous(v3);
  WebCore::SharedBuffer::createNSData(v7);
  v4 = (id)CFMakeCollectable(cf);
  cf = 0;
  WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v7, v5);
  return v4;
}

- (NSURL)URL
{
  if (self->_private->coreResource.m_ptr)
    return (NSURL *)WTF::URL::operator NSURL *();
  else
    return 0;
}

- (NSString)MIMEType
{
  ArchiveResource *m_ptr;

  m_ptr = self->_private->coreResource.m_ptr;
  if (!m_ptr)
    return 0;
  if (*((_QWORD *)m_ptr + 40))
    return (NSString *)WTF::StringImpl::operator NSString *();
  return (NSString *)&stru_1E9D6EC48;
}

- (NSString)textEncodingName
{
  ArchiveResource *m_ptr;

  m_ptr = self->_private->coreResource.m_ptr;
  if (!m_ptr)
    return 0;
  if (*((_QWORD *)m_ptr + 41))
    return (NSString *)WTF::StringImpl::operator NSString *();
  return (NSString *)&stru_1E9D6EC48;
}

- (NSString)frameName
{
  ArchiveResource *m_ptr;

  m_ptr = self->_private->coreResource.m_ptr;
  if (!m_ptr)
    return 0;
  if (*((_QWORD *)m_ptr + 42))
    return (NSString *)WTF::StringImpl::operator NSString *();
  return (NSString *)&stru_1E9D6EC48;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@>"), NSStringFromClass(v4), -[WebResource URL](self, "URL"));
}

- (id)_initWithCoreResource:(void *)a3
{
  WebResource *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WebResource;
  v4 = -[WebResource init](&v6, sel_init);
  if (v4)
    v4->_private = -[WebResourcePrivate initWithCoreResource:]([WebResourcePrivate alloc], "initWithCoreResource:", a3);
  return v4;
}

- (NakedRef<WebCore::ArchiveResource>)_coreResource
{
  return (NakedRef<WebCore::ArchiveResource>)self->_private->coreResource.m_ptr;
}

- (void)_ignoreWhenUnarchiving
{
  ArchiveResource *m_ptr;

  m_ptr = self->_private->coreResource.m_ptr;
  if (m_ptr)
    *((_BYTE *)m_ptr + 352) = 1;
}

- (id)_initWithData:(id)a3 URL:(id)a4 MIMEType:(id)a5 textEncodingName:(id)a6 frameName:(id)a7 response:(id)a8 copyData:(BOOL)a9
{
  WebResource *v15;
  NSData *v16;
  WebResource *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  StringImpl *v21;
  CFTypeRef v22;
  StringImpl *v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  WTF::StringImpl *v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  WebResourcePrivate *v31;
  _DWORD *v32;
  _DWORD *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int *v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  WTF *v42;
  void *v44;
  _QWORD v45[17];
  char v46;
  CFTypeRef cf;
  char v48;
  WTF::StringImpl *v49;
  WTF::StringImpl *v50;
  WTF::StringImpl *v51;
  WTF::StringImpl *v52;
  uint64_t v53;
  uint64_t v54;
  _DWORD *v55;
  objc_super v56;

  v56.receiver = self;
  v56.super_class = (Class)WebResource;
  v15 = -[WebResource init](&v56, sel_init);
  v17 = v15;
  if (v15)
  {
    if (!a3 || !a4 || !a5)
    {

      return 0;
    }
    if (a9)
      a3 = (id)objc_msgSend(a3, "copy");
    WebCore::FragmentedSharedBuffer::create((WebCore::FragmentedSharedBuffer *)a3, v16);
    v18 = WTF::fastMalloc((WTF *)0x38);
    MEMORY[0x1D82A42EC](v18, v45);
    v53 = v18;
    WTF::Ref<WebCore::FragmentedSharedBuffer,WTF::RawPtrTraits<WebCore::FragmentedSharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::FragmentedSharedBuffer>>::~Ref(v45, v19);
    v20 = v53;
    v53 = 0;
    v54 = v20;
    MEMORY[0x1D82A38F0](&v52, a4);
    MEMORY[0x1D82A3998](&v51, a5);
    MEMORY[0x1D82A3998](&v50, a6);
    MEMORY[0x1D82A3998](&v49, a7);
    WebCore::ResourceResponseBase::ResourceResponseBase((WebCore::ResourceResponseBase *)v45);
    cf = a8;
    if (a8)
      CFRetain(a8);
    v48 = 0;
    v46 = v46 & 0xF0 | (a8 == 0);
    WebCore::ArchiveResource::create();
    v22 = cf;
    cf = 0;
    if (v22)
      CFRelease(v22);
    WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v45, v21);
    v24 = v49;
    v49 = 0;
    if (v24)
    {
      if (*(_DWORD *)v24 == 2)
      {
        WTF::StringImpl::destroy(v24, v23);
        v25 = v50;
        v50 = 0;
        if (!v25)
          goto LABEL_20;
LABEL_18:
        if (*(_DWORD *)v25 == 2)
        {
          WTF::StringImpl::destroy(v25, v23);
          v26 = v51;
          v51 = 0;
          if (!v26)
            goto LABEL_25;
LABEL_23:
          if (*(_DWORD *)v26 == 2)
          {
            WTF::StringImpl::destroy(v26, v23);
            v27 = v52;
            v52 = 0;
            if (!v27)
              goto LABEL_30;
LABEL_28:
            if (*(_DWORD *)v27 == 2)
            {
              WTF::StringImpl::destroy(v27, v23);
              v28 = v54;
              v54 = 0;
              if (!v28)
                goto LABEL_35;
              do
              {
LABEL_33:
                v29 = __ldaxr((unsigned int *)v28);
                v30 = v29 - 1;
              }
              while (__stlxr(v30, (unsigned int *)v28));
              if (!v30)
              {
                atomic_store(1u, (unsigned int *)v28);
                v35 = *(unsigned int *)(v28 + 20);
                if ((_DWORD)v35)
                {
                  v36 = *(_QWORD *)(v28 + 8);
                  v37 = v36 + 16 * v35;
                  do
                  {
                    v38 = *(unsigned int **)(v36 + 8);
                    *(_QWORD *)(v36 + 8) = 0;
                    if (v38)
                    {
                      do
                      {
                        v39 = __ldaxr(v38);
                        v40 = v39 - 1;
                      }
                      while (__stlxr(v40, v38));
                      if (!v40)
                      {
                        atomic_store(1u, v38);
                        v41 = v38[6];
                        if ((_DWORD)v41 != -1)
                          ((void (*)(_QWORD *, unsigned int *))off_1E9D6E8C0[v41])(v45, v38 + 2);
                        v38[6] = -1;
                        WTF::fastFree((WTF *)v38, v23);
                      }
                    }
                    v36 += 16;
                  }
                  while (v36 != v37);
                }
                v42 = *(WTF **)(v28 + 8);
                if ((WTF *)(v28 + 24) != v42 && v42 != 0)
                {
                  *(_QWORD *)(v28 + 8) = 0;
                  *(_DWORD *)(v28 + 16) = 0;
                  WTF::fastFree(v42, v23);
                }
                WTF::fastFree((WTF *)v28, v23);
                WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v53, v44);
                if (!a9)
                {
LABEL_38:
                  if (v55)
                  {
                    v31 = [WebResourcePrivate alloc];
                    v45[0] = v55;
                    v55 = 0;
                    v17->_private = -[WebResourcePrivate initWithCoreResource:](v31, "initWithCoreResource:", v45);
                    v32 = (_DWORD *)v45[0];
                    v45[0] = 0;
                    if (v32)
                    {
                      if (v32[2] == 1)
                      {
                        (*(void (**)(_DWORD *))(*(_QWORD *)v32 + 8))(v32);
                        v33 = v55;
                        v55 = 0;
                        if (!v33)
                          return v17;
                      }
                      else
                      {
                        --v32[2];
                        v33 = v55;
                        v55 = 0;
                        if (!v33)
                          return v17;
                      }
LABEL_45:
                      if (v33[2] == 1)
                        (*(void (**)(_DWORD *))(*(_QWORD *)v33 + 8))(v33);
                      else
                        --v33[2];
                      return v17;
                    }
                  }
                  else
                  {

                    v17 = 0;
                  }
                  v33 = v55;
                  v55 = 0;
                  if (!v33)
                    return v17;
                  goto LABEL_45;
                }
LABEL_36:
                if (a3)
                  CFRelease(a3);
                goto LABEL_38;
              }
LABEL_35:
              WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v53, v23);
              if (!a9)
                goto LABEL_38;
              goto LABEL_36;
            }
            *(_DWORD *)v27 -= 2;
LABEL_30:
            v28 = v54;
            v54 = 0;
            if (!v28)
              goto LABEL_35;
            goto LABEL_33;
          }
          *(_DWORD *)v26 -= 2;
LABEL_25:
          v27 = v52;
          v52 = 0;
          if (!v27)
            goto LABEL_30;
          goto LABEL_28;
        }
        *(_DWORD *)v25 -= 2;
LABEL_20:
        v26 = v51;
        v51 = 0;
        if (!v26)
          goto LABEL_25;
        goto LABEL_23;
      }
      *(_DWORD *)v24 -= 2;
    }
    v25 = v50;
    v50 = 0;
    if (!v25)
      goto LABEL_20;
    goto LABEL_18;
  }
  return v17;
}

- (id)_initWithData:(id)a3 URL:(id)a4 response:(id)a5
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  return -[WebResource _initWithData:URL:MIMEType:textEncodingName:frameName:response:copyData:](self, "_initWithData:URL:MIMEType:textEncodingName:frameName:response:copyData:", a3, a4, objc_msgSend(a5, "MIMEType"), objc_msgSend(a5, "textEncodingName"), 0, a5, v6);
}

- (id)_suggestedFilename
{
  ArchiveResource *m_ptr;
  StringImpl *v3;
  void *v4;
  WTF::StringImpl *v6;

  m_ptr = self->_private->coreResource.m_ptr;
  if (!m_ptr)
    return 0;
  WebCore::ResourceResponseBase::suggestedFilename((WebCore::ResourceResponseBase *)((char *)m_ptr + 56));
  if (!v6)
    return &stru_1E9D6EC48;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v6 == 2)
  {
    WTF::StringImpl::destroy(v6, v3);
    return v4;
  }
  else
  {
    *(_DWORD *)v6 -= 2;
    return v4;
  }
}

- (id)_response
{
  ArchiveResource *m_ptr;
  id result;

  m_ptr = self->_private->coreResource.m_ptr;
  if (!m_ptr)
    return (id)(id)CFMakeCollectable(objc_alloc_init(MEMORY[0x1E0C92C88]));
  result = (id)WebCore::ResourceResponse::nsURLResponse((WebCore::ResourceResponse *)((char *)m_ptr + 56));
  if (!result)
    return (id)(id)CFMakeCollectable(objc_alloc_init(MEMORY[0x1E0C92C88]));
  return result;
}

- (id)_stringValue
{
  WebResource *v2;
  ArchiveResource *m_ptr;
  void *v4;
  ArchiveResource *v5;
  uint64_t v6;
  unsigned int v7;
  StringImpl *v8;
  const __CFString *v9;
  PAL *v10;
  uint64_t v11;
  __int16 v12;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  WTF *v24;
  uint64_t v26;
  uint64_t v27;
  WTF *v28;
  WebCore::SharedBuffer *v29;
  PAL *v30;
  __int128 v31;
  __int16 v32;
  void *v33;
  __int128 v34;
  __int16 v35;
  char v36;

  v2 = self;
  v33 = &unk_1E9D6C1D8;
  m_ptr = self->_private->coreResource.m_ptr;
  if (!m_ptr
    || (self = (WebResource *)PAL::TextEncoding::TextEncoding((PAL::TextEncoding *)&v30, (const WTF::String *)((char *)m_ptr + 328)), v35 = v32, v34 = v31, !*((_QWORD *)&v31 + 1)))
  {
    v11 = PAL::WindowsLatin1Encoding((PAL *)self);
    v12 = *(_WORD *)(v11 + 24);
    v34 = *(_OWORD *)(v11 + 8);
    v35 = v12;
    v5 = v2->_private->coreResource.m_ptr;
    if (v5)
      goto LABEL_4;
    return &stru_1E9D6EC48;
  }
  v5 = v2->_private->coreResource.m_ptr;
  if (!v5)
    return &stru_1E9D6EC48;
LABEL_4:
  v6 = *((_QWORD *)v5 + 39);
  WebCore::SubstituteResource::data(v6, v4);
  do
    v7 = __ldaxr((unsigned int *)v6);
  while (__stlxr(v7 + 1, (unsigned int *)v6));
  WebCore::FragmentedSharedBuffer::makeContiguous((WebCore::FragmentedSharedBuffer *)v6);
  WebCore::SharedBuffer::data(v29);
  v36 = 0;
  PAL::TextEncoding::decode();
  if (v30)
  {
    v9 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v10 = v30;
    v30 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
        WTF::StringImpl::destroy(v10, v8);
      else
        *(_DWORD *)v10 -= 2;
    }
  }
  else
  {
    v30 = 0;
    v9 = &stru_1E9D6EC48;
  }
  WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v29, v8);
  do
  {
    v15 = __ldaxr((unsigned int *)v6);
    v16 = v15 - 1;
  }
  while (__stlxr(v16, (unsigned int *)v6));
  if (v16)
    return (id)v9;
  atomic_store(1u, (unsigned int *)v6);
  v17 = *(unsigned int *)(v6 + 20);
  if ((_DWORD)v17)
  {
    v18 = *(_QWORD *)(v6 + 8);
    v19 = v18 + 16 * v17;
    do
    {
      v20 = *(unsigned int **)(v18 + 8);
      *(_QWORD *)(v18 + 8) = 0;
      if (v20)
      {
        do
        {
          v21 = __ldaxr(v20);
          v22 = v21 - 1;
        }
        while (__stlxr(v22, v20));
        if (!v22)
        {
          v26 = v18;
          v27 = v19;
          atomic_store(1u, v20);
          v28 = (WTF *)v20;
          v23 = v20[6];
          if ((_DWORD)v23 != -1)
            ((void (*)(PAL **, unsigned int *))off_1E9D6E8C0[v23])(&v30, v20 + 2);
          *((_DWORD *)v28 + 6) = -1;
          WTF::fastFree(v28, v14);
          v18 = v26;
          v19 = v27;
        }
      }
      v18 += 16;
    }
    while (v18 != v19);
  }
  v24 = *(WTF **)(v6 + 8);
  if ((WTF *)(v6 + 24) != v24 && v24 != 0)
  {
    *(_QWORD *)(v6 + 8) = 0;
    *(_DWORD *)(v6 + 16) = 0;
    WTF::fastFree(v24, v14);
  }
  WTF::fastFree((WTF *)v6, v14);
  return (id)v9;
}

@end
