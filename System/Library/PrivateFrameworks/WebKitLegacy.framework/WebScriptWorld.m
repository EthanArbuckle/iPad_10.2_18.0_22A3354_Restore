@implementation WebScriptWorld

- (WebScriptWorld)initWithWorld:(void *)a3
{
  WebScriptWorld *v4;
  void *v5;
  WebScriptWorldPrivate *v6;
  DOMWrapperWorld *v7;
  DOMWrapperWorld *m_ptr;
  uint64_t *v9;
  DOMWrapperWorld *v10;
  WTF *v11;
  WTF *v12;
  WTF *v13;
  void *v14;
  uint64_t v15;
  int v16;
  WTF **v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unsigned int v22;
  int i;
  unsigned int v24;
  WTF **v25;
  WTF *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unsigned int v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)WebScriptWorld;
  v4 = -[WebScriptWorld init](&v33, sel_init);
  if (!v4)
    return v4;
  v6 = objc_alloc_init(WebScriptWorldPrivate);
  v4->_private = v6;
  v7 = *(DOMWrapperWorld **)a3;
  *(_QWORD *)a3 = 0;
  m_ptr = v6->world.m_ptr;
  v6->world.m_ptr = v7;
  if (!m_ptr)
  {
LABEL_5:
    if (byte_1ECEC97C2 == 1)
      goto LABEL_6;
    goto LABEL_11;
  }
  if (*(_DWORD *)m_ptr != 1)
  {
    --*(_DWORD *)m_ptr;
    goto LABEL_5;
  }
  v13 = (WTF *)MEMORY[0x1D82A4B08]();
  WTF::fastFree(v13, v14);
  if (byte_1ECEC97C2 == 1)
  {
LABEL_6:
    v9 = (uint64_t *)qword_1ECEC97D8;
    v10 = v4->_private->world.m_ptr;
    v11 = (WTF *)*((_QWORD *)v10 + 1);
    if (!v11)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_11:
  v9 = (uint64_t *)WTF::fastMalloc((WTF *)8);
  *v9 = 0;
  qword_1ECEC97D8 = (uint64_t)v9;
  byte_1ECEC97C2 = 1;
  v10 = v4->_private->world.m_ptr;
  v11 = (WTF *)*((_QWORD *)v10 + 1);
  if (!v11)
  {
LABEL_7:
    v11 = (WTF *)WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)v11 = 1;
    *((_QWORD *)v11 + 1) = v10;
    v12 = (WTF *)*((_QWORD *)v10 + 1);
    *((_QWORD *)v10 + 1) = v11;
    if (v12)
    {
      if (*(_DWORD *)v12 == 1)
      {
        WTF::fastFree(v12, v5);
        v11 = (WTF *)*((_QWORD *)v10 + 1);
      }
      else
      {
        --*(_DWORD *)v12;
      }
    }
  }
LABEL_14:
  ++*(_DWORD *)v11;
  v15 = *v9;
  if (*v9
    || (WTF::HashTable<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *>>,WTF::DefaultHash<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *,WTF::DefaultHash<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashTraits<WebScriptWorld *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>>::rehash(v9, 8u), (v15 = *v9) != 0))
  {
    v16 = *(_DWORD *)(v15 - 8);
  }
  else
  {
    v16 = 0;
  }
  v17 = 0;
  v18 = *((_QWORD *)v11 + 1);
  v19 = (~(v18 << 32) + v18) ^ ((unint64_t)(~(v18 << 32) + v18) >> 22);
  v20 = 9 * ((v19 + ~(v19 << 13)) ^ ((v19 + ~(v19 << 13)) >> 8));
  v21 = (v20 ^ (v20 >> 15)) + ~((v20 ^ (v20 >> 15)) << 27);
  v22 = (v21 >> 31) ^ v21;
  for (i = 1; ; ++i)
  {
    v24 = v22 & v16;
    v25 = (WTF **)(v15 + 16 * v24);
    v26 = *v25;
    if (*v25 == (WTF *)-1)
    {
      v17 = (WTF **)(v15 + 16 * v24);
      goto LABEL_19;
    }
    if (!v26)
    {
      if (v17)
      {
        *v17 = 0;
        v17[1] = 0;
        --*(_DWORD *)(*v9 - 16);
        *v17 = v11;
        v17[1] = (WTF *)v4;
        v28 = *v9;
        if (*v9)
          goto LABEL_28;
      }
      else
      {
        *v25 = v11;
        v25[1] = (WTF *)v4;
        v28 = *v9;
        if (*v9)
        {
LABEL_28:
          ++*(_DWORD *)(v28 - 12);
          v29 = *v9;
          if (*v9)
            goto LABEL_29;
          goto LABEL_35;
        }
      }
      *(_DWORD *)(v28 - 12) = 1;
      v29 = *v9;
      if (*v9)
      {
LABEL_29:
        v30 = (*(_DWORD *)(v29 - 16) + *(_DWORD *)(v29 - 12));
        v31 = *(unsigned int *)(v29 - 4);
        if (v31 <= 0x400)
          goto LABEL_30;
        goto LABEL_36;
      }
LABEL_35:
      v30 = *(unsigned int *)(v29 - 16);
      v31 = *(unsigned int *)(v29 - 4);
      if (v31 <= 0x400)
      {
LABEL_30:
        if (3 * v31 > 4 * v30)
          return v4;
        if (!(_DWORD)v31)
        {
          v32 = 8;
LABEL_38:
          WTF::HashTable<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *>>,WTF::DefaultHash<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *,WTF::DefaultHash<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashTraits<WebScriptWorld *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>>::rehash(v9, v32);
          return v4;
        }
LABEL_37:
        v32 = (_DWORD)v31 << (6 * *(_DWORD *)(v29 - 12) >= (2 * v31));
        goto LABEL_38;
      }
LABEL_36:
      if (v31 > 2 * v30)
        return v4;
      goto LABEL_37;
    }
    if (*((_QWORD *)v26 + 1) == v18)
      break;
LABEL_19:
    v22 = i + v24;
  }
  if (*(_DWORD *)v11 != 1)
  {
    --*(_DWORD *)v11;
    return v4;
  }
  WTF::fastFree(v11, v5);
  return v4;
}

