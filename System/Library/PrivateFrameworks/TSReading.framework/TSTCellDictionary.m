@implementation TSTCellDictionary

- (TSTCellDictionary)init
{
  TSTCellDictionary *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSTCellDictionary;
  v2 = -[TSTCellDictionary init](&v4, sel_init);
  if (v2)
  {
    v2->mDict = (TSUIntegerKeyDictionary *)objc_alloc_init(MEMORY[0x24BEB3C98]);
    pthread_rwlock_init(&v2->mDictRWLock, 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  pthread_rwlock_destroy(&self->mDictRWLock);
  v3.receiver = self;
  v3.super_class = (Class)TSTCellDictionary;
  -[TSTCellDictionary dealloc](&v3, sel_dealloc);
}

- (void)setCell:(id)a3 atCellID:(id)a4
{
  TSTCellDictionarySetCellAtCellID((uint64_t)self, *(_DWORD *)&a4, (uint64_t)a3);
}

- (id)cellAtCellID:(id)a3
{
  return TSTCellDictionaryCellAtCellID((uint64_t)self, *(_DWORD *)&a3);
}

- (void)removeAllCells
{
  _opaque_pthread_rwlock_t *p_mDictRWLock;

  p_mDictRWLock = &self->mDictRWLock;
  pthread_rwlock_wrlock(&self->mDictRWLock);
  -[TSUIntegerKeyDictionary removeAllObjects](self->mDict, "removeAllObjects");
  pthread_rwlock_unlock(p_mDictRWLock);
}

- (id)allCells
{
  unint64_t v2;
  TSTEphemeralCellMap *v4;
  void *v5;
  uint64_t v6;
  unint64_t i;
  int v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = -[TSTEphemeralCellMap initWithCapacity:]([TSTEphemeralCellMap alloc], "initWithCapacity:", 1);
  pthread_rwlock_rdlock(&self->mDictRWLock);
  v5 = (void *)-[TSUIntegerKeyDictionary keyEnumerator](self->mDict, "keyEnumerator");
  v6 = objc_msgSend(v5, "nextKey");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v6; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v5, "nextKey"))
    {
      if (HIDWORD(i))
      {
        v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTCellDictionary allCells]");
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellDictionary.m"), 63, CFSTR("Out-of-bounds type assignment was clamped to max"));
        v9 = -1;
      }
      else
      {
        v9 = i;
      }
      HIDWORD(v10) = v9;
      LODWORD(v10) = v9;
      v2 = v2 & 0xFFFFFFFF00000000 | (v10 >> 16) & 0xFFFFFF;
      -[TSTEphemeralCellMap addCell:andCellID:](v4, "addCell:andCellID:", -[TSUIntegerKeyDictionary objectForKey:](self->mDict, "objectForKey:", i), v2);
    }
  }
  pthread_rwlock_unlock(&self->mDictRWLock);
  return v4;
}

- (void)applyBlockToAllCells:(id)a3
{
  _opaque_pthread_rwlock_t *p_mDictRWLock;
  void *v6;
  uint64_t v7;
  uint64_t i;

  p_mDictRWLock = &self->mDictRWLock;
  pthread_rwlock_wrlock(&self->mDictRWLock);
  v6 = (void *)-[TSUIntegerKeyDictionary keyEnumerator](self->mDict, "keyEnumerator");
  v7 = objc_msgSend(v6, "nextKey");
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v7; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v6, "nextKey"))
      (*((void (**)(id, uint64_t))a3 + 2))(a3, -[TSUIntegerKeyDictionary objectForKey:](self->mDict, "objectForKey:", i));
  }
  pthread_rwlock_unlock(p_mDictRWLock);
}

@end
