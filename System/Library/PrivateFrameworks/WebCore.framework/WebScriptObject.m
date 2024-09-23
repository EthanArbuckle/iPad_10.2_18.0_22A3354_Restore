@implementation WebScriptObject

+ (id)scriptObjectForJSObject:(OpaqueJSValue *)a3 originRootObject:(void *)a4 rootObject:(void *)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  _DWORD *v11;
  unsigned int v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  OpaqueJSValue *v18;
  int v19;
  uint64_t v20;
  int v21;
  _DWORD *v22;
  void *v24;
  _DWORD *v25;

  if (!off_1ECE86C00 || (v8 = (void *)off_1ECE86C00(a3, a2)) == 0)
  {
    if (a4)
      ++*((_DWORD *)a4 + 2);
    v25 = a4;
    if (a5)
      ++*((_DWORD *)a5 + 2);
    v24 = a5;
    if (__ldaxr((unsigned __int8 *)&unk_1ECE86BF9))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)&unk_1ECE86BF9))
    {
      goto LABEL_19;
    }
    MEMORY[0x19AEA534C](&unk_1ECE86BF9, a2);
LABEL_19:
    if ((byte_1ECE86BFA & 1) != 0)
    {
      if (!qword_1ECE86C18)
      {
LABEL_27:
        v9 = 0;
        goto LABEL_28;
      }
      v13 = *(_DWORD *)(qword_1ECE86C18 - 8);
      v14 = ((unint64_t)a3 + ~((_QWORD)a3 << 32)) ^ (((unint64_t)a3 + ~((_QWORD)a3 << 32)) >> 22);
      v15 = 9 * ((v14 + ~(v14 << 13)) ^ ((v14 + ~(v14 << 13)) >> 8));
      v16 = (v15 ^ (v15 >> 15)) + ~((v15 ^ (v15 >> 15)) << 27);
      v17 = v13 & ((v16 >> 31) ^ v16);
      v18 = *(OpaqueJSValue **)(qword_1ECE86C18 + 16 * v17);
      if (v18 != a3)
      {
        v19 = 1;
        while (v18)
        {
          v17 = ((_DWORD)v17 + v19) & v13;
          v18 = *(OpaqueJSValue **)(qword_1ECE86C18 + 16 * v17);
          ++v19;
          if (v18 == a3)
            goto LABEL_25;
        }
        goto LABEL_27;
      }
LABEL_25:
      v20 = qword_1ECE86C18 + 16 * v17;
      v9 = *(void **)(v20 + 8);
      if (v9)
      {
        CFRetain(*(CFTypeRef *)(v20 + 8));
        v9 = (id)CFMakeCollectable(v9);
      }
    }
    else
    {
      v9 = 0;
      qword_1ECE86C18 = 0;
      byte_1ECE86BFA = 1;
    }
LABEL_28:
    v21 = __ldxr((unsigned __int8 *)&unk_1ECE86BF9);
    if (v21 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)&unk_1ECE86BF9))
      {
        if (v9)
          goto LABEL_35;
LABEL_34:
        v9 = (id)CFMakeCollectable(-[WebScriptObject _initWithJSObject:originRootObject:rootObject:]([WebScriptObject alloc], "_initWithJSObject:originRootObject:rootObject:", a3, &v25, &v24));
        a5 = v24;
LABEL_35:
        v24 = 0;
        if (a5)
        {
          if (*((_DWORD *)a5 + 2) == 1)
            (*(void (**)(void *, SEL))(*(_QWORD *)a5 + 8))(a5, a2);
          else
            --*((_DWORD *)a5 + 2);
        }
        goto LABEL_38;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)&unk_1ECE86BF9);
    if (v9)
      goto LABEL_35;
    goto LABEL_34;
  }
  v9 = v8;
  if ((objc_msgSend(v8, "_hasImp") & 1) != 0)
    return v9;
  if (a4)
    ++*((_DWORD *)a4 + 2);
  v25 = a4;
  if (a5)
    ++*((_DWORD *)a5 + 2);
  v24 = a5;
  objc_msgSend(v9, "_setImp:originRootObject:rootObject:", a3, &v25, &v24);
  v11 = v24;
  v24 = 0;
  if (v11)
  {
    if (v11[2] == 1)
      (*(void (**)(_DWORD *, uint64_t))(*(_QWORD *)v11 + 8))(v11, v10);
    else
      --v11[2];
  }
LABEL_38:
  v22 = v25;
  v25 = 0;
  if (v22)
  {
    if (v22[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v22 + 8))(v22);
    else
      --v22[2];
  }
  return v9;
}

- (void)_setImp:(void *)a3 originRootObject:(void *)a4 rootObject:(void *)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  void **v15;
  void *v16;
  void **v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  int v24;
  JSC::Bindings::RootObject *rootObject;

  self->_private->imp = a3;
  v7 = *(void **)a5;
  *(_QWORD *)a5 = 0;
  self->_private->rootObject = v7;
  v8 = *(void **)a4;
  *(_QWORD *)a4 = 0;
  self->_private->originRootObject = v8;
  LODWORD(v8) = __ldaxr((unsigned __int8 *)&unk_1ECE86BF9);
  if ((_DWORD)v8)
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)&unk_1ECE86BF9))
  {
    goto LABEL_5;
  }
  MEMORY[0x19AEA534C](&unk_1ECE86BF9, a2);
LABEL_5:
  if ((byte_1ECE86BFA & 1) != 0)
  {
    v9 = qword_1ECE86C18;
    if (qword_1ECE86C18)
    {
LABEL_8:
      v10 = *(_DWORD *)(v9 - 8);
      goto LABEL_9;
    }
  }
  else
  {
    qword_1ECE86C18 = 0;
    byte_1ECE86BFA = 1;
  }
  WTF::HashTable<JSC::JSObject *,WTF::KeyValuePair<JSC::JSObject *,NSObject *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<JSC::JSObject *,NSObject *>>,WTF::DefaultHash<JSC::JSObject *>,WTF::HashMap<JSC::JSObject *,NSObject *,WTF::DefaultHash<JSC::JSObject *>,WTF::HashTraits<JSC::JSObject *>,WTF::HashTraits<NSObject *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<JSC::JSObject *>>::rehash(8u);
  v9 = qword_1ECE86C18;
  if (qword_1ECE86C18)
    goto LABEL_8;
  v10 = 0;
