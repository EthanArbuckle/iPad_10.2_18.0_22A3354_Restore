@implementation WebHistoryPrivate

+ (void)initialize
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "registerDefaults:", &unk_1E9D95BC0);
}

- (WebHistoryPrivate)init
{
  WebHistoryPrivate *v2;
  id v3;
  void *m_ptr;
  _QWORD *v5;
  void *v6;
  WTF *value;
  uint64_t v8;
  uint64_t v9;
  const void **v10;
  const void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WebHistoryPrivate;
  v2 = -[WebHistoryPrivate init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    m_ptr = v2->_entriesByURL.m_ptr;
    v2->_entriesByURL.m_ptr = v3;
    if (m_ptr)
      CFRelease(m_ptr);
    v5 = (_QWORD *)WTF::fastMalloc((WTF *)8);
    *v5 = 0;
    value = (WTF *)v2->_entriesByDate.__ptr_.__value_;
    v2->_entriesByDate.__ptr_.__value_ = v5;
    if (value)
    {
      v8 = *(_QWORD *)value;
      if (*(_QWORD *)value)
      {
        v9 = *(unsigned int *)(v8 - 4);
        if ((_DWORD)v9)
        {
          v10 = (const void **)(v8 + 8);
          do
          {
            if (*(v10 - 1) != (const void *)-1)
            {
              v11 = *v10;
              *v10 = 0;
              if (v11)
                CFRelease(v11);
            }
            v10 += 2;
            --v9;
          }
          while (v9);
        }
        WTF::fastFree((WTF *)(v8 - 16), v6);
      }
      WTF::fastFree(value, v6);
    }
  }
  return v2;
}

- (BOOL)findKey:(int64_t *)a3 forDay:(double)a4
{
  double v6;
  uint64_t v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int v17;
  uint64_t v18;
  BOOL result;
  int v20;
  double v21;
  id v22;

  v6 = *(double *)&beginningOfDay(double)::cachedBeginningOfDay;
  if (*(double *)&beginningOfDay(double)::cachedBeginningOfDay > a4
    || *(double *)&beginningOfDay(double)::cachedBeginningOfNextDay <= a4)
  {
    v8 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v21 = 0.0;
    v22 = 0;
    objc_msgSend(v9, "rangeOfUnit:startDate:interval:forDate:", 16, &v22, &v21, v8);
    objc_msgSend(v22, "timeIntervalSinceReferenceDate");
    v6 = v10;
    beginningOfDay(double)::cachedBeginningOfDay = *(_QWORD *)&v10;
    *(double *)&beginningOfDay(double)::cachedBeginningOfNextDay = v10 + v21;
  }
  v11 = (uint64_t)v6;
  *a3 = (uint64_t)v6;
  v12 = *(_QWORD *)self->_entriesByDate.__ptr_.__value_;
  if (!v12)
    return 0;
  v13 = *(_DWORD *)(v12 - 8);
  v14 = (~(v11 << 32) + v11) ^ ((unint64_t)(~(v11 << 32) + v11) >> 22);
  v15 = 9 * ((v14 + ~(v14 << 13)) ^ ((v14 + ~(v14 << 13)) >> 8));
  v16 = (v15 ^ (v15 >> 15)) + ~((v15 ^ (v15 >> 15)) << 27);
  v17 = v13 & ((v16 >> 31) ^ v16);
  v18 = *(_QWORD *)(v12 + 16 * v17);
  if (v18 == v11)
    return 1;
  v20 = 1;
  do
  {
    result = v18 != 0;
    if (!v18)
      break;
    v17 = (v17 + v20) & v13;
    v18 = *(_QWORD *)(v12 + 16 * v17);
    ++v20;
  }
  while (v18 != v11);
  return result;
}

