@implementation WebItemProviderDataRegistrar

- (WebItemProviderDataRegistrar)initWithData:(id)a3 type:(id)a4
{
  WebItemProviderDataRegistrar *v6;
  void *m_ptr;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WebItemProviderDataRegistrar;
  v6 = -[WebItemProviderDataRegistrar init](&v10, sel_init);
  if (!v6)
    return v6;
  if (a3)
    CFRetain(a3);
  m_ptr = v6->_data.m_ptr;
  v6->_data.m_ptr = a3;
  if (!m_ptr)
  {
    if (!a4)
      goto LABEL_7;
    goto LABEL_6;
  }
  CFRelease(m_ptr);
  if (a4)
LABEL_6:
    CFRetain(a4);
LABEL_7:
  v8 = v6->_typeIdentifier.m_ptr;
  v6->_typeIdentifier.m_ptr = a4;
  if (v8)
    CFRelease(v8);
  return v6;
}

- (NSString)typeIdentifier
{
  return (NSString *)self->_typeIdentifier.m_ptr;
}

- (NSData)data
{
  return (NSData *)self->_data.m_ptr;
}

- (void)registerItemProvider:(id)a3
{
  NSString *v5;
  void *m_ptr;
  CFTypeRef v7;
  _QWORD v8[4];
  CFTypeRef cf;

  v5 = -[WebItemProviderDataRegistrar typeIdentifier](self, "typeIdentifier");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3321888768;
  v8[2] = __53__WebItemProviderDataRegistrar_registerItemProvider___block_invoke;
  v8[3] = &__block_descriptor_40_e8_32c66_ZTSKZ53__WebItemProviderDataRegistrar_registerItemProvider__E3__0_e45___NSProgress_16__0___v____NSData___NSError__8l;
  m_ptr = self->_data.m_ptr;
  if (m_ptr)
  {
    CFRetain(m_ptr);
    cf = m_ptr;
    CFRetain(m_ptr);
  }
  else
  {
    cf = 0;
  }
  objc_msgSend(a3, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v5, 0, v8);
  if (m_ptr)
    CFRelease(m_ptr);
  v7 = cf;
  cf = 0;
  if (v7)
    CFRelease(v7);
}

uint64_t __53__WebItemProviderDataRegistrar_registerItemProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ => %tu bytes)"), self->_typeIdentifier.m_ptr, objc_msgSend(self->_data.m_ptr, "length"));
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  m_ptr = self->_data.m_ptr;
  self->_data.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_typeIdentifier.m_ptr;
  self->_typeIdentifier.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