LABEL_9:
  v11 = ((unint64_t)a3 + ~((_QWORD)a3 << 32)) ^ (((unint64_t)a3 + ~((_QWORD)a3 << 32)) >> 22);
  v12 = 9 * ((v11 + ~(v11 << 13)) ^ ((v11 + ~(v11 << 13)) >> 8));
  v13 = (v12 ^ (v12 >> 15)) + ~((v12 ^ (v12 >> 15)) << 27);
  v14 = v10 & ((v13 >> 31) ^ v13);
  v15 = (void **)(v9 + 16 * v14);
  v16 = *v15;
  if (*v15)
  {
    v17 = 0;
    v18 = 1;
    do
    {
      if (v16 == a3)
      {
        v15[1] = self;
        goto LABEL_31;
      }
      if (v16 == (void *)-1)
        v17 = v15;
      v14 = (v14 + v18) & v10;
      v15 = (void **)(v9 + 16 * v14);
      v16 = *v15;
      ++v18;
    }
    while (*v15);
    if (v17)
    {
      *v17 = 0;
      v17[1] = 0;
      --*(_DWORD *)(v9 - 16);
      v15 = v17;
    }
  }
  *v15 = a3;
  v15[1] = self;
  if (qword_1ECE86C18)
    v19 = *(_DWORD *)(qword_1ECE86C18 - 12) + 1;
  else
    v19 = 1;
  *(_DWORD *)(qword_1ECE86C18 - 12) = v19;
  if (qword_1ECE86C18)
    v20 = *(_DWORD *)(qword_1ECE86C18 - 12);
  else
    v20 = 0;
  v21 = (*(_DWORD *)(qword_1ECE86C18 - 16) + v20);
  v22 = *(unsigned int *)(qword_1ECE86C18 - 4);
  if (v22 <= 0x400)
  {
    if (3 * v22 > 4 * v21)
      goto LABEL_31;
    if (!(_DWORD)v22)
    {
      v23 = 8;
      goto LABEL_30;
    }
LABEL_27:
    v23 = (_DWORD)v22 << (6 * *(_DWORD *)(qword_1ECE86C18 - 12) >= (2 * v22));
LABEL_30:
    WTF::HashTable<JSC::JSObject *,WTF::KeyValuePair<JSC::JSObject *,NSObject *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<JSC::JSObject *,NSObject *>>,WTF::DefaultHash<JSC::JSObject *>,WTF::HashMap<JSC::JSObject *,NSObject *,WTF::DefaultHash<JSC::JSObject *>,WTF::HashTraits<JSC::JSObject *>,WTF::HashTraits<NSObject *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<JSC::JSObject *>>::rehash(v23);
    goto LABEL_31;
  }
  if (v22 <= 2 * v21)
    goto LABEL_27;
LABEL_31:
  v24 = __ldxr((unsigned __int8 *)&unk_1ECE86BF9);
  if (v24 != 1)
  {
    __clrex();
    goto LABEL_35;
  }
  if (__stlxr(0, (unsigned __int8 *)&unk_1ECE86BF9))
LABEL_35:
    WTF::Lock::unlockSlow((WTF::Lock *)&unk_1ECE86BF9);
  rootObject = (JSC::Bindings::RootObject *)self->_private->rootObject;
  if (rootObject)
    JSC::Bindings::RootObject::gcProtect(rootObject, (JSC::JSObject *)a3);
}

- (void)_setOriginRootObject:(void *)a3 andRootObject:(void *)a4
{
  WebScriptObjectPrivate *v7;
  _DWORD *rootObject;
  _DWORD *originRootObject;
  JSC::Bindings::RootObject *v10;
  void *v11;

  if (*(_QWORD *)a4)
    JSC::Bindings::RootObject::gcProtect(*(JSC::Bindings::RootObject **)a4, (JSC::JSObject *)self->_private->imp);
  v7 = self->_private;
  rootObject = v7->rootObject;
  if (rootObject)
  {
    if (!*((_BYTE *)rootObject + 12)
      || (JSC::Bindings::RootObject::gcUnprotect((uint64_t)rootObject, (JSC::JSObject *)v7->imp),
          (rootObject = self->_private->rootObject) != 0))
    {
      if (rootObject[2] == 1)
        (*(void (**)(_DWORD *, SEL))(*(_QWORD *)rootObject + 8))(rootObject, a2);
      else
        --rootObject[2];
    }
  }
  originRootObject = self->_private->originRootObject;
  if (originRootObject)
  {
    if (originRootObject[2] == 1)
      (*(void (**)(_DWORD *, SEL))(*(_QWORD *)originRootObject + 8))(originRootObject, a2);
    else
      --originRootObject[2];
  }
  v10 = *(JSC::Bindings::RootObject **)a4;
  *(_QWORD *)a4 = 0;
  self->_private->rootObject = v10;
  v11 = *(void **)a3;
  *(_QWORD *)a3 = 0;
  self->_private->originRootObject = v11;
}

- (id)_initWithJSObject:(void *)a3 originRootObject:(void *)a4 rootObject:(void *)a5
{
  WebScriptObject *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WebScriptObject;
  v8 = -[WebScriptObject init](&v10, sel_init);
  v8->_private = objc_alloc_init(WebScriptObjectPrivate);
  -[WebScriptObject _setImp:originRootObject:rootObject:](v8, "_setImp:originRootObject:rootObject:", a3, a4, a5);
  return v8;
}

- (void)_imp
{
  WebScriptObjectPrivate *v3;
  void *result;

  v3 = self->_private;
  if (!v3->imp && v3->isCreatedByDOMWrapper)
    -[WebScriptObject _initializeScriptDOMNodeImp](self, "_initializeScriptDOMNodeImp");
  result = -[WebScriptObject _rootObject](self, "_rootObject");
  if (result)
    return self->_private->imp;
  return result;
}

- (BOOL)_hasImp
{
  return self->_private->imp != 0;
}

- (void)_rootObject
{
  _BYTE *rootObject;

  rootObject = self->_private->rootObject;
  if (!rootObject)
    return 0;
  if (rootObject[12])
    return self->_private->rootObject;
  return 0;
}

- (void)_originRootObject
{
  _BYTE *originRootObject;

  originRootObject = self->_private->originRootObject;
  if (!originRootObject)
    return 0;
  if (originRootObject[12])
    return self->_private->originRootObject;
  return 0;
}