- (void)insertItem:(id)a3 forDateKey:(int64_t)a4
{
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  unsigned int v17;
  uint64_t v18;
  double v19;
  double v20;
  unsigned int v21;
  double v22;

  v5 = *(_QWORD *)self->_entriesByDate.__ptr_.__value_;
  if (!v5)
  {
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  v6 = *(_DWORD *)(v5 - 8);
  v7 = (~(a4 << 32) + a4) ^ ((unint64_t)(~(a4 << 32) + a4) >> 22);
  v8 = 9 * ((v7 + ~(v7 << 13)) ^ ((v7 + ~(v7 << 13)) >> 8));
  v9 = (v8 ^ (v8 >> 15)) + ~((v8 ^ (v8 >> 15)) << 27);
  v10 = v6 & ((v9 >> 31) ^ v9);
  v11 = *(_QWORD *)(v5 + 16 * v10);
  if (v11 != a4)
  {
    v12 = 1;
    while (v11)
    {
      v10 = ((_DWORD)v10 + v12) & v6;
      v11 = *(_QWORD *)(v5 + 16 * v10);
      ++v12;
      if (v11 == a4)
        goto LABEL_6;
    }
    goto LABEL_8;
  }
LABEL_6:
  v13 = v5 + 16 * v10;
  v14 = *(void **)(v13 + 8);
  if (v14)
  {
    CFRetain(*(CFTypeRef *)(v13 + 8));
    CFRelease(v14);
  }
LABEL_9:
  objc_msgSend(a3, "lastVisitedTimeInterval");
  v16 = v15;
  v17 = objc_msgSend(v14, "count");
  if (v17)
  {
    objc_msgSend((id)objc_msgSend(v14, "objectAtIndex:", 0), "lastVisitedTimeInterval");
    v18 = 0;
    if (v19 >= v16)
    {
      objc_msgSend((id)objc_msgSend(v14, "objectAtIndex:", v17 - 1), "lastVisitedTimeInterval");
      if (v20 >= v16)
      {
        v18 = v17;
      }
      else
      {
        LODWORD(v18) = 0;
        do
        {
          v21 = v18 + ((v17 - v18) >> 1);
          objc_msgSend((id)objc_msgSend(v14, "objectAtIndex:", v21), "lastVisitedTimeInterval");
          if (v22 >= v16)
            v18 = v21 + 1;
          else
            v18 = v18;
          if (v22 < v16)
            v17 = v21;
        }
        while (v18 < v17);
      }
    }
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v14, "insertObject:atIndex:", a3, v18);
}

- (BOOL)removeItemFromDateCaches:(id)a3
{
  _BOOL4 v5;
  uint64_t v6;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  _QWORD *v14;
  void *v15;
  uint64_t *value;
  const void *v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  void *m_ptr;
  uint64_t v24;

  v24 = 0;
  objc_msgSend(a3, "lastVisitedTimeInterval");
  v5 = -[WebHistoryPrivate findKey:forDay:](self, "findKey:forDay:", &v24);
  if (v5)
  {
    v6 = *(_QWORD *)self->_entriesByDate.__ptr_.__value_;
    if (v6)
    {
      v7 = *(_DWORD *)(v6 - 8);
      v8 = (v24 + ~(v24 << 32)) ^ ((unint64_t)(v24 + ~(v24 << 32)) >> 22);
      v9 = 9 * ((v8 + ~(v8 << 13)) ^ ((v8 + ~(v8 << 13)) >> 8));
      v10 = (v9 ^ (v9 >> 15)) + ~((v9 ^ (v9 >> 15)) << 27);
      v11 = v7 & ((v10 >> 31) ^ v10);
      v12 = *(_QWORD *)(v6 + 16 * v11);
      if (v12 == v24)
      {
LABEL_7:
        v14 = (_QWORD *)(v6 + 16 * v11);
      }
      else
      {
        v13 = 1;
        while (v12)
        {
          v11 = ((_DWORD)v11 + v13) & v7;
          v12 = *(_QWORD *)(v6 + 16 * v11);
          ++v13;
          if (v12 == v24)
            goto LABEL_7;
        }
        v14 = (_QWORD *)(v6 + 16 * *(unsigned int *)(v6 - 4));
      }
    }
    else
    {
      v14 = 0;
    }
    v15 = (void *)v14[1];
    objc_msgSend(v15, "removeObjectIdenticalTo:", a3);
    if (!objc_msgSend(v15, "count"))
    {
      value = (uint64_t *)self->_entriesByDate.__ptr_.__value_;
      if (*value)
      {
        if ((_QWORD *)(*value + 16 * *(unsigned int *)(*value - 4)) == v14)
          goto LABEL_27;
      }
      else if (!v14)
      {
        goto LABEL_27;
      }
      v17 = (const void *)v14[1];
      *v14 = -1;
      v14[1] = 0;
      if (v17)
        CFRelease(v17);
      ++*(_DWORD *)(*value - 16);
      if (*value)
      {
        --*(_DWORD *)(*value - 12);
        v18 = *value;
        if (!*value)
        {
LABEL_27:
          m_ptr = self->_orderedLastVisitedDays.m_ptr;
          self->_orderedLastVisitedDays.m_ptr = 0;
          if (m_ptr)
            CFRelease(m_ptr);
          return v5;
        }
      }
      else
      {
        MEMORY[0xFFFFFFFFFFFFFFF4] = -1;
        v18 = *value;
        if (!*value)
          goto LABEL_27;
      }
      v19 = 6 * *(_DWORD *)(v18 - 12);
      v20 = *(_DWORD *)(v18 - 4);
      if (v19 < v20 && v20 >= 9)
        WTF::HashTable<unsigned long,WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>>,WTF::DefaultHash<unsigned long>,WTF::HashMap<unsigned long,WTF::RetainPtr<objc_object *>,WTF::DefaultHash<unsigned long>,WTF::HashTraits<unsigned long>,WTF::HashTraits<WTF::RetainPtr<objc_object *>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long>>::rehash(value, v20 >> 1);
      goto LABEL_27;
    }
  }
  return v5;
}

- (BOOL)removeItemForURLString:(id)a3
{
  uint64_t v5;
  void *v6;

  v5 = objc_msgSend(self->_entriesByURL.m_ptr, "objectForKey:");
  if (!v5)
    return v5 != 0;
  objc_msgSend(self->_entriesByURL.m_ptr, "removeObjectForKey:", a3);
  -[WebHistoryPrivate removeItemFromDateCaches:](self, "removeItemFromDateCaches:", v5);
  if (objc_msgSend(self->_entriesByURL.m_ptr, "count"))
    return v5 != 0;
  WebVisitedLinkStore::removeAllVisitedLinks(0, v6);
  return v5 != 0;
}

- (void)addItemToDateCaches:(id)a3
{
  const void *v5;
  uint64_t *value;
  uint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  int v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unsigned int v22;
  const void *v23;
  void *m_ptr;
  uint64_t v25;
  id v26;

  v25 = 0;
  v26 = a3;
  objc_msgSend(a3, "lastVisitedTimeInterval");
  if (-[WebHistoryPrivate findKey:forDay:](self, "findKey:forDay:", &v25))
  {
    -[WebHistoryPrivate insertItem:forDateKey:](self, "insertItem:forDateKey:", a3, v25);
    return;
  }
  v5 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v26, 1);
  value = (uint64_t *)self->_entriesByDate.__ptr_.__value_;
  v7 = *value;
  if (*value
    || (WTF::HashTable<unsigned long,WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>>,WTF::DefaultHash<unsigned long>,WTF::HashMap<unsigned long,WTF::RetainPtr<objc_object *>,WTF::DefaultHash<unsigned long>,WTF::HashTraits<unsigned long>,WTF::HashTraits<WTF::RetainPtr<objc_object *>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long>>::rehash((uint64_t *)self->_entriesByDate.__ptr_.__value_, 8u), (v7 = *value) != 0))
  {
    v8 = *(_DWORD *)(v7 - 8);
  }
  else
  {
    v8 = 0;
  }
  v9 = v25;
  v10 = (v25 + ~(v25 << 32)) ^ ((unint64_t)(v25 + ~(v25 << 32)) >> 22);
  v11 = 9 * ((v10 + ~(v10 << 13)) ^ ((v10 + ~(v10 << 13)) >> 8));
  v12 = (v11 ^ (v11 >> 15)) + ~((v11 ^ (v11 >> 15)) << 27);
  v13 = v8 & ((v12 >> 31) ^ v12);
  v14 = (_QWORD *)(v7 + 16 * v13);
  v15 = *v14;
  if (*v14)
  {
    v16 = 0;
    v17 = 1;
    while (v15 != v25)
    {
      if (v15 == -1)
        v16 = v14;
      v13 = (v13 + v17) & v8;
      v14 = (_QWORD *)(v7 + 16 * v13);
      v15 = *v14;
      ++v17;
      if (!*v14)
      {
        if (v16)
        {
          *v16 = 0;
          v16[1] = 0;
          --*(_DWORD *)(*value - 16);
          v14 = v16;
        }
        goto LABEL_15;
      }
    }
    if (v5)
      CFRetain(v5);
    v23 = (const void *)v14[1];
    v14[1] = v5;
    if (v23)
      CFRelease(v23);
    goto LABEL_34;
  }
LABEL_15:
  *v14 = v9;
  if (v5)
    CFRetain(v5);
  v18 = (const void *)v14[1];
  v14[1] = v5;
  if (v18)
    CFRelease(v18);
  if (*value)
  {
    ++*(_DWORD *)(*value - 12);
    v19 = *value;
    if (*value)
      goto LABEL_21;
  }
  else
  {
    MEMORY[0xFFFFFFFFFFFFFFF4] = 1;
    v19 = *value;
    if (*value)
    {
LABEL_21:
      v20 = (*(_DWORD *)(v19 - 16) + *(_DWORD *)(v19 - 12));
      v21 = *(unsigned int *)(v19 - 4);
      if (v21 <= 0x400)
        goto LABEL_22;
LABEL_31:
      if (v21 <= 2 * v20)
        goto LABEL_32;
      goto LABEL_34;
    }
  }
  v20 = *(unsigned int *)(v19 - 16);
  v21 = *(unsigned int *)(v19 - 4);
  if (v21 > 0x400)
    goto LABEL_31;
LABEL_22:
  if (3 * v21 <= 4 * v20)
  {
    if (!(_DWORD)v21)
    {
      v22 = 8;
LABEL_33:
      WTF::HashTable<unsigned long,WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>>,WTF::DefaultHash<unsigned long>,WTF::HashMap<unsigned long,WTF::RetainPtr<objc_object *>,WTF::DefaultHash<unsigned long>,WTF::HashTraits<unsigned long>,WTF::HashTraits<WTF::RetainPtr<objc_object *>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long>>::rehash(value, v22);
      goto LABEL_34;
    }
LABEL_32:
    v22 = (_DWORD)v21 << (6 * *(_DWORD *)(v19 - 12) >= (2 * v21));
    goto LABEL_33;
  }
LABEL_34:
  m_ptr = self->_orderedLastVisitedDays.m_ptr;
  self->_orderedLastVisitedDays.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  if (v5)
    CFRelease(v5);
}