- (WebScriptWorld)init
{
  StringImpl *v3;
  WebScriptWorld *v4;
  _DWORD *v5;
  WTF::StringImpl *v6;
  WTF *v8;
  void *v9;
  WTF::StringImpl *v10;
  _DWORD *v11;

  WTF::StringImpl::createWithoutCopyingNonEmpty();
  WebCore::ScriptController::createWorld();
  v4 = -[WebScriptWorld initWithWorld:](self, "initWithWorld:", &v11);
  v5 = v11;
  v11 = 0;
  if (v5)
  {
    if (*v5 == 1)
    {
      v8 = (WTF *)MEMORY[0x1D82A4B08]();
      WTF::fastFree(v8, v9);
      v6 = v10;
      if (!v10)
        return v4;
      goto LABEL_5;
    }
    --*v5;
  }
  v6 = v10;
  if (!v10)
    return v4;
LABEL_5:
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    return v4;
  }
  WTF::StringImpl::destroy(v6, v3);
  return v4;
}

- (void)unregisterWorld
{
  WebCore::DOMWrapperWorld::clearWrappers((WebCore::DOMWrapperWorld *)self->_private->world.m_ptr);
}

- (void)dealloc
{
  uint64_t *v3;
  uint64_t v4;
  DOMWrapperWorld *m_ptr;
  int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  int i;
  WTF *v12;
  _QWORD *v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  _QWORD *v18;
  objc_super v19;

  if ((byte_1ECEC97C2 & 1) == 0)
  {
    v18 = (_QWORD *)WTF::fastMalloc((WTF *)8);
    *v18 = 0;
    qword_1ECEC97D8 = (uint64_t)v18;
    byte_1ECEC97C2 = 1;
    goto LABEL_22;
  }
  v3 = (uint64_t *)qword_1ECEC97D8;
  v4 = *(_QWORD *)qword_1ECEC97D8;
  if (*(_QWORD *)qword_1ECEC97D8)
  {
    m_ptr = self->_private->world.m_ptr;
    v6 = *(_DWORD *)(v4 - 8);
    v7 = ((unint64_t)m_ptr + ~((_QWORD)m_ptr << 32)) ^ (((unint64_t)m_ptr + ~((_QWORD)m_ptr << 32)) >> 22);
    v8 = 9 * ((v7 + ~(v7 << 13)) ^ ((v7 + ~(v7 << 13)) >> 8));
    v9 = (v8 ^ (v8 >> 15)) + ~((v8 ^ (v8 >> 15)) << 27);
    v10 = v6 & ((v9 >> 31) ^ v9);
    for (i = 1; ; ++i)
    {
      v12 = *(WTF **)(v4 + 16 * v10);
      if (v12 != (WTF *)-1)
      {
        if (!v12)
          goto LABEL_22;
        if (*((DOMWrapperWorld **)v12 + 1) == m_ptr)
          break;
      }
      v10 = (v10 + i) & v6;
    }
    if (v10 != *(_DWORD *)(v4 - 4))
    {
      v13 = (_QWORD *)(v4 + 16 * v10);
      *v13 = 0;
      if (*(_DWORD *)v12 == 1)
        WTF::fastFree(v12, (void *)a2);
      else
        --*(_DWORD *)v12;
      *v13 = -1;
      ++*(_DWORD *)(*v3 - 16);
      if (*v3)
      {
        --*(_DWORD *)(*v3 - 12);
        v14 = *v3;
        if (!*v3)
          goto LABEL_22;
      }
      else
      {
        MEMORY[0xFFFFFFFFFFFFFFF4] = -1;
        v14 = *v3;
        if (!*v3)
          goto LABEL_22;
      }
      v15 = 6 * *(_DWORD *)(v14 - 12);
      v16 = *(_DWORD *)(v14 - 4);
      if (v15 < v16 && v16 >= 9)
        WTF::HashTable<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *>>,WTF::DefaultHash<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *,WTF::DefaultHash<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashTraits<WebScriptWorld *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>>::rehash(v3, v16 >> 1);
    }
  }
LABEL_22:

  self->_private = 0;
  v19.receiver = self;
  v19.super_class = (Class)WebScriptWorld;
  -[WebScriptWorld dealloc](&v19, sel_dealloc);
}