- (BOOL)_isSafeScript
{
  _QWORD *v3;
  void *originRootObject;
  uint64_t **v5;
  uint64_t v6;
  _BOOL4 v7;
  char **v8;
  BOOL v9;
  WTF::StringImpl **v11;
  WTF::StringImpl *v12;

  v3 = -[WebScriptObject _rootObject](self, "_rootObject");
  if (v3)
  {
    originRootObject = self->_private->originRootObject;
    if (originRootObject)
    {
      if (!*((_BYTE *)originRootObject + 12))
        goto LABEL_18;
      v5 = (uint64_t **)v3[3];
      if (v5)
        v5 = (uint64_t **)*v5;
      v6 = *(unsigned int *)(16 * (*(_DWORD *)v5 & 0xFFFFFFFE) + 0x4C);
      v7 = *(_DWORD *)(16 * (*(_DWORD *)v5 & 0xFFFFFFFE) + 0x4C) != 0;
      v8 = (char **)(16 * v6);
      if ((_DWORD)v6)
        v9 = v8 == &WebCore::JSDOMWindowBase::s_info;
      else
        v9 = 1;
      if (!v9)
      {
        do
        {
          v8 = (char **)v8[2];
          v7 = v8 != 0;
        }
        while (v8 != &WebCore::JSDOMWindowBase::s_info && v8 != 0);
      }
      if (v7)
      {
        v11 = (WTF::StringImpl **)*((_QWORD *)originRootObject + 3);
        if (v11)
          v12 = *v11;
        else
          v12 = 0;
        LOBYTE(v3) = WebCore::BindingSecurity::shouldAllowAccessToDOMWindow(v12, (WTF::StringImpl *)v5[426], 1);
      }
      else
      {
LABEL_18:
        LOBYTE(v3) = 0;
      }
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return (char)v3;
}

- (OpaqueJSContext)_globalContextRef
{
  OpaqueJSContext **v3;

  if (-[WebScriptObject _isSafeScript](self, "_isSafeScript")
    && (v3 = *(OpaqueJSContext ***)(-[WebScriptObject _rootObject](self, "_rootObject") + 24)) != 0)
  {
    return *v3;
  }
  else
  {
    return 0;
  }
}

- (void)release
{
  void *imp;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  int v16;
  objc_super v17;

  imp = self->_private->imp;
  if (!imp)
    goto LABEL_31;
  if (__ldaxr((unsigned __int8 *)&unk_1ECE86BF9))
  {
    __clrex();
LABEL_5:
    MEMORY[0x19AEA534C](&unk_1ECE86BF9, a2);
    goto LABEL_6;
  }
  if (__stxr(1u, (unsigned __int8 *)&unk_1ECE86BF9))
    goto LABEL_5;
LABEL_6:
  if (-[WebScriptObject retainCount](self, "retainCount") == 1)
  {
    if ((byte_1ECE86BFA & 1) != 0)
    {
      if (qword_1ECE86C18)
      {
        v5 = *(_DWORD *)(qword_1ECE86C18 - 8);
        v6 = ((unint64_t)imp + ~((_QWORD)imp << 32)) ^ (((unint64_t)imp + ~((_QWORD)imp << 32)) >> 22);
        v7 = 9 * ((v6 + ~(v6 << 13)) ^ ((v6 + ~(v6 << 13)) >> 8));
        v8 = (v7 ^ (v7 >> 15)) + ~((v7 ^ (v7 >> 15)) << 27);
        v9 = v5 & ((v8 >> 31) ^ v8);
        v10 = *(void **)(qword_1ECE86C18 + 16 * v9);
        if (v10 != imp)
        {
          v11 = 1;
          while (v10)
          {
            v9 = ((_DWORD)v9 + v11) & v5;
            v10 = *(void **)(qword_1ECE86C18 + 16 * v9);
            ++v11;
            if (v10 == imp)
              goto LABEL_15;
          }
          v9 = *(unsigned int *)(qword_1ECE86C18 - 4);
        }
LABEL_15:
        if (v9 != *(_DWORD *)(qword_1ECE86C18 - 4))
        {
          *(_QWORD *)(qword_1ECE86C18 + 16 * v9) = -1;
          v12 = qword_1ECE86C18;
          ++*(_DWORD *)(qword_1ECE86C18 - 16);
          v13 = v12 ? *(_DWORD *)(v12 - 12) - 1 : -1;
          *(_DWORD *)(v12 - 12) = v13;
          if (qword_1ECE86C18)
          {
            v14 = *(_DWORD *)(qword_1ECE86C18 - 4);
            if (6 * *(_DWORD *)(qword_1ECE86C18 - 12) < v14 && v14 >= 9)
              WTF::HashTable<JSC::JSObject *,WTF::KeyValuePair<JSC::JSObject *,NSObject *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<JSC::JSObject *,NSObject *>>,WTF::DefaultHash<JSC::JSObject *>,WTF::HashMap<JSC::JSObject *,NSObject *,WTF::DefaultHash<JSC::JSObject *>,WTF::HashTraits<JSC::JSObject *>,WTF::HashTraits<NSObject *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<JSC::JSObject *>>::rehash(v14 >> 1);
          }
        }
      }
    }
    else
    {
      qword_1ECE86C18 = 0;
      byte_1ECE86BFA = 1;
    }
  }
  v16 = __ldxr((unsigned __int8 *)&unk_1ECE86BF9);
  if (v16 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)&unk_1ECE86BF9))
      goto LABEL_31;
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)&unk_1ECE86BF9);
LABEL_31:
  v17.receiver = self;
  v17.super_class = (Class)WebScriptObject;
  -[WebScriptObject release](&v17, sel_release);
}

- (void)dealloc
{
  WTF *v3;
  WebScriptObjectPrivate *v4;
  _DWORD *rootObject;
  _DWORD *originRootObject;
  _QWORD *v7;
  _QWORD *v8;
  objc_super v9;
  _QWORD *v10;

  v3 = (WTF *)objc_opt_class();
  if ((WTF::isMainThread(v3) & 1) != 0)
  {
    v4 = self->_private;
    rootObject = v4->rootObject;
    if (rootObject)
    {
      if (!*((_BYTE *)rootObject + 12)
        || (JSC::Bindings::RootObject::gcUnprotect((uint64_t)rootObject, (JSC::JSObject *)v4->imp),
            (rootObject = self->_private->rootObject) != 0))
      {
        if (rootObject[2] == 1)
          (*(void (**)(_DWORD *))(*(_QWORD *)rootObject + 8))(rootObject);
        else
          --rootObject[2];
      }
    }
    originRootObject = self->_private->originRootObject;
    if (originRootObject)
    {
      if (originRootObject[2] == 1)
        (*(void (**)(_DWORD *))(*(_QWORD *)originRootObject + 8))(originRootObject);
      else
        --originRootObject[2];
    }

    v9.receiver = self;
    v9.super_class = (Class)WebScriptObject;
    -[WebScriptObject dealloc](&v9, sel_dealloc);
  }
  else
  {
    v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v7 = off_1E3357AF0;
    v7[1] = v3;
    v7[2] = self;
    v10 = v7;
    WTF::callOnMainThread();
    v8 = v10;
    v10 = 0;
    if (v8)
      (*(void (**)(_QWORD *))(*v8 + 8))(v8);
  }
}