- (id)visitedURL:(id)a3 withTitle:(id)a4
{
  uint64_t v6;
  const __CFString *v7;
  WebHistoryItem *v8;
  WebHistoryItem *v9;
  WebHistoryItem *v10;

  v6 = objc_msgSend(a3, "_web_originalDataAsString");
  if (v6)
    v7 = (const __CFString *)v6;
  else
    v7 = &stru_1E9D6EC48;
  v8 = (WebHistoryItem *)objc_msgSend(self->_entriesByURL.m_ptr, "objectForKey:", v7);
  if (v8)
  {
    v9 = v8;
    CFRetain(v8);
    -[WebHistoryPrivate removeItemFromDateCaches:](self, "removeItemFromDateCaches:", v9);
    -[WebHistoryItem _visitedWithTitle:](v9, "_visitedWithTitle:", a4);
  }
  else
  {
    v10 = [WebHistoryItem alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v9 = -[WebHistoryItem initWithURLString:title:lastVisitedTimeInterval:](v10, "initWithURLString:title:lastVisitedTimeInterval:", v7, a4);
    objc_msgSend(self->_entriesByURL.m_ptr, "setObject:forKey:", v9, v7);
  }
  -[WebHistoryPrivate addItemToDateCaches:](self, "addItemToDateCaches:", v9);
  return (id)(id)CFMakeCollectable(v9);
}

- (BOOL)addItem:(id)a3 discardDuplicate:(BOOL)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  v7 = objc_msgSend(a3, "URLString");
  v8 = (void *)objc_msgSend(self->_entriesByURL.m_ptr, "objectForKey:", v7);
  if (v8)
  {
    v9 = v8;
    CFRetain(v8);
    if (a4
      || (objc_msgSend(v9, "lastVisitedTimeInterval"), v11 = v10,
                                                       objc_msgSend(a3, "lastVisitedTimeInterval"),
                                                       v11 >= v12))
    {
      v13 = 0;
    }
    else
    {
      -[WebHistoryPrivate removeItemForURLString:](self, "removeItemForURLString:", v7);
      -[WebHistoryPrivate addItemToDateCaches:](self, "addItemToDateCaches:", a3);
      objc_msgSend(self->_entriesByURL.m_ptr, "setObject:forKey:", a3, v7);
      v13 = 1;
    }
    CFRelease(v9);
  }
  else
  {
    -[WebHistoryPrivate addItemToDateCaches:](self, "addItemToDateCaches:", a3);
    objc_msgSend(self->_entriesByURL.m_ptr, "setObject:forKey:", a3, v7);
    return 1;
  }
  return v13;
}

