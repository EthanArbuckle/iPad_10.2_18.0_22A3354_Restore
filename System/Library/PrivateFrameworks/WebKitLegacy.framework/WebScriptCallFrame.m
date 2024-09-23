@implementation WebScriptCallFrame

- (id)_initWithGlobalObject:(id)a3 functionName:(String)a4 exceptionValue:(JSValue)a5
{
  WebScriptCallFrame *v8;
  WebScriptCallFramePrivate *v9;
  StringImpl *v10;
  WebScriptCallFramePrivate *v11;
  StringImpl *v12;
  WTF::StringImpl *m_ptr;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WebScriptCallFrame;
  v8 = -[WebScriptCallFrame init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(WebScriptCallFramePrivate);
    v8->_private = v9;
    v9->globalObject = (WebScriptObject *)a3;
    v11 = v8->_private;
    v12 = *(StringImpl **)a4.m_impl.m_ptr;
    if (*(_QWORD *)a4.m_impl.m_ptr)
      *(_DWORD *)v12 += 2;
    m_ptr = (WTF::StringImpl *)v11->functionName.m_impl.m_ptr;
    v11->functionName.m_impl.m_ptr = v12;
    if (m_ptr)
    {
      if (*(_DWORD *)m_ptr == 2)
        WTF::StringImpl::destroy(m_ptr, v10);
      else
        *(_DWORD *)m_ptr -= 2;
    }
    v8->_private->exceptionValue = a5;
  }
  return v8;
}

- (id)_convertValueToObjcValue:(JSValue)a3
{
  WebScriptObject *globalObject;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (!a3.super.isa)
    return 0;
  globalObject = self->_private->globalObject;
  if ((Class)-[WebScriptObject _imp](globalObject, "_imp") != a3.super.isa)
  {
    v5 = -[WebScriptObject _originRootObject](globalObject, "_originRootObject");
    if (v5)
    {
      v6 = v5;
      v7 = -[WebScriptObject _rootObject](globalObject, "_rootObject");
      if (v7)
        return (id)objc_msgSend(MEMORY[0x1E0DCDD98], "_convertValueToObjcValue:originRootObject:rootObject:", a3.super.isa, v6, v7);
    }
    return 0;
  }
  return globalObject;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebScriptCallFrame;
  -[WebScriptCallFrame dealloc](&v3, sel_dealloc);
}

- (void)setUserInfo:(id)a3
{
  id userInfo;

  userInfo = self->_userInfo;
  if (userInfo != a3)
  {

    self->_userInfo = a3;
  }
}

- (id)userInfo
{
  return self->_userInfo;
}

- (id)functionName
{
  StringImpl *m_ptr;
  id result;
  StringImpl *v4;
  id v5;

  m_ptr = self->_private->functionName.m_impl.m_ptr;
  if (!m_ptr || !*((_DWORD *)m_ptr + 1))
    return 0;
  *(_DWORD *)m_ptr += 2;
  result = (id)WTF::StringImpl::operator NSString *();
  v5 = result;
  if (*(_DWORD *)m_ptr == 2)
  {
    WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, v4);
    return v5;
  }
  else
  {
    *(_DWORD *)m_ptr -= 2;
  }
  return result;
}

- (id)exception
{
  if (self->_private->exceptionValue.super.isa)
    return -[WebScriptCallFrame _convertValueToObjcValue:](self, "_convertValueToObjcValue:");
  else
    return 0;
}

@end