+ (BOOL)throwException:(NSString *)exceptionMessage
{
  uint64_t v3;
  const void *v4;

  v3 = -[NSString copy](exceptionMessage, "copy");
  {
    v4 = (const void *)JSC::Bindings::globalException(void)::exception;
    JSC::Bindings::globalException(void)::exception = v3;
    if (v4)
      CFRelease(v4);
  }
  else
  {
    JSC::Bindings::globalException(void)::exception = v3;
  }
  JSC::Bindings::s_exceptionEnvironment = 0;
  return 1;
}

- (id)callWebScriptMethod:(NSString *)name withArguments:(NSArray *)arguments
{
  JSC::VM ***v7;
  JSC::VM **v8;
  id v9;
  JSC::Structure *v10;
  WTF::StringImpl *v11;
  WebCore::JSDOMGlobalObject *v12;
  int v13;
  WTF::StringImpl *v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  JSC::Bindings::Instance *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_class *v21;
  JSValue v22;
  int v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  WebCore::JSDOMGlobalObject **v27;
  unint64_t StatusReg;
  uint64_t v29;
  WebCore *v30;
  uint64_t v31;
  uint64_t v32;
  JSC::JSGlobalObject *v33;
  uint64_t v34;
  uint64_t *v35;
  _QWORD *v37;
  WTF::StringImpl *v38;
  uint64_t v39;
  WTF *v40;
  _OWORD v41[4];
  uint64_t v42;
  _QWORD v43[3];
  _BYTE v44[8];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  JSC::JSGlobalObject *v49;
  uint64_t v50;
  WebCore::JSDOMGlobalObject *v51[18];

  v51[16] = *(WebCore::JSDOMGlobalObject **)MEMORY[0x1E0C80C00];
  if (!-[WebScriptObject _isSafeScript](self, "_isSafeScript"))
    return 0;
  v7 = *(JSC::VM ****)(-[WebScriptObject _rootObject](self, "_rootObject") + 24);
  if (v7)
    v8 = *v7;
  else
    v8 = 0;
  MEMORY[0x19AEA3294](v44, v8[7]);
  v10 = -[WebScriptObject _imp](self, "_imp");
  MEMORY[0x19AEA5508](&v38, name);
  v12 = v38;
  if (v38)
  {
    if ((*((_BYTE *)v38 + 16) & 0x10) != 0)
    {
      *(_DWORD *)v38 += 2;
    }
    else
    {
      WTF::AtomStringImpl::addSlowCase();
      v12 = v51[0];
    }
  }
  v13 = *(_DWORD *)v12;
  *(_DWORD *)v12 += 2;
  if (v13)
    *(_DWORD *)v12 = v13;
  else
    WTF::StringImpl::destroy(v12, v11);
  v15 = JSC::JSObject::get(v10, (JSC::JSGlobalObject *)v8, (unint64_t)v12);
  if (*(_DWORD *)v12 == 2)
    WTF::StringImpl::destroy(v12, v14);
  else
    *(_DWORD *)v12 -= 2;
  v16 = v38;
  v38 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy(v16, v14);
    else
      *(_DWORD *)v16 -= 2;
  }
  if ((v15 & 0xFFFE000000000002) != 0)
    goto LABEL_50;
  if (*(_BYTE *)(v15 + 5) == 26)
    JSC::JSFunction::getCallData((JSC::JSFunction *)v15, (JSCell *)v14);
  else
    (*(void (**)(_QWORD *__return_ptr, uint64_t))(16
                                                          * *(unsigned int *)(16 * (*(_DWORD *)v15 & 0xFFFFFFFE) + 0x4C)
                                                          + 0x38))(v43, v15);
  if (!LOBYTE(v43[0]))
  {
LABEL_50:
    v9 = 0;
  }
  else
  {
    LOBYTE(v38) = 0;
    v39 = 0x800000000;
    v40 = (WTF *)((char *)v41 + 8);
    memset(v41, 0, sizeof(v41));
    v42 = 0;
    v17 = -[WebScriptObject _rootObject](self, "_rootObject", v38);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](arguments, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v46;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v46 != v19)
            objc_enumerationMutation(arguments);
          v49 = 0;
          v49 = *(JSC::JSGlobalObject **)(*((_QWORD *)&v45 + 1) + 8 * v20);
          v21 = (objc_class *)JSC::Bindings::convertObjcValueToValue((JSC::Bindings *)v8, &v49, 1, v17);
          v22.super.isa = v21;
          v23 = v39;
          if ((_DWORD)v39 != HIDWORD(v39) && (v40 != (WTF *)((char *)v41 + 8) ? (v24 = v40 == 0) : (v24 = 1), v24))
          {
            *((_QWORD *)v40 + v39) = v21;
            LODWORD(v39) = v23 + 1;
          }
          else if (JSC::MarkedVectorBase::slowAppend((JSC::MarkedVectorBase *)&v39, v22) == 1)
          {
            LOBYTE(v38) = 1;
          }
          ++v20;
        }
        while (v18 != v20);
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](arguments, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        v18 = v25;
      }
      while (v25);
    }
    if (-[WebScriptObject _isSafeScript](self, "_isSafeScript", v38))
    {
      v50 = 0;
      v27 = -[WebScriptObject _imp](self, "_imp");
      *(_QWORD *)&v45 = v40;
      DWORD2(v45) = v39;
      StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v29 = *(_QWORD *)(StatusReg + 736);
      if (!v29 || (v27 = *(WebCore::JSDOMGlobalObject ***)(v29 + 96)) == 0)
        v27 = (WebCore::JSDOMGlobalObject **)WebCore::threadGlobalDataSlow((WebCore *)v27);
      v51[0] = v27[8];
      v30 = (WebCore *)JSC::JSLockHolder::JSLockHolder();
      v31 = *(_QWORD *)(StatusReg + 736);
      if (!v31 || (v30 = *(WebCore **)(v31 + 96)) == 0)
        v30 = (WebCore *)WebCore::threadGlobalDataSlow(v30);
      *((_QWORD *)v30 + 8) = v8;
      v32 = JSC::profiledCall();
      WebCore::JSExecState::~JSExecState(v51, v33);
      v34 = v50;
      if (v50)
      {
        if (JSC::VM::deprecatedVMEntryGlobalObject(v8[7], (JSC::JSGlobalObject *)v8))
          WebCore::reportException((JSC::JSGlobalObject *)v8, v34, 0, 0, 0);
        v32 = 10;
      }
      v9 = +[WebScriptObject _convertValueToObjcValue:originRootObject:rootObject:](WebScriptObject, "_convertValueToObjcValue:originRootObject:rootObject:", v32, -[WebScriptObject _originRootObject](self, "_originRootObject"), -[WebScriptObject _rootObject](self, "_rootObject"));
    }
    else
    {
      v9 = 0;
    }
    v35 = *(uint64_t **)&v41[0];
    if (*(_QWORD *)&v41[0])
    {
      v51[0] = (WebCore::JSDOMGlobalObject *)&v39;
      v37 = (_QWORD *)WTF::HashTable<JSC::MarkedVectorBase *,JSC::MarkedVectorBase *,WTF::IdentityExtractor,WTF::DefaultHash<JSC::MarkedVectorBase *>,WTF::HashTraits<JSC::MarkedVectorBase *>,WTF::HashTraits<JSC::MarkedVectorBase *>>::find<WTF::IdentityHashTranslator<WTF::HashTraits<JSC::MarkedVectorBase *>,WTF::DefaultHash<JSC::MarkedVectorBase *>>,JSC::MarkedVectorBase *>(*(uint64_t **)&v41[0], (uint64_t *)v51);
      WTF::HashSet<JSC::MarkedVectorBase *,WTF::DefaultHash<JSC::MarkedVectorBase *>,WTF::HashTraits<JSC::MarkedVectorBase *>,WTF::HashTableTraits>::remove(v35, v37);
    }
    if (v40 != (WTF *)((char *)v41 + 8) && v40)
      WTF::fastFree(v40, v26);
  }
  MEMORY[0x19AEA32A0](v44);
  return v9;
}

