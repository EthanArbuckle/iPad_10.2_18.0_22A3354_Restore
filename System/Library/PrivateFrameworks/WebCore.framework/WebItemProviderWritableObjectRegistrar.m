@implementation WebItemProviderWritableObjectRegistrar

- (WebItemProviderWritableObjectRegistrar)initWithObject:(id)a3
{
  WebItemProviderWritableObjectRegistrar *v4;
  void *m_ptr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WebItemProviderWritableObjectRegistrar;
  v4 = -[WebItemProviderWritableObjectRegistrar init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v4->_representingObject.m_ptr;
    v4->_representingObject.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v4;
}

- (NSItemProviderWriting)representingObject
{
  return (NSItemProviderWriting *)self->_representingObject.m_ptr;
}

- (void)registerItemProvider:(id)a3
{
  objc_msgSend(a3, "registerObject:visibility:", -[WebItemProviderWritableObjectRegistrar representingObject](self, "representingObject"), 0);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), objc_opt_class());
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_representingObject.m_ptr;
  self->_representingObject.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