- (void)rebuildHistoryByDayIfNeeded:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  WTF *v12;
  uint64_t *value;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const void **v19;
  const void *v20;
  void *m_ptr;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  WTF *v31;
  uint64_t v32;
  const void *v33;
  WTF *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  WTF *v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)self->_entriesByDate.__ptr_.__value_;
  if (v5)
  {
    v6 = *(unsigned int *)(v5 - 4);
    v7 = v5 + 16 * v6;
    if (!*(_DWORD *)(v5 - 12))
    {
      v8 = v5 + 16 * v6;
      v7 = v8;
      goto LABEL_10;
    }
    v8 = *(_QWORD *)self->_entriesByDate.__ptr_.__value_;
    if ((_DWORD)v6)
    {
      v9 = 16 * v6;
      v8 = *(_QWORD *)self->_entriesByDate.__ptr_.__value_;
      while ((unint64_t)(*(_QWORD *)v8 + 1) <= 1)
      {
        v8 += 16;
        v9 -= 16;
        if (!v9)
        {
          v8 = v7;
          goto LABEL_10;
        }
      }
    }
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  if (!v5)
  {
    v10 = 0;
    v12 = 0;
    v39 = 0;
    v40 = 0;
    if (!v8)
      goto LABEL_16;
    goto LABEL_19;
  }
LABEL_10:
  v10 = v5 + 16 * *(unsigned int *)(v5 - 4);
  v39 = 0;
  v40 = 0;
  v11 = *(unsigned int *)(v5 - 12);
  if (!(_DWORD)v11)
  {
    v12 = 0;
    if (v10 == v8)
      goto LABEL_16;
LABEL_19:
    v15 = 0;
    do
    {
      v16 = *(_QWORD *)(v8 + 8);
      if (v16)
        CFRetain(*(CFTypeRef *)(v8 + 8));
      *((_QWORD *)v12 + v15) = v16;
      v17 = v8 + 16;
      v8 = v7;
      if (v17 != v7)
      {
        v8 = v17;
        while ((unint64_t)(*(_QWORD *)v8 + 1) <= 1)
        {
          v8 += 16;
          if (v8 == v7)
          {
            v8 = v7;
            break;
          }
        }
      }
      ++v15;
    }
    while (v8 != v10);
    HIDWORD(v40) = v15;
    value = (uint64_t *)self->_entriesByDate.__ptr_.__value_;
    v14 = *value;
    if (!*value)
      goto LABEL_36;
    goto LABEL_29;
  }
  if (v11 >> 29)
  {
    __break(0xC471u);
    return;
  }
  v12 = (WTF *)WTF::fastMalloc((WTF *)(8 * v11));
  LODWORD(v40) = v11;
  v39 = v12;
  if (v10 != v8)
    goto LABEL_19;
LABEL_16:
  value = (uint64_t *)self->_entriesByDate.__ptr_.__value_;
  v14 = *value;
  if (*value)
  {
LABEL_29:
    *value = 0;
    v18 = *(unsigned int *)(v14 - 4);
    if ((_DWORD)v18)
    {
      v19 = (const void **)(v14 + 8);
      do
      {
        if (*(v19 - 1) != (const void *)-1)
        {
          v20 = *v19;
          *v19 = 0;
          if (v20)
            CFRelease(v20);
        }
        v19 += 2;
        --v18;
      }
      while (v18);
    }
    WTF::fastFree((WTF *)(v14 - 16), (void *)a2);
  }
LABEL_36:
  m_ptr = self->_entriesByURL.m_ptr;
  self->_entriesByURL.m_ptr = 0;
  v22 = self->_orderedLastVisitedDays.m_ptr;
  self->_orderedLastVisitedDays.m_ptr = 0;
  if (v22)
    CFRelease(v22);
  v23 = objc_msgSend(m_ptr, "allValues");
  objc_msgSend(a3, "_sendNotification:entries:", WebHistoryAllItemsRemovedNotification, v23);
  if (m_ptr)
    CFRetain(m_ptr);
  v24 = self->_entriesByURL.m_ptr;
  self->_entriesByURL.m_ptr = m_ptr;
  if (v24)
    CFRelease(v24);
  if (HIDWORD(v40))
  {
    v25 = 0;
    do
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v26 = (void *)*((_QWORD *)v39 + v25);
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v36 != v28)
              objc_enumerationMutation(v26);
            -[WebHistoryPrivate addItemToDateCaches:](self, "addItemToDateCaches:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
          }
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        }
        while (v27);
      }
      ++v25;
    }
    while (v25 < HIDWORD(v40));
  }
  objc_msgSend(a3, "_sendNotification:entries:", WebHistoryItemsAddedNotification, v23);
  if (m_ptr)
    CFRelease(m_ptr);
  if (HIDWORD(v40))
  {
    v31 = v39;
    v32 = 8 * HIDWORD(v40);
    do
    {
      v33 = *(const void **)v31;
      *(_QWORD *)v31 = 0;
      if (v33)
        CFRelease(v33);
      v31 = (WTF *)((char *)v31 + 8);
      v32 -= 8;
    }
    while (v32);
  }
  v34 = v39;
  if (v39)
  {
    v39 = 0;
    LODWORD(v40) = 0;
    WTF::fastFree(v34, v30);
  }
}

