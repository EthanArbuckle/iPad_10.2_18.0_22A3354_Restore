@implementation WebHistoryItem

- (WebHistoryItem)init
{
  uint64_t v3;
  uint64_t v4;
  StringImpl *v5;
  WebHistoryItem *v6;
  _DWORD *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF *v12;
  void *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  _DWORD *v17;
  _BYTE v18[24];

  {
    v3 = LegacyHistoryItemClient::singleton(void)::client;
  }
  else
  {
    v3 = WTF::fastMalloc((WTF *)0x10);
    *(_DWORD *)(v3 + 8) = 1;
    *(_QWORD *)v3 = off_1E9D69F78;
    LegacyHistoryItemClient::singleton(void)::client = v3;
  }
  v15 = 0;
  v16 = 0;
  v14 = 0;
  v4 = WTF::fastMalloc((WTF *)0x1E0);
  v18[0] = 0;
  v18[16] = 0;
  MEMORY[0x1D82A3F14](v4, v3, &v16, &v15, &v14, v18);
  v17 = (_DWORD *)v4;
  v6 = -[WebHistoryItem initWithWebCoreHistoryItem:](self, "initWithWebCoreHistoryItem:", &v17);
  v7 = v17;
  v17 = 0;
  if (v7)
  {
    if (*v7 == 1)
    {
      v12 = (WTF *)MEMORY[0x1D82A3F20]();
      WTF::fastFree(v12, v13);
      v8 = v14;
      v14 = 0;
      if (!v8)
        goto LABEL_10;
      goto LABEL_7;
    }
    --*v7;
  }
  v8 = v14;
  v14 = 0;
  if (!v8)
    goto LABEL_10;
LABEL_7:
  if (*(_DWORD *)v8 == 2)
    WTF::StringImpl::destroy(v8, v5);
  else
    *(_DWORD *)v8 -= 2;
LABEL_10:
  v9 = v15;
  v15 = 0;
  if (!v9)
    goto LABEL_13;
  if (*(_DWORD *)v9 != 2)
  {
    *(_DWORD *)v9 -= 2;
LABEL_13:
    v10 = v16;
    v16 = 0;
    if (!v10)
      return v6;
    goto LABEL_16;
  }
  WTF::StringImpl::destroy(v9, v5);
  v10 = v16;
  v16 = 0;
  if (!v10)
    return v6;
LABEL_16:
  if (*(_DWORD *)v10 != 2)
  {
    *(_DWORD *)v10 -= 2;
    return v6;
  }
  WTF::StringImpl::destroy(v10, v5);
  return v6;
}

- (WebHistoryItem)initWithURLString:(NSString *)URLString title:(NSString *)title lastVisitedTimeInterval:(NSTimeInterval)time
{
  NSString *v7;
  uint64_t v9;
  uint64_t v10;
  StringImpl *v11;
  WebHistoryItem *v12;
  _DWORD *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF *v18;
  void *v19;
  uint64_t v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  _DWORD *v25;
  _BYTE v26[24];

  v7 = URLString;
  {
    v9 = LegacyHistoryItemClient::singleton(void)::client;
  }
  else
  {
    v21 = WTF::fastMalloc((WTF *)0x10);
    v7 = URLString;
    v9 = v21;
    *(_DWORD *)(v21 + 8) = 1;
    *(_QWORD *)v21 = off_1E9D69F78;
    LegacyHistoryItemClient::singleton(void)::client = v21;
  }
  MEMORY[0x1D82A3998](&v24, v7);
  MEMORY[0x1D82A3998](&v23, title);
  v22 = 0;
  v10 = WTF::fastMalloc((WTF *)0x1E0);
  v26[0] = 0;
  v26[16] = 0;
  MEMORY[0x1D82A3F14](v10, v9, &v24, &v23, &v22, v26);
  v25 = (_DWORD *)v10;
  v12 = -[WebHistoryItem initWithWebCoreHistoryItem:](self, "initWithWebCoreHistoryItem:", &v25);
  v13 = v25;
  v25 = 0;
  if (v13)
  {
    if (*v13 == 1)
    {
      v18 = (WTF *)MEMORY[0x1D82A3F20]();
      WTF::fastFree(v18, v19);
      v14 = v22;
      v22 = 0;
      if (!v14)
        goto LABEL_10;
      goto LABEL_7;
    }
    --*v13;
  }
  v14 = v22;
  v22 = 0;
  if (!v14)
    goto LABEL_10;
LABEL_7:
  if (*(_DWORD *)v14 == 2)
    WTF::StringImpl::destroy(v14, v11);
  else
    *(_DWORD *)v14 -= 2;
LABEL_10:
  v15 = v23;
  v23 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
    {
      WTF::StringImpl::destroy(v15, v11);
      v16 = v24;
      v24 = 0;
      if (!v16)
        goto LABEL_19;
      goto LABEL_16;
    }
    *(_DWORD *)v15 -= 2;
  }
  v16 = v24;
  v24 = 0;
  if (!v16)
    goto LABEL_19;
LABEL_16:
  if (*(_DWORD *)v16 == 2)
    WTF::StringImpl::destroy(v16, v11);
  else
    *(_DWORD *)v16 -= 2;
