@implementation WebBackForwardList

- (WebBackForwardList)initWithBackForwardList:(void *)a3
{
  WebBackForwardList *v4;
  WebBackForwardList *v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  int i;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unsigned int v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)WebBackForwardList;
  v4 = -[WebBackForwardList init](&v33, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(uint64_t **)a3;
    *(_QWORD *)a3 = 0;
    v4->_private = (WebBackForwardListPrivate *)v6;
    if ((_MergedGlobals_8 & 1) != 0)
    {
      v7 = v6[2];
      if (!v7)
        goto LABEL_4;
    }
    else
    {
      qword_1ECEC9788 = 0;
      _MergedGlobals_8 = 1;
      v7 = v6[2];
      if (!v7)
      {
LABEL_4:
        v7 = WTF::fastCompactMalloc((WTF *)0x10);
        *(_DWORD *)v7 = 1;
        *(_QWORD *)(v7 + 8) = v6;
        v9 = (unsigned int *)v6[2];
        v6[2] = v7;
        if (v9)
        {
          do
          {
            v10 = __ldaxr(v9);
            v11 = v10 - 1;
          }
          while (__stlxr(v11, v9));
          if (!v11)
          {
            atomic_store(1u, v9);
            WTF::fastFree((WTF *)v9, v8);
          }
          v7 = v6[2];
        }
        goto LABEL_9;
      }
    }
    do
LABEL_9:
      v12 = __ldaxr((unsigned int *)v7);
    while (__stlxr(v12 + 1, (unsigned int *)v7));
    v13 = qword_1ECEC9788;
    if (qword_1ECEC9788
      || (WTF::HashTable<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *>>,WTF::DefaultHash<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *,WTF::DefaultHash<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WebBackForwardList *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>>::rehash(8u),
          (v13 = qword_1ECEC9788) != 0))
    {
      v14 = *(_DWORD *)(v13 - 8);
    }
    else
    {
      v14 = 0;
    }
    v15 = 0;
    v16 = *(_QWORD *)(v7 + 8);
    v17 = (~(v16 << 32) + v16) ^ ((unint64_t)(~(v16 << 32) + v16) >> 22);
    v18 = 9 * ((v17 + ~(v17 << 13)) ^ ((v17 + ~(v17 << 13)) >> 8));
    v19 = (v18 ^ (v18 >> 15)) + ~((v18 ^ (v18 >> 15)) << 27);
    v20 = (v19 >> 31) ^ v19;
    for (i = 1; ; ++i)
    {
      v22 = v20 & v14;
      v23 = (uint64_t *)(v13 + 16 * v22);
      v24 = *v23;
      if (*v23 == -1)
      {
        v15 = (uint64_t *)(v13 + 16 * v22);
      }
      else
      {
        if (!v24)
        {
          if (v15)
          {
            *v15 = 0;
            v15[1] = 0;
            --*(_DWORD *)(v13 - 16);
            *v15 = v7;
            v15[1] = (uint64_t)v5;
            v28 = qword_1ECEC9788;
            if (qword_1ECEC9788)
              goto LABEL_25;
LABEL_31:
            *(_DWORD *)(v28 - 12) = 1;
            v29 = qword_1ECEC9788;
            if (!qword_1ECEC9788)
              goto LABEL_32;
LABEL_26:
            v30 = (*(_DWORD *)(v29 - 16) + *(_DWORD *)(v29 - 12));
            v31 = *(unsigned int *)(v29 - 4);
            if (v31 <= 0x400)
              goto LABEL_27;
LABEL_33:
            if (v31 > 2 * v30)
              return v5;
            goto LABEL_35;
          }
          *v23 = v7;
          v23[1] = (uint64_t)v5;
          v28 = qword_1ECEC9788;
          if (!qword_1ECEC9788)
            goto LABEL_31;
LABEL_25:
          ++*(_DWORD *)(v28 - 12);
          v29 = qword_1ECEC9788;
          if (qword_1ECEC9788)
            goto LABEL_26;
LABEL_32:
          v30 = *(unsigned int *)(v29 - 16);
          v31 = *(unsigned int *)(v29 - 4);
          if (v31 > 0x400)
            goto LABEL_33;
LABEL_27:
          if (3 * v31 > 4 * v30)
            return v5;
          if ((_DWORD)v31)
LABEL_35:
            v32 = (_DWORD)v31 << (6 * *(_DWORD *)(v29 - 12) >= (2 * v31));
          else
            v32 = 8;
          WTF::HashTable<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *>>,WTF::DefaultHash<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *,WTF::DefaultHash<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WebBackForwardList *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>>::rehash(v32);
          return v5;
        }
        if (*(_QWORD *)(v24 + 8) == v16)
        {
          *(_QWORD *)(v13 + 16 * v22 + 8) = v5;
          if (v7)
          {
            do
            {
              v25 = __ldaxr((unsigned int *)v7);
              v26 = v25 - 1;
            }
            while (__stlxr(v26, (unsigned int *)v7));
            if (!v26)
            {
              atomic_store(1u, (unsigned int *)v7);
              WTF::fastFree((WTF *)v7, v15);
              return v5;
            }
          }
          return v5;
        }
      }
      v20 = i + v22;
    }
  }
  return v5;
}

