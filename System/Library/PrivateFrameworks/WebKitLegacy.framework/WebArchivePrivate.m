@implementation WebArchivePrivate

- (WebArchivePrivate)init
{
  WebArchivePrivate *v2;
  WebArchivePrivate *v3;
  LegacyWebArchive *m_ptr;
  LegacyWebArchive *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WebArchivePrivate;
  v2 = -[WebArchivePrivate init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    WebCore::LegacyWebArchive::create((WebCore::LegacyWebArchive *)v2);
    m_ptr = v3->coreArchive.m_ptr;
    v3->coreArchive.m_ptr = v6;
    if (m_ptr)
    {
      if (*((_DWORD *)m_ptr + 2) == 1)
        (*(void (**)(LegacyWebArchive *))(*(_QWORD *)m_ptr + 8))(m_ptr);
      else
        --*((_DWORD *)m_ptr + 2);
    }
  }
  return v3;
}

- (WebArchivePrivate)initWithCoreArchive:(void *)a3
{
  WebArchivePrivate *v4;
  WebArchivePrivate *v5;
  LegacyWebArchive *v6;
  LegacyWebArchive *m_ptr;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebArchivePrivate;
  v4 = -[WebArchivePrivate init](&v9, sel_init);
  v5 = v4;
  if (v4 && (v6 = *(LegacyWebArchive **)a3) != 0)
  {
    *(_QWORD *)a3 = 0;
    m_ptr = v4->coreArchive.m_ptr;
    v5->coreArchive.m_ptr = v6;
    if (!m_ptr)
      return v5;
    if (*((_DWORD *)m_ptr + 2) != 1)
    {
      --*((_DWORD *)m_ptr + 2);
      return v5;
    }
    (*(void (**)(LegacyWebArchive *))(*(_QWORD *)m_ptr + 8))(m_ptr);
    return v5;
  }
  else
  {

    return 0;
  }
}

- (void)coreArchive
{
  return self->coreArchive.m_ptr;
}

- (void)setCoreArchive:(void *)a3
{
  LegacyWebArchive *v4;
  LegacyWebArchive *m_ptr;

  v4 = *(LegacyWebArchive **)a3;
  *(_QWORD *)a3 = 0;
  m_ptr = self->coreArchive.m_ptr;
  self->coreArchive.m_ptr = v4;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 2) == 1)
      (*(void (**)(LegacyWebArchive *))(*(_QWORD *)m_ptr + 8))(m_ptr);
    else
      --*((_DWORD *)m_ptr + 2);
  }
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)WebArchivePrivate;
    -[WebArchivePrivate dealloc](&v4, sel_dealloc);
  }
}

- (void).cxx_destruct
{
  LegacyWebArchive *m_ptr;
  void *v4;
  void *v5;
  void *v6;

  m_ptr = self->coreArchive.m_ptr;
  self->coreArchive.m_ptr = 0;
  if (!m_ptr)
  {
LABEL_4:
    v4 = self->cachedSubframeArchives.m_ptr;
    self->cachedSubframeArchives.m_ptr = 0;
    if (!v4)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (*((_DWORD *)m_ptr + 2) != 1)
  {
    --*((_DWORD *)m_ptr + 2);
    goto LABEL_4;
  }
  (*(void (**)(LegacyWebArchive *, SEL))(*(_QWORD *)m_ptr + 8))(m_ptr, a2);
  v4 = self->cachedSubframeArchives.m_ptr;
  self->cachedSubframeArchives.m_ptr = 0;
  if (v4)
LABEL_5:
    CFRelease(v4);
LABEL_6:
  v5 = self->cachedSubresources.m_ptr;
  self->cachedSubresources.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->cachedMainResource.m_ptr;
  self->cachedMainResource.m_ptr = 0;
  if (v6)
    CFRelease(v6);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
