@implementation TSWPTrackedDeletion

- (TSWPTrackedDeletion)initWithRange:(_NSRange)a3 changeSession:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  TSWPTrackedDeletion *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  length = a3.length;
  location = a3.location;
  v11.receiver = self;
  v11.super_class = (Class)TSWPTrackedDeletion;
  v7 = -[TSWPTrackedDeletion init](&v11, sel_init);
  if (v7)
  {
    if (!length)
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTrackedDeletion initWithRange:changeSession:]");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTrackedDeletion.mm"), 30, CFSTR("Can't track a deletion over an empty range"));
    }
    v7->_range.location = location;
    v7->_range.length = length;
    v7->_changeSession = (TSWPChangeSession *)a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPTrackedDeletion;
  -[TSWPTrackedDeletion dealloc](&v3, sel_dealloc);
}

- (void)performWithStorage:(id)a3 delta:(int64_t)a4 undoTransaction:(void *)a5 replaceBlock:(id)a6
{
  NSUInteger location;
  NSUInteger length;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t i;
  TSWPAttributeArray *v16;
  NSUInteger v17;
  unint64_t j;
  objc_object *v19;
  NSRange v20;
  unint64_t Object;
  TSWPAttributeArray *v22[2];
  TSWPAttributeArray *v23;
  unint64_t v24;
  _NSRange v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  __n128 (*v30)(__n128 *, __n128 *);
  void (*v31)(uint64_t);
  void *v32;
  void *__p;
  void *v34;
  uint64_t v35;
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  __n128 (*v40)(__n128 *, __n128 *);
  void (*v41)(uint64_t);
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSRange v46;
  NSRange v47;

  location = self->_range.location;
  if (a4)
  {
    location += a4;
    self->_range.location = location;
  }
  length = self->_range.length;
  v37 = 0;
  v38 = &v37;
  v39 = 0x4812000000;
  v40 = __Block_byref_object_copy__22;
  v41 = __Block_byref_object_dispose__22;
  v42 = &unk_217C8B239;
  v43 = 0;
  v11 = MEMORY[0x24BDAC760];
  v44 = 0;
  v45 = 0;
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __77__TSWPTrackedDeletion_performWithStorage_delta_undoTransaction_replaceBlock___block_invoke;
  v36[3] = &unk_24D82DD68;
  v36[4] = &v37;
  objc_msgSend(a3, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 7, location, length, v36);
  v13 = (_QWORD *)v38[6];
  v12 = (_QWORD *)v38[7];
  while (v13 != v12)
  {
    objc_msgSend(a3, "removeSmartField:fromRange:undoTransaction:", *v13, v13[1], v13[2], a5);
    v12 = (_QWORD *)v38[7];
    v13 += 3;
  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x4812000000;
  v30 = __Block_byref_object_copy__22;
  v31 = __Block_byref_object_dispose__22;
  v32 = &unk_217C8B239;
  __p = 0;
  v34 = 0;
  v35 = 0;
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __77__TSWPTrackedDeletion_performWithStorage_delta_undoTransaction_replaceBlock___block_invoke_2;
  v26[3] = &unk_24D82DD68;
  v26[4] = &v27;
  objc_msgSend(a3, "enumerateWithAttributeKind:inRange:usingBlock:", 14, location, length, v26);
  v14 = v28;
  for (i = v28[6]; i != v14[7]; i += 24)
  {
    objc_msgSend(a3, "setDictationAndAutocorrection:forCharRange:undoTransaction:", 0, *(_QWORD *)(i + 8), *(_QWORD *)(i + 16), a5);
    v14 = v28;
  }
  v16 = (TSWPAttributeArray *)objc_msgSend(a3, "deletionChangesTable");
  if (v16)
  {
    objc_msgSend(a3, "range");
    v25.location = NSExpandedRange();
    v25.length = v17;
    TSWPAttributeArray::begin(v16, &v25, &v23);
    TSWPAttributeArray::end(v16, &v25, v22);
    for (j = v24; (TSWPAttributeArray *)j != v22[1]; j = ++v24)
    {
      if (objc_msgSend(*((id *)v23->var4 + 2 * j + 1), "canMergeWithKind:session:", 2, self->_changeSession))
      {
        v19 = (objc_object *)*((id *)v23->var4 + 2 * v24 + 1);
        v46.location = TSWPAttributeArray::rangeForAttributeIndex(v23, v24);
        v47.location = location;
        v47.length = length;
        v20 = NSUnionRange(v46, v47);
        location = v20.location;
        length = v20.length;
        if (!v19)
          break;
        if (a5)
        {
          Object = TSWPAttributeArray::findObject(v16, v19, 0);
          TSWPStorageTransaction::appendToTransaction((uint64_t *)a5, 10, 16, Object, (NSDate *)-[objc_object date](v19, "date"));
        }
        -[objc_object setDate:](v19, "setDate:", objc_msgSend(MEMORY[0x24BDBCE60], "date"));
        -[objc_object trackedTextDidChange](v19, "trackedTextDidChange");
        goto LABEL_19;
      }
    }
  }
  v19 = -[TSWPChange initWithContext:kind:session:]([TSWPChange alloc], "initWithContext:kind:session:", objc_msgSend(a3, "context"), 2, self->_changeSession);
LABEL_19:
  objc_msgSend(a3, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", v19, location, length, 16, 0, a5);

  _Block_object_dispose(&v27, 8);
  if (__p)
  {
    v34 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(&v37, 8);
  if (v43)
  {
    v44 = v43;
    operator delete(v43);
  }
}

void __77__TSWPTrackedDeletion_performWithStorage_delta_undoTransaction_replaceBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  __int128 v21;

  v7 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v8 = (_QWORD *)v7[7];
  v9 = v7[8];
  if ((unint64_t)v8 >= v9)
  {
    v11 = v7[6];
    v12 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v8 - v11) >> 3);
    v13 = v12 + 1;
    if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
      abort();
    v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - v11) >> 3);
    if (2 * v14 > v13)
      v13 = 2 * v14;
    if (v14 >= 0x555555555555555)
      v15 = 0xAAAAAAAAAAAAAAALL;
    else
      v15 = v13;
    if (v15)
      v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>((uint64_t)(v7 + 8), v15);
    else
      v16 = 0;
    v17 = &v16[24 * v12];
    v18 = &v16[24 * v15];
    *(_QWORD *)v17 = a2;
    *((_QWORD *)v17 + 1) = a3;
    *((_QWORD *)v17 + 2) = a4;
    v10 = v17 + 24;
    v20 = (char *)v7[6];
    v19 = (char *)v7[7];
    if (v19 != v20)
    {
      do
      {
        v21 = *(_OWORD *)(v19 - 24);
        *((_QWORD *)v17 - 1) = *((_QWORD *)v19 - 1);
        *(_OWORD *)(v17 - 24) = v21;
        v17 -= 24;
        v19 -= 24;
      }
      while (v19 != v20);
      v19 = (char *)v7[6];
    }
    v7[6] = v17;
    v7[7] = v10;
    v7[8] = v18;
    if (v19)
      operator delete(v19);
  }
  else
  {
    *v8 = a2;
    v8[1] = a3;
    v10 = v8 + 3;
    v8[2] = a4;
  }
  v7[7] = v10;
}

