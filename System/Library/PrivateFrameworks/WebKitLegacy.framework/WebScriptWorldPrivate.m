@implementation WebScriptWorldPrivate

- (void).cxx_destruct
{
  DOMWrapperWorld *m_ptr;
  WTF *v4;
  void *v5;

  m_ptr = self->world.m_ptr;
  self->world.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 1)
    {
      v4 = (WTF *)MEMORY[0x1D82A4B08]();
      WTF::fastFree(v4, v5);
    }
    else
    {
      --*(_DWORD *)m_ptr;
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