LABEL_19:
  v12->_private->_lastVisitedTime = time;
  return v12;
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  __objc2_class **p_superclass;
  HistoryItem *m_ptr;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  int i;
  uint64_t v13;
  _QWORD *v14;
  unsigned int v15;
  unsigned int v16;
  __objc2_class *v17;
  __objc2_class *v18;
  unsigned int v19;
  unsigned int info_high;
  _QWORD *v22;
  objc_super v23;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    if ((_MergedGlobals_18 & 1) != 0)
    {
      p_superclass = &OBJC_METACLASS____WebSafeAsyncForwarder.superclass;
      if (!qword_1ECEC98B8)
        goto LABEL_24;
      m_ptr = self->_private->_historyItem.m_ptr;
      v7 = *(_DWORD *)(qword_1ECEC98B8 - 8);
      v8 = ((unint64_t)m_ptr + ~((_QWORD)m_ptr << 32)) ^ (((unint64_t)m_ptr + ~((_QWORD)m_ptr << 32)) >> 22);
      v9 = 9 * ((v8 + ~(v8 << 13)) ^ ((v8 + ~(v8 << 13)) >> 8));
      v10 = (v9 ^ (v9 >> 15)) + ~((v9 ^ (v9 >> 15)) << 27);
      v11 = v7 & ((v10 >> 31) ^ v10);
      for (i = 1; ; v11 = (v11 + i++) & v7)
      {
        v13 = *(_QWORD *)(qword_1ECEC98B8 + 16 * v11);
        if (v13 != -1)
        {
          if (!v13)
            goto LABEL_24;
          if (*(HistoryItem **)(v13 + 8) == m_ptr)
            break;
        }
      }
      if (v11 == *(_DWORD *)(qword_1ECEC98B8 - 4))
        goto LABEL_24;
      v14 = (_QWORD *)(qword_1ECEC98B8 + 16 * v11);
      *v14 = 0;
      do
      {
        v15 = __ldaxr((unsigned int *)v13);
        v16 = v15 - 1;
      }
      while (__stlxr(v16, (unsigned int *)v13));
      if (!v16)
      {
        atomic_store(1u, (unsigned int *)v13);
        v22 = v14;
        WTF::fastFree((WTF *)v13, v4);
        v14 = v22;
        p_superclass = (__objc2_class **)(&OBJC_METACLASS____WebSafeAsyncForwarder + 8);
      }
      *v14 = -1;
      v17 = p_superclass[279];
      ++LODWORD(v17[-1].vtable);
      if (v17)
      {
        --HIDWORD(v17[-1].vtable);
        v18 = p_superclass[279];
        if (!v18)
          goto LABEL_24;
LABEL_18:
        v19 = 6 * HIDWORD(v18[-1].vtable);
        info_high = HIDWORD(v18[-1].info);
        if (v19 < info_high && info_high >= 9)
          WTF::HashTable<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>>,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WebHistoryItem *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>>::rehash(info_high >> 1);
        goto LABEL_24;
      }
      MEMORY[0xFFFFFFFFFFFFFFF4] = -1;
      v18 = p_superclass[279];
      if (v18)
        goto LABEL_18;
    }
    else
    {
      qword_1ECEC98B8 = 0;
      _MergedGlobals_18 = 1;
    }