- (WebBackForwardList)init
{
  uint64_t v3;
  WebBackForwardList *v4;
  _DWORD *v5;
  _DWORD *v7;

  v3 = WTF::fastMalloc((WTF *)0x48);
  *(_DWORD *)(v3 + 8) = 1;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)v3 = off_1E9D69208;
  *(_OWORD *)(v3 + 24) = 0u;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_QWORD *)(v3 + 56) = 0x64FFFFFFFFLL;
  *(_WORD *)(v3 + 64) = 257;
  v7 = (_DWORD *)v3;
  v4 = -[WebBackForwardList initWithBackForwardList:](self, "initWithBackForwardList:", &v7);
  v5 = v7;
  v7 = 0;
  if (!v5)
    return v4;
  if (v5[2] != 1)
  {
    --v5[2];
    return v4;
  }
  (*(void (**)(_DWORD *))(*(_QWORD *)v5 + 8))(v5);
  return v4;
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  WebBackForwardListPrivate *v5;
  __objc2_class **p_superclass;
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
  int v18;
  __objc2_class *v19;
  unsigned int v20;
  unsigned int info_high;
  int v23;
  _QWORD *v24;
  objc_super v25;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    if (!self)
      goto LABEL_30;
    v5 = self->_private;
    if (!v5)
      goto LABEL_30;
    if ((_MergedGlobals_8 & 1) != 0)
    {
      p_superclass = &OBJC_METACLASS____WebSafeAsyncForwarder.superclass;
      if (qword_1ECEC9788)
      {
        v7 = *(_DWORD *)(qword_1ECEC9788 - 8);
        v8 = ((unint64_t)v5 + ~((_QWORD)v5 << 32)) ^ (((unint64_t)v5 + ~((_QWORD)v5 << 32)) >> 22);
        v9 = 9 * ((v8 + ~(v8 << 13)) ^ ((v8 + ~(v8 << 13)) >> 8));
        v10 = (v9 ^ (v9 >> 15)) + ~((v9 ^ (v9 >> 15)) << 27);
        v11 = v7 & ((v10 >> 31) ^ v10);
        for (i = 1; ; ++i)
        {
          v13 = *(_QWORD *)(qword_1ECEC9788 + 16 * v11);
          if (v13 != -1)
          {
            if (!v13)
              goto LABEL_26;
            if (*(WebBackForwardListPrivate **)(v13 + 8) == v5)
              break;
          }
          v11 = (v11 + i) & v7;
        }
        if (v11 != *(_DWORD *)(qword_1ECEC9788 - 4))
        {
          v14 = (_QWORD *)(qword_1ECEC9788 + 16 * v11);
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
            v24 = v14;
            WTF::fastFree((WTF *)v13, v4);
            v14 = v24;
            p_superclass = (__objc2_class **)(&OBJC_METACLASS____WebSafeAsyncForwarder + 8);
          }
          *v14 = -1;
          v17 = p_superclass[241];
          ++LODWORD(v17[-1].vtable);
          if (v17)
            v18 = HIDWORD(v17[-1].vtable) - 1;
          else
            v18 = -1;
          HIDWORD(v17[-1].vtable) = v18;
          v19 = p_superclass[241];
          if (v19)
          {
            v20 = 6 * HIDWORD(v19[-1].vtable);
            info_high = HIDWORD(v19[-1].info);
            if (v20 < info_high && info_high >= 9)
              WTF::HashTable<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *>>,WTF::DefaultHash<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *,WTF::DefaultHash<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WebBackForwardList *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>>::rehash(info_high >> 1);
          }
        }
      }