- (BOOL)removeItem:(id)a3
{
  uint64_t v5;
  id v6;

  v5 = objc_msgSend(a3, "URLString");
  v6 = (id)objc_msgSend(self->_entriesByURL.m_ptr, "objectForKey:", v5);
  if (v6 != a3)
    return 0;
  -[WebHistoryPrivate removeItemForURLString:](self, "removeItemForURLString:", v5);
  return v6 == a3;
}

- (BOOL)removeItems:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    v6 = 0;
    do
      -[WebHistoryPrivate removeItem:](self, "removeItem:", objc_msgSend(a3, "objectAtIndex:", v6++));
    while (v5 != v6);
  }
  return v5 != 0;
}

- (BOOL)removeAllItems
{
  uint64_t *value;
  uint64_t v3;
  uint64_t v5;
  const void **v6;
  const void *v7;
  void *v9;
  void *m_ptr;

  value = (uint64_t *)self->_entriesByDate.__ptr_.__value_;
  v3 = *value;
  if (!*value || !*(_DWORD *)(v3 - 12))
    return 0;
  *value = 0;
  v5 = *(unsigned int *)(v3 - 4);
  if ((_DWORD)v5)
  {
    v6 = (const void **)(v3 + 8);
    do
    {
      if (*(v6 - 1) != (const void *)-1)
      {
        v7 = *v6;
        *v6 = 0;
        if (v7)
          CFRelease(v7);
      }
      v6 += 2;
      --v5;
    }
    while (v5);
  }
  WTF::fastFree((WTF *)(v3 - 16), (void *)a2);
  objc_msgSend(self->_entriesByURL.m_ptr, "removeAllObjects");
  m_ptr = self->_orderedLastVisitedDays.m_ptr;
  self->_orderedLastVisitedDays.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  WebVisitedLinkStore::removeAllVisitedLinks((WebVisitedLinkStore *)m_ptr, v9);
  return 1;
}

- (void)addItems:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(a3, "reverseObjectEnumerator");
  v5 = objc_msgSend(v4, "nextObject");
  if (v5)
  {
    v6 = v5;
    do
    {
      -[WebHistoryPrivate addItem:discardDuplicate:](self, "addItem:discardDuplicate:", v6, 0);
      v6 = objc_msgSend(v4, "nextObject");
    }
    while (v6);
  }
}

