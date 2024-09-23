@implementation WebResourcePrivate

- (WebResourcePrivate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebResourcePrivate;
  return -[WebResourcePrivate init](&v3, sel_init);
}

- (WebResourcePrivate)initWithCoreResource:(void *)a3
{
  WebResourcePrivate *v4;
  WebResourcePrivate *v5;
  ArchiveResource *v6;
  ArchiveResource *m_ptr;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebResourcePrivate;
  v4 = -[WebResourcePrivate init](&v9, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  v6 = *(ArchiveResource **)a3;
  *(_QWORD *)a3 = 0;
  m_ptr = v4->coreResource.m_ptr;
  v5->coreResource.m_ptr = v6;
  if (!m_ptr)
    return v5;
  if (*((_DWORD *)m_ptr + 2) != 1)
  {
    --*((_DWORD *)m_ptr + 2);
    return v5;
  }
  (*(void (**)(ArchiveResource *))(*(_QWORD *)m_ptr + 8))(m_ptr);
  return v5;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)WebResourcePrivate;
    -[WebResourcePrivate dealloc](&v4, sel_dealloc);
  }
}

- (void).cxx_destruct
{
  ArchiveResource *m_ptr;

  m_ptr = self->coreResource.m_ptr;
  self->coreResource.m_ptr = 0;
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