LABEL_26:
      v23 = *((_DWORD *)v5 + 2) - 1;
      if (*((_DWORD *)v5 + 2) != 1)
        goto LABEL_27;
    }
    else
    {
      qword_1ECEC9788 = 0;
      _MergedGlobals_8 = 1;
      v23 = *((_DWORD *)v5 + 2) - 1;
      if (*((_DWORD *)v5 + 2) != 1)
      {
LABEL_27:
        *((_DWORD *)v5 + 2) = v23;
LABEL_30:
        v25.receiver = self;
        v25.super_class = (Class)WebBackForwardList;
        -[WebBackForwardList dealloc](&v25, sel_dealloc);
        return;
      }
    }
    (*(void (**)(WebBackForwardListPrivate *))(*(_QWORD *)v5 + 8))(v5);
    goto LABEL_30;
  }
}

- (void)_close
{
  (*(void (**)(WebBackForwardListPrivate *))(*(_QWORD *)self->_private + 64))(self->_private);
}

- (void)addItem:(WebHistoryItem *)item
{
  uint64_t v5;
  uint64_t v6;
  WebBackForwardListPrivate *v7;
  uint64_t v8;
  uint64_t v9;
  HistoryItem *m_ptr;
  HistoryItem *v11;
  CFTypeRef v12;
  WTF *v13;
  void *v14;
  HistoryItem *v15;

  v5 = objc_msgSend(*((id *)self->_private + 3), "mainFrame");
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(v5 + 8) + 8);
    if (v6)
    {
      v7 = self->_private;
      v8 = *(_QWORD *)(v6 + 32);
      v9 = *(_QWORD *)(v6 + 40);
      m_ptr = item->_private->_historyItem.m_ptr;
      ++*(_DWORD *)m_ptr;
      v15 = m_ptr;
      (*(void (**)(WebBackForwardListPrivate *, uint64_t, uint64_t, HistoryItem **))(*(_QWORD *)v7 + 16))(v7, v8, v9, &v15);
      v11 = v15;
      v15 = 0;
      if (v11)
      {
        if (*(_DWORD *)v11 == 1)
        {
          v13 = (WTF *)MEMORY[0x1D82A3F20]();
          WTF::fastFree(v13, v14);
        }
        else
        {
          --*(_DWORD *)v11;
        }
      }
      goto LABEL_7;
    }
  }
  if (item)
LABEL_7:
    CFRetain(item);
  v12 = (id)CFMakeCollectable(item);
}

