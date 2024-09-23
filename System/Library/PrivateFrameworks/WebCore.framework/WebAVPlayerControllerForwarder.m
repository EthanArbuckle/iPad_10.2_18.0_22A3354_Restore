@implementation WebAVPlayerControllerForwarder

- (WebAVPlayerControllerForwarder)init
{
  WebAVPlayerControllerForwarder *v2;
  WebAVPlayerController *v3;
  void *m_ptr;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WebAVPlayerControllerForwarder;
  v2 = -[WebAVPlayerControllerForwarder init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(WebAVPlayerController);
    m_ptr = v2->_playerController.m_ptr;
    v2->_playerController.m_ptr = v3;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v2;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_playerController.m_ptr;
}

- (id)valueForKey:(id)a3
{
  return (id)objc_msgSend(-[WebAVPlayerControllerForwarder _forwardingTargetForKeyPath:](self, "_forwardingTargetForKeyPath:"), "valueForKey:", a3);
}

- (id)valueForKeyPath:(id)a3
{
  return (id)objc_msgSend(-[WebAVPlayerControllerForwarder _forwardingTargetForKeyPath:](self, "_forwardingTargetForKeyPath:"), "valueForKeyPath:", a3);
}

- (id)valueForUndefinedKey:(id)a3
{
  return (id)objc_msgSend(-[WebAVPlayerControllerForwarder _forwardingTargetForKeyPath:](self, "_forwardingTargetForKeyPath:"), "valueForUndefinedKey:", a3);
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  objc_msgSend(-[WebAVPlayerControllerForwarder _forwardingTargetForKeyPath:](self, "_forwardingTargetForKeyPath:", a4), "addObserver:forKeyPath:options:context:", a3, a4, a5, a6);
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
  objc_msgSend(-[WebAVPlayerControllerForwarder _forwardingTargetForKeyPath:](self, "_forwardingTargetForKeyPath:", a4), "removeObserver:forKeyPath:context:", a3, a4, a5);
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  objc_msgSend(-[WebAVPlayerControllerForwarder _forwardingTargetForKeyPath:](self, "_forwardingTargetForKeyPath:", a4), "removeObserver:forKeyPath:", a3, a4);
}

- (id)_forwardingTargetForKeyPath:(id)a3
{
  void *m_ptr;
  void *v6;
  objc_class *v7;
  objc_property_t *v8;
  uint64_t v9;
  unsigned int outCount;

  m_ptr = (void *)objc_msgSend(self->_playerController.m_ptr, "playerControllerProxy");
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(".")), "firstObject");
  if (objc_msgSend(v6, "length"))
  {
    outCount = 0;
    v7 = (objc_class *)objc_opt_class();
    v8 = class_copyPropertyList(v7, &outCount);
    if (outCount)
    {
      v9 = 0;
      while (!objc_msgSend(v6, "isEqualToString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(v8[v9]))))
      {
        if (++v9 >= (unint64_t)outCount)
          goto LABEL_8;
      }
      m_ptr = self->_playerController.m_ptr;
    }
LABEL_8:
    free(v8);
  }
  return m_ptr;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_playerController.m_ptr;
  self->_playerController.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