- (id)evaluateWebScript:(NSString *)script
{
  uint64_t *v5;
  uint64_t v6;
  id v7;
  WebCore *Source;
  unint64_t StatusReg;
  uint64_t v10;
  WebCore *v11;
  uint64_t v12;
  uint64_t v13;
  JSC::JSGlobalObject *v14;
  WTF::StringImpl *v15;
  _DWORD *v16;
  WTF::StringImpl *v17;
  _DWORD *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  int32x2_t v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24[2];
  __int128 v25;
  __int128 v26;
  WTF::StringImpl *v27;
  int32x2_t v28[3];
  _BYTE v29[8];
  uint64_t v30;
  WebCore::JSDOMGlobalObject *v31;

  if (!-[WebScriptObject _isSafeScript](self, "_isSafeScript"))
    return 0;
  v5 = *(uint64_t **)(-[WebScriptObject _rootObject](self, "_rootObject") + 24);
  if (v5)
    v6 = *v5;
  else
    v6 = 0;
  MEMORY[0x19AEA3294](v29, *(_QWORD *)(v6 + 56));
  MEMORY[0x19AEA5508](&v27, script);
  v25 = 0u;
  v26 = 0u;
  *(_OWORD *)v24 = 0u;
  WTF::URL::invalidate((WTF::URL *)v24);
  *((_QWORD *)&v26 + 1) = 0;
  v22 = 0;
  v23 = 0;
  Source = (WebCore *)JSC::makeSource((_DWORD **)&v27, &v23, &v22, v28);
  v30 = 0;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v10 = *(_QWORD *)(StatusReg + 736);
  if (!v10 || (Source = *(WebCore **)(v10 + 96)) == 0)
    Source = (WebCore *)WebCore::threadGlobalDataSlow(Source);
  v31 = (WebCore::JSDOMGlobalObject *)*((_QWORD *)Source + 8);
  v11 = (WebCore *)JSC::JSLockHolder::JSLockHolder();
  v12 = *(_QWORD *)(StatusReg + 736);
  if (!v12 || (v11 = *(WebCore **)(v12 + 96)) == 0)
    v11 = (WebCore *)WebCore::threadGlobalDataSlow(v11);
  *((_QWORD *)v11 + 8) = v6;
  v13 = JSC::profiledEvaluate();
  WebCore::JSExecState::~JSExecState(&v31, v14);
  v16 = (_DWORD *)v28[0];
  v28[0] = 0;
  if (v16)
  {
    if (v16[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v16 + 8))(v16);
    else
      --v16[2];
  }
  v17 = v23;
  v23 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2)
      WTF::StringImpl::destroy(v17, v15);
    else
      *(_DWORD *)v17 -= 2;
  }
  v18 = (_DWORD *)*((_QWORD *)&v26 + 1);
  *((_QWORD *)&v26 + 1) = 0;
  if (v18)
  {
    if (v18[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v18 + 8))(v18);
    else
      --v18[2];
  }
  v19 = v24[0];
  v24[0] = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
      WTF::StringImpl::destroy(v19, v15);
    else
      *(_DWORD *)v19 -= 2;
  }
  v20 = v27;
  v27 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2)
      WTF::StringImpl::destroy(v20, v15);
    else
      *(_DWORD *)v20 -= 2;
  }
  v7 = +[WebScriptObject _convertValueToObjcValue:originRootObject:rootObject:](WebScriptObject, "_convertValueToObjcValue:originRootObject:rootObject:", v13, -[WebScriptObject _originRootObject](self, "_originRootObject"), -[WebScriptObject _rootObject](self, "_rootObject"));
  MEMORY[0x19AEA32A0](v29);
  return v7;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  JSC::VM ***v6;
  JSC::VM **v7;
  JSC::VM *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  void (*v11)(unsigned __int8 *, JSC::VM **, JSC::JSGlobalObject *, unint64_t, _QWORD *);
  WTF::StringImpl *v12;
  JSC::JSGlobalObject *v13;
  int v14;
  unint64_t v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  JSC::VM *v18;
  uint64_t v19;
  uint64_t v20;
  WTF::StringImpl *v21;
  _QWORD v22[2];
  int v23;
  int v24;
  uint64_t v25;
  _BYTE v26[8];
  JSC::JSGlobalObject *v27[2];

  v27[0] = (JSC::JSGlobalObject *)a3;
  if (-[WebScriptObject _isSafeScript](self, "_isSafeScript"))
  {
    v6 = *(JSC::VM ****)(-[WebScriptObject _rootObject](self, "_rootObject") + 24);
    if (v6)
      v7 = *v6;
    else
      v7 = 0;
    v8 = v7[7];
    MEMORY[0x19AEA3294](v26, v8);
    v9 = -[WebScriptObject _imp](self, "_imp");
    if (v9[5] <= 0x16u)
      v10 = 0;
    else
      v10 = v9;
    v22[0] = 0;
    v22[1] = v10;
    v23 = -1;
    v24 = 0x1000000;
    v25 = 0;
    v11 = *(void (**)(unsigned __int8 *, JSC::VM **, JSC::JSGlobalObject *, unint64_t, _QWORD *))(16 * *(unsigned int *)(16 * (*(_DWORD *)v10 & 0xFFFFFFFE) + 0x4C) + 0x48);
    MEMORY[0x19AEA5508](&v21, a4);
    v13 = v21;
    if (v21)
    {
      if ((*((_BYTE *)v21 + 16) & 0x10) != 0)
      {
        *(_DWORD *)v21 += 2;
      }
      else
      {
        WTF::AtomStringImpl::addSlowCase();
        v13 = v27[1];
      }
    }
    v14 = *(_DWORD *)v13;
    *(_DWORD *)v13 += 2;
    if (v14)
      *(_DWORD *)v13 = v14;
    else
      WTF::StringImpl::destroy(v13, v12);
    v15 = JSC::Bindings::convertObjcValueToValue((JSC::Bindings *)v7, v27, 1, (JSC::Bindings::Instance *)-[WebScriptObject _rootObject](self, "_rootObject"));
    v11(v10, v7, v13, v15, v22);
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v16);
    else
      *(_DWORD *)v13 -= 2;
    v17 = v21;
    v21 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2)
        WTF::StringImpl::destroy(v17, v16);
      else
        *(_DWORD *)v17 -= 2;
    }
    if (*((_QWORD *)v8 + 2))
    {
      v18 = v7[7];
      v19 = *((_QWORD *)v18 + 2);
      JSC::VM::clearException(v18);
      v20 = JSC::VM::deprecatedVMEntryGlobalObject(v7[7], (JSC::JSGlobalObject *)v7);
      if (v19)
      {
        if (v20)
          WebCore::reportException((JSC::JSGlobalObject *)v7, v19, 0, 0, 0);
      }
      JSC::VM::clearException(v8);
    }
    MEMORY[0x19AEA32A0](v26);
  }
}