+ (id)standardWorld
{
  id result;
  WebScriptWorld *v3;
  _DWORD *v4;
  WebScriptWorld *v5;
  _DWORD *v6;

  if (_MergedGlobals_10 == 1)
    return (id)qword_1ECEC97C8;
  v3 = [WebScriptWorld alloc];
  v4 = (_DWORD *)WebCore::mainThreadNormalWorld((WebCore *)v3);
  ++*v4;
  v6 = v4;
  v5 = -[WebScriptWorld initWithWorld:](v3, "initWithWorld:", &v6);
  WTF::Ref<WebCore::DOMWrapperWorld,WTF::RawPtrTraits<WebCore::DOMWrapperWorld>,WTF::DefaultRefDerefTraits<WebCore::DOMWrapperWorld>>::~Ref(&v6);
  result = v5;
  qword_1ECEC97C8 = (uint64_t)v5;
  _MergedGlobals_10 = 1;
  return result;
}

+ (id)world
{
  return (id)(id)CFMakeCollectable(objc_alloc_init((Class)a1));
}

+ (id)scriptWorldForGlobalContext:(OpaqueJSContext *)a3
{
  return (id)objc_msgSend(a1, "findOrCreateWorld:", *((_QWORD *)a3 + 415));
}

+ (id)scriptWorldForJavaScriptContext:(id)a3
{
  return (id)objc_msgSend(a1, "scriptWorldForGlobalContext:", objc_msgSend(a3, "JSGlobalContextRef"));
}

+ (id)findOrCreateWorld:(void *)a3
{
  uint64_t v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  int i;
  uint64_t v12;
  uint64_t v13;
  CFTypeRef v14;
  _QWORD *v16;
  id v17;
  _DWORD *v18;
  WTF *v19;
  void *v20;
  _DWORD *v21;

  if ((void *)WebCore::mainThreadNormalWorld((WebCore *)a1) == a3)
    return (id)objc_msgSend(a1, "standardWorld");
  if ((byte_1ECEC97C2 & 1) != 0)
  {
    v5 = *(_QWORD *)qword_1ECEC97D8;
    if (*(_QWORD *)qword_1ECEC97D8)
    {
      v6 = *(_DWORD *)(v5 - 8);
      v7 = ((unint64_t)a3 + ~((_QWORD)a3 << 32)) ^ (((unint64_t)a3 + ~((_QWORD)a3 << 32)) >> 22);
      v8 = 9 * ((v7 + ~(v7 << 13)) ^ ((v7 + ~(v7 << 13)) >> 8));
      v9 = (v8 ^ (v8 >> 15)) + ~((v8 ^ (v8 >> 15)) << 27);
      v10 = v6 & ((v9 >> 31) ^ v9);
      for (i = 1; ; ++i)
      {
        v12 = v10;
        v13 = *(_QWORD *)(v5 + 16 * v10);
        if (v13 != -1)
        {
          if (!v13)
            goto LABEL_13;
          if (*(void **)(v13 + 8) == a3)
            break;
        }
        v10 = (v12 + i) & v6;
      }
      v14 = *(CFTypeRef *)(v5 + 16 * v12 + 8);
      if (v14)
        return (id)v14;
    }
  }
  else
  {
    v16 = (_QWORD *)WTF::fastMalloc((WTF *)8);
    *v16 = 0;
    qword_1ECEC97D8 = (uint64_t)v16;
    byte_1ECEC97C2 = 1;
  }
LABEL_13:
  v17 = objc_alloc((Class)a1);
  ++*(_DWORD *)a3;
  v21 = a3;
  v14 = (id)CFMakeCollectable((CFTypeRef)objc_msgSend(v17, "initWithWorld:", &v21));
  v18 = v21;
  v21 = 0;
  if (!v18)
    return (id)v14;
  if (*v18 == 1)
  {
    v19 = (WTF *)MEMORY[0x1D82A4B08]();
    WTF::fastFree(v19, v20);
  }
  else
  {
    --*v18;
  }
  return (id)v14;
}

@end
