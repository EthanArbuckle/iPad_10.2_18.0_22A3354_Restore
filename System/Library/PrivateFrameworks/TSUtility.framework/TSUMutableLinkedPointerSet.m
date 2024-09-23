@implementation TSUMutableLinkedPointerSet

- (TSUMutableLinkedPointerSet)init
{
  TSUMutableLinkedPointerSet *v2;
  CFMutableDictionaryRef Mutable;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSUMutableLinkedPointerSet;
  v2 = -[TSUMutableLinkedPointerSet init](&v5, sel_init);
  if (v2)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x24BDBD6B0]);
    v2->mHead = 0;
    v2->mTail = 0;
    v2->mDictionary = Mutable;
  }
  return v2;
}

- (void)dealloc
{
  __CFDictionary *mDictionary;
  objc_super v4;

  mDictionary = self->mDictionary;
  if (mDictionary)
    CFRelease(mDictionary);
  v4.receiver = self;
  v4.super_class = (Class)TSUMutableLinkedPointerSet;
  -[TSUMutableLinkedPointerSet dealloc](&v4, sel_dealloc);
}

- (id)objectEnumerator
{
  return -[TSULinkedPointerSetEnumerator initWithFirstEntry:]([TSULinkedPointerSetEnumerator alloc], "initWithFirstEntry:", self->mHead);
}

- (id)reverseObjectEnumerator
{
  return -[TSULinkedPointerSetReverseEnumerator initWithLastEntry:]([TSULinkedPointerSetReverseEnumerator alloc], "initWithLastEntry:", self->mTail);
}

- (id)objectEnumeratorAfterObject:(id)a3
{
  id result;

  result = (id)CFDictionaryGetValue(self->mDictionary, a3);
  if (result)
    return -[TSULinkedPointerSetEnumerator initWithFirstEntry:]([TSULinkedPointerSetEnumerator alloc], "initWithFirstEntry:", *((_QWORD *)result + 3));
  return result;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  TSULinkedPointerSetEntry **p_mHead;
  TSULinkedPointerSetEntry *v7;
  unint64_t result;
  BOOL v9;
  BOOL v10;

  var0 = a3->var0;
  p_mHead = &self->mHead;
  if (a3->var0)
    p_mHead = (TSULinkedPointerSetEntry **)(a3->var0 + 24);
  v7 = *p_mHead;
  result = 0;
  if (v7)
    v9 = a5 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    do
    {
      var0 = (unint64_t)v7;
      a4[result++] = v7->mObject;
      v7 = v7->mNext;
      if (v7)
        v10 = result >= a5;
      else
        v10 = 1;
    }
    while (!v10);
  }
  a3->var0 = var0;
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&a3->var2;
  return result;
}

- (id)firstObject
{
  TSULinkedPointerSetEntry *mHead;

  mHead = self->mHead;
  if (mHead)
    return mHead->mObject;
  else
    return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  TSULinkedPointerSetEntry *mHead;
  id mObject;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = *((_QWORD *)a3 + 2);
      mHead = self->mHead;
      if (!mHead)
      {
LABEL_10:
        LOBYTE(v6) = v7 == 0;
        return v6;
      }
      while (v7)
      {
        mObject = mHead->mObject;
        if (mObject != *(id *)(v7 + 8))
        {
          v6 = objc_msgSend(mObject, "isEqual:");
          if (!v6)
            return v6;
        }
        v7 = *(_QWORD *)(v7 + 24);
        mHead = mHead->mNext;
        if (!mHead)
          goto LABEL_10;
      }
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)containsObject:(id)a3
{
  return CFDictionaryContainsKey(self->mDictionary, a3) != 0;
}

- (BOOL)hasObjects
{
  return self->mHead != 0;
}

- (void)addObject:(id)a3
{
  TSULinkedPointerSetEntry *v5;
  TSULinkedPointerSetEntry *mTail;
  TSULinkedPointerSetEntry **p_mNext;
  TSULinkedPointerSetEntry *v8;

  if (!CFDictionaryContainsKey(self->mDictionary, a3))
  {
    v5 = -[TSULinkedPointerSetEntry initWithObject:previousEntry:]([TSULinkedPointerSetEntry alloc], "initWithObject:previousEntry:", a3, self->mTail);
    v8 = v5;
    mTail = self->mTail;
    if (mTail)
      p_mNext = &mTail->mNext;
    else
      p_mNext = &self->mHead;
    *p_mNext = v5;
    self->mTail = v5;
    CFDictionarySetValue(self->mDictionary, a3, v5);

  }
}

- (void)insertFirstObject:(id)a3
{
  TSULinkedPointerSetEntry *v5;
  TSULinkedPointerSetEntry *mHead;
  TSUMutableLinkedPointerSet *v7;
  TSULinkedPointerSetEntry *v8;
  TSULinkedPointerSetEntry *v9;

  -[TSUMutableLinkedPointerSet removeObject:](self, "removeObject:");
  v5 = -[TSULinkedPointerSetEntry initWithObject:previousEntry:]([TSULinkedPointerSetEntry alloc], "initWithObject:previousEntry:", a3, 0);
  mHead = self->mHead;
  v7 = self;
  v8 = v5;
  if (mHead)
  {
    mHead->mPrevious = v5;
    v8 = self->mHead;
    v7 = (TSUMutableLinkedPointerSet *)v5;
  }
  v7->mTail = v8;
  self->mHead = v5;
  v9 = v5;
  CFDictionarySetValue(self->mDictionary, a3, v5);

}

- (void)removeObject:(id)a3
{
  TSULinkedPointerSetEntry *Value;
  TSULinkedPointerSetEntry *mPrevious;
  TSULinkedPointerSetEntry *mNext;

  Value = (TSULinkedPointerSetEntry *)CFDictionaryGetValue(self->mDictionary, a3);
  if (Value)
  {
    if (Value == self->mHead)
      self->mHead = Value->mNext;
    if (Value == self->mTail)
      self->mTail = Value->mPrevious;
    mPrevious = Value->mPrevious;
    if (mPrevious)
      mPrevious->mNext = Value->mNext;
    mNext = Value->mNext;
    if (mNext)
      mNext->mPrevious = Value->mPrevious;
    CFDictionaryRemoveValue(self->mDictionary, a3);
  }
}

- (void)removeAllObjects
{
  self->mHead = 0;
  self->mTail = 0;
  CFDictionaryRemoveAllValues(self->mDictionary);
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->mDictionary);
}

- (id)array
{
  CFIndex Count;
  id result;
  id v5;
  void *v6;

  Count = CFDictionaryGetCount(self->mDictionary);
  result = malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (result)
  {
    v5 = result;
    CFDictionaryGetKeysAndValues(self->mDictionary, (const void **)result, 0);
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, Count);
    free(v5);
    return v6;
  }
  return result;
}

@end