- (id)valueForKey:(id)a3
{
  JSC::VM ***v5;
  JSC::VM **v6;
  id v7;
  JSC::VM *v8;
  JSC::Structure *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  int v12;
  WTF::StringImpl *v13;
  uint64_t v14;
  WTF::StringImpl *v15;
  JSC::VM *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;
  WTF::StringImpl *v21;
  _BYTE v22[8];
  WTF::StringImpl *v23;

  if (!-[WebScriptObject _isSafeScript](self, "_isSafeScript"))
    return 0;
  v5 = *(JSC::VM ****)(-[WebScriptObject _rootObject](self, "_rootObject") + 24);
  if (v5)
    v6 = *v5;
  else
    v6 = 0;
  v8 = v6[7];
  MEMORY[0x19AEA3294](v22, v8);
  v9 = -[WebScriptObject _imp](self, "_imp");
  MEMORY[0x19AEA5508](&v21, a3);
  v11 = v21;
  if (v21)
  {
    if ((*((_BYTE *)v21 + 16) & 0x10) != 0)
    {
      *(_DWORD *)v21 += 2;
    }
    else
    {
      WTF::AtomStringImpl::addSlowCase();
      v11 = v23;
    }
  }
  v12 = *(_DWORD *)v11;
  *(_DWORD *)v11 += 2;
  if (v12)
    *(_DWORD *)v11 = v12;
  else
    WTF::StringImpl::destroy(v11, v10);
  v14 = JSC::JSObject::get(v9, (JSC::JSGlobalObject *)v6, (unint64_t)v11);
  if (*(_DWORD *)v11 == 2)
    WTF::StringImpl::destroy(v11, v13);
  else
    *(_DWORD *)v11 -= 2;
  v15 = v21;
  v21 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
      WTF::StringImpl::destroy(v15, v13);
    else
      *(_DWORD *)v15 -= 2;
  }
  if (*((_QWORD *)v8 + 2))
  {
    v17 = v6[7];
    v18 = *((_QWORD *)v17 + 2);
    JSC::VM::clearException(v17);
    v19 = JSC::VM::deprecatedVMEntryGlobalObject(v6[7], (JSC::JSGlobalObject *)v6);
    if (v18 && v19)
      WebCore::reportException((JSC::JSGlobalObject *)v6, v18, 0, 0, 0);
    JSC::VM::clearException(v8);
    v14 = 10;
  }
  v7 = +[WebScriptObject _convertValueToObjcValue:originRootObject:rootObject:](WebScriptObject, "_convertValueToObjcValue:originRootObject:rootObject:", v14, -[WebScriptObject _originRootObject](self, "_originRootObject"), -[WebScriptObject _rootObject](self, "_rootObject"));
  MEMORY[0x19AEA32A0](v22);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20.receiver = self;
    v20.super_class = (Class)WebScriptObject;
    return -[WebScriptObject valueForKey:](&v20, sel_valueForKey_, a3);
  }
  return v7;
}

- (void)removeWebScriptKey:(NSString *)name
{
  JSC::VM ***v5;
  JSC::VM **v6;
  JSC::VM *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  int v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  JSC::VM *v13;
  uint64_t v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  _BYTE v17[8];
  WTF::StringImpl *v18;

  if (-[WebScriptObject _isSafeScript](self, "_isSafeScript"))
  {
    v5 = *(JSC::VM ****)(-[WebScriptObject _rootObject](self, "_rootObject") + 24);
    if (v5)
      v6 = *v5;
    else
      v6 = 0;
    v7 = v6[7];
    MEMORY[0x19AEA3294](v17, v7);
    -[WebScriptObject _imp](self, "_imp");
    MEMORY[0x19AEA5508](&v16, name);
    v9 = v16;
    if (v16)
    {
      if ((*((_BYTE *)v16 + 16) & 0x10) != 0)
      {
        *(_DWORD *)v16 += 2;
      }
      else
      {
        WTF::AtomStringImpl::addSlowCase();
        v9 = v18;
      }
    }
    v10 = *(_DWORD *)v9;
    *(_DWORD *)v9 += 2;
    if (v10)
      *(_DWORD *)v9 = v10;
    else
      WTF::StringImpl::destroy(v9, v8);
    JSC::JSCell::deleteProperty();
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v11);
    else
      *(_DWORD *)v9 -= 2;
    v12 = v16;
    v16 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
        WTF::StringImpl::destroy(v12, v11);
      else
        *(_DWORD *)v12 -= 2;
    }
    if (*((_QWORD *)v7 + 2))
    {
      v13 = v6[7];
      v14 = *((_QWORD *)v13 + 2);
      JSC::VM::clearException(v13);
      v15 = JSC::VM::deprecatedVMEntryGlobalObject(v6[7], (JSC::JSGlobalObject *)v6);
      if (v14)
      {
        if (v15)
          WebCore::reportException((JSC::JSGlobalObject *)v6, v14, 0, 0, 0);
      }
      JSC::VM::clearException(v7);
    }
    MEMORY[0x19AEA32A0](v17);
  }
}