- (id)orderedLastVisitedDays
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *m_ptr;
  uint64_t v22;
  const void *v24;

  if (self->_orderedLastVisitedDays.m_ptr)
    return self->_orderedLastVisitedDays.m_ptr;
  v3 = *(_QWORD *)self->_entriesByDate.__ptr_.__value_;
  if (v3)
  {
    v4 = *(unsigned int *)(v3 - 12);
    if ((_DWORD)v4)
    {
      if (v4 >> 30)
      {
LABEL_48:
        __break(0xC471u);
        JUMPOUT(0x1D80AF324);
      }
      v5 = (void *)WTF::fastMalloc((WTF *)(4 * v4));
      v6 = *(_QWORD **)self->_entriesByDate.__ptr_.__value_;
      if (v6)
      {
        v7 = *((unsigned int *)v6 - 1);
        v8 = &v6[2 * v7];
        if (*((_DWORD *)v6 - 3))
        {
          if ((_DWORD)v7)
          {
            v9 = 16 * v7;
            while ((unint64_t)(*v6 + 1) <= 1)
            {
              v6 += 2;
              v9 -= 16;
              if (!v9)
              {
                v6 = v8;
                break;
              }
            }
          }
          if (v8 != v6)
          {
            v10 = 0;
            LODWORD(v11) = v4;
            do
            {
              if (v10 == (_DWORD)v11)
              {
                v12 = v11 + ((unint64_t)v11 >> 2);
                if (v12 >= 0x10)
                  v13 = v12 + 1;
                else
                  v13 = 16;
                if (v13 <= (unint64_t)v10 + 1)
                  v11 = v10 + 1;
                else
                  v11 = v13;
                if (v11 >> 30)
                  goto LABEL_48;
                v14 = (void *)WTF::fastMalloc((WTF *)(4 * v11));
                memcpy(v14, v5, 4 * v10);
                if (v5)
                {
                  if (v14 == v5)
                  {
                    LODWORD(v11) = 0;
                    v14 = 0;
                  }
                  WTF::fastFree((WTF *)v5, v15);
                }
                v5 = v14;
              }
              v17 = *v6;
              v16 = v6 + 2;
              *((_DWORD *)v5 + v10) = v17;
              v18 = v8;
              if (v16 != v8)
              {
                v18 = v16;
                while ((unint64_t)(*v18 + 1) <= 1)
                {
                  v18 += 2;
                  if (v18 == v8)
                  {
                    v18 = v8;
                    break;
                  }
                }
              }
              ++v10;
              v6 = v18;
            }
            while (v18 != v8);
            goto LABEL_38;
          }
        }
      }
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = 0;
LABEL_38:
  std::__sort<std::__less<int,int> &,int *>();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
  m_ptr = self->_orderedLastVisitedDays.m_ptr;
  self->_orderedLastVisitedDays.m_ptr = v20;
  if (m_ptr)
    CFRelease(m_ptr);
  v22 = v10 - 1;
  if ((int)(v10 - 1) >= 0)
  {
    do
    {
      v24 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34F8]), "initWithTimeIntervalSinceReferenceDate:", (double)*((int *)v5 + v22));
      objc_msgSend(self->_orderedLastVisitedDays.m_ptr, "addObject:", v24);
      if (v24)
        CFRelease(v24);
    }
    while (v22-- > 0);
    goto LABEL_46;
  }
  if (v5)
LABEL_46:
    WTF::fastFree((WTF *)v5, v19);
  return self->_orderedLastVisitedDays.m_ptr;
}

- (id)orderedItemsLastVisitedOnDay:(id)a3
{
  void *v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v15;

  v15 = 0;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v4 = 0;
  if (!-[WebHistoryPrivate findKey:forDay:](self, "findKey:forDay:", &v15))
    return v4;
  v5 = *(_QWORD *)self->_entriesByDate.__ptr_.__value_;
  if (v5)
  {
    v6 = *(_DWORD *)(v5 - 8);
    v7 = (v15 + ~(v15 << 32)) ^ ((unint64_t)(v15 + ~(v15 << 32)) >> 22);
    v8 = 9 * ((v7 + ~(v7 << 13)) ^ ((v7 + ~(v7 << 13)) >> 8));
    v9 = (v8 ^ (v8 >> 15)) + ~((v8 ^ (v8 >> 15)) << 27);
    v10 = v6 & ((v9 >> 31) ^ v9);
    v11 = *(_QWORD *)(v5 + 16 * v10);
    if (v11 != v15)
    {
      v12 = 1;
      while (v11)
      {
        v10 = ((_DWORD)v10 + v12) & v6;
        v11 = *(_QWORD *)(v5 + 16 * v10);
        ++v12;
        if (v11 == v15)
          goto LABEL_7;
      }
      return 0;
    }
LABEL_7:
    v13 = v5 + 16 * v10;
    v4 = *(void **)(v13 + 8);
    if (v4)
    {
      CFRetain(*(CFTypeRef *)(v13 + 8));
      CFRelease(v4);
    }
    return v4;
  }
  return 0;
}

- (id)itemForURLString:(id)a3
{
  return (id)objc_msgSend(self->_entriesByURL.m_ptr, "objectForKey:", a3);
}

- (BOOL)containsURL:(id)a3
{
  return -[WebHistoryPrivate itemForURLString:](self, "itemForURLString:", objc_msgSend(a3, "_web_originalDataAsString")) != 0;
}

- (id)itemForURL:(id)a3
{
  return -[WebHistoryPrivate itemForURLString:](self, "itemForURLString:", objc_msgSend(a3, "_web_originalDataAsString"));
}

- (id)allItems
{
  return (id)objc_msgSend(self->_entriesByURL.m_ptr, "allValues");
}

- (void)setHistoryAgeInDaysLimit:(int)a3
{
  self->ageInDaysLimitSet = 1;
  self->ageInDaysLimit = a3;
}

- (int)historyAgeInDaysLimit
{
  if (self->ageInDaysLimitSet)
    return self->ageInDaysLimit;
  else
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "integerForKey:", CFSTR("WebKitHistoryAgeInDaysLimit"));
}