LABEL_24:

    v23.receiver = self;
    v23.super_class = (Class)WebHistoryItem;
    -[WebHistoryItem dealloc](&v23, sel_dealloc);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  _QWORD *v5;
  _DWORD *v6;
  WTF *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  int i;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unsigned int v35;
  _DWORD *v36;

  v4 = objc_alloc((Class)objc_opt_class());
  WebCore::HistoryItem::copy((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  v5 = (_QWORD *)objc_msgSend(v4, "initWithWebCoreHistoryItem:", &v36);
  v6 = v36;
  v36 = 0;
  if (v6)
  {
    if (*v6 == 1)
    {
      v7 = (WTF *)MEMORY[0x1D82A3F20]();
      WTF::fastFree(v7, v8);
    }
    else
    {
      --*v6;
    }
  }
  *(double *)(v5[1] + 16) = self->_private->_lastVisitedTime;
  if ((_MergedGlobals_18 & 1) != 0)
  {
    v9 = *(_QWORD *)(v5[1] + 8);
    v10 = *(_QWORD *)(v9 + 8);
    if (!v10)
      goto LABEL_7;
  }
  else
  {
    qword_1ECEC98B8 = 0;
    _MergedGlobals_18 = 1;
    v9 = *(_QWORD *)(v5[1] + 8);
    v10 = *(_QWORD *)(v9 + 8);
    if (!v10)
    {
LABEL_7:
      v10 = WTF::fastCompactMalloc((WTF *)0x10);
      *(_DWORD *)v10 = 1;
      *(_QWORD *)(v10 + 8) = v9;
      v12 = *(unsigned int **)(v9 + 8);
      *(_QWORD *)(v9 + 8) = v10;
      if (v12)
      {
        do
        {
          v13 = __ldaxr(v12);
          v14 = v13 - 1;
        }
        while (__stlxr(v14, v12));
        if (!v14)
        {
          atomic_store(1u, v12);
          WTF::fastFree((WTF *)v12, v11);
        }
        v10 = *(_QWORD *)(v9 + 8);
      }
      goto LABEL_12;
    }
  }
  do
LABEL_12:
    v15 = __ldaxr((unsigned int *)v10);
  while (__stlxr(v15 + 1, (unsigned int *)v10));
  v16 = qword_1ECEC98B8;
  if (qword_1ECEC98B8
    || (WTF::HashTable<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>>,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WebHistoryItem *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>>::rehash(8u),
        (v16 = qword_1ECEC98B8) != 0))
  {
    v17 = *(_DWORD *)(v16 - 8);
  }
  else
  {
    v17 = 0;
  }
  v18 = 0;
  v19 = *(_QWORD *)(v10 + 8);
  v20 = (~(v19 << 32) + v19) ^ ((unint64_t)(~(v19 << 32) + v19) >> 22);
  v21 = 9 * ((v20 + ~(v20 << 13)) ^ ((v20 + ~(v20 << 13)) >> 8));
  v22 = (v21 ^ (v21 >> 15)) + ~((v21 ^ (v21 >> 15)) << 27);
  v23 = (v22 >> 31) ^ v22;
  for (i = 1; ; ++i)
  {
    v25 = v23 & v17;
    v26 = (uint64_t *)(v16 + 16 * v25);
    v27 = *v26;
    if (*v26 == -1)
    {
      v18 = (uint64_t *)(v16 + 16 * v25);
      goto LABEL_18;
    }
    if (!v27)
    {
      if (v18)
      {
        *v18 = 0;
        v18[1] = 0;
        --*(_DWORD *)(v16 - 16);
        *v18 = v10;
        v18[1] = (uint64_t)v5;
        v31 = qword_1ECEC98B8;
        if (qword_1ECEC98B8)
          goto LABEL_28;
      }
      else
      {
        *v26 = v10;
        v26[1] = (uint64_t)v5;
        v31 = qword_1ECEC98B8;
        if (qword_1ECEC98B8)
        {
LABEL_28:
          ++*(_DWORD *)(v31 - 12);
          v32 = qword_1ECEC98B8;
          if (qword_1ECEC98B8)
            goto LABEL_29;
          goto LABEL_35;
        }
      }
      *(_DWORD *)(v31 - 12) = 1;
      v32 = qword_1ECEC98B8;
      if (qword_1ECEC98B8)
      {
LABEL_29:
        v33 = (*(_DWORD *)(v32 - 16) + *(_DWORD *)(v32 - 12));
        v34 = *(unsigned int *)(v32 - 4);
        if (v34 <= 0x400)
          goto LABEL_30;
        goto LABEL_36;
      }
LABEL_35:
      v33 = *(unsigned int *)(v32 - 16);
      v34 = *(unsigned int *)(v32 - 4);
      if (v34 <= 0x400)
      {
LABEL_30:
        if (3 * v34 > 4 * v33)
          return v5;
        if (!(_DWORD)v34)
        {
          v35 = 8;
LABEL_38:
          WTF::HashTable<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>>,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WebHistoryItem *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>>::rehash(v35);
          return v5;
        }
LABEL_37:
        v35 = (_DWORD)v34 << (6 * *(_DWORD *)(v32 - 12) >= (2 * v34));
        goto LABEL_38;
      }
LABEL_36:
      if (v34 > 2 * v33)
        return v5;
      goto LABEL_37;
    }
    if (*(_QWORD *)(v27 + 8) == v19)
      break;
LABEL_18:
    v23 = i + v25;
  }
  *(_QWORD *)(v16 + 16 * v25 + 8) = v5;
  if (v10)
  {
    do
    {
      v28 = __ldaxr((unsigned int *)v10);
      v29 = v28 - 1;
    }
    while (__stlxr(v29, (unsigned int *)v10));
    if (!v29)
    {
      atomic_store(1u, (unsigned int *)v10);
      WTF::fastFree((WTF *)v10, v18);
      return v5;
    }
  }
  return v5;
}

- (NSString)URLString
{
  uint64_t v2;

  v2 = *(_QWORD *)WebCore::HistoryItem::urlString((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  if (v2 && *(_DWORD *)(v2 + 4))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return 0;
}

- (NSString)originalURLString
{
  uint64_t v2;

  v2 = *(_QWORD *)WebCore::HistoryItem::originalURLString((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  if (v2 && *(_DWORD *)(v2 + 4))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return 0;
}

- (NSString)title
{
  uint64_t v2;

  v2 = *(_QWORD *)WebCore::HistoryItem::title((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  if (v2 && *(_DWORD *)(v2 + 4))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return 0;
}

- (void)setAlternateTitle:(NSString *)alternateTitle
{
  HistoryItem *m_ptr;
  StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  m_ptr = self->_private->_historyItem.m_ptr;
  MEMORY[0x1D82A3998](&v6, alternateTitle);
  WebCore::HistoryItem::setAlternateTitle((WebCore::HistoryItem *)m_ptr, (const WTF::String *)&v6);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (NSString)alternateTitle
{
  uint64_t v2;

  v2 = *(_QWORD *)WebCore::HistoryItem::alternateTitle((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  if (v2 && *(_DWORD *)(v2 + 4))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return 0;
}

- (NSTimeInterval)lastVisitedTimeInterval
{
  return self->_private->_lastVisitedTime;
}

- (unint64_t)hash
{
  __CFString *v2;

  if (*(_QWORD *)WebCore::HistoryItem::urlString((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr))
    v2 = (__CFString *)WTF::StringImpl::operator NSString *();
  else
    v2 = &stru_1E9D6EC48;
  return -[__CFString hash](v2, "hash");
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  WTF **v6;
  const WTF::StringImpl *v7;
  const WTF::StringImpl *v8;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    v6 = (WTF **)WebCore::HistoryItem::urlString((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
    v7 = *(const WTF::StringImpl **)WebCore::HistoryItem::urlString(*(WebCore::HistoryItem **)(*((_QWORD *)a3 + 1) + 8));
    LOBYTE(v5) = WTF::equal(*v6, v7, v8);
  }
  return v5;
}

- (id)description
{
  HistoryItem *m_ptr;
  void *v3;
  id v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  id result;
  int v11;
  uint64_t v12;
  unint64_t v13;
  WebCore::HistoryItem *v14;
  objc_super v15;

  m_ptr = self->_private->_historyItem.m_ptr;
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v15.receiver = self;
  v15.super_class = (Class)WebHistoryItem;
  v4 = -[WebHistoryItem description](&v15, sel_description);
  if (*(_QWORD *)WebCore::HistoryItem::urlString((WebCore::HistoryItem *)m_ptr))
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v5 = &stru_1E9D6EC48;
  v6 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v7 = *(_QWORD *)WebCore::HistoryItem::target((WebCore::HistoryItem *)m_ptr);
  if (v7 && *(_DWORD *)(v7 + 4))
  {
    if (*(_QWORD *)WebCore::HistoryItem::target((WebCore::HistoryItem *)m_ptr))
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_1E9D6EC48;
    objc_msgSend(v6, "appendFormat:", CFSTR(" in \"%@\"), v8);
  }
  if (WebCore::HistoryItem::isTargetItem((WebCore::HistoryItem *)m_ptr))
    objc_msgSend(v6, "appendString:", CFSTR(" *target*"));
  if (WebCore::HistoryItem::formData((WebCore::HistoryItem *)m_ptr))
    objc_msgSend(v6, "appendString:", CFSTR(" *POST*"));
  if (!*(_DWORD *)(WebCore::HistoryItem::children((WebCore::HistoryItem *)m_ptr) + 12))
    return v6;
  v9 = WebCore::HistoryItem::children((WebCore::HistoryItem *)m_ptr);
  result = (id)objc_msgSend(v6, "length");
  v11 = (int)result;
  v12 = *(unsigned int *)(v9 + 12);
  if (!(_DWORD)v12)
  {
LABEL_19:
    objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("\n    "), 0, v11, objc_msgSend(v6, "length") - v11);
    return v6;
  }
  v13 = 0;
  while (v13 < *(unsigned int *)(v9 + 12))
  {
    v14 = kit(*(WebCore::HistoryItem **)(*(_QWORD *)v9 + 8 * v13));
    objc_msgSend(v6, "appendString:", CFSTR("\n"));
    result = (id)objc_msgSend(v6, "appendString:", -[WebCore::HistoryItem description](v14, "description"));
    if (v12 == ++v13)
      goto LABEL_19;
  }
  __break(0xC471u);
  return result;
}

+ (id)entryWithURL:(id)a3
{
  return (id)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc((Class)a1), "initWithURL:title:", a3, 0));
}

- (WebHistoryItem)initWithURLString:(id)a3 title:(id)a4 displayTitle:(id)a5 lastVisitedTimeInterval:(double)a6
{
  id v9;
  uint64_t v11;
  uint64_t v12;
  StringImpl *v13;
  WebHistoryItem *v14;
  _DWORD *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF *v20;
  void *v21;
  uint64_t v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  _DWORD *v27;
  _BYTE v28[24];

  v9 = a3;
  {
    v11 = LegacyHistoryItemClient::singleton(void)::client;
  }
  else
  {
    v23 = WTF::fastMalloc((WTF *)0x10);
    v9 = a3;
    v11 = v23;
    *(_DWORD *)(v23 + 8) = 1;
    *(_QWORD *)v23 = off_1E9D69F78;
    LegacyHistoryItemClient::singleton(void)::client = v23;
  }
  MEMORY[0x1D82A3998](&v26, v9);
  MEMORY[0x1D82A3998](&v25, a4);
  MEMORY[0x1D82A3998](&v24, a5);
  v12 = WTF::fastMalloc((WTF *)0x1E0);
  v28[0] = 0;
  v28[16] = 0;
  MEMORY[0x1D82A3F14](v12, v11, &v26, &v25, &v24, v28);
  v27 = (_DWORD *)v12;
  v14 = -[WebHistoryItem initWithWebCoreHistoryItem:](self, "initWithWebCoreHistoryItem:", &v27);
  v15 = v27;
  v27 = 0;
  if (v15)
  {
    if (*v15 == 1)
    {
      v20 = (WTF *)MEMORY[0x1D82A3F20]();
      WTF::fastFree(v20, v21);
      v16 = v24;
      v24 = 0;
      if (!v16)
        goto LABEL_10;
      goto LABEL_7;
    }
    --*v15;
  }
  v16 = v24;
  v24 = 0;
  if (!v16)
    goto LABEL_10;
LABEL_7:
  if (*(_DWORD *)v16 == 2)
    WTF::StringImpl::destroy(v16, v13);
  else
    *(_DWORD *)v16 -= 2;
LABEL_10:
  v17 = v25;
  v25 = 0;
  if (!v17)
    goto LABEL_13;
  if (*(_DWORD *)v17 != 2)
  {
    *(_DWORD *)v17 -= 2;
LABEL_13:
    v18 = v26;
    v26 = 0;
    if (!v18)
      goto LABEL_18;
    goto LABEL_16;
  }
  WTF::StringImpl::destroy(v17, v13);
  v18 = v26;
  v26 = 0;
  if (!v18)
    goto LABEL_18;
LABEL_16:
  if (*(_DWORD *)v18 == 2)
  {
    WTF::StringImpl::destroy(v18, v13);
    if (!v14)
      return v14;
    goto LABEL_19;
  }
  *(_DWORD *)v18 -= 2;
LABEL_18:
  if (v14)
LABEL_19:
    v14->_private->_lastVisitedTime = a6;
  return v14;
}

- (WebHistoryItem)initWithWebCoreHistoryItem:(void *)a3
{
  WebHistoryItem *v4;
  WebHistoryItemPrivate *v5;
  HistoryItem *v6;
  HistoryItem *m_ptr;
  HistoryItem *v8;
  uint64_t v9;
  void *v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  int i;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unsigned int v34;
  WTF *v35;
  void *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)WebHistoryItem;
  v4 = -[WebHistoryItem init](&v37, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(WebHistoryItemPrivate);
    v4->_private = v5;
    v6 = *(HistoryItem **)a3;
    *(_QWORD *)a3 = 0;
    m_ptr = v5->_historyItem.m_ptr;
    v5->_historyItem.m_ptr = v6;
    if (m_ptr)
    {
      if (*(_DWORD *)m_ptr == 1)
      {
        v35 = (WTF *)MEMORY[0x1D82A3F20]();
        WTF::fastFree(v35, v36);
        if ((_MergedGlobals_18 & 1) != 0)
        {
LABEL_6:
          v8 = v4->_private->_historyItem.m_ptr;
          v9 = *((_QWORD *)v8 + 1);
          if (!v9)
            goto LABEL_7;
          goto LABEL_12;
        }
LABEL_34:
        qword_1ECEC98B8 = 0;
        _MergedGlobals_18 = 1;
        v8 = v4->_private->_historyItem.m_ptr;
        v9 = *((_QWORD *)v8 + 1);
        if (!v9)
        {
LABEL_7:
          v9 = WTF::fastCompactMalloc((WTF *)0x10);
          *(_DWORD *)v9 = 1;
          *(_QWORD *)(v9 + 8) = v8;
          v11 = (unsigned int *)*((_QWORD *)v8 + 1);
          *((_QWORD *)v8 + 1) = v9;
          if (v11)
          {
            do
            {
              v12 = __ldaxr(v11);
              v13 = v12 - 1;
            }
            while (__stlxr(v13, v11));
            if (!v13)
            {
              atomic_store(1u, v11);
              WTF::fastFree((WTF *)v11, v10);
            }
            v9 = *((_QWORD *)v8 + 1);
          }
          goto LABEL_12;
        }
        do
LABEL_12:
          v14 = __ldaxr((unsigned int *)v9);
        while (__stlxr(v14 + 1, (unsigned int *)v9));
        v15 = qword_1ECEC98B8;
        if (qword_1ECEC98B8
          || (WTF::HashTable<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>>,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WebHistoryItem *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>>::rehash(8u),
              (v15 = qword_1ECEC98B8) != 0))
        {
          v16 = *(_DWORD *)(v15 - 8);
        }
        else
        {
          v16 = 0;
        }
        v17 = 0;
        v18 = *(_QWORD *)(v9 + 8);
        v19 = (~(v18 << 32) + v18) ^ ((unint64_t)(~(v18 << 32) + v18) >> 22);
        v20 = 9 * ((v19 + ~(v19 << 13)) ^ ((v19 + ~(v19 << 13)) >> 8));
        v21 = (v20 ^ (v20 >> 15)) + ~((v20 ^ (v20 >> 15)) << 27);
        v22 = (v21 >> 31) ^ v21;
        for (i = 1; ; ++i)
        {
          v24 = v22 & v16;
          v25 = (uint64_t *)(v15 + 16 * v24);
          v26 = *v25;
          if (*v25 == -1)
          {
            v17 = (uint64_t *)(v15 + 16 * v24);
          }
          else
          {
            if (!v26)
            {
              if (v17)
              {
                *v17 = 0;
                v17[1] = 0;
                --*(_DWORD *)(v15 - 16);
                *v17 = v9;
                v17[1] = (uint64_t)v4;
                v30 = qword_1ECEC98B8;
                if (qword_1ECEC98B8)
                  goto LABEL_28;
LABEL_37:
                *(_DWORD *)(v30 - 12) = 1;
                v31 = qword_1ECEC98B8;
                if (!qword_1ECEC98B8)
                  goto LABEL_38;
LABEL_29:
                v32 = (*(_DWORD *)(v31 - 16) + *(_DWORD *)(v31 - 12));
                v33 = *(unsigned int *)(v31 - 4);
                if (v33 <= 0x400)
                  goto LABEL_30;
LABEL_39:
                if (v33 > 2 * v32)
                  return v4;
                goto LABEL_41;
              }
              *v25 = v9;
              v25[1] = (uint64_t)v4;
              v30 = qword_1ECEC98B8;
              if (!qword_1ECEC98B8)
                goto LABEL_37;
LABEL_28:
              ++*(_DWORD *)(v30 - 12);
              v31 = qword_1ECEC98B8;
              if (qword_1ECEC98B8)
                goto LABEL_29;
LABEL_38:
              v32 = *(unsigned int *)(v31 - 16);
              v33 = *(unsigned int *)(v31 - 4);
              if (v33 > 0x400)
                goto LABEL_39;
LABEL_30:
              if (3 * v33 > 4 * v32)
                return v4;
              if ((_DWORD)v33)
LABEL_41:
                v34 = (_DWORD)v33 << (6 * *(_DWORD *)(v31 - 12) >= (2 * v33));
              else
                v34 = 8;
              WTF::HashTable<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>>,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WebHistoryItem *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>>::rehash(v34);
              return v4;
            }
            if (*(_QWORD *)(v26 + 8) == v18)
            {
              *(_QWORD *)(v15 + 16 * v24 + 8) = v4;
              if (v9)
              {
                do
                {
                  v27 = __ldaxr((unsigned int *)v9);
                  v28 = v27 - 1;
                }
                while (__stlxr(v28, (unsigned int *)v9));
                if (!v28)
                {
                  atomic_store(1u, (unsigned int *)v9);
                  WTF::fastFree((WTF *)v9, v17);
                  return v4;
                }
              }
              return v4;
            }
          }
          v22 = i + v24;
        }
      }
      --*(_DWORD *)m_ptr;
    }
    if ((_MergedGlobals_18 & 1) != 0)
      goto LABEL_6;
    goto LABEL_34;
  }
  return v4;
}

- (void)setTitle:(id)a3
{
  HistoryItem *m_ptr;
  StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  m_ptr = self->_private->_historyItem.m_ptr;
  MEMORY[0x1D82A3998](&v6, a3);
  WebCore::HistoryItem::setTitle((WebCore::HistoryItem *)m_ptr, (const WTF::String *)&v6);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (void)setViewState:(id)a3
{
  WebCore::HistoryItem::setViewState((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr, (objc_object *)a3);
}

- (id)initFromDictionaryRepresentation:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  WebHistoryItem *v10;
  uint64_t v11;
  WebCore::HistoryItem *m_ptr;
  StringImpl *v13;
  WTF::StringImpl *v14;
  WebCore::HistoryItem *v15;
  StringImpl *v16;
  WTF::StringImpl *v17;
  void *v18;
  uint64_t v19;
  StringImpl *v20;
  IntPoint v21;
  WebHistoryItemPrivate *v22;
  WTF *value;
  uint64_t v24;
  WTF::StringImpl **v25;
  uint64_t v26;
  WTF::StringImpl *v27;
  WTF *v28;
  WTF::StringImpl **v29;
  uint64_t v30;
  WTF::StringImpl *v31;
  WTF *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  WTF *v37;
  void *v38;
  _QWORD *v39;
  _DWORD *v40;
  _DWORD *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  HistoryItem *v45;
  int v46;
  int v47;
  char v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  WebCore::HistoryItem *v53;
  int v54;
  int v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  IntPoint v61;
  int v62;
  unsigned int v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "_webkit_stringForKey:", &stru_1E9D6EC48);
  v6 = objc_msgSend(a3, "_webkit_stringForKey:", CFSTR("title"));
  v7 = (void *)objc_msgSend(a3, "_webkit_stringForKey:", CFSTR("lastVisitedDate"));
  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
  }
  else
  {
    v9 = 0.0;
  }
  v10 = -[WebHistoryItem initWithURLString:title:displayTitle:lastVisitedTimeInterval:](self, "initWithURLString:title:displayTitle:lastVisitedTimeInterval:", v5, v6, objc_msgSend(a3, "_webkit_stringForKey:", CFSTR("displayTitle")), v9);
  if ((objc_msgSend(v5, "canBeConvertedToEncoding:", 5) & 1) == 0)
  {
    v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E98], "_webkit_URLWithUserTypedString:", v5), "_web_originalDataAsString");
    m_ptr = (WebCore::HistoryItem *)v10->_private->_historyItem.m_ptr;
    MEMORY[0x1D82A3998](&v61, v11);
    WebCore::HistoryItem::setURLString(m_ptr, (const WTF::String *)&v61);
    v14 = (WTF::StringImpl *)v61;
    v61 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
        WTF::StringImpl::destroy(v14, v13);
      else
        *(_DWORD *)v14 -= 2;
    }
    v15 = (WebCore::HistoryItem *)v10->_private->_historyItem.m_ptr;
    MEMORY[0x1D82A3998](&v61, v11);
    WebCore::HistoryItem::setOriginalURLString(v15, (const WTF::String *)&v61);
    v17 = (WTF::StringImpl *)v61;
    v61 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2)
        WTF::StringImpl::destroy(v17, v16);
      else
        *(_DWORD *)v17 -= 2;
    }
  }
  if (objc_msgSend(a3, "_webkit_BOOLForKey:", CFSTR("lastVisitWasFailure")))
    *((_BYTE *)v10->_private->_historyItem.m_ptr + 144) = 1;
  v18 = (void *)objc_msgSend(a3, "_webkit_arrayForKey:", CFSTR("redirectURLs"));
  if (v18)
  {
    WTF::makeVector<WTF::String>(v18, (uint64_t)&v61);
    v19 = WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v19 = 0;
    *(_QWORD *)(v19 + 8) = 0;
    v21 = v61;
    v61 = 0;
    *(IntPoint *)v19 = v21;
    v21.var0 = v62;
    v62 = 0;
    *(_DWORD *)(v19 + 8) = v21.var0;
    v21.var0 = v63;
    v63 = 0;
    *(_DWORD *)(v19 + 12) = v21.var0;
    v22 = v10->_private;
    value = (WTF *)v22->_redirectURLs.__ptr_.__value_;
    v22->_redirectURLs.__ptr_.__value_ = (void *)v19;
    if (value)
    {
      v24 = *((unsigned int *)value + 3);
      if ((_DWORD)v24)
      {
        v25 = *(WTF::StringImpl ***)value;
        v26 = 8 * v24;
        do
        {
          v27 = *v25;
          *v25 = 0;
          if (v27)
          {
            if (*(_DWORD *)v27 == 2)
              WTF::StringImpl::destroy(v27, v20);
            else
              *(_DWORD *)v27 -= 2;
          }
          ++v25;
          v26 -= 8;
        }
        while (v26);
      }
      v28 = *(WTF **)value;
      if (*(_QWORD *)value)
      {
        *(_QWORD *)value = 0;
        *((_DWORD *)value + 2) = 0;
        WTF::fastFree(v28, v20);
      }
      WTF::fastFree(value, v20);
    }
    if (v63)
    {
      v29 = (WTF::StringImpl **)v61;
      v30 = 8 * v63;
      do
      {
        v31 = *v29;
        *v29 = 0;
        if (v31)
        {
          if (*(_DWORD *)v31 == 2)
            WTF::StringImpl::destroy(v31, v20);
          else
            *(_DWORD *)v31 -= 2;
        }
        ++v29;
        v30 -= 8;
      }
      while (v30);
    }
    v32 = (WTF *)v61;
    if (v61)
    {
      v61 = 0;
      v62 = 0;
      WTF::fastFree(v32, v20);
    }
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v33 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("children"), 0), "reverseObjectEnumerator");
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v58 != v35)
          objc_enumerationMutation(v33);
        v39 = -[WebHistoryItem initFromDictionaryRepresentation:]([WebHistoryItem alloc], "initFromDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i));
        v40 = *(_DWORD **)(v39[1] + 8);
        ++*v40;
        v61 = (IntPoint)v40;
        WebCore::HistoryItem::addChildItem();
        v41 = (_DWORD *)v61;
        v61 = 0;
        if (v41)
        {
          if (*v41 == 1)
          {
            v37 = (WTF *)MEMORY[0x1D82A3F20]();
            WTF::fastFree(v37, v38);
          }
          else
          {
            --*v41;
          }
        }
        CFRelease(v39);
      }
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    }
    while (v34);
  }
  v42 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("scale"));
  v43 = objc_msgSend(a3, "objectForKey:", CFSTR("scaleIsInitial"));
  if (v42)
  {
    v44 = (void *)v43;
    if (v43)
    {
      v45 = v10->_private->_historyItem.m_ptr;
      objc_msgSend(v42, "floatValue");
      v47 = v46;
      v48 = objc_msgSend(v44, "BOOLValue");
      *((_DWORD *)v45 + 69) = v47;
      *((_BYTE *)v45 + 280) = v48;
    }
  }
  v49 = objc_msgSend(a3, "objectForKey:", CFSTR("WebViewportArguments"));
  if (v49)
    -[WebHistoryItem _setViewportArguments:](v10, "_setViewportArguments:", v49);
  v50 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("scrollPointX"));
  v51 = objc_msgSend(a3, "objectForKey:", CFSTR("scrollPointY"));
  if (v50)
  {
    v52 = (void *)v51;
    if (v51)
    {
      v53 = (WebCore::HistoryItem *)v10->_private->_historyItem.m_ptr;
      v54 = objc_msgSend(v50, "intValue");
      v55 = objc_msgSend(v52, "intValue");
      v61.var0 = v54;
      v61.var1 = v55;
      WebCore::HistoryItem::setScrollPosition(v53, &v61);
    }
  }
  return v10;
}

