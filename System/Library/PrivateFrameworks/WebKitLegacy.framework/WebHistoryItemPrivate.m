@implementation WebHistoryItemPrivate

- (void).cxx_destruct
{
  WTF *value;
  uint64_t v4;
  WTF::StringImpl **v5;
  uint64_t v6;
  WTF::StringImpl *v7;
  WTF *v8;
  HistoryItem *m_ptr;
  WTF *v10;
  void *v11;

  value = (WTF *)self->_redirectURLs.__ptr_.__value_;
  self->_redirectURLs.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = *((unsigned int *)value + 3);
    if ((_DWORD)v4)
    {
      v5 = *(WTF::StringImpl ***)value;
      v6 = 8 * v4;
      do
      {
        v7 = *v5;
        *v5 = 0;
        if (v7)
        {
          if (*(_DWORD *)v7 == 2)
            WTF::StringImpl::destroy(v7, (StringImpl *)a2);
          else
            *(_DWORD *)v7 -= 2;
        }
        ++v5;
        v6 -= 8;
      }
      while (v6);
    }
    v8 = *(WTF **)value;
    if (*(_QWORD *)value)
    {
      *(_QWORD *)value = 0;
      *((_DWORD *)value + 2) = 0;
      WTF::fastFree(v8, (void *)a2);
    }
    WTF::fastFree(value, (void *)a2);
  }
  m_ptr = self->_historyItem.m_ptr;
  self->_historyItem.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 1)
    {
      v10 = (WTF *)MEMORY[0x1D82A3F20]();
      WTF::fastFree(v10, v11);
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
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