- (void)removeItem:(id)a3
{
  WebBackForwardListPrivate *v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  WTF *v9;
  void *v10;
  unsigned int v11;
  BOOL v12;

  if (a3)
  {
    if (self)
    {
      v3 = self->_private;
      v4 = *((unsigned int *)v3 + 11);
      if (!(_DWORD)v4)
        return;
    }
    else
    {
      v3 = 0;
      v4 = MEMORY[0x2C];
      if (!MEMORY[0x2C])
        return;
    }
    v5 = 0;
    v6 = *(_DWORD **)(*((_QWORD *)a3 + 1) + 8);
    v7 = *((_QWORD *)v3 + 4);
    v8 = v7 + 8;
    while (*(_DWORD **)(v7 + 8 * v5) != v6)
    {
      ++v5;
      v8 += 8;
      if (v4 == v5)
        return;
    }
    *(_QWORD *)(v7 + 8 * v5) = 0;
    if (*v6 == 1)
    {
      v9 = (WTF *)MEMORY[0x1D82A3F20](v6, a2);
      WTF::fastFree(v9, v10);
      v4 = *((unsigned int *)v3 + 11);
    }
    else
    {
      --*v6;
    }
    memmove((void *)(v7 + 8 * v5), (const void *)(v7 + 8 * v5 + 8), *((_QWORD *)v3 + 4) + 8 * v4 - v8);
    --*((_DWORD *)v3 + 11);
    WTF::HashSet<WTF::RefPtr<WebCore::HistoryItem,WTF::RawPtrTraits<WebCore::HistoryItem>,WTF::DefaultRefDerefTraits<WebCore::HistoryItem>>,WTF::DefaultHash<WTF::RefPtr<WebCore::HistoryItem,WTF::RawPtrTraits<WebCore::HistoryItem>,WTF::DefaultRefDerefTraits<WebCore::HistoryItem>>>,WTF::HashTraits<WTF::RefPtr<WebCore::HistoryItem,WTF::RawPtrTraits<WebCore::HistoryItem>,WTF::DefaultRefDerefTraits<WebCore::HistoryItem>>>,WTF::HashTableTraits>::remove<WTF::RefPtr<WebCore::HistoryItem,WTF::RawPtrTraits<WebCore::HistoryItem>,WTF::DefaultRefDerefTraits<WebCore::HistoryItem>>>((uint64_t *)v3 + 6, (uint64_t)v6);
    v11 = *((_DWORD *)v3 + 14);
    if (v11 != -1 && v11 >= v5)
    {
      if (v11 > v5 || (v12 = *((_DWORD *)v3 + 11) > v11, v11 = *((_DWORD *)v3 + 11), !v12))
        *((_DWORD *)v3 + 14) = v11 - 1;
    }
  }
}

- (id)dictionaryRepresentation
{
  WebBackForwardListPrivate *v2;
  void *v3;
  uint64_t v4;
  WebCore::HistoryItem **v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if (self)
    v2 = self->_private;
  else
    v2 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((unsigned int *)v2 + 11));
  v4 = *((unsigned int *)v2 + 11);
  if ((_DWORD)v4)
  {
    v5 = (WebCore::HistoryItem **)*((_QWORD *)v2 + 4);
    v6 = 8 * v4;
    do
    {
      v7 = -[WebCore::HistoryItem dictionaryRepresentationIncludingChildren:](kit(*v5), "dictionaryRepresentationIncludingChildren:", 0);
      if (v7)
        objc_msgSend(v3, "addObject:", v7);
      ++v5;
      v6 -= 8;
    }
    while (v6);
  }
  v11[0] = v3;
  v10[0] = CFSTR("entries");
  v10[1] = CFSTR("current");
  v11[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v2 + 14));
  v10[2] = CFSTR("capacity");
  v11[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v2 + 15));
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  if (v3)
    CFRelease(v3);
  return v8;
}

- (void)setToMatchDictionaryRepresentation:(id)a3
{
  WebBackForwardListPrivate *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  const void *v14;
  _DWORD *v15;
  _DWORD *v16;
  WTF *v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  void *v22;
  _DWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self)
    v4 = self->_private;
  else
    v4 = 0;
  BackForwardList::setCapacity((uint64_t)v4, objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("capacity"), a3), "unsignedIntValue"));
  v5 = objc_msgSend(*((id *)self->_private + 3), "mainFrame");
  if (!v5)
    goto LABEL_23;
  v6 = *(_QWORD *)(*(_QWORD *)(v5 + 8) + 8);
  if (!v6)
    goto LABEL_23;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = (void *)objc_msgSend(v22, "objectForKey:", CFSTR("entries"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v8)
    goto LABEL_23;
  v9 = *(_QWORD *)v25;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v25 != v9)
        objc_enumerationMutation(v7);
      v11 = *(_QWORD *)(v6 + 32);
      v12 = *(_QWORD *)(v6 + 40);
      v13 = -[WebHistoryItem initFromDictionaryRepresentation:]([WebHistoryItem alloc], "initFromDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
      v14 = v13;
      if (v13)
        v15 = *(_DWORD **)(v13[1] + 8);
      else
        v15 = 0;
      ++*v15;
      v23 = v15;
      (*(void (**)(WebBackForwardListPrivate *, uint64_t, uint64_t, _DWORD **))(*(_QWORD *)v4 + 16))(v4, v11, v12, &v23);
      v16 = v23;
      v23 = 0;
      if (!v16)
        goto LABEL_18;
      if (*v16 != 1)
      {
        --*v16;
LABEL_18:
        if (!v14)
          continue;
LABEL_19:
        CFRelease(v14);
        continue;
      }
      v17 = (WTF *)MEMORY[0x1D82A3F20]();
      WTF::fastFree(v17, v18);
      if (v14)
        goto LABEL_19;
    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v8);
