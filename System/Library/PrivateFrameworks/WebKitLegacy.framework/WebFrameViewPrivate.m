@implementation WebFrameViewPrivate

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->frameScrollView.m_ptr;
  self->frameScrollView.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