- (void)setHistoryItemLimit:(int)a3
{
  self->itemLimitSet = 1;
  self->itemLimit = a3;
}

- (int)historyItemLimit
{
  if (self->itemLimitSet)
    return self->itemLimit;
  else
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "integerForKey:", CFSTR("WebKitHistoryItemLimit"));
}

- (id)ageLimitDate
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34F8], "calendarDate"), "dateByAddingYears:months:days:hours:minutes:seconds:", 0, 0, --[WebHistoryPrivate historyAgeInDaysLimit](self, "historyAgeInDaysLimit"), 0, 0, 0);
}

- (BOOL)loadHistoryGutsFromURL:(id)a3 savedItemsCount:(int *)a4 collectDiscardedItemsInto:(id)a5 error:(id *)a6
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  BOOL v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  double v24;
  _BOOL4 v25;
  int v26;
  uint64_t v27;
  int v29;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  *a4 = 0;
  if (objc_msgSend(a3, "isFileURL"))
  {
    v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", objc_msgSend(a3, "path"));
    v10 = (void *)v9;
    if (!v9)
      return v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_12;
LABEL_9:
    v9 = objc_msgSend(v10, "objectForKey:", CFSTR("WebHistoryFileVersion"));
    if (!v9)
      return v9;
    v12 = (void *)v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LOBYTE(v9) = 0;
      return v9;
    }
    if ((int)objc_msgSend(v12, "intValue") > 1)
      goto LABEL_12;
    v13 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("WebHistoryDates"));
    v29 = -[WebHistoryPrivate historyItemLimit](self, "historyItemLimit");
    objc_msgSend(-[WebHistoryPrivate ageLimitDate](self, "ageLimitDate"), "timeIntervalSinceReferenceDate");
    v15 = v14;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (!v16)
      goto LABEL_34;
    v17 = 0;
    v18 = 0;
    v19 = *(_QWORD *)v33;
LABEL_17:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v19)
        objc_enumerationMutation(v13);
      v21 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v20);
      v22 = (void *)MEMORY[0x1D82A8E64]();
      v23 = -[WebHistoryItem initFromDictionaryRepresentation:]([WebHistoryItem alloc], "initFromDictionaryRepresentation:", v21);
      if (objc_msgSend(v23, "URLString"))
      {
        if (v17)
        {
          v17 = 1;
        }
        else
        {
          objc_msgSend(v23, "lastVisitedTimeInterval");
          v17 = v24 <= v15;
          if (v24 > v15 && !v18)
          {
            v25 = -[WebHistoryPrivate addItem:discardDuplicate:](self, "addItem:discardDuplicate:", v23, 1);
            v26 = *a4;
            if (v25)
              *a4 = ++v26;
            v17 = 0;
            v18 = v26 == v29;
            if (!v23)
              goto LABEL_27;
LABEL_26:
            CFRelease(v23);
            goto LABEL_27;
          }
        }
        objc_msgSend(a5, "addObject:", v23);
      }
      if (v23)
        goto LABEL_26;
LABEL_27:
      objc_autoreleasePoolPop(v22);
      if (v16 == ++v20)
      {
        v27 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        v16 = v27;
        if (!v27)
        {
LABEL_34:
          LOBYTE(v9) = 1;
          return v9;
        }
        goto LABEL_17;
      }
    }
  }
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C92C58], "sendSynchronousRequest:returningResponse:error:", objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", a3), 0, a6);
  if (objc_msgSend(v11, "length"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v11, 0, 0, 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_9;
  }
  else
  {
    v10 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_9;
  }
LABEL_12:
  LOBYTE(v9) = 0;
  return v9;
}

- (BOOL)loadFromURL:(id)a3 collectDiscardedItemsInto:(id)a4 error:(id *)a5
{
  int v6;

  v6 = 0;
  return -[WebHistoryPrivate loadHistoryGutsFromURL:savedItemsCount:collectDiscardedItemsInto:error:](self, "loadHistoryGutsFromURL:savedItemsCount:collectDiscardedItemsInto:error:", a3, &v6, a4, a5);
}

