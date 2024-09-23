@implementation WebTextIteratorPrivate

- (void).cxx_destruct
{
  unsigned __int16 *m_buffer;
  TextIterator *value;
  WTF *v5;
  void *v6;

  m_buffer = self->_upconvertedText.m_buffer;
  if (m_buffer)
  {
    self->_upconvertedText.m_buffer = 0;
    self->_upconvertedText.m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, (void *)a2);
  }
  value = self->_textIterator.__ptr_.__value_;
  self->_textIterator.__ptr_.__value_ = 0;
  if (value)
  {
    v5 = (WTF *)MEMORY[0x1D82A4310](value, a2);
    WTF::fastFree(v5, v6);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