- (CGPoint)scrollPoint
{
  double v2;
  double v3;
  CGPoint result;

  WebCore::HistoryItem::scrollPosition((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  WebCore::IntPoint::operator CGPoint();
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_visitedWithTitle:(id)a3
{
  HistoryItem *m_ptr;
  StringImpl *v5;
  WTF::StringImpl *v6;
  double v7;
  WTF::StringImpl *v8;

  m_ptr = self->_private->_historyItem.m_ptr;
  MEMORY[0x1D82A3998](&v8, a3);
  WebCore::HistoryItem::setTitle((WebCore::HistoryItem *)m_ptr, (const WTF::String *)&v8);
  v6 = v8;
  v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_private->_lastVisitedTime = v7;
}

- (WebHistoryItem)initWithURL:(id)a3 title:(id)a4
{
  return -[WebHistoryItem initWithURLString:title:lastVisitedTimeInterval:](self, "initWithURLString:title:lastVisitedTimeInterval:", objc_msgSend(a3, "_web_originalDataAsString"), a4, 0.0);
}

- (id)dictionaryRepresentation
{
  return -[WebHistoryItem dictionaryRepresentationIncludingChildren:](self, "dictionaryRepresentationIncludingChildren:", 1);
}

- (id)dictionaryRepresentationIncludingChildren:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  HistoryItem *m_ptr;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  double lastVisitedTime;
  void *value;
  const void *v15;
  uint64_t v16;
  id result;
  id v18;
  int v19;
  unint64_t v20;
  id v22;
  unsigned int *v23;
  uint64_t v24;
  const void *v25;

  v3 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 8);
  m_ptr = self->_private->_historyItem.m_ptr;
  v7 = *(_QWORD *)WebCore::HistoryItem::urlString((WebCore::HistoryItem *)m_ptr);
  if (v7 && *(_DWORD *)(v7 + 4))
  {
    if (*(_QWORD *)WebCore::HistoryItem::urlString((WebCore::HistoryItem *)m_ptr))
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_1E9D6EC48;
    objc_msgSend(v5, "setObject:forKey:", v8, &stru_1E9D6EC48);
  }
  v9 = *(_QWORD *)WebCore::HistoryItem::title((WebCore::HistoryItem *)m_ptr);
  if (v9 && *(_DWORD *)(v9 + 4))
  {
    if (*(_QWORD *)WebCore::HistoryItem::title((WebCore::HistoryItem *)m_ptr))
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_1E9D6EC48;
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("title"));
  }
  v11 = WebCore::HistoryItem::alternateTitle((WebCore::HistoryItem *)m_ptr);
  if (*(_QWORD *)v11 && *(_DWORD *)(*(_QWORD *)v11 + 4))
  {
    if (*(_QWORD *)WebCore::HistoryItem::alternateTitle((WebCore::HistoryItem *)m_ptr))
      v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v12 = &stru_1E9D6EC48;
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("displayTitle"));
  }
  lastVisitedTime = self->_private->_lastVisitedTime;
  if (lastVisitedTime != 0.0)
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1lf"), *(_QWORD *)&self->_private->_lastVisitedTime), CFSTR("lastVisitedDate"));
  if (*((_BYTE *)m_ptr + 144))
    objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("lastVisitWasFailure"));
  value = self->_private->_redirectURLs.__ptr_.__value_;
  if (value)
  {
    WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> &>((uint64_t *)&v25, (uint64_t)value);
    v15 = v25;
    objc_msgSend(v5, "setObject:forKey:", v25, CFSTR("redirectURLs"));
    if (v15)
      CFRelease(v15);
  }
  if (!v3 || !*(_DWORD *)(WebCore::HistoryItem::children((WebCore::HistoryItem *)m_ptr) + 12))
    goto LABEL_33;
  v16 = WebCore::HistoryItem::children((WebCore::HistoryItem *)m_ptr);
  result = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(unsigned int *)(v16 + 12));
  v18 = result;
  v19 = *(_DWORD *)(v16 + 12);
  v20 = (v19 - 1);
  if (v19 - 1 < 0)
  {
LABEL_32:
    objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("children"));