- (BOOL)hasWebScriptKey:(id)a3
{
  JSC::VM ***v5;
  JSC::VM **v6;
  char hasProperty;
  JSC::VM *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  int v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  JSC::VM *v15;
  uint64_t v16;
  uint64_t v17;
  WTF::StringImpl *v18;
  _BYTE v19[8];
  WTF::StringImpl *v20;

  if (!-[WebScriptObject _isSafeScript](self, "_isSafeScript"))
    return 0;
  v5 = *(JSC::VM ****)(-[WebScriptObject _rootObject](self, "_rootObject") + 24);
  if (v5)
    v6 = *v5;
  else
    v6 = 0;
  v8 = v6[7];
  MEMORY[0x19AEA3294](v19, v8);
  -[WebScriptObject _imp](self, "_imp");
  MEMORY[0x19AEA5508](&v18, a3);
  v10 = v18;
  if (v18)
  {
    if ((*((_BYTE *)v18 + 16) & 0x10) != 0)
    {
      *(_DWORD *)v18 += 2;
    }
    else
    {
      WTF::AtomStringImpl::addSlowCase();
      v10 = v20;
    }
  }
  v11 = *(_DWORD *)v10;
  *(_DWORD *)v10 += 2;
  if (v11)
    *(_DWORD *)v10 = v11;
  else
    WTF::StringImpl::destroy(v10, v9);
  hasProperty = JSC::JSObject::hasProperty();
  if (*(_DWORD *)v10 == 2)
    WTF::StringImpl::destroy(v10, v12);
  else
    *(_DWORD *)v10 -= 2;
  v13 = v18;
  v18 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v12);
    else
      *(_DWORD *)v13 -= 2;
  }
  if (*((_QWORD *)v8 + 2))
  {
    v15 = v6[7];
    v16 = *((_QWORD *)v15 + 2);
    JSC::VM::clearException(v15);
    v17 = JSC::VM::deprecatedVMEntryGlobalObject(v6[7], (JSC::JSGlobalObject *)v6);
    if (v16 && v17)
      WebCore::reportException((JSC::JSGlobalObject *)v6, v16, 0, 0, 0);
    JSC::VM::clearException(v8);
  }
  MEMORY[0x19AEA32A0](v19);
  return hasProperty;
}

- (NSString)stringRepresentation
{
  JSC::JSGlobalObject **v3;
  JSC::JSGlobalObject *v4;
  NSString *v5;
  _BYTE v7[8];

  if (!-[WebScriptObject _isSafeScript](self, "_isSafeScript"))
    return 0;
  v3 = *(JSC::JSGlobalObject ***)(-[WebScriptObject _rootObject](self, "_rootObject") + 24);
  if (v3)
    v4 = *v3;
  else
    v4 = 0;
  JSC::JSLockHolder::JSLockHolder();
  v5 = (NSString *)objc_msgSend((id)JSC::Bindings::convertValueToObjcValue(v4, (unint64_t)-[WebScriptObject _imp](self, "_imp"), 1), "description");
  MEMORY[0x19AEA32A0](v7);
  return v5;
}

- (id)webScriptValueAtIndex:(unsigned int)index
{
  uint64_t v3;
  JSC::VM ***v5;
  JSC::VM **v6;
  id v7;
  JSC::VM *v8;
  uint64_t v9;
  JSC::VM *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[8];

  v3 = *(_QWORD *)&index;
  if (!-[WebScriptObject _isSafeScript](self, "_isSafeScript"))
    return 0;
  v5 = *(JSC::VM ****)(-[WebScriptObject _rootObject](self, "_rootObject") + 24);
  if (v5)
    v6 = *v5;
  else
    v6 = 0;
  v8 = v6[7];
  MEMORY[0x19AEA3294](v14, v8);
  v9 = JSC::JSObject::get((JSC::JSObject *)-[WebScriptObject _imp](self, "_imp"), (JSC::JSGlobalObject *)v6, v3);
  if (*((_QWORD *)v8 + 2))
  {
    v11 = v6[7];
    v12 = *((_QWORD *)v11 + 2);
    JSC::VM::clearException(v11);
    v13 = JSC::VM::deprecatedVMEntryGlobalObject(v6[7], (JSC::JSGlobalObject *)v6);
    if (v12 && v13)
      WebCore::reportException((JSC::JSGlobalObject *)v6, v12, 0, 0, 0);
    JSC::VM::clearException(v8);
    v9 = 10;
  }
  v7 = +[WebScriptObject _convertValueToObjcValue:originRootObject:rootObject:](WebScriptObject, "_convertValueToObjcValue:originRootObject:rootObject:", v9, -[WebScriptObject _originRootObject](self, "_originRootObject"), -[WebScriptObject _rootObject](self, "_rootObject"));
  MEMORY[0x19AEA32A0](v14);
  return v7;
}

- (void)setWebScriptValueAtIndex:(unsigned int)index value:(id)value
{
  uint64_t v4;
  JSC::VM ***v6;
  JSC::VM **v7;
  JSC::VM *v8;
  void (*v9)(void *, JSC::VM **, uint64_t, unint64_t, _QWORD);
  void *v10;
  unint64_t v11;
  JSC::VM *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  JSC::JSGlobalObject *v16;

  v4 = *(_QWORD *)&index;
  v16 = (JSC::JSGlobalObject *)value;
  if (-[WebScriptObject _isSafeScript](self, "_isSafeScript"))
  {
    v6 = *(JSC::VM ****)(-[WebScriptObject _rootObject](self, "_rootObject") + 24);
    if (v6)
      v7 = *v6;
    else
      v7 = 0;
    v8 = v7[7];
    MEMORY[0x19AEA3294](&v15, v8);
    v9 = *(void (**)(void *, JSC::VM **, uint64_t, unint64_t, _QWORD))(16
                                                                                      * *(unsigned int *)(16 * (*(_DWORD *)-[WebScriptObject _imp](self, "_imp") & 0xFFFFFFFE) + 0x4C)
                                                                                      + 0x50);
    v10 = -[WebScriptObject _imp](self, "_imp");
    v11 = JSC::Bindings::convertObjcValueToValue((JSC::Bindings *)v7, &v16, 1, (JSC::Bindings::Instance *)-[WebScriptObject _rootObject](self, "_rootObject"));
    v9(v10, v7, v4, v11, 0);
    if (*((_QWORD *)v8 + 2))
    {
      v12 = v7[7];
      v13 = *((_QWORD *)v12 + 2);
      JSC::VM::clearException(v12);
      v14 = JSC::VM::deprecatedVMEntryGlobalObject(v7[7], (JSC::JSGlobalObject *)v7);
      if (v13)
      {
        if (v14)
          WebCore::reportException((JSC::JSGlobalObject *)v7, v13, 0, 0, 0);
      }
      JSC::VM::clearException(v8);
    }
    MEMORY[0x19AEA32A0](&v15);
  }
}

