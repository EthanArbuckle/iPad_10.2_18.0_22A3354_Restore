@implementation WebScriptCallFramePrivate

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WebScriptCallFramePrivate;
  -[WebScriptCallFramePrivate dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  StringImpl *m_ptr;

  m_ptr = self->functionName.m_impl.m_ptr;
  self->functionName.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, (StringImpl *)a2);
    else
      *(_DWORD *)m_ptr -= 2;
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