void __77__TSWPTrackedDeletion_performWithStorage_delta_undoTransaction_replaceBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  __int128 v21;

  if (a2)
  {
    v7 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v8 = (_QWORD *)v7[7];
    v9 = v7[8];
    if ((unint64_t)v8 >= v9)
    {
      v11 = v7[6];
      v12 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v8 - v11) >> 3);
      v13 = v12 + 1;
      if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
        abort();
      v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - v11) >> 3);
      if (2 * v14 > v13)
        v13 = 2 * v14;
      if (v14 >= 0x555555555555555)
        v15 = 0xAAAAAAAAAAAAAAALL;
      else
        v15 = v13;
      if (v15)
        v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>((uint64_t)(v7 + 8), v15);
      else
        v16 = 0;
      v17 = &v16[24 * v12];
      v18 = &v16[24 * v15];
      *(_QWORD *)v17 = a2;
      *((_QWORD *)v17 + 1) = a3;
      *((_QWORD *)v17 + 2) = a4;
      v10 = v17 + 24;
      v20 = (char *)v7[6];
      v19 = (char *)v7[7];
      if (v19 != v20)
      {
        do
        {
          v21 = *(_OWORD *)(v19 - 24);
          *((_QWORD *)v17 - 1) = *((_QWORD *)v19 - 1);
          *(_OWORD *)(v17 - 24) = v21;
          v17 -= 24;
          v19 -= 24;
        }
        while (v19 != v20);
        v19 = (char *)v7[6];
      }
      v7[6] = v17;
      v7[7] = v10;
      v7[8] = v18;
      if (v19)
        operator delete(v19);
    }
    else
    {
      *v8 = a2;
      v8[1] = a3;
      v10 = v8 + 3;
      v8[2] = a4;
    }
    v7[7] = v10;
  }
}

- (unint64_t)targetCharIndex
{
  return self->_range.location;
}

- (int64_t)delta
{
  return 0;
}

- (_NSRange)insertedRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = self->_range.length + self->_range.location;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

@end
