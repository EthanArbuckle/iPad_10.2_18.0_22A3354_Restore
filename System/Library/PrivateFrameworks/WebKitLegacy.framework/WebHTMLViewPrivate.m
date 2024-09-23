@implementation WebHTMLViewPrivate

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)WebHTMLViewPrivate;
    -[WebHTMLViewPrivate dealloc](&v4, sel_dealloc);
  }
}

- (void)clear
{
  void *m_ptr;
  void *v4;
  void *v5;
  void *v6;

  m_ptr = self->mouseDownEvent.m_ptr;
  self->mouseDownEvent.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->keyDownEvent.m_ptr;
  self->keyDownEvent.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->pluginController.m_ptr;
  self->pluginController.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->dataSource.m_ptr;
  self->dataSource.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  self->layerHostingView = 0;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  m_ptr = self->dataSource.m_ptr;
  self->dataSource.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->pageRects.m_ptr;
  self->pageRects.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->pluginController.m_ptr;
  self->pluginController.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->keyDownEvent.m_ptr;
  self->keyDownEvent.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  v7 = self->mouseDownEvent.m_ptr;
  self->mouseDownEvent.m_ptr = 0;
  if (v7)
    CFRelease(v7);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  return self;
}

@end