LABEL_33:
    LODWORD(lastVisitedTime) = *((_DWORD *)self->_private->_historyItem.m_ptr + 69);
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", lastVisitedTime), CFSTR("scale"));
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)self->_private->_historyItem.m_ptr + 280)), CFSTR("scaleIsInitial"));
    v22 = -[WebHistoryItem _viewportArguments](self, "_viewportArguments");
    if (v22)
      objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("WebViewportArguments"));
    v23 = (unsigned int *)WebCore::HistoryItem::scrollPosition((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
    v24 = v23[1];
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v23), CFSTR("scrollPointX"));
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24), CFSTR("scrollPointY"));
    return v5;
  }
  while (v20 < *(unsigned int *)(v16 + 12))
  {
    result = (id)objc_msgSend(v18, "addObject:", -[WebCore::HistoryItem dictionaryRepresentation](kit(*(WebCore::HistoryItem **)(*(_QWORD *)v16 + 8 * v20)), "dictionaryRepresentation"));
    if ((uint64_t)v20-- <= 0)
      goto LABEL_32;
  }
  __break(0xC471u);
  return result;
}

- (id)target
{
  uint64_t v2;

  v2 = *(_QWORD *)WebCore::HistoryItem::target((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  if (v2 && *(_DWORD *)(v2 + 4))
    return (id)WTF::StringImpl::operator NSString *();
  else
    return 0;
}

- (BOOL)isTargetItem
{
  return WebCore::HistoryItem::isTargetItem((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
}

- (id)RSSFeedReferrer
{
  uint64_t v2;

  v2 = *(_QWORD *)WebCore::HistoryItem::referrer((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  if (v2 && *(_DWORD *)(v2 + 4))
    return (id)WTF::StringImpl::operator NSString *();
  else
    return 0;
}

- (void)setRSSFeedReferrer:(id)a3
{
  HistoryItem *m_ptr;
  StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  m_ptr = self->_private->_historyItem.m_ptr;
  MEMORY[0x1D82A3998](&v6, a3);
  WebCore::HistoryItem::setReferrer((WebCore::HistoryItem *)m_ptr, (const WTF::String *)&v6);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (id)children
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  WebCore::HistoryItem **v6;
  uint64_t v7;
  WebCore::HistoryItem *v8;

  v2 = WebCore::HistoryItem::children((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  if (!*(_DWORD *)(v2 + 12))
    return 0;
  v3 = v2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(v2 + 12));
  v5 = *(unsigned int *)(v3 + 12);
  if ((_DWORD)v5)
  {
    v6 = *(WebCore::HistoryItem ***)v3;
    v7 = 8 * v5;
    do
    {
      v8 = kit(*v6);
      if (v8)
        objc_msgSend(v4, "addObject:", v8);
      ++v6;
      v7 -= 8;
    }
    while (v7);
  }
  return (id)(id)CFMakeCollectable(v4);
}

- (id)URL
{
  StringImpl *v2;
  WTF::StringImpl *v3;
  void *v4;
  int v5;
  WTF::StringImpl *v7;

  WebCore::HistoryItem::url((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  v3 = v7;
  if (!v7)
    return 0;
  if (*((_DWORD *)v7 + 1))
  {
    v4 = (void *)WTF::URL::operator NSURL *();
    v3 = v7;
    v5 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 != 2)
      goto LABEL_5;
LABEL_9:
    WTF::StringImpl::destroy(v3, v2);
    return v4;
  }
  v4 = 0;
  v5 = *(_DWORD *)v7 - 2;
  if (*(_DWORD *)v7 == 2)
    goto LABEL_9;
LABEL_5:
  *(_DWORD *)v3 = v5;
  return v4;
}

- (BOOL)lastVisitWasFailure
{
  return *((_BYTE *)self->_private->_historyItem.m_ptr + 144);
}

- (id)_redirectURLs
{
  void *value;
  CFTypeRef cf;

  value = self->_private->_redirectURLs.__ptr_.__value_;
  if (!value)
    return 0;
  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> &>((uint64_t *)&cf, (uint64_t)value);
  return (id)(id)CFMakeCollectable(cf);
}

- (void)_setScale:(float)a3 isInitial:(BOOL)a4
{
  HistoryItem *m_ptr;

  m_ptr = self->_private->_historyItem.m_ptr;
  *((float *)m_ptr + 69) = a3;
  *((_BYTE *)m_ptr + 280) = a4;
}

- (float)_scale
{
  return *((float *)self->_private->_historyItem.m_ptr + 69);
}

- (BOOL)_scaleIsInitial
{
  return *((_BYTE *)self->_private->_historyItem.m_ptr + 280);
}

- (id)_viewportArguments
{
  HistoryItem *m_ptr;
  void *v3;
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;

  m_ptr = self->_private->_historyItem.m_ptr;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  LODWORD(v4) = *((_DWORD *)m_ptr + 78);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  objc_msgSend(v3, "setObject:forKey:", v5, WebViewportInitialScaleKey);
  LODWORD(v6) = *((_DWORD *)m_ptr + 79);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  objc_msgSend(v3, "setObject:forKey:", v7, WebViewportMinimumScaleKey);
  LODWORD(v8) = *((_DWORD *)m_ptr + 80);
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  objc_msgSend(v3, "setObject:forKey:", v9, WebViewportMaximumScaleKey);
  LODWORD(v10) = *((_DWORD *)m_ptr + 72);
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  objc_msgSend(v3, "setObject:forKey:", v11, WebViewportWidthKey);
  LODWORD(v12) = *((_DWORD *)m_ptr + 75);
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  objc_msgSend(v3, "setObject:forKey:", v13, WebViewportHeightKey);
  LODWORD(v14) = *((_DWORD *)m_ptr + 81);
  v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  objc_msgSend(v3, "setObject:forKey:", v15, WebViewportUserScalableKey);
  LODWORD(v16) = *((_DWORD *)m_ptr + 83);
  v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  objc_msgSend(v3, "setObject:forKey:", v17, WebViewportShrinkToFitKey);
  return v3;
}

- (void)_setViewportArguments:(id)a3
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  HistoryItem *m_ptr;
  int v23;

  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", WebViewportInitialScaleKey), "floatValue");
  v6 = v5;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", WebViewportMinimumScaleKey), "floatValue");
  v8 = v7;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", WebViewportMaximumScaleKey), "floatValue");
  v10 = v9;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", WebViewportWidthKey), "floatValue");
  v12 = v11;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", WebViewportHeightKey), "floatValue");
  v14 = v13;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", WebViewportUserScalableKey), "floatValue");
  v16 = v15;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", WebViewportShrinkToFitKey), "floatValue");
  m_ptr = self->_private->_historyItem.m_ptr;
  *((_BYTE *)m_ptr + 284) = 0;
  *((_DWORD *)m_ptr + 72) = v12;
  *(_QWORD *)((char *)m_ptr + 292) = 0xBF800000BF800000;
  *((_DWORD *)m_ptr + 75) = v14;
  __asm { FMOV            V1.2S, #-1.0 }
  *((_QWORD *)m_ptr + 38) = _D1;
  *((_DWORD *)m_ptr + 78) = v6;
  *((_DWORD *)m_ptr + 79) = v8;
  *((_DWORD *)m_ptr + 80) = v10;
  *((_DWORD *)m_ptr + 81) = v16;
  *((_DWORD *)m_ptr + 82) = -1082130432;
  *((_DWORD *)m_ptr + 83) = v23;
  *((_WORD *)m_ptr + 168) = 0;
}

- (CGPoint)_scrollPoint
{
  double v2;
  double v3;
  CGPoint result;

  WebCore::HistoryItem::scrollPosition((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  WebCore::IntPoint::operator CGPoint();
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_setScrollPoint:(CGPoint)a3
{
  HistoryItem *m_ptr;
  IntPoint v4;
  CGPoint v5;

  v5 = a3;
  m_ptr = self->_private->_historyItem.m_ptr;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v4, &v5);
  WebCore::HistoryItem::setScrollPosition((WebCore::HistoryItem *)m_ptr, &v4);
}

- (BOOL)_isInBackForwardCache
{
  return *((_QWORD *)self->_private->_historyItem.m_ptr + 25) != 0;
}

- (BOOL)_hasCachedPageExpired
{
  return WebCore::HistoryItem::hasCachedPageExpired((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
}

@end