- (void)setException:(NSString *)description
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;

  if (-[WebScriptObject _rootObject](self, "_rootObject"))
  {
    v5 = *(uint64_t **)(-[WebScriptObject _rootObject](self, "_rootObject") + 24);
    if (v5)
      v6 = *v5;
    else
      v6 = 0;
    v7 = -[NSString copy](description, "copy");
    {
      v8 = (const void *)JSC::Bindings::globalException(void)::exception;
      JSC::Bindings::globalException(void)::exception = v7;
      if (v8)
        CFRelease(v8);
    }
    else
    {
      JSC::Bindings::globalException(void)::exception = v7;
    }
    JSC::Bindings::s_exceptionEnvironment = v6;
  }
}

- (JSObjectRef)JSObject
{
  OpaqueJSValue *v3;
  _BYTE v5[8];

  if (!-[WebScriptObject _isSafeScript](self, "_isSafeScript"))
    return 0;
  -[WebScriptObject _rootObject](self, "_rootObject");
  JSC::JSLockHolder::JSLockHolder();
  v3 = -[WebScriptObject _imp](self, "_imp");
  MEMORY[0x19AEA32A0](v5);
  return v3;
}

+ (id)_convertValueToObjcValue:(JSValue)a3 originRootObject:(void *)a4 rootObject:(void *)a5
{
  unsigned int v7;
  uint64_t v9;
  _BOOL4 v10;
  char **v11;
  BOOL v12;
  uint64_t v13;
  WebCore::HTMLPlugInElement *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  double isa_low;
  JSC::JSGlobalObject **v22;
  JSC::JSGlobalObject *v23;
  _BYTE v24[8];

  if (((unint64_t)a3.super.isa & 0xFFFE000000000002) != 0)
  {
    if ((unint64_t)a3.super.isa >> 49)
    {
      *(_QWORD *)&isa_low = (char *)a3.super.isa - 0x2000000000000;
      if ((unint64_t)a3.super.isa >= 0xFFFE000000000000)
        isa_low = (double)SLODWORD(a3.super.isa);
      return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", isa_low);
    }
  }
  else
  {
    v7 = *((unsigned __int8 *)a3.super.isa + 5);
    if (v7 >= 0x17)
    {
      MEMORY[0x19AEA3294](v24, *(_QWORD *)(**((_QWORD **)a5 + 3) + 56));
      v9 = *(unsigned int *)(16 * (*(_DWORD *)a3.super.isa & 0xFFFFFFFE) + 0x4C);
      v10 = *(_DWORD *)(16 * (*(_DWORD *)a3.super.isa & 0xFFFFFFFE) + 0x4C) != 0;
      v11 = (char **)(16 * v9);
      if ((_DWORD)v9)
        v12 = v11 == &WebCore::JSHTMLElement::s_info;
      else
        v12 = 1;
      if (!v12)
      {
        v13 = 16 * v9;
        do
        {
          v13 = *(_QWORD *)(v13 + 16);
          v10 = v13 != 0;
        }
        while ((char **)v13 != &WebCore::JSHTMLElement::s_info && v13 != 0);
      }
      if (v10)
      {
        v15 = (WebCore::HTMLPlugInElement *)*((_QWORD *)a3.super.isa + 3);
        if (!(*(unsigned int (**)(WebCore::HTMLPlugInElement *))(*(_QWORD *)v15 + 200))(v15))
          goto LABEL_30;
        v16 = WebCore::HTMLPlugInElement::bindingsInstance(v15);
        if (!v16)
          goto LABEL_30;
        v17 = *(_QWORD *)(v16 + 16);
        if (!v17 || !*(_BYTE *)(v17 + 12))
          goto LABEL_30;
      }
      else
      {
        if (v11 != &JSC::Bindings::ObjCRuntimeObject::s_info)
        {
LABEL_30:
          v19 = +[WebScriptObject scriptObjectForJSObject:originRootObject:rootObject:](WebScriptObject, "scriptObjectForJSObject:originRootObject:rootObject:", a3.super.isa, a4, a5);
LABEL_31:
          MEMORY[0x19AEA32A0](v24);
          return v19;
        }
        v16 = *((_QWORD *)a3.super.isa + 2);
        if (!v16)
        {
          v19 = 0;
          goto LABEL_31;
        }
      }
      v19 = *(id *)(v16 + 32);
      goto LABEL_31;
    }
    if (v7 == 2)
    {
      v18 = *((_QWORD *)a3.super.isa + 1);
      if ((v18 & 1) != 0)
      {
        v22 = (JSC::JSGlobalObject **)*((_QWORD *)a5 + 3);
        if (v22)
          v23 = *v22;
        else
          v23 = 0;
        if (*(_QWORD *)JSC::JSRopeString::resolveRope(a3.super.isa, v23))
          return (id)WTF::StringImpl::operator NSString *();
      }
      else if (v18)
      {
        return (id)WTF::StringImpl::operator NSString *();
      }
      return &stru_1E3487BC0;
    }
  }
  if (((unint64_t)a3.super.isa & 0xFFFFFFFFFFFFFFFELL) == 6)
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3.super.isa == (Class)7, a4, a5);
  if (a3.super.isa != (Class)10)
    return 0;
  return +[WebUndefined undefined](WebUndefined, "undefined");
}

- (JSValue)JSValue
{
  void *v3;
  OpaqueJSValue *v4;

  if (!-[WebScriptObject _isSafeScript](self, "_isSafeScript"))
    return 0;
  v3 = (void *)MEMORY[0x1E0CBE108];
  v4 = -[WebScriptObject JSObject](self, "JSObject");
  return (JSValue *)objc_msgSend(v3, "valueWithJSValueRef:inContext:", v4, objc_msgSend(MEMORY[0x1E0CBE0F0], "contextWithJSGlobalContextRef:", -[WebScriptObject _globalContextRef](self, "_globalContextRef")));
}

@end