LABEL_23:
  v19 = objc_msgSend((id)objc_msgSend(v22, "objectForKey:", CFSTR("current")), "unsignedIntValue");
  v20 = *((_DWORD *)v4 + 11);
  if (v20 <= v19)
    v21 = v20 - 1;
  else
    v21 = v19;
  *((_DWORD *)v4 + 14) = v21;
}

- (BOOL)containsItem:(WebHistoryItem *)item
{
  uint64_t v3;
  HistoryItem *m_ptr;
  int v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  HistoryItem *v10;
  int v11;
  BOOL result;

  if (!item)
    return 0;
  v3 = *((_QWORD *)self->_private + 6);
  if (!v3)
    return 0;
  m_ptr = item->_private->_historyItem.m_ptr;
  v5 = *(_DWORD *)(v3 - 8);
  v6 = ((unint64_t)m_ptr + ~((_QWORD)m_ptr << 32)) ^ (((unint64_t)m_ptr + ~((_QWORD)m_ptr << 32)) >> 22);
  v7 = 9 * ((v6 + ~(v6 << 13)) ^ ((v6 + ~(v6 << 13)) >> 8));
  v8 = (v7 ^ (v7 >> 15)) + ~((v7 ^ (v7 >> 15)) << 27);
  v9 = v5 & ((v8 >> 31) ^ v8);
  v10 = *(HistoryItem **)(v3 + 8 * v9);
  if (v10 == m_ptr)
    return 1;
  v11 = 1;
  do
  {
    result = v10 != 0;
    if (!v10)
      break;
    v9 = (v9 + v11) & v5;
    v10 = *(HistoryItem **)(v3 + 8 * v9);
    ++v11;
  }
  while (v10 != m_ptr);
  return result;
}

- (void)goBack
{
  WebBackForwardListPrivate *v2;
  int v3;

  if (self)
  {
    v2 = self->_private;
    v3 = *((_DWORD *)v2 + 14);
    if (!v3)
      return;
  }
  else
  {
    v2 = 0;
    v3 = MEMORY[0x38];
    if (!MEMORY[0x38])
      return;
  }
  *((_DWORD *)v2 + 14) = v3 - 1;
}

- (void)goForward
{
  WebBackForwardListPrivate *v2;
  unint64_t v3;

  v2 = self->_private;
  v3 = *((unsigned int *)v2 + 14);
  if ((unint64_t)*((unsigned int *)v2 + 11) - 1 > v3)
    *((_DWORD *)v2 + 14) = v3 + 1;
}

- (void)goToItem:(WebHistoryItem *)item
{
  if (item)
    (*(void (**)(WebBackForwardListPrivate *, HistoryItem *))(*(_QWORD *)self->_private + 24))(self->_private, item->_private->_historyItem.m_ptr);
}

