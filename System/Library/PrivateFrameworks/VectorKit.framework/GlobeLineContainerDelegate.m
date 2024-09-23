@implementation GlobeLineContainerDelegate

- (GlobeLineContainerDelegate)initWithRenderer:(void *)a3
{
  self->_renderer = a3;
  return self;
}

- (void)lineContainerNeedsDisplay:(id)a3
{
  uint64_t v3;
  char v4;

  v3 = **((_QWORD **)self->_renderer + 11);
  if (v3)
  {
    v4 = 7;
    md::MapEngine::setNeedsTick(v3, &v4);
  }
}

@end