- (id)data
{
  _QWORD *value;
  uint64_t v3;
  WTF *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  WTF *v16;
  void *v17;
  _DWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  UInt8 *v22;
  CFDataRef v23;
  CFDataRef v24;
  char v25;
  StringImpl *v26;
  WTF *v27;
  _QWORD v29[7];
  UInt8 *bytes;
  CFIndex length;
  _QWORD **v32;
  WTF *v33;
  uint64_t v34;

  value = self->_entriesByDate.__ptr_.__value_;
  if (!*value || !*(_DWORD *)(*value - 12))
  {
    if (_MergedGlobals_17 == 1)
      return (id)qword_1ECEC98A0;
    v10 = objc_alloc_init(MEMORY[0x1E0C99D50]);
    qword_1ECEC98A0 = (uint64_t)v10;
    _MergedGlobals_17 = 1;
    return v10;
  }
  HistoryPropertyListWriter::HistoryPropertyListWriter((HistoryPropertyListWriter *)v29);
  v29[0] = &off_1E9D6DDE0;
  v32 = (_QWORD **)value;
  v33 = 0;
  v34 = 0;
  if (*value)
  {
    v3 = *(unsigned int *)(*value - 12);
    if ((_DWORD)v3)
    {
      if (v3 >> 30)
      {
LABEL_53:
        __break(0xC471u);
        JUMPOUT(0x1D80AFC70);
      }
      v4 = (WTF *)WTF::fastMalloc((WTF *)(4 * v3));
      LODWORD(v34) = v3;
      v33 = v4;
      v5 = *v32;
      if (*v32)
      {
        v6 = *((unsigned int *)v5 - 1);
        v7 = &v5[2 * v6];
        if (*((_DWORD *)v5 - 3))
        {
          if ((_DWORD)v6)
          {
            v8 = 16 * v6;
            while ((unint64_t)(*v5 + 1) <= 1)
            {
              v5 += 2;
              v8 -= 16;
              if (!v8)
              {
                v5 = v7;
                break;
              }
            }
          }
          v9 = HIDWORD(v34);
          if (v7 != v5)
          {
            do
            {
              v11 = v9;
              if (v9 == (_DWORD)v34)
              {
                v12 = v9 + 1;
                v13 = v11 + (v11 >> 2);
                if (v13 >= 0x10)
                  v14 = v13 + 1;
                else
                  v14 = 16;
                if (v14 <= v12)
                  v15 = v11 + 1;
                else
                  v15 = v14;
                if (v15 >> 30)
                  goto LABEL_53;
                v16 = (WTF *)WTF::fastMalloc((WTF *)(4 * v15));
                LODWORD(v34) = v15;
                v33 = v16;
                memcpy(v16, v4, 4 * v11);
                if (v4)
                {
                  if (v33 == v4)
                  {
                    v33 = 0;
                    LODWORD(v34) = 0;
                  }
                  WTF::fastFree(v4, v17);
                }
                v4 = v33;
                v18 = (_DWORD *)((char *)v33 + 4 * HIDWORD(v34));
              }
              else
              {
                v18 = (_DWORD *)((char *)v4 + 4 * v9);
              }
              v20 = *v5;
              v19 = v5 + 2;
              *v18 = v20;
              v9 = ++HIDWORD(v34);
              v21 = v7;
              if (v19 != v7)
              {
                v21 = v19;
                while ((unint64_t)(*v21 + 1) <= 1)
                {
                  v21 += 2;
                  if (v21 == v7)
                  {
                    v21 = v7;
                    break;
                  }
                }
              }
              v5 = v21;
            }
            while (v21 != v7);
          }
        }
      }
    }
  }
  std::__sort<std::__less<int,int> &,int *>();
  BinaryPropertyListWriter::writePropertyList((BinaryPropertyListWriter *)v29);
  v22 = bytes;
  if (!bytes)
    goto LABEL_45;
  bytes = 0;
  v23 = CFDataCreateWithBytesNoCopy(0, v22, length, 0);
  v24 = v23;
  if (!v23)
  {
    CFAllocatorDeallocate(0, v22);
LABEL_45:
    v24 = 0;
    v25 = 1;
    goto LABEL_46;
  }
  CFRetain(v23);
  v25 = 0;
LABEL_46:
  v10 = (id)CFMakeCollectable(v24);
  if ((v25 & 1) == 0)
    CFRelease(v24);
  v29[0] = &off_1E9D6DDE0;
  v27 = v33;
  if (v33)
  {
    v33 = 0;
    LODWORD(v34) = 0;
    WTF::fastFree(v27, v26);
  }
  HistoryPropertyListWriter::~HistoryPropertyListWriter((HistoryPropertyListWriter *)v29, v26);
  return v10;
}

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  return objc_msgSend(-[WebHistoryPrivate data](self, "data"), "writeToURL:options:error:", a3, 0, a4);
}

- (void)addVisitedLinksToVisitedLinkStore:(void *)a3
{
  void *m_ptr;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  m_ptr = self->_entriesByURL.m_ptr;
  v5 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(m_ptr);
        WebVisitedLinkStore::addVisitedLink((WTF *)a3, *(__CFString **)(*((_QWORD *)&v9 + 1) + 8 * i));
      }
      v6 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  void *m_ptr;
  WTF *value;
  uint64_t v5;
  uint64_t v6;
  const void **v7;
  const void *v8;
  void *v9;

  m_ptr = self->_orderedLastVisitedDays.m_ptr;
  self->_orderedLastVisitedDays.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  value = (WTF *)self->_entriesByDate.__ptr_.__value_;
  self->_entriesByDate.__ptr_.__value_ = 0;
  if (value)
  {
    v5 = *(_QWORD *)value;
    if (*(_QWORD *)value)
    {
      v6 = *(unsigned int *)(v5 - 4);
      if ((_DWORD)v6)
      {
        v7 = (const void **)(v5 + 8);
        do
        {
          if (*(v7 - 1) != (const void *)-1)
          {
            v8 = *v7;
            *v7 = 0;
            if (v8)
              CFRelease(v8);
          }
          v7 += 2;
          --v6;
        }
        while (v6);
      }
      WTF::fastFree((WTF *)(v5 - 16), (void *)a2);
    }
    WTF::fastFree(value, (void *)a2);
  }
  v9 = self->_entriesByURL.m_ptr;
  self->_entriesByURL.m_ptr = 0;
  if (v9)
    CFRelease(v9);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