- (WebHistoryItem)backItem
{
  WebHistoryItemPrivate *v2;
  int value;
  WebCore::HistoryItem *v4;
  unsigned int v5;
  WebCore::HistoryItem *v6;
  WebCore::HistoryItem *v7;
  WebHistoryItem *v8;
  WTF *v9;
  void *v10;

  if (self)
  {
    v2 = self->_private;
    value = (int)v2[1]._redirectURLs.__ptr_.__value_;
    if ((value + 1) < 2)
    {
LABEL_3:
      v4 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v2 = 0;
    value = MEMORY[0x38];
    if ((MEMORY[0x38] + 1) < 2)
      goto LABEL_3;
  }
  v5 = value - 1;
  if (HIDWORD(v2[1]._historyItem.m_ptr) <= v5)
  {
    __break(0xC471u);
    return self;
  }
  v4 = (WebCore::HistoryItem *)*((_QWORD *)v2[1].super.isa + v5);
  ++*(_DWORD *)v4;
LABEL_7:
  v6 = kit(v4);
  v7 = v6;
  if (v6)
    CFRetain(v6);
  self = (id)CFMakeCollectable(v7);
  v8 = self;
  if (v4)
  {
    if (*(_DWORD *)v4 == 1)
    {
      v9 = (WTF *)MEMORY[0x1D82A3F20](v4);
      WTF::fastFree(v9, v10);
      return v8;
    }
    else
    {
      --*(_DWORD *)v4;
    }
  }
  return self;
}

- (WebHistoryItem)currentItem
{
  WebHistoryItemPrivate *v2;
  uint64_t value_low;
  WebCore::HistoryItem *v4;
  WebCore::HistoryItem *v5;
  WebCore::HistoryItem *v6;
  WebHistoryItem *v7;
  WTF *v8;
  void *v9;

  if (!self)
  {
    v2 = 0;
    value_low = MEMORY[0x38];
    if (MEMORY[0x38] != -1)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v2 = self->_private;
  value_low = LODWORD(v2[1]._redirectURLs.__ptr_.__value_);
  if ((_DWORD)value_low == -1)
    goto LABEL_6;
LABEL_3:
  if (HIDWORD(v2[1]._historyItem.m_ptr) <= value_low)
  {
    __break(0xC471u);
    return self;
  }
  v4 = (WebCore::HistoryItem *)*((_QWORD *)v2[1].super.isa + value_low);
  ++*(_DWORD *)v4;
LABEL_7:
  v5 = kit(v4);
  v6 = v5;
  if (v5)
    CFRetain(v5);
  self = (id)CFMakeCollectable(v6);
  v7 = self;
  if (v4)
  {
    if (*(_DWORD *)v4 == 1)
    {
      v8 = (WTF *)MEMORY[0x1D82A3F20](v4);
      WTF::fastFree(v8, v9);
      return v7;
    }
    else
    {
      --*(_DWORD *)v4;
    }
  }
  return self;
}

- (WebHistoryItem)forwardItem
{
  WebHistoryItemPrivate *v2;
  uint64_t m_ptr_high;
  unint64_t value_low;
  unsigned int v5;
  WebCore::HistoryItem *v6;
  WebCore::HistoryItem *v7;
  WebCore::HistoryItem *v8;
  WebHistoryItem *v9;
  WTF *v10;
  void *v11;

  if (self)
  {
    v2 = self->_private;
    m_ptr_high = HIDWORD(v2[1]._historyItem.m_ptr);
    if (!(_DWORD)m_ptr_high)
      goto LABEL_8;
  }
  else
  {
    v2 = 0;
    m_ptr_high = MEMORY[0x2C];
    if (!MEMORY[0x2C])
    {
LABEL_8:
      v6 = 0;
      goto LABEL_9;
    }
  }
  value_low = LODWORD(v2[1]._redirectURLs.__ptr_.__value_);
  if (m_ptr_high - 1 <= value_low)
    goto LABEL_8;
  v5 = value_low + 1;
  if (m_ptr_high <= v5)
  {
    __break(0xC471u);
    return self;
  }
  v6 = (WebCore::HistoryItem *)*((_QWORD *)v2[1].super.isa + v5);
  ++*(_DWORD *)v6;
LABEL_9:
  v7 = kit(v6);
  v8 = v7;
  if (v7)
    CFRetain(v7);
  self = (id)CFMakeCollectable(v8);
  v9 = self;
  if (v6)
  {
    if (*(_DWORD *)v6 == 1)
    {
      v10 = (WTF *)MEMORY[0x1D82A3F20](v6);
      WTF::fastFree(v10, v11);
      return v9;
    }
    else
    {
      --*(_DWORD *)v6;
    }
  }
  return self;
}

- (NSArray)backListWithLimit:(int)limit
{
  id v3;
  void *v4;
  WebCore::HistoryItem **v5;
  uint64_t v6;
  WebCore::HistoryItem *v7;
  void *v8;
  NSArray *v9;
  WTF *v10;
  uint64_t v11;
  WTF *v12;
  void *v13;
  _DWORD *v14;
  WTF *v15;
  WTF *v17;
  uint64_t v18;

  v17 = 0;
  v18 = 0;
  if (self)
    self = (WebBackForwardList *)self->_private;
  BackForwardList::backListWithLimit((WTF *)self, *(void **)&limit, (uint64_t)&v17);
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v4 = (void *)objc_msgSend(v3, "initWithCapacity:", HIDWORD(v18));
  if (HIDWORD(v18))
  {
    v5 = (WebCore::HistoryItem **)v17;
    v6 = 8 * HIDWORD(v18);
    do
    {
      v7 = kit(*v5);
      if (v7)
        objc_msgSend(v4, "addObject:", v7);
      ++v5;
      v6 -= 8;
    }
    while (v6);
  }
  v9 = (id)CFMakeCollectable(v4);
  if (HIDWORD(v18))
  {
    v10 = v17;
    v11 = 8 * HIDWORD(v18);
    do
    {
      v14 = *(_DWORD **)v10;
      *(_QWORD *)v10 = 0;
      if (v14)
      {
        if (*v14 == 1)
        {
          v12 = (WTF *)MEMORY[0x1D82A3F20]();
          WTF::fastFree(v12, v13);
        }
        else
        {
          --*v14;
        }
      }
      v10 = (WTF *)((char *)v10 + 8);
      v11 -= 8;
    }
    while (v11);
  }
  v15 = v17;
  if (v17)
  {
    v17 = 0;
    LODWORD(v18) = 0;
    WTF::fastFree(v15, v8);
  }
  return v9;
}

- (NSArray)forwardListWithLimit:(int)limit
{
  id v3;
  void *v4;
  WebCore::HistoryItem **v5;
  uint64_t v6;
  WebCore::HistoryItem *v7;
  void *v8;
  NSArray *v9;
  WTF *v10;
  uint64_t v11;
  WTF *v12;
  void *v13;
  _DWORD *v14;
  WTF *v15;
  WTF *v17;
  uint64_t v18;

  v17 = 0;
  v18 = 0;
  if (self)
    self = (WebBackForwardList *)self->_private;
  BackForwardList::forwardListWithLimit((WTF *)self, *(void **)&limit, (uint64_t)&v17);
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v4 = (void *)objc_msgSend(v3, "initWithCapacity:", HIDWORD(v18));
  if (HIDWORD(v18))
  {
    v5 = (WebCore::HistoryItem **)v17;
    v6 = 8 * HIDWORD(v18);
    do
    {
      v7 = kit(*v5);
      if (v7)
        objc_msgSend(v4, "addObject:", v7);
      ++v5;
      v6 -= 8;
    }
    while (v6);
  }
  v9 = (id)CFMakeCollectable(v4);
  if (HIDWORD(v18))
  {
    v10 = v17;
    v11 = 8 * HIDWORD(v18);
    do
    {
      v14 = *(_DWORD **)v10;
      *(_QWORD *)v10 = 0;
      if (v14)
      {
        if (*v14 == 1)
        {
          v12 = (WTF *)MEMORY[0x1D82A3F20]();
          WTF::fastFree(v12, v13);
        }
        else
        {
          --*v14;
        }
      }
      v10 = (WTF *)((char *)v10 + 8);
      v11 -= 8;
    }
    while (v11);
  }
  v15 = v17;
  if (v17)
  {
    v17 = 0;
    LODWORD(v18) = 0;
    WTF::fastFree(v15, v8);
  }
  return v9;
}

- (int)capacity
{
  return *((_DWORD *)self->_private + 15);
}

- (void)setCapacity:(int)capacity
{
  if (self)
    self = (WebBackForwardList *)self->_private;
  BackForwardList::setCapacity((uint64_t)self, capacity);
}

- (id)description
{
  void *v3;
  WebBackForwardListPrivate *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  uint64_t v9;
  _DWORD *v10;
  int v11;
  WTF *v12;
  void *v13;
  const __CFString *v14;
  int v15;
  int v16;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 512);
  objc_msgSend(v3, "appendString:", CFSTR("\n--------------------------------------------\n"));
  objc_msgSend(v3, "appendString:", CFSTR("WebBackForwardList:\n"));
  v4 = self->_private;
  LODWORD(v5) = *((_DWORD *)v4 + 11);
  if ((_DWORD)v5)
  {
    v6 = 0;
    do
    {
      v7 = *((_QWORD *)v4 + 4);
      v8 = *(_DWORD **)(v7 + 8 * v6);
      v9 = *((unsigned int *)v4 + 14);
      if ((_DWORD)v9 == -1)
      {
        v10 = 0;
      }
      else
      {
        if (v5 <= v9)
          goto LABEL_15;
        v10 = *(_DWORD **)(v7 + 8 * v9);
        v11 = (*v10)++;
        if (v11)
        {
          *v10 = v11;
        }
        else
        {
          v12 = (WTF *)MEMORY[0x1D82A3F20](v10);
          WTF::fastFree(v12, v13);
        }
      }
      if (v10 == v8)
        v14 = CFSTR(" >>>");
      else
        v14 = CFSTR("    ");
      objc_msgSend(v3, "appendString:", v14);
      objc_msgSend(v3, "appendFormat:", CFSTR("%2d) "), v6);
      v15 = objc_msgSend(v3, "length");
      if (v6 >= *((unsigned int *)v4 + 11))
      {
LABEL_15:
        __break(0xC471u);
        JUMPOUT(0x1D8038A48);
      }
      v16 = v15;
      objc_msgSend(v3, "appendString:", -[WebCore::HistoryItem description](kit(*(WebCore::HistoryItem **)(*((_QWORD *)v4 + 4) + 8 * v6)), "description"));
      objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("\n        "), 0, v16, objc_msgSend(v3, "length") - v16);
      objc_msgSend(v3, "appendString:", CFSTR("\n"));
      ++v6;
      v5 = *((unsigned int *)v4 + 11);
    }
    while (v6 < v5);
  }
  objc_msgSend(v3, "appendString:", CFSTR("\n--------------------------------------------\n"));
  return v3;
}

- (void)setPageCacheSize:(NSUInteger)size
{
  objc_msgSend(*((id *)self->_private + 3), "setUsesPageCache:", size != 0);
}

- (NSUInteger)pageCacheSize
{
  WebCore::BackForwardCache *v2;

  v2 = (WebCore::BackForwardCache *)objc_msgSend(*((id *)self->_private + 3), "usesPageCache");
  if ((_DWORD)v2)
    return *(unsigned int *)(WebCore::BackForwardCache::singleton(v2) + 24);
  else
    return 0;
}

- (int)backListCount
{
  return (*(uint64_t (**)(WebBackForwardListPrivate *))(*(_QWORD *)self->_private + 40))(self->_private);
}

- (int)forwardListCount
{
  return (*(uint64_t (**)(WebBackForwardListPrivate *))(*(_QWORD *)self->_private + 48))(self->_private);
}

- (WebHistoryItem)itemAtIndex:(int)index
{
  WebCore::HistoryItem *v3;
  WebCore::HistoryItem *v4;
  WebHistoryItem *v5;
  WebCore::HistoryItem *v6;
  WTF *v8;
  void *v9;
  WebCore::HistoryItem *v10;

  (*(void (**)(WebCore::HistoryItem **__return_ptr, WebBackForwardListPrivate *, _QWORD))(*(_QWORD *)self->_private + 32))(&v10, self->_private, *(_QWORD *)&index);
  v3 = kit(v10);
  v4 = v3;
  if (v3)
    CFRetain(v3);
  v5 = (id)CFMakeCollectable(v4);
  v6 = v10;
  v10 = 0;
  if (!v6)
    return v5;
  if (*(_DWORD *)v6 != 1)
  {
    --*(_DWORD *)v6;
    return v5;
  }
  v8 = (WTF *)MEMORY[0x1D82A3F20]();
  WTF::fastFree(v8, v9);
  return v5;
}

@end
